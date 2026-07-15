Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631B9C44508
	for <ath12k@archiver.kernel.org>; Wed, 15 Jul 2026 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=owMox2T0drHzdab6F2aSdDlHCCRxP5tdtmtldpaxuTo=; b=esSgNRYcKcrHfIG/IXC1/wi9gb
	w1CiJGlZi6OyZC8ah04MUSZKWZKhUwT542KYfQ8sy2PTPeDLuewZag3r0KY420q0401NTMHJ0Zvxp
	/OkAIrl64s5DRD2D6a89hHZC9YJ1c0bmtqKCdQsmmhKg0k8LjdhVr74AVuJ7qtTMu44U+bSG+a82m
	3rOH0Gc9q7nZXwszL88OVIim1FkM6EvTFZx8w8HYzV2kJUX4eawUwedLjrelYwaoqCbUM0yx5l/KN
	KTcOKq5c16rSHRGxW1A5IPUol3ZsIwUXEzH03seJfxnyne2t5yOSQKI9Qldj4BHZy8a4Qz0yC8Evh
	mltv7nLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz4L-0000000EqFY-1ENh;
	Wed, 15 Jul 2026 12:50:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz4I-0000000EqEp-38FV
	for ath12k@lists.infradead.org;
	Wed, 15 Jul 2026 12:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784119830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=owMox2T0drHzdab6F2aSdDlHCCRxP5tdtmtldpaxuTo=;
	b=VsTVP+EKMX9te6m61x7vFsdAfQPAIoXPl6rypXqwu3VrEFaHUZ2ewFzKkuq8oT8hOwYq/x
	68dhlpPN/6dUW8JZK6q7B8Bix6+yUKajJs41l3Zrz+MqfoTM5bF8rQkTvLncNHRyeowgy/
	F+Wcqic7DDSelW7vbv4NujSLRS9ITjQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-X86IZ6kWOuuUYG2ks2quDg-1; Wed,
 15 Jul 2026 08:50:24 -0400
X-MC-Unique: X86IZ6kWOuuUYG2ks2quDg-1
X-Mimecast-MFC-AGG-ID: X86IZ6kWOuuUYG2ks2quDg_1784119823
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0807E180059B;
	Wed, 15 Jul 2026 12:50:23 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EB21D180036E;
	Wed, 15 Jul 2026 12:50:19 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v2 0/3] ath11k/ath12k: implement TX flow control
Date: Wed, 15 Jul 2026 14:50:13 +0200
Message-ID: <20260715125017.277242-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: pGgy9_8bYm9WOo9AL2901QlwML0V0yoocMOf-upAkTM_1784119823
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055030_851507_CC2DEC10 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
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

This series implements custom wake_tx_queue operations for ath11k and
ath12k drivers to prevent hardware ring overflow issues under heavy
traffic.

Without proper flow control, both drivers experience -ENOMEM errors
("failed to transmit frame -12") when the hardware TCL ring fills up.
Additionally, ath12k can hang under sustained high throughput. These
issues are more commonly observed in VMs with PCIe passthrough but
also occur on bare metal systems.

The implementation follows the pattern used in the iwlwifi driver,
checking hardware ring space before dequeuing packets from mac80211.
Per-ring locking serializes ring access while allowing TX completions
to run, preventing deadlocks.

Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
and improved throughput under heavy traffic conditions.

Jose Ignacio Tornos Martinez (3):
  mac80211: add ieee80211_tx_peek API
  wifi: ath11k: implement custom wake_tx_queue with flow control
  wifi: ath12k: implement custom wake_tx_queue with flow control

v2: Address feedback from Zhi-Jun You:
    - Add ieee80211_tx_peek() API in mac80211 to peek at the next frame
      without dequeuing, enabling accurate ring selection before dequeue
    - Use get_ring_selector() on the peeked skb to determine the exact
      target ring matching dp_tx, fixing ring mismatch on multi-ring
      platforms (ipq8074, wcn6750, qcn9274, wcn7850)
    Address feedback from Tamizh Chelvam Raja:
    - Fix ath12k radio assignment: obtain ar from txq->vif through the
      arvif chain instead of ah->radio flexible array
    Move CRASH_FLUSH check inside the TX loop 
v1: https://lore.kernel.org/all/20260710155443.1761760-1-jtornosm@redhat.com/
--
2.49.0


