Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89305C5321D
	for <ath12k@archiver.kernel.org>; Wed, 21 Aug 2024 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JT7tSX/jYgi67JaBN4xB+jQgOOm14HPyBNAFlx83QMY=; b=kIvOWV3JU804DHLhn9oWFyMTIh
	Ec9EG4IH8UwRCjN6O5KJq/8qJ+QRGcJ6JsFBnX3fSVvyw0XUGdzVuWdM8FCk4+ncw38Xl6IkJsMga
	rwtDqRw1nBOMm1cMVD9wha4YT7R4IK6H//3ANXEheay31J6Rno4TEk9uHsF+B2Ln87bCYNg9ehlOu
	NCzUuaLBwib4/4EiIWNyRgs5aPX1390zHZPpQl+pUm3hdorAvPW2UySgqbLMheMcMK5A2hkjoM5cI
	+/Kk1hnJsKlMJ0OecZZEQWAnJSDg59PyyD6RjQeKiBEv+WjD3XeQZogMw7Y9k/skQZvCDZp25EM7H
	yqxVa2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnPL-00000009WaA-1A8j
	for ath12k@archiver.kernel.org;
	Wed, 21 Aug 2024 15:37:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnOw-00000009WR7-3mZm
	for ath12k@lists.infradead.org;
	Wed, 21 Aug 2024 15:37:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5F896CE0E6B
	for <ath12k@lists.infradead.org>; Wed, 21 Aug 2024 15:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8550C32781;
	Wed, 21 Aug 2024 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724254651;
	bh=4NQy9XYDVAd7OXQxaogt82tT/li3qf+oGJKMYNomv64=;
	h=From:To:Cc:Subject:Date:From;
	b=W6xRkVJ7l8Q0xWW7T2qQngBwINrrvKU2roKCNGUa02cujlukfP0/eZwHJZn0K3/ZX
	 sR3EZWCDRAhxKd+tRdjPRdgfZhcYFPsGgXa6c1Gp9lgwQFWeRaMpEWhphVVDPCtPNn
	 BlwFzlKso1Sk0355VPGtRGtEHYi3jf+hwZS/KJoesGIIXtN6SrIrbmyFjeE2jrdIsw
	 VxYihy9B2B2+BmQunx5aEdY4fnL1OtF1wdfVoE4d/1dsr8W/VDcoho6bmCXUdE5b1H
	 GYes8A7yjylC8xDPabozYOKjU2yBGXHJzNocEBrDXaLDrQnHkDbd3RXGsRZTLh4XUj
	 op2LaN0VBgbsg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC 0/4] wifi: ath12k: switch to using wiphy_lock()
Date: Wed, 21 Aug 2024 18:37:24 +0300
Message-Id: <20240821153728.2121600-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_083735_141213_DF96079B 
X-CRM114-Status: UNSURE (   7.96  )
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
 drivers/net/wireless/ath/ath12k/mac.c         | 366 +++++++-----------
 drivers/net/wireless/ath/ath12k/peer.c        |   6 +-
 drivers/net/wireless/ath/ath12k/wow.c         |  29 +-
 7 files changed, 187 insertions(+), 257 deletions(-)


base-commit: a38ef6438cb9017b7f0a6a8978355aeb02742a62
-- 
2.39.2


