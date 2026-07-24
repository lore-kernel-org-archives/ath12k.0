Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F31C531F9
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 05:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P2dO43unXcYxFDlErvgykZBd8dhtT9NMkVEfA2VJujU=; b=1cy8jMmJzeX++XmxarxI2iEMa7
	DUQg883NQnyadb0SmHSIP7uWOgIYtBe+BmbaYwp6RkUwwet6jq8Rw28TS5+gIKTQ2MciF7OwoXHjk
	Gb2SrD3D4mqgVW1cH6LavCudz4ZXkrMZfHZKyMhcaWxfoHcps470XvqZK71wU4aYOOlak0Jp9IbBR
	pDuNjRNgFFyerPtCmH0zIoxNUEBsWqkfbs2nidYPJsrca8Wm8/Fw9g3HNfA8wlate++SFrAmSNG6c
	/a6AzmMcMGREhc/2ZJ3vQYpL6+gmB1F1LaIFtn3Y0rkxgn6yEWpyXKPxy65hwJ3VqvuK8dTjYOOkE
	WBKyB/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8VY-0000000FVsy-1yio;
	Fri, 24 Jul 2026 05:31:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8VV-0000000FVsC-1ILM
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 05:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784871094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P2dO43unXcYxFDlErvgykZBd8dhtT9NMkVEfA2VJujU=;
	b=BcDY1dMJqvMbKW+Dakxa01REb7+vwbl81785AjPSq0jHw9+DuG6BrehDsja3WtjtoXb7OX
	RDMKQRseuT0j21xrpmmQ1WRTzotW1TXUPmtUfGjUvejpV7NQtwyfVDdaXyciFldPSiAIxk
	KZAc2NNinzphUnk38ANEK1PCNpIO0cE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-kOXbVBLsM3iJcoilC06AlA-1; Fri,
 24 Jul 2026 01:31:31 -0400
X-MC-Unique: kOXbVBLsM3iJcoilC06AlA-1
X-Mimecast-MFC-AGG-ID: kOXbVBLsM3iJcoilC06AlA_1784871090
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 14EFA1944D21;
	Fri, 24 Jul 2026 05:31:30 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.50])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7994C30002CE;
	Fri, 24 Jul 2026 05:31:26 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v4 0/4] ath11k/ath12k: implement TX flow control
Date: Fri, 24 Jul 2026 07:31:17 +0200
Message-ID: <20260724053121.15759-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: HKmZORsodda8eUX42_TjE47upMDCcLH7mp7tcp9zcgc_1784871090
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_223137_445399_40AC90D4 
X-CRM114-Status: UNSURE (   6.90  )
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

v4: Address feedback from Johannes Berg:
  - Drop the ieee80211_tx_peek() mac80211 patch entirely due to the
    commented concerns.
  - Redesign as a consequence of dropping the peek API:
    - Patch 1: switch WCN6750 from skb_get_hash() to skb_get_queue_mapping()
      as a preparatory step, since the AC value is all that is needed.
      This aligns with the approach already used by ath12k WCN7850
      (which has the same ring count).
    - Patch 2: Instead of peeking the skb to call get_ring_selector(skb),
      pass txq->ac directly via get_ring_selector(u8 ac). This is safe
      because mac80211 guarantees skb_get_queue_mapping(skb) == txq->ac for
      any skb dequeued from a given txq.
    - Patch 3 and 4: adapt tx flow control to the new approach.
v3: https://lore.kernel.org/all/20260720070852.206495-1-jtornosm@redhat.com/
--
2.49.0


