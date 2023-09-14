Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF19DCA5506
	for <ath12k@archiver.kernel.org>; Thu, 14 Sep 2023 04:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pg+B3Wv0Wvqbwcd+h4IyFK8tpgjV3PrqfqWdWPh0gq8=; b=IPWGTBDqU9KGko
	FEzdGaMBEZgAWUbFxfWap/5Rw5aHJqaFgldTlx4h4SM6GGEPB65NfXcM6Lg+pvkjpeqhU8B7syZmC
	CK3vek2U0DxXLG20xR60nkxfJp5URWX7vEjilmsy3YaS/ZX62NNjKZbqN9Ax+oayec0iCmj2Aj8VW
	REKHI6X0rtgPwqhII0JznHFfNNklGehztqm6bBTUARwkCroJjPcLj0a24gy17Ukk+LbRmCVO6dpxn
	uqau72i4umuE6uH+FaRHSmkyqG+NtPkklT47s/nnHB2Kk6Rop0pPcmaEV8giszUFhQgqhEGKV4zLs
	QYvJLC+4QDFCtsHxcdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgdbI-007Jas-3C
	for ath12k@archiver.kernel.org;
	Thu, 14 Sep 2023 04:05:08 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgdbE-007JXe-0D;
	Thu, 14 Sep 2023 04:05:06 +0000
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 2ED14606080E2;
	Thu, 14 Sep 2023 12:04:17 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Wu Yunchuan <yunchuan@nfschina.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	jirislaby@kernel.org,
	mickflemm@gmail.com,
	mcgrof@kernel.org,
	toke@toke.dk,
	afaerber@suse.de,
	mani@kernel.org,
	chunkeey@googlemail.com,
	loic.poulain@linaro.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: johannes.berg@intel.com,
	syoshida@redhat.com,
	alexander@wetzel-home.de,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	wcn36xx@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	kernel-janitors@vger.kernel.org,
	Wu Yunchuan <yunchuan@nfschina.com>
Subject: [PATCH wireless-next 0/9] Remove unnecessary (void*) conversions
Date: Thu, 14 Sep 2023 12:03:16 +0800
Message-Id: <20230914040315.1169121-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_210504_315145_3660450F 
X-CRM114-Status: UNSURE (   4.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Remove all unnecessary (void*) conversions under the directory drivers/net/wireless/ath.

Wu Yunchuan (9):
  wifi: ar5523: Remove unnecessary (void*) conversions
  carl9170: remove unnecessary (void*) conversions
  wifi: wcn36xx: remove unnecessary (void*) conversions
  wifi: ath5k: remove unnecessary (void*) conversions
  ath6kl: remove unnecessary (void*) conversions
  wifi: ath10k: Remove unnecessary (void*) conversions
  wifi: ath12k: Remove unnecessary (void*) conversions
  wifi: ath11k: remove unnecessary (void*) conversions
  wifi: ath9k: Remove unnecessary (void*) conversions

 drivers/net/wireless/ath/ar5523/ar5523.c      |  2 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c      |  6 ++--
 drivers/net/wireless/ath/ath11k/dp.c          |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       | 13 +++----
 drivers/net/wireless/ath/ath11k/hal.c         |  8 ++---
 drivers/net/wireless/ath/ath11k/hal_rx.c      | 17 ++++-----
 drivers/net/wireless/ath/ath11k/hal_tx.c      |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c         |  4 +--
 drivers/net/wireless/ath/ath11k/spectral.c    |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c         |  6 ++--
 drivers/net/wireless/ath/ath12k/dp_mon.c      |  6 ++--
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c       |  2 +-
 drivers/net/wireless/ath/ath5k/base.c         |  4 +--
 drivers/net/wireless/ath/ath5k/pci.c          |  4 +--
 drivers/net/wireless/ath/ath6kl/main.c        |  4 +--
 drivers/net/wireless/ath/ath6kl/txrx.c        |  2 +-
 .../wireless/ath/ath9k/ath9k_pci_owl_loader.c |  2 +-
 drivers/net/wireless/ath/ath9k/common-init.c  |  2 +-
 .../net/wireless/ath/ath9k/common-spectral.c  |  2 +-
 drivers/net/wireless/ath/ath9k/debug.c        |  2 +-
 drivers/net/wireless/ath/ath9k/hif_usb.c      | 10 +++---
 .../net/wireless/ath/ath9k/htc_drv_debug.c    |  2 +-
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 36 +++++++++----------
 drivers/net/wireless/ath/ath9k/htc_hst.c      |  2 +-
 drivers/net/wireless/ath/ath9k/init.c         | 12 +++----
 drivers/net/wireless/ath/ath9k/link.c         |  2 +-
 drivers/net/wireless/ath/ath9k/pci.c          |  6 ++--
 drivers/net/wireless/ath/carl9170/usb.c       | 10 +++---
 drivers/net/wireless/ath/wcn36xx/dxe.c        |  6 ++--
 drivers/net/wireless/ath/wcn36xx/smd.c        | 20 +++++------
 drivers/net/wireless/ath/wcn36xx/testmode.c   |  2 +-
 32 files changed, 95 insertions(+), 107 deletions(-)

-- 
2.30.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
