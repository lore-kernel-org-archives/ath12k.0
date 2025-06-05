Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5733C5AE59
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7AgNGohyuHwznRb/NWY98uyYm0XW6Bli7qL1fCuFkEY=; b=jIfsI9P62yQ6TemNoWgkOQZo4H
	IRQlp/uvxCUpJPVNDL2JSh8ZC4pz3HvVX8H6xbbPMZksC4viq3xw9ndA3fS7xK4txWxG6M87fqK+u
	R3wpW59NLo+AawiI0oCHRLJ8XGVtqXg0xTjVy53pUru3F/WPdcKs0MWKM354M62QDhKv66NEKdgT9
	eGr3f9/mwoRDZjOif+unyekivEdrDWqElneNKncrPABXUuUMH0YXMaLNOwBxVmVoOM3xkDn1PbNla
	LeO/qa9Y7utIYbw/ZFJ9wmI1qzrCdc4VFscMqv9MiYv5BXtQFY/zfl0TNZ1kgBVZbPZyH4VlZaRvz
	uMW7nxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5xF-0000000F3ou-2Hi7;
	Thu, 05 Jun 2025 08:28:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5vN-0000000F3kZ-1Tlw
	for ath12k@bombadil.infradead.org;
	Thu, 05 Jun 2025 08:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7AgNGohyuHwznRb/NWY98uyYm0XW6Bli7qL1fCuFkEY=; b=NzAej2c7tW7Bs2sxgc0mHyZCIT
	cpBZLfjTJPjyiAOMkZFk9OB+RkTRn+tUIrqprAWLXjod6iA3fJp8+T8UNu0ftycSCk6au+z7jWnBh
	K8cBxRoQWU4RJeJQI0htbcuAu4KQqKzU9HExjvQfDkFfJgobGE5gf61sfl0XKfG7fn93LpHGauCeH
	Er01et66A0UhRs3LO9M3cDCksjqlLS9JuSs8SygtEgN3YgHXxE1bkPedBQwwxh0TtsLScqZScL2Xw
	eTLFa25dvO9z3RctmZDz/MJRKmTx/R+nMD0WKQaQq7UuZxskafgcvpXfiJqXCLFErrPVFbePjgl4G
	qC5btBig==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5vK-000000017R7-1MAd
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 08:26:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554NfEDK015941
	for <ath12k@lists.infradead.org>; Thu, 5 Jun 2025 08:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7AgNGohyuHwznRb/NWY98uyYm0XW6Bli7qL
	1fCuFkEY=; b=pRh4mVcxHICD+/ZTShxmDKiaz9ZG06pSp3nR5C6XzBnLTHul/1c
	z79lozKuPGRrfzDh+OWiijZzEIjiAOyV+2/0mjCxt8IhgzLkvunLrJCTihXhbWdI
	oaC1bUS3X1Pkf+F/hd8s20k9hIf5k8qET6BfZKe78AaQZq5AAW186QahKk/MqM1f
	VAfaFWMhTYb7kO/ooK6QOQ3fkVmN2/SRhv6P8zicPqXYKgLHuYQ8FLo6iSxgIiAw
	e5eHFKUtIY5Zsb7S3av136rj7sPSDDOY0ZViBH/a7PbXgrPRSnUDF+3Wjck1IDZC
	Bocr/mQKWm1P3Ar4W0PDSqcqvRnk+jhbycA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuyg77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Jun 2025 08:25:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad9167e4cso14669116d6.1
        for <ath12k@lists.infradead.org>; Thu, 05 Jun 2025 01:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111958; x=1749716758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AgNGohyuHwznRb/NWY98uyYm0XW6Bli7qL1fCuFkEY=;
        b=Z6a6/3BMKc0f/FN61L3Dv37VPVRNp32m+DFigFNUqhh7eIGZOnLrjUHerkIslI4Igr
         d5ZyY15KhhTFCN+YJqdmdCohRfvPRtdr94mM3sA3CP1gn8VsUipp6mgjG00enCtiNz5j
         o/VZ2JDs/+DaD+7ksKFYLEh4I1q2n1fo2LWLsKezJhIbF5OKo2ZDDR1JJZa0Bv6op+ej
         okw1o3vyWMT/0b2zGAwttxFWupP+B72z8z8Mo1iIhTsP6JGNEAusT3iRqEvmvJa6w3tH
         N90zrZKLUUB98hOvckxWNNuwA2Qxirug0NQJIwj4Nu4X52bAsHNXDyUsH+Z1EYmS1YLh
         luSw==
X-Gm-Message-State: AOJu0Yx+qYXrmLjF+joXHqmpOVxW7Zkr8fAOFMOYYwhjBmwk/OyJePRE
	EaHjv79ssonT/8sedtsb/T+Qq0SZHVjo4pNy29WwokIFev8jz0mbuS5+Vo6sJLPmODDBq/a3Mhf
	O8n9XyzGrSDhAm8S65Ngb7tsEAnpbufmn2G2qchIN9AuXzOP37VQf0OxIclr+0L04FcqFzBVv
X-Gm-Gg: ASbGnctQ/pkaL4udUOQdDLC24m4xFQipOCFZMC5rPBSzBFAM6YSev8IbkhDUDkzrZaw
	1GWBsJs+QEf+lKDa4zLcM++n8lEUi1O/uvmydBSKXZmGYg4WItml2I3/UpqiZ6P+mOQRVPq46WP
	5AWeSwbHNq3DfOM1hb+Y9p7QRPl+ph7QHDZA1pQca3kk9blnBNMLTlNUIsQQbOlSlj85Ft1qk4Z
	QZNPDUm2TWyXPlFJpVF0ZLEckVY6wkiEU+UN8Ufhnj0xWnZCeGjvq0hm3ABZs7yfD+CeGu6Pe0h
	0p2eQRWdNH5ZGLD0d1chTsExiAMgHlxs6Mtwzk/uPlotsPU4VmbU0i2+AVmXtXBJihuu1Df+Ce/
	3Sfp+4NiSj1B5s3ALyx6uj3R57A==
X-Received: by 2002:a05:622a:5c1a:b0:476:b7cf:4d42 with SMTP id d75a77b69052e-4a5a587c55dmr99223791cf.27.1749111947183;
        Thu, 05 Jun 2025 01:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRqtPuFK4ho1ynltyfx5bNwh0w/3ERQTIA0dkvc1RaATudlWxbd+u6Idl3pyqpaU0h9uwmig==
X-Received: by 2002:a17:902:e741:b0:234:eb6:a35d with SMTP id d9443c01a7336-235e11ebd84mr81677345ad.27.1749111935399;
        Thu, 05 Jun 2025 01:25:35 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd34f9sm114984925ad.157.2025.06.05.01.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:25:35 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: update channel list in worker when wait flag is set
Date: Thu,  5 Jun 2025 16:25:28 +0800
Message-ID: <20250605082528.701-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68415497 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=JRbU3RNS0gVZ2NvkieAA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: gY3BtWMfyezSK9VTGh-0SklhDaPHqjzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA3MyBTYWx0ZWRfX+k38ECrrop4F
 ehzZS2vnmSfzyOqxRJ0A/alL8hyDJtUvHorCS5/gLQTOZlG7yFJN/LKtYrz2TBulgDDmVNnXD9o
 lfs0ujE16aze7oItaIdJJHD7vqt3M92ulPkpnNM1isIhPUsoblckL1FV7rjWPKnGCxoD4/gp1tr
 CYInX3gsKpcHcF5N7WLo6xP76ag4FoFRs0sgfvAHa71gjclGQ5f3a2mWLmHAPeXgAjZJoVjlqoU
 ABLnVxHiTgZIM/CYh3SyAr0BEokzmPvp+6UZz8u2aE377gmmaTDShjAVLHvffVyLd9VeSBAJWNk
 dCg22iqmBTiLA8AZZgYm3P9PDjFlNi9y9jMubpijkOQR9AFqnx1fv34eBAXK32WyaolSwcOkjg3
 DkTxgmI5ajbItkBIYIFOyyX5sEeeXn6dMIwozZiwDptTpX7sVyas1pekMu3dQXnekQv09YkM
X-Proofpoint-GUID: gY3BtWMfyezSK9VTGh-0SklhDaPHqjzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_092606_628634_A84915EF 
X-CRM114-Status: GOOD (  19.81  )
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

With previous patch [1], ath12k_reg_update_chan_list() will be called
during reg_process_self_managed_hint().

reg_process_self_managed_hint() will hold rtnl_lock all the time.
But ath12k_reg_update_chan_list() may increase the occupation time of
rtnl_lock, because when wait flag is set, wait_for_completion_timeout()
will be called during 11d/hw scan.

Should minimize the occupation time of rtnl_lock as much as possible
to avoid interfering with rest of the system. So move the update channel
list operation to a new worker, so that wait_for_completion_timeout()
won't be called with the rtnl_lock held.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: f335295aa29c ("wifi: ath12k: avoid deadlock during regulatory update in ath12k_regd_update()") #[1]
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  1 +
 drivers/net/wireless/ath/ath12k/core.h |  4 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 13 ++++
 drivers/net/wireless/ath/ath12k/reg.c  | 85 ++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/reg.h  |  1 +
 drivers/net/wireless/ath/ath12k/wmi.h  |  1 +
 6 files changed, 78 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 31d851d8e688..745bd9aaf79d 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1407,6 +1407,7 @@ void ath12k_core_halt(struct ath12k *ar)
 	ath12k_mac_peer_cleanup_all(ar);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->regd_update_work);
+	cancel_work_sync(&ar->regd_channel_update_work);
 	cancel_work_sync(&ab->rfkill_work);
 	cancel_work_sync(&ab->update_11d_work);
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 941db6e49d6e..6c55d065dd3a 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -712,7 +712,7 @@ struct ath12k {
 
 	/* protects the radio specific data like debug stats, ppdu_stats_info stats,
 	 * vdev_stop_status info, scan data, ath12k_sta info, ath12k_link_vif info,
-	 * channel context data, survey info, test mode data.
+	 * channel context data, survey info, test mode data, regd_channel_update_queue.
 	 */
 	spinlock_t data_lock;
 
@@ -771,6 +771,8 @@ struct ath12k {
 	struct completion bss_survey_done;
 
 	struct work_struct regd_update_work;
+	struct work_struct regd_channel_update_work;
+	struct list_head regd_channel_update_queue;
 
 	struct wiphy_work wmi_mgmt_tx_work;
 	struct sk_buff_head wmi_mgmt_tx_queue;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88b59f3ff87a..5e5cb9b56aa4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7940,6 +7940,7 @@ static void ath12k_mac_stop(struct ath12k *ar)
 {
 	struct ath12k_hw *ah = ar->ah;
 	struct htt_ppdu_stats_info *ppdu_stats, *tmp;
+	struct ath12k_wmi_scan_chan_list_arg *arg;
 	int ret;
 
 	lockdep_assert_held(&ah->hw_mutex);
@@ -7954,6 +7955,7 @@ static void ath12k_mac_stop(struct ath12k *ar)
 
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	wiphy_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->scan.vdev_clean_wk);
+	cancel_work_sync(&ar->regd_channel_update_work);
 	cancel_work_sync(&ar->regd_update_work);
 	cancel_work_sync(&ar->ab->rfkill_work);
 	cancel_work_sync(&ar->ab->update_11d_work);
@@ -7961,10 +7963,18 @@ static void ath12k_mac_stop(struct ath12k *ar)
 	complete(&ar->completed_11d_scan);
 
 	spin_lock_bh(&ar->data_lock);
+
 	list_for_each_entry_safe(ppdu_stats, tmp, &ar->ppdu_stats_info, list) {
 		list_del(&ppdu_stats->list);
 		kfree(ppdu_stats);
 	}
+
+	while ((arg = list_first_entry_or_null(&ar->regd_channel_update_queue,
+					       struct ath12k_wmi_scan_chan_list_arg,
+					       list))) {
+		list_del(&arg->list);
+		kfree(arg);
+	}
 	spin_unlock_bh(&ar->data_lock);
 
 	rcu_assign_pointer(ar->ab->pdevs_active[ar->pdev_idx], NULL);
@@ -11858,6 +11868,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 	int i;
 
 	for_each_ar(ah, ar, i) {
+		cancel_work_sync(&ar->regd_channel_update_work);
 		cancel_work_sync(&ar->regd_update_work);
 		ath12k_debugfs_unregister(ar);
 		ath12k_fw_stats_reset(ar);
@@ -12218,6 +12229,8 @@ static void ath12k_mac_setup(struct ath12k *ar)
 
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
 	wiphy_work_init(&ar->scan.vdev_clean_wk, ath12k_scan_vdev_clean_work);
+	INIT_WORK(&ar->regd_channel_update_work, ath12k_regd_update_chan_list_work);
+	INIT_LIST_HEAD(&ar->regd_channel_update_queue);
 	INIT_WORK(&ar->regd_update_work, ath12k_regd_update_work);
 
 	wiphy_work_init(&ar->wmi_mgmt_tx_work, ath12k_mgmt_over_wmi_tx_work);
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 2598b39d5d7e..0fc7f209956d 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -137,32 +137,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 	struct ath12k_wmi_channel_arg *ch;
 	enum nl80211_band band;
 	int num_channels = 0;
-	int i, ret, left;
-
-	if (wait && ar->state_11d == ATH12K_11D_RUNNING) {
-		left = wait_for_completion_timeout(&ar->completed_11d_scan,
-						   ATH12K_SCAN_TIMEOUT_HZ);
-		if (!left) {
-			ath12k_dbg(ar->ab, ATH12K_DBG_REG,
-				   "failed to receive 11d scan complete: timed out\n");
-			ar->state_11d = ATH12K_11D_IDLE;
-		}
-		ath12k_dbg(ar->ab, ATH12K_DBG_REG,
-			   "reg 11d scan wait left time %d\n", left);
-	}
-
-	if (wait &&
-	    (ar->scan.state == ATH12K_SCAN_STARTING ||
-	    ar->scan.state == ATH12K_SCAN_RUNNING)) {
-		left = wait_for_completion_timeout(&ar->scan.completed,
-						   ATH12K_SCAN_TIMEOUT_HZ);
-		if (!left)
-			ath12k_dbg(ar->ab, ATH12K_DBG_REG,
-				   "failed to receive hw scan complete: timed out\n");
-
-		ath12k_dbg(ar->ab, ATH12K_DBG_REG,
-			   "reg hw scan wait left time %d\n", left);
-	}
+	int i, ret = 0;
 
 	if (ar->ah->state == ATH12K_HW_STATE_RESTARTING)
 		return 0;
@@ -244,6 +219,16 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 		}
 	}
 
+	if (wait) {
+		spin_lock_bh(&ar->data_lock);
+		list_add_tail(&arg->list, &ar->regd_channel_update_queue);
+		spin_unlock_bh(&ar->data_lock);
+
+		queue_work(ar->ab->workqueue, &ar->regd_channel_update_work);
+
+		return 0;
+	}
+
 	ret = ath12k_wmi_send_scan_chan_list_cmd(ar, arg);
 	kfree(arg);
 
@@ -764,6 +749,54 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 	return new_regd;
 }
 
+void ath12k_regd_update_chan_list_work(struct work_struct *work)
+{
+	struct ath12k *ar = container_of(work, struct ath12k,
+					 regd_channel_update_work);
+	struct ath12k_wmi_scan_chan_list_arg *arg;
+	struct list_head local_update_list;
+	int left;
+
+	INIT_LIST_HEAD(&local_update_list);
+
+	spin_lock_bh(&ar->data_lock);
+	list_splice_tail_init(&ar->regd_channel_update_queue, &local_update_list);
+	spin_unlock_bh(&ar->data_lock);
+
+	while ((arg = list_first_entry_or_null(&local_update_list,
+					       struct ath12k_wmi_scan_chan_list_arg,
+					       list))) {
+		if (ar->state_11d != ATH12K_11D_IDLE) {
+			left = wait_for_completion_timeout(&ar->completed_11d_scan,
+							   ATH12K_SCAN_TIMEOUT_HZ);
+			if (!left) {
+				ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+					   "failed to receive 11d scan complete: timed out\n");
+				ar->state_11d = ATH12K_11D_IDLE;
+			}
+
+			ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+				   "reg 11d scan wait left time %d\n", left);
+		}
+
+		if ((ar->scan.state == ATH12K_SCAN_STARTING ||
+		     ar->scan.state == ATH12K_SCAN_RUNNING)) {
+			left = wait_for_completion_timeout(&ar->scan.completed,
+							   ATH12K_SCAN_TIMEOUT_HZ);
+			if (!left)
+				ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+					   "failed to receive hw scan complete: timed out\n");
+
+			ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+				   "reg hw scan wait left time %d\n", left);
+		}
+
+		ath12k_wmi_send_scan_chan_list_cmd(ar, arg);
+		list_del(&arg->list);
+		kfree(arg);
+	}
+}
+
 void ath12k_regd_update_work(struct work_struct *work)
 {
 	struct ath12k *ar = container_of(work, struct ath12k,
diff --git a/drivers/net/wireless/ath/ath12k/reg.h b/drivers/net/wireless/ath/ath12k/reg.h
index 8af8e9ba462e..0aeba06182c5 100644
--- a/drivers/net/wireless/ath/ath12k/reg.h
+++ b/drivers/net/wireless/ath/ath12k/reg.h
@@ -113,6 +113,7 @@ int ath12k_reg_handle_chan_list(struct ath12k_base *ab,
 				struct ath12k_reg_info *reg_info,
 				enum wmi_vdev_type vdev_type,
 				enum ieee80211_ap_reg_power power_type);
+void ath12k_regd_update_chan_list_work(struct work_struct *work);
 enum wmi_reg_6g_ap_type
 ath12k_reg_ap_pwr_convert(enum ieee80211_ap_reg_power power_type);
 enum ath12k_reg_status ath12k_reg_validate_reg_info(struct ath12k_base *ab,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index ac18f75e0449..07423ce43a85 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3934,6 +3934,7 @@ struct wmi_stop_scan_cmd {
 } __packed;
 
 struct ath12k_wmi_scan_chan_list_arg {
+	struct list_head list;
 	u32 pdev_id;
 	u16 nallchans;
 	struct ath12k_wmi_channel_arg channel[];

base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
-- 
2.34.1


