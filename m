Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F59BD74EED
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzibT8m2ri/6+nQQXOFIdpBUf9O69J4+aJF2V6yb0pE=; b=FFh/oin4IFleBs87LPQ+NnYhLx
	dAqIqd52ZC18ZGWVSvvEvWe06zY9E2KXarDfeWb8FNmVwxtnjTQpzYnf6e/W+GmxHkzyt4FUZ96oe
	dt+IZLcgXYD4DKDhmdGA4FpnYFD9hjVwAJwo3FifTmZ/osdnOlVNlJKQckbtcx8FJz4+gdywI4Clw
	gSi19J2rBDqcxjr9n+54NK07E3/8aqbls/HQWZeb8ho5FaiVXheVl4VstuNy56JnTEGR4+anmtX/G
	dAulXxvtILnacDv73QmwCbcPZPuys33mvpdrxv88OfK9C2BzmDx5cKcDIydoeK8FXK8inUOyDNPdk
	WZ85zXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJXy-000000097wU-14Cl;
	Fri, 23 Jan 2026 15:58:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJXv-000000097ur-2wg2
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 15:58:04 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso1682919a91.0
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183882; x=1769788682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzibT8m2ri/6+nQQXOFIdpBUf9O69J4+aJF2V6yb0pE=;
        b=YM+ZdF1IZl1oRfw925dlbNja3d6Wv8dYHUJf3HY8w4qj24txfWF5498WxMQLbDg7PE
         q1rF0L+81utQ5Tg2KLcYZhsVFQ/AOZcxg+tvHCzYrh8e5zRTWlOggqmkYjx5o+OKvIE9
         a8Mk5ZE9CZB+ktpWTdAZc/mE1P+VmuF2YRZMrRMMIvR242Ts3w2jeOOHSQS2otpMY4ej
         K3HHyBVOfYfvf2+22RybkYJ38Mv+VmQx9329a8NWie8xaEzCJBsTD3HEflft2IuYKTLY
         miIHdD4ybdUhIwzwrF04uXnvYE+lOwWX6OiCGLxGc+KqBw31rlXzo+p1tQT6sSdY7dbX
         vauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183882; x=1769788682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NzibT8m2ri/6+nQQXOFIdpBUf9O69J4+aJF2V6yb0pE=;
        b=j1r3qToJd2Nj4IPV8BHfw/NyXafeOFb0/iIsvElrZSGst5y57SKE9BV8bHGCqBa+s1
         AzUmreZPQBWkHFCxJcmG9l5rBuH0lYhAKtGP5B36E1hLgzNPbZpjY+E/EYv9J54y9W0l
         eHJp3HREXdKxoZykBgziR2DQODQgJdRb9SXE2e2B/ZD/YdPbRG60DQ2hEPqnzMoo0DnI
         pNoq400W2Hwwzpjn4tFquQiml0kPvCzULjjKSMEFILWegR6+9X883tr7Uma/R7EZDgnL
         fzOcF2jopLRBugyCTpTTI8GhwsQ3Ns6kYvtYm87WOE3LwvE9kWnj2tn3anNW8tNiTgv6
         myog==
X-Gm-Message-State: AOJu0YzInlfGObRoC75b2hVbAfc5zcBb+wEPDy8YEC+wOwzo3zbrGeEn
	TjTNF0N/+z++ZGOYb6NFPGqsIwxhoNCMJ2BzgIyvknILFObomiTkkri65NSuFia/
X-Gm-Gg: AZuq6aLn2zP2GikJJG0w7/M1b64HhB0hBgRlJ9Mgkinoz0WRt+lVVGUirtQa3QORHSs
	dq45ZX1HeRvfE18M7flZa3uO/MjI4SFVJPxZ5eLopCibqsiropAVry2SpBZ8mHzbwsIVJG1eAXp
	pw62dSDI8Sgl3rum/atLskioBgCRtfDAtQeSZqnfO0uD/M1qXy4k+q+n6Kb+2T7L0Ftpmy4DbPf
	C8KtVn3kX0AJYDP4oTRZLEdvZ4681OP8gr4JWQWdvKbm4ix/n4PvqlDOd1bdXQ4EM6Hp12BV9bJ
	bdfITrtJUoUMza+HlelRYadtA4fgG5ekEZOnpkhvi5ELhiyXHCVyyWAtBs4G/QpgnY3iXaFqZDw
	lYsN9ewVqoROCh5rPAdv5sE3OAT2BFpBLkpP03Ig+aZCTpX9eo53Nw7xvLd7QGObavnGZn3E/0L
	f5fyHU9zxqgfxvJwOSpz8hD5xeRLgdQd+W/1xi
X-Received: by 2002:a17:90b:3503:b0:341:ae23:85fd with SMTP id 98e67ed59e1d1-35367025551mr2841157a91.11.1769183882420;
        Fri, 23 Jan 2026 07:58:02 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:dfb6:6b31:aa17:2446])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335206b23sm5489305a91.3.2026.01.23.07.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:58:02 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] wifi: ath12k: Initialize regulatory frequency ranges to avoid filtering all channels
Date: Fri, 23 Jan 2026 21:27:47 +0530
Message-ID: <20260123155750.6007-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123155750.6007-1-bjsaikiran@gmail.com>
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_075803_760495_5BEDA76E 
X-CRM114-Status: UNSURE (   9.34  )
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

Commit 657b0c72c4ad ("wifi: ath12k: Fix frequency range in driver")
added reg_freq_2ghz/5ghz/6ghz structures to intersect regulatory
frequency ranges with hardware capabilities. However, these structures
are never initialized for devices with self-managed regulatory (like
WCN7850).

The WCN7850 firmware manages its own regulatory domain and never calls
ath12k_reg_build_regd() which updates these structures. This leaves
them at {0, 0}, causing this logic in mac.c:

  freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_5ghz.end_freq);
  // freq_high = min(6000MHz, 0) = 0

Result: ALL 5GHz channels are filtered out and 5GHz WiFi is broken.

Fix: Initialize reg_freq_* structures to full frequency ranges in
ath12k_core_alloc(). For devices with proper regulatory domain
updates, these will be overwritten by ath12k_reg_build_regd().
For WCN7850 with self-managed regulatory, these defaults allow
channels to work.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302
Fixes: 657b0c72c4ad ("wifi: ath12k: Fix frequency range in driver")

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 4121dd14bbcc..99c26ba01304 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2290,6 +2290,19 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	ab->qmi.num_radios = U8_MAX;
 	ab->single_chip_mlo_support = false;
 
+	/* Initialize regulatory frequency ranges to full range.
+	 * These will be updated by ath12k_reg_build_regd() when
+	 * regulatory domain is set. For WCN7850 with self-managed
+	 * regulatory, firmware doesn't call reg_build_regd so we
+	 * need sane defaults to avoid filtering out all channels.
+	 */
+	ab->reg_freq_2ghz.start_freq = 2312000; /* 2.312 GHz */
+	ab->reg_freq_2ghz.end_freq = 2732000;   /* 2.732 GHz */
+	ab->reg_freq_5ghz.start_freq = 5150000; /* 5.150 GHz */
+	ab->reg_freq_5ghz.end_freq = 5945000;   /* 5.945 GHz */
+	ab->reg_freq_6ghz.start_freq = 5945000; /* 5.945 GHz */
+	ab->reg_freq_6ghz.end_freq = 7125000;   /* 7.125 GHz */
+
 	/* Device index used to identify the devices in a group.
 	 *
 	 * In Intra-device MLO, only one device present in a group,
-- 
2.51.0


