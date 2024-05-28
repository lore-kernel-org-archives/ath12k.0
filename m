Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D35C27C43
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CZkZA3ue9S6k9WN65PlPEtN/8WyJxcS4UH2RNuxysc=; b=SVQ15izqrTXgh7AnSwRLbS1lJp
	rm8focjSOVKIObN2z77EqLhBnQAL6oe3RsBSqTSBQzr7ry+O6QR7EbwqXsoKOzN6NoAr0vUYbsMZn
	/bz/j2xjrcN1zURdDI/3aK4EC5yC/11rOCLAIZhZOd8ZMEFXRmQ3n9As3HhzCOHyXXWu6dy/9AiF8
	gXnUohH+ChGbGpN+XICfkkHH2Rs2g2JgFBJMymTWR3ruhE/6mZ5nsf0IbIDdnEwkVwrfMvMxGa5SG
	SqREuhYuScYFqW6Z9hIdf3fFKoyTivUY4GdHvgh62/Q8vjStEBJUY2RwgBDwvj8PbGXqudJ7G8f3q
	FEvpDwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBqRZ-0000000HDXq-2gHU
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 06:36:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBqRU-0000000HDUq-3xiA
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 06:36:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RNQ5KQ019559;
	Tue, 28 May 2024 06:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9CZkZA3ue9S
	6k9WN65PlPEtN/8WyJxcS4UH2RNuxysc=; b=g3SVeM7olCOWkBC8T93wszF2Iby
	49qh6YY3STQujrDc+NpFqlW04O47cc1WoA1VzSJECPoCkse5Y1f7V7/NMoNxZL1R
	q/0wIpLgLWek4rGyi1jvuXKeLGlv1Wj337NwwWeHsBt8D9Rp7vvydDbNWxRTJfkw
	GY6I52bEfq9mEtLThJIBZPltP7lMpKymZ4iNdne96lCQS8IvzHz9+ZB1Re0hbmEc
	hIpW+msNYcE8Gn/3Xw1tH7blNC2muwtVXMs+hsEkNUjgr9UGUZ6a7VJ49YdRA58Y
	axA2OoI7FoRiTlQOtAWE5G5fgQ7MXHcteztHd1SUGY4uCa5YikOHhGmM2vw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2mw8rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 06:36:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44S6aCBq012906;
	Tue, 28 May 2024 06:36:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3yb92kd60m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 06:36:12 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44S6aCUl012899;
	Tue, 28 May 2024 06:36:12 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44S6aCI4012898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 06:36:12 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 668C74114D; Tue, 28 May 2024 12:06:11 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH v7 8/8] wifi: ath12k: move ath12k_hw from per device to group
Date: Tue, 28 May 2024 12:05:47 +0530
Message-Id: <20240528063547.1400700-9-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528063547.1400700-1-quic_hprem@quicinc.com>
References: <20240528063547.1400700-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uxhSqJiikGLpjDBC72aRmtRVlCx4tySy
X-Proofpoint-ORIG-GUID: uxhSqJiikGLpjDBC72aRmtRVlCx4tySy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_03,2024-05-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_233617_584136_41624E2F 
X-CRM114-Status: GOOD (  23.21  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, hardware abstractions (ah) of different radio bands
are tightly coupled to a single device (ab). But, with hardware
device group abstraction (ag), multiple radios across different
devices in a group can possibly form different combinations of
hardware abstractions (ah) within the group. Hence, the mapping
between ah to ab can be removed and instead it can be mapped with ag.

Please find below illustration of how mapping between ath12k_hw (ah),
ath12k_base (ab) and ath12k_hw_group (ag) is changed.

        current mapping of hardware abstraction (ah) with device (ab)
            +------------------------------------------------+
            |  +-------------------------------------+       |
            |  | +---------------+ +---------------+ |       |
            |  | |ath12k_hw (ah) | |ath12k_hw (ah) | |       |
            |  | +---------------+ +---------------+ |       |
            |  |                                     |       |
            |  |  +-----------+ |   +-----------+    |       |
            |  |  | ar (2GHz) | |   | ar (5GHz) |    |       |
            |  |  +-----------+ |   +-----------+    |       |
            |  |          Dual band device-1 (ab)    |       |
            |  +-------------------------------------+       |
            |    ath12k_hw_group (ag) based on group id      |
            +------------------------------------------------+

                After, with hardware device group abstraction
                (moving ah array out of ab to ag)
            +----------------------------------------------+
            |   +---------------+  +---------------+       |
            |   |ath12k_hw (ah) |  |ath12k_hw (ah) |       |
            |   +---------------+  +---------------+       |
            |  +-------------------------------------+     |
            |  | +-----------+     +-----------+     |     |
            |  | | ar (2GHz) |     | ar (5GHz) |     |     |
            |  | +-----------+     +-----------+     |     |
            |  |     Dual band device-1 (ab)         |     |
            |  +-------------------------------------+     |
            |   ath12k_hw_group (ag) based on group id     |
            +----------------------------------------------+

This decoupling of ath12k_hw (ah) from ath12k_base (ab) and mapping it
to ath12k_hw_group (ag) will help in forming different combinations of
multi-link devices.

Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
device 2 has one radio (6 GHz).

In existing code -
        device 1 will have two hardware abstractions hw1 (2 GHz) and
        hw2 (5 GHz) will be registered separately to mac80211 as phy0
        and phy1 respectively. Similarly, device 2 will register its
        hw (6 GHz) as phy2 to mac80211.

In future, with multi-link abstraction

        combination 1 - Different group id for device1 and device 2
                Device 1 will create a single hardware abstraction hw1
                (2 GHz and 5 GHz) and will be registered to mac80211 as
                phy0. similarly, device 2 will register its hardware
                (6 GHz) to mac80211 as phy1.

        combination 2 - Same group id for device1 and device 2
                Both device details are combined together as a group, say
                group1, with single hardware abstraction of radios 2 GHz,
                5 GHz and 6 GHz band details and will be registered to
                mac80211 as phy0.

Hence, Add changes to decouple ath12k_hw (ah) from ath12k_base (ab) and
map it to ath12k_hw_group (ag).

Refactor the following APIs to help simplify the registration based on
ath12k_hw_group (ag) rather than ath12k_base (ab)
        * ath12k_mac_allocate()
        * ath12k_mac_destroy()
        * ath12k_mac_register()
        * ath12k_mac_unregister()

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 52 +++++++--------
 drivers/net/wireless/ath/ath12k/core.h | 25 +++----
 drivers/net/wireless/ath/ath12k/dp.c   | 19 ++----
 drivers/net/wireless/ath/ath12k/dp.h   |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 90 ++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h  |  9 +--
 6 files changed, 110 insertions(+), 87 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 4edc71ccf312..e59251fb3736 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -830,11 +830,6 @@ static void ath12k_core_device_cleanup(struct ath12k_base *ab)
 	if (test_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags))
 		ath12k_core_pdev_destroy(ab);
 
-	if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
-		ath12k_mac_unregister(ab);
-		ath12k_mac_destroy(ab);
-	}
-
 	mutex_unlock(&ab->core_lock);
 }
 
@@ -851,6 +846,8 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 			continue;
 		ath12k_core_device_cleanup(ab);
 	}
+	ath12k_mac_unregister(ag);
+	ath12k_mac_destroy(ag);
 }
 
 static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
@@ -861,6 +858,23 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 
 	lockdep_assert_held(&ag->mutex_lock);
 
+	/* Check if already registered or not, since same flow
+	 * execute for HW restart case.
+	 */
+	is_registered = test_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags);
+
+	if (is_registered)
+		goto core_pdev_create;
+
+	ret = ath12k_mac_allocate(ag);
+	if (WARN_ON(ret))
+		return ret;
+
+	ret = ath12k_mac_register(ag);
+	if (WARN_ON(ret))
+		goto err_mac_alloc;
+
+core_pdev_create:
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
@@ -868,31 +882,6 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 
 		mutex_lock(&ab->core_lock);
 
-		/* Check if already registered or not, since same flow
-		 * execute for HW restart case.
-		 */
-		is_registered = test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
-
-		if (is_registered)
-			goto core_pdev_create;
-
-		ret = ath12k_mac_allocate(ab);
-		if (ret) {
-			ath12k_err(ab, "failed to create new hw device with mac80211 :%d\n",
-				   ret);
-			mutex_unlock(&ab->core_lock);
-			return ret;
-		}
-
-		ret = ath12k_mac_register(ab);
-		if (ret) {
-			ath12k_err(ab, "failed to register radio with mac80211: %d\n",
-				   ret);
-			mutex_unlock(&ab->core_lock);
-			goto err;
-		}
-
-core_pdev_create:
 		ret = ath12k_core_pdev_create(ab);
 		if (ret) {
 			ath12k_err(ab, "failed to create pdev core %d\n", ret);
@@ -919,7 +908,10 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 
 err:
 	ath12k_core_hw_group_stop(ag);
+	return ret;
 
+err_mac_alloc:
+	ath12k_mac_destroy(ag);
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d955deb08fd4..fcdd945ba7ea 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -60,6 +60,7 @@
 #define ATH12K_RECOVER_START_TIMEOUT_HZ		(20 * HZ)
 
 #define ATH12K_MAX_SOCS 3
+#define ATH12K_GROUP_MAX_RADIO (ATH12K_MAX_SOCS * MAX_RADIOS)
 #define ATH12K_INVALID_GROUP_ID  0xFF
 #define ATH12K_INVALID_DEVICE_ID 0xFF
 
@@ -748,6 +749,15 @@ struct ath12k_hw_group {
 	struct ath12k_base *ab[ATH12K_MAX_SOCS];
 	/* To synchronize group create, assign, start, stop */
 	struct mutex mutex_lock;
+
+	/* Holds information of wiphy (hw) registration.
+	 *
+	 * In Multi/Single Link Operation case, all pdevs are registered as
+	 * a single wiphy. In other (legacy/Non-MLO) cases, each pdev is
+	 * registered as separate wiphys.
+	 */
+	struct ath12k_hw *ah[ATH12K_GROUP_MAX_RADIO];
+	u8 num_hw;
 };
 
 /**
@@ -819,15 +829,6 @@ struct ath12k_base {
 
 	struct ath12k_pdev __rcu *pdevs_active[MAX_RADIOS];
 
-	/* Holds information of wiphy (hw) registration.
-	 *
-	 * In Multi/Single Link Operation case, all pdevs are registered as
-	 * a single wiphy. In other (legacy/Non-MLO) cases, each pdev is
-	 * registered as separate wiphys.
-	 */
-	struct ath12k_hw *ah[MAX_RADIOS];
-	u8 num_hw;
-
 	struct ath12k_wmi_hal_reg_capabilities_ext_arg hal_reg_cap[MAX_RADIOS];
 	unsigned long long free_vdev_map;
 	unsigned long long free_vdev_stats_id_map;
@@ -1083,18 +1084,18 @@ static inline struct ieee80211_hw *ath12k_ar_to_hw(struct ath12k *ar)
 
 static inline struct ath12k_hw *ath12k_ab_to_ah(struct ath12k_base *ab, int idx)
 {
-	return ab->ah[idx];
+	return ab->ag->ah[idx];
 }
 
 static inline void ath12k_ab_set_ah(struct ath12k_base *ab, int idx,
 				    struct ath12k_hw *ah)
 {
-	ab->ah[idx] = ah;
+	ab->ag->ah[idx] = ah;
 }
 
 static inline int ath12k_get_num_hw(struct ath12k_base *ab)
 {
-	return ab->num_hw;
+	return ab->ag->num_hw;
 }
 
 static inline
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 61aa78d8bd8c..5cc5eac26751 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -980,21 +980,14 @@ void ath12k_dp_pdev_free(struct ath12k_base *ab)
 		ath12k_dp_rx_pdev_free(ab, i);
 }
 
-void ath12k_dp_pdev_pre_alloc(struct ath12k_base *ab)
+void ath12k_dp_pdev_pre_alloc(struct ath12k *ar)
 {
-	struct ath12k *ar;
-	struct ath12k_pdev_dp *dp;
-	int i;
+	struct ath12k_pdev_dp *dp = &ar->dp;
 
-	for (i = 0; i <  ab->num_radios; i++) {
-		ar = ab->pdevs[i].ar;
-		dp = &ar->dp;
-		dp->mac_id = i;
-		atomic_set(&dp->num_tx_pending, 0);
-		init_waitqueue_head(&dp->tx_empty_waitq);
-
-		/* TODO: Add any RXDMA setup required per pdev */
-	}
+	dp->mac_id = ar->pdev_idx;
+	atomic_set(&dp->num_tx_pending, 0);
+	init_waitqueue_head(&dp->tx_empty_waitq);
+	/* TODO: Add any RXDMA setup required per pdev */
 }
 
 bool ath12k_dp_wmask_compaction_rx_tlv_supported(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 742094545089..00c0a76841df 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1815,7 +1815,7 @@ void ath12k_dp_free(struct ath12k_base *ab);
 int ath12k_dp_alloc(struct ath12k_base *ab);
 void ath12k_dp_cc_config(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
-void ath12k_dp_pdev_pre_alloc(struct ath12k_base *ab);
+void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);
 int ath12k_dp_tx_htt_srng_setup(struct ath12k_base *ab, u32 ring_id,
 				int mac_id, enum hal_ring_type ring_type);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4ab9846f154c..870e7351ed08 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9144,19 +9144,13 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
 }
 
-int ath12k_mac_register(struct ath12k_base *ab)
+int ath12k_mac_register(struct ath12k_hw_group *ag)
 {
+	struct ath12k_base *ab = ag->ab[0];
 	struct ath12k_hw *ah;
 	int i;
 	int ret;
 
-	if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags))
-		return 0;
-
-	/* Initialize channel counters frequency value in hertz */
-	ab->cc_freq_hz = 320000;
-	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
-
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
 		ah = ath12k_ab_to_ah(ab, i);
 
@@ -9180,8 +9174,9 @@ int ath12k_mac_register(struct ath12k_base *ab)
 	return ret;
 }
 
-void ath12k_mac_unregister(struct ath12k_base *ab)
+void ath12k_mac_unregister(struct ath12k_hw_group *ag)
 {
+	struct ath12k_base *ab = ag->ab[0];
 	struct ath12k_hw *ah;
 	int i;
 
@@ -9200,12 +9195,13 @@ static void ath12k_mac_hw_destroy(struct ath12k_hw *ah)
 	ieee80211_free_hw(ah->hw);
 }
 
-static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
+static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
 						struct ath12k_pdev_map *pdev_map,
 						u8 num_pdev_map)
 {
 	struct ieee80211_hw *hw;
 	struct ath12k *ar;
+	struct ath12k_base *ab;
 	struct ath12k_pdev *pdev;
 	struct ath12k_hw *ah;
 	int i;
@@ -9218,7 +9214,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
 
 	ah = ath12k_hw_to_ah(hw);
 	ah->hw = hw;
-	ah->ab = ab;
+	ah->ab = pdev_map[0].ab;
 	ah->num_radio = num_pdev_map;
 
 	mutex_init(&ah->hw_mutex);
@@ -9237,23 +9233,30 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,
 		pdev->ar = ar;
 
 		ath12k_mac_setup(ar);
+		ath12k_dp_pdev_pre_alloc(ar);
 	}
 
 	return ah;
 }
 
-void ath12k_mac_destroy(struct ath12k_base *ab)
+void ath12k_mac_destroy(struct ath12k_hw_group *ag)
 {
 	struct ath12k_pdev *pdev;
-	struct ath12k_hw *ah;
+	struct ath12k_base *ab = ag->ab[0];
 	int i;
+	struct ath12k_hw *ah;
 
-	for (i = 0; i < ab->num_radios; i++) {
-		pdev = &ab->pdevs[i];
-		if (!pdev->ar)
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
 			continue;
 
-		pdev->ar = NULL;
+		for (i = 0; i < ab->num_radios; i++) {
+			pdev = &ab->pdevs[i];
+			if (!pdev->ar)
+				continue;
+			pdev->ar = NULL;
+		}
 	}
 
 	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
@@ -9266,26 +9269,60 @@ void ath12k_mac_destroy(struct ath12k_base *ab)
 	}
 }
 
-int ath12k_mac_allocate(struct ath12k_base *ab)
+static void ath12k_mac_set_device_defaults(struct ath12k_base *ab)
+{
+	/* Initialize channel counters frequency value in hertz */
+	ab->cc_freq_hz = 320000;
+	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
+}
+
+int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 {
 	struct ath12k_hw *ah;
+	struct ath12k_base *ab;
 	struct ath12k_pdev_map pdev_map[MAX_RADIOS];
 	int ret, i, j;
 	u8 radio_per_hw;
+	int mac_id, device_id;
+	int total_radio, num_hw;
 
-	if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags))
-		return 0;
+	total_radio = 0;
+	for (i = 0; i < ag->num_devices; i++)
+		total_radio += ag->ab[i]->num_radios;
 
-	ab->num_hw = ab->num_radios;
+	/* All pdev get combined and register as single wiphy based on
+	 * hardware group which participate in multi-link operation else
+	 * each pdev get register separately.
+	 *
+	 * Currently, registering as single pdevs.
+	 */
 	radio_per_hw = 1;
+	num_hw = total_radio / radio_per_hw;
 
-	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
+	if (WARN_ON(num_hw >= ATH12K_GROUP_MAX_RADIO))
+		return -ENOSPC;
+
+	ag->num_hw = 0;
+	device_id = 0;
+	mac_id = 0;
+	for (i = 0; i < num_hw; i++) {
 		for (j = 0; j < radio_per_hw; j++) {
+			ab = ag->ab[device_id];
 			pdev_map[j].ab = ab;
-			pdev_map[j].pdev_idx = (i * radio_per_hw) + j;
+			pdev_map[j].pdev_idx = mac_id;
+			mac_id++;
+
+			/* If mac_id falls beyond the current device MACs then
+			 * move to next device
+			 */
+			if (mac_id >= ab->num_radios) {
+				mac_id = 0;
+				device_id++;
+				ath12k_mac_set_device_defaults(ab);
+			}
 		}
 
-		ah = ath12k_mac_hw_allocate(ab, pdev_map, radio_per_hw);
+		ah = ath12k_mac_hw_allocate(ag, pdev_map, radio_per_hw);
 		if (!ah) {
 			ath12k_warn(ab, "failed to allocate mac80211 hw device for hw_idx %d\n",
 				    i);
@@ -9293,11 +9330,10 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 			goto err;
 		}
 
-		ath12k_ab_set_ah(ab, i, ah);
+		ag->ah[i] = ah;
+		ag->num_hw++;
 	}
 
-	ath12k_dp_pdev_pre_alloc(ab);
-
 	return 0;
 
 err:
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 69fd282b9dd3..f0ea0b5f50e4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -13,6 +13,7 @@
 struct ath12k;
 struct ath12k_base;
 struct ath12k_hw;
+struct ath12k_hw_group;
 struct ath12k_pdev_map;
 
 struct ath12k_generic_iter {
@@ -50,10 +51,10 @@ enum ath12k_supported_bw {
 
 extern const struct htt_rx_ring_tlv_filter ath12k_mac_mon_status_filter_default;
 
-void ath12k_mac_destroy(struct ath12k_base *ab);
-void ath12k_mac_unregister(struct ath12k_base *ab);
-int ath12k_mac_register(struct ath12k_base *ab);
-int ath12k_mac_allocate(struct ath12k_base *ab);
+void ath12k_mac_destroy(struct ath12k_hw_group *ag);
+void ath12k_mac_unregister(struct ath12k_hw_group *ag);
+int ath12k_mac_register(struct ath12k_hw_group *ag);
+int ath12k_mac_allocate(struct ath12k_hw_group *ag);
 int ath12k_mac_hw_ratecode_to_legacy_rate(u8 hw_rc, u8 preamble, u8 *rateidx,
 					  u16 *rate);
 u8 ath12k_mac_bitrate_to_idx(const struct ieee80211_supported_band *sband,
-- 
2.34.1


