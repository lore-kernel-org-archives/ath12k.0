Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B14C7114A
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 05:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3hKsvUTprNG6Wed3vkpZNQriTeC8l64fmrvMWBbEYQ=; b=0PkJ3xxGlf0JhaJcvIQd50JEh0
	hbNFk++prlRftLvYuh4b1nM4/xNhCiCpz/D/xVYuK9VE2L8hNKbydd/awhrpzlon+wItQGQ3i5ugg
	D+aNO43OYV3Zoyl6XhaF2VssNR8Txx49vFdnHszgdvkMw+JnSEFUg5lyG9Ri+H3G/WOv9xcKd5T8W
	5S+usAdEJBE/FdMuJMei02EjjdLKFckV7zaLqF+0877sFP8fHC4jmnCPz8eF7IEF7AQB/EVepKZ0F
	SDj+sNi34Embi0U+AXlpNWiYzoe1xbbo/W0xq3xT7RvgALKgJsbZRNuJzhRgG7CzC7Yc5bSHuTeJT
	+uGgtGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROcb-00000006ErB-2gZ2;
	Tue, 17 Jun 2025 05:12:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROcY-00000006Eoj-1okr
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 05:12:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHEhiB023126;
	Tue, 17 Jun 2025 05:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S3hKsvUTprNG6Wed3vkpZNQriTeC8l64fmrvMWBbEYQ=; b=mWMe+Pln3KA97rq+
	A3DxTjxZyJzNt/nysawoNSgcnGG38vUCco2fkF7nWtc/vzoNF2zTQlKS3iFmdeLe
	dE6DeIGrN0Y0jWgGXfi20UjsLOV3auhuM4H+EtXeLPokOofDJg0ahG7jLl1qQr0a
	NaTZeUTLiUhtQVbKyH2wmg0MtKZkaOfkR80F/0I9OxHvE85tTOqZcJM4PrkRsHDj
	WIeY/RHySYq434pvEosa8eKEa0tL/ItUX09LhpEYYT0xRr1PHIIu1iY2TyMYIyyo
	HhJL5pcnU/UeSwdlBHaGMuAJDgNzyW4ay5uymVMf8+SETgiTgN6WaZUZKGWdAAA2
	6mR1kQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcxwsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 05:12:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55H5CSvg006410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 05:12:28 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 16 Jun 2025 22:12:26 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Maharaja Kennadyrajan
	<quic_mkenna@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: Add support to TDMA and MLO stats
Date: Tue, 17 Jun 2025 10:41:35 +0530
Message-ID: <20250617051136.264193-2-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617051136.264193-1-quic_rdevanat@quicinc.com>
References: <20250617051136.264193-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA0MCBTYWx0ZWRfXxRnjrwkh7dqy
 2ueFEuBmPZURSai/ZdMD0oWKCywPik9XGJQuKUX95lMa4ucwUbq2hQ6GmxCAc8dntgGZ/y/ia5p
 7Ve4SR3TGK8PXH5Zesod6zB6knhqfWZBxkufvFAwTsXv9WAzjY8/+uxr3nZzk4VNy7ErKMUe5l7
 nN/vklSSnFReJDGkPbNKyuESTF3bsnf8fN/ZHrYdiKB4sBR8ANEvg7C2cgZow/EqTx0o0KfUBsY
 gEcaiYx/BlarXFDx1BKED0lo9T/k2sDfMQdupMWahDLXam2C94unehcv9buePzKUyqdyPACywP7
 e7g+K/N5kFJ0WXTRzDuqN+G4HWwcoNCL3+StrysQHTvlJPANUlSNE1/kornb8R08Ow8j8D+/LAw
 9w8k7dbGgBwpbcRj3mLQCwFZQY2CP1jERt1xo05JrHxCLqDRIl6BsgIn9EwPKi9y27BEBUUw
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6850f93d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=fjPev5xa1oA52D2kRcUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VsZl5ATf7gsrG80RZCK2ShaoVe94XNhz
X-Proofpoint-GUID: VsZl5ATf7gsrG80RZCK2ShaoVe94XNhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_221230_486483_C47F5549 
X-CRM114-Status: GOOD (  14.50  )
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

From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>

Add support to request TDMA stats, MLO scheduled stats and MLO IPC stats
from firmware through HTT stats type 57, 63 and 64, respectively. These
stats give information about TDMA schedules, TDMA slot switches, MLO
preferred timeout, delay, MLO IPC ring count, etc.

Note: WCN firmware version -
WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 does not support
tags HTT_STATS_PDEV_TDMA_TAG(187), HTT_STATS_MLO_SCHED_STATS_TAG(190)
and HTT_STATS_PDEV_MLO_IPC_STATS_TAG(191), currently.

Sample output:
echo 57 > /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats
HTT_PDEV_TDMA_STATS_TLV:
mac_id = 0
num_tdma_active_schedules = 0
num_tdma_reserved_schedules = 0
num_tdma_restricted_schedules = 0
num_tdma_unconfigured_schedules = 0
num_tdma_slot_switches = 0
num_tdma_edca_switches = 0

echo 63 > /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats
HTT_STATS_MLO_SCHED_STATS:
num_sec_link_sched = 0
num_pref_link_timeout = 0
num_pref_link_sch_delay_ipc = 0
num_pref_link_timeout_ipc = 0

echo 64 > /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats
HTT_STATS_MLO_IPC_STATS:
src_link: 0
mlo_ipc_ring_full_cnt[0]: 0
mlo_ipc_ring_full_cnt[1]: 0
mlo_ipc_ring_full_cnt[2]: 0
mlo_ipc_ring_full_cnt[3]: 0
mlo_ipc_ring_full_cnt[4]: 0
mlo_ipc_ring_full_cnt[5]: 0
mlo_ipc_ring_full_cnt[6]: 0

src_link: 1
mlo_ipc_ring_full_cnt[0]: 0
mlo_ipc_ring_full_cnt[1]: 0
mlo_ipc_ring_full_cnt[2]: 0
mlo_ipc_ring_full_cnt[3]: 0
mlo_ipc_ring_full_cnt[4]: 0
mlo_ipc_ring_full_cnt[5]: 0
mlo_ipc_ring_full_cnt[6]: 0
.....

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 96 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 30 ++++++
 2 files changed, 126 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index aeaf970339d4..3bc3bc3f47a0 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -5015,6 +5015,93 @@ ath12k_htt_print_rx_pdev_rate_ext_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_pdev_tdma_stats_tlv(const void *tag_buf, u16 tag_len,
+				     struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_pdev_tdma_stats_tlv *htt_stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+	u32 mac_id_word;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	mac_id_word = le32_to_cpu(htt_stats_buf->mac_id__word);
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PDEV_TDMA_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 u32_get_bits(mac_id_word, ATH12K_HTT_STATS_MAC_ID));
+	len += scnprintf(buf + len, buf_len - len, "num_tdma_active_schedules = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_tdma_active_schedules));
+	len += scnprintf(buf + len, buf_len - len, "num_tdma_reserved_schedules = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_tdma_reserved_schedules));
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_tdma_restricted_schedules = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_tdma_restricted_schedules));
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_tdma_unconfigured_schedules = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_tdma_unconfigured_schedules));
+	len += scnprintf(buf + len, buf_len - len, "num_tdma_slot_switches = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_tdma_slot_switches));
+	len += scnprintf(buf + len, buf_len - len, "num_tdma_edca_switches = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->num_tdma_edca_switches));
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_mlo_sched_stats_tlv(const void *tag_buf, u16 tag_len,
+				     struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_mlo_sched_stats_tlv *stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+
+	if (tag_len < sizeof(*stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_STATS_MLO_SCHED_STATS:\n");
+	len += scnprintf(buf + len, buf_len - len, "num_sec_link_sched = %u\n",
+			 le32_to_cpu(stats_buf->pref_link_num_sec_link_sched));
+	len += scnprintf(buf + len, buf_len - len, "num_pref_link_timeout = %u\n",
+			 le32_to_cpu(stats_buf->pref_link_num_pref_link_timeout));
+	len += scnprintf(buf + len, buf_len - len, "num_pref_link_sch_delay_ipc = %u\n",
+			 le32_to_cpu(stats_buf->pref_link_num_pref_link_sch_delay_ipc));
+	len += scnprintf(buf + len, buf_len - len, "num_pref_link_timeout_ipc = %u\n\n",
+			 le32_to_cpu(stats_buf->pref_link_num_pref_link_timeout_ipc));
+
+	stats_req->buf_len = len;
+}
+
+static void
+ath12k_htt_print_mlo_ipc_stats_tlv(const void *tag_buf, u16 tag_len,
+				   struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_pdev_mlo_ipc_stats_tlv *stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+	u8 i, j;
+
+	if (tag_len < sizeof(*stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_STATS_MLO_IPC_STATS:\n");
+	for (i = 0; i < ATH12K_HTT_HWMLO_MAX_LINKS; i++) {
+		len += scnprintf(buf + len, buf_len - len, "src_link: %u\n", i);
+		for (j = 0; j < ATH12K_HTT_MLO_MAX_IPC_RINGS; j++)
+			len += scnprintf(buf + len, buf_len - len,
+					 "mlo_ipc_ring_full_cnt[%u]: %u\n", j,
+					 le32_to_cpu(stats_buf->mlo_ipc_ring_cnt[i][j]));
+		len += scnprintf(buf + len, buf_len - len, "\n");
+	}
+
+	stats_req->buf_len = len;
+}
+
 static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
@@ -5283,6 +5370,15 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_RX_PDEV_RATE_EXT_STATS_TAG:
 		ath12k_htt_print_rx_pdev_rate_ext_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_PDEV_TDMA_TAG:
+		ath12k_htt_print_pdev_tdma_stats_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_MLO_SCHED_STATS_TAG:
+		ath12k_htt_print_mlo_sched_stats_tlv(tag_buf, len, stats_req);
+		break;
+	case HTT_STATS_PDEV_MLO_IPC_STATS_TAG:
+		ath12k_htt_print_mlo_ipc_stats_tlv(tag_buf, len, stats_req);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index c2a02cf8a38b..42163ca09fee 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -155,6 +155,9 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_SCHED_ALGO		= 49,
 	ATH12K_DBG_HTT_EXT_STATS_MANDATORY_MUOFDMA		= 51,
 	ATH12K_DGB_HTT_EXT_STATS_PDEV_MBSSID_CTRL_FRAME		= 54,
+	ATH12K_DBG_HTT_PDEV_TDMA_STATS				= 57,
+	ATH12K_DBG_HTT_MLO_SCHED_STATS				= 63,
+	ATH12K_DBG_HTT_PDEV_MLO_IPC_STATS			= 64,
 
 	/* keep this last */
 	ATH12K_DBG_HTT_NUM_EXT_STATS,
@@ -247,6 +250,9 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_PDEV_SCHED_ALGO_OFDMA_STATS_TAG	= 165,
 	HTT_STATS_TXBF_OFDMA_AX_STEER_MPDU_STATS_TAG	= 172,
 	HTT_STATS_PDEV_MBSSID_CTRL_FRAME_STATS_TAG	= 176,
+	HTT_STATS_PDEV_TDMA_TAG				= 187,
+	HTT_STATS_MLO_SCHED_STATS_TAG			= 190,
+	HTT_STATS_PDEV_MLO_IPC_STATS_TAG		= 191,
 
 	HTT_STATS_MAX_TAG,
 };
@@ -1872,4 +1878,28 @@ struct ath12k_htt_pdev_mbssid_ctrl_frame_tlv {
 	__le32 ul_mumimo_trigger_within_bss;
 } __packed;
 
+struct ath12k_htt_pdev_tdma_stats_tlv {
+	__le32 mac_id__word;
+	__le32 num_tdma_active_schedules;
+	__le32 num_tdma_reserved_schedules;
+	__le32 num_tdma_restricted_schedules;
+	__le32 num_tdma_unconfigured_schedules;
+	__le32 num_tdma_slot_switches;
+	__le32 num_tdma_edca_switches;
+} __packed;
+
+struct ath12k_htt_mlo_sched_stats_tlv {
+	__le32 pref_link_num_sec_link_sched;
+	__le32 pref_link_num_pref_link_timeout;
+	__le32 pref_link_num_pref_link_sch_delay_ipc;
+	__le32 pref_link_num_pref_link_timeout_ipc;
+} __packed;
+
+#define ATH12K_HTT_HWMLO_MAX_LINKS	6
+#define ATH12K_HTT_MLO_MAX_IPC_RINGS	7
+
+struct ath12k_htt_pdev_mlo_ipc_stats_tlv {
+	__le32 mlo_ipc_ring_cnt[ATH12K_HTT_HWMLO_MAX_LINKS][ATH12K_HTT_MLO_MAX_IPC_RINGS];
+} __packed;
+
 #endif
-- 
2.25.1


