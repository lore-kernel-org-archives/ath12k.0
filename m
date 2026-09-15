Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B331AC982C7
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bsp/rE6fgk4VuOjtsPw1McqdQ/wNKb8iOjT2cDblJU=; b=qSE/fPtvBXhfmY6nPyDPnp1FGe
	Lwo1Xf3ThBpbJ0zxQ33jIdKgqOIOSuOXGKr0mWKhmx2rSt4gzdNaWTh4AyNGsvLpsO8IevDZe0Dw1
	7EzNt87DP7qbUhSu/eWbZpSk9aBwLze9iu8ds1f7hHcH81z6hKRmniJyu5MOSUljbCpwWHRbwsmrL
	YSiu0CGeYM/c5kQswvufWm0vaCSdBNTqNy+pJpQR0v/rqB4m7TKvp8aBCIgpS1p1bChxJawil9+UB
	UMB72hpOgQ9JS4PL/BPBoQhjPpN+Rnvbc6azVuTRXxK2p5hV3lvtX9ZL5S7it+GEYkouZ0jhQNDOx
	UAKMWROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6z-00000006hKM-1jkm;
	Tue, 15 Sep 2026 13:22:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T6x-00000006hH3-0d7U;
	Tue, 15 Sep 2026 13:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2bsp/rE6fgk4VuOjtsPw1McqdQ/wNKb8iOjT2cDblJU=; b=MLREmNi5zMRCBrF+6gxdyvXMez
	tES0tklaiDjrrcaGkTSXVifLAz6YQarLGVhOcHw4NbDFDHFVQgfk8jcySzWbsa6fBDM1lguemcGKa
	ZC1Vzyul5QYJ3OOEJBJSDNUX6/usxVqEGx8Vu9/L6oTEsDNBADYDiJ8P54skg9IbGI61Y6eef5khU
	vy+c9+0oyDhezcgkjkSHx/W/5I3arpWntzG8Y92ZW0k4sWtvePk4p+Nr2049N4jO6W+5CDk1Q0c9f
	oXi4Vu4VuEjwDsn8u3gdpIE0ERHJCJ2E32h3PhqRKMJOJtgOI8Hbw5e3kwEVIix8NPT7W5uLoduOw
	uzX2rQDw==;
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6T6t-00000006oJ8-1dpL;
	Tue, 15 Sep 2026 13:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2bsp/rE6fgk4VuOjtsPw1McqdQ/wNKb8iOjT2cDblJU=;
	t=1789478527; x=1790688127; b=rSAW5RRBDmE3aBPCp37dO3TTJMquBN3Eiu1qnLZChYIwT5Y
	16nS6tB3i+ozDV0st4rVr70eyPNrZsfiUw6zFbGVRLnjk+N+7+wD8XbtdvYKXTJLdyznq8OtzEel6
	WqZA/hQwdKhBTQ7PJIyy+gmrJcvLzn7l4JclXB+c3Wa462/bXF2v06ZCuY07Nsb4M8biKlriFdNef
	uuirpJBPUCNe3JVHju2yebm8JyG6IIHNyzLd7FZkXmeuT1aDra9TsaSQaRZMTqmFx1h/5U9fQPxlC
	NsmWJFBZVc8Sa07iDMm26Uj5bIQf+e110GmIO7v+UZy0oqQKCX33/5/oVio/Wk2A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1x6T6l-0000000H08V-2Ja8;
	Tue, 15 Sep 2026 15:21:59 +0200
From: Benjamin Berg <benjamin@sipsolutions.net>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH wireless-next v4 6/8] wifi: mac80211: report to cfg80211 when no STA is known for a frame
Date: Tue, 15 Sep 2026 15:19:32 +0200
Message-ID: <20260915151925.273a1c7a1ab2.I28d8146b9189c5961411ecb26b44588895de1b56@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915131925.1780764-10-benjamin@sipsolutions.net>
References: <20260915131925.1780764-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_142208_342414_FE3E13D5 
X-CRM114-Status: UNSURE (   6.84  )
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

From: Benjamin Berg <benjamin.berg@intel.com>

This is relevant for hostapd to know whether address translation was
done on a received management frame.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
---
 net/mac80211/rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 1273c9067aed..6c823678d099 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3983,6 +3983,7 @@ ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 		.len = rx->skb->len,
 		.link_id = rx->link_id,
 		.have_link_id = rx->link_id >= 0,
+		.no_sta = !rx->sta,
 	};
 
 	/* skip known-bad action frames and return them in the next handler */
-- 
2.55.0


