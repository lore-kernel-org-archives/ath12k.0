Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88979E77171
	for <ath12k@archiver.kernel.org>; Wed,  4 Dec 2024 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPq9WAPzuu9TMVdHoPn1bWsYuMntj7HoXZ8NP2L79NE=; b=J2kwBei52G6ULz82wednIXxZty
	3HpGwhQ8XAnf0vIgbFZEXBi1HukR469S27XfPx8YCDpUKtyRRfusOdkGxqnGwCXjl02LbRAFzrHSu
	tq5zHv+dCW5op4A5c5Xs870sXDLwfuSQe9w0fr8+5L/IvVSXXTrkf7SGEPh5iUizRmWioXXQ4Xh4w
	RMsEfJLm8XLYVOjPNPDx/1U1DC+Dwl4izCDEcmk8vv2Lgxr9COKPBiXfXUULz+p7/w6CA+t3A1NU9
	dFO/h4FiBvFYY9IIbeAQ+fwR2VKLDKwZjHSAoU7GZX/uLBJvOjwWIuZ9ets6EDPZxxbK22+brg+af
	h4OsJtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItPv-0000000DPeq-0opB
	for ath12k@archiver.kernel.org;
	Wed, 04 Dec 2024 17:44:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIc-0000000DCST-1Qn7
	for ath12k@lists.infradead.org;
	Wed, 04 Dec 2024 16:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F06CAA40C04
	for <ath12k@lists.infradead.org>; Wed,  4 Dec 2024 16:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8EFC4CED1;
	Wed,  4 Dec 2024 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329945;
	bh=oJRYZN8/sjs3B+/L4nBwC7nAviSBM+E3+2mjM0dRU7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mbQvmUXN+97WBQfTRZpjB6RQgUOSuG5XPCgTkl8Ngfos5T4GGKWsan3896CaGD6y0
	 UfJSk9Qjxti4/RNAI7tJjUk7buC61dqU+dQy/ds25A7nfJdY2tcs5qTo5Smh01AJub
	 lwapgKIr23nJZu6NCkOhb68QA/a4GUjO/5rh77PFz1xnVreGsYKM2joNWWDVQj52h7
	 aQyEEwbf8xnJ/u4JqxhgUJ501lLVBCXtalDjA0aVcw89H4AJNAEs7ZBuF1gOxXqf6s
	 vuZ0K3Yvaa8JWPyZlLbUvQ+OJZlTRKz7U3I9uRnu6Y+gbqa28p5WpzOwxsk7hbqgSq
	 OEZRmQFCbBiuA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 6/7] wifi: ath12k: send QMI host capability after device group is ready
Date: Wed,  4 Dec 2024 18:32:15 +0200
Message-Id: <20241204163216.433795-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204163216.433795-1-kvalo@kernel.org>
References: <20241204163216.433795-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_083226_523281_EEF3C5C9 
X-CRM114-Status: GOOD (  21.60  )
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

QMI host capability has the information regarding MLO parameters such as
device_id, MLO capability, group id and the information of each devices
involved in the group and sent immediately on QMI server arrive event.
Currently, only one device is involved in the group and hence, single
device information is sent as part of MLO capability of host.

But, in future when multi device group abstraction is introduced, host
should send all the device information involved in the group as part
of QMI MLO host capability rather than single device. Hence, sending
QMI host capability immediately on server arrive of a device might not
be ideal for multi device group abstraction as the details of other
devices in the group would not be available.

Hence, once QMI server arrive event is received, request for QMI PHY
capabilities of device, and defer the host capability send for that device.
After QMI PHY capability is received for all the devices in the group
trigger the host capability event for the deferred devices in the group.

Hence, add changes to defer the QMI host capability event until the device
group is ready and then resume the QMI exchange for all the device with
host capabilities.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 21 ++++++
 drivers/net/wireless/ath/ath12k/qmi.c  | 98 ++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h  | 20 ++++++
 3 files changed, 134 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index bbfa57d097af..18b29515c6ae 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -969,6 +969,25 @@ bool ath12k_core_hw_group_start_ready(struct ath12k_hw_group *ag)
 	return (ag->num_started == ag->num_devices);
 }
 
+static void ath12k_core_trigger_partner(struct ath12k_base *ab)
+{
+	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_base *partner_ab;
+	bool found = false;
+	int i;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		partner_ab = ag->ab[i];
+		if (!partner_ab)
+			continue;
+
+		if (found)
+			ath12k_qmi_trigger_host_cap(partner_ab);
+
+		found = (partner_ab == ab);
+	}
+}
+
 int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
@@ -1010,6 +1029,8 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 			goto err_core_stop;
 		}
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "group %d started\n", ag->id);
+	} else {
+		ath12k_core_trigger_partner(ab);
 	}
 
 	mutex_unlock(&ag->mutex);
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 8b4d500fe426..2591d132a3fc 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3088,11 +3088,69 @@ ath12k_qmi_driver_event_post(struct ath12k_qmi *qmi,
 	return 0;
 }
 
+void ath12k_qmi_trigger_host_cap(struct ath12k_base *ab)
+{
+	struct ath12k_qmi *qmi = &ab->qmi;
+
+	spin_lock(&qmi->event_lock);
+
+	if (ath12k_qmi_get_event_block(qmi))
+		ath12k_qmi_set_event_block(qmi, false);
+
+	spin_unlock(&qmi->event_lock);
+
+	ath12k_dbg(ab, ATH12K_DBG_QMI, "trigger host cap for device id %d\n",
+		   ab->device_id);
+
+	ath12k_qmi_driver_event_post(qmi, ATH12K_QMI_EVENT_HOST_CAP, NULL);
+}
+
+static bool ath12k_qmi_hw_group_host_cap_ready(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+
+		if (!(ab && ab->qmi.num_radios != U8_MAX))
+			return false;
+	}
+
+	return true;
+}
+
+static struct ath12k_base *ath12k_qmi_hw_group_find_blocked(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
+
+	lockdep_assert_held(&ag->mutex);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		spin_lock(&ab->qmi.event_lock);
+
+		if (ath12k_qmi_get_event_block(&ab->qmi)) {
+			spin_unlock(&ab->qmi.event_lock);
+			return ab;
+		}
+
+		spin_unlock(&ab->qmi.event_lock);
+	}
+
+	return NULL;
+}
+
 /* clang stack usage explodes if this is inlined */
 static noinline_for_stack
 int ath12k_qmi_event_server_arrive(struct ath12k_qmi *qmi)
 {
-	struct ath12k_base *ab = qmi->ab;
+	struct ath12k_base *ab = qmi->ab, *block_ab;
+	struct ath12k_hw_group *ag = ab->ag;
 	int ret;
 
 	ath12k_qmi_phy_cap_send(ab);
@@ -3103,12 +3161,22 @@ int ath12k_qmi_event_server_arrive(struct ath12k_qmi *qmi)
 		return ret;
 	}
 
-	ret = ath12k_qmi_host_cap_send(ab);
-	if (ret < 0) {
-		ath12k_warn(ab, "qmi failed to send host cap QMI:%d\n", ret);
-		return ret;
+	spin_lock(&qmi->event_lock);
+
+	ath12k_qmi_set_event_block(qmi, true);
+
+	spin_unlock(&qmi->event_lock);
+
+	mutex_lock(&ag->mutex);
+
+	if (ath12k_qmi_hw_group_host_cap_ready(ag)) {
+		block_ab = ath12k_qmi_hw_group_find_blocked(ag);
+		if (block_ab)
+			ath12k_qmi_trigger_host_cap(block_ab);
 	}
 
+	mutex_unlock(&ag->mutex);
+
 	return ret;
 }
 
@@ -3295,6 +3363,21 @@ static const struct qmi_ops ath12k_qmi_ops = {
 	.del_server = ath12k_qmi_ops_del_server,
 };
 
+static int ath12k_qmi_event_host_cap(struct ath12k_qmi *qmi)
+{
+	struct ath12k_base *ab = qmi->ab;
+	int ret;
+
+	ret = ath12k_qmi_host_cap_send(ab);
+	if (ret < 0) {
+		ath12k_warn(ab, "failed to send qmi host cap for device id %d: %d\n",
+			    ab->device_id, ret);
+		return ret;
+	}
+
+	return ret;
+}
+
 static void ath12k_qmi_driver_event_work(struct work_struct *work)
 {
 	struct ath12k_qmi *qmi = container_of(work, struct ath12k_qmi,
@@ -3351,6 +3434,11 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 					&ab->dev_flags);
 
 			break;
+		case ATH12K_QMI_EVENT_HOST_CAP:
+			ret = ath12k_qmi_event_host_cap(qmi);
+			if (ret < 0)
+				set_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags);
+			break;
 		default:
 			ath12k_warn(ab, "invalid event type: %d", event->type);
 			break;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 0dfcbd8cb59b..98f6009ab21e 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -68,6 +68,7 @@ enum ath12k_qmi_event_type {
 	ATH12K_QMI_EVENT_FORCE_FW_ASSERT,
 	ATH12K_QMI_EVENT_POWER_UP,
 	ATH12K_QMI_EVENT_POWER_DOWN,
+	ATH12K_QMI_EVENT_HOST_CAP,
 	ATH12K_QMI_EVENT_MAX,
 };
 
@@ -142,6 +143,10 @@ struct ath12k_qmi {
 	u32 target_mem_mode;
 	bool target_mem_delayed;
 	u8 cal_done;
+
+	/* protected with struct ath12k_qmi::event_lock */
+	bool block_event;
+
 	u8 num_radios;
 	struct target_info target;
 	struct m3_mem_region m3_mem;
@@ -594,11 +599,26 @@ struct qmi_wlanfw_wlan_ini_resp_msg_v01 {
 	struct qmi_response_type_v01 resp;
 };
 
+static inline void ath12k_qmi_set_event_block(struct ath12k_qmi *qmi, bool block)
+{
+	lockdep_assert_held(&qmi->event_lock);
+
+	qmi->block_event = block;
+}
+
+static inline bool ath12k_qmi_get_event_block(struct ath12k_qmi *qmi)
+{
+	lockdep_assert_held(&qmi->event_lock);
+
+	return qmi->block_event;
+}
+
 int ath12k_qmi_firmware_start(struct ath12k_base *ab,
 			      u32 mode);
 void ath12k_qmi_firmware_stop(struct ath12k_base *ab);
 void ath12k_qmi_deinit_service(struct ath12k_base *ab);
 int ath12k_qmi_init_service(struct ath12k_base *ab);
 void ath12k_qmi_free_resource(struct ath12k_base *ab);
+void ath12k_qmi_trigger_host_cap(struct ath12k_base *ab);
 
 #endif
-- 
2.39.5


