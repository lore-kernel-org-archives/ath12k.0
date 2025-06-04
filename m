Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49099C5AD49
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 01:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S++TOSjfk84ML4hiSiZM5bvCoc4Y+z0HKa8I4FBsDaQ=; b=s9IkR8Pk/9UcsHKye7nxFwNZxM
	sjutZcdO1RAgoHMFHDNR3BT+4u9YXiKYOS8FvfOQne0XC9hF8BalWM+QnvnB7jeG8l8lBuXYY9ZWi
	vsDR6upjEgLJVDeXRWzktJzXBOr1twt0Y7HTDYp1xekjHIQ7c+SIquG16BYh99m2xvsvAvfdFLH+7
	9UvaADheMNrzRZkk+LEJQieI2YhO3Hl6xkZ/bTvfhCvdB4yHLF7eMpRbj3jxPOQT/5bC1jQlxFRiF
	QCSbBZ8eQvT1byVYqytC/RAIO7u1xTmoevtUbhEsOMKEM6Qa2w11cy+J97nSDy/TSnwqg+ka0Ui9d
	W5EikydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcth-0000000CBxz-06oY;
	Wed, 04 Jun 2025 01:26:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcOg-0000000C6rA-42D8
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 00:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 826685C47F2;
	Wed,  4 Jun 2025 00:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A961C4CEEF;
	Wed,  4 Jun 2025 00:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998466;
	bh=BCcC57+dqDciWDbsBV/NOWhRK6dchWeScDoaZk+X3aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GjQ+yP41pfnhJU1ybgNEOSj3ukfwzr37qfXqbcd45UJxHPH+hUuhFwEpfX39rBU7v
	 XoASk4OkdgHRTY4m8G5UStAy+ex6y/xbNrr7La23Hm3vMBGwHCdZ14hEdxZlDxrk2d
	 gSnZoDNkWT4R0JLQaLEUCXSQNMXfjoa93cVxbw5PUlUNnVJFywLmRnzJ/saNolt3s+
	 qjoePXYnxPgJesP6YLTktHIBUoW+RvkDmWm2gSwKvmHc1EMeA/Z/K5JFT83p+EmOnn
	 UbJrNfaV0nz+AmCWFHwXSJ1YHrTzXweEko+4fOYFqKq6SoTW5uhcxuA+yyYFhCk0UD
	 L9eJDIiZGT9tg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sarika Sharma <quic_sarishar@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 090/118] wifi: ath12k: correctly handle mcast packets for clients
Date: Tue,  3 Jun 2025 20:50:21 -0400
Message-Id: <20250604005049.4147522-90-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175427_094977_294B52CD 
X-CRM114-Status: GOOD (  18.63  )
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

From: Sarika Sharma <quic_sarishar@quicinc.com>

[ Upstream commit 4541b0c8c3c1b85564971d497224e57cf8076a02 ]

Currently, RX is_mcbc bit is set for packets sent from client as
destination address (DA) is multicast/broadcast address, but packets
are actually unicast as receiver address (RA) is not multicast address.
Hence, packets are not handled properly due to this is_mcbc bit.

Therefore, reset the is_mcbc bit if interface type is AP.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20250411061523.859387-3-quic_sarishar@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Bug Analysis **Root Cause**: The commit fixes
a critical packet handling issue where multicast/broadcast packets from
clients to an AP are incorrectly marked as multicast (is_mcbc=true)
based on the destination address (DA) being multicast, even though they
are actually unicast packets since the receiver address (RA) is not
multicast. **Impact**: This causes legitimate unicast packets to be
mishandled, potentially leading to: - Incorrect encryption handling
(using group keys instead of unicast keys) - Packet drops or processing
errors - Connectivity issues for clients connected to AP ## Code Changes
Analysis The fix involves three key changes: 1. **New peer field
(`peer.h:65`)**: Adds `bool ucast_ra_only` field to track when a peer
should only receive unicast packets 2. **Peer initialization
(`peer.c:386-387`)**: Sets `peer->ucast_ra_only = true` for AP interface
types, indicating that packets to/from AP clients should be treated as
unicast 3. **Runtime correction (`dp_rx.c:2328-2331`)**: Adds logic to
reset the is_mcbc bit when a peer has `ucast_ra_only=true`: ```c /bin
/bin.usr-is-merged /boot /dev /etc /home /init /lib /lib.usr-is-merged
/lib64 /lost+found /media /mnt /opt /proc /root /run /sbin /sbin.usr-is-
merged /snap /srv /sys /tmp /usr /var resetting mcbc bit because mcbc
packets are unicast capability_test capability_test.c
f2fs_folio_analysis.md ipv4_multipath_analysis.md
ipv6_route_allocation_rcu_analysis.md ixgbe_e610_set_phys_id_analysis.md
linux lpfc_timeout_analysis.md mac80211_mlo_mbssid_analysis.md
pfcp_driver_historical_analysis.md rtl_bb_delay_analysis.md
rtw89_mlo_analysis.md tcp_multipath_load_balance_analysis.md
test_unaligned_diff test_unaligned_diff.c type_size_check
type_size_check.c veth_driver_analysis.md
wifi_mlo_mbssid_tx_link_id_analysis.md packets only for AP as STA sends
unicast packets. linux/ rxcb->is_mcbc = rxcb->is_mcbc &&
!peer->ucast_ra_only; ``` ## Backport Suitability Assessment **✅ Fixes
Important Bug**: This addresses a real packet handling issue that
affects AP functionality and client connectivity. **✅ Small and
Contained**: The fix is minimal - adds one field and a simple boolean
logic correction. Total change is ~10 lines. **✅ Low Regression Risk**:
- Only affects AP mode (`NL80211_IFTYPE_AP`) - Uses conservative
approach (resets mcbc bit only when appropriate) - No architectural
changes **✅ Clear Side Effects**: The change is isolated to
multicast/broadcast packet classification logic and doesn't touch other
subsystems. **✅ Subsystem Confined**: Changes are entirely within the
ath12k Wi-Fi driver's receive path. ## Comparison with Similar Commits
This commit closely matches **Similar Commit #1** and **Similar Commit
#3** (both marked YES for backporting): - Fixes multicast/broadcast
packet handling issues in ath12k - Small, targeted fixes with clear bug
descriptions - Hardware-specific corrections for packet classification -
Similar code patterns and impact scope The commit follows the same
pattern as other successful ath12k multicast fixes that were deemed
suitable for stable backporting. ## Conclusion This is a classic stable
tree candidate: it fixes a real user-impacting bug with a minimal, low-
risk change that's confined to a single driver subsystem. The fix
addresses incorrect packet classification that could cause connectivity
issues in AP mode.

 drivers/net/wireless/ath/ath12k/dp_rx.c | 5 +++++
 drivers/net/wireless/ath/ath12k/peer.c  | 5 ++++-
 drivers/net/wireless/ath/ath12k/peer.h  | 3 ++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 75bf4211ad422..fd5e9ab9dbe81 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2277,6 +2277,11 @@ static void ath12k_dp_rx_h_mpdu(struct ath12k *ar,
 	spin_lock_bh(&ar->ab->base_lock);
 	peer = ath12k_dp_rx_h_find_peer(ar->ab, msdu);
 	if (peer) {
+		/* resetting mcbc bit because mcbc packets are unicast
+		 * packets only for AP as STA sends unicast packets.
+		 */
+		rxcb->is_mcbc = rxcb->is_mcbc && !peer->ucast_ra_only;
+
 		if (rxcb->is_mcbc)
 			enctype = peer->sec_type_grp;
 		else
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 792cca8a3fb1b..ec7236bbccc0f 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
@@ -383,6 +383,9 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		arvif->ast_idx = peer->hw_peer_id;
 	}
 
+	if (vif->type == NL80211_IFTYPE_AP)
+		peer->ucast_ra_only = true;
+
 	if (sta) {
 		ahsta = ath12k_sta_to_ahsta(sta);
 		arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index 5870ee11a8c7e..f3a5e054d2b55 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_PEER_H
@@ -62,6 +62,7 @@ struct ath12k_peer {
 
 	/* for reference to ath12k_link_sta */
 	u8 link_id;
+	bool ucast_ra_only;
 };
 
 struct ath12k_ml_peer {
-- 
2.39.5


