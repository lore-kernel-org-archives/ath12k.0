Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC7CDD54F
	for <ath12k@archiver.kernel.org>; Wed, 18 Sep 2024 18:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yzomaMFGU6aYCoQJRc3sGvYbS+UN1FUKv/2aCDxfxZE=; b=SJjXljqAk90b01wAeFmFz8E0po
	COhJY4wvlT8qEMUb0L6j5r6sDtdVJzp4C4UNM8HMPeR0fTiWHPKdzVwkTXtbsFtj+eNJJC1CNtPsj
	CWxdhO/cXnkUpmuHtxC6frht9HnshQpnTMyx8CZUc7gO8tFp1UrBx72Ko/6U75FT4XS10RpyMqR0u
	NHQ92/bk2e7SME8JAtAp3DGXB6fEtZW0mdkzELxLr+qJlVN5reEggw2h4HvQjPAiuoQnyD1zhbdwJ
	eE6wWWeuBN6J2O+QuX6yLN/FJ76MC7qBploaGMRJ912Rk5jC9Q9nM4XKcDuTf3/r0RlRlRRnXKt91
	DrRK1tRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqz8b-00000008mzB-0ajj
	for ath12k@archiver.kernel.org;
	Wed, 18 Sep 2024 18:10:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqz8X-00000008my4-2lcW
	for ath12k@lists.infradead.org;
	Wed, 18 Sep 2024 18:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 502B45C05FA
	for <ath12k@lists.infradead.org>; Wed, 18 Sep 2024 18:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A8AC4CEC2;
	Wed, 18 Sep 2024 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726683044;
	bh=V691wO6FXdMoBdotKFnE8iuE140/7GMXx+PGaFn2t5M=;
	h=From:To:Cc:Subject:Date:From;
	b=bWvPplYuftc1hkfwWUZP8MfCxtwt7DS5bYCX8jp2gAckS850DlTZZxzgbHTCATeoY
	 fJ4GoTwJj7tgsfWlNRzm5bRXuXH8sWz5SsS9Ukk/SGDWaQzb0yUZ384rvSgSXigSsu
	 Sfx/Qhm2pbSokmW/99nZpt9NJxJNrO7unV4cCwPKfry07F+DNvDNBpbUc+XAOiXMtf
	 /jWxmvGzk7PgsaX+Vnk/SHsayMU5DlHIoa781RyU3SLljHP2PIQtAqN3YanSMmKTM6
	 0qPw5RyHNJ5b4KXc45IgAdHgRHWagrfxNY69rpYobQFudW54y9lb5DAlAwxcngdj+5
	 6Hu0cCGyBPTFw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC v2 0/4] wifi: ath12k: switch to using wiphy_lock()
Date: Wed, 18 Sep 2024 21:10:38 +0300
Message-Id: <20240918181042.91891-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_111045_773280_2A33F83A 
X-CRM114-Status: UNSURE (   8.07  )
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

v2:

* rebase to ath-202409051620

* patch 1: ath12k_wow_op_suspend(): remove extra wiphy_lock()/unlock() (Baochen)

* patch 1: fix clang warnings about unused labels (Johannes)

* patch 2: s/no/now/ (Jeff)

* patch 4: ath12k_sta_rc_update_wk(): fix wiphy_priv() usage

v1: https://patchwork.kernel.org/project/linux-wireless/cover/20240821153728.2121600-1-kvalo@kernel.org/

Kalle Valo (4):
  wifi: ath12k: switch to using wiphy_lock() and remove ar->conf_mutex
  wifi: ath12k: cleanup unneeded labels
  wifi: ath12k: ath12k_mac_op_set_key(): remove exit label
  wifi: ath12k: convert struct ath12k_sta::update_wk to use struct
    wiphy_work

 drivers/net/wireless/ath/ath12k/core.c        |   6 +-
 drivers/net/wireless/ath/ath12k/core.h        |   7 +-
 drivers/net/wireless/ath/ath12k/debugfs.c     |   4 +-
 .../wireless/ath/ath12k/debugfs_htt_stats.c   |  26 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 363 +++++++-----------
 drivers/net/wireless/ath/ath12k/peer.c        |   6 +-
 drivers/net/wireless/ath/ath12k/wow.c         |  26 +-
 7 files changed, 183 insertions(+), 255 deletions(-)


base-commit: 903aaf66edc97dd5b9e3118d19677291051a9c40
-- 
2.39.5


