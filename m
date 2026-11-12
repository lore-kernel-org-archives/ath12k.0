Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819DD606A339
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvM48TGu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emCHSB4u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=; b=vvM48TGuVc9CMk
	LcTB/0WIcgBoEVzkhlP/veq8vb1Y/htuH9KLqR6dp+aR+NK/Brp1NjOksQYfuTZ7O7MKlXUiqpu/L
	JG59c6LmoUTY5zGhXYFAV3h4P0Jg0hzBAvjaWTcNZdwLdcxbamxlagvLtjMtO5ShhfMyxYMivRn8N
	dAvY3ge1mkcpVyQzV3Mfu3QqluqTW6eek82bcfHYjzFy0c8z8W3si52dBb2e7fgFkB6qAFRW0fHmQ
	rrB83ja/cOnGvKOriGOIai7eAeqLvGssT98Ew5kk+Y5LjFuUGAA6YGQD19/JNUf3YqWo6ZEzae9Di
	NeLxshWmnh4n5cqtEIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSY9-00000009bLF-0wSx;
	Thu, 12 Nov 2026 11:01:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSY4-00000009bJz-0sON
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 11:00:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-491aaed7565so2429176f8f.2
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 03:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481254; x=1795086054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=;
        b=emCHSB4u44m81nCxa4HLeOIbcEVrTzwGee5cNr8pH+bVG6KkNUdRH5i8X8qODN8CH0
         cDZQWWTtfeZlUlJ5xbUUcaB5ziVVw0+cMPsKXoJdlyVtp+tJBpLFUEzsdZ+8kdXODdsb
         TafJ1HRpY43Bmfz2ZvsoiT8R4V5kBdrjG7kWcvP9ZBrQVyy4iqP63jbXdR78QmvmJBPs
         YMv8Yszlkdpfo0Jskcbz+4kXXVNzQ8VITdp/fI+nJVZEc25hwCMqzjL77ynKHCPSc2D/
         pkq8L6B5K9zJGJM35f1357vxyN6uCrVcBR7NMjM9dkxq4D2Usa7vmGzXF+8WM4YV3xe9
         x55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481254; x=1795086054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=;
        b=0J2tafu2pZtrsdu1ZE6l9/WREgnma8e6vwo6Nzpa7vOtJ5Bb169tmB9QeURmSxT4g7
         ADuNSqbFVaF47fJRv1fKtcZUuERaEUyiLuY7pBxmk4UXLVl/mfnG5UoaUELrW8bAxgJQ
         Pv4slq2uL/ZgS2uE1kkQEIy2rxDkx8DjkJtpZvj2y1XKi8mlT2pWI2JveUlrRsU/wAOX
         vdI/ys6lQ0/8HUUluUUJ/Ud6dv7q6XbqM0eNjYi65TTJTrN+xI451G2vPu6DeLD3b7LZ
         2xiy/KbxMkgm97H0lSndDkhOqnrZOAD/BNE328u6JpHg2HsqSYb13Ulbe1vQEj/GifjE
         UQDQ==
X-Forwarded-Encrypted: i=1; AL+hErGntowFX/MGTkKYyqV/JtRLZ+hvv53nKpHkxdzNhp21kNhkFd4Q37ShJwjvYLfW8VnIXcEm7yM=@lists.infradead.org
X-Gm-Message-State: APuU4Z+/XAHBgM98Cpe0EGaolva5/jk9+laBba9xa2bWGuoEg/mMncR/
	0DI5EU94MW8LLu2qZ6saly3S/WsT+9Xx0RTYk5blCbzygbDnhic6ck7RsCSBRJUB
X-Gm-Gg: AYBFou13/qXxitLJdvJGAKadZyt5ILoG8I9jNQW9UHajfAeTr2jB9LUXkdB2cP1ZUN6
	mlsCAMi6YNZX8nd8E851zq5L1mt9td2W3bBSwteYP2kMrH6Qw0o1lYQRDCG9eB8PN0z9oANPBlU
	NFgUxHN2teRJ6XGn2QqA9wxhqqkhZxEJJp8EU9OyoLfgTKSBIpIHqD+Ak1ayk/6cGCd7mj5VEQb
	Q1OdCsqgmWqa75tyb/VF1mirZCn5tYEigMaAclJwidbk8RXYiyLcOujQkVJkj+Fs/79K06tlZE/
	fecnW44m0aSOQeru0ilPpX6pspyzjUikb5WNNqvqtT7hzDiUcHcptOT5I3bYCvADy9I1YLXYh5m
	DXoT35yjcn8NaZEFppljmilg7/9fuI8wLaxL7Gqyf3cPCyCIMC+Syy6716O871AfHXXbFRithHU
	y0/ctqURrvmJJvCsTIXZE7o3Yc/0i4WoFxwHTD/6pJS1+rXe0hBmQ88TltvGTVuO7LNHA94ru91
	jarCkPZpiYhYWY7nLzlDzNJnQeBAooTKNt71QM1JDP5JFHHyxexpUo1DizgYVNZ6yck/jXPXcIe
	zygTK+1f6bXUNkgfBk6t9OAwqdXb+/9uizc+mgQ0TlfyvLPRMW8LyInP
X-Received: by 2002:a05:6000:4011:b0:492:e1a6:90f9 with SMTP id ffacd0b85a97d-499c72712e8mr9950467f8f.18.1794481254158;
        Thu, 12 Nov 2026 03:00:54 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f1772dsm16217812f8f.31.2026.11.12.03.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:00:53 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] wifi: ath12k: disable and enable the CE interrupts only once
Date: Thu, 12 Nov 2026 13:00:05 +0200
Message-ID: <20261112110008.1229-2-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_030057_382915_7EB18A6E 
X-CRM114-Status: GOOD (  12.14  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_pci_ce_irqs_disable() calls disable_irq_nosync() each time it is
called, and ath12k_pci_ce_irqs_enable() calls enable_irq() once, from
ath12k_pci_start().

Without WoWLAN, ath12k_core_suspend_late() disables the CE interrupts
and powers the device down, and ath12k_core_resume_early() boots the
firmware again. If the firmware crashes during that boot, before
ath12k_pci_start(), ath12k_core_reset() disables the interrupts a
second time. The start that follows the reset enables them once, they
stay masked and the HTC control response is never seen:

  ath12k_wifi7_pci 0000:01:00.0: Service connect timeout
  ath12k_wifi7_pci 0000:01:00.0: failed to connect to HTT: -110
  ath12k_wifi7_pci 0000:01:00.0: failed to start core: -110
  ath12k_wifi7_pci 0000:01:00.0: failed to reconfigure driver on crash recovery

The device is dead until a reboot.

Make ATH12K_FLAG_CE_IRQ_ENABLED guard both functions, as
ATH12K_FLAG_EXT_IRQ_ENABLED does for the ext interrupts.

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4bb14a95aec9..c92821153706 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -398,7 +398,8 @@ static void ath12k_pci_ce_irqs_disable(struct ath12k_base *ab)
 {
 	int i;
 
-	clear_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags);
+	if (!test_and_clear_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return;
 
 	for (i = 0; i < ab->hw_params->ce_count; i++) {
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
@@ -739,7 +740,8 @@ void ath12k_pci_ce_irqs_enable(struct ath12k_base *ab)
 {
 	int i;
 
-	set_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags);
+	if (test_and_set_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return;
 
 	for (i = 0; i < ab->hw_params->ce_count; i++) {
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
-- 
2.43.0


