Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E89606A681
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D1mFvE4O;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TB17o/ce
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=; b=D1mFvE4OoMbz2m
	LTqDoqCc0QIvnGJl7aKeeg4PJEXxbsqmoKZHvoclYSllcc14qq8qpZn0DEG2YlhEj5tojcbsL/5Wb
	mLEmapiSHOC2hQGMdotufeuxz3fNaESipd8akymiBnTIBBfAKoigHH90aw7yjA+LeWVYd4xSRRxxG
	vG9oLPOZZfopxI6L/kkBfRgw4aXTmpzOSeapWX+fOHH2Ynth3/7mz2t3fZUmRPK5Osxh2uKPkC7CM
	8l7Ma4LD5BjQkaHx5QSIFJAAeqUsnuG9LA0RvGsIpjwTxA8VHhrSMRG4nu/wH/huzmrtKuz5tmW6w
	pFed3XRJdVlPk3HutKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtp-00000000wQ6-2Rnl;
	Sat, 28 Nov 2026 16:03:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtl-00000000wJ1-2Wjc
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c516a1623d0so1065380766b.2
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881816; x=1796486616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
        b=TB17o/ceUvjX5BSbP2iqR1sHm2RGuv8rjIYrjlm0kkEuNo2qMT9YPaw9g80kekIUn8
         ftYvmpjXwOUzn0pjpMrazxkJBNv31VDA912FuaXKWjB7rX/rcu7endoIbm+NyzeylSxB
         bZUR6jlCcPWCSUpuepFdFaLZ9OMC7qbHxihfsbcKRwnRK6TC7xFku/oTGpIrYOmBKvaB
         GfjlUngUfOSGfjJZ9OD6D0upCfaqf25QY2Ugl6c4vQNJGSUxl4VVU8KauhzgH8xRfnD/
         /0lK/Y2ajyNs6KQd/K0NSEURkXcF8517OEeNwbMVISRxGfXoDXagO6C8dsPznd0t+6dt
         iK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881816; x=1796486616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
        b=sPr1eWkD4yS5FltxCeAKwDuOuYrJ3n3Qi+BfI4/pwOZgJ7FQDM1+Hf1ZNY4EpgrFWE
         jMt7v+cd6TgjNuI6wqfL1vOqqRVkVrdEgH2KS6bV5Cq1xstecxnofHapx1PKRB0Ryg8+
         UGFGid6NPqWrfHcKpkNfeKJhTgqGW4Kew8xNPhN3VE2yw+PB9NfqgPPZTsZ6udw/cB/0
         vf874KXElyT/rqapCJj8LZXLWanDyztdTPqaOC0RWAwwMC7WmFu+GbQ5qn9mNHtCN51i
         hEqjLXJWDhEZ7tjRTO8xpdxtaTSTx5vbJjqzVUNgtMmDHX7XOv6Ft4hPRTelRNzjXaDI
         bBNw==
X-Forwarded-Encrypted: i=1; AL+hErFwWzFWdAmf5JNUsiLckw/DHLaRUkX4csDFQh87fAMS7crRoHSy4sfSUiJPL3YpUmcjhQExNOQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8mrX+7zd7WTKUm9DSvoM5OWdn6bm5zGP+6efw0Y6i6YClCTwOD
	6tC4wvWv8s7GJnSQRIdHH+3NJaHF2rGOy6aK8eJkNul6nQneXhPlnFJUrGwSsumn0Q==
X-Gm-Gg: AZFdTZemm1kmf+n72Jl+vId5pBntRSY10JvBrplJ24VDrY3y/iDvX8h/yUUGAdT8OTl
	l1jlYMmliguTeCEr2iN8cBX16RvA2ldvN4h4AN72WxScHQo7W7hPBflmQdQveMaXy4pDMZEZwtX
	AEqJifgS1mTfLd/Vem+OyAjYEXGzdXGZ0G+rXfgHnrF+v5JrrSX1AroYx3+4OpnYKf71ffi3RGg
	VLjI1nVz80QTMdlXTsmBSNkm3rGh+Ybe72kTJadHvSA/A/e+VhSDl/lriXh13osvZeRUP42/o3O
	YBkE39muq4yL4xwpaTV/xkS+82YjJKfp2N++Ug7cwFSKg+hUC8rvnOvCm0JoNvBloQvPVPBCW66
	WHNlNBb3q4e1xljXDPu1llQJ/rF0tmrprCa0cfQ3OZqHmYjNYTMwaIfiI1xbhhCDoaoCx3ZT9fG
	yqKSn2UPCBKG7bURRQG5/oRn7W2jAaftPjZknzpPa4Iukf2NxYleCZ9Vrme23HO99jvnmcKxJ8+
	Ygy/aOMkANnEHPmMbMZPaLBP4RSt1R1Ur6ZaYLeGScAi7vqI/9IYDJo5Leu3IBT4M5ky8QGdN88
	ooUwBdDyuWZxKHfOQKtf+cNd7fAZdDuhsgNyYxJ2Uk9geBHtfQOpOorwYQWBjWeXJoM+5ZJOy5e
	i/OVXN6TxpuArARXFkFzOTcz+3oLOtuPVoaAoxI3YipO0A29QEIDqOgfqtEtfcx+dLqAF3RSTr+
	Bi0UllPaqngC2DvTHuWmt3wRvtl6hmMoJuZFq3AyDB595K2bWM078uplbHVNVxAy++2Y+0Xgnif
	JS8vHj+93wnSAUVqW/1xuIhF95MAMa4hVPIGuFpmNbdUmtmb1g98X4aAaC8kiyNcge17CWf84WD
	PZuHaLOk4k4f5wplN+5OzyjBP2FP8VXOpVU=
X-Received: by 2002:a17:906:27cb:b0:c51:3acc:9f86 with SMTP id a640c23a62f3a-c513acca092mr1932323666b.39.1795881815705;
        Sat, 28 Nov 2026 08:03:35 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:35 -0800 (PST)
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
Subject: [PATCH wireless-next v2 3/7] wifi: mac80211: clamp the AQL airtime estimate before narrowing it
Date: Sat, 28 Nov 2026 17:03:31 +0100
Message-ID: <20261128160335.1815537-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080337_674189_2818BD38 
X-CRM114-Status: UNSURE (   9.32  )
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

ieee80211_info_set_tx_time_est() takes the estimate as u16 and clamps it
to 4095 us, but ieee80211_tx_dequeue() passes a u32. An estimate of
65536 us or more loses its upper bits before the clamp: 65540 us is
charged as 4 us.

Take the estimate as u32.

Found by an LLM review (Claude) of the airtime code.

Fixes: 7a89233ac504 ("mac80211: Use Airtime-based Queue Limits (AQL) on packet dequeue")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New.

 include/net/mac80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f768ef9184eb..ba16096fea3a 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1425,12 +1425,12 @@ struct ieee80211_tx_info {
 };
 
 static inline u16
-ieee80211_info_set_tx_time_est(struct ieee80211_tx_info *info, u16 tx_time_est)
+ieee80211_info_set_tx_time_est(struct ieee80211_tx_info *info, u32 tx_time_est)
 {
 	/* We only have 10 bits in tx_time_est, so store airtime
 	 * in increments of 4us and clamp the maximum to 2**12-1
 	 */
-	info->tx_time_est = min_t(u16, tx_time_est, 4095) >> 2;
+	info->tx_time_est = min_t(u32, tx_time_est, 4095) >> 2;
 	return info->tx_time_est << 2;
 }
 
-- 
2.53.0


