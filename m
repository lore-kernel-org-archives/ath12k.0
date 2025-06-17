Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CADC71157
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 11:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fZEJ1YoW34s+5f12xSDDnyA4iYVdxuW2oCK8xwV/2Yo=; b=y//4CC4t7PO8KJJQRJar0wjg35
	PU9D+wiGpHE0KIND+NEdAIJ2Lhxa+4A0KX/Vy3qEz102znxU+DX2JTbAl49fdGY8r72GEEbEF22+8
	3JsgNJ7+/nS+QK8AY6//ZFzWEyj2rsHxfttS9tJE8UaR/3ctL/Ew8xtOOMtEcP4ATZubM5OhaSlZj
	M58hTfb1LNrddMVl7N3493jk+6S/3fCPJO25aZ3ManBOfAngiOdfqhWokQVhBp/tGGNJR1bO5PE/i
	7/o7Y/jWRWEIm0lgf3R5b4kCkB3rg3gBJ9qmnhHaIhr8ly/bQTF3vMV2Ubfv01YMSkDHYbRyKRbKL
	JyEF+ACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUOD-000000071gJ-1zas;
	Tue, 17 Jun 2025 11:22:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUOA-000000071fp-37lU
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 11:22:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7sLZI018553;
	Tue, 17 Jun 2025 11:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fZEJ1YoW34s+5f12xSDDny
	A4iYVdxuW2oCK8xwV/2Yo=; b=H/v7irp5CKl7ax/t5/7A9Kzuxjj61kpeo982BX
	q8+oMQbkxSsZGa0giNc613tS/uPWNJJiV/fK0rX+6piAw+VFaNm3Xwkm5ZHg+GNb
	klXcPSaOnOPZaeHWX6HKmP5w/8wBnAWf5K5FCOvESh8VxlJFCTrTK5dyYYm+f0fv
	PNjBwrwAT8tqJU7GvyAUiYluwxw3Soi5rAege4r/EM++XBrZ/Lz5U4lQ7UbBIPM/
	Y3WO4eA+M3QAc+IO2IWn24Sy8z58+Ocu/FUwBZcNyGlEVlZbQWm21sMi+5stQy21
	CXqymJ4rH/ohKTihmAQ8ellmOvtAA2u4DUaVf/9kCytCEDsw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfg65k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 11:22:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HBM10p009819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 11:22:01 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Jun 2025 04:21:59 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Saleemuddin Shaik
	<quic_saleemud@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Add support for transmit histogram stats
Date: Tue, 17 Jun 2025 16:51:39 +0530
Message-ID: <20250617112139.865788-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5MSBTYWx0ZWRfXxhkmnGUuPT8+
 FXAsdasZFBR+ylP2Q/3TNv2JXF9Zm5afHZXD/qudyibLMU0UOFZnbrmWn1nwpgBt/baiMncTb5g
 aYm7DKlY5p3bM5HWewQmsF6GsI7gOsvnHoEcr3cZ5uEwpIRnefpD8/4q8f3Qk9EXMABn7zQ0zA+
 BLRtGEcp1ztevz5dw8oyAc3cUF5i1y8DjwLrA1Fq6M+dAow1UBnpb8c1zUTq4n4o0r9u57G1ZG/
 oQcljH9qN4t8AwWZ5T1Q7pxwp4uB4cLCPWZ53Xpy2JFqlHdY4BcdfHzIc7nVtGd+kJ7TQYSO2d7
 iMEqHhky75MiyLH/8PCinQW/XwamUqbZOx0co7KuPg4y2BDmDXcWvlC+JEseZRHso1JI+2+BxYI
 EjxpqyqvpoJG0r/njC51+aLxF+90iqEaLSGda6w8MT44yKEPtU2KXxtODK5kC/cttM7CjseL
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68514fda cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=7xaFyXMt0exzL7mAYkQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IT9KXInntEo1fD9Dx-FJ5VwsVtvLtpfz
X-Proofpoint-ORIG-GUID: IT9KXInntEo1fD9Dx-FJ5VwsVtvLtpfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_042202_794011_B39DF384 
X-CRM114-Status: GOOD (  12.99  )
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

From: Saleemuddin Shaik <quic_saleemud@quicinc.com>

Add support for transmit histogram stats under HTT stats type 9. These
stats give information about drop count, MCS drop rate, histogram
count, etc.

Note: WCN7850 firmware version -
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 does not support tag
HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG(144), currently.

Sample output:
echo 9 > /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats
...
low_latency_rate_cnt =  0
su_burst_rate_drop_cnt = 0
su_burst_rate_drop_fail_cnt = 0
rate_retry_mcs_drop_cnt = 0

PER_HISTOGRAM_STATS
mcs_drop_rate =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
per_histogram_count =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0,
11:0, 12:0, 13:0, 14:0, 15:0, 16:0, 17:0, 18:0, 19:0, 20:0,
21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0, 28:0, 29:0, 30:0,
31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0, 38:0, 39:0, 40:0,
41:0, 42:0, 43:0, 44:0, 45:0, 46:0, 47:0, 48:0, 49:0, 50:0,
51:0, 52:0, 53:0, 54:0, 55:0, 56:0, 57:0, 58:0, 59:0, 60:0,
61:0, 62:0, 63:0, 64:0, 65:0, 66:0, 67:0, 68:0, 69:0, 70:0,
71:0, 72:0, 73:0, 74:0, 75:0, 76:0, 77:0, 78:0, 79:0, 80:0,
81:0, 82:0, 83:0, 84:0, 85:0, 86:0, 87:0, 88:0, 89:0, 90:0,
91:0, 92:0, 93:0, 94:0, 95:0, 96:0, 97:0, 98:0, 99:0, 100:0

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saleemuddin Shaik <quic_saleemud@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
v2:
 - Removed 'inline' keyword from function definition to resolve wifibot
   error.
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 36 ++++++++++++++++++-
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 16 +++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index aeaf970339d4..0da6c91dd314 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -4720,7 +4720,38 @@ ath12k_htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, u16 tag_len,
 	len += print_array_to_buf(buf, len, "tx_pream", htt_stats_buf->tx_pream,
 				  ATH12K_HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES, "\n");
 	len += print_array_to_buf(buf, len, "tx_dcm", htt_stats_buf->tx_dcm,
-				  ATH12K_HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS, "\n");
+				  ATH12K_HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS, "\n\n");
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_histogram_stats_tlv(const void *tag_buf, u16 tag_len,
+				     struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_tx_histogram_stats_tlv *stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "low_latency_rate_cnt =  %u\n",
+			 le32_to_cpu(stats_buf->low_latency_rate_cnt));
+	len += scnprintf(buf + len, buf_len - len, "su_burst_rate_drop_cnt = %u\n",
+			 le32_to_cpu(stats_buf->su_burst_rate_drop_cnt));
+	len += scnprintf(buf + len, buf_len - len, "su_burst_rate_drop_fail_cnt = %u\n",
+			 le32_to_cpu(stats_buf->su_burst_rate_drop_fail_cnt));
+	len += scnprintf(buf + len, buf_len - len, "rate_retry_mcs_drop_cnt = %u\n",
+			 le32_to_cpu(stats_buf->rate_retry_mcs_drop_cnt));
+
+	len += scnprintf(buf + len, buf_len - len, "\nPER_HISTOGRAM_STATS\n");
+	len += print_array_to_buf(buf, len, "mcs_drop_rate", stats_buf->mcs_drop_rate,
+				  ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS, "\n");
+	len += print_array_to_buf(buf, len, "per_histogram_count",
+				  stats_buf->per_histogram_cnt,
+				  ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS, "\n\n");
 
 	stats_req->buf_len = len;
 }
@@ -5277,6 +5308,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_TX_PDEV_RATE_STATS_TAG:
 		ath12k_htt_print_tx_pdev_rate_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG:
+		ath12k_htt_print_histogram_stats_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_RX_PDEV_RATE_STATS_TAG:
 		ath12k_htt_print_rx_pdev_rate_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index c2a02cf8a38b..5fc5d8c00355 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -237,6 +237,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_SELFGEN_BE_ERR_STATS_TAG		= 137,
 	HTT_STATS_TX_SELFGEN_BE_STATS_TAG		= 138,
 	HTT_STATS_TX_SELFGEN_BE_SCHED_STATUS_STATS_TAG	= 139,
+	HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG		= 144,
 	HTT_STATS_TXBF_OFDMA_AX_NDPA_STATS_TAG		= 147,
 	HTT_STATS_TXBF_OFDMA_AX_NDP_STATS_TAG		= 148,
 	HTT_STATS_TXBF_OFDMA_AX_BRP_STATS_TAG		= 149,
@@ -418,6 +419,12 @@ struct ath12k_htt_tx_pdev_mu_ppdu_dist_stats_tlv {
 #define ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS   2
 #define ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS  2
 #define ATH12K_HTT_TX_PDEV_STATS_NUM_11AX_TRIGGER_TYPES   6
+#define ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS	  101
+
+#define ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS \
+	(ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS + \
+	 ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS + \
+	 ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS)
 
 struct ath12k_htt_tx_pdev_rate_stats_tlv {
 	__le32 mac_id_word;
@@ -472,6 +479,15 @@ struct ath12k_htt_tx_pdev_rate_stats_tlv {
 	__le32 tx_bw_320mhz;
 };
 
+struct ath12k_htt_tx_histogram_stats_tlv {
+	__le32 rate_retry_mcs_drop_cnt;
+	__le32 mcs_drop_rate[ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS];
+	__le32 per_histogram_cnt[ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS];
+	__le32 low_latency_rate_cnt;
+	__le32 su_burst_rate_drop_cnt;
+	__le32 su_burst_rate_drop_fail_cnt;
+};
+
 #define ATH12K_HTT_RX_PDEV_STATS_NUM_LEGACY_CCK_STATS		4
 #define ATH12K_HTT_RX_PDEV_STATS_NUM_LEGACY_OFDM_STATS		8
 #define ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS		12

base-commit: 7fb79ce2693c94f8f74bf62ad25a97e4b61721b8
-- 
2.25.1


