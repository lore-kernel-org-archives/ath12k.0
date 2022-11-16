Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01841C4167B
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvj5EioXaZilhQHTUkcpljhYRtkYKdcBNf1AIJae8CM=; b=pHf2uBuGT3fJrv
	6BOvZ5BixRdCEacBl6ojsutmoahNXQ25VIMKH6/oEBCMyl9Yoqr390FBGg+XeDEgWRv85HiTS0UCQ
	KBcFZBMDNOV/YyYJFhqVchSZbLCdDCY3niiAAGPaQ6jTo7Y/dzGqKW5LShaaJEyBhpgiO0B1tPI0I
	g73cARo8wqtzTDgDcEQG7RWn4FzADBGtBQfdC2yCe+IR3wa7NpTa1U6xG/o7GoarIVSvXUoHv6LWs
	F37KTdpfZiKHjiCN1xbVk5RWP0NA7W85O0k5NgMDSlAkvz6WFVSCvuV1GER0NCP0RqOmPtlE6HpyU
	jUzRdczhSi8r+PO+DYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLS1-005yNv-EO
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:39:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLRz-005yEE-4F
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:39:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E8F1F61BC5
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3170DC433C1;
	Wed, 16 Nov 2022 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616786;
	bh=ot3Kmb/xbCMtpqL6Vh5qHmtaSf2LvydaD+79jYRg33k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeDesceJJEZb4DJ27W+9rCtN5dGMQpNReI1ePL1V2gAyzE2NDeTbNGCkv0osdQaQB
	 HPVQYoXzjtt3101u5bvgiEwPGGpIiRdmruO4gAHnIz4U17eWeXcyTCiDUiWeetxKaa
	 D+xd0XIVr9xX9S+Ggj4QwzZ7Us1PnoyUJeh8ZwPm9/C32YKg4zwsJkibm8cNbERWeg
	 COpfpKokpq8BLym03XjV6s8ZGUflZQR0Ha7Qp47VVZfWZHGG+dLNQvZzsiUHReB52q
	 wWXQJH2ifFQhTY2d6mLahgwcY1hI3auRyeU5WiUFWxINXggcGKHFvfBFTHZXvHjZ3h
	 TrhRbRCpq6rIg==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 37/50] wifi: ath12k: add peer.c
Date: Wed, 16 Nov 2022 18:38:49 +0200
Message-Id: <20221116163902.24996-38-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_083947_279281_D5CA2353 
X-CRM114-Status: GOOD (  17.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/peer.c | 342 +++++++++++++++++++++++++++++++++
 1 file changed, 342 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
new file mode 100644
index 000000000000..19c0626fbff1
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "core.h"
+#include "peer.h"
+#include "debug.h"
+
+struct ath12k_peer *ath12k_peer_find(struct ath12k_base *ab, int vdev_id,
+				     const u8 *addr)
+{
+	struct ath12k_peer *peer;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list) {
+		if (peer->vdev_id != vdev_id)
+			continue;
+		if (!ether_addr_equal(peer->addr, addr))
+			continue;
+
+		return peer;
+	}
+
+	return NULL;
+}
+
+static struct ath12k_peer *ath12k_peer_find_by_pdev_idx(struct ath12k_base *ab,
+							u8 pdev_idx, const u8 *addr)
+{
+	struct ath12k_peer *peer;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list) {
+		if (peer->pdev_idx != pdev_idx)
+			continue;
+		if (!ether_addr_equal(peer->addr, addr))
+			continue;
+
+		return peer;
+	}
+
+	return NULL;
+}
+
+struct ath12k_peer *ath12k_peer_find_by_addr(struct ath12k_base *ab,
+					     const u8 *addr)
+{
+	struct ath12k_peer *peer;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list) {
+		if (!ether_addr_equal(peer->addr, addr))
+			continue;
+
+		return peer;
+	}
+
+	return NULL;
+}
+
+struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
+					   int peer_id)
+{
+	struct ath12k_peer *peer;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list)
+		if (peer_id == peer->peer_id)
+			return peer;
+
+	return NULL;
+}
+
+bool ath12k_peer_exist_by_vdev_id(struct ath12k_base *ab, int vdev_id)
+{
+	struct ath12k_peer *peer;
+
+	spin_lock_bh(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list) {
+		if (vdev_id == peer->vdev_id) {
+			spin_unlock_bh(&ab->base_lock);
+			return true;
+		}
+	}
+	spin_unlock_bh(&ab->base_lock);
+	return false;
+}
+
+struct ath12k_peer *ath12k_peer_find_by_ast(struct ath12k_base *ab,
+					    int ast_hash)
+{
+	struct ath12k_peer *peer;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list)
+		if (ast_hash == peer->ast_hash)
+			return peer;
+
+	return NULL;
+}
+
+void ath12k_peer_unmap_event(struct ath12k_base *ab, u16 peer_id)
+{
+	struct ath12k_peer *peer;
+
+	spin_lock_bh(&ab->base_lock);
+
+	peer = ath12k_peer_find_by_id(ab, peer_id);
+	if (!peer) {
+		ath12k_warn(ab, "peer-unmap-event: unknown peer id %d\n",
+			    peer_id);
+		goto exit;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "htt peer unmap vdev %d peer %pM id %d\n",
+		   peer->vdev_id, peer->addr, peer_id);
+
+	list_del(&peer->list);
+	kfree(peer);
+	wake_up(&ab->peer_mapping_wq);
+
+exit:
+	spin_unlock_bh(&ab->base_lock);
+}
+
+void ath12k_peer_map_event(struct ath12k_base *ab, u8 vdev_id, u16 peer_id,
+			   u8 *mac_addr, u16 ast_hash, u16 hw_peer_id)
+{
+	struct ath12k_peer *peer;
+
+	spin_lock_bh(&ab->base_lock);
+	peer = ath12k_peer_find(ab, vdev_id, mac_addr);
+	if (!peer) {
+		peer = kzalloc(sizeof(*peer), GFP_ATOMIC);
+		if (!peer)
+			goto exit;
+
+		peer->vdev_id = vdev_id;
+		peer->peer_id = peer_id;
+		peer->ast_hash = ast_hash;
+		peer->hw_peer_id = hw_peer_id;
+		ether_addr_copy(peer->addr, mac_addr);
+		list_add(&peer->list, &ab->peers);
+		wake_up(&ab->peer_mapping_wq);
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "htt peer map vdev %d peer %pM id %d\n",
+		   vdev_id, mac_addr, peer_id);
+
+exit:
+	spin_unlock_bh(&ab->base_lock);
+}
+
+static int ath12k_wait_for_peer_common(struct ath12k_base *ab, int vdev_id,
+				       const u8 *addr, bool expect_mapped)
+{
+	int ret;
+
+	ret = wait_event_timeout(ab->peer_mapping_wq, ({
+				bool mapped;
+
+				spin_lock_bh(&ab->base_lock);
+				mapped = !!ath12k_peer_find(ab, vdev_id, addr);
+				spin_unlock_bh(&ab->base_lock);
+
+				(mapped == expect_mapped ||
+				 test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags));
+				}), 3 * HZ);
+
+	if (ret <= 0)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+void ath12k_peer_cleanup(struct ath12k *ar, u32 vdev_id)
+{
+	struct ath12k_peer *peer, *tmp;
+	struct ath12k_base *ab = ar->ab;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	spin_lock_bh(&ab->base_lock);
+	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
+		if (peer->vdev_id != vdev_id)
+			continue;
+
+		ath12k_warn(ab, "removing stale peer %pM from vdev_id %d\n",
+			    peer->addr, vdev_id);
+
+		list_del(&peer->list);
+		kfree(peer);
+		ar->num_peers--;
+	}
+
+	spin_unlock_bh(&ab->base_lock);
+}
+
+static int ath12k_wait_for_peer_deleted(struct ath12k *ar, int vdev_id, const u8 *addr)
+{
+	return ath12k_wait_for_peer_common(ar->ab, vdev_id, addr, false);
+}
+
+int ath12k_wait_for_peer_delete_done(struct ath12k *ar, u32 vdev_id,
+				     const u8 *addr)
+{
+	int ret;
+	unsigned long time_left;
+
+	ret = ath12k_wait_for_peer_deleted(ar, vdev_id, addr);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed wait for peer deleted");
+		return ret;
+	}
+
+	time_left = wait_for_completion_timeout(&ar->peer_delete_done,
+						3 * HZ);
+	if (time_left == 0) {
+		ath12k_warn(ar->ab, "Timeout in receiving peer delete response\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+int ath12k_peer_delete(struct ath12k *ar, u32 vdev_id, u8 *addr)
+{
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	reinit_completion(&ar->peer_delete_done);
+
+	ret = ath12k_wmi_send_peer_delete_cmd(ar, addr, vdev_id);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to delete peer vdev_id %d addr %pM ret %d\n",
+			    vdev_id, addr, ret);
+		return ret;
+	}
+
+	ret = ath12k_wait_for_peer_delete_done(ar, vdev_id, addr);
+	if (ret)
+		return ret;
+
+	ar->num_peers--;
+
+	return 0;
+}
+
+static int ath12k_wait_for_peer_created(struct ath12k *ar, int vdev_id, const u8 *addr)
+{
+	return ath12k_wait_for_peer_common(ar->ab, vdev_id, addr, true);
+}
+
+int ath12k_peer_create(struct ath12k *ar, struct ath12k_vif *arvif,
+		       struct ieee80211_sta *sta,
+		       struct ath12k_wmi_peer_create_arg *arg)
+{
+	struct ath12k_peer *peer;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (ar->num_peers > (ar->max_num_peers - 1)) {
+		ath12k_warn(ar->ab,
+			    "failed to create peer due to insufficient peer entry resource in firmware\n");
+		return -ENOBUFS;
+	}
+
+	spin_lock_bh(&ar->ab->base_lock);
+	peer = ath12k_peer_find_by_pdev_idx(ar->ab, ar->pdev_idx, arg->peer_addr);
+	if (peer) {
+		spin_unlock_bh(&ar->ab->base_lock);
+		return -EINVAL;
+	}
+	spin_unlock_bh(&ar->ab->base_lock);
+
+	ret = ath12k_wmi_send_peer_create_cmd(ar, arg);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to send peer create vdev_id %d ret %d\n",
+			    arg->vdev_id, ret);
+		return ret;
+	}
+
+	ret = ath12k_wait_for_peer_created(ar, arg->vdev_id,
+					   arg->peer_addr);
+	if (ret)
+		return ret;
+
+	spin_lock_bh(&ar->ab->base_lock);
+
+	peer = ath12k_peer_find(ar->ab, arg->vdev_id, arg->peer_addr);
+	if (!peer) {
+		spin_unlock_bh(&ar->ab->base_lock);
+		ath12k_warn(ar->ab, "failed to find peer %pM on vdev %i after creation\n",
+			    arg->peer_addr, arg->vdev_id);
+
+		reinit_completion(&ar->peer_delete_done);
+
+		ret = ath12k_wmi_send_peer_delete_cmd(ar, arg->peer_addr,
+						      arg->vdev_id);
+		if (ret) {
+			ath12k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
+				    arg->vdev_id, arg->peer_addr);
+			return ret;
+		}
+
+		ret = ath12k_wait_for_peer_delete_done(ar, arg->vdev_id,
+						       arg->peer_addr);
+		if (ret)
+			return ret;
+
+		return -ENOENT;
+	}
+
+	peer->pdev_idx = ar->pdev_idx;
+	peer->sta = sta;
+
+	if (arvif->vif->type == NL80211_IFTYPE_STATION) {
+		arvif->ast_hash = peer->ast_hash;
+		arvif->ast_idx = peer->hw_peer_id;
+	}
+
+	peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
+	peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
+
+	ar->num_peers++;
+
+	spin_unlock_bh(&ar->ab->base_lock);
+
+	return 0;
+}


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
