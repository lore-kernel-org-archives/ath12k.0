Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A160C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwcmO0PYJh8VS3C7ePNgN6yZgGinLrRXHul6toqwmw0=; b=vwjQRea0gw3HMQh9H/3wTzhz0O
	QFhav8ufGOVp5uYybd3Mywtx3mQfyEq2SRUmIWNoFsuaDRotKzBlU+Z1SsoXME7yZ8bZxWv4l1pkK
	4pFLsatlIY/0U1fTBhm21B0odyhA56L1oyDEqmuycBmt/rW12cCo1QC7I5HTdH8sxaPSwNrOw33vm
	yYoHKMHecA1AS7qhO3xh1Y0sFEx5dW3V06OfLUqn68HjfWqCByl6YxFwEh5DAiRgP1iQbcmvJDZuv
	pLwuy1GWBV9fZ0GVFmuGWijADkcCn0c2PKKtHqcjpnKZyaycWpxxbY++fRSmm6Wy13GMsv4nKiQHb
	dSq3ltbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfbr-00000009leF-3g10;
	Wed, 19 Aug 2026 12:41:35 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfbn-00000009lX3-1jtT;
	Wed, 19 Aug 2026 12:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OwcmO0PYJh8VS3C7ePNgN6yZgGinLrRXHul6toqwmw0=;
	t=1787143291; x=1788352891; b=aMF/a1Db+S/PeOxEXSj0wqA8o9aBhWniYW4botbyRYUcndG
	Det68MnhaubcnnB7YlBbC1C0uNWarpgVheGBiNVXcXR3Cj42XFq9sigQK6Jr9tDVEGoKSVCWnw5f6
	IQBDOgCgGfqCNnZoPxMWdBQV7pDDsHttogfif/rcEm5LniA/ztvaMI1eAkjBFBRo4rGAgsakHniIF
	jO2Fu5aS7PWWrVAuXghhhS0eMI/X7KR7JAGMY5iQHOKJp5pUX/gcGAJNILFQ0bodNB5dUPiDCM02h
	3DlojVHQePH+83hbB0CgrxFNpaX3tHr7FHeYO8JcrjkYztYgzGHjTVWZ5jutcSLw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1wwfbN-000000089Cs-3b3Y;
	Wed, 19 Aug 2026 14:41:06 +0200
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
Subject: [wireless-next PATCH v2 6/8] wifi: mac80211: report to cfg80211 when no STA is known for a frame
Date: Wed, 19 Aug 2026 14:39:05 +0200
Message-ID: <20260819143858.cfc00cf78587.I28d8146b9189c5961411ecb26b44588895de1b56@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819123858.4025935-10-benjamin@sipsolutions.net>
References: <20260819123858.4025935-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_054131_462915_EBED4F48 
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


