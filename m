Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69364606A69D
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=frK73+ap;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Nxi2vvbN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=; b=frK73+apiUt/k6
	2TnDN/LtEs2cJYAgbcN5PgytS8GTy/Wxr8xOm5l2kqiIgkXB0QDu3ZM6fTD6wUcjSmwOf3W06jvR1
	JeILOZAXjL5QKJVCv8eBXZLQqFgCqGqBzCfons9JD+zn5YtgSbRGQvBXeuNKyouuuVC6DGT+0wyKf
	2caAr/ZP0uEvKhprE9tHqJ33agQAP5glZpaCH1OFiUH9VIu9Ohbyjg2GL49BqKXPci9s66vpwxoRP
	oqy78qaNdhCaofUMvKenml5dapeB/u+RBRFaTUzEqpf4SiV6FneAIQiU9FIyWuhre0E15Rkkq0hnO
	pGvTeuy6gniPLNhxkzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7q0-000000019bF-3pFb;
	Sun, 22 Nov 2026 13:42:36 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7pv-000000019VY-1HSy
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 13:42:35 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso409489566b.2
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354949; x=1795959749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=;
        b=Nxi2vvbN1AoUPGLlffCpKI553u8np1n3+NH4E3+QPIo6RBsvnuhwNCstpmo4fizSRh
         y3wKytw4soiH71LGQQGOweKWDdpkZapc6Oxuuin4z969UxORsrI5I3awfoI6wp1UOLBU
         FAmZmc+TDwGyV9RADHQlj6kM3RscJt+v2Ihut/ETyz+ue329L91dxVpYPPJIxipX++d/
         k/1smF06p2Fa+A0RFSfyomBwupNXYQMc0YvzxLiiBQF+fsHNSODTDfoVvwR57dlDozho
         htkLjcuQYFqGvTLXNcJgCFGC0Mp2U+fBiqIxk8RnsBMFaqVmD4OTQLaO2e5qV959p6an
         EASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354949; x=1795959749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=;
        b=qffWfRFrj6UWCa5/1TzAKwkPaVw5aUsc2p1oLWke51k7OkC0X27Zt35hANVMLSg4+N
         uEPgIYBytn2EQg0HipuhONqVc264vQz0iztLl4CeCoL8FEKNHGk0FZSZz2rgCUX3Hbo8
         vWMces1ITtIOIrH6CYNWQ+L5wf84eisujNFTCI145ed9JSJUej0U0Rs5BwZNfK5+BvOb
         zpQ0eqS0g/F3rP96Taf/6bt7Waw/Ye+Vz4Z4V6refpxNRwU1cwCee/PW9Q4vifMKmHJv
         UQrXfjGTyRr5BcCagXD3D0AbsIywU5qxxw8lNvf4i3q0Ii45fRewU/ZEONUg07mkqRM2
         Hf6g==
X-Forwarded-Encrypted: i=1; AL+hErHKvshiQIT+fJ5EM4mHX/FETr30fptoUiwo+S1ig+X4xJSgvy2kKrmcnuW7qFTUO+wAxDHOhFk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8ChTJnv13+zP9kqE/t5WbwB623DTRtWd6In9qwKL6zu60WLsoD
	Ow9f99YNsiJBu7+9dMBSqsQCtrPwHyWPTiq65L40BU4hHpHm7+FTomnXnTD2ggKJ6w==
X-Gm-Gg: AZFdTZeq6yp1hWk8n6bf7vwJjcakq1n8+/ipZxlerz8ZF5rxMVwtLQ8yTa+aeQBEUKJ
	BHpSCFJBIoR/FnnDOfl52+1KS37c1EPlLZmUIFzUdDZDfkGXpsceZ1vPORvVIXDLuiaGg05tsC8
	KhEFEUgEeMo5jF26k1ffvgDoztSbjO2r0wJNYrNYVvOhmyx8lX0MQTqLQZT9DteATQXPjeCa9g1
	0dK5qjTEWPLMsZKE6DKOBHXWKLgGYoqxIChDCtsfnQiSv0cWr/bw6Kh1RkPObZT+nNBuqZ3AGfQ
	7Yz+ZIN2RDE54lUmEFRpIPlOL7ohTVXqLzHC8S01pBw8CjkIZ/C1PezVpRDVdamM+/s/NUidmyF
	xGy6UM1+n9gsmJrQckDf+7LCZvl4d16tnWWT5KmIM8cDrF64ag88daeQDsY/n6/XTJ8KD3epaDK
	I4qaeCwyRhSwOMi+DqrAiZI0F0oU7qbvpQi6qs2slA0PEDe0ADDIMmOhuRk47N7opYhqTU06u1n
	+L2v/TEQLtn2GU3wfpdG8bINt1c0rtwUS6Y/kYLsMQkqDpLUTmSB67to+EAcVGYBvJTUTbToB1k
	jhWuZRRBTcEgFLDByqi5hIZ5hAh0exPQzjt9QkzIyGkjNw5hw6vh9DbVajHAbHmn/MvpmAHt/PQ
	Ax8qVho2Fjw94J65shr214m0K3HFABvqNWqrG1FWxHsp3/mebvkbiKiqCznuovpe87VAQ26nCAf
	z8J4Wx9ddr5RXy/vOBsHM82OixwYrbeT3Iu6yPFsE2Ci/l3ft8TAZOwevZoS3k60TDuAqt5Z+/W
	FYkLYHee4sKIi19NyeqGPTNrazbqqNc6m0ZDLV5P92q5/ZPF8AB9Whi1ezZsdG+lPdfSAE051BF
	XJF/ZUjyzD/GsdVjnsBu99jxYRVFrwDTgGejnXfRRyasHuQnOF/dnH8=
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr746699366b.40.1795354949578;
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/4] wifi: mac80211: take the TID of an 802.3 frame from the driver
Date: Sun, 22 Nov 2026 14:42:26 +0100
Message-ID: <20261122134228.956044-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_054231_902171_9E5F29EF 
X-CRM114-Status: GOOD (  14.42  )
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
 include/net/mac80211.h | 4 ++++
 net/mac80211/rx.c      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 8eac4d50d06c..d601070810fb 100644
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


