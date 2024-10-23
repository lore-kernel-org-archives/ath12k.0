Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09287CF5389
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hSZRAUUxvzE2UoSI3/ADa7pmTuX9efj2/6KQ/B3y+ik=; b=LGat1shFBLWexE3NjZ1ddzIsv2
	L3PQ7ZluGXV9KSbCkmte1oqz0/P1fvyWsgMhOTB+lhqk663xFtPKmMWWE0U9nx+iusuo+nOYsefqr
	qY2x1r30MXZ+ZMvfIdXE8nwqctkV3XK32jbhncYh3lALnu4PRguVidqNLtUA9rckWw4XqBtVnClTe
	WadCTTR1VbAA8+3TZtwtvR0b2mDZ9fT/9xGWsz+k/xd9cB0CHX+d/y+hTsivyxhvoq3TbbTNl59Ds
	AWgHaNk+anOnb0uZ6ceOQTdEvTH1B233pBjSF0cGP44Oc/WAGhoAa68atZu3Lf66zmN770iEeeSre
	zqI9Lv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bRC-0000000EY3u-28IZ
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 13:30:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bR9-0000000EY1w-2VGg
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 13:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E3F25C5EFB
	for <ath12k@lists.infradead.org>; Wed, 23 Oct 2024 13:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CCDC4CEC6;
	Wed, 23 Oct 2024 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729690206;
	bh=KzfdCutraSKk7TQKn7xHj6fp9X+8C3/UZsKA361PAr4=;
	h=From:To:Cc:Subject:Date:From;
	b=iWeyV9UriULztfGcMuJN+LQtP6dT8oQYrih/6Yw/Qoo/zIenMJGLWHP8nT0UuhB1g
	 dFKoh0caWEMCilryo5+xhdUTrWU8NwpcCU1/dYRki0wgNJsTsPnzA3kq08OzaKiIqE
	 n8xGGLVNyX2uAuat4aPaJarF+uZE6iEpSeFHoi8aRfvyZfJGxZ9/za9f5wXU0SwPmR
	 fr+zkw5s4Mej7oYdXHkMZGJuJpP6nQjFabd9EgbbbiAxZU04R6jOy4ij77b0mCMQd2
	 ZeT3eYdMPlY8LdZ2ZLW3DeF9W60/9AAxmdPqdqI6XB+t6cKOua7Q1PPCl5/cy4hD0a
	 jjeBFYT7JDwqQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/8] wifi: ath12k: MLO support part 2
Date: Wed, 23 Oct 2024 16:29:56 +0300
Message-Id: <20241023133004.2253830-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_063007_775589_14D6F938 
X-CRM114-Status: UNSURE (   6.18  )
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
 drivers/net/wireless/ath/ath12k/debug.c |   4 +-
 drivers/net/wireless/ath/ath12k/debug.h |   5 +-
 drivers/net/wireless/ath/ath12k/dp.h    |   2 +
 drivers/net/wireless/ath/ath12k/mac.c   | 505 +++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/peer.c  | 116 ++++++
 drivers/net/wireless/ath/ath12k/peer.h  |  10 +
 drivers/net/wireless/ath/ath12k/wmi.c   | 191 ++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h   | 126 ++++++
 9 files changed, 860 insertions(+), 124 deletions(-)


base-commit: fa934bf3e0a825ee09f035c6580af513187d59a2
-- 
2.39.5


