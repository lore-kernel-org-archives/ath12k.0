Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3087FC531C9
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qU4mury5dUC+mV/3udjq3v/PsV2Tq2IdSkugGkcQ0og=; b=cTE0Q460fVWW9e+XMJxtKzuBVm
	3e/FqK+iaKFEVu6ZsC1h+WFuMaJsJbdkZYphN9BzMwiTvJ7CwsipjAAqhkO/G3Yui22PLBabKKfJE
	x2xec/rFEQfizJE50xgqnbncJ4HGJ0it3POIsczxl6ul6yNtV4fnX3e8jwgD+IGq6w94wV8j0mwi+
	XcerFN/2Es5ggi81HBDm2bm0EHbLPPYD8M2PIAdenuI5Qv/UHRsX6jAXzMh+QNJ84uu3/wvlKgVS5
	6b/g0CPfz0jjpgBUSczGST8O97IolXmoBPkHtvszGtJSC074lLHnwuHBg1ym44tcROucR0BzLZzQD
	Y1uVGwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBa-00000003K8j-3QJl;
	Mon, 27 Jul 2026 16:28:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBX-00000003K66-3a4R
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 16:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qU4mury5dUC+mV/3udjq3v/PsV2Tq2IdSkugGkcQ0og=;
	b=COw6kEe1epiG1NdLq3gJKrTfJfuzoEvi4bZNJuXvZctHQyvt1EuWYLMuGi3xF5Ep0fz/Lm
	VQO9hoCeFVxmeJ3KN+9lODNs/dTQPIK2NWtr+9AEBSN9Vm6Gn9Wcoc/EJ0NDE/Y1Z9Ye7P
	dogH3AnGSPvJUswmzUB8UW+dZ8wYNJI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-135-ipH0MB74PUaAKsD6Z2KgJA-1; Mon,
 27 Jul 2026 12:28:06 -0400
X-MC-Unique: ipH0MB74PUaAKsD6Z2KgJA-1
X-Mimecast-MFC-AGG-ID: ipH0MB74PUaAKsD6Z2KgJA_1785169685
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9CAA918001F9;
	Mon, 27 Jul 2026 16:28:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.58])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 30F52429;
	Mon, 27 Jul 2026 16:28:02 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 1/5] wifi: ath12k: fix MLO station firmware crash recovery
Date: Mon, 27 Jul 2026 18:27:44 +0200
Message-ID: <20260727162748.963275-2-jtornosm@redhat.com>
In-Reply-To: <20260727162748.963275-1-jtornosm@redhat.com>
References: <20260727162748.963275-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 7_Giz5TQqNqD3LJ9aGkaZzuOrsA235p38_N_ujQObeE_1785169685
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092811_969632_C80432D9 
X-CRM114-Status: GOOD (  21.31  )
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

ATH12K_FLAG_RECOVERY is cleared too early in
ath12k_core_reconfigure_on_crash(), before mac80211 runs
ieee80211_reconfig(). By the time mac80211 calls back into the driver
(sta_state, change_vif_links, set_key), the RECOVERY flag is already false,
so the driver treats recovery callbacks as normal operations.

This causes several problems during MLO recovery:

- ath12k_mac_op_sta_state() tries to activate MLO links during the
  AUTH->ASSOC transition, calling ieee80211_set_active_links()
  recursively, which triggers a WARNING at net/mac80211/link.c.

- ath12k_mac_op_change_vif_links() processes link removal during
  reconfig, causing inconsistent state.

- ath12k_mac_set_key() fails with "cannot install key for non-existent
  peer" because peers do not exist yet during reconfig. Keys will be
  re-established during normal reconnection after
  ieee80211_hw_restart_disconnect() triggers a fresh association.

- ath12k_mac_flush() waits for pending TX to complete, but after a
  firmware crash the TX will never complete, causing a 20 second timeout.

- ath12k_mac_station_remove() calls ath12k_bss_disassoc() and
  ath12k_mac_vdev_stop() which send WMI commands to dead firmware,
  causing timeouts that delay recovery.

- ath12k_clear_peer_keys() tries to look up and clear peer keys, but
  peers are already gone after firmware crash.

- ath12k_dp_rx_ampdu_stop() dereferences per-link station state that
  may not be valid during crash teardown.

- ath12k_peer_mlo_link_peers_delete() sends WMI peer delete commands
  for each MLO link peer. With dead firmware these time out and can
  trigger cascading resets.

- HAL srng source ring operations (ath12k_hal_srng_src_num_free,
  ath12k_hal_srng_src_get_next_entry, ath12k_hal_srng_access_end)
  may attempt MMIO access to hardware that is no longer responsive
  if TX paths race with the crash. Guard these to prevent potential
  hard lockups on unresponsive hardware.

These issues were observed during sporadic firmware crashes in MLO
operation. To allow systematic testing and reproduction, the debugfs
simulate_fw_crash interface was used to trigger controlled firmware
crashes during active MLO connections with traffic.

Fix by moving clear_bit(ATH12K_FLAG_RECOVERY) from
ath12k_core_reconfigure_on_crash() to ath12k_mac_op_reconfig_complete(),
so the flag stays set through the entire mac80211 reconfig phase. Add
ATH12K_FLAG_RECOVERY checks in change_vif_links, set_key, and sta_state
to skip operations that are invalid during recovery. Add
ATH12K_FLAG_CRASH_FLUSH checks in mac_flush, station_remove,
clear_peer_keys, dp_rx_ampdu_stop, peer_mlo_link_peers_delete, and the
HAL srng source ring helpers to return immediately when the firmware is
dead.

Tested on WCN7850 with MLO (Wi-Fi 7).

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/core.c  |  2 --
 drivers/net/wireless/ath/ath12k/dp_rx.c |  3 +++
 drivers/net/wireless/ath/ath12k/hal.c   | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/mac.c   | 19 +++++++++++++++++--
 drivers/net/wireless/ath/ath12k/peer.c  |  6 ++++++
 5 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 742d4fd1b598..5c3883b19da1 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1410,8 +1410,6 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
 	if (ret)
 		goto err_hal_srng_deinit;
 
-	clear_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
-
 	return 0;
 
 err_hal_srng_deinit:
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8fa0e90b4531..473855ded8a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -751,6 +751,9 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
+	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+		return 0;
+
 	arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
 				  ahsta->link[link_id]);
 	if (!arsta)
diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 071cb5d30931..6d3f4bca46a3 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -376,6 +376,9 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *ab, struct hal_srng *srng,
 
 	lockdep_assert_held(&srng->lock);
 
+	if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)))
+		return 0;
+
 	hp = srng->u.src_ring.hp;
 
 	if (sync_hw_ptr) {
@@ -419,6 +422,9 @@ void *ath12k_hal_srng_src_get_next_entry(struct ath12k_base *ab,
 
 	lockdep_assert_held(&srng->lock);
 
+	if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)))
+		return NULL;
+
 	/* TODO: Using % is expensive, but we have to do this since size of some
 	 * SRNG rings is not power of 2 (due to descriptor sizes). Need to see
 	 * if separate function is defined for rings having power of 2 ring size
@@ -524,6 +530,10 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
 {
 	lockdep_assert_held(&srng->lock);
 
+	if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
+	    unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)))
+		return;
+
 	if (srng->flags & HAL_SRNG_FLAGS_LMAC_RING) {
 		/* For LMAC rings, ring pointer updates are done through FW and
 		 * hence written to a shared memory location that is read by FW
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 51c4df32e716..c559ced9e524 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4278,6 +4278,9 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 
 	lockdep_assert_wiphy(hw->wiphy);
 
+	if (old_links && test_bit(ATH12K_FLAG_RECOVERY, &ah->radio[0].ab->dev_flags))
+		return -EINVAL;
+
 	ath12k_generic_dbg(ATH12K_DBG_MAC,
 			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
 			   vif->addr, old_links, new_links);
@@ -5956,6 +5959,9 @@ static int ath12k_clear_peer_keys(struct ath12k_link_vif *arvif,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
+	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+		return 0;
+
 	spin_lock_bh(&dp->dp_lock);
 	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id, addr);
 	if (!peer || !peer->dp_peer) {
@@ -6031,6 +6037,8 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 		spin_unlock_bh(&dp->dp_lock);
 
 		if (cmd == SET_KEY) {
+			if (test_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags))
+				return 0;
 			ath12k_warn(ab, "cannot install key for non-existent peer %pM\n",
 				    peer_addr);
 			return -EOPNOTSUPP;
@@ -7045,7 +7053,8 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
 
 	wiphy_work_cancel(ar->ah->hw->wiphy, &arsta->update_wk);
 
-	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA) {
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
+	    !test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags)) {
 		ath12k_bss_disassoc(ar, arvif);
 		ret = ath12k_mac_vdev_stop(arvif);
 		if (ret)
@@ -7795,7 +7804,8 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	 * about to move to the associated state.
 	 */
 	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION &&
-	    old_state == IEEE80211_STA_AUTH && new_state == IEEE80211_STA_ASSOC) {
+	    old_state == IEEE80211_STA_AUTH && new_state == IEEE80211_STA_ASSOC &&
+	    !test_bit(ATH12K_FLAG_RECOVERY, &ah->radio[0].ab->dev_flags)) {
 		/* TODO: for now only do link selection for single device
 		 * MLO case. Other cases would be handled in the future.
 		 */
@@ -12596,6 +12606,9 @@ static int ath12k_mac_flush(struct ath12k *ar)
 	long time_left;
 	int ret = 0;
 
+	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
+		return -ESHUTDOWN;
+
 	time_left = wait_event_timeout(ar->dp.tx_empty_waitq,
 				       (atomic_read(&ar->dp.num_tx_pending) == 0),
 				       ATH12K_FLUSH_TIMEOUT);
@@ -13494,6 +13507,8 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 	for_each_ar(ah, ar, i) {
 		ab = ar->ab;
 
+		clear_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
+
 		ath12k_warn(ar->ab, "pdev %d successfully recovered\n",
 			    ar->pdev->pdev_id);
 
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 2681a047d4d5..e96eb78bbc0c 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -297,6 +297,12 @@ int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_st
 	if (!sta->mlo)
 		return -EINVAL;
 
+	/* During firmware crash, peers are already gone. Skip WMI peer delete
+	 * to avoid timeouts that delay recovery and can trigger cascading resets.
+	 */
+	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ah->radio[0].ab->dev_flags))
+		return 0;
+
 	/* FW expects delete of all link peers at once before waiting for reception
 	 * of peer unmap or delete responses
 	 */
-- 
2.54.0


