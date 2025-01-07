Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0D9E77188
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 02:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGIviWtggc5YprwKyU6EcO5tiswcfTg6E33b3UJYhXA=; b=JVLNRIvDu5Qd/m9FOiAs4F22Wi
	lYPFE3rT5LWAZb+g2AHDfLDU/zpVnHQ/oToTlBRttPJa2k8YfTHzZ6XdeBWEq/0RQNGNsQzLxUNqX
	v/EWOCAriMWEUn3qf7yDBX9zSaygdJ6uc3oi0rSE3K6kBa6EsXiqXPAzP1Ii25KOa1RQyhGSeafpS
	7r/Kw8rbi9vkPrpEnVt5bnlvEpIS8KYF0D9vmZAKIadmFzJk1tc6qS+5zOgRgjemmR/WAxuz+vwAF
	UMVcAlbWWEJ4YOhNkf90bIosnGEdQNjDrmdw2BNgph59nloto84TxnXF9Mx7eo5KU7im8Lm27PvB5
	xcVUFg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUzm0-00000003GAZ-3ez9
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 02:56:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUzlv-00000003G8Z-38eh
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 02:56:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506GbZ8m006191;
	Tue, 7 Jan 2025 02:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGIviWtggc5YprwKyU6EcO5tiswcfTg6E33b3UJYhXA=; b=GmfJ7dgtYfTyB6x0
	JCY58wuznO4dOyUPCbbEWewttVQv0IGeB8UTXFd9Kq3r2thubVaCM+uuPuj0kSI/
	ofCZV1RMg0NlroQpOn3UOIoArS8f30JrmjE0IStHpJc0vg9e1eWTZZ2lA2+qfIGj
	A2JKHv6SfWT4J5sRC5Hoetrg2ojzVBz7ItquOCwG7oV9SyCVTxQQ66GQ26MVV7tg
	iQ1IHsrxLeI7Gus4ToHA3qScr7cKKeNJvrJvWCKmCny5dNR3yTi7RwRm5AaW8Pu+
	oTwWdkDkqnFIhBP9NAEwWIZyFMN1vR0P5XyYvvEQOXUmq0/P971WVXlujiwPXX00
	7bz+Cg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440jv395nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 02:56:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5072ujf4002727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 02:56:45 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 6 Jan 2025 18:56:44 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 1/3] wifi: ath12k: optimize storage size for struct ath12k
Date: Tue, 7 Jan 2025 10:56:19 +0800
Message-ID: <20250107025621.1907-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250107025621.1907-1-quic_kangyang@quicinc.com>
References: <20250107025621.1907-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eag2Is__YIiybi2_Rr3X522XfKnF0Zw8
X-Proofpoint-ORIG-GUID: eag2Is__YIiybi2_Rr3X522XfKnF0Zw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_185647_915206_C2EF5D30 
X-CRM114-Status: GOOD (  12.60  )
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

Optimize storage size for struct ath12k by clean up bool variables.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index b789b375b891..41a51c7bad6c 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_CORE_H
@@ -591,16 +591,15 @@ struct ath12k {
 	u32 ht_cap_info;
 	u32 vht_cap_info;
 	struct ath12k_he ar_he;
-	bool supports_6ghz;
 	struct {
 		struct completion started;
 		struct completion completed;
 		struct completion on_channel;
 		struct delayed_work timeout;
 		enum ath12k_scan_state state;
-		bool is_roc;
+		bool is_roc:1;
+		bool roc_notify:1;
 		int roc_freq;
-		bool roc_notify;
 		struct wiphy_work vdev_clean_wk;
 		struct ath12k_link_vif *arvif;
 	} scan;
@@ -679,7 +678,6 @@ struct ath12k {
 	 * However there are deviations from this rule. This flag is used to
 	 * avoid reporting garbage data.
 	 */
-	bool ch_info_can_report_survey;
 	struct survey_info survey[ATH12K_NUM_CHANS];
 	struct completion bss_survey_done;
 
@@ -690,7 +688,6 @@ struct ath12k {
 
 	struct ath12k_wow wow;
 	struct completion target_suspend;
-	bool target_suspend_ack;
 	struct ath12k_per_peer_tx_stats peer_tx_stats;
 	struct list_head ppdu_stats_info;
 	u32 ppdu_stat_list_depth;
@@ -702,16 +699,20 @@ struct ath12k {
 	struct ath12k_debug debug;
 #endif
 
-	bool dfs_block_radar_events;
-	bool monitor_conf_enabled;
-	bool monitor_vdev_created;
-	bool monitor_started;
+	bool supports_6ghz:1;
+	bool ch_info_can_report_survey:1;
+	bool target_suspend_ack:1;
+	bool dfs_block_radar_events:1;
+	bool monitor_conf_enabled:1;
+	bool monitor_vdev_created:1;
+	bool monitor_started:1;
+	bool nlo_enabled:1;
+	/* Add new boolean variable here. */
+
 	int monitor_vdev_id;
 
 	struct wiphy_radio_freq_range freq_range;
 
-	bool nlo_enabled;
-
 	struct completion mlo_setup_done;
 	u32 mlo_setup_status;
 };
-- 
2.34.1


