Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA26E7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 21:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/P+5k6jljrWGkhGceGO0cVhYWwEs14PbDhopePz0B0=; b=zs50Zmc9udi4Jn29/Q0Gkgrcw6
	wc9oxf+t1XV6QHNoiOOdic+K87WnenAIaNE9gzf2lga/JyYplzBbCZKuZjwUE49gjeV1MmGH71gY2
	HzYB8DSIDSoaCBVlTahsZW5jQ53OnjlvMrofmsS9pIWz3QXn5+ouYbm3G+s8CTQKq7wSzYelZtyZB
	oJ9tNlQJTkVwRyJp1LCyVMxVwuu7sCA6YG4l87VH6ClgIvBMMvUKYafOoILr1r/ixCt09Aff/8MYs
	G+6kjdfWFXFD9RjfMuZsxVtkdMYT4GmKcsW6qlwekYaNCK04VnLZmZf/y3dJJtLdFbXuRkm2cu4/+
	mHx9WSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKlbl-00000009Ljm-0Fgo
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 21:48:01 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKlbh-00000009LjE-1wnf
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 21:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1733780872; bh=sUilYxC3Msi0FUQmiLjjMHbbLwJuP3U3wh76oeMKnSk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vJYh7TPQsZzbXANfreb5hl81zfBgRTT7mnhSpAW/tRGK0tSIOIEGu6vnlfMMnEADF
	 S5WCqcc3EWYRmyx2+cYOVjajRaRTJUFVw56AmTyOLFJ6DV604/ltqwY+8HxsHerUPG
	 gqKle1GixcEIzHMZ7PtgahAZnquqXlT2X8GFUuY8=
Received: from grml.local.home.ionic.de (home.ionic.de [178.13.93.66])
	by mail.ionic.de (Postfix) with ESMTPSA id 4C6D714873B2;
	Mon, 09 Dec 2024 22:47:52 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath12k@lists.infradead.org,
	Kang Yang <quic_kangyang@quicinc.com>
Subject: [RFC] [PATCH] wifi: ath12k: wait for chan update in reg_notifier
Date: Mon,  9 Dec 2024 22:47:33 +0100
Message-ID: <8b2a2c54f34c60f2170bd0cfc01c602dbb8e5d96.1733780780.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de>
References: <3833e16a-4209-4ce9-8c40-a5d41827a1f3@ionic.de> <20241017030927.1695-1-quic_kangyang@quicinc.com> <303a0926-e622-4fa2-ada7-05c7d758b778@ionic.de> <5176a1d1-c08c-4506-9dea-9aed4e54e3b7@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_134757_991758_91C49B97 
X-CRM114-Status: GOOD (  14.42  )
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

Currently, setting a new regdomain is asynchronous in ath12k, in the
sense that the reg_notifier function does not wait for the actual
regdomain change to complete, including handling the channel list
update.

This causes issues with user space programs like hostapd, which listen
on a netlink socket, set a new country code, see a reg change event and
assume that the reg change actually completed within the driver as well.

Unfortunately, this has almost never been the case in my testing, which
lead to failures when trying to use channels that are disallowed in the
old regdomain, but allowed in the new regdomain.

Easy reproducer:
iw reg set CN
hostapd hostapd.conf # should contain e.g., channel=100 and country_code=DE
=> fails to start

Be nice to user space and wait for ath12k_regd_update to complete prior
to exiting the reg_notifier, which is triggered by receiving the channel
list update event from the FW.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
---
 drivers/net/wireless/ath/ath12k/core.c |  2 ++
 drivers/net/wireless/ath/ath12k/core.h |  3 +++
 drivers/net/wireless/ath/ath12k/mac.c  |  3 +++
 drivers/net/wireless/ath/ath12k/reg.c  | 11 +++++++++++
 4 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 07c6cdd9fcd5..9a226484062f 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1073,6 +1073,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 
 		ieee80211_stop_queues(ah->hw);
 
+		complete(&ah->completed_regd_update);
+
 		for (j = 0; j < ah->num_radio; j++) {
 			ar = &ah->radio[j];
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 0be274f99c99..6507eee32056 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -360,6 +360,7 @@ struct ath12k_vif_iter {
 #define ATH12K_RX_RATE_TABLE_NUM 320
 
 #define ATH12K_SCAN_TIMEOUT_HZ (20 * HZ)
+#define ATH12K_REGD_UPDATE_TIMEOUT_HZ (60 * HZ)
 
 struct ath12k_rx_peer_rate_stats {
 	u64 ht_mcs_count[HAL_RX_MAX_MCS_HT + 1];
@@ -742,6 +743,8 @@ struct ath12k_hw {
 
 	DECLARE_BITMAP(free_ml_peer_id_map, ATH12K_MAX_MLO_PEERS);
 
+	struct completion completed_regd_update;
+
 	/* protected by wiphy_lock() */
 	struct list_head ml_peers;
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4cbe8dbdcba9..b76135b4b164 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10649,6 +10649,8 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 
 	ieee80211_unregister_hw(hw);
 
+	reinit_completion(&ah->completed_regd_update);
+
 	for_each_ar(ah, ar, i)
 		ath12k_mac_cleanup_unregister(ar);
 
@@ -10861,6 +10863,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_PUNCT);
 
 	ath12k_reg_init(hw);
+	init_completion(&ah->completed_regd_update);
 
 	if (!is_raw_mode) {
 		hw->netdev_features = NETIF_F_HW_CSUM;
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 7d2d887c5dbe..046ad0eadf7e 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -52,6 +52,7 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
 	int ret, i;
+	unsigned long left = 0;
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_REG,
 		   "Regulatory Notification received for %s\n", wiphy_name(wiphy));
@@ -125,6 +126,15 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 
 		ar->regdom_set_by_user = true;
 	}
+
+	left = wait_for_completion_timeout(&ah->completed_regd_update,
+					   ATH12K_REGD_UPDATE_TIMEOUT_HZ);
+	if (!left) {
+		ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+			   "failed to receive regd update complete: timed out\n");
+	}
+	ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+		   "regd update wait left time %ld\n", left);
 }
 
 int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
@@ -343,6 +353,7 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 		goto skip;
 
 	ah->regd_updated = true;
+	complete(&ah->completed_regd_update);
 skip:
 	return 0;
 err:
-- 
2.45.2


