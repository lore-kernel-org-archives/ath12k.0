Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82234E7716A
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 05:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkrn0QiJcUSdE76yu3bqH8NO/1nDAkUJfudZRqKzAeM=; b=eD6xGb8AWw+/NEeNITxr7Xf+rQ
	EXu5zXWU8hpu29ej2WZblix/9OJJEbFPn9I/19jI2Z2BuXaCqYvh1HUWnX22aImXPcqxgsJaX4Rnu
	dStbuMCA6OuQ2LcNaOw8fGov0RF7D5b+1+R9mN1dC0mWLMr9WW9gUvo0FFs5+/NJcyOiKrSkK6Xih
	2/iTrBTELVLY5M5nZyeJ4iIWe9xNCXdGQp7YxuLFs1cS9BAsfpvPq86XLPQQtWgjPFm8fFPnDMXun
	RTx5NrYPjjc+pxaXNGOiUnlY/j6WDChoaGwV7mHvsOqYqdf0Ul1N1ryqRLcctyV6C9hS1YE6UJOAn
	0tNfjBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQXS-0000000CM4m-0R6j
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 05:54:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQXO-0000000CM3m-2uSC
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 05:54:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH02Sfx027340;
	Tue, 17 Dec 2024 05:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pkrn0QiJcUSdE76yu3bqH8NO/1nDAkUJfudZRqKzAeM=; b=CYKEyDzhP6a5xMSf
	DoEJxVI99wcvrHH9yEy8hh/TAevbLpI4RTx8x1imDOQn4QXscDp7r+vMnqtXnmz7
	64fBVwgN0skFPdBVHj+HykjloILrxif6wZ1vdP+EEXPQekFGTWsavtN+5xu+zDWI
	GhCqISOiHy9DCpxWEWaAyhMVvfLfaOvSv1N2hKLiyQM20OlVKph/AWzCfODsWMKm
	s297p/0ITgj5TVjH4W0DxX9jCweonaa3yooGiFi1L4qIgRWINtT1aa8l3Jgw8u4G
	996wkmRVZ+PACmhy6pVu7AQZ0W5SMu7w1DAAqD3njpLFqRPjNhqrrh4A1XjFeCCO
	eJt13g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jxdm0phu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 05:54:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH5sTgo017304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 05:54:29 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 21:54:27 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v4 1/2] wifi: ath12k: Support AST Entry Stats
Date: Tue, 17 Dec 2024 11:24:07 +0530
Message-ID: <20241217055408.1293764-2-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217055408.1293764-1-quic_rdevanat@quicinc.com>
References: <20241217055408.1293764-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pJ9ZBtWnjjDdUnDOBelUygHEXcnaVvIg
X-Proofpoint-ORIG-GUID: pJ9ZBtWnjjDdUnDOBelUygHEXcnaVvIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_215430_737326_4F57D0C9 
X-CRM114-Status: GOOD (  12.90  )
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

Add support to request Address Search Table(AST) entries stats
from firmware through HTT stats type 41. These stats give AST entries
related information such as software peer id, MAC address, pdev id,
vdev, id, next hop, etc.

Sample output:
-------------
echo 41 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_AST_ENTRY_TLV:
ast_index = 10
mac_addr = 00:00:00:01:00:00
sw_peer_id = 0
pdev_id = 3
vdev_id = 255
next_hop = 0
mcast = 0
monitor_direct = 0
mesh_sta = 0
mec = 0
intra_bss = 0

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 56 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 18 ++++++
 drivers/net/wireless/ath/ath12k/dp.h          | 12 ++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index c43bf032270f..9294ef41a169 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -3469,6 +3469,59 @@ ath12k_htt_print_tx_per_rate_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_ast_entry_tlv(const void *tag_buf, u16 tag_len,
+			       struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_ast_entry_tlv *htt_stats_buf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+	u32 mac_addr_l32;
+	u32 mac_addr_h16;
+	u32 ast_info;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	mac_addr_l32 = le32_to_cpu(htt_stats_buf->mac_addr.mac_addr_l32);
+	mac_addr_h16 = le32_to_cpu(htt_stats_buf->mac_addr.mac_addr_h16);
+	ast_info = le32_to_cpu(htt_stats_buf->info);
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_AST_ENTRY_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "ast_index = %u\n",
+			 le32_to_cpu(htt_stats_buf->ast_index));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mac_addr = %02x:%02x:%02x:%02x:%02x:%02x\n",
+			 u32_get_bits(mac_addr_l32, ATH12K_HTT_MAC_ADDR_L32_0),
+			 u32_get_bits(mac_addr_l32, ATH12K_HTT_MAC_ADDR_L32_1),
+			 u32_get_bits(mac_addr_l32, ATH12K_HTT_MAC_ADDR_L32_2),
+			 u32_get_bits(mac_addr_l32, ATH12K_HTT_MAC_ADDR_L32_3),
+			 u32_get_bits(mac_addr_h16, ATH12K_HTT_MAC_ADDR_H16_0),
+			 u32_get_bits(mac_addr_h16, ATH12K_HTT_MAC_ADDR_H16_1));
+
+	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %u\n",
+			 le32_to_cpu(htt_stats_buf->sw_peer_id));
+	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
+			 u32_get_bits(ast_info, ATH12K_HTT_AST_PDEV_ID_INFO));
+	len += scnprintf(buf + len, buf_len - len, "vdev_id = %u\n",
+			 u32_get_bits(ast_info, ATH12K_HTT_AST_VDEV_ID_INFO));
+	len += scnprintf(buf + len, buf_len - len, "next_hop = %u\n",
+			 u32_get_bits(ast_info, ATH12K_HTT_AST_NEXT_HOP_INFO));
+	len += scnprintf(buf + len, buf_len - len, "mcast = %u\n",
+			 u32_get_bits(ast_info, ATH12K_HTT_AST_MCAST_INFO));
+	len += scnprintf(buf + len, buf_len - len, "monitor_direct = %u\n",
+			 u32_get_bits(ast_info, ATH12K_HTT_AST_MONITOR_DIRECT_INFO));
+	len += scnprintf(buf + len, buf_len - len, "mesh_sta = %u\n",
+			 u32_get_bits(ast_info, ATH12K_HTT_AST_MESH_STA_INFO));
+	len += scnprintf(buf + len, buf_len - len, "mec = %u\n",
+			 u32_get_bits(ast_info, ATH12K_HTT_AST_MEC_INFO));
+	len += scnprintf(buf + len, buf_len - len, "intra_bss = %u\n\n",
+			 u32_get_bits(ast_info, ATH12K_HTT_AST_INTRA_BSS_INFO));
+
+	stats_req->buf_len = len;
+}
+
 static void
 ath12k_htt_print_dmac_reset_stats_tlv(const void *tag_buf, u16 tag_len,
 				      struct debug_htt_stats_req *stats_req)
@@ -3877,6 +3930,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_PER_RATE_STATS_TAG:
 		ath12k_htt_print_tx_per_rate_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_AST_ENTRY_TAG:
+		ath12k_htt_print_ast_entry_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_DMAC_RESET_STATS_TAG:
 		ath12k_htt_print_dmac_reset_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index a718f8dfe321..9a9dd368c5d6 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -141,6 +141,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_PHY_COUNTERS_AND_PHY_STATS	= 37,
 	ATH12K_DBG_HTT_EXT_VDEVS_TXRX_STATS		= 38,
 	ATH12K_DBG_HTT_EXT_PDEV_PER_STATS		= 40,
+	ATH12K_DBG_HTT_EXT_AST_ENTRIES			= 41,
 	ATH12K_DBG_HTT_EXT_STATS_SOC_ERROR		= 45,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_SCHED_ALGO	= 49,
 	ATH12K_DBG_HTT_EXT_STATS_MANDATORY_MUOFDMA	= 51,
@@ -211,6 +212,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_PER_RATE_STATS_TAG			= 128,
 	HTT_STATS_MU_PPDU_DIST_TAG			= 129,
 	HTT_STATS_TX_PDEV_MUMIMO_GRP_STATS_TAG		= 130,
+	HTT_STATS_AST_ENTRY_TAG				= 132,
 	HTT_STATS_TX_PDEV_RATE_STATS_BE_OFDMA_TAG	= 135,
 	HTT_STATS_TX_SELFGEN_BE_ERR_STATS_TAG		= 137,
 	HTT_STATS_TX_SELFGEN_BE_STATS_TAG		= 138,
@@ -1293,6 +1295,22 @@ struct ath12k_htt_t2h_soc_txrx_stats_common_tlv {
 	__le32 inv_peers_msdu_drop_count_lo;
 } __packed;
 
+#define ATH12K_HTT_AST_PDEV_ID_INFO		GENMASK(1, 0)
+#define ATH12K_HTT_AST_VDEV_ID_INFO		GENMASK(9, 2)
+#define ATH12K_HTT_AST_NEXT_HOP_INFO		BIT(10)
+#define ATH12K_HTT_AST_MCAST_INFO		BIT(11)
+#define ATH12K_HTT_AST_MONITOR_DIRECT_INFO	BIT(12)
+#define ATH12K_HTT_AST_MESH_STA_INFO		BIT(13)
+#define ATH12K_HTT_AST_MEC_INFO			BIT(14)
+#define ATH12K_HTT_AST_INTRA_BSS_INFO		BIT(15)
+
+struct ath12k_htt_ast_entry_tlv {
+	__le32 sw_peer_id;
+	__le32 ast_index;
+	struct htt_mac_addr mac_addr;
+	__le32 info;
+} __packed;
+
 struct ath12k_htt_dmac_reset_stats_tlv {
 	__le32 reset_count;
 	__le32 reset_time_lo_ms;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 7700828375e3..7a6a5c0ae73b 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1792,6 +1792,18 @@ enum vdev_stats_offload_timer_duration {
 	ATH12K_STATS_TIMER_DUR_2SEC = 3,
 };
 
+#define ATH12K_HTT_MAC_ADDR_L32_0	GENMASK(7, 0)
+#define ATH12K_HTT_MAC_ADDR_L32_1	GENMASK(15, 8)
+#define ATH12K_HTT_MAC_ADDR_L32_2	GENMASK(23, 16)
+#define ATH12K_HTT_MAC_ADDR_L32_3	GENMASK(31, 24)
+#define ATH12K_HTT_MAC_ADDR_H16_0	GENMASK(7, 0)
+#define ATH12K_HTT_MAC_ADDR_H16_1	GENMASK(15, 8)
+
+struct htt_mac_addr {
+	__le32 mac_addr_l32;
+	__le32 mac_addr_h16;
+} __packed;
+
 static inline void ath12k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
 {
 	memcpy(addr, &addr_l32, 4);
-- 
2.25.1


