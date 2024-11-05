Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD6D1CA1A
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 04:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qUVLTy7YLtAeFFjjg9xlyKvzez1O5ZVM+cCiqDnNuw=; b=dZ9E2b82RBqlkBvJxNZkqtP5K7
	h6p57EjsPVD8mBXgfybyAj/UAvImCLbuMTySDQglsS40WgWdjW1tPZjmMqXJqJW9D2xX54PxFg/08
	/Xs0Qolp6Zgmbi09t3QPRiiAQ52edWYBw5WJHcIFMpqpR6E3fqIopn3izpePZDm3qrKHGFqd0wvJr
	Mbq0aUp3RvyJXMhxUK883+00QeSwqWx0RIKZZTo9rGxLWUum1uPAWe8Ir2ja6kq26v62HRTEDCPhX
	Dak0wGj13ZoaqYzuJNoq4zD5IQdZmyIDwxMMUFWnyrsMbeL9nWCNCubKZy+N6sKDYdXlkS2/vqLEW
	tYR8rRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8B1o-0000000Fr4O-1svl
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 04:18:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8B1l-0000000Fr3C-3HyW
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 04:18:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIijr009112;
	Tue, 5 Nov 2024 04:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qUVLTy7YLtAeFFjjg9xlyKvzez1O5ZVM+cCiqDnNuw=; b=ZnNJhJs/5lmlQeYK
	mvHxp9+kWOr4kl/g6WEw5XP/X0JOxLmAwjAQ7vqvdkvkK2BR969NkQNq18bCytu2
	mwYpNgHHukilWR2xYAA4w8fPxGKVzOU0FIcti0vsgn/EQKS4W9sQha+KTYR6rwuT
	W/Ccz1UYrMT733o9eVqRepkrv7I3GuhvEm555yWOrkCZp+F64kvnrm/sbOvDXHWq
	1PiBrYQ1gsNyiI7EezDBKlqVsJzCdbbK5VljoELhQofYWp3Y6xHy8rq7dLRIcDoz
	uZXvd0Q04ZjsXb6kF+yINyUSOePZuEddO2EsaTkwoZ0J1PYGqs2ZmI3nKElB3cOg
	8gNamA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4upakf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 04:18:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A54IlD4031961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 04:18:47 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 20:18:45 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH v2 3/4] wifi: ath12k: Support SoC Common Stats
Date: Tue, 5 Nov 2024 09:48:21 +0530
Message-ID: <20241105041822.2039214-4-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105041822.2039214-1-quic_rdevanat@quicinc.com>
References: <20241105041822.2039214-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MzdFXADopmyL6BmLOoaS7NTOZAoBb3gO
X-Proofpoint-ORIG-GUID: MzdFXADopmyL6BmLOoaS7NTOZAoBb3gO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_201849_974474_7649586E 
X-CRM114-Status: GOOD (  12.93  )
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

Add support to request SoC stat from firmware through HTT stat
type 38. This stat gives drop count of SoC.

Note: MCC firmware version -
WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
support tag HTT_STATS_SOC_TXRX_STATS_COMMON_TAG(125).

Sample output:
-------------
echo 38 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_SOC_COMMON_STATS_TLV:
soc_drop_count = 0x0000000000000000

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 23 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  7 ++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 732e600d33fa..8f89ba2db8c7 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -2859,6 +2859,26 @@ ath12k_htt_print_phy_tpc_stats_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_soc_txrx_stats_common_tlv(const void *tag_buf, u16 tag_len,
+					   struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_t2h_soc_txrx_stats_common_tlv *htt_stats_buf = tag_buf;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_SOC_COMMON_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "soc_drop_count = 0x%08x%08x\n\n",
+			 le32_to_cpu(htt_stats_buf->inv_peers_msdu_drop_count_hi),
+			 le32_to_cpu(htt_stats_buf->inv_peers_msdu_drop_count_lo));
+
+	stats_req->buf_len = len;
+}
+
 static void
 ath12k_htt_print_dmac_reset_stats_tlv(const void *tag_buf, u16 tag_len,
 				      struct debug_htt_stats_req *stats_req)
@@ -3204,6 +3224,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_PHY_TPC_STATS_TAG:
 		ath12k_htt_print_phy_tpc_stats_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_SOC_TXRX_STATS_COMMON_TAG:
+		ath12k_htt_print_soc_txrx_stats_common_tlv(tag_buf, len, stats_req);
+		break;
 	case HTT_STATS_DMAC_RESET_STATS_TAG:
 		ath12k_htt_print_dmac_reset_stats_tlv(tag_buf, len, stats_req);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index 10d7ca9c02f4..c07b60636c22 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -137,6 +137,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	= 23,
 	ATH12K_DBG_HTT_EXT_STATS_DLPAGER_STATS		= 36,
 	ATH12K_DBG_HTT_EXT_PHY_COUNTERS_AND_PHY_STATS	= 37,
+	ATH12K_DBG_HTT_EXT_VDEVS_TXRX_STATS		= 38,
 	ATH12K_DBG_HTT_EXT_STATS_SOC_ERROR		= 45,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_SCHED_ALGO	= 49,
 	ATH12K_DBG_HTT_EXT_STATS_MANDATORY_MUOFDMA	= 51,
@@ -201,6 +202,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_PHY_STATS_TAG				= 122,
 	HTT_STATS_PHY_RESET_COUNTERS_TAG		= 123,
 	HTT_STATS_PHY_RESET_STATS_TAG			= 124,
+	HTT_STATS_SOC_TXRX_STATS_COMMON_TAG		= 125,
 	HTT_STATS_MU_PPDU_DIST_TAG			= 129,
 	HTT_STATS_TX_PDEV_MUMIMO_GRP_STATS_TAG		= 130,
 	HTT_STATS_TX_PDEV_RATE_STATS_BE_OFDMA_TAG	= 135,
@@ -1183,6 +1185,11 @@ struct ath12k_htt_phy_tpc_stats_tlv {
 	__le32 sub_band_txpower[ATH12K_HTT_MAX_CH_PWR_INFO_SIZE];
 } __packed;
 
+struct ath12k_htt_t2h_soc_txrx_stats_common_tlv {
+	__le32 inv_peers_msdu_drop_count_hi;
+	__le32 inv_peers_msdu_drop_count_lo;
+} __packed;
+
 struct ath12k_htt_dmac_reset_stats_tlv {
 	__le32 reset_count;
 	__le32 reset_time_lo_ms;
-- 
2.25.1


