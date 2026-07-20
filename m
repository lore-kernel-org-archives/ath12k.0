Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF5FC44515
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ReTejzYKlz1Q/pR6RCyJpzicTdfuHHRGKFgTayNqu8=; b=jZHgPg0gw+ijpKYPYWvOQ2C8ol
	4GlxtgILrONvTYwMPNMv2wUi9st+Lv28xeFFun4884igbx6IqE65E6m6YPKS91bj9APXwDUlpjfHw
	7h3WDp+8Fiyc8BeuKFCLtHTxd0HTZMwuFL6PG+bU5mfGvd7xTqOP5cJjVx+c5+h3YqfebGPyo10Rd
	at+41NU8/fRt/W9D1/Al1+k9xs7MOXbgUOAe9CryiYWmoffl3j6TxWYO7isc7mxCCU16iROHfNY7Q
	XP9HR+aWZyAP62TXmQ5ax7relruRM4skbXQtCTadtJ8kQtIg0elxZuhcty/iqB+VzI4cu2OQf0kRt
	KFrdXEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wli7j-000000061P1-3Drb;
	Mon, 20 Jul 2026 07:09:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wli7g-000000061OO-38nz
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 07:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784531347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5ReTejzYKlz1Q/pR6RCyJpzicTdfuHHRGKFgTayNqu8=;
	b=My9TDkUpu4Q9oD6/j6f6jI5nwhl1EvRjNt6Wyw86CaypFFG819SHueZLu1gZ42t1pRsDH0
	VhYHjNgQd+jL3AnkSP2lov1CbFgqOsb7kGu3Sw6bXLjj1p9XxOiNd6EvYTUJRMmbqjkQyN
	JAF572wxN+DLtkBCfN+zzWTnpyLYJ6M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-lT1wsJElPq2vrKSro8jZaQ-1; Mon,
 20 Jul 2026 03:09:05 -0400
X-MC-Unique: lT1wsJElPq2vrKSro8jZaQ-1
X-Mimecast-MFC-AGG-ID: lT1wsJElPq2vrKSro8jZaQ_1784531344
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6113E1944B3C;
	Mon, 20 Jul 2026 07:09:04 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90F2F18005AE;
	Mon, 20 Jul 2026 07:09:01 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v3 0/3] wifi: ath11k/ath12k: implement TX flow control
Date: Mon, 20 Jul 2026 09:08:48 +0200
Message-ID: <20260720070852.206495-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 7O_uofx7LVMRDC9KYoBbsFAz67WAohhD5jLNeJY9fvc_1784531344
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_000908_881979_1EE9A723 
X-CRM114-Status: UNSURE (   6.91  )
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
Per-txq locking via txq->drv_priv serializes peek and dequeue
operations for the same txq, preventing use-after-free races while
keeping different txqs fully parallel.

Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
and improved throughput under heavy traffic conditions.

Jose Ignacio Tornos Martinez (3):
  mac80211: add ieee80211_tx_peek API
  wifi: ath11k: implement custom wake_tx_queue with flow control
  wifi: ath12k: implement custom wake_tx_queue with flow control

v3: Address the review comments from Tamizh Raja:
    - ath11k/ath12k: replace per-ring wake_tx_lock with per-txq spinlock via
      txq->drv_priv to fix race condition between ieee80211_tx_peek() and
      ieee80211_tx_dequeue() when multiple CPUs process the same txq
    - ath12k: fix MLO link selection in wake_tx_queue to use
      rcu_dereference(ahvif->link[link_id]) instead of deflink, matching
      the link selection logic in op_tx
v2: https://lore.kernel.org/all/20260715125017.277242-1-jtornosm@redhat.com/

--
2.49.0


