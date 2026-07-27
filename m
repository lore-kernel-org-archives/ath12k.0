Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D789FC531C9
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCYT1Xihnl2MEFF4EmXT3VpRMBqw9OFUfd1mdz2BxHs=; b=a/FqQ5kpqe0t8pElnlPY8PnnT5
	vwlysHI5Ux3qaIapJQZW1XftzoE96rboKtckMT9q82kJqp/lLN/K9R3qO/fEUwq30mIVbGtKhMlLf
	1bqtZJ5UDsX9LewKri4s5FSDagE1vxMoGTU2iv7oi3xW1B0Ol6fto3MgP1VrywgPzucskIHP8svIz
	jFlsWheFRfHfBzYDZRUeCcyQQXTxWZB49OmSdyQmgeWMGojY1eau11Oti7Svmj4NcT3Id8Q56suaK
	2MhIxxRxRy7T7JZ5z2JmSkLqsIlYs/ZGFhNRtOuDAqS8L/xQJ1oDitTLgJ4EspaUoHc4qdXKg2CI6
	5f0lpifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBY-00000003K6w-2Hse;
	Mon, 27 Jul 2026 16:28:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBW-00000003K53-0wqe
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 16:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lCYT1Xihnl2MEFF4EmXT3VpRMBqw9OFUfd1mdz2BxHs=;
	b=SBTZy6cFKCOef/bxKWf0d8KpJil2VGvZ59aRxl8B6/ghtqZ4wVmDJ9DDIom4OHV7U1+uRs
	PK25na9Hox6JNuLPdyM1Mv4jPuSvAwcTqYTrUQMTRN3+MvUWvbk0z7bxpwJL8K2YXc1GXv
	V2S2AaXIMKCQMgMHtdfos2LiOJ5VzoU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-290-aMQfWe6_NvipD4KRy9ov0Q-1; Mon,
 27 Jul 2026 12:28:03 -0400
X-MC-Unique: aMQfWe6_NvipD4KRy9ov0Q-1
X-Mimecast-MFC-AGG-ID: aMQfWe6_NvipD4KRy9ov0Q_1785169681
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 593741800758;
	Mon, 27 Jul 2026 16:28:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.58])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3246C42B;
	Mon, 27 Jul 2026 16:27:57 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 0/5] wifi: ath12k: fixes to improve MLO station stability
Date: Mon, 27 Jul 2026 18:27:43 +0200
Message-ID: <20260727162748.963275-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: SoS6qk12aBuxC0RVZiu94SfAd2TlzMlkuWOrIVxqJ-Q_1785169681
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092810_359878_7809F324 
X-CRM114-Status: UNSURE (   5.51  )
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

This series improves firmware crash recovery and connection stability
for MLO (Wi-Fi 7) stations on ath12k. Both work correctly for non-MLO
(Wi-Fi 6) stations, where the driver handles the full teardown and
reconnect cycle without issues and maintains stable connections. This
series brings MLO to the same level.

Without these fixes, a firmware crash during an active MLO connection
results in kernel warnings, NULL pointer dereferences, 20+ second
recovery delays, and periodic disconnections both after recovery and
during normal operation under heavy traffic.

Patches 1-3 fix firmware crash recovery:

Patch 1 moves the RECOVERY flag clear to reconfig_complete and adds
        CRASH_FLUSH guards to prevent operations on dead firmware.
Patch 2 prevents scans during recovery to avoid NULL dereferences.
Patch 3 fixes ML peer ID desync between host and firmware by syncing
        the peer ID from firmware's actual value.

Patches 4-5 fix MLO beacon miss handling:

Patch 4 fixes beacon_iter to iterate all MLO links instead of only
        deflink for BSSID matching and connection_loss_work
        cancellation.
Patch 5 complements patch 4 by skipping connection_loss_work for MLO
        entirely, since its cancellation mechanism is unreliable and
        the mac80211 probe triggered by ieee80211_beacon_loss() is
        sufficient to detect real AP unreachability, as done by other
        MLO-capable drivers such as mt76 and rtw89.

Tested on WCN7850 with MLO (Wi-Fi 7).
Firmware crashes were observed to occur spontaneously during normal
MLO operation with intense traffic testing, though rarely.
The debugfs simulate_fw_crash interface was used for systematic testing
and reproduction during active MLO connections with traffic.

Note: I will have limited availability from mid-August to
mid-September. I will address any review feedback before then
or promptly after returning.

Jose Ignacio Tornos Martinez (5):
  wifi: ath12k: fix MLO station firmware crash recovery
  wifi: ath12k: prevent scan during firmware recovery
  wifi: ath12k: fix MLO dp_peer ID desync with firmware
  wifi: ath12k: fix MLO beacon handling using per-link addressing
  wifi: ath12k: skip connection_loss_work for MLO beacon miss


