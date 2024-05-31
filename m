Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007E5C27C53
	for <ath12k@archiver.kernel.org>; Fri, 31 May 2024 18:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CL+gGgDzeqN4J04uMz7LUHJBpDdT+0KgfstkX2K1w8A=; b=N4S1O/k2TvQwWVBHjOBRDf6dhY
	M2sZxN3U1wkcFwAxSxxrdbxrDecxyTxbQdfNA4z2DcfHVhb97R6782Nifgrns1BjL5AsPF4um47GF
	9u2drgnM5nKDy/6NajYrVlU8ehaXDi/03Ming67PfJr8UUuw5csHekrNGjH7skC8ENv9Z+1KBzW0c
	eE86FEI4o4ldKW+19RyExTPIYdRTzxwM30zjnEeLW+JSlY/j3Mn6zeMuu7Q/Xk0FeAEfP7lPX1mxL
	wTmAN/dNWSvFZK6XHGogv/1gpnH0OIehU3o4cVjXxqvAuLZIBJmo/ajTbt/WKQzw98/B/ClNCUicy
	o0/rCNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD6cE-0000000B4uK-2Uw4
	for ath12k@archiver.kernel.org;
	Fri, 31 May 2024 18:04:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD6c5-0000000B4pP-3q28
	for ath12k@lists.infradead.org;
	Fri, 31 May 2024 18:04:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VHAr0x019559;
	Fri, 31 May 2024 18:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CL+gGgDzeqN
	4J04uMz7LUHJBpDdT+0KgfstkX2K1w8A=; b=GnhRSiFLUU4uxJf05HkZvshffhF
	VXdBbq/8KIdrBBRJKqphznW5XS/MrQA5YK4NxkfcANxacww1Q2zMYyV/v9VSR3nf
	L7pgjd1s/xhBdWhc9r/bThmAy2lyK0epp17HUs3olz5R8fv2YX2XxWQUpLjni8tK
	EaTS2inrJ+G/kV1YOhRTChgncQvE0PNrxYGzFsopNHbaqPwcC8ue4uqluvjyDvDZ
	2scGzFeo/nPIoltjb/o59LdUXms+ZgcSaIaUuxTETHSaLLlhHlHiDrzplK/C10cy
	jDjN3qf0kmLSgJsMyCYgSN/YzqM1v+q/1wwt82Wd7IDUqpf6eh8ot4FWbVg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2n7ur0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 18:04:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44VI4JrB012298;
	Fri, 31 May 2024 18:04:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3yf34nn90v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 18:04:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VI4Ju5012195;
	Fri, 31 May 2024 18:04:19 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44VI4JQn012122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 18:04:19 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 4277441174; Fri, 31 May 2024 23:34:18 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH v8 7/8] wifi: ath12k: refactor core start based on hardware group
Date: Fri, 31 May 2024 23:34:10 +0530
Message-Id: <20240531180411.1149605-8-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531180411.1149605-1-quic_hprem@quicinc.com>
References: <20240531180411.1149605-1-quic_hprem@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DPKaVkR-A_H692XURLD03YosQiLuSOG_
X-Proofpoint-ORIG-GUID: DPKaVkR-A_H692XURLD03YosQiLuSOG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=921 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_110426_177275_1329D16B 
X-CRM114-Status: GOOD (  24.27  )
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
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 210 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/core.h |  32 ++++
 2 files changed, 191 insertions(+), 51 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ebe31cbb6435..90c70dbfc50a 100644
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
@@ -795,6 +804,12 @@ static int ath12k_core_start(struct ath12k_base *ab,
 		/* ACPI is optional so continue in case of an error */
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", ret);
 
+	if (!test_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags)) {
+		/* Indicate the core start in the appropriate group */
+		ath12k_inc_num_core_started(ab);
+		set_bit(ATH12K_FLAG_CORE_STARTED, &ab->dev_flags);
+	}
+
 	return 0;
 
 err_reo_cleanup:
@@ -806,6 +821,108 @@ static int ath12k_core_start(struct ath12k_base *ab,
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
+		ath12k_hif_irq_enable(ab);
+		set_bit(ATH12K_FLAG_CORE_HIF_IRQ_ENABLED, &ab->dev_flags);
+
+		ret = ath12k_core_rfkill_config(ab);
+		if (ret && ret != -EOPNOTSUPP) {
+			mutex_unlock(&ab->core_lock);
+			goto err;
+		}
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
 
@@ -1258,7 +1373,7 @@ static struct ath12k_hw_group *ath12k_core_assign_hw_group(struct ath12k_base *a
 
 void ath12k_core_unassign_hw_group(struct ath12k_base *ab)
 {
-	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
 	u8 device_id = ab->device_id;
 	int num_probed;
 
@@ -1292,19 +1407,6 @@ void ath12k_core_unassign_hw_group(struct ath12k_base *ab)
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
@@ -1332,14 +1434,20 @@ static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)
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


