Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD850C25B74
	for <ath12k@archiver.kernel.org>; Mon,  6 May 2024 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHKZPvanGoJ4Vti5uTYbjgh7R8nTaVn8Yk9q6ICHmFQ=; b=J8vt7wux64XZXaIt75TPoYAtCt
	pqSmDIqIBhOXpFK7lgiXTKE5Ii2JPA6oJOraUm3LjLWDYrO9nTVzQDt/pyyPA9ZPVbZuqhbwQWbfL
	+zV1e+cvbnDZ1VYmX6EEgbjf9ituLHIycTu9SWQuCPhIaJUP2xU4GhxXFPmGyOwe0c0B3J6ENQdOs
	smG/cSPgDSFYz8e/VjS1MnHSDVqiL/Fx9lvvclDNuttZiZWstrvFGdhCZXSsN+pwRcgQlyapsFzIA
	AefDk/JkQKni5lyP6vc8Ekg7ya8lZUgk+3X9H85+U+TAv9sAxOAo83WGNrTlYbRyw3IJW2VORkw3a
	UXycJ2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s42Jn-00000008GZZ-1sEH
	for ath12k@archiver.kernel.org;
	Mon, 06 May 2024 17:40:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s42Ji-00000008GVR-09I7
	for ath12k@lists.infradead.org;
	Mon, 06 May 2024 17:39:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446HW4Fu008442;
	Mon, 6 May 2024 17:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=zHKZPva
	nGoJ4Vti5uTYbjgh7R8nTaVn8Yk9q6ICHmFQ=; b=EpkXpLFA46NQaZwRipnwyja
	Tf2NQ2FeHel3FGOcMB8gKZfdmuaTR84cZuAQKlnrVOouYPQofwl8jxsG/+4jK3Ga
	jdNQtDbQeCbOy8oWTcHrbjuMADxqV81Do6ov/C6Sb6E+wO2xye+4GQ/kwaQP+KEe
	Z5nnE77yDaqV+YHjTiNcHvoj3iL1RFB2ZvnRfYIU9xI2w1OICyM0jKtIJDMjKLei
	L1q55d51/uMW0hVNF6yyIo3XWH9lm2qsCTZ5SNE2fh2+bVD5OW2lZ45WTjInTiVC
	NKexV8BoVLrQ+y6N48T0NK8CTVakgqWxeSq0X65bopCAoX8p0MAIqLxoscMhung=
	=
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxw9a8y4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 17:39:57 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 446HdrcV009803;
	Mon, 6 May 2024 17:39:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3xwe3k9twv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 17:39:53 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446HdqUW009773;
	Mon, 6 May 2024 17:39:53 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 446HdrHN009808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 17:39:53 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 0DBCB4114D; Mon,  6 May 2024 23:09:53 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH v3 7/8] wifi: ath12k: refactor core start based on hardware group
Date: Mon,  6 May 2024 23:09:42 +0530
Message-Id: <20240506173943.1747037-8-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506173943.1747037-1-quic_hprem@quicinc.com>
References: <20240506173943.1747037-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nkvd9_dnR8P6Y3fRRaqrfLAtAEo4Bf_q
X-Proofpoint-ORIG-GUID: nkvd9_dnR8P6Y3fRRaqrfLAtAEo4Bf_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=934 spamscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405060126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_103958_120671_21BDAAA9 
X-CRM114-Status: GOOD (  23.96  )
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
---
 drivers/net/wireless/ath/ath12k/core.c | 216 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/core.h |  32 ++++
 2 files changed, 197 insertions(+), 51 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index c1cda7d37c1a..1165baf31211 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -566,6 +566,9 @@ u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab)
 
 static void ath12k_core_stop(struct ath12k_base *ab)
 {
+	clear_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags);
+	ath12k_dec_num_core_started(ab);
+
 	if (!test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
 		ath12k_qmi_firmware_stop(ab);
 
@@ -692,11 +695,15 @@ static int ath12k_core_pdev_create(struct ath12k_base *ab)
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
 
@@ -705,6 +712,8 @@ static int ath12k_core_start(struct ath12k_base *ab,
 {
 	int ret;
 
+	lockdep_assert_held(&ab->core_lock);
+
 	ret = ath12k_wmi_attach(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to attach wmi: %d\n", ret);
@@ -798,6 +807,11 @@ static int ath12k_core_start(struct ath12k_base *ab,
 		/* ACPI is optional so continue in case of an error */
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", ret);
 
+	/* Indicate the core start in the appropriate group */
+	ath12k_inc_num_core_started(ab);
+
+	set_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags);
+
 	return 0;
 
 err_reo_cleanup:
@@ -809,6 +823,109 @@ static int ath12k_core_start(struct ath12k_base *ab,
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
@@ -826,9 +943,18 @@ static int ath12k_core_start_firmware(struct ath12k_base *ab,
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
+	struct ath12k_hw_group *ag;
+	int ret, i;
 
 	ret = ath12k_core_start_firmware(ab, ATH12K_FIRMWARE_MODE_NORMAL);
 	if (ret) {
@@ -848,59 +974,50 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	ag = ath12k_ab_to_ag(ab);
+
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
 
@@ -1152,6 +1269,10 @@ static void ath12k_core_reset(struct work_struct *work)
 
 	ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset starting\n");
 
+	mutex_lock(&ab->ag->mutex_lock);
+	ath12k_dec_num_core_started(ab);
+	mutex_unlock(&ab->ag->mutex_lock);
+
 	ab->is_reset = true;
 	atomic_set(&ab->recovery_start_count, 0);
 	reinit_completion(&ab->recovery_start);
@@ -1261,7 +1382,7 @@ static struct ath12k_hw_group *ath12k_core_assign_hw_group(struct ath12k_base *a
 
 void ath12k_core_unassign_hw_group(struct ath12k_base *ab)
 {
-	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
 	u8 device_id = ab->device_id;
 	int num_probed;
 
@@ -1295,19 +1416,6 @@ void ath12k_core_unassign_hw_group(struct ath12k_base *ab)
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
@@ -1335,14 +1443,20 @@ static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
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
index c6238335c7c0..2c3c585797cf 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -202,6 +202,10 @@ enum ath12k_scan_state {
 	ATH12K_SCAN_ABORTING,
 };
 
+enum ath12k_hw_group_flags {
+	ATH12K_GROUP_FLAG_REGISTERED,
+};
+
 enum ath12k_dev_flags {
 	ATH12K_CAC_RUNNING,
 	ATH12K_FLAG_CRASH_FLUSH,
@@ -216,6 +220,9 @@ enum ath12k_dev_flags {
 	ATH12K_FLAG_EXT_IRQ_ENABLED,
 	ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 	ATH12K_FLAG_HW_GROUP_ATTACHED,
+	ATH12K_FLAG_PDEV_CREATED,
+	ATH12K_FLAG_CORE_STARTED,
+	ATH12K_FLAG_CORE_HIF_IRQ_ENABLED,
 };
 
 enum ath12k_monitor_flags {
@@ -743,6 +750,8 @@ struct ath12k_hw_group {
 	u8 id;
 	u8 num_devices;
 	u8 num_probed;
+	u8 num_started;
+	unsigned long flags;
 	struct ath12k_base *ab[ATH12K_MAX_SOCS];
 	/* To synchronize group create, assign, start, stop */
 	struct mutex mutex_lock;
@@ -1094,4 +1103,27 @@ static inline int ath12k_get_num_hw(struct ath12k_base *ab)
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
2.17.1


