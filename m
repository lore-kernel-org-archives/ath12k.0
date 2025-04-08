Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C785C369A6
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEFyTTEuNUuSbnwQFNWQYErdU/hJQYQmJmQ0atVTp0E=; b=0EPXsdxtJaNRbTC9yVaJWiVUq2
	ZEaoIipHMXXpl06cj07yUOI7eFyfijDGU7JKLxTz3JDO7M/i57bAMs/i/RTOvdn00acpDyLHTFkHc
	ADrDPM0rTiSSahcEjetYQGHGXJnYMOYoiD/ixdd3+FFzgdZOGnwk14hhoXWMUz/NoGuYx4yy1PxaF
	BJHYB2vaRMr1gCf+k+pmtBTcvLZZ4jlQGUI2+bHHn9YvP1cgO4B32LFp8ibT7jUt6LLBA7u20UdDm
	euVAXwvpj95zLhAgfzg3O8ogJ9W91FxdN5Di0bDGVpmyEL5e5rMDuWAlsJrEoQJ26y7A/BygpVtC2
	1qI5pxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Dj-00000002sf7-3b4J
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:14:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Dh-00000002scQ-21Pj
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:14:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GNl4032619
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kEFyTTEuNUu
	SbnwQFNWQYErdU/hJQYQmJmQ0atVTp0E=; b=CNBj4GXanKn1RbEiCmChmrYHrZx
	zbXq4XyVGHsrkzULSn3pgEp4+048ka9Hw2QUFcDRJ6Fh4q1HI3TOokxRjayuEgdo
	IlRTUucGOmJhwuk9P1P+IndYSIsQ2uT24QFzEYlJpU/Oa8IgFQ+4YnpiASw4cSll
	omY2HvSziA4G089rvTi4gsKNNAHrjmjxGPB8ct8Yx7HtJSrCRbqCx7e/F/ibhrUm
	zUA57gg8Z6T+MNVKAp7/ZccYWi5OGYvKMmk93Y7fGE1kiyKQCmp0/qfVwyW9sIEf
	VohDzsBfbuk2FkGhKDXJw4zlna1xQqE+5KKC5zooWBd36hg8daaxd1PavVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkekf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:14:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3052d29759bso7576468a91.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092839; x=1744697639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEFyTTEuNUuSbnwQFNWQYErdU/hJQYQmJmQ0atVTp0E=;
        b=M0Kj+E6H2sn5/c7JQSd/KUvy/o90p9QjYdQ+Dn/cGHn7YUyQAV99azEGoG3DTL2NLC
         z+KwjpPjIcXgc1wR41xPZMaXtVSBkftYEcWBNKlDpJhTumuQ0SxqAOWDqim1BAytOigC
         OpdmPyoDTd9OIIuKqHVtFitHt8MPBu9BIhmW6j/olg7wh6Lb2I7qBU6vVS/RnaXQDlfl
         sTBzrmsuhTEXehtb56yKhiR8vdy2uFGbznFy5k5zmDreTDjUuJyiyhZ4CpjSy8zT/xsA
         VZDOcGJXm3DaO8CiZYFXl+FAYonRo3MTw6E1SPWFoY1QxYEvuqIAByoIGG5qA4CLn1op
         wKQw==
X-Gm-Message-State: AOJu0YyPBE/tu5G4uwgihvCR1YElxWmW9uZKExiDfKPLnQCK2PpcsmFA
	1OVRttpdsZBsg0oahrUMWWs+QuCXx/tA1cDOYY2tkA7YwgYBwgw3PujI965PBetUSjlUZxZ6JPW
	y5dbc5g1ta2egZ1CG0rX745n4ln03vqnnCpyrA9M5lWr7dpcN0GXnF48IqOzG/FB1PxkY
X-Gm-Gg: ASbGncvVceOLOtiSu03o3z1iD0Fj8876EVXT3A6pEYoId4qXVOZYLeRI7Pe0R6OIUY5
	kQn1S8qzZX9/FslGOlH8YDm3388xDIRQRjup0VGiKogI8YcVY42sDMbK94ehnXXdpo6mxWmhwJE
	kaF6XDUVi2a+UAcBJ/0HrtIrPq/9SyvObrCkUmlpSfhlrv2m8R1gOA0nvKXKo9yWXJ+JEc52IAT
	DpH5CV1MnXc4RHt2/yBZRZvXDSfhGL4ovNptUWcPtPJmcWU8q8OWh6f5ZBHSc7xDZh6t7AnbGX7
	XvGm2zIXMLzbbjcEHcYtOsV5raRNEEw2QtuSAFUve8hdBie2V0NrnT1k2EvbpiLreFRnSecV/oY
	A839sjLrGDBUIZK79ul+SLMQR6V3q6+N/wQ==
X-Received: by 2002:a17:90b:2390:b0:306:b65e:13a8 with SMTP id 98e67ed59e1d1-306b65e13fcmr10168967a91.8.1744092838679;
        Mon, 07 Apr 2025 23:13:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoBBnXJXCkSl1D6taAVfDLW9Ne+0IIgh+f9kGprM0pNZnCYkxkVhjhirD7WUC8hFYjuNwEww==
X-Received: by 2002:a17:90b:2390:b0:306:b65e:13a8 with SMTP id 98e67ed59e1d1-306b65e13fcmr10168940a91.8.1744092838111;
        Mon, 07 Apr 2025 23:13:58 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb94f4esm10258444a91.46.2025.04.07.23.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:13:57 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v2 2/4] wifi: ath12k: Refactor tx descriptor handling in tx completion handler
Date: Tue,  8 Apr 2025 11:43:41 +0530
Message-Id: <20250408061343.2774345-3-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408061343.2774345-1-praneesh.p@oss.qualcomm.com>
References: <20250408061343.2774345-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GPXggTXxRa3nNXDN5cCc0S3W_d8z9Qy6
X-Proofpoint-ORIG-GUID: GPXggTXxRa3nNXDN5cCc0S3W_d8z9Qy6
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f4bea8 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DEzRtGDzSFLe7Yuc7ZwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=983 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_231401_638327_3C12D8B5 
X-CRM114-Status: GOOD (  17.91  )
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
index e8dbba0c3bb7..d982e9638517 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -300,6 +300,11 @@ struct ath12k_tx_desc_info {
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
index 6b394534e3a2..08af7edd3f25 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -496,12 +496,13 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
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
@@ -519,11 +520,12 @@ static void ath12k_dp_tx_free_txbuf(struct ath12k_base *ab,
 
 static void
 ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
-				 struct sk_buff *msdu,
+				 struct ath12k_tx_desc_params *desc_params,
 				 struct dp_tx_ring *tx_ring,
 				 struct ath12k_dp_htt_wbm_tx_status *ts)
 {
 	struct ieee80211_tx_info *info;
+	struct sk_buff *msdu = desc_params->skb;
 	struct ath12k_skb_cb *skb_cb;
 	struct ath12k *ar;
 
@@ -561,10 +563,9 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
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
@@ -580,14 +581,14 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab,
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
@@ -719,13 +720,14 @@ static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct hal_tx_status
 }
 
 static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
-				       struct sk_buff *msdu,
+				       struct ath12k_tx_desc_params *desc_params,
 				       struct hal_tx_status *ts)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_hw *ah = ar->ah;
 	struct ieee80211_tx_info *info;
 	struct ath12k_skb_cb *skb_cb;
+	struct sk_buff *msdu = desc_params->skb;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -844,11 +846,11 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
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
@@ -902,28 +904,26 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
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


