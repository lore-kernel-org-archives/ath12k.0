Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A506CF9C71
	for <ath12k@archiver.kernel.org>; Tue, 24 Sep 2024 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mmh4ZlQDYBkvXCsB0vJM8wX80hdxafSxiyZWEpfUmwc=; b=inCTGRnjSYfZ+1j5Xj796Tl2DB
	2F/D7ZhIyKwBH/Beq9KZvgbSVADTRKIpz8ujjMzcxQBz54jssomAaQXesy9Dnt0ggkXx8sCDbXnEH
	J3axohRresDPQEeM2x/cy9SI8rfIdPrUWrviOLbqcWnmGV9p2lGBwUuddgwR+NH3BWvkPb5Pmf3Ss
	e13MICcYriK+QfX0MpjcP2VbtfcAu6U+av+vuXS0nPj/5l4NIwtZLITQp6Oudr7EPQcEGbP8M6LZE
	qKa/YslkEvQGfDxBUPlYN2m5/BvZt30UESXK9wJ7wFuJupRtjVFBDktmhaS/QulImc9rBg8B6a7xz
	P43fF/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1uD-00000001oVK-1N6o
	for ath12k@archiver.kernel.org;
	Tue, 24 Sep 2024 09:32:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1nK-00000001muF-2CtR
	for ath12k@lists.infradead.org;
	Tue, 24 Sep 2024 09:25:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19F895C5BA8
	for <ath12k@lists.infradead.org>; Tue, 24 Sep 2024 09:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D56C4CEC4;
	Tue, 24 Sep 2024 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169917;
	bh=glQD8WRL31UdYqkiq9YK+0QDTotbN41o2t2NZ3Fysko=;
	h=From:To:Cc:Subject:Date:From;
	b=V5vzvn/qeNQaa+Faw7puQp/YzpAhQNyfFVRBHax8BN1K+3ET3H5o0WhOFdyEZ7XD8
	 xF/4/2ccbQ3+Ijg/dSpoquzOGKpq63SKgWoXRfzid7x9b+tj/gbECBQ7EjgAfHPbvN
	 NdW2u6R723QnnRDoBlcJVNFp8KcybCN8L0TMleu7FPJ3Wsl+FVewRCj/zTeIqYKPBn
	 lBcLINQoN1BvZdBMWcenmBG7pRclaazRoaDBUZqHOyyjWGbLVtU4bESVFMo+9JbcgB
	 mHLqbVoFkkcdAml78Y19FoP7t07qhQAyUBoniW7uo8f9uN2H0kH7Pd9/DQLsGvApkO
	 Us8Ks0imBxJmQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC v3 0/6] wifi: ath12k: switch to using wiphy_lock()
Date: Tue, 24 Sep 2024 12:25:09 +0300
Message-Id: <20240924092515.1049885-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_022518_635492_D11F9F6D 
X-CRM114-Status: UNSURE (   8.30  )
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

I'm submitting this as RFC as I have only tested these patches and need
to investigate how this affects MLO implementation.

v3:

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
  wifi: ath12k: ath12k_mac_op_set_key(): remove exit label
  wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk
    cancellation

 drivers/net/wireless/ath/ath12k/core.c        |   7 +-
 drivers/net/wireless/ath/ath12k/core.h        |   7 +-
 drivers/net/wireless/ath/ath12k/debugfs.c     |   4 +-
 .../wireless/ath/ath12k/debugfs_htt_stats.c   |  26 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 388 +++++++-----------
 drivers/net/wireless/ath/ath12k/peer.c        |   6 +-
 drivers/net/wireless/ath/ath12k/wow.c         |  26 +-
 7 files changed, 192 insertions(+), 272 deletions(-)


base-commit: d35bb26e150d7fb7434959fad9fcaeaac99906e6
-- 
2.39.5


