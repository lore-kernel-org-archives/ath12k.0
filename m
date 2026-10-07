Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B65CA5FFF
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfH7JOcpjrJI7edYv859MWGoxNpJwE5LbQPeiejX188=; b=JQLz/J0zpKRK0TfINoCDGzFGnO
	Exk546A2F7PdgfSMl6PpD7LluC6J+OO5CbrJQrez7wnnIZbUR1utieuICUek1QqFiNM4s+Yqxwyb+
	Y+R4sp9jBnglrANW6c/BKU6hwOVZcXZTgynWnrv/X9K9x5wIs6Oh3JIPlrrFF372o+gwhoDNt2xDi
	89wMyBDUvKeQ5UPmbTPpkwKcZwlxY26jWygPGS7f4QeWSgn/N7OsyMdrK98mH0d5eLRsQTorgvuyA
	yYYlshmx75KgLZr9Cd2UuXIlNcp5vbBPSpdccfDPniFBrjsrsoUfTg3c8OhxWH8JdwPYuotCnbSTx
	Ab5LTV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENsX-0000000231Y-2QCR;
	Wed, 07 Oct 2026 09:24:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENsT-0000000230U-1h9x
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 09:23:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgNV2969764
	for <ath12k@lists.infradead.org>; Wed, 7 Oct 2026 09:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfH7JOcpjrJI7edYv859MWGoxNpJwE5LbQPeiejX188=; b=dL+TY5DMr94OyHV1
	zFtpHaewGEBY5fmV0lDs5JmKK+Y6M0QgFFPSsZLlhYD3jTa1NW5ZSCpCXh8cyBQV
	jJnt5hFYcopZfUQ+Pm7W3XRh+mqLWIHXXM5DhWx1d0+WwcJj0nBoVzJuq4IuCUSq
	wkgEa+Vb8jG7jMf6Z69pQk4P+Crsb7Y/YeM4FlMuCNF/IBNrwxj1oSYcDo137r+3
	S5mo4ZoSGerUV0RrvPlaK84C45IZkhNP2Bm7XOab3SCDBc3nwwFxnOwZhUxJj0gP
	eyzxQeRhY0Xk9yX8vt64WLlA8axwYVDAtowXnXcf6uZcLvg1dGuEGpmV8gfqVMrf
	XEyXHQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679eg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 09:23:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a46301d92so3175639b3a.3
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365035; x=1791969835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfH7JOcpjrJI7edYv859MWGoxNpJwE5LbQPeiejX188=;
        b=Kz4TDcFiQi9noL3LtWgINNIEzm/fPkBrCp5mhe4XNnjCSIR5sxtBWvIfCx1kNAPY/T
         AYExrxvstRjnQwokM8Y9nRXy/YAd5BzpyzK4LAdlooD75FQEW0Dcl2oQ7cPgju4LmCSW
         T0i0cdzd6vD+zIjueSyfC41lJiep/CLdx8DTI4HTXUWlkPfoyClYM7Aj2jot4aYNdcm3
         RzQ6xbXXAeaQen4HkOoiG0aiK3dknzatbSrJf+0WPCVRXrzzuluR1SylxDZObMPRmLrb
         rwS8A2keUDiSazxKY+KP5dNVhOMjDMDYZJtqqynb4ElBif6BHFXSrCImMia2JgQKroR/
         YB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365035; x=1791969835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfH7JOcpjrJI7edYv859MWGoxNpJwE5LbQPeiejX188=;
        b=saxXL7Gg4qGc8edzjDvSSoAytWkD6UUG8iNdPs0Nlrrghm2eNjVX0Ghg6rEclabsLY
         Ls7bFWM2EleogIjLa2BjKXTpbdWaADAV9198MuqlLhSZFo1yUPjuSwumuzayGTFRWoP4
         035efKuWLUC+fQg5GhYbAU1Q+UxRz2N6HE6CTlQG4dM6JPto+oXLXYTEtIgVBK8RW5Im
         rQ+ERQpmU1gx6aX3Y7z9BITXtA5scsxuv8Jrnvyo8XKmSAjleeYi5GX9lQID4As7z6XV
         cSkP0Khu7mLkG10YCsjotojyZwGcao+0FnQy3wVHK0SCBGE8ypITyq61bRTtkl6LcAzz
         MJIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPofBZ0t2fDlJg3SBxkWoa57yIxvBGH9g/u9Wxwqj3l1kKGJ4UXfPOWolAAWxKnWKtC+gr8Gk=@lists.infradead.org
X-Gm-Message-State: AFuF++ltH7trt8dQUcYyIFd4X6toQ8swirz/3m0osO/m2f95ux1ESY+i
	UgYnMn2s+5y7gZA5LBjEUrrPz/sddubHdTE9dzI4Si4bHy778MB8kRt0ndOzyxxxMw9CHEfp+9t
	rv8dvbTTq8ctgIAC3zUMWHPTbVsjqrFgzZfMMM6zbkaq2qsYVsvrF5wlZKAHe3Flblrbk05kf
X-Gm-Gg: AYBFou29misJAuK5KCNfHy0l+QfoJvN0ZrbmyXrKNcyAriUoP2/ZWLrXwoVih6SqjM2
	EiRHP5siAYqNWrAr6pAXcDj635MZHq7vAx4A/fp66Xp0k+ecRAwNuNXtw6U6fzWj8lLwCi3yQo1
	BU+PZUccNgYedUcEFAHLnYOv1LFc0nd/jkpUWqoRshaGNRPcXSk3bshUH9o8Mm+1nzlKUjrs+Tt
	77jOyJ71Ze1btm0isP1BE9G86Ms2dS0x0A9ip31Bo5PqPKUUjNEzkIYs7hTcSmzzgehQU00u3Jf
	Niydwjce2h1h/SMNi03s+xvytxs8d7kNWznRCYpcXr/B/oTsFMtzI0QMSrfhzykmmFoNvgVCWuF
	trPW5RLbya7Sw+TgEYs2PiAu5uKwFwe8HerfjXHcctZY4vHp7TDa2oA5tTq6HfjXN0QH7u1znUx
	CwEqoy/i3zyJwemj+9dcqzD84=
X-Received: by 2002:a05:6a00:950a:b0:881:4b47:f30b with SMTP id d2e1a72fcca58-891b354d5d4mr1318716b3a.12.1791365035396;
        Wed, 07 Oct 2026 02:23:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:950a:b0:881:4b47:f30b with SMTP id d2e1a72fcca58-891b354d5d4mr1318696b3a.12.1791365034890;
        Wed, 07 Oct 2026 02:23:54 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89271257af8sm119128b3a.41.2026.10.07.02.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:23:54 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 14:53:32 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: Make RXDMA buffer ring size
 configurable per memory profile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-mpp_ws-v1-1-739b1fb87d24@oss.qualcomm.com>
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
In-Reply-To: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX+I2CZfa4ARbI
 +AyvNPbakJI8hfa3P1xyCV7pGiRLT5iUWtYd0pEE5AgKzf3nGURX4x8/DWDvq3B11IiLYiJh/sq
 7AYWNfvX3F8LzT3CwHYdXwbhDchhq5I=
X-Proofpoint-ORIG-GUID: 8eTsdKCuNAavnIfXvGvglmXGIoy7Kmum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX4V5Xo5dPgT06
 y8bMMZLKeNe1YGav0tqSPrwDtDnnKhtSV1Bp5ioUWfB89GKqfPmwDqG4fZJ+kzLwe7A4IgRC7up
 txmtdQfgwQzC+6Rkpi8Xza/kn+g3UILvvh9v+xiiQpaiEUqKOeqyrrS/R3EbdiQtNODx4NqvEQN
 t3C0EcU78uavnr67qEWcgdJ500gMz02cOyloaoefQ8GkNlInVGymcgNRFrWGHXn9tjUCd0Ecrla
 DrV8tuOeu4EP5mGAnh5VffVVNBIP1D8iWaZ/KqwFBfKz7MVaP1K3LOeAq+mfsMhnDM/Qzb08xPx
 9CfR1lEw6LMQiGcEYbcB/R872pUBVvE0cnKpHAP0ouHCrS5MemYxhjKYQQ6cYajNWJyjR1o7/Hn
 Kv1Wr3BAyoGIb0iHybMLz8bNt8Xcb8PuT/ED5oDb162bToKRC76oroh4IpVZlE/C32S9dV8f9HK
 FnAk6gchTQ926NcrCTw==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60fac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mg1aV8qigFYmQh57PbIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 8eTsdKCuNAavnIfXvGvglmXGIoy7Kmum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_022357_570060_F3783D62 
X-CRM114-Status: GOOD (  14.94  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently, the RXDMA buffer ring size is hardcoded to 4096 and shared
across all memory profiles. This prevents individual profiles from tuning
the ring size based on their memory and performance requirements.

Add the RXDMA buffer ring size to the memory profile configuration and
implement ath12k_dp_rxdma_buf_ring_size() static inline function to
access the configured value. This allows different memory profiles to
select an appropriate ring size based on available system resources.

The function follows the pattern established in the previous patch for
other DP profile parameters, taking struct ath12k_dp_profile_params
pointer as argument.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c  | 2 ++
 drivers/net/wireless/ath/ath12k/dp.h    | 8 +++++++-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index e527b59ecba5..764e646d0090 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -54,6 +54,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
 			.rx_release_ring_size = 16384,
+			.rxdma_buf_ring_size = 4096,
 		},
 	},
 [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {
@@ -68,6 +69,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 16384,
 			.rx_desc_count = 6144,
 			.rx_release_ring_size = 8192,
+			.rxdma_buf_ring_size = 4096,
 		},
 	},
 };
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index c53eac20b989..108e27dd5797 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -31,6 +31,7 @@ struct ath12k_dp_profile_params {
 	u32 num_pool_tx_desc;
 	u32 rx_desc_count;
 	u32 rx_release_ring_size;
+	u32 rxdma_buf_ring_size;
 };
 
 #define DP_MON_PURGE_TIMEOUT_MS     100
@@ -210,7 +211,6 @@ struct ath12k_pdev_dp {
 #define DP_REO_EXCEPTION_RING_SIZE	128
 #define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
-#define DP_RXDMA_BUF_RING_SIZE		4096
 #define DP_RX_MAC_BUF_RING_SIZE		4096
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
@@ -730,6 +730,12 @@ ath12k_dp_rx_release_ring_size(const struct ath12k_dp_profile_params *p)
 	return p->rx_release_ring_size;
 }
 
+static inline u32
+ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
+{
+	return p->rxdma_buf_ring_size;
+}
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index cfaf26ae2720..36be543b7c50 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1699,7 +1699,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 	ret = ath12k_dp_srng_setup(ab,
 				   &dp->rx_refill_buf_ring.refill_buf_ring,
 				   HAL_RXDMA_BUF, 0, 0,
-				   DP_RXDMA_BUF_RING_SIZE);
+				   ath12k_dp_rxdma_buf_ring_size(dp_params));
 	if (ret) {
 		ath12k_warn(ab, "failed to setup rx_refill_buf_ring\n");
 		return ret;

-- 
2.34.1


