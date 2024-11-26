Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905FBD6552F
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PkFLVbLgKzzb420QBaM0xJJx46lvaMjrDcum7tMeMiA=; b=LSs/Wp6vcPtrGjyAkZfwZVt81+
	zPeJmNDTGh+MBBrmbQ8J0nQ6aMhW6w0Hvpjt/2s0SHyCbr8m6e/J4IGOzDMlPUyF8KfqB1p5zpcR8
	cVnM30YcRF5d4a8oMJ1fWV57vFGRAPveaRodblNq2A8RcxmT0MjB3/EkBn6JLrXTHscrPx9uB+YHi
	aGJVHhL+jh8+Utw1M2mwKCegjpbb7/4u7Mv7Oq7ey0NuM+j/gsbrm7P/UXIspUXMBdh7wONVfdYAE
	Q3dR+isheszBNWWsDXyzYlGmWpl572G4OwGCSm9R9V2NsKA5Xr2O1HeYlo4iPz6wfGpupEEX8Q1/V
	eJbanztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6O-0000000BGFh-1M3X
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6F-0000000BGBi-2Lmx
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B6905C5C2F
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB99EC4AF0C;
	Tue, 26 Nov 2024 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641102;
	bh=AAy/l7FVAB7w48Gl+7z8EDq9uVuCICPeTvilR4EL6Ck=;
	h=From:To:Cc:Subject:Date:From;
	b=fPd0bfSpMYDrEt8Rk628FpdopH7LFr4W51QnQlyFh71qkE1JCfSUh/KjuG62Uk1XT
	 IXWU1c9gU4BDNijNksERwN6PDWp4QoqaENOJFyh2uTp7olXpT7FfCJu2fnpS8xi0JR
	 31zgs+KdnhlbT0cEWKK5x21QJhuXzlAD6H5uHro9gr7MX6XsBq/P0W3QnDC33AcBwD
	 1XpbF2SbD6X1yPTSg6uZiiyQ3jJVxxj6dW95WZzNspQcOQUay57kdiXaDtY4FOxgdm
	 3KFwaQ+5jpUjgc4ddKxnAfy58MUu6IZCKoe0lb/QLSqupCeopCNK3QbnGbdLs1yoRd
	 QxKb0mqk3Xb6w==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 00/10] wifi: ath12k: MLO support part 4
Date: Tue, 26 Nov 2024 19:11:29 +0200
Message-Id: <20241126171139.2350704-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091143_639298_EEE5774E 
X-CRM114-Status: UNSURE (   4.38  )
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

Here mac.c refactoring continues but there's also few fixes included. Please review.

Aditya Kumar Singh (1):
  wifi: ath12k: ath12k_bss_assoc(): MLO support

Kalle Valo (3):
  wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct
    wiphy_work
  wifi: ath12k: ath12k_mac_op_set_key(): fix uninitialized symbol 'ret'
  wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided
    link id

Rameshkumar Sundaram (2):
  wifi: ath12k: ath12k_mac_station_add(): fix potential rx_stats leak
  wifi: ath12k: defer vdev creation for MLO

Sriram R (4):
  wifi: ath12k: ath12k_mac_op_tx(): MLO support
  wifi: ath12k: ath12k_mac_op_flush(): MLO support
  wifi: ath12k: ath12k_mac_op_ampdu_action(): MLO support
  wifi: ath12k: do not return invalid link id for scan link

 drivers/net/wireless/ath/ath12k/core.c  |   6 +
 drivers/net/wireless/ath/ath12k/core.h  |   6 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c |  36 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h |   6 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 436 ++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h   |   6 +
 6 files changed, 371 insertions(+), 125 deletions(-)


base-commit: 175616a7658cd5d53389d1f9c1ce22debd4595a5
-- 
2.39.5


