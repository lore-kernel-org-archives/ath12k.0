Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6283860A2635
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0NpzxqgE;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aS+OiXb4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=; b=0NpzxqgEEyWwKc
	DeTRsmhvnUTOYVlj1fslhQjbmeQSOem6Z3bXQeehj49TY1KdSUX/7/d3u9vVJiIZk7dYH/vjgBK51
	qX8Iw3Q1wmK9OcDAQaKthiia6atO/aDwpRwcV4l7AoCCFjhWf08Skq3nijZ+OxNOETL/vM+hEGYpX
	FLeXMNJbOo20X8IPhHYdNjK64gZE8LyjoQgRMjKADW2efJ67X+vVs64/jMCGMucKOlMBoC+/9k/Ke
	cMs2ZVp7FSP/AjqMyQxJlLPbYiJ3FF3wNGaNXD4pD5ovAmElVs/iiMMzIaAUgXzpGCsX65bFwCHyL
	FtjrocwAvbRIjyxV+KDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKto-00000000wP2-3fyu;
	Sat, 28 Nov 2026 16:03:40 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtj-00000000wHu-1yVp
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:37 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c4322d310e7so533636666b.0
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881813; x=1796486613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
        b=aS+OiXb4CUET/oORfau48ixXICzEBou8e6UDgyQ1YMVXsObyW+mleugPB62I3EdqmB
         67mXWFDYAyau9gXnQ/pz5sRcjz9qSO+iEkQQIt9hFDGR0lswuFldfIg5InwmIpQHTZlS
         mQMid1J5OP8QT2I+CZzLZyXGcz4eriJIpGVa9YQEXI8Qs5fSTqpZEtoXh92hP8jfT4Ae
         //kj7oQ5gg3YcbeOXrdAM3xlsGHrcQhv8yHtuxR34kiycUpgwYlEx/23wXm01MFp0uRc
         en20198ekCOwNt51OvwdC4yaTTll4SF8cAgi/7XHkTjAwhBFCOyFJU4x1AuUXlTN0Vt4
         6kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881813; x=1796486613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
        b=nUYzuqKTsjBq6HxtTolSiHjAlvUvtf34dTlYxjOYM98+8B6VV6CCbzs6NWrR8PPEB3
         KV2ggf4uX1P/1L6XEOw4xSYYAshnQMYO8VTU9/lSGID0C9x6d9TJ3HPkO/grYiAJWd8c
         p7qJokrouXqjnCJMG9R48NyPj6dAk/aESGb3gcyj81KJudX0gziTNXusVD1/EXOy1+Sm
         BrB8VCgNZwcPcfHVXUYiKnvfU91WqCucFpcWg2sce42yndicFe9Zxgl2+X/OQltwEOkh
         vLnAXYwDLMj7ijPB9vnUxbMLqQ6IZkhc59eJnObaadKyrtVTrodUheRFPbMMJ2G2LaPe
         vGlQ==
X-Forwarded-Encrypted: i=1; AL+hErEX6I96aXE8RxwUXo78VYJLwripcFnYvsZ/rJLyvXoGMwxB9etAXdh85+TrBBkXxqkNL/puogs=@lists.infradead.org
X-Gm-Message-State: APuU4Z8RWks59OeoceD0Q8vJllk5/qUFipzk0PMvdD2ya7phRsxCmR8c
	JNWq0P7nvvsKati4Sih+DhIsaP5amgO7MTbwENYks0C2sfrClLvtdBOz6chUM6tgag==
X-Gm-Gg: AZFdTZeLbXG3dI2v+QIBX2sS+xy+N74WNN46VmS9ZxApgwdtxIgf2tCPPfBW+fJcn9T
	kg7ej+pUsq5RGDijRHl9N7cceIvs1tqGztHgaFMEMmsBo0ioUNz9InvD0xh6kQTzgri2BuwZYha
	AyTBJlAuD7Ik7HFWNrJiCpusfR1TKc19/2oFUDzQgB4EH/z5tD5dh7XvK3n7Uwx9E6i1GD17/1L
	8FLTnCmSqeN6mDZ0cN3tIf0SfJ6qKn9z7VhkPfUJGQaSkgXoXCFoZxJRHSuDL30vrSkqEW+I5q7
	7Jm4IYmYKE+blKg26lCZ9xGq3VYw5SrrvB0myCqSnqhpVc533ZyWpS9iDXc6uPUCPZZUb8YA5zc
	UZF04ObRVQWKn7EhVZxAdQ7rK7Eysq62kuTEQXUU5lPBsIS9KSLuMoJlGfSI88mVsczB+Ny1Tc7
	mVuY9s8AiWphM9iG2u/aN3k8Jsw72b9Rpn05wBuzZwoZdJRSmDwwsPdRJfpRfz7EAgWDq5aQbBt
	M1vb+pg++8guWGsJd/1VmgBjSDft9kfPzz9liGENaWU+cKeErhRWM6dzAomX2V1k99CR/JoVAgr
	NHQfFHMsYC5oYSDYKCqNWovob7eegjVTP6LOeq2qGg72caiPXBWh4BttJG2eWxyWGbSUmwC84d8
	oy342fVrfYzoJxeQq/kELZkjlAzzAqly/10iz4OlmLR7McImeDlJ95cefWiZ595fQgVGF+ljgaA
	yBWTXmovX7uCYKhOmBO4BGeiBavvuBYUb079HDzEqJ1VtU3XFeIe+aRfpOeKEY15nSWSZXyOZ7w
	bue6zzkyWwSY4A6suhhYyw4Pq3ORV2TYhG4xasHaOlgzCfIA55QnslkbVG+nTl79iK+bMCmprgw
	EFWxwuWSjXs62jM=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c513a47e325mr2433115666b.4.1795881813536;
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.32
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
Subject: [PATCH wireless-next v2 1/7] wifi: mac80211: compute the airtime estimate in 64 bits
Date: Sat, 28 Nov 2026 17:03:29 +0100
Message-ID: <20261128160335.1815537-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080335_590815_43C0268F 
X-CRM114-Status: UNSURE (   9.17  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ieee80211_calc_rx_airtime() and ieee80211_rate_expected_tx_airtime()
multiply the duration of an AVG_PKT_SIZE frame, in 1/1024 us, by the
frame length in a u32. The product is the airtime in us times 2^20, so
it wraps once the airtime reaches 4096 us. At HT MCS0 a 4096 byte
A-MPDU comes out as 945 us instead of 5041 us.

mt76x0, mt76x2 and mt7603 compute RX airtime in software and pass the
length of a whole A-MPDU to ieee80211_calc_rx_airtime(), so a station
that sends at a low rate is charged a fraction of its airtime.

Do the multiplication in 64 bits. Where it did not wrap, the result is
the same.

Found by the hosted Sashiko review of v1.

Fixes: db3e1c40cf2f ("mac80211: Import airtime calculation code from mt76")
Fixes: f01cfbaf9b29 ("mac80211: improve AQL aggregation estimation for low data rates")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New. The GSO estimate of v1 1/4 wrapped here.

 net/mac80211/airtime.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index ee5dc524347c..55bc451d4a9d 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -616,9 +616,7 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
 	if (!duration)
 		return 0;
 
-	duration *= len;
-	duration /= AVG_PKT_SIZE;
-	duration /= 1024;
+	duration = div_u64(mul_u32_u32(duration, len), AVG_PKT_SIZE * 1024);
 
 	return duration + overhead;
 }
@@ -813,8 +811,7 @@ u32 ieee80211_rate_expected_tx_airtime(struct ieee80211_hw *hw,
 	else
 		agg_shift = 6;
 
-	duration *= len;
-	duration /= AVG_PKT_SIZE;
+	duration = div_u64(mul_u32_u32(duration, len), AVG_PKT_SIZE);
 	duration += (overhead * 1024 >> agg_shift);
 
 	return duration;
-- 
2.53.0


