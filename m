Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86377C369A2
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wjvw48IRBRHm7OUe7JcfSIfNWxDA2eN83zFkdDNCBU=; b=bVDVWwXxBoLIw6KVwWkzz7RRfu
	lFF1GdaxuB5kzLruA40e1R7KNR4yq/YXgRqGpZ0WpitIKklvB72Ae1x5FWvHcpZVFLo1Rt7cGwgCx
	2Lvk7DhxjiL/XBsZg4B1LT12wtMQqdRp/1PNWunhf4bF3Pck8NjEe2ZBctqJmM44LAuxBlw55XroK
	MsAExvULoQObf2XbbUjz205PZMWd/+OYAr3maojzDpz8LOjOa9QmFgk5geDNr4titn4d4sM0FerGy
	nvziAsRMRwk2Pjx0ctkv6WNG6F/3aoew7ywhr+KFn6iqKw+wAJJj2fIpdFMtbFi7aO4I9tJQfPHcv
	4Vo3W6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ADG-0000000D6bC-1DWX
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 08:58:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37T1-0000000CehZ-3ivF
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:02:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5unb9000645
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2wjvw48IRBR
	Hm7OUe7JcfSIfNWxDA2eN83zFkdDNCBU=; b=K0k87+Ib90uBvLPVjzgA1YzxZZ4
	VXPKshjUcWaCewDJYzDhvfz9pyGuScbfNklxcabmd2JdnBAxbHCtAmCarzYDXUlo
	YkVEOmQZMcKnwEFaRyn4uWCcGXyzJTaE32Wi5k41ztAiyZomEHB6rrYUPkk+iEpo
	0dC9SvFlX2TgDiHo7MIz8OA0R4QJ6yWtFRMBos6/Wjqn4lLDoFx7HNInqch7Bl9Z
	m94GjdPFi7g3cUB4jB58IDS3/VwgaYTFrhGQw6mWMXil1hGtbuyN6srkvOaPivS4
	GDA6ckvpg2bCczIMJJRitzNO0zPEUf1+5WTeC3OL21MED46O7ieOAV3k0ng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd31ae0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a960f9cso16039185ad.0
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351338; x=1744956138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wjvw48IRBRHm7OUe7JcfSIfNWxDA2eN83zFkdDNCBU=;
        b=jXKJRItDUIqMeUNR423UXVucFbx7a3j2B6WKUUs5MVjosRQJZnqMpSUgh42/g4vjPw
         QtHqscaeks3ML2ZiD2wGh1c5FD8mFK/ItltVUDzNZMoS3l7TVrR6CxlNgLRjPtO4vTUv
         5Byje2jZNxBOKQC39zD1l+m3xbz7wmijgFnDtvE2ACv53K8wt7oMC83jqbFPtbf4QsXH
         S8UH6BaxbqPp2+xMq7xyRRBNt82Cxg55Qexis+pep5ZcAVXFh7c5f+yQN4KMmnU5Y/Zz
         djdTRy1j+IdeRo3BFe4NVaMjYdgjkprnT8TlbkCkkm3+Wm1ZUjbSnWWaCJxlbULrvOOm
         wOxg==
X-Gm-Message-State: AOJu0Yz8vkGBxbsVCNCpsV0R/9MY4ObOxFz07BlmhYuUK74gvRNN3iq5
	5DvN2rJgEfVU4L3N1RjRSuki6jxGvM55ZL/BoLyOXNThZvBvHzx9cW8ElKNGYmzMMoEh9AVkZ1Q
	WND9WSmnyOo1sNbfFxfuWa37hg0oHu/Vd5S35UJDlcRdGZZvsPiFbbvL98U4/3eHYgr7X
X-Gm-Gg: ASbGncsfiZg+iusRV4cnl+NV7jPd1iVvove7sJ8jas2NA0BKQrDWvI7KE07sxWb8Tqb
	Ng0XgHKsOrRJZ4RXKtNRaHofvLVb6+1VVSAxi6n2MPum9MjuwB3SwUskwyr68H9mQ3M7t0CTkYB
	O8lcUfmaXhHwb2Ex0momOQdLhk7y2HfGYGyA/CmwfH/tiBZPRFXrs0bU8r/33c7ZVdBcTToj/lf
	IZkiP8ZWpxciF05YYOtjw6kkcDYnV1Z5HYU4f5vEmrBw/UFnpjQwXgLPNSwG6BIq7h6uRlD9ZQR
	2qectqQ8ZW2xFHG28OkPZP5Dk4xG0LURTPoS5j/AyHxTYdSVpWBQmwSNEV9PGXy59LZ8or0NLjj
	2/A5cSBRwpeaBgZGgrx8ejV6xc4peyA==
X-Received: by 2002:a17:902:c951:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22bea4f009amr24034785ad.39.1744351337794;
        Thu, 10 Apr 2025 23:02:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLRteCVlMEaQjh10Hbrr4gt/Q1E8StKnZJ2JTliMj6Xe5gP346m01uvv3afIMpzn7jCnbWPw==
X-Received: by 2002:a17:902:c951:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22bea4f009amr24034555ad.39.1744351337401;
        Thu, 10 Apr 2025 23:02:17 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2328435sm624567b3a.157.2025.04.10.23.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:02:17 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v3 3/4] wifi: ath12k: Fix memory leak during extended skb allocation
Date: Fri, 11 Apr 2025 11:31:53 +0530
Message-Id: <20250411060154.1388159-4-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
References: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zwJrbRXSMelkYIV7Wa8IbHXkn5DjYrkc
X-Proofpoint-GUID: zwJrbRXSMelkYIV7Wa8IbHXkn5DjYrkc
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f8b06b cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=iFgiq4A1vBvqtHBMXJkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_230219_933934_DC2F3063 
X-CRM114-Status: GOOD (  16.10  )
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

In ath12k_dp_tx(), memory allocated for extended skb is not freed
properly, causing a memory leak even when the host receives tx
completion for those skbs. Fix this issue by storing skb_ext_desc
in the host tx descriptor and using this skb_ext_desc field during
completion or during ath12k_dp_cc_cleanup().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    | 10 +++++++++-
 drivers/net/wireless/ath/ath12k/dp.h    |  2 ++
 drivers/net/wireless/ath/ath12k/dp_tx.c | 15 ++++++++++++---
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index b8e63f489e7d..ad873013e46c 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1206,11 +1206,19 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 			if (!skb)
 				continue;
 
+			skb_cb = ATH12K_SKB_CB(skb);
+			if (skb_cb->paddr_ext_desc) {
+				dma_unmap_single(ab->dev,
+						 skb_cb->paddr_ext_desc,
+						 tx_desc_info->skb_ext_desc->len,
+						 DMA_TO_DEVICE);
+				dev_kfree_skb_any(tx_desc_info->skb_ext_desc);
+			}
+
 			/* if we are unregistering, hw would've been destroyed and
 			 * ar is no longer valid.
 			 */
 			if (!(test_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags))) {
-				skb_cb = ATH12K_SKB_CB(skb);
 				ar = skb_cb->ar;
 
 				if (atomic_dec_and_test(&ar->dp.num_tx_pending))
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 241da2a3bd34..706d766d8c81 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -296,6 +296,7 @@ struct ath12k_rx_desc_info {
 struct ath12k_tx_desc_info {
 	struct list_head list;
 	struct sk_buff *skb;
+	struct sk_buff *skb_ext_desc;
 	u32 desc_id; /* Cookie */
 	u8 mac_id;
 	u8 pool_id;
@@ -303,6 +304,7 @@ struct ath12k_tx_desc_info {
 
 struct ath12k_tx_desc_params {
 	struct sk_buff *skb;
+	struct sk_buff *skb_ext_desc;
 	u8 mac_id;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index a272d5b8a51c..9bcd20712888 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -84,6 +84,7 @@ static void ath12k_dp_tx_release_txbuf(struct ath12k_dp *dp,
 				       u8 pool_id)
 {
 	spin_lock_bh(&dp->tx_desc_lock[pool_id]);
+	tx_desc->skb_ext_desc = NULL;
 	list_move_tail(&tx_desc->list, &dp->tx_desc_free_list[pool_id]);
 	spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
 }
@@ -431,6 +432,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		ti.type = HAL_TCL_DESC_TYPE_EXT_DESC;
 
 		skb_cb->paddr_ext_desc = ti.paddr;
+		tx_desc->skb_ext_desc = skb_ext_desc;
 	}
 
 	hal_ring_id = tx_ring->tcl_data_ring.ring_id;
@@ -525,9 +527,11 @@ static void ath12k_dp_tx_free_txbuf(struct ath12k_base *ab,
 	ar = ab->pdevs[pdev_id].ar;
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	if (skb_cb->paddr_ext_desc)
+	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
 				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+		dev_kfree_skb_any(desc_params->skb_ext_desc);
+	}
 
 	ieee80211_free_txskb(ar->ah->hw, msdu);
 
@@ -558,9 +562,11 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 		wake_up(&ar->dp.tx_empty_waitq);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	if (skb_cb->paddr_ext_desc)
+	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
 				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+		dev_kfree_skb_any(desc_params->skb_ext_desc);
+	}
 
 	vif = skb_cb->vif;
 	if (vif) {
@@ -773,9 +779,11 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	skb_cb = ATH12K_SKB_CB(msdu);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	if (skb_cb->paddr_ext_desc)
+	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
 				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+		dev_kfree_skb_any(desc_params->skb_ext_desc);
+	}
 
 	rcu_read_lock();
 
@@ -953,6 +961,7 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 
 		desc_params.mac_id = tx_desc->mac_id;
 		desc_params.skb = tx_desc->skb;
+		desc_params.skb_ext_desc = tx_desc->skb_ext_desc;
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
-- 
2.34.1


