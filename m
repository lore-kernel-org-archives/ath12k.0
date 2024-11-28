Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9FAD70DEA
	for <ath12k@archiver.kernel.org>; Thu, 28 Nov 2024 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6CwwyP1tdJcH6dgB6/bQ7oZ2Tq/jlabB9+qagMeZRA=; b=yr2zqrn9lQemabem0Q07D/VLCx
	pYKgM1WCnCzb4C7rdLjWYgTYhgEq0rmYfgw7KURO7jRaeG/QsrupnuYYZEOU3VtwOhxCPlw/Xp5dE
	MuK6LcoGb6GHIXkh1JvYYdkL+tawjHu+qriyoeBOpKLvJIW1sZXVf+YN3HajKSBqoKnKDVtn9Fcwb
	VBIOOPf4N8h/DaE1DWEblBx8ILr8Nz3sUcBLRixk4+vrdmfAkpJowkJmTX3wypUDBGTw0Ou6IROw7
	vrpOGjMcjM6+9mCXftHeG+LdyLjuwHlQ1Es1cVOhOjtJl+3IuceCnG/COPvEpAM5wLltKUL0ANv7r
	CyfHzNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhjI-0000000G26I-1oDP
	for ath12k@archiver.kernel.org;
	Thu, 28 Nov 2024 16:51:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhis-0000000G21Z-0L52
	for ath12k@lists.infradead.org;
	Thu, 28 Nov 2024 16:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 551C75C5C52
	for <ath12k@lists.infradead.org>; Thu, 28 Nov 2024 16:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1761C4CED4;
	Thu, 28 Nov 2024 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732812633;
	bh=BoFTlv8IYSdceKXzWgSlOIIQHGJO4tWrQfVL0fVBu14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMiU9HRfG6J+G1qIhA7wFe0kxZVHV+2KdEkYtP5dO0DjdpT9A8liCu32/k0NW4ELL
	 x+SgyxBTKjFse1qBSpEmHfEvDoXB1NnJb5VhVuQd0rwEeQhPs2COfnq9rTC6PN7nDo
	 2MLAt4rQ4o53zcRHY1yrvLOSt9Kol1Z/cY8o5dVQOJouXsTAh7b0ym7IMOkcvSATlZ
	 vp5cMjaBfZtLKWDOn06e2xztOs+Z3/4Q2T88z5pwNR1cob09s0qs9ZRfPpnjo/Bi8J
	 MX3YGn40XRj2xgUFxtgT82qK07YziYKRu+Hjh6VAq+D6xQR4U5C5CG8sp7b35cej+c
	 7eB7JqJ/qtn+g==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 4/4] wifi: ath12k: introduce QMI firmware ready flag
Date: Thu, 28 Nov 2024 18:50:26 +0200
Message-Id: <20241128165026.2618331-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241128165026.2618331-1-kvalo@kernel.org>
References: <20241128165026.2618331-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_085034_205836_DF1B7FDB 
X-CRM114-Status: GOOD (  12.32  )
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

When hardware device group abstraction is introduced, the QMI firmware ready
event of different devices in a group can be received simultaneously. To
indicate the firmware ready event is completed for a particular device in a
group set a flag (ATH12K_FLAG_QMI_FW_READY_COMPLETE). This helps the upcoming
hardware recovery implementation for hardware device group abstraction.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  2 +-
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 12 +++++++++---
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 386d42db29ac..4da147f7bfac 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1145,7 +1145,7 @@ static void ath12k_core_reset(struct work_struct *work)
 	int reset_count, fail_cont_count;
 	long time_left;
 
-	if (!(test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags))) {
+	if (!(test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))) {
 		ath12k_warn(ab, "ignore reset dev flags 0x%lx\n", ab->dev_flags);
 		return;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4bfc7a7cc894..9ddced140056 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -228,6 +228,7 @@ enum ath12k_dev_flags {
 	ATH12K_FLAG_HTC_SUSPEND_COMPLETE,
 	ATH12K_FLAG_CE_IRQ_ENABLED,
 	ATH12K_FLAG_EXT_IRQ_ENABLED,
+	ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 };
 
 struct ath12k_tx_conf {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index f5388eae01dc..77d8ee14bf33 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3033,6 +3033,8 @@ void ath12k_qmi_firmware_stop(struct ath12k_base *ab)
 {
 	int ret;
 
+	clear_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags);
+
 	ret = ath12k_qmi_wlanfw_mode_send(ab, ATH12K_FIRMWARE_MODE_OFF);
 	if (ret < 0) {
 		ath12k_warn(ab, "qmi failed to send wlan mode off\n");
@@ -3336,7 +3338,7 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			break;
 		case ATH12K_QMI_EVENT_FW_READY:
 			clear_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags);
-			if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
+			if (test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags)) {
 				if (ab->is_reset)
 					ath12k_hal_dump_srng_stats(ab);
 				queue_work(ab->workqueue, &ab->restart_work);
@@ -3346,8 +3348,12 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			clear_bit(ATH12K_FLAG_CRASH_FLUSH,
 				  &ab->dev_flags);
 			clear_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
-			ath12k_core_qmi_firmware_ready(ab);
-			set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+			ret = ath12k_core_qmi_firmware_ready(ab);
+			if (!ret) {
+				set_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE,
+					&ab->dev_flags);
+				set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+			}
 
 			break;
 		default:
-- 
2.39.5


