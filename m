Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2EEC5518F
	for <ath12k@archiver.kernel.org>; Tue,  4 Aug 2026 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=csMVXm96rnd27MaHDb/ezPMlPIqqVgNsyKE4NXILxO8=; b=UIZ05RXF+6vuA6cqhR6ox5wEOY
	7qBiqZmqFZdsUEy5z8Z6GaNvuSJEyZYaosPZMZATbN/Ctdq0Os8Ykrai638CK0vHIFQtXZtd5Auy+
	xW9T7gB2BAvrDiNcuRS82WjGFaUoN9jxSfnxAj3B9LmnrmOG50TTig4wmF8e724hCcuTopRfwBVvF
	7Gpsz90X3D9og0dNQIhHU0a/JD95pZ8/qUw4jlb0edpIEgkld9zCWNVt1ZZ/W+9tEYVSNNSFUOESy
	dND8/lbVRTSA8kvX6xFnLQHFSTZ18n/rVIGhXI4hR8CIEwsG6yVRbIHyosrT6mSIPqczJizeGNVu0
	svqWFA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHS-00000002Wjj-1U1O;
	Tue, 04 Aug 2026 17:50:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJHP-00000002Why-13MR
	for ath12k@lists.infradead.org;
	Tue, 04 Aug 2026 17:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785865816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=csMVXm96rnd27MaHDb/ezPMlPIqqVgNsyKE4NXILxO8=;
	b=Rj1lCZaXCPNDZ3HRmIWMFhOPFfdbAItiu0P4MSCb6zF1HkO+EsdyovTLLhPH9pTjOjZ/0R
	XluDEj+ubcBsYdqu43qhR3eRhQ40FcWJy6UQ4UOwK78VZd683OFCGg55roMbbIjCi1d3FS
	otT/0jBA7zhfuXDz7gZ6Sa1DNEpCaKI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-e_-biiSVNmGu4_-NbZNWJg-1; Tue,
 04 Aug 2026 13:50:11 -0400
X-MC-Unique: e_-biiSVNmGu4_-NbZNWJg-1
X-Mimecast-MFC-AGG-ID: e_-biiSVNmGu4_-NbZNWJg_1785865809
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A414218004AD;
	Tue,  4 Aug 2026 17:50:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80E58180044F;
	Tue,  4 Aug 2026 17:50:07 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v2 0/3] wifi: ath12k: fixes to improve MLO station stability
Date: Tue,  4 Aug 2026 19:49:58 +0200
Message-ID: <20260804175004.1761075-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: k0ArLDtmeHpOKS3pUv8DrPMrntmf9aq91b-p4gZbS9M_1785865809
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105019_355121_9BC5FFAE 
X-CRM114-Status: UNSURE (   8.70  )
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

Patches 1-2 fix firmware crash recovery:

Patch 1 moves the RECOVERY flag clear to reconfig_complete and adds
        CRASH_FLUSH guards to prevent operations on dead firmware.
Patch 2 prevents scans during recovery to avoid NULL dereferences.

Patch 3 fixes MLO beacon miss handling:

Patch 3 skips connection_loss_work for MLO entirely, since its
        cancellation mechanism is unreliable and the mac80211 probe
        triggered by ieee80211_beacon_loss() is sufficient to detect
        real AP unreachability, as done by other MLO-capable drivers
        such as mt76 and rtw89.

Tested on WCN7850 with MLO (Wi-Fi 7).
Firmware crashes were observed to occur spontaneously during normal
MLO operation with intense traffic testing, though rarely.
The debugfs simulate_fw_crash interface was used for systematic testing
and reproduction during active MLO connections with traffic.

Note: I will have limited availability from mid-August to
mid-September. I will address any review feedback before then
or promptly after returning.

v2:
  - Rebased on ath/main (requested by Jeff Johnson).
  - Patch 1: rebase and address comments from Baochen Qiang:
    - Remove CRASH_FLUSH guards from HAL srng source ring helpers
    (ath12k_hal_srng_src_num_free, ath12k_hal_srng_src_get_next_entry,
    ath12k_hal_srng_access_end). They were a layering violation — the
    HAL should not know about device crash semantics. They were added
    as a precautionary measure to abort as soon as possible, but
    ath12k_wifi7_dp_tx() already has a CRASH_FLUSH check before any
    HAL call.
    - Fix radio[0] usage in change_vif_links, sta_state, and
    peer_mlo_link_peers_delete to use per-radio ab.
  - Patch 2: fix radio[0] usage
  - Drop v1 patch 3 (fix MLO dp_peer ID desync with firmware):
    already fixed by Baochen Qiang's ML peer ID series in ath.git
  - Drop v1 patch 4 (fix MLO beacon handling using per-link
    addressing): patch 3 (v1 patch 5) skips connection_loss_work for
    MLO entirely, making the per-link beacon matching and cancellation
    in v1 patch 4 unreachable (Baochen Qiang comment).
  - No modification for v1 patch 5, now v2 patch 3.
v1: https://lore.kernel.org/all/20260727162748.963275-1-jtornosm@redhat.com/

Jose Ignacio Tornos Martinez (3):
  wifi: ath12k: fix MLO station firmware crash recovery
  wifi: ath12k: prevent scan during firmware recovery
  wifi: ath12k: skip connection_loss_work for MLO beacon miss


