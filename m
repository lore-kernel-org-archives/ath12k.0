Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459DCC369C2
	for <ath12k@archiver.kernel.org>; Fri, 25 Apr 2025 01:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbNetrenFL1DiA64vSRQhgg3J1PE5szG/6oYm4zTscw=; b=MKcr0vvSvTieQgH++XKF8d8t/W
	HJ0j7VZUcVbKtM89yF2b9wz9JWwWLyI057a2wQfto8dpchP24N4jyzmCwbCk6eJvpoT3x+Jsw2VTV
	ZKdqqLL3m+GHqHuBpuCtlPqLzUxM0yY5HzAKj8nWFv3RAzL1/iVSvqI5XsZWpz/K7IS3FFjwONhPh
	/6mgMr6Fpi3zt7SigyTeRW50ys7P/s8EIsbxs1mdqpvdQeROvDlWgRFHRWa3TCVJaBSXQgw/vOees
	Tnkr4CwqQyD2qoaQMZ5moOXMIkIgAXenRitUy7YK3smyU0c3AQ5K/1nffz71FC1Znj+UYxZ4nk3PA
	lE8PthbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87rj-0000000FhHT-0AjP;
	Fri, 25 Apr 2025 01:28:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87rh-0000000FhGt-1XTW
	for ath12k@lists.infradead.org;
	Fri, 25 Apr 2025 01:28:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P18HZq019596
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 01:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=DbNetrenFL1DiA64vSRQhgg3J1PE5szG/6oYm4zTscw=; b=LX
	pi9KqWsbsdTEeBorncChk2fgmu+I+mdtG0yZcNuZugcEKbo7b7y/00qkuPaS+DNi
	VoV6VriNOuIsCmHVCBnmbWRCFRBV6OehpGeShvf/tyMRlwy33VbxawUIVvS4NDV8
	N4YvgyxWdAhtnxknuCf3Wg8OxPE7XlwSDMC9mFzJ1R6xmBCSpkfnYrO9oxKI6sKx
	AXfZ8W20z02UzRBLIwJ5MaGYBZbPExStg64p7HzVDt0g/LantfYYqmPpw/GO73bd
	oaaSH9skE8TJ8w6K0AKkXwnaKUXcBHF4v5C+HijiGTpQwvEBjGIKhyNfCtE6jr2E
	i8THv2rsrJNQRlnv+Nag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3q9pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 01:28:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff68033070so1502778a91.2
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 18:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745544506; x=1746149306;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DbNetrenFL1DiA64vSRQhgg3J1PE5szG/6oYm4zTscw=;
        b=wa4CohncyUsea0lUazK24ot+PwLAZxJ3yhjUldkscSl60f2O/Td/AUWLV/H8LmzCwW
         eDA3XaJfaNjmZ5VyZ4wab9C9E15xySf6C3S9XSnpdDOLaKXogWVZtGAbEeBXBZZ+VOfO
         n4n5Fi5M2qCesuRx/uODYF9NnGB7tkC4rsTsLQ4AW8PpFoUH5AGSMFu2cD7ntFFUl8RB
         +rddr/Xt/jOFBFhN3F7yz9Jej6e9F4SUOSv8ff87sCkqlq5lYZZoT+4vE5UhT1hBLXlS
         2/MqTOmiusX43ARfPKlVEucFoZJFoEzNOuYVDx0IzK2W6ACxrr3IR3YrqyNvepxX1lK3
         B6og==
X-Gm-Message-State: AOJu0YwCdeukMZfPxyLv0mBphf4KGj6xBydCsJKYMEZUt8058rdkJymV
	HmpHApIyu8SSROc4+SNlrGGaVjFiGJRqpR3yxuXfIRg4Fe1wtms4haeNzqD72xEj3yTGzxN6o5k
	SBQtneEv7U3Nxq6QfEYoHzv6xYHN7GmYTn5yPYbzURmflr1HF+AB1y7dF9JhbP5Xmpty4
X-Gm-Gg: ASbGncuRARU0Ke46JHDNx1nfWKIyVU/2JPtWj5sTMXax3c6QnQyhuJf+FlO9zWexhP4
	5E8nFxbJXRicSoIDc7sqfWwvrH1r2Eb5ZnOe7Db+rqrObZ5rRJYfBDMn8jXshgS194/bUNa4m2V
	Y00ZSXfkrHcbEMkoCGo3C/AA6V/ToriFXxQHmsF5cLeQZ+zaoc2Io+nAHD9NXP2+FNZfT0DYOFG
	0CEY4ekI3m+TjiXCnmXOalH0tq8lRvhAbGf6pE4WkiIRQ58klkiU5nuEkICW2UuJ3monb3PHCtr
	gWKeu4Bbj9F4+Pns63uPnSIW3rqsmLUGzTgYhGWdxYom51eAxxPARnZI19i5sEadSILjaLOp+5Z
	/H1LXHGFHGYf+5Z+PEqJZs41jL0uXp7qHBngUvN1h4ZjYxg==
X-Received: by 2002:a17:90b:4a:b0:2fe:d766:ad95 with SMTP id 98e67ed59e1d1-309f8d9a8edmr481871a91.9.1745544506553;
        Thu, 24 Apr 2025 18:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzm1Z0GWISgsxWzkyhe6WN9QI3WbghwQilt8K+EEgEyD7BHLsuG54B+tvNZfcNxIwuLMJkSw==
X-Received: by 2002:a17:90b:4a:b0:2fe:d766:ad95 with SMTP id 98e67ed59e1d1-309f8d9a8edmr481840a91.9.1745544506174;
        Thu, 24 Apr 2025 18:28:26 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb1asm2160107a91.7.2025.04.24.18.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 18:28:25 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vinith Kumar R <quic_vinithku@quicinc.com>,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next 2/3] wifi: ath12k: Add device dp stats support
Date: Fri, 25 Apr 2025 06:58:01 +0530
Message-Id: <20250425012802.698914-3-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KvHG3myvG5n6RMhnHWtnM6r_xfyYXMMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAwOCBTYWx0ZWRfXxQH350c0uMeo ++pDth3Zfes2RwRSXYc7kGsFhXbgFdb80Ja5rmEOnFCex4UgTozUDH2pgXr7oSUULKrk0TyDJNi EM8ccnRL9POF5KgVd5eogxy0fWfEoBFtKr2wnlJKfCQc+q+OzWlsLeJy1mbvz4WFqgEPPAzd+Du
 Z0nws9vF9rcWZaJAw1nKuERVauuPmldg4glk2f69O4wks8r9CNvXzT8k036fgZXZeXaRK9E/Xxb WLBMIbnyZkbB5XjvnvX+m9w11Bbj+gVwk3AdAxAFy1UPyIDDfQE1n/HK6Rc6C9Bg1278GwqBWb1 uUJBQ3VL1WhbGqUFCC2HlgpZIoV2I8y7ccHppMAgogx88xFGG8aWrXk5gb0kEFIxDVc5R4180Ur
 KwvpGGbxxdH7edqrgUiS/i0NGbufVGRTLn0CloNJ7Hz/wEJI3rClgt455b5fNHADK3fWLY8R
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680ae53c cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=j3SS7jZd-hT91be9-fYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KvHG3myvG5n6RMhnHWtnM6r_xfyYXMMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_182829_537317_CDD4EF01 
X-CRM114-Status: GOOD (  17.36  )
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

From: Vinith Kumar R <quic_vinithku@quicinc.com>

Add support for data path related device specific stats. This
information helps to debug connectivity and performance issues
in AP, STA, and Mesh modes.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  7 +++++++
 drivers/net/wireless/ath/ath12k/dp.h       |  3 +++
 drivers/net/wireless/ath/ath12k/dp_rx.c    |  8 ++++++++
 drivers/net/wireless/ath/ath12k/dp_tx.c    | 22 ++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/hal_desc.h |  5 +++++
 5 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 00c58fc0cc4b..99ef000aad7e 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -891,6 +891,13 @@ struct ath12k_device_dp_stats {
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 hal_reo_error[DP_REO_DST_RING_MAX];
 	struct ath12k_device_dp_tx_err_stats tx_err;
+	u32 reo_rx[DP_REO_DST_RING_MAX][ATH12K_MAX_DEVICES];
+	u32 rx_wbm_rel_source[HAL_WBM_REL_SRC_MODULE_MAX][ATH12K_MAX_DEVICES];
+	u32 tqm_rel_reason[MAX_TQM_RELEASE_REASON];
+	u32 fw_tx_status[MAX_FW_TX_STATUS];
+	u32 tx_wbm_rel_source[HAL_WBM_REL_SRC_MODULE_MAX];
+	u32 tx_enqueued[DP_TCL_NUM_RING_MAX];
+	u32 tx_completed[DP_TCL_NUM_RING_MAX];
 };
 
 struct ath12k_reg_freq {
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 706d766d8c81..c4ddf30aa79f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -266,6 +266,9 @@ struct ath12k_pdev_dp {
 /* Invalid TX Bank ID value */
 #define DP_INVALID_BANK_ID -1
 
+#define MAX_TQM_RELEASE_REASON 15
+#define MAX_FW_TX_STATUS 7
+
 struct ath12k_dp_tx_bank_profile {
 	u8 is_configured;
 	u32 num_users;
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index e81a117cbc06..313b11421a26 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2835,6 +2835,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 				 DMA_FROM_DEVICE);
 
 		num_buffs_reaped[device_id]++;
+		ab->device_stats.reo_rx[ring_id][ab->device_id]++;
 
 		push_reason = le32_get_bits(desc->info0,
 					    HAL_REO_DEST_RING_INFO0_PUSH_REASON);
@@ -3982,6 +3983,7 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 	int num_buffs_reaped[ATH12K_MAX_DEVICES] = {};
 	int total_num_buffs_reaped = 0;
 	struct ath12k_rx_desc_info *desc_info;
+	struct ath12k_device_dp_stats *device_stats = &ab->device_stats;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
 	struct ath12k_base *partner_ab;
 	u8 hw_link_id, device_id;
@@ -4155,6 +4157,12 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 			dev_kfree_skb_any(msdu);
 			continue;
 		}
+
+		if (rxcb->err_rel_src < HAL_WBM_REL_SRC_MODULE_MAX) {
+			device_id = ar->ab->device_id;
+			device_stats->rx_wbm_rel_source[rxcb->err_rel_src][device_id]++;
+		}
+
 		ath12k_dp_rx_wbm_err(ar, napi, msdu, &msdu_list);
 	}
 	rcu_read_unlock();
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 128fa0e3c229..5a2b9c3f5e4b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -477,6 +477,8 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		arvif->link_stats.tx_enqueued++;
 	spin_unlock_bh(&arvif->link_stats_lock);
 
+	ab->device_stats.tx_enqueued[ti.ring_id]++;
+
 	ath12k_hal_tx_cmd_desc_setup(ab, hal_tcl_desc, &ti);
 
 	ath12k_hal_srng_access_end(ab, tcl_ring);
@@ -557,6 +559,7 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 	info = IEEE80211_SKB_CB(msdu);
 
 	ar = skb_cb->ar;
+	ab->device_stats.tx_completed[tx_ring->tcl_data_ring_id]++;
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
@@ -614,6 +617,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab, void *desc,
 
 	wbm_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
+	ab->device_stats.fw_tx_status[wbm_status]++;
 
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
@@ -760,7 +764,8 @@ static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct hal_tx_status
 
 static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 				       struct ath12k_tx_desc_params *desc_params,
-				       struct hal_tx_status *ts)
+				       struct hal_tx_status *ts,
+				       int ring)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_hw *ah = ar->ah;
@@ -777,6 +782,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	}
 
 	skb_cb = ATH12K_SKB_CB(msdu);
+	ab->device_stats.tx_completed[ring]++;
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
@@ -907,6 +913,8 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 	struct hal_wbm_release_ring *desc;
 	u8 pdev_id;
 	u64 desc_va;
+	enum hal_wbm_rel_src_module buf_rel_source;
+	enum hal_wbm_tqm_rel_reason rel_status;
 
 	spin_lock_bh(&status_ring->lock);
 
@@ -963,6 +971,15 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 		desc_params.skb = tx_desc->skb;
 		desc_params.skb_ext_desc = tx_desc->skb_ext_desc;
 
+		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
+		buf_rel_source = le32_get_bits(tx_status->info0,
+					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
+		ab->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+
+		rel_status = le32_get_bits(tx_status->info0,
+					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
+		ab->device_stats.tqm_rel_reason[rel_status]++;
+
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
 		 */
@@ -979,7 +996,8 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
-		ath12k_dp_tx_complete_msdu(ar, &desc_params, &ts);
+		ath12k_dp_tx_complete_msdu(ar, &desc_params, &ts,
+					   tx_ring->tcl_data_ring_id);
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 49eededbfa9d..f31b4a37ee35 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -1008,6 +1008,10 @@ enum hal_reo_entr_rxdma_ecode {
 	HAL_REO_ENTR_RING_RXDMA_ECODE_FLOW_TIMEOUT_ERR,
 	HAL_REO_ENTR_RING_RXDMA_ECODE_FLUSH_REQUEST_ERR,
 	HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_FRAG_ERR,
+	HAL_REO_ENTR_RING_RXDMA_ECODE_MULTICAST_ECHO_ERR,
+	HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_MISMATCH_ERR,
+	HAL_REO_ENTR_RING_RXDMA_ECODE_UNAUTH_WDS_ERR,
+	HAL_REO_ENTR_RING_RXDMA_ECODE_GRPCAST_AMSDU_WDS_ERR,
 	HAL_REO_ENTR_RING_RXDMA_ECODE_MAX,
 };
 
@@ -1809,6 +1813,7 @@ enum hal_wbm_rel_src_module {
 	HAL_WBM_REL_SRC_MODULE_REO,
 	HAL_WBM_REL_SRC_MODULE_FW,
 	HAL_WBM_REL_SRC_MODULE_SW,
+	HAL_WBM_REL_SRC_MODULE_MAX,
 };
 
 enum hal_wbm_rel_desc_type {
-- 
2.17.1


