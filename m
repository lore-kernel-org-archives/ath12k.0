Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8A606A330
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K1ZiMZbB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J/9gZcea;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5vCB9+c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uTcOoWnylX/ILFxbpv8uKlKm82qLVbB4b0uO/f2W5Ao=; b=K1ZiMZbBH1ihIz
	rQiNkdk/Mw3IKXHAsL2GTziCbwv6MA72KNnFlfUYa4E3rLMIjcu6+xEEPVAlwtxPUBN07pByumHrE
	hzcV3WtD3Wz0c7Rgyj5b69VwKi35mCJ2CIPFxJRySDCY3HgpXGFRDpX+8scmkD6IF/cU2TDMzp7UQ
	gL86qc99Z/VN/ewzXewktCNhu+x5khiYuE00v58SaPOfzlnBsuwrWT4rKzBuc4JXaFkSro2jK9TRV
	mol52C1uDx5zm57e4xzD9qZwo3Hf9jzlVPKl0yTpeXRyCC/8GmcPL4sww72Qre35wpS+Ayzw4wwJB
	stXZ71VqpXUXxfZeVcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlhH-0000000Ff8v-2jeV;
	Mon, 02 Nov 2026 06:39:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlhC-0000000Ff0F-2WiJ
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:39:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vfj02716183
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTcOoWnylX/ILFxbpv8uKlKm82qLVbB4b0uO/f2W5Ao=; b=J/9gZceayItMolnt
	Xdb9PuFUqm/a4j58vyRrPRbNfskv+j/EGPGWvqKnRzprAp/ZRNGW8elnQGByLN3W
	rmg5aEt/xVCryFV9lvqVqw8eD/k5sVh87zJ4Hif/LAsKuU67cc5p2/rT++A2qeHA
	5pMm0yUf1aPrkKhelTdR6ha20IxcoG4IL0pmn6ZK230HJjHMFdx6Z5twWWDBkytm
	Ix6waoyD27QN/RvHNUlBXCtf88lFJLKSlspfAbD7HeFmF+8vI+PMemi00Z4lgUKP
	njQ8bs4kdFnnVW3DmUGkL3JTrUk2q/0a947XlnOU5ki38NBr7VUxs3IaxGqpJC+U
	gYEt2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2wgqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:39:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so2455095a91.3
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601545; x=1794206345; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTcOoWnylX/ILFxbpv8uKlKm82qLVbB4b0uO/f2W5Ao=;
        b=f5vCB9+cVxohAfn3d336+/A0ue9qW/qgXTXRQwbG21ZgCt601KTn4zldt2/vPDm2+0
         5J+LrSMuw4LLsJ9YrwFjsaRAStNsUCsTebvY6M4uhDCHEtmj+hc9LCUXCEzA8NJ1OIGt
         imFsvZ807D3h+5oGV4np8w0fOPuEt7IQJWL1Sph966G13syMTZJ8DokXykKT9vzkpAp/
         OiIlgPX4FF2s0hJajQVdYf9M9ZS0eN9mQV8BT8eUWHq7x7YdCR2TY/uPHXwVSRzrJuMv
         Eq0TttIleZzPersNU1ibwIfwVs+/mMOGI0L4fjjxMMVWhOfYzSh/e01A/TXXmuFK008F
         oa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601545; x=1794206345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTcOoWnylX/ILFxbpv8uKlKm82qLVbB4b0uO/f2W5Ao=;
        b=qaUrWXKkIqdl7Fvp0ufuibr6+Jrsww7vn09ISkyr3J3dY111mYmBKeBLf1vSav/wPg
         xM30lLtup4+GHpACqLCRGMOz+Rs4KSPDwRTUtB/nGw0AkipG5eU0QEcrj01o4chVmgZB
         OXMnybRu6z+YbC/isjPY3AJXaNHtuWdCFTUdo7XXgoJXvc+OJpXEXOjyCG9GWZdhdzNn
         mH9UamhMl1nprrEY+trXUP64LGK/FHvoefGbxt8XlNT3nuUR8A3gacaRD4gR6I6VAf87
         4GpIo6MEV6VpHfZJP0lMhrTh9OZnBacK+I/nUsurDIRi/qq0t8HunKClriEV3hBWi15S
         Ispg==
X-Forwarded-Encrypted: i=1; AKwUvBxzOCwGewZZvq0AJAusfTPdvsmQ8ceD7z75F341aesn/QddZcS1SCSis4UT6jdIpkqcBzpvsBQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8JU5iFB4JtOIM4EKobzMTmubU7GlCEh8UDHuflKqOySi8c0FK7
	16hED8az/uJcBDc87BhLOnC+xrhCGwuaxcx4FfchYkzQFMUd5deXnrPtdAsXuSuN+aGC43Tjs+m
	WTY7iaLU6hxgiVMPHlRdkuWuoiZ2rwgSh7hhQPenvZQPw0Ttojyit8hAFwkJcncpy
X-Gm-Gg: AYBFou1AosWt6UsOujj/KVaFq3SKzYjMi4EVhxpBIkoL2WO+04Z4wYXvMU82NvZ+aN9
	ATw+qUyEEWYcyI6xhFpkNVXDyaRyvvDbbGWT07wfQ833HmYZR6HmHHf6H8KvqT4cA9/Ndi7Qsff
	AToQgMVj0YCHIsI/jvw2gJ/6jgpZoC96DWwSrYvLLfzMa34UBuPJTCubMjKkqswpOIbF+AT8Eg0
	csem2ceZbtmXb/LONfbsXXLCB8xAPX8tMM0xQ/1ZJxQEtHTgYENclnCYxwNKAwpaqsK/N95uMkc
	/BIeipBA5wegkyPP2rUkHBDjsMxvm0KftNowTi4Kr33lBi76NdEjOLJbTDkyourCra7DGJx6ygt
	rBzEHLm/fDRM1KObEyOVQ42vpcbXGbsjBtc7h9cNM6GEH20G6870E8pbM7wF9oDHWAE7ckDk+4N
	aaXpPrki4bB7h3M6JpWqJh4TuIvrDd
X-Received: by 2002:a17:90a:ec8d:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae897ae130mr6989303a91.45.1793601545277;
        Sun, 01 Nov 2026 22:39:05 -0800 (PST)
X-Received: by 2002:a17:90a:ec8d:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae897ae130mr6989294a91.45.1793601544639;
        Sun, 01 Nov 2026 22:39:04 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:39:04 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:19 +0800
Subject: [PATCH ath-next v4 10/11] wifi: ath12k: derive WBM RX drv_link_id
 per device via HAL ops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-10-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Kb7caUFbKCGQ97d-5Y3HVpMJRmQ8QzNa
X-Proofpoint-ORIG-GUID: Kb7caUFbKCGQ97d-5Y3HVpMJRmQ8QzNa
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae8300a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yDf83h2jVu8ggHpUoVYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX62ZBYj6JhpTy
 bj+M6Q8cXmM754HYuPIqjb3AdvYVleJzYKcObJ/oFza57pJczuqKSK0/4VeaDAdlzEgt1GSiY73
 FzlT7kFvt1bJtTZGPCoYtMZzKc4s8g4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX1Kre74Q/d1tD
 HudM7LzjKc/ng9I16VCFvvjNzDEnkfBvUMun9DTjGDdwT9zR1ictobuqfPNrh+7imXHNMnDq6Rr
 xxQwOQRL/KqOQ0DNWI//b9yItINwz3cDvFItN2NXn50+neMNjTVRMHQMPKZ1aOItiHY7Re5dwWd
 E+kzKazdlMUpHuEWLl2rndD+KMqhYQl3FuYgWNH3iyxYKgd7belJNWuVlDk5w2TnuHWjGALh6wi
 Bs9QAruO/rMBUGzzNLKqg3Xc9iJKplbPQSAh9GpLGy+8r+mvxGOzXRkrDLNw4YFHIGHxNR3YnQA
 EAIZp87Ya1ffQwR/hY6K/W2TBw+BFlYGdF+WwOgwnanmXkZbXXyccwbjgJTn3cjJe3NSi4wy0vr
 sW9NeEM2P8hrAnmw1URzaRaGTQnzg1uFZH4xSidJqvrU5ZrTBGkzsLd3fLSTEYQVEj5cWP3/hJE
 cnVwchSejECOMx6MvYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223906_694586_6CEDEADA 
X-CRM114-Status: GOOD (  16.14  )
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

The WBM error path also stores a driver link id in
ath12k_skb_rxcb::drv_link_id, previously derived from the source link id
via rx_desc_get_msdu_src_link_id(). Like the REO path, the source of
this id differs per device.

Add a HAL op rx_msdu_desc_get_drv_link_id() to let each device provide its
own driver link id on the WBM error path. For QCN9274 keep the existing
behavior; for WCN7850/QCC2072 extract the logical link id from the peer
metadata via ath12k_wifi7_dp_rx_get_logical_link_id().

This replaces the old rx_desc_get_msdu_src_link_id op, which had no
other user and is removed along with its per-device implementations.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.h            | 15 +++++++++------
 drivers/net/wireless/ath/ath12k/hal.h              |  4 +++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 22 +++++++++++-----------
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |  7 +------
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  7 +++++--
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 -
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  8 +++++---
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |  4 +++-
 8 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index fcad6a7ad6ba..a78efa1d9569 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -164,12 +164,6 @@ static inline void ath12k_dp_rx_desc_get_crypto_header(struct ath12k_hal *hal,
 	hal->ops->rx_desc_get_crypto_header(desc, crypto_hdr, enctype);
 }
 
-static inline u8 ath12k_dp_rx_get_msdu_src_link(struct ath12k_hal *hal,
-						struct hal_rx_desc *desc)
-{
-	return hal->ops->rx_desc_get_msdu_src_link_id(desc);
-}
-
 static inline u8
 ath12k_dp_rx_reo_get_drv_link_id(struct ath12k_dp *dp,
 				 struct hal_reo_dest_ring *reo_desc)
@@ -177,6 +171,15 @@ ath12k_dp_rx_reo_get_drv_link_id(struct ath12k_dp *dp,
 	return dp->hal->ops->rx_reo_desc_get_drv_link_id(dp, reo_desc);
 }
 
+static inline u8
+ath12k_dp_rx_wbm_get_drv_link_id(struct ath12k_dp *dp,
+				 struct hal_rx_desc *rx_desc,
+				 __le32 peer_metadata)
+{
+	return dp->hal->ops->rx_msdu_desc_get_drv_link_id(dp, rx_desc,
+							  peer_metadata);
+}
+
 static inline void ath12k_dp_clean_up_skb_list(struct sk_buff_head *skb_list)
 {
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index c8bb63d92bfd..343e1636b4cc 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1378,9 +1378,11 @@ struct hal_ops {
 					  enum hal_encrypt_type enctype);
 	void (*rx_desc_copy_end_tlv)(struct hal_rx_desc *fdesc,
 				     struct hal_rx_desc *ldesc);
-	u8 (*rx_desc_get_msdu_src_link_id)(struct hal_rx_desc *desc);
 	u8 (*rx_reo_desc_get_drv_link_id)(struct ath12k_dp *dp,
 					  struct hal_reo_dest_ring *reo_desc);
+	u8 (*rx_msdu_desc_get_drv_link_id)(struct ath12k_dp *dp,
+					   struct hal_rx_desc *rx_desc,
+					   __le32 peer_metadata);
 	void (*extract_rx_desc_data)(struct hal_rx_desc_data *rx_desc_data,
 				     struct hal_rx_desc *rx_desc,
 				     struct hal_rx_desc *ldesc);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 312c7ac74b3b..4132578085cc 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1961,7 +1961,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	struct ath12k_rx_desc_info *desc_info;
 	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
-	u8 hw_link_id, device_id;
+	u8 drv_link_id, device_id;
 	int ret, pdev_idx;
 	struct hal_rx_desc *msdu_data;
 
@@ -2057,9 +2057,9 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 			continue;
 		}
 
-		hw_link_id = ath12k_dp_rx_get_msdu_src_link(partner_dp->hal,
-							    msdu_data);
-		if (hw_link_id >= ATH12K_GROUP_MAX_RADIO) {
+		drv_link_id = ath12k_dp_rx_wbm_get_drv_link_id(partner_dp, msdu_data,
+							       err_info.peer_metadata);
+		if (drv_link_id >= ATH12K_GROUP_MAX_RADIO) {
 			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
 							    WBM_ERR_DROP_INV_HW_ID);
 
@@ -2075,7 +2075,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 			skb_queue_walk(&scatter_msdu_list, msdu) {
 				rxcb = ATH12K_SKB_RXCB(msdu);
-				rxcb->drv_link_id = hw_link_id;
+				rxcb->drv_link_id = drv_link_id;
 			}
 
 			skb_queue_splice_tail_init(&scatter_msdu_list,
@@ -2083,7 +2083,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		rxcb->drv_link_id = hw_link_id;
+		rxcb->drv_link_id = drv_link_id;
 		__skb_queue_tail(&msdu_list, msdu);
 	}
 
@@ -2114,21 +2114,21 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 	rcu_read_lock();
 	while ((msdu = __skb_dequeue(&msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
-		hw_link_id = rxcb->drv_link_id;
+		drv_link_id = rxcb->drv_link_id;
 
-		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, drv_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
 			ath12k_dbg(ab, ATH12K_DBG_DATA,
-				   "Unable to process WBM error msdu due to invalid hw link id %d device id %d\n",
-				   hw_link_id, device_id);
+				   "Unable to process WBM error msdu due to invalid drv link id %d device id %d\n",
+				   drv_link_id, device_id);
 			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
 							    WBM_ERR_DROP_NULL_PROC_DP);
 			continue;
 		}
 
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
-						       hw_links[hw_link_id].pdev_idx);
+						       hw_links[drv_link_id].pdev_idx);
 
 		dp_pdev = ath12k_dp_to_pdev_dp(partner_dp, pdev_idx);
 		if (!dp_pdev) {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index edf122fd46b5..bad2b60409d9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -173,11 +173,6 @@ static void ath12k_hal_rx_desc_copy_end_tlv_qcc2072(struct hal_rx_desc *fdesc,
 	       sizeof(struct rx_msdu_end_qcn9274));
 }
 
-static u8 ath12k_hal_rx_desc_get_msdu_src_link_qcc2072(struct hal_rx_desc *desc)
-{
-	return 0;
-}
-
 static u8 ath12k_hal_rx_desc_get_l3_pad_bytes_qcc2072(struct hal_rx_desc *desc)
 {
 	return le16_get_bits(desc->u.qcc2072.msdu_end.info5,
@@ -471,8 +466,8 @@ const struct hal_ops hal_qcc2072_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcc2072,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcc2072,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcc2072,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcc2072,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcc2072,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcc2072,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_qcc2072,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 7bcde08f0d76..a5be431046d9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -807,7 +807,10 @@ u32 ath12k_hal_get_rx_desc_size_qcn9274(void)
 	return sizeof(struct hal_rx_desc_qcn9274_compact);
 }
 
-u8 ath12k_hal_rx_desc_get_msdu_src_link_qcn9274(struct hal_rx_desc *desc)
+static u8
+ath12k_hal_rx_msdu_desc_get_drv_link_id_qcn9274(struct ath12k_dp *dp,
+						struct hal_rx_desc *desc,
+						__le32 peer_metadata)
 {
 	return le64_get_bits(desc->u.qcn9274_compact.msdu_end.msdu_end_tag,
 			     RX_MSDU_END_64_TLV_SRC_LINK_ID);
@@ -1121,8 +1124,8 @@ const struct hal_ops hal_qcn9274_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcn9274,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_qcn9274,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_qcn9274,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcn9274,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_qcn9274,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_qcn9274,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcn9274,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274,
 	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
index 03cf3792d523..c5d1e431d015 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
@@ -32,7 +32,6 @@ u8 *ath12k_hal_rx_desc_get_msdu_payload_qcn9274(struct hal_rx_desc *desc);
 u32 ath12k_hal_rx_desc_get_mpdu_start_offset_qcn9274(void);
 u32 ath12k_hal_rx_desc_get_msdu_end_offset_qcn9274(void);
 u32 ath12k_hal_get_rx_desc_size_qcn9274(void);
-u8 ath12k_hal_rx_desc_get_msdu_src_link_qcn9274(struct hal_rx_desc *desc);
 u16 ath12k_hal_rx_mpdu_start_wmask_get_qcn9274(void);
 u32 ath12k_hal_rx_msdu_end_wmask_get_qcn9274(void);
 void ath12k_hal_rx_desc_get_crypto_hdr_qcn9274(struct hal_rx_desc *desc,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index fec625a0ea0b..2d66d71d1b9b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -505,9 +505,11 @@ u32 ath12k_hal_get_rx_desc_size_wcn7850(void)
 	return sizeof(struct hal_rx_desc_wcn7850);
 }
 
-u8 ath12k_hal_rx_desc_get_msdu_src_link_wcn7850(struct hal_rx_desc *desc)
+u8 ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
+						   struct hal_rx_desc *desc,
+						   __le32 peer_metadata)
 {
-	return 0;
+	return ath12k_wifi7_dp_rx_get_logical_link_id(dp, peer_metadata);
 }
 
 u8 ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
@@ -803,8 +805,8 @@ const struct hal_ops hal_wcn7850_ops = {
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_wcn7850,
 	.rx_desc_get_crypto_header = ath12k_hal_rx_desc_get_crypto_hdr_wcn7850,
 	.rx_desc_copy_end_tlv = ath12k_hal_rx_desc_copy_end_tlv_wcn7850,
-	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_wcn7850,
 	.rx_reo_desc_get_drv_link_id = ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850,
+	.rx_msdu_desc_get_drv_link_id = ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_wcn7850,
 	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850,
 	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
index c7e1fba9bb4b..3fa919352686 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
@@ -27,9 +27,11 @@ u8 *ath12k_hal_rx_desc_get_msdu_payload_wcn7850(struct hal_rx_desc *desc);
 u32 ath12k_hal_rx_desc_get_mpdu_start_offset_wcn7850(void);
 u32 ath12k_hal_rx_desc_get_msdu_end_offset_wcn7850(void);
 u32 ath12k_hal_get_rx_desc_size_wcn7850(void);
-u8 ath12k_hal_rx_desc_get_msdu_src_link_wcn7850(struct hal_rx_desc *desc);
 u8 ath12k_hal_rx_reo_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
 						  struct hal_reo_dest_ring *reo_desc);
+u8 ath12k_hal_rx_msdu_desc_get_drv_link_id_wcn7850(struct ath12k_dp *dp,
+						   struct hal_rx_desc *desc,
+						   __le32 peer_metadata);
 void ath12k_hal_rx_desc_get_crypto_hdr_wcn7850(struct hal_rx_desc *desc,
 					       u8 *crypto_hdr,
 					       enum hal_encrypt_type enctype);

-- 
2.25.1


