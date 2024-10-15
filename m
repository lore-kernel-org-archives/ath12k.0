Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB4BD1D88B
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 17:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v8AiSRAvvY+yIfvJXp+V3O8tqad3T0QDFdOc5R16rrw=; b=A5c1VsgugxOYmISAGFEXaRGYO7
	cpo2FeNynCBqcGkWmgNBST1zk06ZrMehwa5OkflmsFydhi0f64wgqo4VyC+Xk8s+/zig2IJQikT5m
	mFDSwB9xEUMXm1ndcWzN985Gu0mVn+BEVD9peMNvzytUY3SlLyOrp7AEA7Ku3kekJAPFNv0y0Qaj+
	Bea8jx7OELH0NCc9g8F2zmFfrX+5k545LdqWzX/36jytO/oN1rm2k1Bq5wtQ7U76WM0naPLqUeqUY
	C/yaEoALhHxvsA7WGeGaNcqC9uJQudQMdKeWLy0bONGmg4v6sve+RbI51Nicy/daXHaMx8asK31qn
	CYB9L0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7m-00000008ziQ-3rP8
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 17:14:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7k-00000008zhT-1tpf
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 17:14:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FA765C5718
	for <ath12k@lists.infradead.org>; Tue, 15 Oct 2024 17:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF03C4CEC6;
	Tue, 15 Oct 2024 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012459;
	bh=DCBlPadHCzsQZj65kPYdgD6poH9aNHZndZDV2jYWdMY=;
	h=From:To:Cc:Subject:Date:From;
	b=hzUQNOEI7REmVwE5/qbInfTNjcc2P9kOUqdSyOEytpaQK7poDRwmlmBAQhXOPw6YZ
	 7DcRyUCQhVOlMqNkOkdGuYAqgRLwTJhi/HVQNdUopuvuNi6rSGu5gzaF5pipBWySwN
	 5MFNeZjMcNDr9Gv6EuLK6oKdbyN3NTQdMCDg6znMu7fc2Co5awhEKSfG3t13s+KKZF
	 tYB4OVOUY8I4eXQvOJ8zkLVbg3outmAK8WrVzmKPpFeVeD98sjit0nuRnOmHxT2oBA
	 0p+5IblPJecsorMkAH/5Wh1BINz9BVwCp1f2ZgYkrHGiFLSOAkm4RHxrOiyBma/FTZ
	 MsV4ywnSBbvPg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 00/11] wifi: ath12k: MLO support part 1
Date: Tue, 15 Oct 2024 20:14:05 +0300
Message-Id: <20241015171416.518022-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101420_560972_7F49F626 
X-CRM114-Status: UNSURE (   7.15  )
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

I'll start submitting patches for adding MLO support to ath12k. There will be
several patchsets and this is the first one (of many).

In this patchset we start refactoring code in mac.c to support multiple links.

Depends-on: wifi: ath12k: add missing lockdep_assert_wiphy() for ath12k_mac_op_ functions
https://patchwork.kernel.org/project/linux-wireless/patch/20241011173323.924473-1-kvalo@kernel.org/

Rameshkumar Sundaram (4):
  wifi: ath12k: prepare vif config caching for MLO
  wifi: ath12k: modify ath12k_mac_vif_chan() for MLO
  wifi: ath12k: modify ath12k_get_arvif_iter() for MLO
  wifi: ath12k: modify ath12k_mac_op_set_key() for MLO

Sriram R (7):
  wifi: ath12k: prepare vif data structure for MLO handling
  wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
  wifi: ath12k: prepare sta data structure for MLO handling
  wifi: ath12k: modify ath12k_mac_op_bss_info_changed() for MLO
  wifi: ath12k: update ath12k_mac_op_conf_tx() for MLO
  wifi: ath12k: update ath12k_mac_op_update_vif_offload() for MLO
  wifi: ath12k: modify link arvif creation and removal for MLO

 drivers/net/wireless/ath/ath12k/core.h   |   89 +-
 drivers/net/wireless/ath/ath12k/dp.c     |   21 +-
 drivers/net/wireless/ath/ath12k/dp.h     |    3 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c |   14 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |   16 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h  |    2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |    9 +-
 drivers/net/wireless/ath/ath12k/dp_tx.h  |    2 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 1492 +++++++++++++++-------
 drivers/net/wireless/ath/ath12k/mac.h    |   11 +-
 drivers/net/wireless/ath/ath12k/p2p.c    |   17 +-
 drivers/net/wireless/ath/ath12k/p2p.h    |    2 +-
 drivers/net/wireless/ath/ath12k/peer.c   |    5 +-
 drivers/net/wireless/ath/ath12k/peer.h   |    4 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |   22 +-
 drivers/net/wireless/ath/ath12k/wmi.h    |    8 +-
 drivers/net/wireless/ath/ath12k/wow.c    |   59 +-
 17 files changed, 1192 insertions(+), 584 deletions(-)


base-commit: 69eabe24843f238e79a6dbbd2b3fcc8eef39d6b8
prerequisite-patch-id: 3f91f437016fbeec6019c1444cee521756971ba1
-- 
2.39.5


