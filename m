Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC9860A2639
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3flXBXE3;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=R5QDyezQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=; b=3flXBXE3mSP6Ah
	2LNWSldPLeG0WWE1qoSq+zwsUO4/SVlzJZhpRURYqZE62G2+qSiqh54FEnOD3UOmtmclWdZn0ODwY
	lccw55IESZDWVMInLsk5DgmMyh1LQzbmRTb6fAgtUvAHTwpY0qAgUhkQ8u4hzzIjCiXHNNtDGsJct
	xpvnk4EOQ9QRPhXzIilB3Lw9c0pRyZecaITmxj28No6gOnlUfZ6mJhyazn+Yaqp4NS+Q0RZ/sjEBX
	RFGD9l7jieQvaZUa32vq57NGMET2AdBCejlqOUNO/Mz/eupwseHcyVAtWnms1TWo9dMddwW6UOepM
	hbagFZwpoEz08+neOrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtp-00000000wPM-0NvQ;
	Sat, 28 Nov 2026 16:03:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtk-00000000wIY-3mfN
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:38 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c50e26763a4so533847366b.1
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881815; x=1796486615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
        b=R5QDyezQVQFXQM4cz7Bp3IK0ov0Nn58v4OqYGJqzQFg7MPh9hVmNVaR9CqIeltUtWp
         f/7lts+aoGt0IBeeP5NANKvejDOhRQmhF8ULrZ/vqW2tsbqkhyM0VNpHtDtIpjyTicSJ
         XvKAmD/MFBBn71/4Dq/ktTtEaS6meKyj08ACHgqhsLpHpotOyllfTViyX41xp67ifDtv
         wW++yrgVNUcjpBArbMJ5vuIHM58La6T2xOjH8tmUIAcYkPynV4orFHW3TMWUI+XxFVzL
         qkf4yIk90j7xU87QLAKoFNZpTe0U7kYlCf4P0y9RPOflbthiSAiVrNbEakc8UAVApDqx
         4g0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881815; x=1796486615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
        b=o22jU+ISyrCpOXpuAh9OT7yVTa8PlBuxZi2ND+abGrqyyObwvaHiW6j8uU+k12bUxr
         A4PgESDW6MRttpR4VVOk/nJwShDKwHUJ5lEBkfAKhklNAWyE9ImrxIRmh5z2uB51PQY9
         cTEin0JZ8rVJru4Rk/h906fwelHfEnEy0rMFq0+IanmIlgPnDfqGHEm3peTuHmRx1lXm
         tIR4uNZ/3xp6FYITqXEr+nM8QTdYyI/ChQ7qsbPd4xwLwipo5APBdiopUsg3t43IbY1D
         9/WF4WxBHWJwGcpM8CGhb1gjeLNjNG4mPKTOpM7e0wP5Fjh8LVcU8nwQt+G9LF+sx+6Z
         v0+g==
X-Forwarded-Encrypted: i=1; AL+hErHp3CAjYy8dUoK3rBrV98ZtEznp2xGe+SxvAwzW1kHixlGPwOh/v+Yib+KIWEreDtQNvEmaTvA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+HMu0NQu9PAJbmPA8dtdtUVNsoEYIEDUH3TiBlSzO/VKfUa0TQ
	sq/Hlj8eI8PnlAbBqHoM/MPKR/Pzs1fpuo3iT0jCWoNwU2nNCB74ADiuiYJhC62fIA==
X-Gm-Gg: AZFdTZflYt2zjEWmlPk1R4iI7mOzVLtoWiv3coxvBwNStjCbEberOu+TocSBx+o9KsN
	aaa3ij4QzKNVk3yVHqzrxkKdy/fr+ROWVrMW1ljUhrdRjI6hj54efHg/BIAC+kpRrBKMG0g42+x
	/DT30lmWOYy/JD/CGtxMnPTW7qzcrQPyvEEgJP/k06IIctRaaN0jsdnpuxFH/JxOkRbLsAK4jFg
	NxEhGE1DF/iNfFzlXVF9GxFiMiIA6N40uo4xtCCXQb0vf0hLKS8etQ2qQNRcXWDycY4URyZxgtl
	uQ5+RLaBX2fDpTZea0jz9Ju7Wt9/OPxuU1+W+xxK7ZZfa6QMUShjA7e+a7MchOeBFDn+WoYFM9/
	oWutKrTTYE/71rsV5c6OMac41/641Ek1r7JOnzayKfwVADz3oDW4l3sKLZBEX83M6uRR3fy0C48
	0MskH3pklQOqdp/11FnjSdfrwsdmJSKgfMnWHVAGxrKDg4NHI9zpNeV9A26soJHHmcrCfOcj12l
	cB4Jr417p3psUMSRJL1guw0g7iw2awKlamLG12cHDw6dtovhVOAcLms8KqEgh547ZIJkxFhpHhZ
	A27tLp9hYCAATUwx32JzF3JxVgrr8JWniqi8dk5zZdMJIZ4pfZgZNHSZMI2FtZk0fRAHiQAIecj
	PtER9UpBewYZ8Wfy30ic+76mCIynKUDwc0cVVfj+XPvuOvdeVO3BytrTmJGdO/S9Da5DZx18+V+
	N5V0HMkOHGmQd3uCQvc/MOYKcuH/2PiSm3peNLVcjux+CJ/Rqcc0L/TFxELcELJeIhajomUdnQd
	+OfpzoHaiXxU458Pscoia/LjJ1KxTYRmUGGvAJmD8Ky8N+VldZHF9bvwioe/rkyDnsPRooqMHVa
	5ySuOhChKSZACg==
X-Received: by 2002:a17:906:bcfb:b0:c40:b59:1b with SMTP id a640c23a62f3a-c513aca41b9mr1650900866b.44.1795881814994;
        Sat, 28 Nov 2026 08:03:34 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 2/7] wifi: mac80211: use the ampdu argument of ieee80211_calc_expected_tx_airtime()
Date: Sat, 28 Nov 2026 17:03:30 +0100
Message-ID: <20261128160335.1815537-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080336_989901_549C7096 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since ieee80211_rate_expected_tx_airtime() was split out,
ieee80211_calc_expected_tx_airtime() passes true to it and ignores its
own ampdu argument. ieee80211_tx_dequeue() passes false for a frame on
the VO queue, which AQL is then charged as part of an A-MPDU: its PHY
overhead is divided by 2 to 64 instead of charged in full.

Pass ampdu on.

Found by an LLM review (Claude) of the airtime code.

Fixes: 094dc1619cb0 ("wifi: mac80211: factor out part of ieee80211_calc_expected_tx_airtime")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New.

 net/mac80211/airtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index 55bc451d4a9d..d3b911fb711a 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -843,7 +843,7 @@ u32 ieee80211_calc_expected_tx_airtime(struct ieee80211_hw *hw,
 		u32 duration;
 
 		duration = ieee80211_rate_expected_tx_airtime(hw, tx_rate, ri,
-							      band, true, len);
+							      band, ampdu, len);
 		duration /= 1024;
 
 		return max_t(u32, duration, 4);
-- 
2.53.0


