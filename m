Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA62D44D75
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KpP+hMgxQ2/Cn4HOLlPljGYxdV6fRSe46RkiQoL6WMc=; b=OLuRCuPzAjRtxTk9TzAe+L80T9
	AbicmILYox2Wmo/brsO3bPiTgaagrwgF0rkuVW2Q0pG+kGU6EG59x34vu9+Y9OAsmVCL/2DYCqG1+
	gDKJe1delxIY6cSucxHTA+4l7duXvAt1V4cqoli0auPJObA3iByXFwR1yRPy7fld0UftL3U2tgyJV
	Arp3mgk76krPiIUuXRzfi5YeS/e2/8P7SJjmGe9qb8GKQBohMlPD3f+Hovzgcx68AK5tsfhreCkpr
	wlQ+VCEABmBgRSB6jGexZvDk9G1O+/8nC+/Q75p6B1FESKzh0xOOLf/ZiwDZit2FkBBYsNCIhPsBX
	EEV7s5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h1B-00000003bPj-20t1
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 14:28:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gzG-00000003axQ-0a2P
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 14:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5A75A43D9F
	for <ath12k@lists.infradead.org>; Wed,  6 Nov 2024 14:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC81C4CEC6;
	Wed,  6 Nov 2024 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730903180;
	bh=D1YYTFPj2QFVAITbV4+lhQ1jReiar+IinCTKBPU40y0=;
	h=From:To:Cc:Subject:Date:From;
	b=pf8Dz24jqa2mQ+A4A69SSUiBR2yfhtK7JHq5beqdYbhjVQcr2UPSVQNYYX1qC/l57
	 ggO2/eAgEe7VN/EJRmGGnOpnrv5dVSl0X3jRHQaLXomoIblC081f0n0cxWn3NFvPK0
	 RF8EJ6rszWJKNIUtInNgqkNzcEg5qQ56sU25sS/B6bZkArT+nObMvpCL6guSNg83Zx
	 H4mGr7Kx0QMRP8ISoRowPphu0invI1VJymAQDd7VpIBA03z9bYY0KnOSwdl4myDV5K
	 Zpw8ZxGDdWd0gZi6CBFZo66TJjuRGvlzVMcYIO/wU8IqeIpkIw18gfJv4BMkrph6dd
	 47nRwx20qEyrQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/8] [0/8] wifi: ath12k: MLO support part 3
Date: Wed,  6 Nov 2024 16:26:09 +0200
Message-Id: <20241106142617.660901-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_062622_262548_5B8EBE4E 
X-CRM114-Status: UNSURE (   6.47  )
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
 drivers/net/wireless/ath/ath12k/mac.c   | 993 ++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h   |   1 +
 drivers/net/wireless/ath/ath12k/peer.c  | 117 ++-
 drivers/net/wireless/ath/ath12k/peer.h  |  11 +-
 drivers/net/wireless/ath/ath12k/wmi.c   |  16 +-
 9 files changed, 987 insertions(+), 258 deletions(-)


base-commit: d63fbff74ab1af1573c1dca20cfe1e876f8ffa62
-- 
2.39.5


