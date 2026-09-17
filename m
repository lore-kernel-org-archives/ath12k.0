Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AC6C982C1
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 06:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=38XCC3pzzBeGcbj7BSYYe61HHKXklyzXx0gZrWcUPq4=; b=nnjdcNNqCUzkiyFw/g0Qv/9Uk/
	/a9ll4hwmJzizmSCLziIXAMRJ44H5H72+Y9RehsUMQwWFjb+mhCpJS+l1v5Pl9ANJzKsY60uNgmar
	rb8+jxevI9XfSKvpvuSrmU4k909gg7pg4D/cJFttAvOseAhVysMoUOUv0fsOm6JF2T8mn7yADCW9l
	+iI+Y2zPLUCWoDIrGf4JM2HLuXfU11EeiYVTteaFkIm99iJPYGoBcTKL0wH7OLIpTRLxcriDBd390
	rztGgoIxUv4yrAvgshE4CVwnChp8WAzY8A+Ybj6XHWE9wUUDFwvWjUQGi5zdKEhQA7QS4M1Z515ce
	PYYnApnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75vK-0000000AhGl-2Kqo;
	Thu, 17 Sep 2026 06:48:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75vH-0000000AhFC-1DNF
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 06:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789627722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=38XCC3pzzBeGcbj7BSYYe61HHKXklyzXx0gZrWcUPq4=;
	b=Ux4E/UFtg6kO4KEkgdt7kIKy3z5KasPZ2DLYQsv6Lmp84JA6cUE+A5zu1wIrRqumPzoRm+
	ExtBeTgKIKPwjoTNe4bn0wn0L2fJe90OL07wYbjiucdupHlojWD1CWSkvyMvTUa4+73/YE
	uwU5j2Ky/7siOMRgrGM3ZeVbvhiqd5E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-L0mNYR8MM02UZed6OsDEtA-1; Thu,
 17 Sep 2026 02:48:38 -0400
X-MC-Unique: L0mNYR8MM02UZed6OsDEtA-1
X-Mimecast-MFC-AGG-ID: L0mNYR8MM02UZed6OsDEtA_1789627717
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F405E18CD2FA;
	Thu, 17 Sep 2026 06:48:30 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B8AA23003EED;
	Thu, 17 Sep 2026 06:48:28 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Thu, 17 Sep 2026 08:48:21 +0200
Message-ID: <20260917064825.12747-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 8mOLhSiROVudeVWLyVsijnujY8kEA8jp8MBDYisGdxs_1789627717
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_234843_398216_BDBA083A 
X-CRM114-Status: UNSURE (   5.63  )
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
adapted for ath11k/ath12k hardware ring architecture, checking
hardware ring space before dequeuing packets from mac80211.

Testing shows stable operation with eliminated -ENOMEM errors, no hangs,
and improved throughput under heavy traffic conditions.

Jose Ignacio Tornos Martinez (4):
  wifi: ath11k: use queue mapping for WCN6750 ring selection
  wifi: ath11k/ath12k: remove skb parameter from get_ring_selector
  wifi: ath11k: implement custom wake_tx_queue with flow control
  wifi: ath12k: implement custom wake_tx_queue with flow control

v7: No modification in patches 1 and 2
    Address comments from Jeff Johnson:
      Patch 3: Add the defensive pattern _bh in both spinlocks (ath11k)
      Patch 4: Add the defensive pattern _bh in both spinlocks (ath12k)
v6: https://lore.kernel.org/all/20260811172435.616200-1-jtornosm@redhat.com/
--
2.49.0


