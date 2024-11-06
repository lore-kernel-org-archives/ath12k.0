Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3282D1CA17
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 04:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vZPaBH0N9UpPnBIg1TMEcGfouPNlO8HlmptEeeai1Y=; b=33ZCRHqeBXUGXMFJ+v8O/5zuVV
	apz5+1XP933t1gytcSJWdYmF2tdNxSs3XqTYVgiQCBbkNxIW/ipPX8r82hN2yqgW/STacL3fojZ8k
	zZkqFr0tbVtrU5flmJUz6l9TKe6pzHR3/xP7ihYkKKsBCinNX+M07NDhn0y9Q2vBtKtM0xaiT0Jn9
	pzJchf3oND67Tgb8AL2gTTnxdEkp8l4JaxQiO8wYZI0gxHDf19cTna7quBitIKatFxsTlB6W7iQ7g
	EGz87dU/q3rDWBIY4BbSeNwUsJ1/cdSrS5hEauMPsIFS7oDgcefKG1KNHhiS6Lr+ivy/gV/N3/FUZ
	QGYt55Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Xvy-00000001nXg-2XGJ
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 04:46:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Xvw-00000001nWe-0wCw
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 04:46:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A633cWr023160;
	Wed, 6 Nov 2024 04:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vZPaBH0N9UpPnBIg1TMEcGfouPNlO8HlmptEeeai1Y=; b=knC8V+mtanGuENyG
	O4tMI5jtmPisJ4wQVCOUWLNYkhYW5wHOqz1COexJXH2t2UfkRqxh0O5HFt36pNIs
	y2aBv+ovS9/YBGiMLCagRbtQbYgvfo2faKh4ZvW3hTlvTx8qKje3zCJIXvTXEkQE
	AO9vchQ0Da015FgE/cFDDHAHtpXC0drKhWt+kuPXHKv2hJUFErZskdk4YZl2yfQ+
	vdcwJp77SrauqA3OFcRyrjCM/dW36W7ifbZ/9oUlH+B54AEYC5VRtQ+8hHpBnnhW
	3XwKF41ObpJuGNyHVLpdzC2aB0w9EAHb0tU+sLi3jyX7MFTjNFggYLpPfdxVqsFy
	wvnlAA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r07hg64w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 04:46:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A64k7v7002663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 04:46:07 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 20:46:05 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH v4 1/4] wifi: ath12k: Support Downlink Pager Stats
Date: Wed, 6 Nov 2024 10:15:45 +0530
Message-ID: <20241106044548.3530128-2-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106044548.3530128-1-quic_rdevanat@quicinc.com>
References: <20241106044548.3530128-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6I5RV1LbbTsuWxns4rt4WkQZz42Mz6Gt
X-Proofpoint-ORIG-GUID: 6I5RV1LbbTsuWxns4rt4WkQZz42Mz6Gt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_204620_432212_2F16C307 
X-CRM114-Status: GOOD (  16.10  )
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

Add support to request downlink pager stats from firmware through HTT
stats type 36. These stats give paging information like number of pages,
their timestamp, number of locked and free pages, synchronous and
asynchronous locked pages.

Note: MCC firmware version -
WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 responds to
the event requesting stats, but it does not give any data.

Sample output:
-------------
echo 36 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_DLPAGER_STATS_TLV:
ASYNC locked pages = 2
SYNC locked pages = 0
Total locked pages = 2
Total free pages = 127

LOCKED PAGES HISTORY
last_locked_page_idx = 0
Index - 0 ; Page Number - 8495 ; Num of pages - 1 ; Timestamp - 4031009360us
Index - 1 ; Page Number - 7219 ; Num of pages - 2 ; Timestamp - 885379515us
Index - 2 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
Index - 3 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
.....
UNLOCKED PAGES HISTORY
last_unlocked_page_idx = 0
Index - 0 ; Page Number - 7144 ; Num of pages - 2 ; Timestamp - 4032070008us
Index - 1 ; Page Number - 7214 ; Num of pages - 2 ; Timestamp - 885379512us
Index - 2 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
Index - 3 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
.....

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 86 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 31 +++++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index c9980c0193d1..8a4fe3cbb8dd 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -2542,6 +2542,89 @@ ath12k_htt_print_pdev_obss_pd_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void ath12k_htt_print_dlpager_entry(const struct ath12k_htt_pgs_info *pg_info,
+					   int idx, char *str_buf)
+{
+	u32 ts_lo;
+	u32 ts_hi;
+	u64 page_timestamp;
+	u16 index = 0;
+
+	ts_lo = le32_to_cpu(pg_info->ts_lsb);
+	ts_hi = le32_to_cpu(pg_info->ts_msb);
+	page_timestamp = ath12k_le32hilo_to_u64(pg_info->ts_msb, pg_info->ts_lsb);
+
+	index += snprintf(&str_buf[index], ATH12K_HTT_MAX_STRING_LEN - index,
+			  "Index - %u ; Page Number - %u ; ",
+			  idx, le32_to_cpu(pg_info->page_num));
+	index += snprintf(&str_buf[index], ATH12K_HTT_MAX_STRING_LEN - index,
+			  "Num of pages - %u ; Timestamp - %lluus\n",
+			  le32_to_cpu(pg_info->num_pgs), page_timestamp);
+}
+
+static void
+ath12k_htt_print_dlpager_stats_tlv(const void *tag_buf, u16 tag_len,
+				   struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_dl_pager_stats_tlv *stat_buf = tag_buf;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 info0;
+	u32 info1;
+	u32 info2;
+	u32 dword_lock;
+	u32 dword_unlock;
+	u8 pg_locked;
+	u8 pg_unlock;
+	int i;
+	char str_buf[ATH12K_HTT_MAX_STRING_LEN] = {0};
+
+	if (tag_len < sizeof(*stat_buf))
+		return;
+
+	info0 = le32_to_cpu(stat_buf->info0);
+	info1 = le32_to_cpu(stat_buf->info1);
+	info2 = le32_to_cpu(stat_buf->info2);
+	dword_lock = u32_get_bits(info2, ATH12K_HTT_DLPAGER_TOTAL_LOCK_PAGES_INFO2);
+	dword_unlock = u32_get_bits(info2, ATH12K_HTT_DLPAGER_TOTAL_FREE_PAGES_INFO2);
+	pg_locked = ATH12K_HTT_STATS_PAGE_LOCKED;
+	pg_unlock = ATH12K_HTT_STATS_PAGE_UNLOCKED;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_DLPAGER_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "ASYNC locked pages = %u\n",
+			 u32_get_bits(info0, ATH12K_HTT_DLPAGER_ASYNC_LOCK_PG_CNT_INFO0));
+	len += scnprintf(buf + len, buf_len - len, "SYNC locked pages = %u\n",
+			 u32_get_bits(info0, ATH12K_HTT_DLPAGER_SYNC_LOCK_PG_CNT_INFO0));
+	len += scnprintf(buf + len, buf_len - len, "Total locked pages = %u\n",
+			 u32_get_bits(info1, ATH12K_HTT_DLPAGER_TOTAL_LOCK_PAGES_INFO1));
+	len += scnprintf(buf + len, buf_len - len, "Total free pages = %u\n",
+			 u32_get_bits(info1, ATH12K_HTT_DLPAGER_TOTAL_FREE_PAGES_INFO1));
+
+	len += scnprintf(buf + len, buf_len - len, "\nLOCKED PAGES HISTORY\n");
+	len += scnprintf(buf + len, buf_len - len, "last_locked_page_idx = %u\n",
+			 dword_lock ? dword_lock - 1 : (ATH12K_PAGER_MAX - 1));
+	for (i = 0; i < ATH12K_PAGER_MAX; i++) {
+		memset(str_buf, 0x0, ATH12K_HTT_MAX_STRING_LEN);
+		ath12k_htt_print_dlpager_entry(&stat_buf->pgs_info[pg_locked][i],
+					       i, str_buf);
+		len += scnprintf(buf + len, buf_len - len, "%s", str_buf);
+	}
+
+	len += scnprintf(buf + len, buf_len - len, "\nUNLOCKED PAGES HISTORY\n");
+	len += scnprintf(buf + len, buf_len - len, "last_unlocked_page_idx = %u\n",
+			 dword_unlock ? dword_unlock - 1 : ATH12K_PAGER_MAX - 1);
+	for (i = 0; i < ATH12K_PAGER_MAX; i++) {
+		memset(str_buf, 0x0, ATH12K_HTT_MAX_STRING_LEN);
+		ath12k_htt_print_dlpager_entry(&stat_buf->pgs_info[pg_unlock][i],
+					       i, str_buf);
+		len += scnprintf(buf + len, buf_len - len, "%s", str_buf);
+	}
+	len += scnprintf(buf + len, buf_len - len, "\n");
+
+	stats_req->buf_len = len;
+}
+
 static void
 ath12k_htt_print_dmac_reset_stats_tlv(const void *tag_buf, u16 tag_len,
 				      struct debug_htt_stats_req *stats_req)
@@ -2869,6 +2952,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_PDEV_OBSS_PD_TAG:
 		ath12k_htt_print_pdev_obss_pd_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_DLPAGER_STATS_TAG:
+		ath12k_htt_print_dlpager_stats_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_DMAC_RESET_STATS_TAG:
 		ath12k_htt_print_dmac_reset_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index ac86cab234ec..dfb6538585d5 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -135,6 +135,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_MU		= 17,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS		= 19,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	= 23,
+	ATH12K_DBG_HTT_EXT_STATS_DLPAGER_STATS		= 36,
 	ATH12K_DBG_HTT_EXT_STATS_SOC_ERROR		= 45,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_SCHED_ALGO	= 49,
 	ATH12K_DBG_HTT_EXT_STATS_MANDATORY_MUOFDMA	= 51,
@@ -194,6 +195,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_PDEV_CTRL_PATH_TX_STATS_TAG		= 102,
 	HTT_STATS_TX_SELFGEN_AC_SCHED_STATUS_STATS_TAG	= 111,
 	HTT_STATS_TX_SELFGEN_AX_SCHED_STATUS_STATS_TAG	= 112,
+	HTT_STATS_DLPAGER_STATS_TAG			= 120,
 	HTT_STATS_MU_PPDU_DIST_TAG			= 129,
 	HTT_STATS_TX_PDEV_MUMIMO_GRP_STATS_TAG		= 130,
 	HTT_STATS_TX_PDEV_RATE_STATS_BE_OFDMA_TAG	= 135,
@@ -1054,6 +1056,35 @@ struct ath12k_htt_pdev_obss_pd_stats_tlv {
 	__le32 num_sr_ppdu_abort_flush_cnt;
 } __packed;
 
+enum ath12k_htt_stats_page_lock_state {
+	ATH12K_HTT_STATS_PAGE_LOCKED	= 0,
+	ATH12K_HTT_STATS_PAGE_UNLOCKED	= 1,
+	ATH12K_NUM_PG_LOCK_STATE
+};
+
+#define ATH12K_PAGER_MAX	10
+
+#define ATH12K_HTT_DLPAGER_ASYNC_LOCK_PG_CNT_INFO0	GENMASK(7, 0)
+#define ATH12K_HTT_DLPAGER_SYNC_LOCK_PG_CNT_INFO0	GENMASK(15, 8)
+#define ATH12K_HTT_DLPAGER_TOTAL_LOCK_PAGES_INFO1	GENMASK(15, 0)
+#define ATH12K_HTT_DLPAGER_TOTAL_FREE_PAGES_INFO1	GENMASK(31, 16)
+#define ATH12K_HTT_DLPAGER_TOTAL_LOCK_PAGES_INFO2	GENMASK(15, 0)
+#define ATH12K_HTT_DLPAGER_TOTAL_FREE_PAGES_INFO2	GENMASK(31, 16)
+
+struct ath12k_htt_pgs_info {
+	__le32 page_num;
+	__le32 num_pgs;
+	__le32 ts_lsb;
+	__le32 ts_msb;
+} __packed;
+
+struct ath12k_htt_dl_pager_stats_tlv {
+	__le32 info0;
+	__le32 info1;
+	__le32 info2;
+	struct ath12k_htt_pgs_info pgs_info[ATH12K_NUM_PG_LOCK_STATE][ATH12K_PAGER_MAX];
+} __packed;
+
 struct ath12k_htt_dmac_reset_stats_tlv {
 	__le32 reset_count;
 	__le32 reset_time_lo_ms;
-- 
2.25.1


