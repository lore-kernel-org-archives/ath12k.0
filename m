Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BBDE7719E
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 07:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOMrKbIqyF/o606mVlfiwGH2WMWjNaK8c0+TIUblyug=; b=b/yQTJPvUwsz5K/8R+zjdpnRiR
	6BM95zUg1vWY+3rQM8AaxTfMyId/hDb73eB+371H+r+Tj8d9tAr+KpKxNaM30Td1T5GxUkA+KsI7D
	O/quWYLuJ0cJ8+19/X011o0y4w/4G/e7WMivXN0yefOgGB5kc0M4Zer8s4vlCJBV/up0MEK39kSm+
	ic2Dj/cdZMUMLjm84zs41c4tvEyU3WVXkhuN8IArS8m8MvqXPdMKn1Mr+10+9Grvu2gm4voxnjS1i
	bCnTHLJQii/DcPcR1bFsZOOLNBSVTk4fwGMmUZ9t13JlSYeaSAtSgX9pikQV85OxQnpFCOu+m5Puc
	vRZiYCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEja-00000004EDc-2CX8
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 07:19:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEiK-00000004E3g-2hKU
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 07:18:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CMnBp4012480;
	Mon, 13 Jan 2025 07:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zOMrKbIqyF/o606mVlfiwGH2WMWjNaK8c0+TIUblyug=; b=NnnCmk8fsvNOdI0+
	FObO4tJwagxcCqQIO5nj87/+t+VsolpxuAoLMHaQSdRcqRt4SryVRzMxXHLojjoB
	uvdj5404BSc5kO6tLyzmgz1zExLrLCtiIInftimPZa53cDxrWH1a/+N8sdY8srbP
	MHCQif5P1ElUxSM6eed0wMNYLGGymw6xiEfu749IcssubeISmp8cwxNpf7G7cAvl
	SFaOQyfJ3hd6u5BfuuhnEb5YKRfsnX0e/yXq3AC/RUzHCffJpd9LKtEcCkICHvPR
	r/DTySpxAFueMtcfJe9BfxT5UBKrvX84VEow0Re/EG9PGqx3kjJFfRna6bT3Mm2r
	e0EwoQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44484x9ue0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:18:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D7IIeK019631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:18:18 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 23:18:17 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v4 3/3] wifi: ath12k: Dump additional PDEV receive rate HTT stats
Date: Mon, 13 Jan 2025 15:17:58 +0800
Message-ID: <20250113071758.19589-4-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113071758.19589-1-quic_lingbok@quicinc.com>
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iQO-eBnAyoxdP1KVOFtxbcmG1TNplETY
X-Proofpoint-GUID: iQO-eBnAyoxdP1KVOFtxbcmG1TNplETY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=840 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_231820_811310_5FC1894A 
X-CRM114-Status: GOOD (  14.44  )
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

Support to dump additional PDEV receive rate stats through HTT debugfs
stats type 30.

Sample output:
------------------
echo 30 > /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats
HTT_RX_PDEV_RATE_EXT_STATS_TLV:
rssi_mgmt_in_dbm = -48
rx_stbc_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
ul_ofdma_rx_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
rx_11ax_su_txbf_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:9, 6:72, 7:41, 8:1, 9:0, 10:0, 11:0, 12:0, 13:0
rx_11ax_mu_txbf_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
rx_11ax_dl_ofdma_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
rx_bw_ext =  0:1395, 1:0, 2:0, 3:0, 4:0
rx_su_punctured_mode =  0:0, 1:0, 2:0, 3:0, 4:0
rx_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:14, 6:149, 7:44, 8:1, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
rx_gi_ext[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:14, 6:149, 7:44, 8:1, 9:0, 10:0, 11:0, 12:0, 13:0
rx_gi_ext[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
rx_gi_ext[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
rx_gi_ext[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
ul_ofdma_rx_gi_ext[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
ul_ofdma_rx_gi_ext[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
ul_ofdma_rx_gi_ext[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
ul_ofdma_rx_gi_ext[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v4:
1.used tab(s) to align the = to match the existing code

v3:
1.no change

v2:
1.use TAB to be consistent with existing code

.../wireless/ath/ath12k/debugfs_htt_stats.c   | 74 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 32 ++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index a3e4b33e5ffa..db87356cc580 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -4232,6 +4232,77 @@ ath12k_htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static inline void
+ath12k_htt_print_rx_pdev_rate_ext_stats_tlv(const void *tag_buf, u16 tag_len,
+					    struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_rx_pdev_rate_ext_stats_tlv *htt_stats_buf = tag_buf;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u8 j;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_RX_PDEV_RATE_EXT_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "rssi_mgmt_in_dbm = %d\n",
+			 le32_to_cpu(htt_stats_buf->rssi_mgmt_in_dbm));
+
+	len += print_array_to_buf(buf, len, "rx_stbc_ext",
+				  htt_stats_buf->rx_stbc_ext,
+				  ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
+	len += print_array_to_buf(buf, len, "ul_ofdma_rx_mcs_ext",
+				  htt_stats_buf->ul_ofdma_rx_mcs_ext,
+				  ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
+	len += print_array_to_buf(buf, len, "rx_11ax_su_txbf_mcs_ext",
+				  htt_stats_buf->rx_11ax_su_txbf_mcs_ext,
+				  ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
+	len += print_array_to_buf(buf, len, "rx_11ax_mu_txbf_mcs_ext",
+				  htt_stats_buf->rx_11ax_mu_txbf_mcs_ext,
+				  ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
+	len += print_array_to_buf(buf, len, "rx_11ax_dl_ofdma_mcs_ext",
+				  htt_stats_buf->rx_11ax_dl_ofdma_mcs_ext,
+				  ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
+	len += print_array_to_buf(buf, len, "rx_bw_ext",
+				  htt_stats_buf->rx_bw_ext,
+				  ATH12K_HTT_RX_PDEV_STATS_NUM_BW_EXT2_COUNTERS, "\n");
+	len += print_array_to_buf(buf, len, "rx_su_punctured_mode",
+				  htt_stats_buf->rx_su_punctured_mode,
+				  ATH12K_HTT_RX_PDEV_STATS_NUM_PUNCTURED_MODE_COUNTERS,
+				  "\n");
+
+	len += print_array_to_buf(buf, len, "rx_mcs_ext",
+				  htt_stats_buf->rx_mcs_ext,
+				  ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT,
+				  NULL);
+	for (j = 0; j < ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS; j++)
+		len += scnprintf(buf + len, buf_len - len, ", %u:%u",
+				 j + ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT,
+				 le32_to_cpu(htt_stats_buf->rx_mcs_ext_2[j]));
+	len += scnprintf(buf + len, buf_len - len, "\n");
+
+	for (j = 0; j < ATH12K_HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "rx_gi_ext[%u] = ", j);
+		len += print_array_to_buf(buf, len, NULL,
+					  htt_stats_buf->rx_gi_ext[j],
+					  ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT,
+					  "\n");
+	}
+
+	for (j = 0; j < ATH12K_HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "ul_ofdma_rx_gi_ext[%u] = ", j);
+		len += print_array_to_buf(buf, len, NULL,
+					  htt_stats_buf->ul_ofdma_rx_gi_ext[j],
+					  ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT,
+					  "\n");
+	}
+
+	stats_req->buf_len = len;
+}
+
 static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
@@ -4473,6 +4544,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_RX_PDEV_RATE_STATS_TAG:
 		ath12k_htt_print_rx_pdev_rate_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_RX_PDEV_RATE_EXT_STATS_TAG:
+		ath12k_htt_print_rx_pdev_rate_ext_stats_tlv(tag_buf, len, stats_req);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index c22b848aff8d..ff9a0c81b99e 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -137,6 +137,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_MU		= 17,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS		= 19,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	= 23,
+	ATH12K_DBG_HTT_EXT_STATS_PDEV_RX_RATE_EXT	= 30,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_RATE_TXBF	= 31,
 	ATH12K_DBG_HTT_EXT_STATS_TXBF_OFDMA		= 32,
 	ATH12K_DBG_HTT_EXT_STATS_DLPAGER_STATS		= 36,
@@ -205,6 +206,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_HW_WAR_TAG				= 89,
 	HTT_STATS_SCHED_TXQ_SUPERCYCLE_TRIGGER_TAG	= 100,
 	HTT_STATS_PDEV_CTRL_PATH_TX_STATS_TAG		= 102,
+	HTT_STATS_RX_PDEV_RATE_EXT_STATS_TAG		= 103,
 	HTT_STATS_PDEV_TX_RATE_TXBF_STATS_TAG		= 108,
 	HTT_STATS_TX_SELFGEN_AC_SCHED_STATUS_STATS_TAG	= 111,
 	HTT_STATS_TX_SELFGEN_AX_SCHED_STATUS_STATS_TAG	= 112,
@@ -537,6 +539,36 @@ struct ath12k_htt_rx_pdev_rate_stats_tlv {
 	__le32 rx_mcs_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS];
 };
 
+#define ATH12K_HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS		4
+#define ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT		14
+#define ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS	2
+#define ATH12K_HTT_RX_PDEV_STATS_NUM_BW_EXT2_COUNTERS		5
+#define ATH12K_HTT_RX_PDEV_STATS_NUM_PUNCTURED_MODE_COUNTERS	5
+
+struct ath12k_htt_rx_pdev_rate_ext_stats_tlv {
+	u8 rssi_chain_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
+			 [ATH12K_HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS];
+	s8 rx_per_chain_rssi_ext_in_dbm[ATH12K_HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
+				       [ATH12K_HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS];
+	__le32 rssi_mcast_in_dbm;
+	__le32 rssi_mgmt_in_dbm;
+	__le32 rx_mcs_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
+	__le32 rx_stbc_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
+	__le32 rx_gi_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_GI_COUNTERS]
+		     [ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
+	__le32 ul_ofdma_rx_mcs_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
+	__le32 ul_ofdma_rx_gi_ext[ATH12K_HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
+			      [ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
+	__le32 rx_11ax_su_txbf_mcs_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
+	__le32 rx_11ax_mu_txbf_mcs_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
+	__le32 rx_11ax_dl_ofdma_mcs_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
+	__le32 rx_mcs_ext_2[ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS];
+	__le32 rx_bw_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_BW_EXT2_COUNTERS];
+	__le32 rx_gi_ext_2[ATH12K_HTT_RX_PDEV_STATS_NUM_GI_COUNTERS]
+		[ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS];
+	__le32 rx_su_punctured_mode[ATH12K_HTT_RX_PDEV_STATS_NUM_PUNCTURED_MODE_COUNTERS];
+};
+
 #define ATH12K_HTT_TX_PDEV_STATS_SCHED_PER_TXQ_MAC_ID	GENMASK(7, 0)
 #define ATH12K_HTT_TX_PDEV_STATS_SCHED_PER_TXQ_ID	GENMASK(15, 8)
 
-- 
2.34.1


