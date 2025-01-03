Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79CBE77188
	for <ath12k@archiver.kernel.org>; Fri,  3 Jan 2025 06:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y3yDPdCsnGvJ+HMYuk/D2T1htXVEziJBGfaE21D44s=; b=iWqhjTjln3gX/DzNPh34sufkt6
	GebnFYy4+i4UWNSOUMyOyskEWMtxel2Va9W4wqcIOpMLmBUcwaF7fX347X5Mqe46dxADBBTXaNegx
	irzTbbUbewnzCC48kWP3LlKxZvgzH6X1Woy6KN60+wOpZl9VLkMzOk2W4UlGuhGi9K8XJ3AJIhav5
	Z+VR16LSMFiKmKpWW2kcgxj5eHskYSwwJZNVfuizqYK9srbAmFEdGvtlZXYOEhIyIXLRm8R/ZgMnL
	cfMoTMAFm1R3HijMLkUrbRR2ldQYpXKI3eY6XXbeB0ZWa6hrt4Dtc+lEyZfF/DWh5r6nTUh+Y3Veo
	gwP8/F7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTb3i-0000000CC1K-1kd1
	for ath12k@archiver.kernel.org;
	Fri, 03 Jan 2025 06:21:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTb3f-0000000CC0J-1xz2
	for ath12k@lists.infradead.org;
	Fri, 03 Jan 2025 06:21:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5033pdfi012302;
	Fri, 3 Jan 2025 06:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5y3yDPdCsnGvJ+HMYuk/D2T1htXVEziJBGfaE21D44s=; b=amTr4dixP6xu4E3o
	R+32Q0hT78rPfvz2EoDCUJEA21AMp3mi6P8jkYqO0BW07i8v2oMdAklHrTzBWQEz
	SWF85f5VR/olZp+S0bR4ktehsQYtlA1g6KilpsYsShrf6lhx1fOOpBfHqOSkR9Sd
	QzE6TDIFFVn0O33zkNSzAsTcdjHLwreYDFekk99CqMzmPSSgaf0e6hq0E9WJONC1
	bUCdAkvxwgnAZlIu5ch0M8BlFQlRjKVc6x0O+OCK9jBYiy9Z/kEeqW6Ul2i80tXk
	lEYgZawWLdS4bQJ5sm/zCHfwunzmuMDNksf7QZ2qgR8CVZaVjM7QnvO8fv0PKsuR
	Os8p4w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43x8c0g8vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 06:21:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5036L6Qt002000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 06:21:06 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 22:21:05 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 1/3] wifi: ath12k: optimize storage size for struct ath12k
Date: Fri, 3 Jan 2025 14:20:39 +0800
Message-ID: <20250103062041.1857-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250103062041.1857-1-quic_kangyang@quicinc.com>
References: <20250103062041.1857-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hBDAVk8SrzcdnbiI3vv_HxROlj0bUOPx
X-Proofpoint-ORIG-GUID: hBDAVk8SrzcdnbiI3vv_HxROlj0bUOPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_222119_509870_7A72DC7A 
X-CRM114-Status: GOOD (  11.85  )
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
 drivers/net/wireless/ath/ath12k/core.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index b789b375b891..a7830e9c4374 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
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


