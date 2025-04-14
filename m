Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15D8C369B2
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 08:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jrc9Yy1PzgCFjX+NHqHe/gPvbxLEMwfRYZpvhZ/FS0A=; b=HFPLvICOiVAAMK
	aQeHnG8K1iHpTPdn77Ins57hRhUTQHwpQR0TZUwde95tN23YcxPuSr8F3yN6Ny8gx2F9ijRaZL+U6
	EZ30vMBtLZ5Q7BkVFCHI1X9zly2dOYFWRpD7zK6o9yO/bFTron4mwKI4lL95jFX0FIkLYlQijhuo7
	2rQvcqoDmSXp4ecWgyGUeMeKUHHLmK9DjlM8axm/adDSgVzS3Bv7mP4Wt29xw9kyOgsgb/Y1iKZPC
	7L8lZw79mZ8kZShwx3n/0TlwaujyHu0cxlV5l1xzufrYctaEJvdzonc4/Qo7s4DzG1+SoxevOi/ly
	DZYG90GrQh0s08GjdkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F91-000000014W9-2XAP
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 08:26:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4F8y-000000014TP-2bI5;
	Mon, 14 Apr 2025 08:26:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744619173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jrc9Yy1PzgCFjX+NHqHe/gPvbxLEMwfRYZpvhZ/FS0A=;
	b=yk3WhpFdZmssQZ72lhB1qTZyyfyRxUMGb509WQ1XvYBshseihS05xwBznxHhRaTSuvl2/r
	EV94ezp88ycSGWp7iOyTpqrj5t+3wGtxAiaM9vEX47RmKk5P48wS0XMSxxBOdg/4jJqAHD
	iHBl8abWHKqitQ+lC99k0cGXVhaRkjhGljSMANJ78YhV8KbI3RqgpbXkvKd92G5a9GW2nS
	tIBmRwss1Fuv6LjD9Y7xqZj8VGTlEtB6qHwYn6Tlye1uu66CfvxVl6aULoNDAziN+j01pg
	XkPcQInqq/spXCdJv9D13D3LtBdTdeebkK0YlMI2cFrQF3INyTTmpgSTQMASeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744619173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jrc9Yy1PzgCFjX+NHqHe/gPvbxLEMwfRYZpvhZ/FS0A=;
	b=ZUTVDh8TwrC2G20/dfmdoIzBLROL3SA9B70xNJai5NOfSK/ZlnlfAJyXQYz/eR/yLSEC1D
	jaRVzn4m4tTolrBQ==
Subject: [PATCH net-next 0/7] net: Don't use %pK through printk
Date: Mon, 14 Apr 2025 10:26:01 +0200
Message-Id: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJnG/GcC/x2MQQqDUAwFryJZN/C1CqVXKV3Iz2ubTZQkFEG8u
 79dDszMTgFXBN27nRxfDV2sQX/pqH5me4NVGtNQhqmMZWRHpGtNCK+LWsKDDcnzrYpIuWKSnlq
 9Ol66/c8P+gmGLel5HCeLK549cwAAAA==
X-Change-ID: 20250404-restricted-pointers-net-a8cddd03e5d1
To: Jeff Johnson <jjohnson@kernel.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>
Cc: ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
 linux-rdma@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744619172; l=2519;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BORzOQMujEQoEZ1/2bV+p8+YHtYSGgUIbSUnDvITbw0=;
 b=nygQqQzI+POOkmd4HUPMbkxcLkdDeVe3FLi1mMvmt2xMpHokr9kq0+dmMGqAVzLbgbGctLw7P
 7VQYQJVB0MyCdd69OEvNE7wWyCtsM12NiJoSol6jf5d2f/1FWxdOYwI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_012616_796900_D9268B7B 
X-CRM114-Status: UNSURE (   7.34  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping looks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.
There are still a few users of %pK left, but these use it through seq_file,
for which its usage is safe.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (7):
      wifi: ath10k: Don't use %pK through printk
      wifi: ath11k: Don't use %pK through printk
      wifi: ath12k: Don't use %pK through printk
      wifi: wcn36xx: Don't use %pK through printk
      wifi: mwifiex: Don't use %pK through printk
      ice: Don't use %pK through printk or tracepoints
      net/mlx5: Don't use %pK through tracepoints

 drivers/net/ethernet/intel/ice/ice_main.c          |  2 +-
 drivers/net/ethernet/intel/ice/ice_trace.h         | 10 +++++-----
 .../mlx5/core/sf/dev/diag/dev_tracepoint.h         |  2 +-
 drivers/net/wireless/ath/ath10k/ahb.c              |  2 +-
 drivers/net/wireless/ath/ath10k/bmi.c              |  6 +++---
 drivers/net/wireless/ath/ath10k/ce.c               |  4 ++--
 drivers/net/wireless/ath/ath10k/core.c             |  4 ++--
 drivers/net/wireless/ath/ath10k/htc.c              |  6 +++---
 drivers/net/wireless/ath/ath10k/htt_rx.c           |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c              | 22 +++++++++++-----------
 drivers/net/wireless/ath/ath10k/pci.c              |  2 +-
 drivers/net/wireless/ath/ath10k/testmode.c         |  4 ++--
 drivers/net/wireless/ath/ath10k/txrx.c             |  2 +-
 drivers/net/wireless/ath/ath10k/usb.c              |  4 ++--
 drivers/net/wireless/ath/ath10k/wmi.c              |  4 ++--
 drivers/net/wireless/ath/ath11k/testmode.c         |  2 +-
 drivers/net/wireless/ath/ath12k/testmode.c         |  4 ++--
 drivers/net/wireless/ath/wcn36xx/testmode.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/pcie.c        |  2 +-
 19 files changed, 43 insertions(+), 43 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250404-restricted-pointers-net-a8cddd03e5d1

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


