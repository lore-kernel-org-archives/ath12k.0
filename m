Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA014E7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBGxYA7eYfmNtmIGClhu/PU9U2/QcozbmV9UkP/g1dc=; b=3xKbi27zKVwjysfw2ATFxEgUUG
	4O6h6n+6QVu2vyxZlfoVEpqPGANm2ymlqAR5D8Lku3ITVXJxIE1soGdJIw4mwD8nzwOI/w0hXYMHy
	Ih1IeB0r3wZG8MRItaYf5ARQ67Ces7B1ZNPhVMMs7gNoMJI+zQZOmShl/vjT8yK7UVMQtFFIZgUUW
	wFkybB0dipYV4hGBe3oSiJ3M4QlyDAmNExsxL1E0sF4DDpIJEAGUW+Uohn4WRQ41YmnphtmSMDoj8
	w9YXvh3YMf9CtPBORdngLp6KkjIr1wnOtzC9sdudguiGZHrIsgDTDfsItux2x7DlXoDUGB6rmwhMK
	ASAba34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe9A-0000000EkFR-1o1Z
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 20:26:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe98-0000000EkEW-1CMM
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 20:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E24C5C5820
	for <ath12k@lists.infradead.org>; Tue, 17 Dec 2024 20:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC24CC4CEDD;
	Tue, 17 Dec 2024 20:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734467181;
	bh=oHhMU+EKio682SB2+Dh1hNm9yIecNFwww1aqgC/Qv50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnVRgpu5leLLhjvxgOkwrCuxsBcwxrb/MwHGZeGFnOSoQBJpLRN4mdKl8a9ZV7Gtb
	 s8A8Pl7NMtZCEe/qdPdtIBzP5DfkIbLl1n6dM6PCbad7QiGtz1ZMKphIqo4qgLZ1v8
	 ONc3S67ROBtiVKPsBAoRdamlUIs+O0S9MWnkBeopvikQCQrhRtdJiFdBGJQnhXbigD
	 jfq4gl1PmREURcxOuASqmIpl5pZQmxNGnnIffmw0sqfRreMIFXYw3gU6Od93Vgah4p
	 hB18k/6jZpuBve56SeTvISE9fYI2EwFw1BumrrgmX0aYvds16eXJ4d18uQAzTMWRpH
	 hWTnTKXRdJ80A==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/4] wifi: ath12k: Decrease ath12k_mac_op_remain_on_channel() stack usage
Date: Tue, 17 Dec 2024 22:26:15 +0200
Message-Id: <20241217202618.1329312-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217202618.1329312-1-kvalo@kernel.org>
References: <20241217202618.1329312-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_122622_424182_8CB8EBC7 
X-CRM114-Status: GOOD (  14.96  )
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

From: Jeff Johnson <quic_jjohnson@quicinc.com>

Building the ath12k driver with llvm-18.1.7-x86_64 produces the warning:

drivers/net/wireless/ath/ath12k/mac.c:10028:12: warning: stack frame size (1080) exceeds limit (1024) in 'ath12k_mac_op_remain_on_channel' [-Wframe-larger-than]

A major contributor to the stack usage in this function is:

	struct ath12k_wmi_scan_req_arg arg;

Avoid the excess stack usage by dynamically allocating arg instead of
declaring it on the stack. As part of the effort use __free() for both
this new allocation as well as the existing chan_list allocation, and
since then no central cleanup is required, replace all cleanup gotos
with returns.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 76 ++++++++++++---------------
 1 file changed, 33 insertions(+), 43 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 186765fa95f5..05d2c75e5df2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10054,7 +10054,6 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k_wmi_scan_req_arg arg;
 	struct ath12k_link_vif *arvif;
 	struct ath12k *ar;
 	u32 scan_time_msec;
@@ -10065,10 +10064,8 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	lockdep_assert_wiphy(hw->wiphy);
 
 	ar = ath12k_mac_select_scan_device(hw, vif, chan->center_freq);
-	if (!ar) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (!ar)
+		return -EINVAL;
 
 	/* check if any of the links of ML VIF is already started on
 	 * radio(ar) correpsondig to given scan frequency and use it,
@@ -10087,15 +10084,11 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	 * always on the same band for the vif
 	 */
 	if (arvif->is_created) {
-		if (WARN_ON(!arvif->ar)) {
-			ret = -EINVAL;
-			goto exit;
-		}
+		if (WARN_ON(!arvif->ar))
+			return -EINVAL;
 
-		if (ar != arvif->ar && arvif->is_started) {
-			ret = -EBUSY;
-			goto exit;
-		}
+		if (ar != arvif->ar && arvif->is_started)
+			return -EBUSY;
 
 		if (ar != arvif->ar) {
 			ath12k_mac_remove_link_interface(hw, arvif);
@@ -10112,7 +10105,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		if (ret) {
 			ath12k_warn(ar->ab, "unable to create scan vdev for roc: %d\n",
 				    ret);
-			goto exit;
+			return ret;
 		}
 	}
 
@@ -10140,37 +10133,41 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->data_lock);
 
 	if (ret)
-		goto exit;
+		return ret;
 
 	scan_time_msec = hw->wiphy->max_remain_on_channel_duration * 2;
 
-	memset(&arg, 0, sizeof(arg));
-	ath12k_wmi_start_scan_init(ar, &arg);
-	arg.num_chan = 1;
-	arg.chan_list = kcalloc(arg.num_chan, sizeof(*arg.chan_list),
-				GFP_KERNEL);
-	if (!arg.chan_list) {
-		ret = -ENOMEM;
-		goto exit;
-	}
+	struct ath12k_wmi_scan_req_arg *arg __free(kfree) =
+					kzalloc(sizeof(*arg), GFP_KERNEL);
+	if (!arg)
+		return -ENOMEM;
 
-	arg.vdev_id = arvif->vdev_id;
-	arg.scan_id = ATH12K_SCAN_ID;
-	arg.chan_list[0] = chan->center_freq;
-	arg.dwell_time_active = scan_time_msec;
-	arg.dwell_time_passive = scan_time_msec;
-	arg.max_scan_time = scan_time_msec;
-	arg.scan_f_passive = 1;
-	arg.burst_duration = duration;
+	ath12k_wmi_start_scan_init(ar, arg);
+	arg->num_chan = 1;
 
-	ret = ath12k_start_scan(ar, &arg);
+	u32 *chan_list __free(kfree) = kcalloc(arg->num_chan, sizeof(*chan_list),
+					       GFP_KERNEL);
+	if (!chan_list)
+		return -ENOMEM;
+
+	arg->chan_list = chan_list;
+	arg->vdev_id = arvif->vdev_id;
+	arg->scan_id = ATH12K_SCAN_ID;
+	arg->chan_list[0] = chan->center_freq;
+	arg->dwell_time_active = scan_time_msec;
+	arg->dwell_time_passive = scan_time_msec;
+	arg->max_scan_time = scan_time_msec;
+	arg->scan_f_passive = 1;
+	arg->burst_duration = duration;
+
+	ret = ath12k_start_scan(ar, arg);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to start roc scan: %d\n", ret);
 
 		spin_lock_bh(&ar->data_lock);
 		ar->scan.state = ATH12K_SCAN_IDLE;
 		spin_unlock_bh(&ar->data_lock);
-		goto free_chan_list;
+		return ret;
 	}
 
 	ret = wait_for_completion_timeout(&ar->scan.on_channel, 3 * HZ);
@@ -10179,20 +10176,13 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		ret = ath12k_scan_stop(ar);
 		if (ret)
 			ath12k_warn(ar->ab, "failed to stop scan: %d\n", ret);
-		ret = -ETIMEDOUT;
-		goto free_chan_list;
+		return -ETIMEDOUT;
 	}
 
 	ieee80211_queue_delayed_work(hw, &ar->scan.timeout,
 				     msecs_to_jiffies(duration));
 
-	ret = 0;
-
-free_chan_list:
-	kfree(arg.chan_list);
-
-exit:
-	return ret;
+	return 0;
 }
 
 static void ath12k_mac_op_set_rekey_data(struct ieee80211_hw *hw,
-- 
2.39.5


