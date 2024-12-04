Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94761E77170
	for <ath12k@archiver.kernel.org>; Wed,  4 Dec 2024 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RPGf5wmuP3yoOo6oazWS7lAG4nFLI5pzMFVnyDgcb7s=; b=Jps1jo5uHebMTXUnANuWP1c+j3
	xUn/2wvZ8SAC/GnNRXfPBbuAYCQtw8bs0U+9U1WrTK0XiwkEEEgHtVuL7Lz7jK1nG8nC+D6E7KJ0J
	ZjJo4teBgT1IroL37Zdf1n0xFnNDmklAAB0JRJp99HGJwFzny25I2Cg2EaJTAPmDEpG1cdGYyDH/a
	Oq2v3oiMYFZ73cD4xqo4OQMpkwVhtSUbQZXEITdlM4yEqBFFpxdb9Y2ZgvxtcA4tb1pZU4LhyQbqq
	GPRIymjNbBDsJLcBLU/5uklMHl9+xx5Nqtidd7UIJ1ipylRcwbLOBAlB5NVwnHa5gI9QH0Op9Ru0X
	NXIGIimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIZ-0000000DCSE-1X0R
	for ath12k@archiver.kernel.org;
	Wed, 04 Dec 2024 16:32:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIX-0000000DCRB-0bWI
	for ath12k@lists.infradead.org;
	Wed, 04 Dec 2024 16:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5585A41885
	for <ath12k@lists.infradead.org>; Wed,  4 Dec 2024 16:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D19C4CECD;
	Wed,  4 Dec 2024 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329939;
	bh=OwPJmCes64j6esiKcT95YSy4YtWsyeSNOeyY0UC2m8w=;
	h=From:To:Cc:Subject:Date:From;
	b=D08VRphcW4iFvMr4oB7zjcIWFALSwt0n8pnLpt+aW9rqfkkA5UTPzVOFf4mnrdh47
	 7ZcVDajUXkbuiky0FDLbC0abuDILbnyaKfTtLeVLZ58j73H7P5a0pple829UhAZTWn
	 UNbBhdk3ckZsE7/wkR8aIMcHp3jbLP3QL0RChNqnuA2yJh6pbyEsKnLmY8BPABXcr5
	 dPlPFgg09kPgZl94GyV+N1efslQbY3J/o7NvxdmbZaPYaP46rQ2+z8jyhyvKulKjFp
	 xo3DL5MOle+yrSaXgL+VlAnjudiTefszcW2eQiM9jS3tI6NQ0A5ySmDIwb6uliDl2z
	 rgPOFk6MqpGCQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/7] wifi: ath12k: MLO support part 6
Date: Wed,  4 Dec 2024 18:32:09 +0200
Message-Id: <20241204163216.433795-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_083221_244169_F0797FDC 
X-CRM114-Status: UNSURE (   6.62  )
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

In this patchset there's refactoring to support hardware grouping, meaning
multiple hardware devices can be registered to mac80211 as a single device.

Please review.

Aditya Kumar Singh (1):
  wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp

Karthikeyan Periyasamy (6):
  wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to
    ath12k_mac_register()
  wifi: ath12k: introduce device group abstraction
  wifi: ath12k: refactor core start based on hardware group
  wifi: ath12k: move struct ath12k_hw from per device to group
  wifi: ath12k: send QMI host capability after device group is ready
  wifi: ath12k: introduce mlo_capable flag for device group

 drivers/net/wireless/ath/ath12k/core.c | 449 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/core.h |  88 +++--
 drivers/net/wireless/ath/ath12k/dp.c   |  19 +-
 drivers/net/wireless/ath/ath12k/dp.h   |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c  |  97 ++++--
 drivers/net/wireless/ath/ath12k/mac.h  |   9 +-
 drivers/net/wireless/ath/ath12k/pci.c  |   1 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 123 +++++--
 drivers/net/wireless/ath/ath12k/qmi.h  |  20 ++
 9 files changed, 658 insertions(+), 150 deletions(-)


base-commit: 3b2ab397d31f926523f2781d7f0a14a387415bf4
-- 
2.39.5


