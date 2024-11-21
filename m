Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25986D7877B
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TlJSq0GhrZodzi2I11xWxy+QueD0cudS2uZyzvk5/r0=; b=GawLzhhFfxKwLPrSlarlchR7OQ
	rAbFLfXb6EP6KZIUjNb1+G15ygFnHQ4FxT5037TtrFNkMvTk5LUBpY5zyOOwX8hQi7rtwCP/ZEaK3
	apa4NnCm3y9CfhOa7Job7Vj1ewPEjlY96w9YVeSjMqGxs51nA60t6ZdZRBXHrTNFvvoRsprHiLiUo
	6lL/AtjCxPBO7YONjxvczOYqAqe+ZlD9e7JMCsmToroYVUql95qvHKyQ/Lf56FMhq30GubuuY4mBN
	gId3XN+aSvTqpHLgrj7ngJ136N/e7trkRjYRIYKrzRMwuz06AUVRw68bnKWAxgijRl1+F2Jkn8qFL
	TYz0YcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9ZL-00000000OJZ-3qbE
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 15:58:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9ZJ-00000000OIg-1pRR
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 15:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44F2AA40ADC
	for <ath12k@lists.infradead.org>; Thu, 21 Nov 2024 15:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBADC4CECC;
	Thu, 21 Nov 2024 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732204688;
	bh=bM8yvdO52euAiZL2EbvfH106P1GU63TZbKzTB2Ya7L0=;
	h=From:To:Cc:Subject:Date:From;
	b=oliylSwC4OrSdPol+DVzjjMWlHgCKykAWQ7aoqiE/ZAQKuiWkkOT8OGmvxYkmyWMs
	 3odMNp/6K6B83f8Wr19oGNm1indg/FiI27Vgl4tvxNqoNqn0OWXQ9dUTdKP3TaUZZt
	 nUfzore9oTD+L+IrnACvxzzgrJhk7vPDoEPhp4Qd6HVJPYv9dsBmWi/8SmzVEOtNgc
	 aSh7M+rYgjaReVIYUHsOOtquldXsLoEgQg3NBVHDqyxnwJR6m7z7liBt8afx49QLVd
	 hKpXkQeruiKlPjTNztsRDNt+NOk9S4syvSDncIfAjuice3bueZ3zC73DG9/3JkgtgW
	 chuc1AyRdMTjQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/8] [0/8] wifi: ath12k: MLO support part 3
Date: Thu, 21 Nov 2024 17:57:58 +0200
Message-Id: <20241121155806.1862733-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_075809_540123_533F171C 
X-CRM114-Status: UNSURE (   7.30  )
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

We continue refactoring ath12k in preparation for supporting Multi-Link
Operation. For example, in this patchset we modify station state handling and
start to use more link level configuration.

Please review.

v2:

* patch 1: maintain sta state in ahsta (offline change from Aditya)

   sta state is not per link level hence there is no point in keeping it in
   arsta level. Hence move it to ahsta instead. Even mac80211 keeps sta state
   on per MLD sta level instead of link sta.

* patch 1: minor code refactoring and removing redundant codes (offline change from Aditya)

   For ML station remove, redundant code was written in different function.
   However, existing flow code can be leveraged to perform same operations.

* patch 1: ath12k_mac_assign_link_sta(): remove unnecessary synchronize_rcu()

* patch 1: ath12k_mac_free_unassign_link_sta(): remove unnecessary forward declaration

* patch 1: fold ath12k_mac_unassign_link_sta() into ath12k_mac_free_unassign_link_sta()

* patch 2: ath12k_mac_alloc_assign_link_sta(): use kmalloc()

v1: https://patchwork.kernel.org/project/linux-wireless/cover/20241106142617.660901-1-kvalo@kernel.org/

Rameshkumar Sundaram (2):
  wifi: ath12k: add reo queue lookup table for ML peers
  wifi: ath12k: modify chanctx iterators for MLO

Sriram R (6):
  wifi: ath12k: Add MLO station state change handling
  wifi: ath12k: support change_sta_links() mac80211 op
  wifi: ath12k: add primary link for data path operations
  wifi: ath12k: use arsta instead of sta
  wifi: ath12k: Use mac80211 vif's link_conf instead of bss_conf
  wifi: ath12k: Use mac80211 sta's link_sta instead of deflink

 drivers/net/wireless/ath/ath12k/core.h  |   4 +
 drivers/net/wireless/ath/ath12k/dp.c    |  44 +-
 drivers/net/wireless/ath/ath12k/dp.h    |   1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  58 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 985 ++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h   |   1 +
 drivers/net/wireless/ath/ath12k/peer.c  | 108 ++-
 drivers/net/wireless/ath/ath12k/peer.h  |  11 +-
 drivers/net/wireless/ath/ath12k/wmi.c   |  16 +-
 9 files changed, 965 insertions(+), 263 deletions(-)


base-commit: 7c16c77c1c085ed2e14f95b3399fe216e1e42a35
-- 
2.39.5


