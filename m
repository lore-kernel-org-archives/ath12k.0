Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED90E7718D
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARsxb6IWscFOktmJf9KuIvHIr+26QmgKNUOiRz5C8nc=; b=Yt+KQHUXQtTUrWCGIq0EcdMiof
	SfpV3k++PnXl4SXHh67nJ1iacyBrT2SaYOR4vKwV5aC7SC9ku6u2EIvJIb7uEWgweU2rxbO1wo+Ui
	AY3MVjzPwJppJfq2PqtL952UIuFkh0BUwzznprJE0hZjGIMopD3fGqhQOttSeO82ASqTBqX7YTH0F
	ngXYO30+BzpT7xshN5hVtIbV+oXWyn2SNSEf/t2uONKcWPS7Anjwayu5yMHIbpb16+/DVZEFIvsHv
	MmkknNHPnw2rPGZ63rs8+c+BtUBYtsr4RWSMprh+vttMiMf0ZbuU45tM+WJVT1XaII913LtNekxyG
	7a+kVoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ223-0000000BjqU-0TJn
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 10:20:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ220-0000000Bjor-2GVj
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 10:20:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO6vUf7025265;
	Tue, 24 Dec 2024 10:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARsxb6IWscFOktmJf9KuIvHIr+26QmgKNUOiRz5C8nc=; b=Zc4GqxNGaSKtJmQ2
	jPvsDdjZzcmI9Z+ZRE5pwEp0yVIQRUwfuEzKOqr6XPjegSw/gxQ8yuPQ+P0WSEC5
	uoU8Hs92FHiTPrFP+utu5do4j9bPG/qKtyodB6zw5o1SQnLgSCBOpF8WO2uFTARw
	A/xSEerBwLWZ4JO6tkZALuZSXu5ixrem+fkD6qzahKTK2EuY7YWAUXa9kRNFmS2Q
	eMgRrupXaLlxtOsrHm/LmV+F+EtQv3x0NJCQw+L3P1rYp0xbztxxmn0e0sgYxI0S
	zHB6OwJNJW6B5q3HI5N15aTROyLSsrKJAstKpnoSUecXGY27Xt7n4UNbyFH8M2xD
	apt57Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qr55s3pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:20:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOAKpWo010655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 10:20:51 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Dec 2024 02:20:49 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH v2 6/6] wifi: ath12k: Support Received FSE Stats
Date: Tue, 24 Dec 2024 15:50:13 +0530
Message-ID: <20241224102013.1530055-7-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224102013.1530055-1-quic_rdevanat@quicinc.com>
References: <20241224102013.1530055-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n6xccWE6KgDlzXHbDj8YzckhMh3zSuoK
X-Proofpoint-GUID: n6xccWE6KgDlzXHbDj8YzckhMh3zSuoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412240087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_022052_593924_CD05ECCC 
X-CRM114-Status: GOOD (  12.46  )
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

Add support to request received Finite State Entropy stats from
firmware through HTT stats type 28. These stats give software and
hardware FSE stats such as cache entry count, full cache count,
current and peak occupancy count, pending search counts, etc.

Sample output:
-------------
echo 28 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_STATS_RX_FSE_STATS_TLV:
=== Software RX FSE STATS ===
Enable count  = 0
Disable count = 0
Cache invalidate entry count = 0
Full cache invalidate count = 0

=== Hardware RX FSE STATS ===
Cache hits count = 0
Cache no. of searches = 0
Cache occupancy peak count:
[0] = 0 [1-16] = 0 [17-32] = 0 [33-48] = 0 [49-64] = 0 [65-80] = 0 [81-96] = 0 [97-112] = 0 [113-127] = 0 [128] = 0
Cache occupancy current count:
[0] = 0 [1-16] = 0 [17-32] = 0 [33-48] = 0 [49-64] = 0 [65-80] = 0 [81-96] = 0 [97-112] = 0 [113-127] = 0 [128] = 0
Cache search square count:
[0] = 0 [1-50] = 0 [51-100] = 0 [101-200] = 0 [201-255] = 0 [256] = 0
Cache search peak pending count:
[0] = 0 [1-2] = 0 [3-4] = 0 [Greater/Equal to 5] = 0
Cache search tot pending count:
[0] = 0 [1-2] = 0 [3-4] = 0 [Greater/Equal to 5] = 0

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 91 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 22 +++++
 2 files changed, 113 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index ba1cf6953536..f1eb5f993ab2 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -3526,6 +3526,94 @@ ath12k_htt_print_ul_mumimo_trig_stats(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_rx_fse_stats_tlv(const void *tag_buf, u16 tag_len,
+				  struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_rx_fse_stats_tlv *htt_stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_STATS_RX_FSE_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "=== Software RX FSE STATS ===\n");
+	len += scnprintf(buf + len, buf_len - len, "Enable count  = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_enable_cnt));
+	len += scnprintf(buf + len, buf_len - len, "Disable count = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_disable_cnt));
+	len += scnprintf(buf + len, buf_len - len, "Cache invalidate entry count = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_cache_invalidate_entry_cnt));
+	len += scnprintf(buf + len, buf_len - len, "Full cache invalidate count = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_full_cache_invalidate_cnt));
+
+	len += scnprintf(buf + len, buf_len - len, "\n=== Hardware RX FSE STATS ===\n");
+	len += scnprintf(buf + len, buf_len - len, "Cache hits count = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_num_cache_hits_cnt));
+	len += scnprintf(buf + len, buf_len - len, "Cache no. of searches = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_num_searches_cnt));
+	len += scnprintf(buf + len, buf_len - len, "Cache occupancy peak count:\n");
+	len += scnprintf(buf + len, buf_len - len, "[0] = %u [1-16] = %u [17-32] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[0]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[1]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[2]));
+	len += scnprintf(buf + len, buf_len - len, "[33-48] = %u [49-64] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[3]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[4]));
+	len += scnprintf(buf + len, buf_len - len, "[65-80] = %u [81-96] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[5]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[6]));
+	len += scnprintf(buf + len, buf_len - len, "[97-112] = %u [113-127] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[7]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[8]));
+	len += scnprintf(buf + len, buf_len - len, "[128] = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_peak_cnt[9]));
+	len += scnprintf(buf + len, buf_len - len, "Cache occupancy current count:\n");
+	len += scnprintf(buf + len, buf_len - len, "[0] = %u [1-16] = %u [17-32] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[0]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[1]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[2]));
+	len += scnprintf(buf + len, buf_len - len, "[33-48] = %u [49-64] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[3]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[4]));
+	len += scnprintf(buf + len, buf_len - len, "[65-80] = %u [81-96] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[5]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[6]));
+	len += scnprintf(buf + len, buf_len - len, "[97-112] = %u [113-127] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[7]),
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[8]));
+	len += scnprintf(buf + len, buf_len - len, "[128] = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_cache_occupancy_curr_cnt[9]));
+	len += scnprintf(buf + len, buf_len - len, "Cache search square count:\n");
+	len += scnprintf(buf + len, buf_len - len, "[0] = %u [1-50] = %u [51-100] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_square_cnt[0]),
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_square_cnt[1]),
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_square_cnt[2]));
+	len += scnprintf(buf + len, buf_len - len, "[101-200] = %u [201-255] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_square_cnt[3]),
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_square_cnt[4]));
+	len += scnprintf(buf + len, buf_len - len, "[256] = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_square_cnt[5]));
+	len += scnprintf(buf + len, buf_len - len, "Cache search peak pending count:\n");
+	len += scnprintf(buf + len, buf_len - len, "[0] = %u [1-2] = %u [3-4] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_peak_cnt[0]),
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_peak_cnt[1]),
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_peak_cnt[2]));
+	len += scnprintf(buf + len, buf_len - len, "[Greater/Equal to 5] = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_peak_cnt[3]));
+	len += scnprintf(buf + len, buf_len - len, "Cache search tot pending count:\n");
+	len += scnprintf(buf + len, buf_len - len, "[0] = %u [1-2] = %u [3-4] = %u ",
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_pending_cnt[0]),
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_pending_cnt[1]),
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_pending_cnt[2]));
+	len += scnprintf(buf + len, buf_len - len, "[Greater/Equal to 5] = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->fse_search_stat_pending_cnt[3]));
+
+	stats_req->buf_len = len;
+}
+
 static void ath12k_htt_print_dlpager_entry(const struct ath12k_htt_pgs_info *pg_info,
 					   int idx, char *str_buf)
 {
@@ -4498,6 +4586,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_RX_PDEV_UL_MUMIMO_TRIG_STATS_TAG:
 		ath12k_htt_print_ul_mumimo_trig_stats(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_RX_FSE_STATS_TAG:
+		ath12k_htt_print_rx_fse_stats_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_DLPAGER_STATS_TAG:
 		ath12k_htt_print_dlpager_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index 043211773c78..34d87a9f9b08 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -139,6 +139,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_LATENCY_PROF_STATS		= 25,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_UL_TRIG_STATS		= 26,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_UL_MUMIMO_TRIG_STATS	= 27,
+	ATH12K_DBG_HTT_EXT_STATS_FSE_RX				= 28,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_RATE_TXBF		= 31,
 	ATH12K_DBG_HTT_EXT_STATS_TXBF_OFDMA			= 32,
 	ATH12K_DBG_HTT_EXT_STATS_DLPAGER_STATS			= 36,
@@ -210,6 +211,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_RX_PDEV_UL_TRIG_STATS_TAG		= 94,
 	HTT_STATS_RX_PDEV_UL_OFDMA_USER_STATS_TAG	= 95,
 	HTT_STATS_RX_PDEV_UL_MUMIMO_TRIG_STATS_TAG	= 97,
+	HTT_STATS_RX_FSE_STATS_TAG			= 98,
 	HTT_STATS_SCHED_TXQ_SUPERCYCLE_TRIGGER_TAG	= 100,
 	HTT_STATS_PDEV_CTRL_PATH_TX_STATS_TAG		= 102,
 	HTT_STATS_PDEV_TX_RATE_TXBF_STATS_TAG		= 108,
@@ -1357,6 +1359,26 @@ struct ath12k_htt_rx_ul_mumimo_trig_stats_tlv {
 	__le32 mumimo_bsc_trig_rx_qos_null_only;
 } __packed;
 
+#define ATH12K_HTT_RX_NUM_MAX_PEAK_OCCUPANCY_INDEX	10
+#define ATH12K_HTT_RX_NUM_MAX_CURR_OCCUPANCY_INDEX	10
+#define ATH12K_HTT_RX_NUM_SQUARE_INDEX			6
+#define ATH12K_HTT_RX_NUM_MAX_PEAK_SEARCH_INDEX		4
+#define ATH12K_HTT_RX_NUM_MAX_PENDING_SEARCH_INDEX	4
+
+struct ath12k_htt_rx_fse_stats_tlv {
+	__le32 fse_enable_cnt;
+	__le32 fse_disable_cnt;
+	__le32 fse_cache_invalidate_entry_cnt;
+	__le32 fse_full_cache_invalidate_cnt;
+	__le32 fse_num_cache_hits_cnt;
+	__le32 fse_num_searches_cnt;
+	__le32 fse_cache_occupancy_peak_cnt[ATH12K_HTT_RX_NUM_MAX_PEAK_OCCUPANCY_INDEX];
+	__le32 fse_cache_occupancy_curr_cnt[ATH12K_HTT_RX_NUM_MAX_CURR_OCCUPANCY_INDEX];
+	__le32 fse_search_stat_square_cnt[ATH12K_HTT_RX_NUM_SQUARE_INDEX];
+	__le32 fse_search_stat_peak_cnt[ATH12K_HTT_RX_NUM_MAX_PEAK_SEARCH_INDEX];
+	__le32 fse_search_stat_pending_cnt[ATH12K_HTT_RX_NUM_MAX_PENDING_SEARCH_INDEX];
+} __packed;
+
 enum ath12k_htt_stats_page_lock_state {
 	ATH12K_HTT_STATS_PAGE_LOCKED	= 0,
 	ATH12K_HTT_STATS_PAGE_UNLOCKED	= 1,
-- 
2.25.1


