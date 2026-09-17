Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C16C982D2
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x33XW/wjXt6WHIS6oNPy0fJBTUtYpgjF1Fs3XuRG47o=; b=iYpZhwTteAzmzaZz2fTaKzQB6G
	jJ60DgnEXdpvFxuBoH5EIwCP9UXE+y2wdiAUZS6NT5hOXYqNO3YIXX3yoZGqLtmwRoAebXOS/DYep
	MT1gLkasTIlndfWFpZ6t9BfLOKnHV69wHcX6+pN7JeQpm88CEz+qW8xJ8ZktTZZ0O/3zh7OC9uuA5
	l8eHqzflUUsHmAJ3cIut6CgER472Ud2RpAxcPGKOmnrw+vbYtyo+cf765iZhQaWEFnlTfdO+8YeOO
	VZyV3jXnF/cd8DJkY7fhW+ZIRCtoDtMYoeMHnEqyF4WJBJZmqmkn1uZOn7cujQwdw5z5OsI9zDJ2Z
	Kz+oCX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75vO-0000000AhKK-3BDt;
	Thu, 17 Sep 2026 06:48:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75vL-0000000AhHJ-3E9v
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 06:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789627726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x33XW/wjXt6WHIS6oNPy0fJBTUtYpgjF1Fs3XuRG47o=;
	b=PUmLbwzMq6zwUH3H39U+F5eYkT6WsYXOu7JEwIVAzhzdd0bNjUT4TJynfWG3HfDEqmpP3K
	QTV9bkO+sGGymfQll9mvjuK3sPLN5OeIH/WLQtWclqF4dazDdLmpxSbSju8LyPQX+QK8jP
	8k66CHGrBj1Ia6GM53uFYdmK2jLRLA0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-zgYYo98xPMa2CbqBBl4t5w-1; Thu,
 17 Sep 2026 02:48:41 -0400
X-MC-Unique: zgYYo98xPMa2CbqBBl4t5w-1
X-Mimecast-MFC-AGG-ID: zgYYo98xPMa2CbqBBl4t5w_1789627719
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E9583195F140;
	Thu, 17 Sep 2026 06:48:36 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D02F33003EED;
	Thu, 17 Sep 2026 06:48:34 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v7 1/4] wifi: ath11k: use queue mapping for WCN6750 ring selection
Date: Thu, 17 Sep 2026 08:48:22 +0200
Message-ID: <20260917064825.12747-2-jtornosm@redhat.com>
In-Reply-To: <20260917064825.12747-1-jtornosm@redhat.com>
References: <20260917064825.12747-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 0K9Lu1Al0TIfIl1fX6ljPARdSLPOMYEmb3a-bFWsuLY_1789627719
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_234847_895067_C84933E9 
X-CRM114-Status: GOOD (  14.54  )
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

WCN6750 selects the TCL ring using skb_get_hash() to distribute
flows across its 3 TX rings, as introduced in commit 7636c9a6e7d7
("wifi: ath11k: Add multi TX ring support for WCN6750"). The goal
was to prevent out-of-order packet delivery that could occur with
smp_processor_id()-based selection, where packets of the same flow
could end up on different rings depending on CPU scheduling.

Switch to skb_get_queue_mapping() instead, which returns the AC
(access category) assigned by mac80211 in ieee80211_select_queue().
This provides the same ordering guarantee: packets of the same TID
always map to the same AC and therefore always land on the same
ring, preventing reordering.

Using queue mapping for ring selection also provides QoS-aware
distribution, where each traffic class gets a deterministic ring
assignment, rather than the random distribution that flow hashing
produces. With 3 rings and 4 ACs (VO=0, VI=1, BE=2, BK=3), the
mapping becomes: VO and BK share ring 0, VI uses ring 1, and BE
uses ring 2.

This matches the approach already used by ath12k for WCN7850, which
has the same ring count and uses skb_get_queue_mapping() for its
ring selector.

This change also removes the dependency on skb_get_hash(), which
is relevant for a subsequent patch that removes the skb parameter
from the get_ring_selector hw_ops callback entirely, enabling
TX flow control in wake_tx_queue without requiring a complex peek
to inspect frames before dequeue.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v7: no modification
v6: https://lore.kernel.org/all/20260811172435.616200-2-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath11k/hw.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..d679e39dce03 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -891,13 +891,7 @@ static u32 ath11k_hw_ipq8074_get_tcl_ring_selector(struct sk_buff *skb)
 
 static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
 {
-	/* Select the TCL ring based on the flow hash of the SKB instead
-	 * of CPU ID. Since applications pumping the traffic can be scheduled
-	 * on multiple CPUs, there is a chance that packets of the same flow
-	 * could end on different TCL rings, this could sometimes results in
-	 * an out of order arrival of the packets at the receiver.
-	 */
-	return skb_get_hash(skb);
+	return skb_get_queue_mapping(skb);
 }
 
 const struct ath11k_hw_ops ipq8074_ops = {
-- 
2.54.0


