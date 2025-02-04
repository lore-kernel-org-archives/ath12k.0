Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9C5C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/U7Ll7zPy0QA8AuiZPGzjkE2eFO9YJCW+IPUX+XdEg=; b=UNvlNsFniXO9zZBIITdxxiBBTT
	T6zpTIl9a5jJ7LyLKLE81+VGn6HrF9+lP+cTnKUsSEfaJz/PoxJ6a1BG+0NV6vWIc5EOSnhC5GPl1
	IYHffJVHmz01X5SfQCIG0LvoiDGrmzjVTmt5bOnA1q54UBPbHMG1OX/0HOH8v1xyAk/nzBge7VXFq
	nyxNvdeXuA+EsxMm79siTwRfHVbW2bjiItTTV9YpG3zvGM/LHtHiidnpYfwfOwfxfSF0pgB37uEk5
	JURMc3Hbvkv5jD6AnCxw5ZcTwUAD/Rto0op2YZEj9G1iRL2cahtXEqrEVc7gJd5TEQu3KJSCUgHWL
	Ppdt2Pqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCfx-0000000HNv8-304R
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 06:44:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCfv-0000000HNu1-1g8V
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 06:44:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5145eYP6010319;
	Tue, 4 Feb 2025 06:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/U7Ll7zPy0QA8AuiZPGzjkE2eFO9YJCW+IPUX+XdEg=; b=UW4n1yk3jbi69oh2
	865kUK7677sVUjuGbFZXtTB3sv6/TOTVss/v4SkHO+hwVtnx93OrCaOniQhLjoMN
	3Q3khjsL8JOHL4D55+ohoWk8M19nK73mIQX6iL9hO2wBA71dn/RLpK4QXqC80ChB
	NrRPL/4vsqYvpP2BnSxkkj4LmC9d6apBvFsaZY+8T8XwqIn/Yd6cM0X/8CpuqE3e
	IFjKOA0FRM/hExKnRvnO6nsU9u80UQOLooLQoVD6o5Kijs7hSJH4BsrjNzD3hCrX
	fFCG0dEwB6TPtUqEVkd4ukgaQabhoa0wGqGmQBh6Er2YJ2/AX46UYmIA1HtRt2po
	gap27g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcxm83vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:44:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5146ijq8030771
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 06:44:45 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Feb 2025 22:44:43 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH v5 2/5] wifi: ath12k: Support Latency Stats
Date: Tue, 4 Feb 2025 12:14:14 +0530
Message-ID: <20250204064417.3671928-3-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204064417.3671928-1-quic_rdevanat@quicinc.com>
References: <20250204064417.3671928-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n34VCnAQiyMTjlvnqxd3lu2OSUt5zjKc
X-Proofpoint-ORIG-GUID: n34VCnAQiyMTjlvnqxd3lu2OSUt5zjKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=978 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_224447_564114_3F0D84C8 
X-CRM114-Status: GOOD (  13.30  )
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

From: Dinesh Karthikeyan <quic_dinek@quicinc.com>

Add support to request latency stats from firmware through HTT stats
type 25. These stats give information about count of transmitted and
received MAC Protocol Data Units(PDU) and Service Data Units(SDU)
and other latency stats.

Sample output:
-------------
echo 25 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_STATS_LATENCY_CTX_TLV:
duration = 0
tx_msdu_cnt = 0
tx_mpdu_cnt = 0
rx_msdu_cnt = 0
rx_mpdu_cnt = 0

HTT_STATS_LATENCY_PROF_TLV:
Latency name = PROF_SCH_ENQ_TQM_CMDS
count = 0
minimum = 4294967295
maximum = 0
.....

HTT_STATS_LATENCY_CNT_TLV:
prof_enable_cnt = 39

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 94 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 34 +++++++
 2 files changed, 128 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 9998c5cf7ab0..0abca93e0802 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -2838,6 +2838,91 @@ ath12k_htt_print_pdev_obss_pd_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_latency_prof_ctx_tlv(const void *tag_buf, u16 tag_len,
+				      struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_latency_prof_ctx_tlv *htt_stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_STATS_LATENCY_CTX_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "duration = %u\n",
+			 le32_to_cpu(htt_stats_buf->duration));
+	len += scnprintf(buf + len, buf_len - len, "tx_msdu_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->tx_msdu_cnt));
+	len += scnprintf(buf + len, buf_len - len, "tx_mpdu_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->tx_mpdu_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_msdu_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_msdu_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rx_mpdu_cnt = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->rx_mpdu_cnt));
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_latency_prof_cnt(const void *tag_buf, u16 tag_len,
+				  struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_latency_prof_cnt_tlv *htt_stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_STATS_LATENCY_CNT_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "prof_enable_cnt = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->prof_enable_cnt));
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_latency_prof_stats_tlv(const void *tag_buf, u16 tag_len,
+					struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_latency_prof_stats_tlv *htt_stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	if (le32_to_cpu(htt_stats_buf->print_header) == 1) {
+		len += scnprintf(buf + len, buf_len - len,
+				 "HTT_STATS_LATENCY_PROF_TLV:\n");
+	}
+
+	len += scnprintf(buf + len, buf_len - len, "Latency name = %s\n",
+			 htt_stats_buf->latency_prof_name);
+	len += scnprintf(buf + len, buf_len - len, "count = %u\n",
+			 le32_to_cpu(htt_stats_buf->cnt));
+	len += scnprintf(buf + len, buf_len - len, "minimum = %u\n",
+			 le32_to_cpu(htt_stats_buf->min));
+	len += scnprintf(buf + len, buf_len - len, "maximum = %u\n",
+			 le32_to_cpu(htt_stats_buf->max));
+	len += scnprintf(buf + len, buf_len - len, "last = %u\n",
+			 le32_to_cpu(htt_stats_buf->last));
+	len += scnprintf(buf + len, buf_len - len, "total = %u\n",
+			 le32_to_cpu(htt_stats_buf->tot));
+	len += scnprintf(buf + len, buf_len - len, "average = %u\n",
+			 le32_to_cpu(htt_stats_buf->avg));
+	len += scnprintf(buf + len, buf_len - len, "histogram interval = %u\n",
+			 le32_to_cpu(htt_stats_buf->hist_intvl));
+	len += print_array_to_buf(buf, len, "histogram", htt_stats_buf->hist,
+				  ATH12K_HTT_LATENCY_PROFILE_NUM_MAX_HIST, "\n\n");
+
+	stats_req->buf_len = len;
+}
+
 static void
 ath12k_htt_print_pdev_tx_rate_txbf_stats_tlv(const void *tag_buf, u16 tag_len,
 					     struct debug_htt_stats_req *stats_req)
@@ -4741,6 +4826,15 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_PDEV_OBSS_PD_TAG:
 		ath12k_htt_print_pdev_obss_pd_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_LATENCY_CTX_TAG:
+		ath12k_htt_print_latency_prof_ctx_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_LATENCY_CNT_TAG:
+		ath12k_htt_print_latency_prof_cnt(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_LATENCY_PROF_STATS_TAG:
+		ath12k_htt_print_latency_prof_stats_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_PDEV_TX_RATE_TXBF_STATS_TAG:
 		ath12k_htt_print_pdev_tx_rate_txbf_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index a4dd894df077..1b835473f419 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -138,6 +138,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS		= 19,
 	ATH12K_DBG_HTT_EXT_STATS_TX_SOUNDING_INFO	= 22,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	= 23,
+	ATH12K_DBG_HTT_EXT_STATS_LATENCY_PROF_STATS	= 25,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_RX_RATE_EXT	= 30,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_RATE_TXBF	= 31,
 	ATH12K_DBG_HTT_EXT_STATS_TXBF_OFDMA		= 32,
@@ -206,6 +207,9 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_SCHED_TXQ_SCHED_INELIGIBILITY_TAG	= 87,
 	HTT_STATS_PDEV_OBSS_PD_TAG			= 88,
 	HTT_STATS_HW_WAR_TAG				= 89,
+	HTT_STATS_LATENCY_PROF_STATS_TAG		= 91,
+	HTT_STATS_LATENCY_CTX_TAG			= 92,
+	HTT_STATS_LATENCY_CNT_TAG			= 93,
 	HTT_STATS_SCHED_TXQ_SUPERCYCLE_TRIGGER_TAG	= 100,
 	HTT_STATS_PDEV_CTRL_PATH_TX_STATS_TAG		= 102,
 	HTT_STATS_RX_PDEV_RATE_EXT_STATS_TAG		= 103,
@@ -1340,6 +1344,36 @@ struct ath12k_htt_pdev_obss_pd_stats_tlv {
 	__le32 num_sr_ppdu_abort_flush_cnt;
 } __packed;
 
+#define ATH12K_HTT_STATS_MAX_PROF_STATS_NAME_LEN	32
+#define ATH12K_HTT_LATENCY_PROFILE_NUM_MAX_HIST		3
+#define ATH12K_HTT_INTERRUPTS_LATENCY_PROFILE_MAX_HIST	3
+
+struct ath12k_htt_latency_prof_stats_tlv {
+	__le32 print_header;
+	s8 latency_prof_name[ATH12K_HTT_STATS_MAX_PROF_STATS_NAME_LEN];
+	__le32 cnt;
+	__le32 min;
+	__le32 max;
+	__le32 last;
+	__le32 tot;
+	__le32 avg;
+	__le32 hist_intvl;
+	__le32 hist[ATH12K_HTT_LATENCY_PROFILE_NUM_MAX_HIST];
+}  __packed;
+
+struct ath12k_htt_latency_prof_ctx_tlv {
+	__le32 duration;
+	__le32 tx_msdu_cnt;
+	__le32 tx_mpdu_cnt;
+	__le32 tx_ppdu_cnt;
+	__le32 rx_msdu_cnt;
+	__le32 rx_mpdu_cnt;
+} __packed;
+
+struct ath12k_htt_latency_prof_cnt_tlv {
+	__le32 prof_enable_cnt;
+} __packed;
+
 #define ATH12K_HTT_TX_BF_RATE_STATS_NUM_MCS_COUNTERS		14
 #define ATH12K_HTT_TX_PDEV_STATS_NUM_LEGACY_OFDM_STATS		8
 #define ATH12K_HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS		8
-- 
2.25.1


