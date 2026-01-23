Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10842D74EEC
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BArbmjiBa6Ohmbx6FKnPpxNrDpx4xGnZ/TyoYHn7A5Y=; b=0r+mQsbFrNM1gMYX2ahQLijRo7
	fDzrJFLrY4dgJU2gNifNIcQetcySTfSvfcQ4r8ZOtMDb2x7Z9C3h6LxDeQ6IpqaYGpxhpF2eB3lg4
	QsGPM/xxmocMH8Ovp58kPZy6Uvk/y2x0Dai0rSL4qweKmDtJPzgbN3UYTi3Dus1R4Xa2XzjVq0EY4
	aJ9kqBt8fwT6QkbvzOHxJbvDAguzke86714yUIRSY/ij9jIJzU5qjYpm/uzt/PL35AUj+aU6PwSZ+
	/nIeeOdYEemflBDJlLBuAr8AzwgHGC6A1FOho5NLwTwOvbJ5mnWjMu2wZsv4WgXc9cv9ioYf89lw/
	AhkNjBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJY4-000000097zk-3Sec;
	Fri, 23 Jan 2026 15:58:12 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJY0-000000097xM-0odC
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 15:58:09 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so1692314b3a.0
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183887; x=1769788687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BArbmjiBa6Ohmbx6FKnPpxNrDpx4xGnZ/TyoYHn7A5Y=;
        b=hS5sdfQ5S2C5T61NAntxtAikFxJDf0HIpJwcEDgwsv3W5kI0MQeiirWAOTk3880eAK
         /Rof4uYWxFZ9bJ/BdYxc1u9UNqjK4QzOfAL1S9lqCgfcf7ey3R8+FcuTml1WzF4RYsY/
         /uXj6VX2kHDr/chr5S6dhM3EPudJK5V0zPfWEixeoIWCoZFlBuOhxWKv14qA1+B9/FG8
         QXGZEGtN5ocaaIFlegzsMyeMkF9q9+qG77FECm2PmzltjC6HMdkycQB/t++Uj0kCLR7W
         bySe3LokGHPcGewPjQ/yJnCoetgF1XoUm/a4iIcJf94mg7sw0VhdrkZVrdourL97TeqE
         AVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183887; x=1769788687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BArbmjiBa6Ohmbx6FKnPpxNrDpx4xGnZ/TyoYHn7A5Y=;
        b=AXrPY6MJyuOfogjk6+cCzmPzo6RhiJL9t8NqeKeuguKx6LO1os+XWcajV5yRKXgTE8
         GC2DDScTs2/eWOsIv52jEPLXTTI+9kidoNRFzduc65i9gN9ZG2WJL8NbQ5zu1MuWYLUq
         Powa4KT8KbhElrgHAt9TNv546SkoIxmYIz2bDmSg7Jjg/Yb90SE2ENN3dh68/CMzYtSp
         LNz+WHali1CxUXE9VafkAZ7baza706Jkt1hnA22VH4CYrFIYvq6KMP/gIqpllziPxuT+
         3FpQ8t3tEqs6qLucnO+WoIngMwj2929SzwBkfmIuYidK5okyX9RPP/WT9HVhjZ/kYxIR
         gktw==
X-Gm-Message-State: AOJu0Ywt3NyAjkQ7nzQBqmAWJrTrVDvJGO3s4cT6P5OB2tvf2xWHvSBf
	N5Fl/l0hkCxoVw8KjBe6yr8u0nthrPabwNZYoQIoiTov2YM5XcY8IOa94e6GISdc
X-Gm-Gg: AZuq6aLOyvncHZLG0kiIBll36RzL1NEiMFoCJp+Hv0s3LQBJx5DdvHs1gacoCaC5eTD
	2GaVHKDH4oZxAPa4pk6fl8KtHfeYaHLr3k4fFB8wYQmjZEd63CEhJJMlW9T32P/Ppoj/zw/+VG/
	ULXZUqrnvfoXMNokGltDE1EKilSu6J0UtrK085l7+mi7tTTCTY6dQM5n0tAycKO4c8sg1Teceg2
	NCl0PSMSf7AL221xI0kqSHkNehBgSJhRwsHQatl1C6SDZ3BbUU4bcKz2cC3F3HgwKXQBcu0M0Bl
	HUZ2P9t0nu663nPDwY/NiIFyOQ/DhMVn121o0/av+ocCPoSzAOGFIATFqVEVSmWK0UJsKuLw3Gw
	sXDfiCqbKG1zmwJnzzpsSjEFwKIX3mV3aONIktGy9RfrGzU/QRskRCMVxhlzKi/AwouqpwbhArG
	ImwbSE86tEtArkB+FL4Q6a2xgB3BDTnjAY+jaJ
X-Received: by 2002:a17:90b:6cd:b0:340:b501:7b83 with SMTP id 98e67ed59e1d1-3536ace1173mr2553134a91.10.1769183886916;
        Fri, 23 Jan 2026 07:58:06 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:dfb6:6b31:aa17:2446])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335206b23sm5489305a91.3.2026.01.23.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:58:06 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] wifi: ath12k: Remove broken frequency range filtering
Date: Fri, 23 Jan 2026 21:27:49 +0530
Message-ID: <20260123155750.6007-5-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123155750.6007-1-bjsaikiran@gmail.com>
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_075808_234553_86454D34 
X-CRM114-Status: UNSURE (   8.05  )
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

Between kernel 6.16 and 6.17, ath12k added frequency range filtering in
ath12k_reg_update_chan_list() that filters channels based on
ar->freq_range.start_freq and ar->freq_range.end_freq.

However, these values are reset to 0 in ath12k_regd_update(), causing
the filter to skip ALL channels:
    if (channel_freq < 0 || channel_freq > 0)  // Always true when end_freq=0
        continue;  // All channels skipped

This results in no channel list sent to firmware, causing 5 GHz Wi-Fi
to stop working.

Fix by removing the broken frequency range filtering. The firmware
itself handles frequency range restrictions based on hardware capabilities.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 2dfcef013277..2d9adc74ac6e 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 			if (bands[band]->channels[i].flags &
 			    IEEE80211_CHAN_DISABLED)
 				continue;
-			/* Skip Channels that are not in current radio's range */
-			if (bands[band]->channels[i].center_freq <
-			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
-			    bands[band]->channels[i].center_freq >
-			    KHZ_TO_MHZ(ar->freq_range.end_freq))
-				continue;
 
 			num_channels++;
 		}
@@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 			if (channel->flags & IEEE80211_CHAN_DISABLED)
 				continue;
 
-			/* Skip Channels that are not in current radio's range */
-			if (bands[band]->channels[i].center_freq <
-			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
-			    bands[band]->channels[i].center_freq >
-			    KHZ_TO_MHZ(ar->freq_range.end_freq))
-				continue;
-
 			/* TODO: Set to true/false based on some condition? */
 			ch->allow_ht = true;
 			ch->allow_vht = true;
-- 
2.51.0


