Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CA0E77188
	for <ath12k@archiver.kernel.org>; Sun, 12 Jan 2025 07:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yv/WDWX3TNq/1x964Dcs6WJnSxe9rFCaDEEGldBDJXU=; b=aQ6BsRd9M4JHL9QJxsYWUCSFPb
	E4Z1h9ubcjZOo7WHu0zr4OfBaF1LiWGjLuMxWpSHbEczVYqSNpRWy9O/sT4666PQGLAePsu+I2ta4
	wg60OIStfUPeC5dXCpEJBFHyxy/zy1NkSeGgKFx/3dGNGKLFrirjxJ1yIDbAxXehVIoN/2GGGLpMl
	C8VrqXOYekGGFMBqGpMCSx13U2EBihJQOYw7OzfH2x69hXrlmQMuu6hHvrqO+ImHVUnCKLJ1Vk0yH
	BDMMeoXHKAibX59FifCHMYYJVAxFVX9nXGEAfh+84WJllkDjwLKJOAL6P5r8tTXkkVeQAmTjB6tcV
	Pw+tkdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsDQ-00000002DfJ-2bmx
	for ath12k@archiver.kernel.org;
	Sun, 12 Jan 2025 07:16:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsDN-00000002DdX-3NRw
	for ath12k@lists.infradead.org;
	Sun, 12 Jan 2025 07:16:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50C6eKsF007663;
	Sun, 12 Jan 2025 07:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yv/WDWX3TNq/1x964Dcs6WJnSxe9rFCaDEEGldBDJXU=; b=GKlEjDNCqR7nPF0b
	+ABOLyvHe4/GKXVOYG4+bWq8f+7Fz8NEJYgoaPcLy/hIiJoO0+D+ECPuFFsQJ79m
	Wpo1PjB+fnnJe6QyUCxQXH3r3AzKc+XlKYWH2IEfW3N0X8ckXiwNH13gPQ3B1ub0
	QJ4af76D9t1hVwtirUDRc6dPxmS9aqAJCB9QvPV7mlrJS38PGkxiFuCGARA/hYyY
	K9KvSEJ0VIkkDvFYWrgWq2O08eEP12GPj9bkGEpoZwAqZmlF0haLhtaWwdbw8Azr
	1dkFeGVk7l1MmP8gAwjsTvhAik8tQ2IOaNY2lNy5IA/DMBAu/Bq+7Tz5p5k/guUJ
	DaR/rg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443htgspf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 07:16:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50C7GpcY022380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 07:16:51 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 11 Jan 2025 23:16:49 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4 3/4] wifi: ath12k: Remove ath12k_get_num_hw() helper function
Date: Sun, 12 Jan 2025 12:46:29 +0530
Message-ID: <20250112071630.4059410-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hWF_VnBxZnNy4IJKyHd5XgG2h6s8l7cq
X-Proofpoint-ORIG-GUID: hWF_VnBxZnNy4IJKyHd5XgG2h6s8l7cq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501120063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_231653_852072_7D40857E 
X-CRM114-Status: GOOD (  17.29  )
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

Currently, the ath12k_get_num_hw() helper function takes the device handle
as an argument. Here, the number of hardware is retrieved from the group
handle. Demanding the device handle from the caller is unnecessary since
in some cases the group handle is already available. Additionally, there
is no longer a need for multiple indirections to get the number of
hardware. Therefore, remove this helper function and directly use
ag->num_hw. This change also fixes the below Smatch static checker
warning.

Smatch warning:
ath12k_mac_destroy() error: we previously assumed 'ab' could be null

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/ath12k/3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain/
Closes: https://scan7.scan.coverity.com/#/project-view/52682/11354?selectedIssue=1602340
Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 20 ++++++++++++--------
 drivers/net/wireless/ath/ath12k/core.h |  7 +------
 drivers/net/wireless/ath/ath12k/mac.c  |  8 ++++----
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index af49e7db4928..0606116d6b9c 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -1173,6 +1173,7 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
 static void ath12k_rfkill_work(struct work_struct *work)
 {
 	struct ath12k_base *ab = container_of(work, struct ath12k_base, rfkill_work);
+	struct ath12k_hw_group *ag = ab->ag;
 	struct ath12k *ar;
 	struct ath12k_hw *ah;
 	struct ieee80211_hw *hw;
@@ -1183,8 +1184,8 @@ static void ath12k_rfkill_work(struct work_struct *work)
 	rfkill_radio_on = ab->rfkill_radio_on;
 	spin_unlock_bh(&ab->base_lock);
 
-	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ag_to_ah(ab->ag, i);
+	for (i = 0; i < ag->num_hw; i++) {
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
 
@@ -1224,6 +1225,7 @@ void ath12k_core_halt(struct ath12k *ar)
 
 static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 {
+	struct ath12k_hw_group *ag = ab->ag;
 	struct ath12k *ar;
 	struct ath12k_hw *ah;
 	int i, j;
@@ -1235,8 +1237,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 	if (ab->is_reset)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
-	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ag_to_ah(ab->ag, i);
+	for (i = 0; i < ag->num_hw; i++) {
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1270,12 +1272,13 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 
 static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 {
+	struct ath12k_hw_group *ag = ab->ag;
 	struct ath12k_hw *ah;
 	struct ath12k *ar;
 	int i, j;
 
-	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
-		ah = ath12k_ag_to_ah(ab->ag, i);
+	for (i = 0; i < ag->num_hw; i++) {
+		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
@@ -1318,6 +1321,7 @@ static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 static void ath12k_core_restart(struct work_struct *work)
 {
 	struct ath12k_base *ab = container_of(work, struct ath12k_base, restart_work);
+	struct ath12k_hw_group *ag = ab->ag;
 	struct ath12k_hw *ah;
 	int ret, i;
 
@@ -1336,7 +1340,7 @@ static void ath12k_core_restart(struct work_struct *work)
 			ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset success\n");
 		}
 
-		for (i = 0; i < ath12k_get_num_hw(ab); i++) {
+		for (i = 0; i < ag->num_hw; i++) {
 			ah = ath12k_ag_to_ah(ab->ag, i);
 			ieee80211_restart_hw(ah->hw);
 		}
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4932bd1c2096..ee595794a7ae 100644
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
@@ -1205,11 +1205,6 @@ static inline void ath12k_ag_set_ah(struct ath12k_hw_group *ag, int idx,
 	ag->ah[idx] = ah;
 }
 
-static inline int ath12k_get_num_hw(struct ath12k_base *ab)
-{
-	return ab->ag->num_hw;
-}
-
 static inline struct ath12k_hw_group *ath12k_ab_to_ag(struct ath12k_base *ab)
 {
 	return ab->ag;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 285bb88acb90..08f340afb970 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -11243,7 +11243,7 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 	int i;
 	int ret;
 
-	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
+	for (i = 0; i < ag->num_hw; i++) {
 		ah = ath12k_ag_to_ah(ag, i);
 
 		ret = ath12k_mac_hw_register(ah);
@@ -11275,7 +11275,7 @@ void ath12k_mac_unregister(struct ath12k_hw_group *ag)
 
 	clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
 
-	for (i = ath12k_get_num_hw(ab) - 1; i >= 0; i--) {
+	for (i = ag->num_hw - 1; i >= 0; i--) {
 		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
@@ -11356,7 +11356,7 @@ void ath12k_mac_destroy(struct ath12k_hw_group *ag)
 		}
 	}
 
-	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
+	for (i = 0; i < ag->num_hw; i++) {
 		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)
 			continue;
-- 
2.34.1


