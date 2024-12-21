Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90669E7718B
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 04:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFPH19U57bMJl0mHHRuV0xiYp+JLOwJFCA4VbCUHSyw=; b=s/3foyIv8XFlrSjy+VLVDZwDY1
	AVX3qIvHRCIVd5Y0CfsOMVN1NthgdAuHDwd6NOiKdoUm+m++XrDHoHV3bd7FmkTMCm/NX2ivmXQo7
	HOtr0PyDQbzHxENzyn2RF3Qs70gxDr6tT0eyl2DYdLbXne/QE27k43GAdScPHJn+7Tm4KnS/iF3d7
	N/fxkCBB63VMBdl/DIsSz0VyO+lu80jh7wc5NUUyCsNVLb7l/DqKXj6w4Jzslr7GibfQCDHGRdgi2
	k+xb4ML8fZzWE1xcyjyZeTuh5ZUZwAGCgXqNP+sI8YXA5J+Z8s0YLWNqMfdj7V82X5ZP2L0GwKpm/
	kftKFhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr8v-00000006XP5-13G1
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 04:31:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr8s-00000006XOP-2vII
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 04:31:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLgmRR012342;
	Sat, 21 Dec 2024 04:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wFPH19U57bMJl0mHHRuV0xiYp+JLOwJFCA4VbCUHSyw=; b=gQTMNV+1TUbcveKF
	98T0CrjVv/GHlm4S3VPpgWR9liuGcMun2VSBr7sKzEah9GOy7kQQPY5zcm+Zl/Qa
	w/KaVD+plk7xvKb3akHIof3Qhj2dT1vBVVJ9WGOBUwxYKnRfvViv1leXjsxbuKO2
	8RC2NE8PcPoUaWXIi8ywcUb7fbLgJfxqj3v3wEWaQfVBq3XkgjE7hkod3R0AWzvi
	i7Nx+PSua3l2Mi8sjZwnu/oggfSdIH+I18sji9V3sk7sAG3zXTPkEZwg+UaF3lJz
	3HH1Fu601AT1VFC4peuAigKpMa0sUUdIEE2pTo6+dLv9aPDWzAJxBOyPtkrXcQt+
	G7SDEg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ngr08nj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL4V5Pd012847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:05 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 20:31:03 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 02/14] wifi: ath12k: Enable filter config for monitor destination ring
Date: Sat, 21 Dec 2024 10:00:02 +0530
Message-ID: <20241221043014.1252841-3-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
References: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rt9_SMgNL7Jx9EqFE8UGf1xtXzLb6K3g
X-Proofpoint-GUID: rt9_SMgNL7Jx9EqFE8UGf1xtXzLb6K3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412210035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_203106_752695_F03442EC 
X-CRM114-Status: GOOD (  16.22  )
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

Add provision to configure monitor filter for the destination
ring. These filters are used for requesting statistics or monitor mode
through the monitor destination ring.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    | 49 +++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp_tx.c | 75 ++++++++++++++++++++-----
 2 files changed, 109 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 475c053faaa1..787e8e20658f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -770,8 +770,22 @@ enum htt_stats_internal_ppdu_frametype {
 #define HTT_RX_RING_SELECTION_CFG_CMD_INFO0_RING_ID	GENMASK(23, 16)
 #define HTT_RX_RING_SELECTION_CFG_CMD_INFO0_SS		BIT(24)
 #define HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PS		BIT(25)
-#define HTT_RX_RING_SELECTION_CFG_CMD_INFO1_BUF_SIZE	GENMASK(15, 0)
-#define HTT_RX_RING_SELECTION_CFG_CMD_OFFSET_VALID      BIT(26)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO0_OFFSET_VALID	BIT(26)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO0_DROP_THRES_VAL	BIT(27)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO0_EN_RXMON		BIT(28)
+
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO1_BUF_SIZE		GENMASK(15, 0)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO1_CONF_LEN_MGMT	GENMASK(18, 16)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO1_CONF_LEN_CTRL	GENMASK(21, 19)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO1_CONF_LEN_DATA	GENMASK(24, 22)
+
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO2_DROP_THRESHOLD	GENMASK(9, 0)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO2_EN_LOG_MGMT_TYPE	BIT(17)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO2_EN_CTRL_TYPE	BIT(18)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO2_EN_LOG_DATA_TYPE	BIT(19)
+
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO3_EN_TLV_PKT_OFFSET	BIT(0)
+#define HTT_RX_RING_SELECTION_CFG_CMD_INFO3_PKT_TLV_OFFSET	GENMASK(14, 1)
 
 #define HTT_RX_RING_SELECTION_CFG_RX_PACKET_OFFSET      GENMASK(15, 0)
 #define HTT_RX_RING_SELECTION_CFG_RX_HEADER_OFFSET      GENMASK(31, 16)
@@ -800,6 +814,7 @@ enum htt_rx_filter_tlv_flags {
 	HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS	= BIT(10),
 	HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT	= BIT(11),
 	HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE	= BIT(12),
+	HTT_RX_FILTER_TLV_FLAGS_PPDU_START_USER_INFO	= BIT(13),
 };
 
 enum htt_rx_mgmt_pkt_filter_tlv_flags0 {
@@ -1088,6 +1103,21 @@ enum htt_rx_data_pkt_filter_tlv_flasg3 {
 		HTT_RX_FILTER_TLV_FLAGS_PER_MSDU_HEADER | \
 		HTT_RX_FILTER_TLV_FLAGS_ATTENTION)
 
+#define HTT_RX_MON_FILTER_TLV_FLAGS_MON_DEST_RING \
+	(HTT_RX_FILTER_TLV_FLAGS_MPDU_START | \
+	HTT_RX_FILTER_TLV_FLAGS_MSDU_START | \
+	HTT_RX_FILTER_TLV_FLAGS_RX_PACKET | \
+	HTT_RX_FILTER_TLV_FLAGS_MSDU_END | \
+	HTT_RX_FILTER_TLV_FLAGS_MPDU_END | \
+	HTT_RX_FILTER_TLV_FLAGS_PACKET_HEADER | \
+	HTT_RX_FILTER_TLV_FLAGS_PER_MSDU_HEADER | \
+	HTT_RX_FILTER_TLV_FLAGS_PPDU_START | \
+	HTT_RX_FILTER_TLV_FLAGS_PPDU_END | \
+	HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS | \
+	HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT | \
+	HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE | \
+	HTT_RX_FILTER_TLV_FLAGS_PPDU_START_USER_INFO)
+
 /* msdu start. mpdu end, attention, rx hdr tlv's are not subscribed */
 #define HTT_RX_TLV_FLAGS_RXDMA_RING \
 		(HTT_RX_FILTER_TLV_FLAGS_MPDU_START | \
@@ -1116,6 +1146,10 @@ struct htt_rx_ring_selection_cfg_cmd {
 	__le32 info3;
 } __packed;
 
+#define HTT_RX_RING_TLV_DROP_THRESHOLD_VALUE	32
+#define HTT_RX_RING_DEFAULT_DMA_LENGTH		0x7
+#define HTT_RX_RING_PKT_TLV_OFFSET		0x1
+
 struct htt_rx_ring_tlv_filter {
 	u32 rx_filter; /* see htt_rx_filter_tlv_flags */
 	u32 pkt_filter_flags0; /* MGMT */
@@ -1133,6 +1167,17 @@ struct htt_rx_ring_tlv_filter {
 	u16 rx_mpdu_start_wmask;
 	u16 rx_mpdu_end_wmask;
 	u32 rx_msdu_end_wmask;
+	u32 conf_len_ctrl;
+	u32 conf_len_mgmt;
+	u32 conf_len_data;
+	u16 rx_drop_threshold;
+	bool enable_log_mgmt_type;
+	bool enable_log_ctrl_type;
+	bool enable_log_data_type;
+	bool enable_rx_tlv_offset;
+	u16 rx_tlv_offset;
+	bool drop_threshold_valid;
+	bool rxmon_disable;
 };
 
 #define HTT_STATS_FRAME_CTRL_TYPE_MGMT  0x0
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 13bc2d92e09c..b8f0df6f7a05 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -1077,15 +1077,46 @@ int ath12k_dp_tx_htt_rx_filter_setup(struct ath12k_base *ab, u32 ring_id,
 	cmd->info0 |= le32_encode_bits(!!(params.flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP),
 				       HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PS);
 	cmd->info0 |= le32_encode_bits(tlv_filter->offset_valid,
-				       HTT_RX_RING_SELECTION_CFG_CMD_OFFSET_VALID);
+				       HTT_RX_RING_SELECTION_CFG_CMD_INFO0_OFFSET_VALID);
+	cmd->info0 |=
+		le32_encode_bits(tlv_filter->drop_threshold_valid,
+				 HTT_RX_RING_SELECTION_CFG_CMD_INFO0_DROP_THRES_VAL);
+	cmd->info0 |= le32_encode_bits(!tlv_filter->rxmon_disable,
+				       HTT_RX_RING_SELECTION_CFG_CMD_INFO0_EN_RXMON);
+
 	cmd->info1 = le32_encode_bits(rx_buf_size,
 				      HTT_RX_RING_SELECTION_CFG_CMD_INFO1_BUF_SIZE);
+	cmd->info1 |= le32_encode_bits(tlv_filter->conf_len_mgmt,
+				       HTT_RX_RING_SELECTION_CFG_CMD_INFO1_CONF_LEN_MGMT);
+	cmd->info1 |= le32_encode_bits(tlv_filter->conf_len_ctrl,
+				       HTT_RX_RING_SELECTION_CFG_CMD_INFO1_CONF_LEN_CTRL);
+	cmd->info1 |= le32_encode_bits(tlv_filter->conf_len_data,
+				       HTT_RX_RING_SELECTION_CFG_CMD_INFO1_CONF_LEN_DATA);
 	cmd->pkt_type_en_flags0 = cpu_to_le32(tlv_filter->pkt_filter_flags0);
 	cmd->pkt_type_en_flags1 = cpu_to_le32(tlv_filter->pkt_filter_flags1);
 	cmd->pkt_type_en_flags2 = cpu_to_le32(tlv_filter->pkt_filter_flags2);
 	cmd->pkt_type_en_flags3 = cpu_to_le32(tlv_filter->pkt_filter_flags3);
 	cmd->rx_filter_tlv = cpu_to_le32(tlv_filter->rx_filter);
 
+	cmd->info2 = le32_encode_bits(tlv_filter->rx_drop_threshold,
+				      HTT_RX_RING_SELECTION_CFG_CMD_INFO2_DROP_THRESHOLD);
+	cmd->info2 |=
+		le32_encode_bits(tlv_filter->enable_log_mgmt_type,
+				 HTT_RX_RING_SELECTION_CFG_CMD_INFO2_EN_LOG_MGMT_TYPE);
+	cmd->info2 |=
+		le32_encode_bits(tlv_filter->enable_log_ctrl_type,
+				 HTT_RX_RING_SELECTION_CFG_CMD_INFO2_EN_CTRL_TYPE);
+	cmd->info2 |=
+		le32_encode_bits(tlv_filter->enable_log_data_type,
+				 HTT_RX_RING_SELECTION_CFG_CMD_INFO2_EN_LOG_DATA_TYPE);
+
+	cmd->info3 =
+		le32_encode_bits(tlv_filter->enable_rx_tlv_offset,
+				 HTT_RX_RING_SELECTION_CFG_CMD_INFO3_EN_TLV_PKT_OFFSET);
+	cmd->info3 |=
+		le32_encode_bits(tlv_filter->rx_tlv_offset,
+				 HTT_RX_RING_SELECTION_CFG_CMD_INFO3_PKT_TLV_OFFSET);
+
 	if (tlv_filter->offset_valid) {
 		cmd->rx_packet_offset =
 			le32_encode_bits(tlv_filter->rx_packet_offset,
@@ -1210,15 +1241,28 @@ int ath12k_dp_tx_htt_monitor_mode_ring_config(struct ath12k *ar, bool reset)
 int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
 {
 	struct ath12k_base *ab = ar->ab;
-	struct ath12k_dp *dp = &ab->dp;
 	struct htt_rx_ring_tlv_filter tlv_filter = {0};
-	int ret, ring_id;
+	int ret, ring_id, i;
 
-	ring_id = dp->rxdma_mon_buf_ring.refill_buf_ring.ring_id;
 	tlv_filter.offset_valid = false;
 
 	if (!reset) {
-		tlv_filter.rx_filter = HTT_RX_MON_FILTER_TLV_FLAGS_MON_BUF_RING;
+		tlv_filter.rx_filter = HTT_RX_MON_FILTER_TLV_FLAGS_MON_DEST_RING;
+
+		tlv_filter.drop_threshold_valid = true;
+		tlv_filter.rx_drop_threshold = HTT_RX_RING_TLV_DROP_THRESHOLD_VALUE;
+
+		tlv_filter.enable_log_mgmt_type = true;
+		tlv_filter.enable_log_ctrl_type = true;
+		tlv_filter.enable_log_data_type = true;
+
+		tlv_filter.conf_len_ctrl = HTT_RX_RING_DEFAULT_DMA_LENGTH;
+		tlv_filter.conf_len_mgmt = HTT_RX_RING_DEFAULT_DMA_LENGTH;
+		tlv_filter.conf_len_data = HTT_RX_RING_DEFAULT_DMA_LENGTH;
+
+		tlv_filter.enable_rx_tlv_offset = true;
+		tlv_filter.rx_tlv_offset = HTT_RX_RING_PKT_TLV_OFFSET;
+
 		tlv_filter.pkt_filter_flags0 =
 					HTT_RX_MON_FP_MGMT_FILTER_FLAGS0 |
 					HTT_RX_MON_MO_MGMT_FILTER_FLAGS0;
@@ -1236,14 +1280,19 @@ int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
 	}
 
 	if (ab->hw_params->rxdma1_enable) {
-		ret = ath12k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id, 0,
-						       HAL_RXDMA_MONITOR_BUF,
-						       DP_RXDMA_REFILL_RING_SIZE,
-						       &tlv_filter);
-		if (ret) {
-			ath12k_err(ab,
-				   "failed to setup filter for monitor buf %d\n", ret);
-			return ret;
+		for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++) {
+			ring_id = ar->dp.rxdma_mon_dst_ring[i].ring_id;
+			ret = ath12k_dp_tx_htt_rx_filter_setup(ar->ab, ring_id,
+							       ar->dp.mac_id + i,
+							       HAL_RXDMA_MONITOR_DST,
+							       DP_RXDMA_REFILL_RING_SIZE,
+							       &tlv_filter);
+			if (ret) {
+				ath12k_err(ab,
+					   "failed to setup filter for monitor buf %d\n",
+					   ret);
+				return ret;
+			}
 		}
 	}
 
-- 
2.34.1


