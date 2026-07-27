Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C0BC53209
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HdI4S3vG0B6JG9MD/SqL89Bsd0lNZG9q2eE5bXjCdw=; b=k64ydMB/mXPA431tJCJwyQal9k
	o88z8MBYcyWjRj5VO0At8CRE/GwWZtsaHJKJOvFajk3csGhSbaP8C3iV8yobJURjIQEAR2P7YkZco
	hzWbBJUo2bX4VJ908zkPncy5oTrAru2k9WKNsI1Vn+eNEXYTv/pKIOEMwB4HT5gG4ln5qwAbI/gAX
	JRLovRptbH2c8AlLjF2QUvG7cqgveJq4nP5qj5wQ+2wE2Wx88Xmb6A2otzx9ccSpRrlGIFHoFa/wh
	6XvZVonz43m0du6xq7Pwd/LcSW/EaW+tyd1HuvMguGwz3ZcIDu9eeAYRTRSDNSwDLvVxJ+5LIp6dr
	DFX3kWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBx-00000003KYO-0Gnz;
	Mon, 27 Jul 2026 16:28:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBp-00000003KPU-3oCc
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 16:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HdI4S3vG0B6JG9MD/SqL89Bsd0lNZG9q2eE5bXjCdw=;
	b=WTepah56BjYXs6zINcfWonz2aEIrvV1r2jWbM8b37ujjY84r6ptrEXbyAhMgSIhvHIk4Yy
	yUdrhLJ4PPPqfVeHBJh4JKbmsWMdub5yQCrk8x+xy0dR9bhjcq24f8GRumLQicAT5YvtDU
	CaaVENEfjizvbDjv6eWHTKXv/eWJgdk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-539-a8bPq0JSPrKhGKUGcUBcwg-1; Mon,
 27 Jul 2026 12:28:23 -0400
X-MC-Unique: a8bPq0JSPrKhGKUGcUBcwg-1
X-Mimecast-MFC-AGG-ID: a8bPq0JSPrKhGKUGcUBcwg_1785169693
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FB971956074;
	Mon, 27 Jul 2026 16:28:13 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.58])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B9B742B;
	Mon, 27 Jul 2026 16:28:10 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 3/5] wifi: ath12k: fix MLO dp_peer ID desync with firmware
Date: Mon, 27 Jul 2026 18:27:46 +0200
Message-ID: <20260727162748.963275-4-jtornosm@redhat.com>
In-Reply-To: <20260727162748.963275-1-jtornosm@redhat.com>
References: <20260727162748.963275-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: RrJeGR0x9K5iUP_PMV1MXnzUurKW2xWYWKrBkgEJpQE_1785169693
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092830_356999_3D7995F2 
X-CRM114-Status: GOOD (  17.94  )
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

TX completions fail with:
  "dp_tx: failed to find the peer with peer_id <N>"

where <N> is an ML peer_id (host-assigned ml_peer_id OR'd with
ATH12K_PEER_ML_ID_VALID, BIT(13) = 0x2000). This happens because
the firmware uses an internal monotonic counter for ML peer IDs that
does not necessarily match the host-assigned ml_peer_id. The desync
has been observed in normal MLO operation and is particularly
reproducible after firmware crash recovery, where the
create-delete-create cycle guarantees the firmware increments its
internal counter.

Currently, ath12k_dp_peer_create() stores the host-assigned
ml_peer_id (with ATH12K_PEER_ML_ID_VALID OR'd in) as dp_peer->peer_id
and immediately populates the dp_peers[] RCU lookup table at that
index. When the firmware later uses a different peer_id in its data
path descriptors, ath12k_dp_peer_find_by_peerid() looks up the wrong
index and returns NULL, causing the "failed to find peer" error on
every TX completion.

Fix this by initializing dp_peer->peer_id to ATH12K_DP_PEER_ID_INVALID
for MLO peers at creation time, deferring the dp_peers[] RCU table
population. When ath12k_dp_peer_find_by_peerid() encounters a lookup
miss for an ML peer_id (one with ATH12K_PEER_ML_ID_VALID set), it
walks dp_peers_list for an MLO peer whose peer_id is still INVALID,
syncs peer_id from the firmware's actual value, and populates the
dp_peers[] table. This lazy sync approach ensures the host always uses
the firmware's real ML peer_id regardless of any internal firmware
counter behavior.

Guard the dp_peers[] RCU table clear in ath12k_dp_peer_delete() and
ath12k_mac_dp_peer_cleanup() against ATH12K_DP_PEER_ID_INVALID to
avoid clearing uninitialized slots. Replace per-peer clear_bit() with
bitmap_zero() in ath12k_mac_dp_peer_cleanup() to avoid out-of-bounds
access when peer_id has not been synced yet.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c | 45 ++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/mac.c     |  7 +++-
 2 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 2660b4c7449b..0a7ef81425f5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -413,8 +413,10 @@ u16 ath12k_dp_peer_get_peerid_index(struct ath12k_dp *dp, u16 peer_id)
 struct ath12k_dp_peer *ath12k_dp_peer_find_by_peerid(struct ath12k_pdev_dp *dp_pdev,
 						     u16 peer_id)
 {
-	u16 index;
+	struct ath12k_dp_hw *dp_hw = dp_pdev->dp_hw;
+	struct ath12k_dp_peer *dp_peer, *tmp;
 	struct ath12k_dp *dp = dp_pdev->dp;
+	u16 index;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "ath12k dp peer find by peerid index called without rcu lock");
@@ -423,8 +425,23 @@ struct ath12k_dp_peer *ath12k_dp_peer_find_by_peerid(struct ath12k_pdev_dp *dp_p
 		return NULL;
 
 	index = ath12k_dp_peer_get_peerid_index(dp, peer_id);
+	dp_peer = rcu_dereference(dp_hw->dp_peers[index]);
+
+	if (!dp_peer && (peer_id & ATH12K_PEER_ML_ID_VALID)) {
+		spin_lock_bh(&dp_hw->peer_lock);
+		list_for_each_entry(tmp, &dp_hw->dp_peers_list, list) {
+			if (tmp->is_mlo &&
+			    tmp->peer_id == ATH12K_DP_PEER_ID_INVALID) {
+				tmp->peer_id = peer_id;
+				rcu_assign_pointer(dp_hw->dp_peers[index], tmp);
+				dp_peer = tmp;
+				break;
+			}
+		}
+		spin_unlock_bh(&dp_hw->peer_lock);
+	}
 
-	return rcu_dereference(dp_pdev->dp_hw->dp_peers[index]);
+	return dp_peer;
 }
 EXPORT_SYMBOL(ath12k_dp_peer_find_by_peerid);
 
@@ -472,11 +489,11 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	dp_peer->is_mlo = params->is_mlo;
 
 	/*
-	 * For MLO client, the host assigns the ML peer ID, so set peer_id in dp_peer
-	 * For non-MLO client, host gets link peer ID from firmware and will be
-	 * assigned at the time of link peer creation
+	 * peer_id starts as INVALID for both MLO and non-MLO clients.
+	 * For MLO: synced from firmware's first data path descriptor.
+	 * For non-MLO: assigned at the time of link peer creation.
 	 */
-	dp_peer->peer_id = params->is_mlo ? params->peer_id : ATH12K_DP_PEER_ID_INVALID;
+	dp_peer->peer_id = ATH12K_DP_PEER_ID_INVALID;
 	dp_peer->ucast_ra_only = params->ucast_ra_only;
 
 	dp_peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
@@ -488,15 +505,12 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
 
 	/*
-	 * For MLO client, the peer_id for ath12k_dp_peer is allocated by host
-	 * and that peer_id is known at this point, and hence this ath12k_dp_peer
-	 * can be added to the RCU table using the peer_id.
+	 * For MLO client, the dp_peers[] RCU table entry will be populated
+	 * when the firmware's actual peer_id is learned from the first data
+	 * path descriptor (in ath12k_dp_peer_find_by_peerid).
 	 * For non-MLO client, this addition to RCU table shall be done at the
 	 * time of assignment of ath12k_dp_link_peer to ath12k_dp_peer.
 	 */
-	if (dp_peer->is_mlo)
-		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], dp_peer);
-
 	spin_unlock_bh(&dp_hw->peer_lock);
 
 	return 0;
@@ -515,8 +529,11 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 		return;
 	}
 
-	if (dp_peer->is_mlo)
-		rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
+	if (dp_peer->is_mlo) {
+		if (dp_peer->peer_id != ATH12K_DP_PEER_ID_INVALID)
+			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
+					   NULL);
+	}
 
 	list_del(&dp_peer->list);
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3fa62deb8186..aa03491fb59a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1287,13 +1287,16 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 	spin_lock_bh(&dp_hw->peer_lock);
 	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
 		if (dp_peer->is_mlo) {
-			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
-			clear_bit(dp_peer->peer_id, ah->free_ml_peer_id_map);
+			if (dp_peer->peer_id != ATH12K_DP_PEER_ID_INVALID)
+				rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id],
+						   NULL);
 		}
 
 		list_move(&dp_peer->list, &peers);
 	}
 
+	bitmap_zero(ah->free_ml_peer_id_map, ATH12K_MAX_MLO_PEERS);
+
 	spin_unlock_bh(&dp_hw->peer_lock);
 
 	synchronize_rcu();
-- 
2.54.0


