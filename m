Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB62C369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ax4rJeZalogOj8wIoY/TFwkI03ahXbhPQLwzXY9UpSs=; b=JECboIGwbF0Dt1
	fkfvrBmyXAeTrG7QSIo40K5PWTQ7FcBNQ1ESRzz1uf3RYuvpCyKW7vp6ac4Q1dWsbk1wUMZz8cIde
	02uKHt0AC8jX6AUffBhqLeRtRxajQBL9UZfybxXRfIdlVSVhAElURtLZODR0FCrZON7ZuD5KdTQ7U
	clUjpSsV2zkgL4YTVcLrCmlhasBFJVtA6ZWlehG4l7dZhi6/T51OAF1T1osPYF9kAv8MntHw6CdHb
	Aduky0zn2NzKxpeLGJ+a9+esgQkvZHppk4Roi7NZze2K3rtgk22Wpk7Ze4HVP8nzu0B1UNwYz6uN7
	KWq5040wMOuh53kVkCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAf-0000000D7NH-0Nyj;
	Thu, 17 Apr 2025 13:20:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAN-0000000D7HR-0wuw;
	Thu, 17 Apr 2025 13:20:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744896028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ax4rJeZalogOj8wIoY/TFwkI03ahXbhPQLwzXY9UpSs=;
	b=dx+USYBaLx2I8Gdx4jaFGW21JHYSvZVQrMa5rF24bMOqGyQaCRgOzg0x0adtoH5JsOf47v
	2hJnYdYFooJcZxCWeTw2EPrM4awrBlwYJW2xB5R5gYeSnqutuy2HT9AwFj8PqePW5X34C3
	NqLOaNdSQv97cS0V2073siV4AMC/9KiZA1RP5999vF5i99jwHTR0VwpD6HpAolWxL2W4eb
	PPm2n0L+wUt9QO1jEe3nthl4ZXhQyYMLM1sBmPvS+T5q3lcUazqEogUeikY/16l71r+tc4
	nVLZ9cHWKGQqqsO8t4usyVnssXaNuO1fcSf78zFdsP3LUrWJ/Sk27C0zCwyqZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744896028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ax4rJeZalogOj8wIoY/TFwkI03ahXbhPQLwzXY9UpSs=;
	b=Qaj+PmDOxeik8no8OOe9lbHhu7DdF7oqPucBcoWuTLQSfomc8hZvaWFmgzLnJx/muwN01O
	PloGeSH7pFB+TZDw==
Subject: [PATCH ath-next 0/4] wifi: ath: Don't use %pK through printk
Date: Thu, 17 Apr 2025 15:19:06 +0200
Message-Id: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMr/AGgC/x2MwQqDQAwFf0VybmDd1Ur7K8WDuM+ayypJKIL47
 932ODAzJxlUYPRsTlJ8xGQrFdpbQ/M6lTdYcmWKIfahawdWmKvMjsz7JsWhxpOv3C1xePQppHT
 PVOtdscjxP7/oJxQcTuN1fQHjFTh/cwAAAA==
X-Change-ID: 20250417-restricted-pointers-ath-4f279530336d
To: Jeff Johnson <jjohnson@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 wcn36xx@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744896028; l=2034;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=USJc9JCGJMae1BOrGUqYC9Qw2zxqsi9K4Px5b2V9oIE=;
 b=4aoFpAS7vIBaF9DayfeaPUa3K8Y5PLpmCpvBRYmcVCoc+zcl7IawUrjWZAlS1Ft2aLcp1igtX
 zxE18fWrB/kCfXWYMg4nMCS/vnn8USOet1o2Ez+oHcqdiricl6fnoxv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_062031_405179_8BBDB8E6 
X-CRM114-Status: UNSURE (   6.35  )
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
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

These patches were originally part of
https://lore.kernel.org/lkml/20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (4):
      wifi: ath10k: Don't use %pK through printk
      wifi: ath11k: Don't use %pK through printk
      wifi: ath12k: Don't use %pK through printk
      wifi: wcn36xx: Don't use %pK through printk

 drivers/net/wireless/ath/ath10k/ahb.c       |  2 +-
 drivers/net/wireless/ath/ath10k/bmi.c       |  6 +++---
 drivers/net/wireless/ath/ath10k/ce.c        |  4 ++--
 drivers/net/wireless/ath/ath10k/core.c      |  4 ++--
 drivers/net/wireless/ath/ath10k/htc.c       |  6 +++---
 drivers/net/wireless/ath/ath10k/htt_rx.c    |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c       | 22 +++++++++++-----------
 drivers/net/wireless/ath/ath10k/pci.c       |  2 +-
 drivers/net/wireless/ath/ath10k/testmode.c  |  4 ++--
 drivers/net/wireless/ath/ath10k/txrx.c      |  2 +-
 drivers/net/wireless/ath/ath10k/usb.c       |  4 ++--
 drivers/net/wireless/ath/ath10k/wmi.c       |  4 ++--
 drivers/net/wireless/ath/ath11k/testmode.c  |  2 +-
 drivers/net/wireless/ath/ath12k/testmode.c  |  4 ++--
 drivers/net/wireless/ath/wcn36xx/testmode.c |  2 +-
 15 files changed, 35 insertions(+), 35 deletions(-)
---
base-commit: cfb2e2c57aef75a414c0f18445c7441df5bc13be
change-id: 20250417-restricted-pointers-ath-4f279530336d

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


