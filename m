Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A0CD98C7
	for <ath12k@archiver.kernel.org>; Mon, 15 Jun 2026 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6WQlP4LsP1BC2/D9rOcFasJgBtWxq+pQN34qv7/LvI=; b=GrN7xmWHTZ3lyvqcFDdk61xAmm
	sHltvpXmpthHqv9/WWfvKsI4bp33SzncPz5wM6hkw+/xsClqvRNoBFs1PSBiaoPmPTG35fn1NSd1y
	58iSQJND8KfK5xXxVUDlH9Ogp2GCQIBbc3WWEFXUx2yKsocJPm9efIVD5Lka2MyOxcK0pXMTcW3nA
	rJpqIQPYEzyiB1z/R2J/J3WbgSYTz+9UBGCwywC9i9MYaIeyn4FSjz2zbsOVZbohOa+Vj9w+oS2qP
	IYm6gxgAdDmd+0ez0KtD6Mtkw2Lvr5cLIgDKFl61Tuw2mfMxa7Zem6mQIh7chTXNCch8ZwlLjQ2EJ
	MoBlA36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5Nb-0000000E5mE-0M57;
	Mon, 15 Jun 2026 11:21:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5NW-0000000E5lD-3EaZ
	for ath12k@lists.infradead.org;
	Mon, 15 Jun 2026 11:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781522477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B6WQlP4LsP1BC2/D9rOcFasJgBtWxq+pQN34qv7/LvI=;
	b=OTs6lRZn+1mUQCODsRKeCVRuSGhJd0fHsnxK3Mh5nB6Qhv6BskL8P7ChyISOrlmaDwM182
	EtGfYL8TqzafDTkxoAeIKz+zu/x8lZZKJkSYuDpvzIQyNFfX9Zay8LZZFz1jK3j66fAz+o
	d4/qTU0+ULPbMKTcaYACF0EMQbuoK1Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-jMW5aiWeMYq1zjUJVUtulQ-1; Mon,
 15 Jun 2026 07:21:11 -0400
X-MC-Unique: jMW5aiWeMYq1zjUJVUtulQ-1
X-Mimecast-MFC-AGG-ID: jMW5aiWeMYq1zjUJVUtulQ_1781522470
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F239E19540D3;
	Mon, 15 Jun 2026 11:21:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.61])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD5291774;
	Mon, 15 Jun 2026 11:21:06 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ath12k: fix NULL pointer dereference in rhash table destroy
Date: Mon, 15 Jun 2026 13:21:03 +0200
Message-ID: <20260615112103.601982-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: f7G0UQlJtc1zixCzd4AD4mk6rmkVcLWUBN1Bit6s9Kc_1781522470
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_042119_140892_CEA717EC 
X-CRM114-Status: GOOD (  13.65  )
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

When unbinding the ath12k driver, kernel NULL pointer dereferences
occur in irq_work_sync() called from rhashtable_destroy().

Two hash tables are affected:
1. ath12k_link_sta hash table in ath12k_base
2. ath12k_dp_link_peer hash table in ath12k_dp

The issue happens because the destroy functions are called unconditionally
in cleanup paths, but the hash tables are only initialized late in their
respective init functions. If the device was never fully started or if the
init functions failed before initializing the hash tables, the pointers
will be NULL. The issues are always reproducible from a VM because the MSI
addressing initialization is failing.

Call trace for ath12k_link_sta_rhash_tbl_destroy:
 RIP: irq_work_sync+0x1e/0x70
 rhashtable_destroy+0x12/0x60
 ath12k_link_sta_rhash_tbl_destroy+0x19/0x40 [ath12k]
 ath12k_core_stop+0xe/0x80 [ath12k]
 ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
 ath12k_pci_remove+0x60/0x110 [ath12k]

Call trace for ath12k_dp_link_peer_rhash_tbl_destroy:
 RIP: irq_work_sync+0x1e/0x70
 rhashtable_destroy+0x12/0x60
 ath12k_dp_link_peer_rhash_tbl_destroy+0x29/0x50 [ath12k]
 ath12k_dp_cmn_device_deinit+0x21/0x140 [ath12k]
 ath12k_core_hw_group_cleanup+0x6b/0xb0 [ath12k]
 ath12k_pci_remove+0x60/0x110 [ath12k]

Fix this by adding NULL checks before calling rhashtable_destroy() in
both destroy functions.

The NULL check approach was chosen because the rhashtable pointer
serves as the initialization state indicator. The init can fail at
various points, leaving some components uninitialized. Checking the
pointer directly is simpler than adding separate state flags that
would need synchronization.

Fixes: 57ccca410237 ("wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base")
Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
Cc: stable@vger.kernel.org
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v2: - Use guard(mutex) instead of manual mutex_lock/unlock with goto in
    ath12k_dp_link_peer_rhash_tbl_destroy (suggested by Jeff Johnson)
    - Add rationale paragraph in commit message explaining why NULL check
    approach was chosen over state flags
v1: https://lore.kernel.org/all/20260604071032.659009-1-jtornosm@redhat.com/ 

 drivers/net/wireless/ath/ath12k/dp_peer.c | 7 +++++--
 drivers/net/wireless/ath/ath12k/peer.c    | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index a1100782d45e..ab3e3e107782 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -274,11 +274,14 @@ int ath12k_dp_link_peer_rhash_tbl_init(struct ath12k_dp *dp)
 
 void ath12k_dp_link_peer_rhash_tbl_destroy(struct ath12k_dp *dp)
 {
-	mutex_lock(&dp->link_peer_rhash_tbl_lock);
+	guard(mutex)(&dp->link_peer_rhash_tbl_lock);
+
+	if (!dp->rhead_peer_addr)
+		return;
+
 	rhashtable_destroy(dp->rhead_peer_addr);
 	kfree(dp->rhead_peer_addr);
 	dp->rhead_peer_addr = NULL;
-	mutex_unlock(&dp->link_peer_rhash_tbl_lock);
 }
 
 static int ath12k_dp_link_peer_rhash_insert(struct ath12k_dp *dp,
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 2e875176baaa..80fee2ce68f1 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -444,6 +444,9 @@ int ath12k_link_sta_rhash_tbl_init(struct ath12k_base *ab)
 
 void ath12k_link_sta_rhash_tbl_destroy(struct ath12k_base *ab)
 {
+	if (!ab->rhead_sta_addr)
+		return;
+
 	rhashtable_destroy(ab->rhead_sta_addr);
 	kfree(ab->rhead_sta_addr);
 	ab->rhead_sta_addr = NULL;
-- 
2.54.0


