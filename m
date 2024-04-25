Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B9C19F4F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kB3y0JXTRmpRYY9qL27rTlf0BkN0Ylmp2g5dSpDHqGk=; b=HwftCeI83eyExlizCfOF6E2yQK
	WWHnCFWJJePq/h7CtKzqcFrLpMSV7gpgTHAzXqaz7Mcnt7pOYF0gQsUDX09nyeDquiXnUJnhxFP9w
	+u+s5Ps3p6BN84t7crQDgfK54ZkgDoyFSYKdwDPjiosjbAm9WOxc58C8ZTCiQpHuUfl6kXLJBO4Dk
	UStAMi4JaLAzLGd+C5M1E5M27piSZCS4aeTLTyUX02McB0pb8NHB2Jj1Hl+Mp0kUYAIGddxVBqneg
	AZdHUXrDCpoGLg8jYNT3q0sYXpYKlOyVrO7V0LU2CYyZ5Ia3R2VKKI+ifC4xM8mZfGVtItzp18oqC
	JZnNfo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzv0r-00000007WWx-0fh7
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 09:03:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzv0n-00000007WV5-1z9V
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 09:03:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P5D7Cc003026;
	Thu, 25 Apr 2024 09:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=kB3y0JXTRmpRYY9qL27rTlf0BkN0Ylmp2g5dSpDHqGk=; b=px
	i518kn2qPUS04kuyrs7kt7EKSn8eMI3E8At8mOuZA83eYHOym4jbJxu6W/kS7S0v
	adj/NXTvM6hHouRxI8aGrL3x5l2yzwmr81D469v1eRp4lTyXWAbI73bWVamrmh9b
	0tqBDrLHSf2wx1+RBzJvxsORJjEAcuCkjSreoRvX9VAIjv/iP7w3UkFkyuJiB4n+
	AvVaTSksGuxQwom7L26WASpgtTWqZkQ5ooh9l3EnHs/cM9s9j4U3urhP4IP2Lzd0
	JMv7aT5OA3XDLuZJGiemwVO3BTeKUIzHbIIjhVK30Il9gxecEN7WYrICSrYLrMQB
	pRV/vVWBAkdDCc5tjj/Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenkhhqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:03:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43P93NMT014609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:03:23 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 02:03:21 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 1/3] wifi: ath12k: Refactor the hardware recovery procedure
Date: Thu, 25 Apr 2024 14:33:05 +0530
Message-ID: <20240425090307.3233434-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425090307.3233434-1-quic_periyasa@quicinc.com>
References: <20240425090307.3233434-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6aFzcBM8dmT5VAyy-D3JJDQM5zCZfLPF
X-Proofpoint-GUID: 6aFzcBM8dmT5VAyy-D3JJDQM5zCZfLPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_09,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_020325_656424_F56B1BB5 
X-CRM114-Status: GOOD (  17.06  )
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
 drivers/net/wireless/ath/ath12k/mac.c  |  23 +++--
 2 files changed, 80 insertions(+), 62 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 6663f4e1792d..ae14614c3568 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -994,9 +994,8 @@ void ath12k_core_halt(struct ath12k *ar)
 static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 {
 	struct ath12k *ar;
-	struct ath12k_pdev *pdev;
 	struct ath12k_hw *ah;
-	int i;
+	int i, j;
 
 	spin_lock_bh(&ab->base_lock);
 	ab->stats.fw_crash_counter++;
@@ -1006,35 +1005,34 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
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
+		for (j = 0; j < ah->num_radio; j++) {
+			ar = &ah->radio[j];
+			if (ar->state == ATH12K_STATE_OFF)
+				continue;
 
-		ath12k_mac_drain_tx(ar);
-		complete(&ar->scan.started);
-		complete(&ar->scan.completed);
-		complete(&ar->scan.on_channel);
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
+			ath12k_mac_drain_tx(ar);
+			complete(&ar->scan.started);
+			complete(&ar->scan.completed);
+			complete(&ar->scan.on_channel);
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
@@ -1043,41 +1041,52 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 
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
index 56b1f8b6844e..27664845e990 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7910,26 +7910,33 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 	struct ath12k_vif *arvif;
-	int recovery_count;
+	int recovery_count, i;
 
 	if (reconfig_type != IEEE80211_RECONFIG_TYPE_RESTART)
 		return;
 
-	ar = ath12k_ah_to_ar(ah, 0);
-	ab = ar->ab;
+	for_each_ar(ah, ar, i) {
+		mutex_lock(&ar->conf_mutex);
 
-	mutex_lock(&ar->conf_mutex);
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
@@ -7948,6 +7955,7 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 				   arvif->key_cipher,
 				   arvif->is_up,
 				   arvif->vdev_type);
+
 			/* After trigger disconnect, then upper layer will
 			 * trigger connect again, then the PN number of
 			 * upper layer will be reset to keep up with AP
@@ -7957,13 +7965,14 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
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


