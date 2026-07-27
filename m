Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7839C531D0
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dm2I1f33aSU9zO/8ASD7g8pL3cExo8ykoU6p088mh1U=; b=0LxNk9bKewuRYatwbrcJoaDEQd
	BAEgfo7t5Www+gCT1uKQsrszqAF5kKyOKS+wb06CZ+m/Y4Nsm+A9DVDqH1qz7C1jym56WDiKpFGiZ
	djZ/jTVt4SDkgO720b1h9t/wIwI+u5OfTJ/3kLsYqF/05a4EtOhyH+KPNmJ2+8YGI7KEcpQRKi/eI
	ciN8eB3mnC8S2fDjaWUXNY8tH8FqW009qDeUMyFBdsdVwqR/2A6kfWLSlx4X1hbGE8fyilzkWQ9GS
	1UPkiWHBYFpasSwlVf0akGxdQ8WVml65c289CIAu0VxUbXAhbjX0rlNDzeAjKssIjM3ABXzoygOcu
	PC4rRO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBk-00000003KIx-2KuP;
	Mon, 27 Jul 2026 16:28:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBh-00000003KFr-2292
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 16:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dm2I1f33aSU9zO/8ASD7g8pL3cExo8ykoU6p088mh1U=;
	b=gnzuG37lM3DNDrOOKz7iRFEYBznfQWngtdQkfpGGKrlOtzcLA7Sg1n/xcM7VOWkRli0BKt
	WfDuIUKtZZTT/QBUjldXz5t7ULXKX4ozp0nolxNNwbqOfaFzfGvjUmUudwB612DzFL4oUw
	Y0FSR4LIeQBfD3aA1LF926VAae7Ucws=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-fs3Gz_tkMkqDmJ0QS3tAug-1; Mon,
 27 Jul 2026 12:28:19 -0400
X-MC-Unique: fs3Gz_tkMkqDmJ0QS3tAug-1
X-Mimecast-MFC-AGG-ID: fs3Gz_tkMkqDmJ0QS3tAug_1785169698
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 12A231956076;
	Mon, 27 Jul 2026 16:28:18 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.58])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9BC1A429;
	Mon, 27 Jul 2026 16:28:15 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 4/5] wifi: ath12k: fix MLO beacon handling using per-link addressing
Date: Mon, 27 Jul 2026 18:27:47 +0200
Message-ID: <20260727162748.963275-5-jtornosm@redhat.com>
In-Reply-To: <20260727162748.963275-1-jtornosm@redhat.com>
References: <20260727162748.963275-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: QorKdAoZy_4skj3A4ROcpdcSdsc7ILfmL8r_iqrcnjg_1785169698
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092821_603867_EF0EDE37 
X-CRM114-Status: GOOD (  15.94  )
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

ath12k_mac_handle_beacon_iter() uses ahvif->deflink for both BSSID
matching and connection_loss_work cancellation. In MLO, deflink is
only the first link created for the MLD VIF and does not represent
the other links. This causes two problems:

1. Beacon BSSID matching only checks deflink's BSS config
   (vif->bss_conf.bssid), so beacons received on non-deflink links
   never match and never cancel connection_loss_work.

2. Only deflink's connection_loss_work is cancelled, leaving
   non-deflink connection_loss_work timers running even when beacons
   are being received normally.

When the firmware reports a beacon miss event on any link,
ath12k_mac_handle_beacon_miss() queues connection_loss_work on that
link with a 3-second timeout. If a beacon is received before the
timeout, ath12k_mac_handle_beacon_iter() should cancel it. But the
deflink-only handling means that for non-deflink MLO links, beacons
are never matched and connection_loss_work is never cancelled through
this path.

Fix by handling non-MLO and MLO cases separately. For non-MLO, keep
the existing deflink behavior. For MLO, iterate all active links to
match the beacon BSSID against each link's BSS config. When a match
is found, cancel connection_loss_work on all links because the
work callback calls per-VIF ieee80211_connection_loss() regardless
of which link queued it.

Tested on WCN7850 with MLO (Wi-Fi 7).

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 36 ++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e36a37852fab..ebc35636b4ef 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1946,15 +1946,43 @@ static void ath12k_mac_handle_beacon_iter(void *data, u8 *mac,
 	struct sk_buff *skb = data;
 	struct ieee80211_mgmt *mgmt = (void *)skb->data;
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	struct ath12k_link_vif *arvif = &ahvif->deflink;
+	struct ieee80211_bss_conf *link_conf;
+	struct ath12k_link_vif *arvif;
+	unsigned long links;
+	u8 link_id;
 
-	if (vif->type != NL80211_IFTYPE_STATION || !arvif->is_created)
+	if (vif->type != NL80211_IFTYPE_STATION)
 		return;
 
-	if (!ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
+	if (!ieee80211_vif_is_mld(vif)) {
+		arvif = &ahvif->deflink;
+		if (arvif->is_created &&
+		    ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
+			cancel_delayed_work(&arvif->connection_loss_work);
 		return;
+	}
 
-	cancel_delayed_work(&arvif->connection_loss_work);
+	/* For MLO, each link has a different AP BSSID. Check the beacon
+	 * against all link BSS configs. If any matches, cancel
+	 * connection_loss_work on all links since it calls per-VIF
+	 * ieee80211_connection_loss() regardless of which link queued it.
+	 */
+	links = ahvif->links_map;
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		link_conf = rcu_dereference(vif->link_conf[link_id]);
+		if (link_conf &&
+		    ether_addr_equal(mgmt->bssid, link_conf->bssid))
+			goto found;
+	}
+
+	return;
+
+found:
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = rcu_dereference(ahvif->link[link_id]);
+		if (arvif && arvif->is_created)
+			cancel_delayed_work(&arvif->connection_loss_work);
+	}
 }
 
 void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb)
-- 
2.54.0


