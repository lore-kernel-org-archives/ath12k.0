Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AAFCFB44E
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 17:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cdIiES5xWfYB/U0lDBQxZjQLS5GFDWZhaSuHXwWWKTA=; b=O4FU61UvMGpZQPCJHsZAgEqjwX
	0MKwewIcenBNJXknlK/tQVpcD3zZX8a+mYbvsU6ds7z3h/0ozV3PJqgw1OHs7PddIW7poj+v9PqCr
	nHBb7TNcSiwGYZthBm9DVhCAxBM4cu7IDiAAgyU5GaXvrjepDs7PjOif/U0dR/XtwGqHxxOkzXXfP
	gjWm+VCTL935d4G4uOPEn1EUC1Y7EqgGMHKccXJd6+kYi3uBzRt4GexHWVM3ByfRKWUJ8FFNY6uHI
	gzvZ5I4/imPeZ4o9z+xYSjl4GWNKw5xTahX8a7Yd1icZUk5+28pJF45SFiWBSVu/7ti0fapcbXUHa
	C+rIV/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5o-00000003GRc-3qfr
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 17:00:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5A-00000003GKM-3kqw
	for ath12k@bombadil.infradead.org;
	Mon, 07 Oct 2024 16:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=cdIiES5xWfYB/U0lDBQxZjQLS5GFDWZhaSuHXwWWKTA=; b=E1SofkaZnAczD3SDZetVxVSlUX
	NEkYL23ptJ5yQwFK3LN14HjNKbJS427d7/W4Qw9HlrDL+D50elSJl/ZynF8Q3Lt7Y840BRJYY0BH6
	hnmX8EvEoDjvjnuUaCu/m+IjDDI0EWDP0UfAE7X6Z5C8MD7i+8BXqmICrYJ8yVLzulYfwz/BSw7yi
	AvOEECxgUA+/rntU33tjbegi94/K3KzywOq3sjA3QZHWOomAYE8buwPebi07GMzGZmFYUE/4o6S3t
	mE1NBrcl0by37l1VvjBD/7PBOaJ+Am10iRPhpzpoGCOUwnCO+dfnq5iwFBOXUosQtla2J4Y5MSe9U
	oRWZczgQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr56-00000004Sk2-2ZcA
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 16:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B83CA416F5
	for <ath12k@lists.infradead.org>; Mon,  7 Oct 2024 16:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE7CC4CEC6;
	Mon,  7 Oct 2024 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728320374;
	bh=24oXcR1cCTS8ICxr6auGrAJBYBfCWfHURTnHc2VMI34=;
	h=From:To:Cc:Subject:Date:From;
	b=YfpkFJkXOdExaRc805PhA68WhExpv4+eD2YXCdGb8ZV3bjpH95ekDHWkoEqVox+Zw
	 lM/NrROY/OYHanyQ8j34b6QTKGe+8vrXiNIMhyIHYl4vxDiZsYQ9s74B+xub/tRCrI
	 u3zg89s7auUvpbSujR6Kt1WAWNIAELYmK25nniLZ3D4HOlA38P/hmSrIydBzrPOidF
	 eabyQUaqlRCpiNNpS7t7VUhnSnJT9+1Ow2lLbSBCU28dP5y8/N/jwaw5XqtFmGedHq
	 I0wqFfxbP/KnX81KMQESs6A8VUR4Slh/EchuwNky9gX2XnlOgZfgJNJnbAhWvdWqr0
	 dGwQ0ysfMibAg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v4 0/6] wifi: ath12k: switch to using wiphy_lock()
Date: Mon,  7 Oct 2024 19:59:26 +0300
Message-Id: <20241007165932.78081-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_175937_001965_05383406 
X-CRM114-Status: UNSURE (   7.83  )
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

Convert all uses of struct ath12k::conf_mutex to use struct wiphy::mtx, which
is already used by mac80211, and remove conf_mutex from ath12k. This way we
have one mutex less in ath12k and simpler locking design.

v4:

* patch 2: s/praparation/preparation/

* ath12k_mac_op_assign_vif_chanctx(): lockdep_assert_wiphy() was twice

* ath12k_mac_vdev_create()(): lockdep_assert_wiphy() was twice

* as this is now tested with MLO remove RFC tag, this patchset should be ready now

v3: https://patchwork.kernel.org/project/linux-wireless/cover/20240924092515.1049885-1-kvalo@kernel.org/

* new patch: wifi: ath12k: fix atomic calls in ath12k_mac_op_set_bitrate_mask()

* new patch: wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk cancellation

* patch 3: ath12k_core_post_reconfigure_recovery(): take wiphy lock before hw_mutex to
  avoid a lockdep warning

* patch 3: ath12k_sta_rc_update_wk(): remove extra wiphy_lock() calls

* patch 3: update commit message, especially remove the sparse warning which was already fixed

* rebase to ath-202409191620

v2: https://patchwork.kernel.org/project/linux-wireless/cover/20240918181042.91891-1-kvalo@kernel.org/

* rebase to ath-202409051620

* patch 1: ath12k_wow_op_suspend(): remove extra wiphy_lock()/unlock() (Baochen)

* patch 1: fix clang warnings about unused labels (Johannes)

* patch 2: s/no/now/ (Jeff)

* patch 4: ath12k_sta_rc_update_wk(): fix wiphy_priv() usage

v1: https://patchwork.kernel.org/project/linux-wireless/cover/20240821153728.2121600-1-kvalo@kernel.org/

Kalle Valo (6):
  wifi: ath12k: fix atomic calls in ath12k_mac_op_set_bitrate_mask()
  wifi: ath12k: convert struct ath12k_sta::update_wk to use struct
    wiphy_work
  wifi: ath12k: switch to using wiphy_lock() and remove ar->conf_mutex
  wifi: ath12k: cleanup unneeded labels
  wifi: ath12k: ath12k_mac_set_key(): remove exit label
  wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk
    cancellation

 drivers/net/wireless/ath/ath12k/core.c        |   7 +-
 drivers/net/wireless/ath/ath12k/core.h        |   7 +-
 drivers/net/wireless/ath/ath12k/debugfs.c     |   4 +-
 .../wireless/ath/ath12k/debugfs_htt_stats.c   |  26 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 387 +++++++-----------
 drivers/net/wireless/ath/ath12k/peer.c        |   6 +-
 drivers/net/wireless/ath/ath12k/wow.c         |  26 +-
 7 files changed, 190 insertions(+), 273 deletions(-)


base-commit: 1a0c640ce1cdcde3eb131a0c1e70ca1ed7cf27cb
-- 
2.39.5


