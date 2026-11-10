Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A0606A331
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hzplVja6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+LcqDtg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VtQv+uie
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fT0B9Gghw5Tst2DHPSNe5mu8LeUkm1XBgZSvgjVMEZI=; b=hzplVja67L07fe
	v5ay3kAuvPbNJEFDiYZRkMFTa/ZyPwYyTDfScbu+S7CC6RvVO17xavfJFLgxElOAwapHQB3KB7Cdw
	bmbEiQE6CgCS6d5G5eyfs8CKefSy3Msj8AAbBC2mERRfHUNqwXAEXloYXRYk1pGxn6sNZy1XEkG65
	FQrmwm/GOL1bxNzNgrLA0B1Wpp9ObzDGznx9LylwIa0LAgU2KpumNALcUoZOf0xQEmn9ExA7XYDOF
	b8lMNivY4OwZtti72YY47MnrCZXh9KlFY3Cod2MKd3v4Rp3XejRMj8J8Tt7CR4WNmh3n9BPC4Wagf
	+YKudjt84Y5ZUUqDnVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXH-00000002fqz-0j5Z;
	Tue, 10 Nov 2026 06:40:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXE-00000002foo-3gTF
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA54wIZ2414656
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fT0B9Gghw5Tst2DHPSNe5mu8LeUkm1XBgZSvgjVMEZI=; b=e+LcqDtgeDj/TsZx
	+BAR025LsFWkOTHZ9kzmAk4/7Ynr3Qv9IQeAxOB/bFz3i8zZlkNHo/NTZ11CxqJy
	bSWT/wPrNevikLfb1ZfmJNbOWhZk2/Ra+iZBCZktMuSSAjo4LrLbSUyTr/g8l7+0
	ZTJdSWcfHqUqqjcrPSLDw9/Zq8GOJ423w37J1MlsE2g2/is2jd9aBF+K4hgFFKZB
	l16b2KsbR1jqrf/fX6YnfLEmnJWviOqFWbUf2FmydFyNwkAu51O1RNLTc3Sgbsog
	qCJg4m+Z6t9A9NKL/FL08s4kcBwEZuAWazC8WNBt01WKkwY9420xkbgUNnCOoI4+
	mDrKvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd8cb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso1309223a91.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292847; x=1794897647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fT0B9Gghw5Tst2DHPSNe5mu8LeUkm1XBgZSvgjVMEZI=;
        b=VtQv+uiezEX5XHNpSVPbAtR2ab2og2nJS090doOCfoODYNAVPA2q0rl4gCifJiE3y6
         aIlqAI8BQ1ev+SWodQRzcl/5GCxbtBri+Ym5O5tVuzy4ePK0dbTXV0mnInf/riGVJHi5
         zXAL/PqF34ISsYe3c5M1ijUU/BmD4wbmi/7I22BQ1LMNHLImI3mE0qtAzke5YKGYMJ3Z
         ESd5kDD0X/hyioNY+AQwH7uPdhRZRvog6tmhMHfj+tsa+XGDBZmfbitlCPIEDxpTOKIU
         Q+L62BL7OQmP1MxiyIl7+VN1yg4eOGOulsegg1wSR9V9la5gg+SNh30Qt1DvVbtnz7ur
         tWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292847; x=1794897647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fT0B9Gghw5Tst2DHPSNe5mu8LeUkm1XBgZSvgjVMEZI=;
        b=sZ2s3m3YVJjeKRiaTeWDrZgjU0EhDsX3zBO9wnGgNWeCAlwgdm25GjGeonnKPJeYXV
         prXyrdv4JubxhQrUO+8kyUHGhlSQ+IQUDESjkI/r0V5tVwu6rTOlEWsLBXMynkCfq2Ot
         +lyzz7ivhpNkuoBHIwZysHMC89o+HIa/ysxlF3KyOCrn8iMeBIyIssMKi7qoP3i7twB+
         DQn0V4xyiMZBxxSUatqyYa1v0hnF4ID+YdTFMrYVJPt6s+7Rn+QX7mgkw5IL9THGNy4K
         iiyGtiz44juCL5XXn0URjFSZ/IY5Wb/WOs8TLj/CsJtjeWyDkCvfelK0SyBmBFbjwctx
         RsHQ==
X-Forwarded-Encrypted: i=1; AL+hErGLap4WVfN5Ieqnm6FGeXgKUGsna56lhDpvHQc+CN4gVUcIQyt1aqhFUm1JOI9y+9wjt4ZgXj4=@lists.infradead.org
X-Gm-Message-State: APuU4Z/keMnIid9vbNmCVbsaFLHbBrl7mGJvv0evLU+PgeTNeNfnvoXV
	Hn+MY9tCes7owYURvDZBNp6joSmfz9QmobQ8bAorZnKNt922riDGOzp4EKhJxHNFiaTW60pHvhf
	W6tQVQ+2Dy0O1bnuJsPhUABFmX5gLOVY1uDC9jb88vPuVrZeCE3xivFnvdbKpv68eUZLyLZo9
X-Gm-Gg: AYBFou0yl4gOYfKjCVvNCYXqld/QUh1tCieNkBJRiiQ7uRJDJHUxwLdu834Y5Amq/Km
	DVomygF8XCq/jWLhsuIg+dccJaDoqYi9M5HGtNMLfBJZzi+SQQAytY4v7pZish8YO15k4KxqVWO
	Y6fhPM2k6zKRjjSjYHs22xCh0mDXtCyOYW9XvGinyns6q3S4a9+xDCEN12xqkWCiFAL76CEXAWw
	H5N65z/gKx4qw8mK9z9w8hcZhdjOWrgkKdUwB4txcR1Gp8hjn4pIyisK0GVvgGozNfAsxooJIA/
	JZB7LD7J7UP8tyvB9MCnbzxLQ9SP6y7XqqMcmVrfOv09ama9TPHzWa5H3E7WMTEuoDWOLFrA5kI
	lvSZUqj0BbI2YameabXNpvNAbMptIABXDmJT2Betlrh4h0P34p4OMFSSdS0wTlHE1Dej5q3X7Yf
	WGMWxHmChCM0I98NuPlx1rx64Z50Q02Q==
X-Received: by 2002:a17:90a:ec83:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b1678cf05fmr1092545a91.8.1794292846633;
        Mon, 09 Nov 2026 22:40:46 -0800 (PST)
X-Received: by 2002:a17:90a:ec83:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b1678cf05fmr1092528a91.8.1794292846035;
        Mon, 09 Nov 2026 22:40:46 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:45 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:26 +0800
Subject: [PATCH ath-next v5 05/11] wifi: ath12k: rename
 ath12k_skb_rxcb::hw_link_id to drv_link_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-5-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 2kyOU_mB4nRF2E7HgpQs1z4ti-Cosx_N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXzlXhp+vXPX9a
 C01Iq2WpP3uQNS8Jf6GaZHOziSwdMfhLWAeFiakiP+MO7hQHUjMjA7adK3d2ukf1rL7J/BysRFN
 CY4YlCnWlEvu8DmKlr3QVh+MxNHy/DQ=
X-Proofpoint-ORIG-GUID: 2kyOU_mB4nRF2E7HgpQs1z4ti-Cosx_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX6wBeqC2F6gGb
 nY7FoAmsvlb66OpY5OTTg/NWqh9aMLcqOUdqsP7mtEsMs2dExnBkb+R3GUt0PIKO8GSW7MYdN7Q
 J/kSkuOF+beiqtrv+FiDXNiciKIta1YsEXqtLVOP7dssWBy0MEReFkW91W/+LvkypeUeeng9QUv
 N8mZ9wnWcPHSsIE0M/5twzHOkmqLBxq/9iKPo+DQEzXYkcJ5ZczpDHQC/biM2a+PM42QUdaA/DZ
 v0lWpVtFDKkQflYs70mNphufK+cFvBNxSJmFRUr/r/ieRUYHxFOiLq6w7QV56JpyaBY8StYNqX3
 amWc+Ql+uAXvpsG9U7kghSQtWZQ3f8n/HfgzuPIQyJz5XXpAbjjbAaF48l8mzg8rXn/JABSQfS5
 DAe0mLHJj7iLA60pp0I/oCbnnexI6WNgQmfBN3KyCjA49QEQ5EvkaAAOT0U8RMmKOJDkrqPq/ui
 dEcNCYYm5VAvbLkAGBw==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2bc6f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NxgKQpyHIDudPh6FZjkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224049_038285_9E9413A5 
X-CRM114-Status: GOOD (  14.83  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hw_link_id field of ath12k_skb_rxcb holds the driver link id of the
RX frame. This is the hw_link_id for QCN9274, but for WCN7850/QCC2072 it
is the logical_link_id instead. The hw_link_id name is therefore
misleading for the latter.

Rename it to drv_link_id to reflect that it is the driver link id
regardless of how the underlying value is derived. No functional change
intended.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h        |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 212b4855a7d8..fcb26a6878a1 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -143,7 +143,7 @@ struct ath12k_skb_rxcb {
 	struct hal_rx_desc *rx_desc;
 	u8 err_rel_src;
 	u8 err_code;
-	u8 hw_link_id;
+	u8 drv_link_id;
 	u8 unmapped;
 	u8 is_frag;
 	u8 tid;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 2a0141157426..a59adbb78c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -621,7 +621,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 
 	while ((msdu = __skb_dequeue(msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->hw_link_id;
+		hw_link_id = rxcb->drv_link_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp,
 						    hw_links[hw_link_id].device_id);
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
@@ -776,7 +776,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 					RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
 		rxcb->is_continuation = !!(le32_to_cpu(msdu_info->info0) &
 					   RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
-		rxcb->hw_link_id = hw_link_id;
+		rxcb->drv_link_id = hw_link_id;
 		rxcb->peer_id = ath12k_wifi7_dp_rx_get_peer_id(dp, dp->peer_metadata_ver,
 							       mpdu_info->peer_meta_data);
 		rxcb->tid = le32_get_bits(mpdu_info->info0,
@@ -2063,7 +2063,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 			skb_queue_walk(&scatter_msdu_list, msdu) {
 				rxcb = ATH12K_SKB_RXCB(msdu);
-				rxcb->hw_link_id = hw_link_id;
+				rxcb->drv_link_id = hw_link_id;
 			}
 
 			skb_queue_splice_tail_init(&scatter_msdu_list,
@@ -2071,7 +2071,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		rxcb->hw_link_id = hw_link_id;
+		rxcb->drv_link_id = hw_link_id;
 		__skb_queue_tail(&msdu_list, msdu);
 	}
 
@@ -2102,7 +2102,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	rcu_read_lock();
 	while ((msdu = __skb_dequeue(&msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->hw_link_id;
+		hw_link_id = rxcb->drv_link_id;
 
 		device_id = hw_links[hw_link_id].device_id;
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
@@ -2368,7 +2368,7 @@ ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
 				       struct ath12k_skb_rxcb *rxcb,
 				       struct ieee80211_rx_status *status)
 {
-	return dp_peer->link_id_map[rxcb->hw_link_id];
+	return dp_peer->link_id_map[rxcb->drv_link_id];
 }
 
 int

-- 
2.25.1


