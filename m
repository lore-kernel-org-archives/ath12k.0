Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C34606A331
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KnlsMmrO;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=UqIX2NFx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=; b=KnlsMmrOyT/UVy
	sqz1qXmTdpF8Gza0xWxn301+IYBx/VbiNANs37ieumGC3yvM8UsVXQ9aPvkuH+1+Ty85E6Lp25aql
	cwsfH8qmklonojnMSuIYsb7/J37V8AT59PuQWR0tis6gJaF4P184UQAmKYx+xaXcFwE+LIkZi8BTO
	KDw5vXsZthEtmw1CjazUXIKuQ19zLVx2X0uwR42lrMNGlijRdtQ0r2U7M6gIc/8O0X4luxbZiuqqB
	0kCm9pfWfxeyXOnw+qiNnmnDSbS0jyu/P7vXKsxr1JMaR9nyCgfViEzjUWPaEOMRa3MzEDUBLdUo9
	3J+L/dVi9Tt2nNNn5K5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7q6-000000019eh-0Kln;
	Sun, 22 Nov 2026 13:42:42 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7px-000000019XO-2BSD
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 13:42:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3653952a12.1
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354952; x=1795959752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
        b=UqIX2NFx8nfCALPpWps/WtBn+VodbWPQNEugyZ4cVey0XRxGl60v0j8lTYb6DzdLdt
         Fd4dZr29r4YhPwhdNapxvJRd2B5cdXtaT1dEqQy3cgQoga94LzVUBycSkSQaGWvl4CYm
         /tmo2oQBZLUJ9VoaPDHjtI0JFs3bb4Si1iajOFcJUcR0P2u9nTd7ngRyHAE6bpi6Sb/u
         0t+HZ9w/VEsJP1EPVHW8dyI/nO1+eeLUvvpO3ZZXz8tIAu9opGVQpW76X9mlXoA6HReb
         bQKegW5qqO1OkaEKs8fwaacLPl8PVxFtXT7OfkQIJAydptd6Gt6uhGCSEagzbFinYOQn
         2ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354952; x=1795959752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
        b=j130xrXtghguNI5sXWed0nwUlSSvUfV7E7r/kcqprjylyqgku3G+KeXwb3Luh7x+OW
         Z8lSzpdDxrkiWclMM7zOlfTiZHT3Lxr0aHw0L9wv6BmILDRdyLjaKYS03oiZfT8imIA9
         d9u3YgcPfZqfsxVX5PgXQ7Y7YsaRsut73qN3vptsAZx/17FCazBMvqrGm3PP2kEH0n1f
         8HJkY+wnNVJxFDCI4oYMwH41U9qRXkAuV4j4pDAe22HEzlheESN3DLcPcqbvxuHo2xw/
         /4705EwOZOppHA7lZxPGoC1P4LrdphyvlNrkbKRUePrdch/piYu2/UUubuA9BVgy91DN
         lmaw==
X-Forwarded-Encrypted: i=1; AL+hErH9k8GVD96TjYQDyE47gv3YnNEoQdFzGx1SO4m8fEqww5DF10qMkXKicTNVpZnVKSinw9IdtoQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/sy3loqZcIr4IwhBDdCTHVcH1jbgaDaQXB1Sz8dBLsQHoCruJo
	WNcQWd1IDV/flMTLxNPPjISsGxx9MKg6sF5CT0lFzlrrToKDVRS1xaZ3Z8gtUUxicA==
X-Gm-Gg: AZFdTZfiACeG0xGXWXUkzCXoeDEecEclkaqz1EneyY2lWG1qTUVCGJvLJ8OYM8XIWGI
	NZEDu1r745uQVnmIZxGL1KPTTtig0Mf/m7POv5t9ztlWI4U88uvoN/zj6E9yp0zZA0kSni6i4t3
	EkhHV7Ga1wGrDRf3/OhlL3TR39hn1Q1TMtLEMJyAr0c/OxDpcEml3YKwk+7CpYscc7mCR/fwNzO
	4JUXHIhuKkTH4DTAyMP5TlVN6XixjwYcuz02zyVZcNjz2oo2Nh71EmnKSbWQhTSbl8dTdL1kSQi
	cGw9oOs+VzLb/RxlNZkdWCo7CbUuXbl3OE/Qc6i4neZG5E5Zoa2kX9eY8vQPWV97JKJBW/NgkYd
	RhQEa0fNch7F9tzvapDV2ijddsTRv6U8je01Mom+Hg8EEwZ5RYH3FOW4CuQB69FaHOP/A/u/sTA
	Y8E+diVuDuL+9+qKMBLXub4R+L67V6mrnTXy559tMk4zXsKc/yH0B7gQSc4Z2MmekhEsXDmE6YA
	Ia3vypUHyoElvsy9ibWgf0p2QBps4B65dK+qZRILq+QOlWYGNXQqYQ2NIJo4/quAhQPeC2llPm0
	sMTFmt16OFd5sewtRD23XC86xzxMUmTcoYKy5anSZ2JHSsljTzkkG4v5ImOu9i3eXXV54Bauevs
	pMIcHLtSeYkGCQj+a/cUe2zTDxdOPV3oCzvkL00PuM+Y37wmPSKQ9IbM/TOueBw5fA6Zw4zQPcW
	GhUCZ70DVET8U6fbnm4aL6wlrKv8NQHit4eR+CWuXYdFEdGVsoQBoB01MRcSp8ORfItjEpguVXF
	vFKsQ4lnGpuQbLVfrKAL8XsSAeWChC4gT/mz+iPU3YcuqaFR2J1Qn9DdSmfRbDjvNwsrBHngRyY
	ENP4y2yAVXkfO3pirWVbekzWJSa3ihcIPnzgiahRcVKAcT2WRNSX3/4=
X-Received: by 2002:a05:6402:2745:b0:6ba:9d0c:cca4 with SMTP id 4fb4d7f45d1cf-6ba9d0cced2mr898964a12.33.1795354951690;
        Sun, 22 Nov 2026 05:42:31 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 4/4] wifi: ath12k: pass the TID of a received 802.3 frame to mac80211
Date: Sun, 22 Nov 2026 14:42:28 +0100
Message-ID: <20261122134228.956044-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_054234_007652_29D1325F 
X-CRM114-Status: UNSURE (   7.29  )
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

ath12k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver already took from the receive descriptor into rxcb->tid.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 36be543b7c50..fc381945d163 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1413,6 +1413,7 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, rxcb->tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
-- 
2.53.0


