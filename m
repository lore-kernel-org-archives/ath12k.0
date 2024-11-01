Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49E3E6F069
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/aiUMzFeMiuaQ0Ukerlijo0fKQUrZJAyFNsuNVOeP9o=; b=Y/zBvDCkMK4+U04bdyhfFLe2ly
	b3ASdeBcYmQwrKAU8Lr0osUukcY4swU2iY94AyXaOycY7YaB4XboA+qPdyem4GgRDSR7Uk2Yj6yYz
	l9TsvHGMcdazG/gU2bwFpWD5BekjoRUzJ+POVJNqZj/AAz352Wia4b3hyGlGNn7h+Vnz4soq3cAmb
	uCS7mGwLzYboW8azAVAQaaTMZ7c+riBdnRhwo8uySz/1P5DHtxnhEU5495RcAVAyBFS787+uXXjVe
	h4m0CtiqSR99UfOQaALGwUpV0BJqcSvc9H8X/0owdK84xFvA4tlRVZsmqU23vT/kDwkDtEcqBPeWy
	cYbNWtCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOi-00000007TYO-24xR
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 15:17:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tOf-00000007TWu-1ovt
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 15:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 411BB5C0224
	for <ath12k@lists.infradead.org>; Fri,  1 Nov 2024 15:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0487C4CECD;
	Fri,  1 Nov 2024 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730474227;
	bh=rqKZRh1kZWq0dO6E77nwpLrqssHmvDvFFYlqyHS8MoA=;
	h=From:To:Cc:Subject:Date:From;
	b=tPpjGeG5lqGIuXysu2lSZISFOBxuEiX7mn5u7WM7i9R/w+pKsSGgVFO0dItd1wkMV
	 Is90czFTBUVq0SZ3ZNXU+CHF4nmvVnoBjUmAPJTJFpNoYrkc9HL3kLY/7/DzHX4CiR
	 VHVF+913zLngMlpd6VDLrmyeJOsKqh1FwO4WCHmV3i0c/XzCoA6aawRvsZSJ0mA3p6
	 ryClx+6rWbTdyLpcQ1SotRya5rf3raHeJTOyh9GhpfYjtcDBFeuiyGRBL+lSr692AK
	 //NUHGfKKrbV6Lmm0rko2+z71N+PJTQMJfLgHuyMDdnEOmeLvRWsqDQlW3uY7FDsIa
	 xhFJfeIF0i7Hw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/8] wifi: ath12k: MLO support part 2
Date: Fri,  1 Nov 2024 17:16:57 +0200
Message-Id: <20241101151705.165987-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_081709_741897_BAFAD942 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Here we continue to refactor mac.c to support multiple links and extend peer
assoc WMI command to support MLO.

Please review.

v2:

* patch 1: use err_vdev_del

* patch 2: ath12k_mac_mlo_get_vdev_args(): switch
wiphy_dereference()

* patch 2: use struct ath12k_wmi_mac_addr_params instead adding struct wmi_mac_addr

* patch 3: ath12k_mac_station_post_remove(): assign
ahsta->links_map before rcu_assign_pointer()

* patch 3: ath12k_mac_station_unauthorize(): fi* confusing comment about __sta_info_destroy_part2()

* patch 4: debugfs.c: copyright year

* patch 5: ath12k_peer_mlo_create(): remove parenthesis from the
  warning message

* patch 5: ATH12K_ML_PEER_ID_VALID: move to peer.h and rename to ATH12K_PEER_ML_ID_VALID

* patch 5: rename struct ath12k_peer::ml_peer_id to peer_id

* patch 5: use ath12k_peer_ml_*() naming style in peer.c

* patch 7: improve commit message a bit

* patch 7: struct wmi_peer_assoc_mlo_partner_info: add _params to name

v1: https://patchwork.kernel.org/project/linux-wireless/cover/20241023133004.2253830-1-kvalo@kernel.org/

Kalle Valo (2):
  wifi: ath12k: ath12k_mac_vdev_create(): use goto for error handling
  wifi: ath12k: introduce ath12k_hw_warn()

Sriram R (6):
  wifi: ath12k: MLO vdev bringup changes
  wifi: ath12k: Refactor sta state machine
  wifi: ath12k: Add helpers for multi link peer creation and deletion
  wifi: ath12k: add multi-link flag in peer create command
  wifi: ath12k: add helper to find multi-link station
  wifi: ath12k: Add MLO peer assoc command support

 drivers/net/wireless/ath/ath12k/core.h  |  25 ++
 drivers/net/wireless/ath/ath12k/debug.c |   6 +-
 drivers/net/wireless/ath/ath12k/debug.h |   5 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 504 +++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/peer.c  | 115 ++++++
 drivers/net/wireless/ath/ath12k/peer.h  |  12 +
 drivers/net/wireless/ath/ath12k/wmi.c   | 191 ++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h   | 115 ++++++
 8 files changed, 848 insertions(+), 125 deletions(-)


base-commit: fa934bf3e0a825ee09f035c6580af513187d59a2
-- 
2.39.5


