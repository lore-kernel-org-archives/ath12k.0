Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E729606A31F
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ckcm26Hv;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=g9IrbVxk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=; b=Ckcm26HvibCF3/
	2BGWqZOomQlSo0spLMH5Fqzo/VcHaU/fKmSjCweiGI4JC5gh0sb+AFOM12DlQke/gyO52dC5+lusu
	1nb0qig0z4Ui7SZRoUP9W72E1SyukOztqb95lVjqJC9aG3dT19WJiZOupXlOl0vfNnSg8dmXA/E8a
	QgVEDBv75N1L0jPf97IolWslxqtByIhqt7pf7WdTiNLvx5zFldfQACgxfXatz/8fdiXuosg6zM1Es
	M+JQ401utT9XpzQexFEeW9K1FsJYOk924kdlGQCJenlfbIOy1960wjuIBbPJmxmBpCwXOTHKKurao
	tn1B1in5/3/Qsx/QztQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUR1-00000003dJt-1ipW;
	Mon, 23 Nov 2026 13:50:19 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUQw-00000003dGN-2YCG
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 13:50:18 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so5012877a12.1
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 05:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441813; x=1796046613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=;
        b=g9IrbVxkYNp3f7XEWNXOlq8K5PvuXNe8SB9iaIJiYqF7LdF2z89onkg/qHf6DurwBE
         y7LlkTHDeSGVd3mJnhJ9nOgW3n1sPcmiCfczlG7MMWSpJ34NZ3NNYfU04qXcSjesBeKj
         eH0JTUV82hDA8v8QaVedBtja8Yc/iQEpPs6ZHGLmiRP2b95JJ0uSRHY1TgJWkdhcpBxR
         5CBrWgmSUxvEOEVP1LaXSnSbPd1FTcLfUNY+SpNf+hgVdeflgOz5y3i54jSHTh17OG03
         pQswfEcTBZwPCiYTNutDVhafNK7oMBFOxbwQ8hd/qQ2GHCVHW+1NZsDVXwCtgwCQsE7/
         LiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441813; x=1796046613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57ma+zgU22rM4nTYnM4SGAl9X+VUD738fpDOy0Jctx4=;
        b=KEua5w2Xm5PrO5+mlf9yyl7GKgny5ZDaQ/Va274fsU46ytF6Xd9k0bb5KbkZj9pQ4y
         vGjpE31Bd9Q+hkf1QWwh5opHylEQLjxrJ7pQij2l3fCXnKpZu47+Q7NM1486fuVLECV6
         6eisYx6gybS0oQ1iTEIcSzSJJIC+4a2M2dSAMaclgpeA4pbnjvzJQBFnefSXLS9gDf97
         D9HdujjYA3835AbdeZK0r0/tohsRbdox2GwL4hFewSjYB30i2JcG5peJb6+wowNvxqo9
         RguVSf4RpwC7O2+yIKESGwwdefGapnj8JtZ3o6ZfO0Z/QtFEsaBcP4jov2K8EZi68+zg
         F2AA==
X-Forwarded-Encrypted: i=1; AL+hErFJmWRg8WtS28o/yeZKG8vZGZ3rw3ovaZHuQOwNKKs1X1/fOJril1DQQHjhzwmVFLqLlPlzyHA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/I8MqqybuZ/G4BbD97ABEA6HKK7wIcrKl6lr2xvweHLHMU9qnA
	7Y4D9KL4xOHvhSyTJBhNMq+vtWjge6cw60s8cOLxn/WrFB6y3fQ+oYragbtcL7JP7g==
X-Gm-Gg: AZFdTZfpBJzkwoX/61LFipXnZOA+tS2O/HRpcJyh5nydXP8SEiLLX3N1HlzeT2lG0QE
	ng+loNfIyZqau+FW/Yy3rwIq/AfmOifj8Lv8TMU4zCkAr3Xiw1BJn/jPwcuaJsTr221QEJOi43F
	ZVAs92bYwFfsr7j907wUSXe/4Xv2gyIezuTYB7IcUBJceDRuTvrdGX6tDNgsRjnJk80LUFoFUX7
	6l/tN7EFBF3iDBLLtKQ5RZh7YArFHdTbf+jQmoFDlitj0KReilx5IvQpKIEzYJsLYjjWFh6aJFY
	pgRcAQ5rtkObAAhu7oSfDwELRIw8rtfxAjWsPMZkDMCmEpDLMDimsZ7d/ZqPvhJN9eksrP95fdy
	k4yF0xQT+KuYIr++5dkc7/0mGjlDezESXcdmufSxwi4osjSKi+h6eCQpOMJSYs+Or5LpBgMaaYf
	EjlXXCY1qGcSoNc/I8UTiHdMImI3/nx6Fwp5OPiRqWTrD1w5PQosz8FXRce8gd4QbACb1kFlDRT
	C1sfMju9LNPR+/ugS4V2h5rRfB1VZM99e0f31WJYp/RuAXuc/XNlCBd+M2Whsg2X2YhAfcZeS5T
	0M1wTm7a4ao6rmvwdpwdXBBpzihiMKu5u1MzZGMlJ0te33VgVZINyDeFXddYYV73kawuZkGRqU9
	UVRT67rnBYwsdyYSMDjgOEGGqh9yHAB/kP1oDOWSqhuMPxvCA8RsWdxzMuDUPbei+JeyB5FGZRW
	O5UNFUe7pTQIbjHt6qkucZnl+KCGYTxFwHyKoJqcuDdUpnfMPgMKpTQEMrdu+oyBUNjRlNKCikQ
	+UmMRSZYJHNnS/AtyWfnI/kR/6PnYit+/UZMX0ksZ4N4MAIayFb+QqNMlyOxptydJhmhfIVpNjD
	EBqQP4dyYLQ9bVpSkCM7Z9WGEl9VNtc9b7fSzMmmoDH5Tiuz4gS9ZC+AV5vywkTygSNQL3er1XM
	=
X-Received: by 2002:a05:6402:4416:b0:6ba:c87b:b53f with SMTP id 4fb4d7f45d1cf-6bac87bbebamr1384351a12.22.1795441812759;
        Mon, 23 Nov 2026 05:50:12 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:12 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [RFC PATCH ath-next 1/3] wifi: mac80211: count the segments of a received GSO frame
Date: Mon, 23 Nov 2026 14:50:08 +0100
Message-ID: <20261123135010.721107-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135010.721107-1-julius@bairaktaris.de>
References: <20261123135010.721107-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055014_678266_8CF6EFC0 
X-CRM114-Status: GOOD (  18.23  )
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

A driver with rx decap offload may merge consecutive in-order TCP frames
of one station into a GSO frame before it hands it over, as GRO would
on the netdev. ieee80211_rx_8023() counts every frame it takes as one:
one packet, fragment and MSDU of the station, one packet of the netdev,
and the bytes of the merged frame, which carries the headers of its
first segment only. The counters then report fewer frames and bytes
than the station sent.

Count a TCP GSO frame as its gso_segs frames, and its bytes as those of
the frames it was merged from: its length plus the headers, up to the
end of the TCP header, of every segment after the first. Any other
frame counts as before.

A merged frame to another station of the same interface takes the
internal forward of ieee80211_rx_8023(), which sets ETH_P_802_3 as the
protocol and the network header on the MAC header. The segmentation of
the frame on the way out then fails: skb_mac_gso_segment() finds no
handler for the protocol, and a driver that segments in hardware reads
the IP header at offset 0. Give a GSO frame the protocol of its
Ethernet header and its network header behind it; any other frame is
forwarded as before.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/mac80211/rx.c | 61 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 905fd70491ce..fd7dbd4b0611 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -19,6 +19,7 @@
 #include <linux/export.h>
 #include <linux/kcov.h>
 #include <linux/bitops.h>
+#include <linux/tcp.h>
 #include <kunit/visibility.h>
 #include <net/mac80211.h>
 #include <net/ieee80211_radiotap.h>
@@ -4915,6 +4916,33 @@ void ieee80211_check_fast_rx_iface(struct ieee80211_sub_if_data *sdata)
 	__ieee80211_check_fast_rx_iface(sdata);
 }
 
+/*
+ * The frames a received 802.3 frame stands for: one, or the segments of a TCP
+ * GSO frame that the driver merged from consecutive frames of a stream, each
+ * of which carried the headers the merged one has. @extra is set to the bytes
+ * of those headers the merged frame no longer carries.
+ */
+static unsigned int ieee80211_rx_8023_segs(struct sk_buff *skb,
+					   unsigned int *extra)
+{
+	unsigned int segs, hdrlen;
+
+	*extra = 0;
+	if (!skb_is_gso(skb) || !skb_is_gso_tcp(skb) ||
+	    !skb_transport_header_was_set(skb))
+		return 1;
+
+	hdrlen = skb_transport_offset(skb) + sizeof(struct tcphdr);
+	if (skb_headlen(skb) < hdrlen)
+		return 1;
+
+	segs = max_t(unsigned int, skb_shinfo(skb)->gso_segs, 1);
+	hdrlen += tcp_hdrlen(skb) - sizeof(struct tcphdr);
+	*extra = (segs - 1) * hdrlen;
+
+	return segs;
+}
+
 static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 			      struct ieee80211_fast_rx *fast_rx,
 			      int orig_len)
@@ -4925,6 +4953,8 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	struct sk_buff *skb = rx->skb;
 	void *sa = skb->data + ETH_ALEN;
 	void *da = skb->data;
+	struct pcpu_sw_netstats *tstats;
+	unsigned int segs, extra;
 
 	if (WARN_ON_ONCE(!link_sta)) {
 		dev_kfree_skb(rx->skb);
@@ -4964,12 +4994,17 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	stats->last_rx = jiffies;
 	stats->last_rate = sta_stats_encode_rate(status);
 
-	stats->fragments++;
-	stats->packets++;
+	segs = ieee80211_rx_8023_segs(skb, &extra);
+	stats->fragments += segs;
+	stats->packets += segs;
 
 	skb->dev = fast_rx->dev;
 
-	dev_sw_netstats_rx_add(fast_rx->dev, skb->len);
+	tstats = this_cpu_ptr(fast_rx->dev->tstats);
+	u64_stats_update_begin(&tstats->syncp);
+	u64_stats_add(&tstats->rx_packets, segs);
+	u64_stats_add(&tstats->rx_bytes, skb->len + extra);
+	u64_stats_update_end(&tstats->syncp);
 
 	/* The seqno index has the same property as needed
 	 * for the rx_msdu field, i.e. it is IEEE80211_NUM_TIDS
@@ -4977,8 +5012,8 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 	 * frame, so count MSDUs.
 	 */
 	u64_stats_update_begin(&stats->syncp);
-	u64_stats_inc(&stats->msdu[rx->seqno_idx]);
-	u64_stats_add(&stats->bytes, orig_len);
+	u64_stats_add(&stats->msdu[rx->seqno_idx], segs);
+	u64_stats_add(&stats->bytes, orig_len + extra);
 	u64_stats_update_end(&stats->syncp);
 
 	if (fast_rx->internal_forward) {
@@ -4998,9 +5033,21 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 			 * reclassifying the frame (see cfg80211_classify8021d).
 			 */
 			xmit_skb->priority += 256;
-			xmit_skb->protocol = htons(ETH_P_802_3);
-			skb_reset_network_header(xmit_skb);
 			skb_reset_mac_header(xmit_skb);
+			/*
+			 * A GSO frame is cut into its segments on the way
+			 * out, which needs the protocol and network header
+			 * it was merged with: with ETH_P_802_3 and the
+			 * network header on the MAC header, the segmentation
+			 * finds no IP header.
+			 */
+			if (skb_is_gso(xmit_skb)) {
+				xmit_skb->protocol = eth_hdr(xmit_skb)->h_proto;
+				skb_set_network_header(xmit_skb, ETH_HLEN);
+			} else {
+				xmit_skb->protocol = htons(ETH_P_802_3);
+				skb_reset_network_header(xmit_skb);
+			}
 			dev_queue_xmit(xmit_skb);
 		}
 
-- 
2.53.0


