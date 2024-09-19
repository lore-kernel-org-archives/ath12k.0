Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C08CE8D72
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2BdgiGby0KnqaazWcRYjCKRo2KEq9zcNE0LDjo294Kc=; b=FNIqIxKnhiLiuAja7KfYyi4fRs
	RH02evzXA4qHRoA3PBmpPz3BcegvPmO++6VqLks9GfLUL3z3sOYSF0WNLr2pq/oQ1AG7Qxal7nxvI
	PEjdCxxfiJNZ4jXqLzHj348bTLsu0XuM3FueLD0BJ+EeB7uGv2znePbapVbGMeQwLYYhrjQX9BUaC
	TFoBRzySiGJewsTasjj5qfVARKSY/vTqgA6LfLutv1IirCYFjio9nYyvIZccv0YrsJdqi6WXJA6PU
	9s1gYKdN1vqkKViEmvuTudXHlR1RG9Q0yaFB37pwdgXPCCOPPVNQMBeG3/W2aepKnlcfdYJHPslEl
	25qdHLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srEFY-0000000A1h6-0NpV
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 10:19:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srEF7-0000000A1fP-3Qmd
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 10:18:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JA6vWr023247;
	Thu, 19 Sep 2024 10:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2BdgiGby0KnqaazWcRYjCK
	Ro2KEq9zcNE0LDjo294Kc=; b=HLSqXbpLpcM91pqQGAtWAZUvOJX53W603ZGFsx
	LOKW7KWK5IKQE/GkstES1ifRgU251pRSt6ZaJHv3R4jcGvg1MfRsjW0SVXwYZ8Fw
	zovrZew8BAmgCCUszwJqPubcMQQEm/yRA6/9SF21puFtbKKz9QBNKp3tBV9pzA+i
	05iV58KoMQW6Zr6n12ahP9CGTBfxoZ6Pq8Xw2IAcf89k2fdkFXxnzM56SpmVZQxE
	6qv5rNJvKdIUTembepDpdjENrUyXuhNrHI1wAw7KAZDxpy0IMaqvlZpkxxd1Fm9U
	HOmvx6Nyr3fJL7qIpzGaSlWm5XDtQ9ICWH2/idZ+9bqSZkJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnvymd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 10:18:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JAITLj004938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 10:18:29 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Sep 2024 03:18:28 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [PATCH] wifi: ath12k: Support Pdev OBSS Stats
Date: Thu, 19 Sep 2024 15:48:12 +0530
Message-ID: <20240919101812.941145-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FzR6btkTSGynAYVNMh1eTxR8yW2mU4w9
X-Proofpoint-ORIG-GUID: FzR6btkTSGynAYVNMh1eTxR8yW2mU4w9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_031834_043514_14CD7010 
X-CRM114-Status: GOOD (  14.67  )
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

Add support to request pdev OBSS stats from firmware through stats
type 23. These stats give information about PPDUs transmitted or
tried to be transmitted in Spatial Reuse Groups(SRG), Parameterized
Spatial Reuse(PSR) and non-PSR groups.

Sample output:
-------------
echo 23 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
HTT_PDEV_OBSS_PD_STATS_TLV:
num_spatial_reuse_tx = 0
num_spatial_reuse_opportunities = 0
num_non_srg_opportunities = 0
num_non_srg_ppdu_tried = 0
.....

HTT_PDEV_OBSS_PD_PER_AC_STATS:
Access Category 0 (best effort)
num_non_srg_ppdu_tried = 0
num_non_srg_ppdu_success = 0
num_srg_ppdu_tried = 0
num_srg_ppdu_success = 0

Access Category 1 (background)
num_non_srg_ppdu_tried = 0
num_non_srg_ppdu_success = 0
num_srg_ppdu_tried = 0
num_srg_ppdu_success = 0
.....

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
Depends-on:
[PATCH] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
Link: https://lore.kernel.org/linux-wireless/20240730035154.3723773-1-quic_rdevanat@quicinc.com/

[PATCH 0/4] wifi: ath12k: Support Ring, SFM, Transmit MU, SelfGen stats, CCA stats
Link: https://lore.kernel.org/linux-wireless/20240913082949.573482-4-quic_rdevanat@quicinc.com/T/
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 68 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 24 +++++++
 2 files changed, 92 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 2c17e080a0e6..28cb9cc999f5 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -2431,6 +2431,71 @@ ath12k_htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_pdev_obss_pd_stats_tlv(const void *tag_buf, u16 tag_len,
+					struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_pdev_obss_pd_stats_tlv *htt_stats_buf = tag_buf;
+	u8 *buf = stats_req->buf;
+	u32 len = stats_req->buf_len;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u8 i;
+	static const char *access_cat_names[ATH12K_HTT_NUM_AC_WMM] = {"best effort",
+								      "background",
+								      "video", "voice"};
+
+	if (tag_len < sizeof(*htt_stats_buf))
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PDEV_OBSS_PD_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "num_spatial_reuse_tx = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_sr_tx_transmissions));
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_spatial_reuse_opportunities = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_spatial_reuse_opportunities));
+	len += scnprintf(buf + len, buf_len - len, "num_non_srg_opportunities = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_non_srg_opportunities));
+	len += scnprintf(buf + len, buf_len - len, "num_non_srg_ppdu_tried = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_non_srg_ppdu_tried));
+	len += scnprintf(buf + len, buf_len - len, "num_non_srg_ppdu_success = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_non_srg_ppdu_success));
+	len += scnprintf(buf + len, buf_len - len, "num_srg_opportunities = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_srg_opportunities));
+	len += scnprintf(buf + len, buf_len - len, "num_srg_ppdu_tried = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_srg_ppdu_tried));
+	len += scnprintf(buf + len, buf_len - len, "num_srg_ppdu_success = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_srg_ppdu_success));
+	len += scnprintf(buf + len, buf_len - len, "num_psr_opportunities = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_psr_opportunities));
+	len += scnprintf(buf + len, buf_len - len, "num_psr_ppdu_tried = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_psr_ppdu_tried));
+	len += scnprintf(buf + len, buf_len - len, "num_psr_ppdu_success = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_psr_ppdu_success));
+	len += scnprintf(buf + len, buf_len - len, "min_duration_check_flush_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_obss_min_dur_check_flush_cnt));
+	len += scnprintf(buf + len, buf_len - len, "sr_ppdu_abort_flush_cnt = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->num_sr_ppdu_abort_flush_cnt));
+
+	len += scnprintf(buf + len, buf_len - len, "HTT_PDEV_OBSS_PD_PER_AC_STATS:\n");
+	for (i = 0; i < ATH12K_HTT_NUM_AC_WMM; i++) {
+		len += scnprintf(buf + len, buf_len - len, "Access Category %u (%s)\n",
+				 i, access_cat_names[i]);
+		len += scnprintf(buf + len, buf_len - len,
+				 "num_non_srg_ppdu_tried = %u\n",
+				 le32_to_cpu(htt_stats_buf->num_non_srg_tried_per_ac[i]));
+		len += scnprintf(buf + len, buf_len - len,
+				 "num_non_srg_ppdu_success = %u\n",
+				 le32_to_cpu(htt_stats_buf->num_non_srg_success_ac[i]));
+		len += scnprintf(buf + len, buf_len - len, "num_srg_ppdu_tried = %u\n",
+				 le32_to_cpu(htt_stats_buf->num_srg_tried_per_ac[i]));
+		len += scnprintf(buf + len, buf_len - len,
+				 "num_srg_ppdu_success = %u\n\n",
+				 le32_to_cpu(htt_stats_buf->num_srg_success_per_ac[i]));
+	}
+
+	stats_req->buf_len = len;
+}
+
 static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
@@ -2601,6 +2666,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_PDEV_CCA_COUNTERS_TAG:
 		ath12k_htt_print_pdev_stats_cca_counters_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_PDEV_OBSS_PD_TAG:
+		ath12k_htt_print_pdev_obss_pd_stats_tlv(tag_buf, len, stats_req);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index b37ba1256ce5..597334830d02 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -134,6 +134,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_EXT_STATS_SFM_INFO		= 16,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_MU		= 17,
 	ATH12K_DBG_HTT_EXT_STATS_PDEV_CCA_STATS		= 19,
+	ATH12K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	= 23,
 
 	/* keep this last */
 	ATH12K_DBG_HTT_NUM_EXT_STATS,
@@ -184,6 +185,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_TX_PDEV_MPDU_STATS_TAG		= 74,
 	HTT_STATS_SCHED_TXQ_SCHED_ORDER_SU_TAG		= 86,
 	HTT_STATS_SCHED_TXQ_SCHED_INELIGIBILITY_TAG	= 87,
+	HTT_STATS_PDEV_OBSS_PD_TAG			= 88,
 	HTT_STATS_HW_WAR_TAG				= 89,
 	HTT_STATS_SCHED_TXQ_SUPERCYCLE_TRIGGER_TAG	= 100,
 	HTT_STATS_PDEV_CTRL_PATH_TX_STATS_TAG		= 102,
@@ -1024,4 +1026,26 @@ struct ath12k_htt_pdev_cca_stats_hist_v1_tlv {
 	__le32 collection_interval;
 } __packed;
 
+struct ath12k_htt_pdev_obss_pd_stats_tlv {
+	__le32 num_obss_tx_ppdu_success;
+	__le32 num_obss_tx_ppdu_failure;
+	__le32 num_sr_tx_transmissions;
+	__le32 num_spatial_reuse_opportunities;
+	__le32 num_non_srg_opportunities;
+	__le32 num_non_srg_ppdu_tried;
+	__le32 num_non_srg_ppdu_success;
+	__le32 num_srg_opportunities;
+	__le32 num_srg_ppdu_tried;
+	__le32 num_srg_ppdu_success;
+	__le32 num_psr_opportunities;
+	__le32 num_psr_ppdu_tried;
+	__le32 num_psr_ppdu_success;
+	__le32 num_non_srg_tried_per_ac[ATH12K_HTT_NUM_AC_WMM];
+	__le32 num_non_srg_success_ac[ATH12K_HTT_NUM_AC_WMM];
+	__le32 num_srg_tried_per_ac[ATH12K_HTT_NUM_AC_WMM];
+	__le32 num_srg_success_per_ac[ATH12K_HTT_NUM_AC_WMM];
+	__le32 num_obss_min_dur_check_flush_cnt;
+	__le32 num_sr_ppdu_abort_flush_cnt;
+} __packed;
+
 #endif

base-commit: 92de67902177c2ea65000a87a6b24fed17d48a18
prerequisite-patch-id: 970109034faa25a7630720c0da29c875e821f9ec
prerequisite-patch-id: 0bda913781a634c055869a033aa9b34d10825a20
prerequisite-patch-id: 4d37990775694f110ce3e87096231fe8855f09f5
prerequisite-patch-id: 121409543edef60c5f6144dd7ae3a615a78520f7
prerequisite-patch-id: ecac67f6fce1dd4d5089dbc3da840e311f6a7218
-- 
2.25.1


