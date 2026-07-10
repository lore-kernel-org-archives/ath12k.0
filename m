Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34BEC43458
	for <ath12k@archiver.kernel.org>; Fri, 10 Jul 2026 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bjiyv0lirhfy7+vrSMfYOoDKtgGzU0tRvcCRuYupkas=; b=s5tRyUIWMQ87m4zbci4xn5QTBo
	/xtY83mAzw8Z0ywVnAEYSezmXkfcJ/ZISTdHXJJHheDezfWa96F4sqaTVAQ+i2bojQv/TPJWj70db
	bcuQgIeM1s8kUzCxnC0W0uSiItPGDS5UnZGRQ89csck3rJmQH2Dh5i4/L0wkQACmOb0VwvB8EOhKN
	S6H1yuaBH1PsvMddpkvx/YM8yRH2F2pw3XY0qAFizJL0Mln+CxR0hIymY2HMQiWoUXyRX+kfZ2VVP
	8522UIupNMhiixYUnRFGHetDfJ1BO3+iPnH4JDu8dAYDRVPIj9mZH7uzgwE2k/cZNjN8zKh6oG7wq
	zurDue6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDZB-00000005DkU-0YwK;
	Fri, 10 Jul 2026 15:55:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDZ9-00000005Dji-1sTT
	for ath12k@lists.infradead.org;
	Fri, 10 Jul 2026 15:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783698900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bjiyv0lirhfy7+vrSMfYOoDKtgGzU0tRvcCRuYupkas=;
	b=HsoVyZD+Urz583pIGwZ3lvVwtA7lyu4D7LYjSBq+IjPrMqiZkiMsawtUQVLTZ08H5YIbhc
	fMAUZn0g3em39EXViOJZdK31XShhQILVIBEtrTSZMv07H++ac+S8phlFJVI33f/77xmj04
	3RQlcko79KdVH+78/0ekhwJTnLmxqdE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-HavAsTw3O3uLypCFXCWu5Q-1; Fri,
 10 Jul 2026 11:54:56 -0400
X-MC-Unique: HavAsTw3O3uLypCFXCWu5Q-1
X-Mimecast-MFC-AGG-ID: HavAsTw3O3uLypCFXCWu5Q_1783698895
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4308E1955EBC;
	Fri, 10 Jul 2026 15:54:54 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.25])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE9591800480;
	Fri, 10 Jul 2026 15:54:51 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 0/2] ath11k/ath12k: implement TX flow control
Date: Fri, 10 Jul 2026 17:54:41 +0200
Message-ID: <20260710155443.1761760-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: HvMUqRQnCzt6dnvCgvAC7jrUfCuCZekQXPmgcWpIafs_1783698895
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_085503_557118_2AA83650 
X-CRM114-Status: UNSURE (   7.48  )
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
Per-packet locking serializes ring access while allowing TX completions
to run, preventing deadlocks.

Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
and improved throughput under heavy traffic conditions.

Jose Ignacio Tornos Martinez (2):
  wifi: ath11k: implement custom wake_tx_queue with flow control
  wifi: ath12k: implement custom wake_tx_queue with flow control

 drivers/net/wireless/ath/ath11k/dp.c       |  1 +
 drivers/net/wireless/ath/ath11k/dp.h       |  2 +
 drivers/net/wireless/ath/ath11k/mac.c      | 49 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.c       |  1 +
 drivers/net/wireless/ath/ath12k/dp.h       |  2 +
 drivers/net/wireless/ath/ath12k/hal.c      |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 50 +++++++++++++++++++++-
 7 files changed, 104 insertions(+), 2 deletions(-)

-- 
2.54.0


