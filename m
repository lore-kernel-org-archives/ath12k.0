Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36716C47DA9
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 06:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN50dkFNzZHZO6mIFcXrtiDFRYOkaQUQ8s6SgKZiSd8=; b=xZIlEJ5kUq29PNSVIcGiqxku2l
	lDO5ufrxK8UchlAQA9/j9cBLSCVdDBFK2Xsk9k1ZBY3XPiUscVWvFLWR+vflLp8W9RGcIesbUUct1
	EoY4mgrO/kaeN95rF5zwJ98L3+I44U/loor7RibPxsn4zyb5ZSDJ2cmHmR82w5WqAmofit2yDJAvO
	oKscEQejLD39Az4CNRU5XqHdbfysrilnXi6iPD4+Hee5HfwxjwliseK2Dk9d8JsL/nM+pJPSqQS5c
	Cu6OpzLziu43lMeYXrLwZYOMrA6gZA1TEIHqofEaL90euuZL0bb08y8NibbRwU/VdmridSIC9pC42
	l+SQKbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhIs-0000000FNtE-2vBe
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 06:09:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhIo-0000000FNrY-1Rq8
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 06:08:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U5qQMT009816;
	Tue, 30 Jan 2024 06:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=DN50dkFNzZHZO6mIFcXrtiDFRYOkaQUQ8s6SgKZiSd8=; b=Su
	vwrmqszBtI9RmluiE3U6pXPnkPaDUocM/seZgfD6ODtRoCwOaZ4JpwKtbYB96WMJ
	OTBvy1hTFH7xy0Vp9rCDUlS01nSuIEusuHb+KPwKCPyP3nj2jWIgp2otu8msppjv
	CvUutAhIDabSvBcrgKqMuNBH8ksa4hBciq3Cu5IZSlY4dubXjuoOWEWint2GMG+5
	MLVHbwJQdTguC2zST4kUNMszHYtoz5ExBNGxFQz/sl5u/tmkt53DPrmT7jFDTjs7
	1tUz8nSrgTJRXmnuew8UvSe8oYmJMfaFsyCSrz61fdw1L9dQE2GR0P81YoJuD6ca
	s7LPLU0OtWZldwxEK3Xg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxhjrs4um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 06:08:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U68uh0019701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 06:08:56 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 22:08:54 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 1/3] wifi: ath12k: Refactor the hardware recovery procedure
Date: Tue, 30 Jan 2024 11:38:36 +0530
Message-ID: <20240130060838.3895599-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130060838.3895599-1-quic_periyasa@quicinc.com>
References: <20240130060838.3895599-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4yYgZzkqvkzeoEps0ksJJla0vI9O-sce
X-Proofpoint-ORIG-GUID: 4yYgZzkqvkzeoEps0ksJJla0vI9O-sce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_02,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_220858_529821_C4560B03 
X-CRM114-Status: GOOD (  17.22  )
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

Currently, in multi-wiphy models, the recovery handler access mac80211
HW from the radio/link structure. This will be incorrect for single wiphy
model, as they will hold multiple link/radio structures. To fix this,
access mac80211 HW based on the number of hardware in the SoC/chip. This
approach makes the recovery handler compatible with both multi wiphy and
single wiphy models.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 119 +++++++++++++------------
 drivers/net/wireless/ath/ath12k/mac.c  |  25 ++++--
 2 files changed, 82 insertions(+), 62 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 1baad3302157..feca204b82b9 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -922,9 +922,8 @@ void ath12k_core_halt(struct ath12k *ar)
 static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
-	struct ath12k_pdev *pdev;
 	struct ath12k_hw *ah;
-	int i;
+	int i, j;
 
 	spin_lock_bh(&ab->base_lock);
 	ab->stats.fw_crash_counter++;
@@ -934,34 +933,33 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		set_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags);
 
 	for (i = 0; i < ab->num_hw; i++) {
-		if (!ab->ah[i])
+		ah = ab->ah[i];
+		if (!ah)
 			continue;
 
-		ah = ab->ah[i];
 		ieee80211_stop_queues(ah->hw);
-	}
 
-	for (i = 0; i < ab->num_radios; i++) {
-		pdev = &ab->pdevs[i];
-		ar = pdev->ar;
-		if (!ar || ar->state == ATH12K_STATE_OFF)
-			continue;
-
-		ath12k_mac_drain_tx(ar);
-		complete(&ar->scan.started);
-		complete(&ar->scan.completed);
-		complete(&ar->peer_assoc_done);
-		complete(&ar->peer_delete_done);
-		complete(&ar->install_key_done);
-		complete(&ar->vdev_setup_done);
-		complete(&ar->vdev_delete_done);
-		complete(&ar->bss_survey_done);
-
-		wake_up(&ar->dp.tx_empty_waitq);
-		idr_for_each(&ar->txmgmt_idr,
-			     ath12k_mac_tx_mgmt_pending_free, ar);
-		idr_destroy(&ar->txmgmt_idr);
-		wake_up(&ar->txmgmt_empty_waitq);
+		for (j = 0; j < ah->num_radio; j++) {
+			ar = &ah->radio[j];
+			if (!ar || ar->state == ATH12K_STATE_OFF)
+				continue;
+
+			ath12k_mac_drain_tx(ar);
+			complete(&ar->scan.started);
+			complete(&ar->scan.completed);
+			complete(&ar->peer_assoc_done);
+			complete(&ar->peer_delete_done);
+			complete(&ar->install_key_done);
+			complete(&ar->vdev_setup_done);
+			complete(&ar->vdev_delete_done);
+			complete(&ar->bss_survey_done);
+
+			wake_up(&ar->dp.tx_empty_waitq);
+			idr_for_each(&ar->txmgmt_idr,
+				     ath12k_mac_tx_mgmt_pending_free, ar);
+			idr_destroy(&ar->txmgmt_idr);
+			wake_up(&ar->txmgmt_empty_waitq);
+		}
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
@@ -970,41 +968,52 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 
 static void ath12k_core_post_reconfigure_recovery(struct ath12k_base *ab)
 {
+	struct ath12k_hw *ah;
 	struct ath12k *ar;
-	struct ath12k_pdev *pdev;
-	int i;
+	int i, j;
+	u8 restart_count;
 
-	for (i = 0; i < ab->num_radios; i++) {
-		pdev = &ab->pdevs[i];
-		ar = pdev->ar;
-		if (!ar || ar->state == ATH12K_STATE_OFF)
+	for (i = 0; i < ab->num_hw; i++) {
+		ah = ab->ah[i];
+		if (!ah)
 			continue;
 
-		mutex_lock(&ar->conf_mutex);
-
-		switch (ar->state) {
-		case ATH12K_STATE_ON:
-			ar->state = ATH12K_STATE_RESTARTING;
-			ath12k_core_halt(ar);
-			ieee80211_restart_hw(ath12k_ar_to_hw(ar));
-			break;
-		case ATH12K_STATE_OFF:
-			ath12k_warn(ab,
-				    "cannot restart radio %d that hasn't been started\n",
-				    i);
-			break;
-		case ATH12K_STATE_RESTARTING:
-			break;
-		case ATH12K_STATE_RESTARTED:
-			ar->state = ATH12K_STATE_WEDGED;
-			fallthrough;
-		case ATH12K_STATE_WEDGED:
-			ath12k_warn(ab,
-				    "device is wedged, will not restart radio %d\n", i);
-			break;
+		for (j = 0, restart_count = 0; j < ah->num_radio; j++) {
+			ar = &ah->radio[j];
+			if (ar->state == ATH12K_STATE_OFF)
+				continue;
+
+			mutex_lock(&ar->conf_mutex);
+
+			switch (ar->state) {
+			case ATH12K_STATE_ON:
+				ar->state = ATH12K_STATE_RESTARTING;
+				ath12k_core_halt(ar);
+				restart_count++;
+				break;
+			case ATH12K_STATE_OFF:
+				ath12k_warn(ab,
+					    "cannot restart radio %d that hasn't been started\n",
+					    j);
+				break;
+			case ATH12K_STATE_RESTARTING:
+				break;
+			case ATH12K_STATE_RESTARTED:
+				ar->state = ATH12K_STATE_WEDGED;
+				fallthrough;
+			case ATH12K_STATE_WEDGED:
+				ath12k_warn(ab,
+					    "device is wedged, will not restart radio %d\n", j);
+				break;
+			}
+			mutex_unlock(&ar->conf_mutex);
 		}
-		mutex_unlock(&ar->conf_mutex);
+
+		/* Restart after all the link/radio got restart */
+		if (restart_count == ah->num_radio)
+			ieee80211_restart_hw(ah->hw);
 	}
+
 	complete(&ab->driver_recovery);
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a27480a69b27..1b465f7fed7f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7114,26 +7114,35 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 	struct ath12k_vif *arvif;
-	int recovery_count;
+	int recovery_count, i;
 
 	if (reconfig_type != IEEE80211_RECONFIG_TYPE_RESTART)
 		return;
 
-	ar = ath12k_ah_to_ar(ah);
-	ab = ar->ab;
+	for (i = 0; i < ah->num_radio; i++) {
+		ar = &ah->radio[i];
 
-	mutex_lock(&ar->conf_mutex);
+		mutex_lock(&ar->conf_mutex);
+
+		if (ar->state != ATH12K_STATE_RESTARTED) {
+			mutex_unlock(&ar->conf_mutex);
+			continue;
+		}
+
+		ab = ar->ab;
 
-	if (ar->state == ATH12K_STATE_RESTARTED) {
 		ath12k_warn(ar->ab, "pdev %d successfully recovered\n",
 			    ar->pdev->pdev_id);
+
 		ar->state = ATH12K_STATE_ON;
 		ieee80211_wake_queues(hw);
 
 		if (ab->is_reset) {
 			recovery_count = atomic_inc_return(&ab->recovery_count);
+
 			ath12k_dbg(ab, ATH12K_DBG_BOOT, "recovery count %d\n",
 				   recovery_count);
+
 			/* When there are multiple radios in an SOC,
 			 * the recovery has to be done for each radio
 			 */
@@ -7152,6 +7161,7 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 				   arvif->key_cipher,
 				   arvif->is_up,
 				   arvif->vdev_type);
+
 			/* After trigger disconnect, then upper layer will
 			 * trigger connect again, then the PN number of
 			 * upper layer will be reset to keep up with AP
@@ -7161,13 +7171,14 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 			    arvif->vdev_type == WMI_VDEV_TYPE_STA &&
 			    arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE) {
 				ieee80211_hw_restart_disconnect(arvif->vif);
+
 				ath12k_dbg(ab, ATH12K_DBG_BOOT,
 					   "restart disconnect\n");
 			}
 		}
-	}
 
-	mutex_unlock(&ar->conf_mutex);
+		mutex_unlock(&ar->conf_mutex);
+	}
 }
 
 static void
-- 
2.34.1


