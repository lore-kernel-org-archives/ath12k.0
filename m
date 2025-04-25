Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CB3C369AB
	for <ath12k@archiver.kernel.org>; Fri, 25 Apr 2025 01:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaYpndAzlwZd+QuwVejNqGf6VpXXSOyszO0Ty/vDhqY=; b=W/5QGk9UUUFzvEVG55HJJ4N3LV
	T7iFGCGWa4bzz21PZ3s00cqboi5iONeONomVMa0ls+IzlS4rW4G50BYVj6AMmhqbt72t1SPrGxms+
	7qbDWOonVqc0uFS6Rg2Z8Ozf3Ry52ke/svDtK6ahTROaBfRsDpeq35maP/NWY66flhXCJoaQhs/9L
	hpGF/qs0kyR/O0Rg36pdRhOM6IkisR5C8CmGoRO/t6Tw019WKcoVerHYGj8Wj4rmC3b8I6j+ipK1F
	RGP3A3LkdQQynpDt6Si4sUGE81vsOrivwhyN9r/d0DxWR8pShzNjUquStA3HbSBEPs+AjaNDz/Ttr
	36XiKCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87rb-0000000FhFb-1iom;
	Fri, 25 Apr 2025 01:28:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87rY-0000000FhEM-30pd
	for ath12k@lists.infradead.org;
	Fri, 25 Apr 2025 01:28:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P19bnw023818
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 01:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=iaYpndAzlwZd+QuwVejNqGf6VpXXSOyszO0Ty/vDhqY=; b=dI
	lM4Ghk5xOFN2pupbGRaF7VSWC3B5wG8lMLY+bLumYJ8CIsc4ktXei14W5KoJC9IW
	blh0cvOiF0QReC2sQMHg97in9/YuOHgW8mYZPOE6T7c+bt6XAVcm4DGw8weZKxXy
	673IRCTuJfEN4RFLoAZoa1700G7M5uLoA/d6GJVd35KrwsdbC3hAv82GS+bRZ4uG
	0cs5UNLk1ZbpSQ28mUq9718dstbKYKIvgzL+xIcMGuZpyDlUN20YCzBIXpEvzcMF
	6HI1XlAIyFYFbAaOClAyGTF27+pvc+9jB+3ZkSMEE5dfzjvfuPQVktJf1NM0pXic
	Zhy39VVFzOEJGiJQZedA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3q9ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 01:28:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so1410990a91.1
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 18:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745544498; x=1746149298;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaYpndAzlwZd+QuwVejNqGf6VpXXSOyszO0Ty/vDhqY=;
        b=sHSF+R0FLfMGwUPl4rRyDWmGVQl+lEgHvO8Umk7ztpNyXXgk8KyeZNAGy18k0cbdrH
         oGstqR8F3+yX0B0Mbs7q0ZyvLPV6slmCl0q8JcrAfbp9Ov1LtXKiHEhBQ9sqkuZjBHoq
         YMfzgKcnuZwECuBdBX68ZHeM1UOGG5GAVN8wrLPxRmTrKMWX2LYZCTmGpV8fhNv7E/Kq
         DOuJrUym005/LqtJHU8sXb8sXYCqCV/K+ITid7Gh1hREPrS6ZKFFAplvZjfU4M+lFKrf
         kdQJSqVsZfwny1qDq9vYMSICeJb++v9yvSSLtprJYTUvNkWocCZfdLKRQzoztg9tjy4U
         Vgqw==
X-Gm-Message-State: AOJu0YyDayNn34rffe1X1oKhzjFfv7Y9Jsfl+A4RB5ky6UXZpq5utC5V
	KJ6DVOlVD4A8ZuDnFc9ALAimatZtBXk0+DaCIbLBul3Si7RljTwmx0y9jHYU2SeXgynsWQWd3RZ
	+Z0lz+XEk8fA6V6bb58q6ImdR9aAXfwF5bu9yj8N5p5bfWvc9ZA8PZIGhv7zZOnKsg3VY
X-Gm-Gg: ASbGncteRIWNIRSdCnWDRXHvoxwAHBXDQW1YN8ygA+QNVg6mUdRmevlGSn9cuuJr/yx
	qRjBQNd2AGTDvXb7jfBC7Z0+vBs2ND/IluoCaNI8uRB1q9+zf+cp+DeeZ7Yyl2HbblYCW8vqI0u
	fZ7GUC5vrKEfFBsXAdZu4bBoAFjch2kgaRN/4LdGMNsAiLiJtliWtXYK4hCiu5tJRn5zCAjz0It
	P6um/h478H5s/Dj+oMmJrx7rR7KWMHyxnF4I9I1xc3FMQqCPRZKl4lPcXm/VMM3s/fbP0lLgUrc
	Yb2BDhIbtLlucFcsrU5qPfXowojXMc8BGxe4d1smhLEslulOHInWejw+Z0isOh2Qxa1FZlx4ISj
	t/6gQljd+qXVVy0hKPkFmhF7ADQqrshIzGwBIa4XrUazdsw==
X-Received: by 2002:a17:90b:350d:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-309f8e0b499mr337365a91.30.1745544497827;
        Thu, 24 Apr 2025 18:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5hMsmPuKWVO8Z7Zo0RkHY/oOcdJ5ctIxDn70mi5u4eOlaPt56pmhJNVbOD2iooGfb//SzPA==
X-Received: by 2002:a17:90b:350d:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-309f8e0b499mr337345a91.30.1745544497385;
        Thu, 24 Apr 2025 18:28:17 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb1asm2160107a91.7.2025.04.24.18.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 18:28:16 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vinith Kumar R <quic_vinithku@quicinc.com>,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next 1/3] wifi: ath12k: change soc name to device name
Date: Fri, 25 Apr 2025 06:58:00 +0530
Message-Id: <20250425012802.698914-2-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uSwcuGqzcZNzZL1Evs1bUh4z3RNPkSSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAwOCBTYWx0ZWRfXwP9dSjFiF+N/ DaCKAoTBAi5yFwFZ7cz9XqnaVHWCGOJOvVPH7ZeCnEKkn7V/KQVOCgo+YqPbgwNkBHfnkq20JQn HQxW1ok/oH432/gMZo2GpE2KlW8Fgyxnzs55qC0xx6AGcpb/7fpDhudyYZQs5Fq7quBZDEthVzz
 Vjohc12J+IR5hp05zKMXRWrCsARj/i8Cp86Ph6RSucfjCgt2B/kNL/uubcxidhAZDtu4+rtxA/p Z4O5qKVumR4fiNasEIpnIecUuRDRUoip3XG53tx4X8S0SMBYQD7yiXf907CdIM4OCFTU+EPV6Gc ts5rdtWHcNbWFJAnU5UdfaXgqINRThs+7ZHOR3PIFM19HuHz3nwME3HZgTelzZzkfT91+MgwN7N
 qS2muBqOglcPHcd17we9Corv7NlpCvRXHvZCOFJMZM47WXAzNi/zWSX0uiYoBcl13ASrbydN
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680ae533 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vYOk1OfDmVSuLYKSXuQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uSwcuGqzcZNzZL1Evs1bUh4z3RNPkSSy
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
X-CRM114-CacheID: sfid-20250424_182820_889533_5E2028FF 
X-CRM114-Status: GOOD (  19.31  )
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

To have consistent nomenclature, replace the use of the term "soc"
with the term "device".

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c   |  4 +--
 drivers/net/wireless/ath/ath12k/core.h   | 16 +++++------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 36 ++++++++++++------------
 drivers/net/wireless/ath/ath12k/dp_tx.c  |  6 ++--
 drivers/net/wireless/ath/ath12k/hal_rx.c |  6 ++--
 5 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 7eccd9cf9036..2cfeb853289d 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1812,9 +1812,9 @@ static int ath12k_core_get_wsi_info(struct ath12k_hw_group *ag,
 		of_node_put(next_rx_endpoint);
 
 		device_count++;
-		if (device_count > ATH12K_MAX_SOCS) {
+		if (device_count > ATH12K_MAX_DEVICES) {
 			ath12k_warn(ab, "device count in DT %d is more than limit %d\n",
-				    device_count, ATH12K_MAX_SOCS);
+				    device_count, ATH12K_MAX_DEVICES);
 			of_node_put(next_wsi_dev);
 			return -EINVAL;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4b8f434e3e9a..00c58fc0cc4b 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -63,8 +63,8 @@
 #define ATH12K_RECONFIGURE_TIMEOUT_HZ		(10 * HZ)
 #define ATH12K_RECOVER_START_TIMEOUT_HZ		(20 * HZ)
 
-#define ATH12K_MAX_SOCS 3
-#define ATH12K_GROUP_MAX_RADIO (ATH12K_MAX_SOCS * MAX_RADIOS)
+#define ATH12K_MAX_DEVICES 3
+#define ATH12K_GROUP_MAX_RADIO (ATH12K_MAX_DEVICES * MAX_RADIOS)
 #define ATH12K_INVALID_GROUP_ID  0xFF
 #define ATH12K_INVALID_DEVICE_ID 0xFF
 
@@ -875,7 +875,7 @@ struct ath12k_board_data {
 	size_t len;
 };
 
-struct ath12k_soc_dp_tx_err_stats {
+struct ath12k_device_dp_tx_err_stats {
 	/* TCL Ring Descriptor unavailable */
 	u32 desc_na[DP_TCL_NUM_RING_MAX];
 	/* Other failures during dp_tx due to mem allocation failure
@@ -884,13 +884,13 @@ struct ath12k_soc_dp_tx_err_stats {
 	atomic_t misc_fail;
 };
 
-struct ath12k_soc_dp_stats {
+struct ath12k_device_dp_stats {
 	u32 err_ring_pkts;
 	u32 invalid_rbm;
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 hal_reo_error[DP_REO_DST_RING_MAX];
-	struct ath12k_soc_dp_tx_err_stats tx_err;
+	struct ath12k_device_dp_tx_err_stats tx_err;
 };
 
 struct ath12k_reg_freq {
@@ -919,7 +919,7 @@ struct ath12k_hw_group {
 	u8 num_probed;
 	u8 num_started;
 	unsigned long flags;
-	struct ath12k_base *ab[ATH12K_MAX_SOCS];
+	struct ath12k_base *ab[ATH12K_MAX_DEVICES];
 
 	/* protects access to this struct */
 	struct mutex mutex;
@@ -933,7 +933,7 @@ struct ath12k_hw_group {
 	struct ath12k_hw *ah[ATH12K_GROUP_MAX_RADIO];
 	u8 num_hw;
 	bool mlo_capable;
-	struct device_node *wsi_node[ATH12K_MAX_SOCS];
+	struct device_node *wsi_node[ATH12K_MAX_DEVICES];
 	struct ath12k_mlo_memory mlo_mem;
 	struct ath12k_hw_link hw_links[ATH12K_GROUP_MAX_RADIO];
 	bool hw_link_id_init_done;
@@ -1043,7 +1043,7 @@ struct ath12k_base {
 
 	/* Current DFS Regulatory */
 	enum ath12k_dfs_region dfs_region;
-	struct ath12k_soc_dp_stats soc_stats;
+	struct ath12k_device_dp_stats device_stats;
 #ifdef CONFIG_ATH12K_DEBUGFS
 	struct dentry *debugfs_soc;
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 1abfbd15f13c..e81a117cbc06 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2592,7 +2592,7 @@ static bool ath12k_dp_rx_check_nwifi_hdr_len_valid(struct ath12k_base *ab,
 	if ((likely(hdr_len <= DP_MAX_NWIFI_HDR_LEN)))
 		return true;
 
-	ab->soc_stats.invalid_rbm++;
+	ab->device_stats.invalid_rbm++;
 	WARN_ON_ONCE(1);
 	return false;
 }
@@ -2755,9 +2755,9 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 			 struct napi_struct *napi, int budget)
 {
 	struct ath12k_hw_group *ag = ab->ag;
-	struct list_head rx_desc_used_list[ATH12K_MAX_SOCS];
+	struct list_head rx_desc_used_list[ATH12K_MAX_DEVICES];
 	struct ath12k_hw_link *hw_links = ag->hw_links;
-	int num_buffs_reaped[ATH12K_MAX_SOCS] = {};
+	int num_buffs_reaped[ATH12K_MAX_DEVICES] = {};
 	struct ath12k_rx_desc_info *desc_info;
 	struct ath12k_dp *dp = &ab->dp;
 	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
@@ -2774,7 +2774,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 
 	__skb_queue_head_init(&msdu_list);
 
-	for (device_id = 0; device_id < ATH12K_MAX_SOCS; device_id++)
+	for (device_id = 0; device_id < ATH12K_MAX_DEVICES; device_id++)
 		INIT_LIST_HEAD(&rx_desc_used_list[device_id]);
 
 	srng = &ab->hal.srng_list[dp->reo_dst_ring[ring_id].ring_id];
@@ -2841,7 +2841,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 		if (push_reason !=
 		    HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
 			dev_kfree_skb_any(msdu);
-			ab->soc_stats.hal_reo_error[ring_id]++;
+			ab->device_stats.hal_reo_error[ring_id]++;
 			continue;
 		}
 
@@ -2891,7 +2891,7 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 	if (!total_msdu_reaped)
 		goto exit;
 
-	for (device_id = 0; device_id < ATH12K_MAX_SOCS; device_id++) {
+	for (device_id = 0; device_id < ATH12K_MAX_DEVICES; device_id++) {
 		if (!num_buffs_reaped[device_id])
 			continue;
 
@@ -3608,9 +3608,9 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 			     int budget)
 {
 	struct ath12k_hw_group *ag = ab->ag;
-	struct list_head rx_desc_used_list[ATH12K_MAX_SOCS];
+	struct list_head rx_desc_used_list[ATH12K_MAX_DEVICES];
 	u32 msdu_cookies[HAL_NUM_RX_MSDUS_PER_LINK_DESC];
-	int num_buffs_reaped[ATH12K_MAX_SOCS] = {};
+	int num_buffs_reaped[ATH12K_MAX_DEVICES] = {};
 	struct dp_link_desc_bank *link_desc_banks;
 	enum hal_rx_buf_return_buf_manager rbm;
 	struct hal_rx_msdu_link *link_desc_va;
@@ -3632,7 +3632,7 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 	tot_n_bufs_reaped = 0;
 	quota = budget;
 
-	for (device_id = 0; device_id < ATH12K_MAX_SOCS; device_id++)
+	for (device_id = 0; device_id < ATH12K_MAX_DEVICES; device_id++)
 		INIT_LIST_HEAD(&rx_desc_used_list[device_id]);
 
 	reo_except = &ab->dp.reo_except_ring;
@@ -3646,7 +3646,7 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 	while (budget &&
 	       (reo_desc = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
 		drop = false;
-		ab->soc_stats.err_ring_pkts++;
+		ab->device_stats.err_ring_pkts++;
 
 		ret = ath12k_hal_desc_reo_parse_err(ab, reo_desc, &paddr,
 						    &desc_bank);
@@ -3673,7 +3673,7 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 		if (rbm != partner_ab->dp.idle_link_rbm &&
 		    rbm != HAL_RX_BUF_RBM_SW3_BM &&
 		    rbm != partner_ab->hw_params->hal_params->rx_buf_rbm) {
-			ab->soc_stats.invalid_rbm++;
+			ab->device_stats.invalid_rbm++;
 			ath12k_warn(ab, "invalid return buffer manager %d\n", rbm);
 			ath12k_dp_rx_link_desc_return(partner_ab, reo_desc,
 						      HAL_WBM_REL_BM_ACT_REL_MSDU);
@@ -3720,7 +3720,7 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 
 	spin_unlock_bh(&srng->lock);
 
-	for (device_id = 0; device_id < ATH12K_MAX_SOCS; device_id++) {
+	for (device_id = 0; device_id < ATH12K_MAX_DEVICES; device_id++) {
 		if (!num_buffs_reaped[device_id])
 			continue;
 
@@ -3836,7 +3836,7 @@ static bool ath12k_dp_rx_h_reo_err(struct ath12k *ar, struct sk_buff *msdu,
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
 	bool drop = false;
 
-	ar->ab->soc_stats.reo_error[rxcb->err_code]++;
+	ar->ab->device_stats.reo_error[rxcb->err_code]++;
 
 	switch (rxcb->err_code) {
 	case HAL_REO_DEST_RING_ERROR_CODE_DESC_ADDR_ZERO:
@@ -3909,7 +3909,7 @@ static bool ath12k_dp_rx_h_rxdma_err(struct ath12k *ar,  struct sk_buff *msdu,
 	bool drop = false;
 	u32 err_bitmap;
 
-	ar->ab->soc_stats.rxdma_error[rxcb->err_code]++;
+	ar->ab->device_stats.rxdma_error[rxcb->err_code]++;
 
 	switch (rxcb->err_code) {
 	case HAL_REO_ENTR_RING_RXDMA_ECODE_DECRYPT_ERR:
@@ -3968,7 +3968,7 @@ static void ath12k_dp_rx_wbm_err(struct ath12k *ar,
 int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 				 struct napi_struct *napi, int budget)
 {
-	struct list_head rx_desc_used_list[ATH12K_MAX_SOCS];
+	struct list_head rx_desc_used_list[ATH12K_MAX_DEVICES];
 	struct ath12k_hw_group *ag = ab->ag;
 	struct ath12k *ar;
 	struct ath12k_dp *dp = &ab->dp;
@@ -3979,7 +3979,7 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 	struct sk_buff_head msdu_list, scatter_msdu_list;
 	struct ath12k_skb_rxcb *rxcb;
 	void *rx_desc;
-	int num_buffs_reaped[ATH12K_MAX_SOCS] = {};
+	int num_buffs_reaped[ATH12K_MAX_DEVICES] = {};
 	int total_num_buffs_reaped = 0;
 	struct ath12k_rx_desc_info *desc_info;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
@@ -3991,7 +3991,7 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 	__skb_queue_head_init(&msdu_list);
 	__skb_queue_head_init(&scatter_msdu_list);
 
-	for (device_id = 0; device_id < ATH12K_MAX_SOCS; device_id++)
+	for (device_id = 0; device_id < ATH12K_MAX_DEVICES; device_id++)
 		INIT_LIST_HEAD(&rx_desc_used_list[device_id]);
 
 	srng = &ab->hal.srng_list[dp->rx_rel_ring.ring_id];
@@ -4115,7 +4115,7 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 	if (!total_num_buffs_reaped)
 		goto done;
 
-	for (device_id = 0; device_id < ATH12K_MAX_SOCS; device_id++) {
+	for (device_id = 0; device_id < ATH12K_MAX_DEVICES; device_id++) {
 		if (!num_buffs_reaped[device_id])
 			continue;
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 2136eeb278af..128fa0e3c229 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -350,7 +350,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 	default:
 		/* TODO: Take care of other encap modes as well */
 		ret = -EINVAL;
-		atomic_inc(&ab->soc_stats.tx_err.misc_fail);
+		atomic_inc(&ab->device_stats.tx_err.misc_fail);
 		goto fail_remove_tx_buf;
 	}
 
@@ -373,7 +373,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 map:
 	ti.paddr = dma_map_single(ab->dev, skb->data, skb->len, DMA_TO_DEVICE);
 	if (dma_mapping_error(ab->dev, ti.paddr)) {
-		atomic_inc(&ab->soc_stats.tx_err.misc_fail);
+		atomic_inc(&ab->device_stats.tx_err.misc_fail);
 		ath12k_warn(ab, "failed to DMA map data Tx buffer\n");
 		ret = -ENOMEM;
 		goto fail_remove_tx_buf;
@@ -448,7 +448,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		 * desc because the desc is directly enqueued onto hw queue.
 		 */
 		ath12k_hal_srng_access_end(ab, tcl_ring);
-		ab->soc_stats.tx_err.desc_na[ti.ring_id]++;
+		ab->device_stats.tx_err.desc_na[ti.ring_id]++;
 		spin_unlock_bh(&tcl_ring->lock);
 		ret = -ENOMEM;
 
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index 98eeccc68fcd..38af714b313e 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -326,7 +326,7 @@ int ath12k_hal_desc_reo_parse_err(struct ath12k_base *ab,
 				    HAL_REO_DEST_RING_INFO0_PUSH_REASON);
 	err_code = le32_get_bits(desc->info0,
 				 HAL_REO_DEST_RING_INFO0_ERROR_CODE);
-	ab->soc_stats.reo_error[err_code]++;
+	ab->device_stats.reo_error[err_code]++;
 
 	if (push_reason != HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED &&
 	    push_reason != HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
@@ -381,7 +381,7 @@ int ath12k_hal_wbm_desc_parse_err(struct ath12k_base *ab, void *desc,
 		val = le32_get_bits(wbm_desc->buf_addr_info.info1,
 				    BUFFER_ADDR_INFO1_RET_BUF_MGR);
 		if (val != HAL_RX_BUF_RBM_SW3_BM) {
-			ab->soc_stats.invalid_rbm++;
+			ab->device_stats.invalid_rbm++;
 			return -EINVAL;
 		}
 
@@ -393,7 +393,7 @@ int ath12k_hal_wbm_desc_parse_err(struct ath12k_base *ab, void *desc,
 		val = le32_get_bits(wbm_cc_desc->info0,
 				    HAL_WBM_RELEASE_RX_CC_INFO0_RBM);
 		if (val != HAL_RX_BUF_RBM_SW3_BM) {
-			ab->soc_stats.invalid_rbm++;
+			ab->device_stats.invalid_rbm++;
 			return -EINVAL;
 		}
 
-- 
2.17.1


