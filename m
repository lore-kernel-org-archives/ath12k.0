Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F4606A69A
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jvsSkASC;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=KZeoMXAk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=; b=jvsSkASCjjfgya
	hx3u3Z5FRZCz0LPEbB1KN+/uWcKirnaA5hOtRQIrohvuQu6pOAHJ6dxdJCqDQPvqFvSSe7V2qaiiE
	YWoePM1eeHvh+C3LOxj5Ic8cU9EnPioRpRt2VYtSEAtjzRhQleNl36y0tnzOVZFtN3Mbi6GsOMItb
	TKbUsxmAIEQO+srpMj5WEdjfOTdh8zmXIsoAS8PRL5E5YV2sopkpGkxHiedj2CrKXbk4aLPrrYzbw
	XHuZ2S7douTT6YGTIRqkH2GKD6hNuUP5qnYsXqYADmGirHeRxcKnznFZxv/acAZgY/x+MjVDnzUA0
	GHyq0Yl06BhmC/XV4aCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKts-00000000wY0-356l;
	Sat, 28 Nov 2026 16:03:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtm-00000000wKB-3I86
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c511c0e2826so1034260366b.0
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881817; x=1796486617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=;
        b=KZeoMXAkxzCOR+47XcjAIcbke/AZSkSYABeuq+PEgbA/DjAlTM13rA/4rgk5Sr62HF
         lbfBxCL0UbZLAlGKSqCAjxQD8N7evxTarYIVvociE5aRGXFS0x6ev+M1svhP3pmgCwmv
         MjIOv2ydMeAb6klBPxDh7x8hjfF81MGjYNvWri/CFE3SvgB3cBgtkCuYVkAtAmaa43Yb
         D6h97rGIknABZ+BA81yz3BbC5W4hJLFwICfqdo33/aRTxojdXK1G5u8e2M1LgqkynQ0o
         4U7wy1f8JOBLG3YBTPbPQKJ6rhURtXPdggcIrdA2vR88S1/X6RSRv4eDQua8p1XTxnef
         DiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881817; x=1796486617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=;
        b=L1GCtMDgojUhGvFGuC20jG2o0Sw5yCj7drbuY200YEd//3tTE8TnE7vYTFTrDFcjyO
         TvjV9awyE3v7Mhdt4hhFcoL3JBK4EqEz6NP20kG7ln/iIcmMiIJ485eZsyLGvUjDY47V
         fLK/w8/vwxZ86uwNrtcMceMqVQWQFL5Rs9xyzRRJzhMi7a8CRJ+NkYlUZdjm1gXYmONi
         WbtfrTNiwyOUeMTFdv7FASQvOhO/xW7gC5TH8PnUTNw/Ev91/5i1wd3CH/w+0QsgRAV7
         6crdFVvG1xpWJS9SfyAwrvbcDSf/wKjgNX+eTSpDQNYaAoFpx1IMUGYwrjITGEOt43Xe
         jDEA==
X-Forwarded-Encrypted: i=1; AL+hErG+YKE/nDt2fI8cliMSaBjtj6jLS5nOQXtvu6lMnP2IsAazCTSjtyRUWivcA3uDq++CJ8bkbhg=@lists.infradead.org
X-Gm-Message-State: APuU4Z+y3tOWxP866VNWTXDsfxZlcXEAcCN1hUuQ5hNmX55YRqbOjWZY
	COiQf8N2a7gJk54daXAd1gqP+RA2lHMWZWABwNer1QLxva5v2LOpUNG43HauIIEXH5Km+eNowB4
	tetZ627pD
X-Gm-Gg: AZFdTZfTGAQCGBOnd38CAutv6AOIQ5a6tGRxwU1hZlxp+Zfx+HC3hseihhtEZW8uee1
	LHqlrDpKyXuuh7hi9CeCXsKTJMGYhpn9ShEGZyaJ1zb+y2JkQDPVbqDW5WyFc66kCw/dENdVdxM
	lFHZDvbyzBlK0ws57FM4wt4F3vPbjVsBC+OfpxUrL1WfDGIT+3o+DCDs6z7jm2YT2LTJDnh01uC
	DHPROw3TBVRjskm2kHS5mnp/UpG87nniBarBLlRITcmxv5YC0HEcBY+1eWeItWFr5znXYiHqWAz
	advXlN9Kk7Y2jzMSWQ1OAYZEA/GzJO/iU0Bqbo308yKEjiym8HZ12xVg5/7BlOXgNA4Q90+jLOe
	BVeg3OSIThbf0zg3WxhQFX1Afx5Qx4PDN92/ymTdujl9TOAZU34ewHx6P98FmIEIcBuQmMpVIh/
	aV63w31bVBD0OCE2oCJfw3KI/FkJ7b+nSlq7G0lnVqKW+60VpCNHYfM+XzPtW89rlmAC7mANPMY
	vA/mhu/lQ8m1PJnQV9pEYI2iTnIasKWMrFIg0vfes/1fS9AUp/wEAubpsFA6cBk36xwCmwicr8f
	6VikciACvgZ/Vnl+XrW7Rlq0pQz5z2UnV7i2Sl3K/ipjRkJMMvA6TZXXH9FtwLr1Fae+KW8ahgF
	+xpQ/GdZjilGRxd6JJarkBXgDDMl7fjd542QZk2yowqj5G8ywJ/TvIEtIkjBxS73J8jHMYIiYti
	8NMlfL8CQenW1d3ciJvIBizTowQpf1qxVeOMX2YD0DE7eyYgg+neiHCpf3I133Qk/M/sD3FF/dd
	75YBzr+0tLz2JHS8zaYoqyEhDwkBAAlKj0R3ditNMYO0AZV/bz1h26cFhT0zyChG+aqkc445pEl
	0vn4HmSZXYeN8iI=
X-Received: by 2002:a17:906:1255:b0:c2e:378c:8ceb with SMTP id a640c23a62f3a-c513ab2f292mr1758991266b.36.1795881817055;
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:36 -0800 (PST)
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
Subject: [PATCH wireless-next v2 5/7] wifi: mac80211: take the TID of an 802.3 frame from the driver
Date: Sat, 28 Nov 2026 17:03:33 +0100
Message-ID: <20261128160335.1815537-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080338_869020_11F9F692 
X-CRM114-Status: GOOD (  14.52  )
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

__ieee80211_rx_handle_8023() clears struct ieee80211_rx_data and never
sets seqno_idx, so ieee80211_rx_8023() counts every frame received with
RX_FLAG_8023 in rx_stats.msdu[0], whatever its TID. The native path
takes the TID from the QoS header, which an 802.3 frame no longer has.

Add a tid field to struct ieee80211_rx_status for the driver to fill,
and use it as seqno_idx on the 802.3 path. A driver that does not set it
leaves it 0, which counts the frame on TID 0 as before.

Fixes: 80a915ec4427 ("mac80211: add rx decapsulation offload support")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- No change.

 include/net/mac80211.h | 4 ++++
 net/mac80211/rx.c      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 58a0a387d86c..0d0aa613c280 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1770,6 +1770,9 @@ enum mac80211_rx_encoding {
  * @ampdu_reference: A-MPDU reference number, must be a different value for
  *	each A-MPDU but the same for each subframe within one A-MPDU
  * @zero_length_psdu_type: radiotap type of the 0-length PSDU
+ * @tid: the TID of a frame received in 802.3 format (%RX_FLAG_8023), or
+ *	%IEEE80211_NUM_TIDS if it has none; counts the frame in the per-TID
+ *	statistics of its station. Not read for other frames.
  * @link_id: id of the link used to receive the packet. Set and used by
  *	mac80211 internally, it uses @freq set by the driver to identify the
  *	correct link per vif. Set to %IEEE80211_LINK_UNSPECIFIED for non-MLD
@@ -1813,6 +1816,7 @@ struct ieee80211_rx_status {
 	u8 chains;
 	s8 chain_signal[IEEE80211_MAX_CHAINS];
 	u8 zero_length_psdu_type;
+	u8 tid;
 	u8 link_id:4;
 };
 
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index a2356cd17691..9fabc9b5a976 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5303,6 +5303,7 @@ static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 				       struct sk_buff *skb,
 				       struct list_head *list)
 {
+	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_local *local = hw_to_local(hw);
 	struct ieee80211_fast_rx *fast_rx;
 	struct ieee80211_rx_data rx;
@@ -5313,6 +5314,8 @@ static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 	rx.skb = skb;
 	rx.local = local;
 	rx.list = list;
+	/* the MSDU count of the station is kept per TID */
+	rx.seqno_idx = min_t(u8, status->tid, IEEE80211_NUM_TIDS);
 
 	I802_DEBUG_INC(local->dot11ReceivedFragmentCount);
 
-- 
2.53.0


