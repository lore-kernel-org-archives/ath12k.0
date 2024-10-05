Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE1CCF886F
	for <ath12k@archiver.kernel.org>; Sat,  5 Oct 2024 11:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmUY7DaLYWyj7wJ8g7gEF5AbhTVPWDeg3NKGRbNg+GI=; b=YmF8PFI4Sb/FgNtPYyRv8HHGaY
	lamZPMq6FanBDgFwaSZZojg74FEinDrT0yi2QzS/jTKR+9mUvzQYTF4L2u60UZcM2fWTTU5hwTrUL
	KMzeZ8m+9byBA1oPp+N1av+j/XF5jT3gaHjNRZba3niDmc0y0iO7ksn86SDwyFHbiv6Um7l05KVx/
	GqFP9l46mrEapbhwGMFzmJaAEIJ14b7XPZon2kuLEhzXiDG70Vrzbd5QJYKDKT1SPqmtoO9nJnpSm
	TUQSxzAkonEWACkQiB/5m4j3RFsFEDSxLTSnVHcwJfDSfCV5HQzKEB5EukZ/Zh0JNPWBrpbThoj+0
	S7AutQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx2sD-0000000FGTz-0ysv
	for ath12k@archiver.kernel.org;
	Sat, 05 Oct 2024 11:22:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx2sB-0000000FGTB-0zYo
	for ath12k@lists.infradead.org;
	Sat, 05 Oct 2024 11:22:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495AR8e5022373;
	Sat, 5 Oct 2024 11:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmUY7DaLYWyj7wJ8g7gEF5AbhTVPWDeg3NKGRbNg+GI=; b=SkkzWSZtj7azPFxe
	7vVehSnMR4GGZaRyJHK3lRzZSqLNWU/2k28mowWjlBWSo1Uu1GT8Ha4qZRGzrxWs
	w0viaK77V76c2AD4jVPm3kYFJoyzYX8iaADtup9Innr74odLgZMTERh7DDIM8mI9
	JW89JE0IlR4PUvo4d40MSVTK6z2Hssimivu8/AOKzngXd9uqTughJ/diQezafA0H
	6D8Z5aSQqce0S+4rWDQW91QX2gWYX2r+gSBozHBIXaH0wRwqC9+fVPuyuV/4EmeW
	HN373VIlz/y0izj2qSBWCt5QmTeiw4z6VfY8pw4NNk0AmtqoLdVHiOzTkfUapeVg
	UR9rbA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs70erc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 11:22:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495BMrA2026856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 11:22:53 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 5 Oct 2024 04:22:51 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH v2 1/2] wifi: ath12k: Support AST Entry Stats
Date: Sat, 5 Oct 2024 16:52:33 +0530
Message-ID: <20241005112234.3379043-2-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241005112234.3379043-1-quic_rdevanat@quicinc.com>
References: <20241005112234.3379043-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GgEyVk1_9YT_OCQmbNURM_7lhlklll86
X-Proofpoint-GUID: GgEyVk1_9YT_OCQmbNURM_7lhlklll86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_042255_314149_D9B70619 
X-CRM114-Status: GOOD (  12.65  )
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

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 56 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 18 ++++++
 drivers/net/wireless/ath/ath12k/dp.h          | 12 ++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 8dc158675e12..63f3e8e78efd 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -2542,6 +2542,59 @@ ath12k_htt_print_pdev_obss_pd_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_ast_entry_tlv(const void *tag_buf, u16 tag_len,
+			       struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_ast_entry_tlv *htt_stats_buf = tag_buf;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
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
@@ -2869,6 +2922,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_PDEV_OBSS_PD_TAG:
 		ath12k_htt_print_pdev_obss_pd_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_AST_ENTRY_TAG:
+		ath12k_htt_print_ast_entry_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_DMAC_RESET_STATS_TAG:
 		ath12k_htt_print_dmac_reset_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index ac86cab234ec..6978c3243ee3 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -135,6 +135,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_MU		= 17,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS		= 19,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	= 23,
+	ATH12K_DBG_HTT_EXT_AST_ENTRIES			= 41,
 	ATH12K_DBG_HTT_EXT_STATS_SOC_ERROR		= 45,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_SCHED_ALGO	= 49,
 	ATH12K_DBG_HTT_EXT_STATS_MANDATORY_MUOFDMA	= 51,
@@ -196,6 +197,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_SELFGEN_AX_SCHED_STATUS_STATS_TAG	= 112,
 	HTT_STATS_MU_PPDU_DIST_TAG			= 129,
 	HTT_STATS_TX_PDEV_MUMIMO_GRP_STATS_TAG		= 130,
+	HTT_STATS_AST_ENTRY_TAG				= 132,
 	HTT_STATS_TX_PDEV_RATE_STATS_BE_OFDMA_TAG	= 135,
 	HTT_STATS_TX_SELFGEN_BE_ERR_STATS_TAG		= 137,
 	HTT_STATS_TX_SELFGEN_BE_STATS_TAG		= 138,
@@ -1122,4 +1124,20 @@ struct ath12k_htt_tx_pdev_rate_stats_be_ofdma_tlv {
 	__le32 be_ofdma_eht_sig_mcs[ATH12K_HTT_TX_PDEV_NUM_EHT_SIG_MCS_CNTRS];
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
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 07180eec8f26..83c509dcc44f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1789,6 +1789,18 @@ enum vdev_stats_offload_timer_duration {
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


