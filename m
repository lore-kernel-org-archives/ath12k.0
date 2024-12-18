Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D3E77183
	for <ath12k@archiver.kernel.org>; Wed, 18 Dec 2024 03:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmGTIQT375LAaBuzaGb0RMrdTSd4S1IClwF7hwogI8c=; b=h8sIoWGBO9wsAcYAAfA2aKt02L
	XzoZcrLdE1LF6pecPP8Cp+bHaFcUAENGapQ3MIAvmdlkZacaDi59VY1eP91J0i6aJPegkYFwq9Rzc
	Li95Kjk7Bx7CO+691KHb2jN73XOnJNHy6rlOfFnkhcPe+deSzCBf1ABc/cX2qdQkZDJxMY3O5uUA7
	+CGdknHmLW9+CHVxnkKivHz20fIDANrZcNcJdttisd3tXw8FQs6bct4Z3qkRWTmCK2Gzyz1tMRb+Y
	jKKxZuGL4IVRdTdxsbTnbgn1CluyEe4DcKMt/bnDGaYJQGKgR/5veMUIqkW318fGy9xAYJBIrdCn9
	FX0BvZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlBp-0000000FW7o-3fib
	for ath12k@archiver.kernel.org;
	Wed, 18 Dec 2024 03:57:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlBn-0000000FW6R-49hI
	for ath12k@lists.infradead.org;
	Wed, 18 Dec 2024 03:57:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI3gPin006642;
	Wed, 18 Dec 2024 03:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wmGTIQT375LAaBuzaGb0RMrdTSd4S1IClwF7hwogI8c=; b=b+ItfPa2fYw5y+EC
	6kX+FxmMw4EVA4tNZ0Vz3nK/g4gbqLKNTmFiZuGQGGmciDDUvK0boqQwcj6x4GIK
	HaAmiXUQK/gZS1YLIddt4x1yjgYcy4iPgyIRurw09t8HiZ4+81qyIVAVkWXQ2KnU
	egI4f6PzFYnLPL8rS2pLuDF7ZS2uVJAlbVzIjDZTqqovyQCdedZ22UxTxJQLomHZ
	CRCYHTGFrOg/27BWPfTp2x0vyUGjK7VTOTsnrjjlJvh/fjVVuWk1DH8I+Qeq5HR5
	WUHOvYCzVQtUpTXHmqH2jdAIINO5wMXHFh58nTXMfOuU0tqxJtbpuzToH0Xqk75X
	Uqavng==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kpqqg111-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:57:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI3vYMQ027222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:57:34 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 19:57:32 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH v5 2/2] wifi: ath12k: Support pdev Puncture Stats
Date: Wed, 18 Dec 2024 09:27:11 +0530
Message-ID: <20241218035711.2573584-3-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218035711.2573584-1-quic_rdevanat@quicinc.com>
References: <20241218035711.2573584-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qLOJ41tRxV0LBkEhoy8-Or7eQjrCAGyP
X-Proofpoint-ORIG-GUID: qLOJ41tRxV0LBkEhoy8-Or7eQjrCAGyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_195736_039589_77E75BB2 
X-CRM114-Status: GOOD (  14.02  )
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

From: Rajat Soni <quic_rajson@quicinc.com>

Add support to request pdev puncture stats from firmware through
HTT stats type 46. These stats give the count of number of
subbands used in different wifi standards.

Sample output:
-------------
echo 46 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_PDEV_PUNCTURE_STATS_TLV:
mac_id = 0
tx_ofdm_su_last_used_pattern_mask = 0x00000001
tx_ofdm_su_num_subbands_used_cnt_01 = 217
tx_ofdm_su_num_subbands_used_cnt_02 = 0
tx_ofdm_su_num_subbands_used_cnt_03 = 0
.....

HTT_PDEV_PUNCTURE_STATS_TLV:
mac_id = 0
tx_ax_dl_mu_ofdma_last_used_pattern_mask = 0x00000000
tx_ax_dl_mu_ofdma_num_subbands_used_cnt_01 = 0
tx_ax_dl_mu_ofdma_num_subbands_used_cnt_02 = 0
tx_ax_dl_mu_ofdma_num_subbands_used_cnt_03 = 0
.....

HTT_PDEV_PUNCTURE_STATS_TLV:
mac_id = 0
tx_be_dl_mu_ofdma_last_used_pattern_mask = 0x00000000
tx_be_dl_mu_ofdma_num_subbands_used_cnt_01 = 0
tx_be_dl_mu_ofdma_num_subbands_used_cnt_02 = 0
tx_be_dl_mu_ofdma_num_subbands_used_cnt_03 = 0
.....

HTT_PDEV_PUNCTURE_STATS_TLV:
mac_id = 0
rx_ax_ul_mu_ofdma_last_used_pattern_mask = 0x00000000
rx_ax_ul_mu_ofdma_num_subbands_used_cnt_01 = 0
rx_ax_ul_mu_ofdma_num_subbands_used_cnt_02 = 0
rx_ax_ul_mu_ofdma_num_subbands_used_cnt_03 = 0
.....

HTT_PDEV_PUNCTURE_STATS_TLV:
mac_id = 0
rx_be_ul_mu_ofdma_last_used_pattern_mask = 0x00000000
rx_be_ul_mu_ofdma_num_subbands_used_cnt_01 = 0
rx_be_ul_mu_ofdma_num_subbands_used_cnt_02 = 0
rx_be_ul_mu_ofdma_num_subbands_used_cnt_03 = 0
.....

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 101 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  38 +++++++
 2 files changed, 139 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 9294ef41a169..41e4ef2ef3af 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -3522,6 +3522,104 @@ ath12k_htt_print_ast_entry_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static const char*
+ath12k_htt_get_punct_dir_type_str(enum ath12k_htt_stats_direction direction)
+{
+	switch (direction) {
+	case ATH12K_HTT_STATS_DIRECTION_TX:
+		return "tx";
+	case ATH12K_HTT_STATS_DIRECTION_RX:
+		return "rx";
+	default:
+		return "unknown";
+	}
+}
+
+static const char*
+ath12k_htt_get_punct_ppdu_type_str(enum ath12k_htt_stats_ppdu_type ppdu_type)
+{
+	switch (ppdu_type) {
+	case ATH12K_HTT_STATS_PPDU_TYPE_MODE_SU:
+		return "su";
+	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_MIMO:
+		return "dl_mu_mimo";
+	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_MIMO:
+		return "ul_mu_mimo";
+	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_OFDMA:
+		return "dl_mu_ofdma";
+	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_OFDMA:
+		return "ul_mu_ofdma";
+	default:
+		return "unknown";
+	}
+}
+
+static const char*
+ath12k_htt_get_punct_pream_type_str(enum ath12k_htt_stats_param_type pream_type)
+{
+	switch (pream_type) {
+	case ATH12K_HTT_STATS_PREAM_OFDM:
+		return "ofdm";
+	case ATH12K_HTT_STATS_PREAM_CCK:
+		return "cck";
+	case ATH12K_HTT_STATS_PREAM_HT:
+		return "ht";
+	case ATH12K_HTT_STATS_PREAM_VHT:
+		return "ac";
+	case ATH12K_HTT_STATS_PREAM_HE:
+		return "ax";
+	case ATH12K_HTT_STATS_PREAM_EHT:
+		return "be";
+	default:
+		return "unknown";
+	}
+}
+
+static void
+ath12k_htt_print_puncture_stats_tlv(const void *tag_buf, u16 tag_len,
+				    struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_pdev_puncture_stats_tlv *stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+	const char *direction;
+	const char *ppdu_type;
+	const char *preamble;
+	u32 mac_id__word;
+	u32 subband_limit;
+	u8 i;
+
+	if (tag_len < sizeof(*stats_buf))
+		return;
+
+	mac_id__word = le32_to_cpu(stats_buf->mac_id__word);
+	subband_limit = min(le32_to_cpu(stats_buf->subband_cnt),
+			    ATH12K_HTT_PUNCT_STATS_MAX_SUBBAND_CNT);
+
+	direction = ath12k_htt_get_punct_dir_type_str(le32_to_cpu(stats_buf->direction));
+	ppdu_type = ath12k_htt_get_punct_ppdu_type_str(le32_to_cpu(stats_buf->ppdu_type));
+	preamble = ath12k_htt_get_punct_pream_type_str(le32_to_cpu(stats_buf->preamble));
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PDEV_PUNCTURE_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 u32_get_bits(mac_id__word, ATH12K_HTT_STATS_MAC_ID));
+	len += scnprintf(buf + len, buf_len - len,
+			 "%s_%s_%s_last_used_pattern_mask = 0x%08x\n",
+			 direction, preamble, ppdu_type,
+			 le32_to_cpu(stats_buf->last_used_pattern_mask));
+
+	for (i = 0; i < subband_limit; i++) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "%s_%s_%s_num_subbands_used_cnt_%02d = %u\n",
+				 direction, preamble, ppdu_type, i + 1,
+				 le32_to_cpu(stats_buf->num_subbands_used_cnt[i]));
+	}
+	len += scnprintf(buf + len, buf_len - len, "\n");
+
+	stats_req->buf_len = len;
+}
+
 static void
 ath12k_htt_print_dmac_reset_stats_tlv(const void *tag_buf, u16 tag_len,
 				      struct debug_htt_stats_req *stats_req)
@@ -3933,6 +4031,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_AST_ENTRY_TAG:
 		ath12k_htt_print_ast_entry_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_PDEV_PUNCTURE_STATS_TAG:
+		ath12k_htt_print_puncture_stats_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_DMAC_RESET_STATS_TAG:
 		ath12k_htt_print_dmac_reset_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index 9a9dd368c5d6..4b59976fbc35 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -143,6 +143,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_PDEV_PER_STATS		= 40,
 	ATH12K_DBG_HTT_EXT_AST_ENTRIES			= 41,
 	ATH12K_DBG_HTT_EXT_STATS_SOC_ERROR		= 45,
+	ATH12K_DBG_HTT_DBG_PDEV_PUNCTURE_STATS		= 46,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_SCHED_ALGO	= 49,
 	ATH12K_DBG_HTT_EXT_STATS_MANDATORY_MUOFDMA	= 51,
 	ATH12K_DGB_HTT_EXT_STATS_PDEV_MBSSID_CTRL_FRAME	= 54,
@@ -223,6 +224,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TXBF_OFDMA_AX_STEER_STATS_TAG		= 150,
 	HTT_STATS_DMAC_RESET_STATS_TAG			= 155,
 	HTT_STATS_PHY_TPC_STATS_TAG			= 157,
+	HTT_STATS_PDEV_PUNCTURE_STATS_TAG		= 158,
 	HTT_STATS_PDEV_SCHED_ALGO_OFDMA_STATS_TAG	= 165,
 	HTT_STATS_TXBF_OFDMA_AX_STEER_MPDU_STATS_TAG	= 172,
 	HTT_STATS_PDEV_MBSSID_CTRL_FRAME_STATS_TAG	= 176,
@@ -1311,6 +1313,42 @@ struct ath12k_htt_ast_entry_tlv {
 	__le32 info;
 } __packed;
 
+enum ath12k_htt_stats_direction {
+	ATH12K_HTT_STATS_DIRECTION_TX,
+	ATH12K_HTT_STATS_DIRECTION_RX
+};
+
+enum ath12k_htt_stats_ppdu_type {
+	ATH12K_HTT_STATS_PPDU_TYPE_MODE_SU,
+	ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_MIMO,
+	ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_MIMO,
+	ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_OFDMA,
+	ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_OFDMA
+};
+
+enum ath12k_htt_stats_param_type {
+	ATH12K_HTT_STATS_PREAM_OFDM,
+	ATH12K_HTT_STATS_PREAM_CCK,
+	ATH12K_HTT_STATS_PREAM_HT,
+	ATH12K_HTT_STATS_PREAM_VHT,
+	ATH12K_HTT_STATS_PREAM_HE,
+	ATH12K_HTT_STATS_PREAM_EHT,
+	ATH12K_HTT_STATS_PREAM_RSVD1,
+	ATH12K_HTT_STATS_PREAM_COUNT,
+};
+
+#define ATH12K_HTT_PUNCT_STATS_MAX_SUBBAND_CNT	32
+
+struct ath12k_htt_pdev_puncture_stats_tlv {
+	__le32 mac_id__word;
+	__le32 direction;
+	__le32 preamble;
+	__le32 ppdu_type;
+	__le32 subband_cnt;
+	__le32 last_used_pattern_mask;
+	__le32 num_subbands_used_cnt[ATH12K_HTT_PUNCT_STATS_MAX_SUBBAND_CNT];
+} __packed;
+
 struct ath12k_htt_dmac_reset_stats_tlv {
 	__le32 reset_count;
 	__le32 reset_time_lo_ms;
-- 
2.25.1


