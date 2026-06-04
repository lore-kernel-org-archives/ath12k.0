Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9388CD6E68
	for <ath12k@archiver.kernel.org>; Thu,  4 Jun 2026 07:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTx7iJcEYQPNF0fLP9iIlrZJ+hGEW1AJgAn2YYrO6Tk=; b=sY5f6xHEYBINJtqpPl1E+aG7vs
	gRjzuEl+EX90W5DjZu1OTEsJRcOMqEQ9KO+IWLZnoHYqgSDX9gDiNxb5c6Rsq/Sda3HBm6dvXrY1e
	A7tTTsPokUjYfUQT86l814tQ2vP3kJ6f466Brsv6EowgDZX3RjQ7shuyW9bK08mmjYt1nkma6iTjH
	AS2F7cvZYs4dPTMk/1NFBDmn6v1M28v4sP1hoK/DJv25yx24WOzqqPZ25nwKgpj9wI01uJaZbQY24
	j/+HyZYhy7yE6EGHGSJvuk3y2tixjQ9gr0Z4HNJA6QAId0/NDi1hOdArIPNdcQiKFy69R0vyYyIgm
	Zmmu9C/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2E5-0000000GHwh-28cp;
	Thu, 04 Jun 2026 07:10:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2E3-0000000GHw5-2omC
	for ath12k@lists.infradead.org;
	Thu, 04 Jun 2026 07:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780557045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TTx7iJcEYQPNF0fLP9iIlrZJ+hGEW1AJgAn2YYrO6Tk=;
	b=Jh4JYwyZW1GSuXxGyrYWhQxNGtqkM0dTTggncw/wLIQTyoK84EVTX5FPsbSXYFg7qKUfMW
	ka7qPsJOEd1X2DaIJXAVVwJ/3N1N4PhhtX2wlLyFQPDXlzT1Cl+9Mu6r/2+LZ4R/AvLs1A
	VO0DMa1WrQIxIc8uKbhR/o7yG5r30pQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-2myNmU-MPgSRWm_ZsUO4mg-1; Thu,
 04 Jun 2026 03:10:41 -0400
X-MC-Unique: 2myNmU-MPgSRWm_ZsUO4mg-1
X-Mimecast-MFC-AGG-ID: 2myNmU-MPgSRWm_ZsUO4mg_1780557040
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D88FB19560AD;
	Thu,  4 Jun 2026 07:10:39 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.54])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 291A830001A1;
	Thu,  4 Jun 2026 07:10:36 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] ath12k: fix NULL pointer dereference in rhash table destroy
Date: Thu,  4 Jun 2026 09:10:32 +0200
Message-ID: <20260604071032.659009-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: oDfpnnchy3d8gnk7kCusFtH58NWQ-7N4vxZDW5uXta4_1780557040
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_001047_796658_AD505244 
X-CRM114-Status: GOOD (  11.31  )
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

Fixes: 57ccca410237 ("wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base")
Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
Cc: stable@vger.kernel.org
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c | 5 +++++
 drivers/net/wireless/ath/ath12k/peer.c    | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index a1100782d45e..38045564e223 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -275,9 +275,14 @@ int ath12k_dp_link_peer_rhash_tbl_init(struct ath12k_dp *dp)
 void ath12k_dp_link_peer_rhash_tbl_destroy(struct ath12k_dp *dp)
 {
 	mutex_lock(&dp->link_peer_rhash_tbl_lock);
+	if (!dp->rhead_peer_addr)
+		goto unlock;
+
 	rhashtable_destroy(dp->rhead_peer_addr);
 	kfree(dp->rhead_peer_addr);
 	dp->rhead_peer_addr = NULL;
+
+unlock:
 	mutex_unlock(&dp->link_peer_rhash_tbl_lock);
 }
 
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


