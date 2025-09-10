Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9CACA0FED
	for <ath12k@archiver.kernel.org>; Wed, 10 Sep 2025 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo05GsjZIQFdRZ4IQuHOW9cwMxqp7eY6xChonEe590Q=; b=l/SLL9J764cmtwGTDSD6OfYvqj
	QO3TfzXy0xlVjGoCrcbv/gNTJeqS3uYO92OPeV3k5jAmcWXJGMfRMXqt1YDO4zae+a38rPQUrvukF
	UNAPrWo+Y0cDFKwCm1kZlGqBmKfAQJCSYbvTqk7knavI7b0JZO8mQI78ckwaF4XaDgI0niSOetYEo
	DsjuBf65cE8PK+IeKMntWCKX0Dip2+mdoOFB8uChQccrxQTLS2Jsc/Na4JzVvB1l9/6sNdMPKiIT/
	75wgL0bPB/pGO+L3+uvo39MSxHCixI+MiPBNUZOjQkoFkPWp7WkgAGW1BxySEJIlRHHqeHXbiT5lA
	I+mY/dpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwPLB-0000000FzcE-15g6;
	Wed, 10 Sep 2025 18:14:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwPL8-0000000FzZ0-2odr
	for ath12k@lists.infradead.org;
	Wed, 10 Sep 2025 18:14:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgFo3001325;
	Wed, 10 Sep 2025 18:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oo05GsjZIQFdRZ4IQuHOW9cwMxqp7eY6xChonEe590Q=; b=CEh0D3JhQxETcECI
	olGhM8UEpVOl0ez1lQTy9hCsm66Myb7P/k0D9KCQEau7l3HgJWTUs/SamaBSSEJ4
	8gioGN/G7SqYYUO8MCllEFkA5+4EdH/pmlY/wHCBL4gBZEGizaC4/E8mQDMhOuNH
	8n+s9TAV41oxwwEWO0XQXN5CqPUmw4T3M7zFs5JX9x54Q4cEEBslcfiKXYQWEp0v
	mldXzlg6zimgASwxKAFYOvmMd+so26LKegQkljUZ2igLohT//52ZMPq1Ii08G3lT
	nGPGUlN+4IC7EIle04urMhZFYn6vtNeiUtACHcfMiz/3rIr3cbeYndCZPL8kNS8L
	e8sr2w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhe1ny9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 18:14:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58AIEfsZ000404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 18:14:41 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 10 Sep 2025 11:14:40 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng v2 7/8] wifi: ath12k: Remove hal_rx_ops and merge into hal_ops
Date: Wed, 10 Sep 2025 23:44:13 +0530
Message-ID: <20250910181414.2062280-8-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
References: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UrBEiBg2x_6GpiYWse946p6gnuqRrqCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXx4H4HMzSaQhz
 DJHGFRbQDyNIxu30zsPsQ96QqxiA9qcUdQG6jgV9u2GOkCxOsWuxZ2yHo4DxLHJCJscektyHpJe
 cNT6ZWFnlIUUn8IyMN/Y6n5wsRkmo9jVDQUZ68+bbuN7oCVYTBDCrtM3+SAPCUv5pm0saIewnlW
 iN2HtQNuBcSxdsVzQeTqdLMWrUeaER+Wu/XNLYCLO/l8dp2lKdMSPDeZa8MSuJdfQzGDONV1eHQ
 kQ06V0mmk3osTq3yCLBO2pT+oPDuanXGrj9BNx5V6/oDdoVFIR8q+rCt4yQhPh5S0Cjnepa86Wh
 65FZwnR+WWNnVlB8UST8tKNLkdtBPCI2siWZNKW2en9YyP2tKEGEAKZZYI9yYUr144z5eJ8jNWg
 okCJVp+g
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c1c012 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=u5Y36L8z59rl5QDsvE8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UrBEiBg2x_6GpiYWse946p6gnuqRrqCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_111442_718228_C3BA9DEC 
X-CRM114-Status: GOOD (  15.07  )
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

Move following ops from hal_rx_ops to hal_ops to simplify the HAL interface.

rx_desc_get_l3_pad_bytes
rx_desc_get_mpdu_start_tag
rx_desc_get_mpdu_ppdu_id
rx_desc_get_msdu_payload

Remove the hal_rx_ops as they become unused with this change.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h      |  2 --
 drivers/net/wireless/ath/ath12k/dp_mon.c    |  2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h     |  6 +++---
 drivers/net/wireless/ath/ath12k/hal.c       | 22 +++++++--------------
 drivers/net/wireless/ath/ath12k/hal.h       | 14 ++++---------
 drivers/net/wireless/ath/ath12k/wifi7/pci.c |  2 --
 6 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index b68f063283fe..9ae98556dd94 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1196,8 +1196,6 @@ struct ath12k_base {
 		bool fw_features_valid;
 	} fw;
 
-	const struct hal_rx_ops *hal_rx_ops;
-
 	struct completion restart_completed;
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 0ae500ec3463..3315a9e3d40a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2046,7 +2046,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
 
 		rx_desc = (struct hal_rx_desc *)head_msdu->data;
 		hdr_desc =
-			ab->hal_rx_ops->rx_desc_get_msdu_payload(rx_desc);
+			ab->hw_params->hal_ops->rx_desc_get_msdu_payload(rx_desc);
 
 		/* Base size */
 		wh = (struct ieee80211_hdr_3addr *)hdr_desc;
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 432707d60fca..ff214bff389b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -109,7 +109,7 @@ static inline u16 ath12k_dp_rx_h_frag_no(struct ath12k_base *ab,
 static inline u8 ath12k_dp_rx_h_l3pad(struct ath12k_base *ab,
 				      struct hal_rx_desc *desc)
 {
-	return ab->hal_rx_ops->rx_desc_get_l3_pad_bytes(desc);
+	return ab->hw_params->hal_ops->rx_desc_get_l3_pad_bytes(desc);
 }
 
 static inline void ath12k_dp_rx_desc_end_tlv_copy(struct ath12k_base *ab,
@@ -129,7 +129,7 @@ static inline void ath12k_dp_rxdesc_set_msdu_len(struct ath12k_base *ab,
 static inline u32 ath12k_dp_rxdesc_get_ppduid(struct ath12k_base *ab,
 					      struct hal_rx_desc *rx_desc)
 {
-	return ab->hal_rx_ops->rx_desc_get_mpdu_ppdu_id(rx_desc);
+	return ab->hw_params->hal_ops->rx_desc_get_mpdu_ppdu_id(rx_desc);
 }
 
 static inline bool ath12k_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
@@ -137,7 +137,7 @@ static inline bool ath12k_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
 {
 	u32 tlv_tag;
 
-	tlv_tag = ab->hal_rx_ops->rx_desc_get_mpdu_start_tag(rx_desc);
+	tlv_tag = ab->hw_params->hal_ops->rx_desc_get_mpdu_start_tag(rx_desc);
 
 	return tlv_tag == HAL_RX_MPDU_START;
 }
diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index db6294ba6771..a14a7d8dc69f 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -406,13 +406,6 @@ static int ath12k_hal_srng_create_config_qcn9274(struct ath12k_base *ab)
 	return 0;
 }
 
-const struct hal_rx_ops hal_rx_qcn9274_compact_ops = {
-	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274,
-	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
-	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_qcn9274,
-};
-EXPORT_SYMBOL(hal_rx_qcn9274_compact_ops);
-
 const struct hal_ops hal_qcn9274_ops = {
 	.create_srng_config = ath12k_hal_srng_create_config_qcn9274,
 	.tcl_to_wbm_rbm_map = ath12k_hal_qcn9274_tcl_to_wbm_rbm_map,
@@ -423,6 +416,9 @@ const struct hal_ops hal_qcn9274_ops = {
 	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcn9274,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcn9274,
 	.rx_desc_get_desc_size = ath12k_hal_get_rx_desc_size_qcn9274,
+	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274,
+	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
+	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_qcn9274,
 };
 EXPORT_SYMBOL(hal_qcn9274_ops);
 
@@ -550,14 +546,6 @@ static int ath12k_hal_srng_create_config_wcn7850(struct ath12k_base *ab)
 	return 0;
 }
 
-const struct hal_rx_ops hal_rx_wcn7850_ops = {
-	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850,
-	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
-	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_wcn7850,
-	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_wcn7850,
-};
-EXPORT_SYMBOL(hal_rx_wcn7850_ops);
-
 const struct hal_ops hal_wcn7850_ops = {
 	.create_srng_config = ath12k_hal_srng_create_config_wcn7850,
 	.tcl_to_wbm_rbm_map = ath12k_hal_wcn7850_tcl_to_wbm_rbm_map,
@@ -568,6 +556,10 @@ const struct hal_ops hal_wcn7850_ops = {
 	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_wcn7850,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_wcn7850,
 	.rx_desc_get_desc_size = ath12k_hal_get_rx_desc_size_wcn7850,
+	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850,
+	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
+	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_wcn7850,
+	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_wcn7850,
 };
 EXPORT_SYMBOL(hal_wcn7850_ops);
 
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 37593bb7953b..692d495d01c9 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1578,13 +1578,6 @@ enum nl80211_he_ru_alloc ath12k_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones)
 	return ret;
 }
 
-struct hal_rx_ops {
-	u8 (*rx_desc_get_l3_pad_bytes)(struct hal_rx_desc *desc);
-	u32 (*rx_desc_get_mpdu_start_tag)(struct hal_rx_desc *desc);
-	u32 (*rx_desc_get_mpdu_ppdu_id)(struct hal_rx_desc *desc);
-	u8 *(*rx_desc_get_msdu_payload)(struct hal_rx_desc *desc);
-};
-
 struct hal_ops {
 	int (*create_srng_config)(struct ath12k_base *ab);
 	const struct ath12k_hal_tcl_to_wbm_rbm_map *tcl_to_wbm_rbm_map;
@@ -1601,14 +1594,15 @@ struct hal_ops {
 				     struct hal_rx_desc *rx_desc,
 				     struct hal_rx_desc *ldesc);
 	u32 (*rx_desc_get_desc_size)(void);
+	u32 (*rx_desc_get_mpdu_start_tag)(struct hal_rx_desc *desc);
+	u32 (*rx_desc_get_mpdu_ppdu_id)(struct hal_rx_desc *desc);
+	u8 (*rx_desc_get_l3_pad_bytes)(struct hal_rx_desc *desc);
+	u8 *(*rx_desc_get_msdu_payload)(struct hal_rx_desc *desc);
 };
 
 extern const struct hal_ops hal_qcn9274_ops;
 extern const struct hal_ops hal_wcn7850_ops;
 
-extern const struct hal_rx_ops hal_rx_qcn9274_compact_ops;
-extern const struct hal_rx_ops hal_rx_wcn7850_ops;
-
 u32 ath12k_hal_reo_qdesc_size(u32 ba_window_size, u8 tid);
 void ath12k_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
 				int tid, u32 ba_window_size,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index abdb3b8ff658..ba8c19c24ae6 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -101,7 +101,6 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
 		ab->static_window_map = true;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
-		ab->hal_rx_ops = &hal_rx_qcn9274_compact_ops;
 		ath12k_wifi7_pci_read_hw_version(ab, &soc_hw_version_major,
 						 &soc_hw_version_minor);
 		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
@@ -124,7 +123,6 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
-		ab->hal_rx_ops = &hal_rx_wcn7850_ops;
 		ath12k_wifi7_pci_read_hw_version(ab, &soc_hw_version_major,
 						 &soc_hw_version_minor);
 		ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
-- 
2.34.1


