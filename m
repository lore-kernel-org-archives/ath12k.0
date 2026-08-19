Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75367C5B572
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwcmO0PYJh8VS3C7ePNgN6yZgGinLrRXHul6toqwmw0=; b=WFWhSzONexGSNMIZUCT7S8A55J
	mJbymonismrhCPPQ0nBOHeYgw4FuGzsrJid2aIhUsQ+QlvRYLEzyP7G9V8nRaijasDcujQJCjcuow
	ksRrmNWOxf3gUgK1uh5ZbFyfyzKOfjgCVGlNl9lIJO/QjLd6+OqYB2Ga/VqUHOtHRyXxrcLi/WD9T
	atxsQzGHVZDdc6yqVElnAiXYhXhkdAUsurh/nQqF4aC3pXtPV1ZGPh/fqNW/YMlejrUXVwOvqJ+QI
	gWSxDSrp/axb+q/b/WCJ/FS5VTI+Lf67yJq5M3MktgatuTADrRxfFe8Wal1vQKtSRCSNS4paiY8B7
	ul08t9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgtH-00000009v5h-2zMZ;
	Wed, 19 Aug 2026 14:03:39 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgt8-00000009urn-1gHt;
	Wed, 19 Aug 2026 14:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OwcmO0PYJh8VS3C7ePNgN6yZgGinLrRXHul6toqwmw0=;
	t=1787148210; x=1788357810; b=jv/y9AXlT853WzMqnYwF/ROBif3cOLibm+n6b6ezrbeglo5
	kNnG9wOjAQnjg1CxyIkB9rimg/5bXqHMr5oFLxAqhRY8pUg3f8oSFoiByhrJgSptV2vbAushO8WhO
	rK0f8a8c/7ZrmWbl17YUTphEAYSWCZL3lsSmC/aBt7cK1Lkm8MxBr+JbBub2MWPYLuURAqBVPjaIF
	VoBtS2tcXwSsedn6cmaH4xkPiawVBAEBUATNPoj+gnYDCpV4AZbABQjywpBgREG1RyPmjKjeseeWV
	nvA5ky2yWB1tyr298MD1iZaZ/RWAikMp0qvVpH5jf34SOfRc5oqz/pqQLMP6kyOQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1wwgsy-0000000B7qc-2oxZ;
	Wed, 19 Aug 2026 16:03:21 +0200
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
Subject: [PATCH wireless-next v3 6/8] wifi: mac80211: report to cfg80211 when no STA is known for a frame
Date: Wed, 19 Aug 2026 15:57:10 +0200
Message-ID: <20260819155703.7f0ac21fab9e.I28d8146b9189c5961411ecb26b44588895de1b56@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819135703.4072215-10-benjamin@sipsolutions.net>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_070330_507387_B6B2591A 
X-CRM114-Status: UNSURE (   6.97  )
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
index f9e8c5ec7e1e..9a0d2f5a2c59 100644
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


