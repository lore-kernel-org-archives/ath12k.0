Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24602C369A8
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCtVp2/c4MZUyEuyO+HVFhPJjUakW3UDCQt6LzIMjb4=; b=KpUSlTigyvOM9fl4qlZF31GaSc
	qYn/WBD6vCrfQOIH9G/mGCqIXj7okJX6EapdjU/1fMp6+dFRtg7e4sd0vj8AplJl6VuxHuiEDUkgs
	8FCA/dqIEr0zjnRcguUoXmX+J8d0H6k52Zgsip+UEOVVy/4JF/7x6pgyKXj86dDZSpuItwD6bFvoA
	fNj9UA75fGZxO/AeB+0IcnLBBC7HE7j5Rg045XW+ThrtiRRX7row+2p4TM110JX/0pPfQpYJ+FPpe
	ArU30H67u5OIKYjNZQURDlS0rxj+z5i8hFA0kiGbfXV8z/l7hsoFDFI2f7Q/qYUAZtK9ntvqwkpf8
	F7exsfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ADF-0000000D6av-3mAA
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 08:58:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37T0-0000000Ceh6-0syw
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:02:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5RUIK014058
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HCtVp2/c4MZ
	UyEuyO+HVFhPJjUakW3UDCQt6LzIMjb4=; b=VhN8ugXHNibCBgQkrFoUffrpnPK
	ytR1HXOkRwBWhZWXslubiqAiufrYKhbj60PuYw3MQU+6sgbKGjgqJpvCVbEy2xV3
	gR0ZQVXgc7dq+gvEQgzn6kYOs/Cdpb9F/hriplZ+drlNs9DjgbcVos7zLK8Se+TQ
	+At7/D+ZgJvagbEt0EbKvS1GXprqgHEcZNfKitoHDjc2180holxnSvbRg5xpFt3t
	sp31ILG0cpSQ4qdbmyuZHlDANMA3dD53/LPSbiOu4BV2LMaXNLQPjYHcl5wawXuD
	ja5wdjuoTAiOAZPRMTZWQkzhV0rVZ8Q7R6mdww9ifpvXPI9QfOEP/iX5F7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbehd4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736bf7eb149so1247923b3a.0
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351336; x=1744956136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCtVp2/c4MZUyEuyO+HVFhPJjUakW3UDCQt6LzIMjb4=;
        b=sQz1ujaup7nYNMq1J2rnsHOeIbWHOEeCYO9xAisMQj2H4ESNcVSvUDNF1Z1HRamBJJ
         /vDKg27gHbd3oaL0U+Xdd2jKsGD5HJSG6e2PZcexK8l3RvAt8TmgQJQkVRnv9XjKFsVq
         CUNT1OgaoJmJ1rfCy9E+t2MUN8BF64UilX5yN/o9bcNvV2u+XmXuaePLdAtBdtta4XXd
         W+O4fsGfsl71CvCKrJ/s2EUbU4eprsXYROMhGQxeQr5DSNGWN080BDQtnWzOkXxpjeAF
         5KPA5+MHrSGaZYIm82RqiYe4zqNUmuUN6Mu0IGxs4YLtKTl2lO5O/YoYMn8kow3l2JUK
         KRqg==
X-Gm-Message-State: AOJu0YyQVFHEO6R0WSo43u834gVZkYb5mdGSHzS/El59ckneHzWcuJWf
	4RCx/xQTtRXU3qAg4cnJtxDnZlQLpEd0EAUJ8YKwga3L7G+VZ9tMjGnQcIFuV/+jd901WKj/AaA
	8/0CqME5AMdWcwmWddaa9OoNZeYNTD5os1ifp9H+PTWnoaOMyrZQSEhFjmfoHCFcVLQ0C
X-Gm-Gg: ASbGncvtpIvlXYN54FWNyWvAXFFvDrUAtYoiuU67B0wzVngnvMmZqnVGEeEJqzq6f55
	NAl+px3T78YpV3hfBLeiiwg5M/0mFOufXtxIIZMP3jV5iiajmKUzscle9T7n//JYjE9mIzg0Ol+
	mbmmp7y1sXh+k7WX0iJF3q42OucneSv8aXl7Yvu4g2Dv0ZTUEWBYYtOijx0o3I2d+E3iSFCcNr7
	zaxRGwignidgoM24BzpC3GAYY/cC4kg2V+QL+LBPrKR/nPE+f3ZuWbJt1f73sKRNG68JPwA1tDu
	RxjamjK5SY6DjTrF+rnhWJyvkpK7V50gCdmKsE+AWb/qAkJmPPWoIa8/DoQPjKO8Zz1W1cgRo+k
	obehURpd+4MKWhTzPOzjZRkBS9J3aZA==
X-Received: by 2002:aa7:8881:0:b0:739:4902:e364 with SMTP id d2e1a72fcca58-73bd127278amr2101021b3a.19.1744351336396;
        Thu, 10 Apr 2025 23:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFArQi+O/yuGejTqFKNVWiTmHtB/EvA/5NTK5V4pX4nn8svVwJWHVJu80ab1OW914dEPJGZbQ==
X-Received: by 2002:aa7:8881:0:b0:739:4902:e364 with SMTP id d2e1a72fcca58-73bd127278amr2100989b3a.19.1744351335907;
        Thu, 10 Apr 2025 23:02:15 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2328435sm624567b3a.157.2025.04.10.23.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:02:15 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v3 2/4] wifi: ath12k: Refactor tx descriptor handling in tx completion handler
Date: Fri, 11 Apr 2025 11:31:52 +0530
Message-Id: <20250411060154.1388159-3-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
References: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5h33URiJU3sHla92XXVGic2zdIR92r2w
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f8b069 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DEzRtGDzSFLe7Yuc7ZwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 5h33URiJU3sHla92XXVGic2zdIR92r2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=981 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_230218_253286_AC4A08D6 
X-CRM114-Status: GOOD (  17.16  )
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

Current code uses mac_id and msdu parameters in ath12k_dp_tx_free_txbuf()
and ath12k_dp_tx_process_htt_tx_complete(). Since these parameters are
already encapsulated by struct ath12k_dp_tx_desc, passing them individually
results in redundant arguments.

Introduce struct ath12k_tx_desc_params to capture the skb, mac_id, and pass
it to the corresponding functions. Refactor these functions to use struct
ath12k_tx_desc_params instead, reducing the number of arguments and improving
function argument handling efficiency. Additionally, use struct
ath12k_tx_desc_params in ath12k_dp_tx_htt_tx_complete_buf() and
ath12k_dp_tx_complete_msdu(), which will be utilized for fetching extended skb
in a future patch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    |  5 +++
 drivers/net/wireless/ath/ath12k/dp_tx.c | 42 ++++++++++++-------------
 2 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 6ce5f853dcdb..241da2a3bd34 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -301,6 +301,11 @@ struct ath12k_tx_desc_info {
 	u8 pool_id;
 };
 
+struct ath12k_tx_desc_params {
+	struct sk_buff *skb;
+	u8 mac_id;
+};
+
 struct ath12k_spt_info {
 	dma_addr_t paddr;
 	u64 *vaddr;
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 9d58a9a9cbff..a272d5b8a51c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -513,12 +513,13 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 }
 
 static void ath12k_dp_tx_free_txbuf(struct ath12k_base *ab,
-				    struct sk_buff *msdu, u8 mac_id,
-				    struct dp_tx_ring *tx_ring)
+				    struct dp_tx_ring *tx_ring,
+				    struct ath12k_tx_desc_params *desc_params)
 {
 	struct ath12k *ar;
+	struct sk_buff *msdu = desc_params->skb;
 	struct ath12k_skb_cb *skb_cb;
-	u8 pdev_id = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, mac_id);
+	u8 pdev_id = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, desc_params->mac_id);
 
 	skb_cb = ATH12K_SKB_CB(msdu);
 	ar = ab->pdevs[pdev_id].ar;
@@ -536,7 +537,7 @@ static void ath12k_dp_tx_free_txbuf(struct ath12k_base *ab,
 
 static void
 ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
-				 struct sk_buff *msdu,
+				 struct ath12k_tx_desc_params *desc_params,
 				 struct dp_tx_ring *tx_ring,
 				 struct ath12k_dp_htt_wbm_tx_status *ts)
 {
@@ -546,6 +547,7 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
 	struct ath12k *ar;
+	struct sk_buff *msdu = desc_params->skb;
 
 	skb_cb = ATH12K_SKB_CB(msdu);
 	info = IEEE80211_SKB_CB(msdu);
@@ -594,10 +596,9 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 }
 
 static void
-ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab,
-				     void *desc, u8 mac_id,
-				     struct sk_buff *msdu,
-				     struct dp_tx_ring *tx_ring)
+ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab, void *desc,
+				     struct dp_tx_ring *tx_ring,
+				     struct ath12k_tx_desc_params *desc_params)
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath12k_dp_htt_wbm_tx_status ts = {0};
@@ -613,14 +614,14 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab,
 		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
 		ts.ack_rssi = le32_get_bits(status_desc->info2,
 					    HTT_TX_WBM_COMP_INFO2_ACK_RSSI);
-		ath12k_dp_tx_htt_tx_complete_buf(ab, msdu, tx_ring, &ts);
+		ath12k_dp_tx_htt_tx_complete_buf(ab, desc_params, tx_ring, &ts);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_VDEVID_MISMATCH:
-		ath12k_dp_tx_free_txbuf(ab, msdu, mac_id, tx_ring);
+		ath12k_dp_tx_free_txbuf(ab, tx_ring, desc_params);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY:
 		/* This event is to be handled only when the driver decides to
@@ -752,7 +753,7 @@ static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct hal_tx_status
 }
 
 static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
-				       struct sk_buff *msdu,
+				       struct ath12k_tx_desc_params *desc_params,
 				       struct hal_tx_status *ts)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -762,6 +763,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	struct ath12k_skb_cb *skb_cb;
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
+	struct sk_buff *msdu = desc_params->skb;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -891,11 +893,11 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 	int hal_ring_id = dp->tx_ring[ring_id].tcl_comp_ring.ring_id;
 	struct hal_srng *status_ring = &ab->hal.srng_list[hal_ring_id];
 	struct ath12k_tx_desc_info *tx_desc = NULL;
-	struct sk_buff *msdu;
 	struct hal_tx_status ts = { 0 };
+	struct ath12k_tx_desc_params desc_params;
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	struct hal_wbm_release_ring *desc;
-	u8 mac_id, pdev_id;
+	u8 pdev_id;
 	u64 desc_va;
 
 	spin_lock_bh(&status_ring->lock);
@@ -949,28 +951,26 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 			continue;
 		}
 
-		msdu = tx_desc->skb;
-		mac_id = tx_desc->mac_id;
+		desc_params.mac_id = tx_desc->mac_id;
+		desc_params.skb = tx_desc->skb;
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
 		 */
 		ath12k_dp_tx_release_txbuf(dp, tx_desc, tx_desc->pool_id);
 		if (ts.buf_rel_source == HAL_WBM_REL_SRC_MODULE_FW) {
-			ath12k_dp_tx_process_htt_tx_complete(ab,
-							     (void *)tx_status,
-							     mac_id, msdu,
-							     tx_ring);
+			ath12k_dp_tx_process_htt_tx_complete(ab, (void *)tx_status,
+							     tx_ring, &desc_params);
 			continue;
 		}
 
-		pdev_id = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, mac_id);
+		pdev_id = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, desc_params.mac_id);
 		ar = ab->pdevs[pdev_id].ar;
 
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
-		ath12k_dp_tx_complete_msdu(ar, msdu, &ts);
+		ath12k_dp_tx_complete_msdu(ar, &desc_params, &ts);
 	}
 }
 
-- 
2.34.1


