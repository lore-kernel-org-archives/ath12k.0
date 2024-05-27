Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840D5C25B7C
	for <ath12k@archiver.kernel.org>; Mon, 27 May 2024 07:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWcc4UrPiAT/67pZMiHEkL5ApPy7KcJm3ZVAnMmS0wI=; b=TEiHURoc2Bpl1U/KLKQoii4glw
	/ymqK0GQTYq8mgtnJiVq3LVFkTe96hikVq71m34Axx6ZxJYac3Pdgny7euJZ7csuyHmCw7jwdCQMZ
	E8o4y3wbp0r65FrwQY1D+J/kXT74kXd7LHMnRBLyiRyMmbP4jjtkIRkHG6Vz+v63aTC8JFKAsjLuI
	IJHXnJl1P1UMNPJEWwtDKBJsP238aYFcie+DwxOLBMJysmK5/7SM2JyIB/CscZOh7qZ3K+lMmfr+/
	A00F3mJHu10scScOf4CrOTA9cOur4a0ps/fy2qGZKI5XdE/XrBSzP99cmaXV0qKbO4HPLExJETfUd
	onLOtQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUvT-0000000E5bH-0ZF0
	for ath12k@archiver.kernel.org;
	Mon, 27 May 2024 07:37:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUvO-0000000E5Xx-0Pa7
	for ath12k@lists.infradead.org;
	Mon, 27 May 2024 07:37:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R172ZV021242
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KWcc4UrPiAT
	/67pZMiHEkL5ApPy7KcJm3ZVAnMmS0wI=; b=f+D8ukxXkj6tJgexLasqBq0anr1
	AcZrtYkwPHK+Jpx4DED8kGFCc4/sW1NNdge8U1JHPgkXW03dqjXLg+9U16MUbPU0
	axQdMWdddRS14Ar/A1RdVwDMG12z3BZuOa4gZVCEn0Gi+2SAFk+TljEB4g6UOrA7
	+uzBK68JvlBJT6l3KmyU3pqMjtdXJAlU2EfSHw1FhzgtncOxo0g7599uPRqPqtYb
	m467oVZ0O0AZGZwHFBwIK5IZLfOE/YPocgPvhzV5L300/3Y1v8xdAP4oCEnStdni
	XTVpCVYL6ZcC8Mb5rfHe+D1EyX1e7u2h9y8KcCnhvFVZ5ChaLrT04iJakDg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yj2wsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44R7bVes017222
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3yb92k9atb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:37 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44R7bb8B017275
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:37 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44R7bbfJ017272
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 07:37:37 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 2738E4115D; Mon, 27 May 2024 13:07:36 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v6 7/8] wifi: ath12k: refactor core start based on hardware group
Date: Mon, 27 May 2024 13:07:22 +0530
Message-Id: <20240527073723.2520319-8-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073723.2520319-1-quic_hprem@quicinc.com>
References: <20240527073723.2520319-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yzFhG9yQ1k3nDGZImKavMDwN8klAkAl2
X-Proofpoint-ORIG-GUID: yzFhG9yQ1k3nDGZImKavMDwN8klAkAl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=996 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_003742_396048_4FB43F9B 
X-CRM114-Status: GOOD (  24.88  )
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

Currently, mac allocate/register and core_pdev_create are initiated
immediately when QMI firmware ready event is received for a particular
device.

With hardware device group abstraction, QMI firmware ready event can be
received simultaneously for different devices in the group and so, it
should not be registered immediately rather it has to be deferred until
all devices in the group has received QMI firmware ready.

To handle this, refactor the code of core start to move the following
apis inside a wrapper ath12k_core_hw_group_start()
        * ath12k_mac_allocate()
        * ath12k_core_pdev_create()
        * ath12k_core_rfkill_config()
        * ath12k_mac_register()
        * ath12k_hif_irq_enable()

similarly, move the corresponding destroy/unregister/disable apis
inside wrapper ath12k_core_hw_group_stop()

Add the device flags to indicate pdev created and IRQ enabled which would
be helpful for device clean up during failure cases.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 214 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/core.h |  32 ++++
 2 files changed, 195 insertions(+), 51 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ebe31cbb6435..4edc71ccf312 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -563,6 +563,9 @@ u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab)
 
 static void ath12k_core_stop(struct ath12k_base *ab)
 {
+	clear_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags);
+	ath12k_dec_num_core_started(ab);
+
 	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
 		ath12k_qmi_firmware_stop(ab);
 
@@ -689,11 +692,15 @@ static int ath12k_core_pdev_create(struct ath12k_base *ab)
 		return ret;
 	}
 
+	set_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags);
+
 	return 0;
 }
 
 static void ath12k_core_pdev_destroy(struct ath12k_base *ab)
 {
+	clear_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags);
+
 	ath12k_dp_pdev_free(ab);
 }
 
@@ -702,6 +709,8 @@ static int ath12k_core_start(struct ath12k_base *ab,
 {
 	int ret;
 
+	lockdep_assert_held(&ab->core_lock);
+
 	ret = ath12k_wmi_attach(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to attach wmi: %d\n", ret);
@@ -795,6 +804,11 @@ static int ath12k_core_start(struct ath12k_base *ab,
 		/* ACPI is optional so continue in case of an error */
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", ret);
 
+	/* Indicate the core start in the appropriate group */
+	ath12k_inc_num_core_started(ab);
+
+	set_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags);
+
 	return 0;
 
 err_reo_cleanup:
@@ -806,6 +820,109 @@ static int ath12k_core_start(struct ath12k_base *ab,
 	return ret;
 }
 
+static void ath12k_core_device_cleanup(struct ath12k_base *ab)
+{
+	mutex_lock(&ab->core_lock);
+
+	if (test_and_clear_bit(ATH12K_FLAG_CORE_HIF_IRQ_ENABLED, &ab->dev_flags))
+		ath12k_hif_irq_disable(ab);
+
+	if (test_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags))
+		ath12k_core_pdev_destroy(ab);
+
+	if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
+		ath12k_mac_unregister(ab);
+		ath12k_mac_destroy(ab);
+	}
+
+	mutex_unlock(&ab->core_lock);
+}
+
+static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
+
+	lockdep_assert_held(&ag->mutex_lock);
+
+	for (i = ag->num_devices - 1; i >= 0; i--) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+		ath12k_core_device_cleanup(ab);
+	}
+}
+
+static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int ret, i;
+	bool is_registered;
+
+	lockdep_assert_held(&ag->mutex_lock);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		mutex_lock(&ab->core_lock);
+
+		/* Check if already registered or not, since same flow
+		 * execute for HW restart case.
+		 */
+		is_registered = test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
+		if (is_registered)
+			goto core_pdev_create;
+
+		ret = ath12k_mac_allocate(ab);
+		if (ret) {
+			ath12k_err(ab, "failed to create new hw device with mac80211 :%d\n",
+				   ret);
+			mutex_unlock(&ab->core_lock);
+			return ret;
+		}
+
+		ret = ath12k_mac_register(ab);
+		if (ret) {
+			ath12k_err(ab, "failed to register radio with mac80211: %d\n",
+				   ret);
+			mutex_unlock(&ab->core_lock);
+			goto err;
+		}
+
+core_pdev_create:
+		ret = ath12k_core_pdev_create(ab);
+		if (ret) {
+			ath12k_err(ab, "failed to create pdev core %d\n", ret);
+			mutex_unlock(&ab->core_lock);
+			goto err;
+		}
+
+		ret = ath12k_core_rfkill_config(ab);
+		if (ret && ret != -EOPNOTSUPP) {
+			mutex_unlock(&ab->core_lock);
+			goto err;
+		}
+
+		ath12k_hif_irq_enable(ab);
+
+		set_bit(ATH12K_FLAG_CORE_HIF_IRQ_ENABLED, &ab->dev_flags);
+
+		mutex_unlock(&ab->core_lock);
+	}
+
+	set_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags);
+
+	return 0;
+
+err:
+	ath12k_core_hw_group_stop(ag);
+
+	return ret;
+}
+
 static int ath12k_core_start_firmware(struct ath12k_base *ab,
 				      enum ath12k_firmware_mode mode)
 {
@@ -823,9 +940,18 @@ static int ath12k_core_start_firmware(struct ath12k_base *ab,
 	return ret;
 }
 
+static inline
+bool ath12k_core_hw_group_start_ready(struct ath12k_hw_group *ag)
+{
+	lockdep_assert_held(&ag->mutex_lock);
+
+	return (ag->num_started == ag->num_devices);
+}
+
 int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 {
-	int ret;
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
+	int ret, i;
 
 	ret = ath12k_core_start_firmware(ab, ATH12K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
@@ -845,59 +971,48 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	mutex_lock(&ag->mutex_lock);
 	mutex_lock(&ab->core_lock);
 	ret = ath12k_core_start(ab, ATH12K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
 		ath12k_err(ab, "failed to start core: %d\n", ret);
 		goto err_dp_free;
 	}
+	mutex_unlock(&ab->core_lock);
 
-	ret = ath12k_mac_allocate(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to create new hw device with mac80211 :%d\n",
-			   ret);
-		goto err_core_stop;
-	}
-
-	ret = ath12k_mac_register(ab);
-	if (ret) {
-		ath12k_err(ab, "failed register the radio with mac80211: %d\n", ret);
-		goto err_mac_destroy;
+	if (ath12k_core_hw_group_start_ready(ag)) {
+		ret = ath12k_core_hw_group_start(ag);
+		if (ret) {
+			ath12k_warn(ab, "unable to start hw group\n");
+			goto err_core_stop;
+		}
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "group %d started\n", ag->id);
 	}
+	mutex_unlock(&ag->mutex_lock);
 
-	ret = ath12k_core_pdev_create(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to create pdev core: %d\n", ret);
-		goto err_mac_unregister;
-	}
+	return 0;
 
-	ath12k_hif_irq_enable(ab);
+err_core_stop:
+	for (i = ag->num_devices - 1; i >= 0; i--) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
 
-	ret = ath12k_core_rfkill_config(ab);
-	if (ret && ret != -EOPNOTSUPP) {
-		ath12k_err(ab, "failed to config rfkill: %d\n", ret);
-		goto err_core_pdev_destroy;
+		mutex_lock(&ab->core_lock);
+		if (test_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags))
+			ath12k_core_stop(ab);
+		mutex_unlock(&ab->core_lock);
 	}
+	goto exit;
 
-	mutex_unlock(&ab->core_lock);
-
-	return 0;
-
-err_core_pdev_destroy:
-	ath12k_hif_irq_disable(ab);
-	ath12k_core_pdev_destroy(ab);
-err_mac_unregister:
-	ath12k_mac_unregister(ab);
-err_mac_destroy:
-	ath12k_mac_destroy(ab);
-err_core_stop:
-	ath12k_core_stop(ab);
 err_dp_free:
 	ath12k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
 err_firmware_stop:
 	ath12k_qmi_firmware_stop(ab);
 
+exit:
+	mutex_unlock(&ag->mutex_lock);
 	return ret;
 }
 
@@ -1149,6 +1264,10 @@ static void ath12k_core_reset(struct work_struct *work)
 
 	ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset starting\n");
 
+	mutex_lock(&ab->ag->mutex_lock);
+	ath12k_dec_num_core_started(ab);
+	mutex_unlock(&ab->ag->mutex_lock);
+
 	ab->is_reset = true;
 	atomic_set(&ab->recovery_start_count, 0);
 	reinit_completion(&ab->recovery_start);
@@ -1258,7 +1377,7 @@ static struct ath12k_hw_group *ath12k_core_assign_hw_group(struct ath12k_base *a
 
 void ath12k_core_unassign_hw_group(struct ath12k_base *ab)
 {
-	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
 	u8 device_id = ab->device_id;
 	int num_probed;
 
@@ -1292,19 +1411,6 @@ void ath12k_core_unassign_hw_group(struct ath12k_base *ab)
 		ath12k_core_hw_group_free(ag);
 }
 
-static void ath12k_core_device_cleanup(struct ath12k_base *ab)
-{
-	mutex_lock(&ab->core_lock);
-
-	ath12k_hif_irq_disable(ab);
-	ath12k_core_pdev_destroy(ab);
-	ath12k_mac_unregister(ab);
-	ath12k_mac_destroy(ab);
-	ath12k_core_stop(ab);
-
-	mutex_unlock(&ab->core_lock);
-}
-
 static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 {
 	struct ath12k_base *ab;
@@ -1332,14 +1438,20 @@ static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
 		return;
 
 	mutex_lock(&ag->mutex_lock);
+	if (test_and_clear_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags))
+		ath12k_core_hw_group_stop(ag);
+
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
 			continue;
 
-		if (test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))
-			ath12k_core_device_cleanup(ab);
+		mutex_lock(&ab->core_lock);
+		if (test_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags))
+			ath12k_core_stop(ab);
+		mutex_unlock(&ab->core_lock);
 	}
+
 	mutex_unlock(&ag->mutex_lock);
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a6b8c100ebc8..d955deb08fd4 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -200,6 +200,10 @@ enum ath12k_scan_state {
 	ATH12K_SCAN_ABORTING,
 };
 
+enum ath12k_hw_group_flags {
+	ATH12K_GROUP_FLAG_REGISTERED,
+};
+
 enum ath12k_dev_flags {
 	ATH12K_CAC_RUNNING,
 	ATH12K_FLAG_CRASH_FLUSH,
@@ -214,6 +218,9 @@ enum ath12k_dev_flags {
 	ATH12K_FLAG_EXT_IRQ_ENABLED,
 	ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 	ATH12K_FLAG_HW_GROUP_ATTACHED,
+	ATH12K_FLAG_PDEV_CREATED,
+	ATH12K_FLAG_CORE_STARTED,
+	ATH12K_FLAG_CORE_HIF_IRQ_ENABLED,
 };
 
 struct ath12k_tx_conf {
@@ -736,6 +743,8 @@ struct ath12k_hw_group {
 	u8 id;
 	u8 num_devices;
 	u8 num_probed;
+	u8 num_started;
+	unsigned long flags;
 	struct ath12k_base *ab[ATH12K_MAX_SOCS];
 	/* To synchronize group create, assign, start, stop */
 	struct mutex mutex_lock;
@@ -1087,4 +1096,27 @@ static inline int ath12k_get_num_hw(struct ath12k_base *ab)
 {
 	return ab->num_hw;
 }
+
+static inline
+struct ath12k_hw_group *ath12k_ab_to_ag(struct ath12k_base *ab)
+{
+	return ab->ag;
+}
+
+static inline
+void ath12k_inc_num_core_started(struct ath12k_base *ab)
+{
+	lockdep_assert_held(&ab->ag->mutex_lock);
+
+	ab->ag->num_started++;
+}
+
+static inline
+void ath12k_dec_num_core_started(struct ath12k_base *ab)
+{
+	lockdep_assert_held(&ab->ag->mutex_lock);
+
+	ab->ag->num_started--;
+}
+
 #endif /* _CORE_H_ */
-- 
2.34.1


