Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56F606A321
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OVaiFGx5;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Qk0djgsR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=; b=OVaiFGx5QUKO+h
	rIvBAnHJr0tUkGvDnt8BVacWleSnIVzB9jUpK6wTM+2QkhMEA4WzKB98QW0lHjNvl/k+AFVyFsIqq
	zRP/5Q5o5hBSmMgUx2Kizq9UTC5Ktz6DaqaiJWUICPzkJ1tbHWVIMiEbZe+SKlr7JhVnVVx2igLJq
	3RC3Xl16KEKgpvXOQx3SOTQ+x0L8yL063xZwBCIkfE48v3UZsG7C2RCGqRQinwpk63FTuJZIfMd/n
	XGr8K89O5Hr2CVXmaJcC/yMoV02ZNV3nPsJO1acpa8fysJBWB92fHPoB+eCuxR/OFqgpgnNkmkmHc
	yEe6pSb9TOMUm1fXJrIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUR2-00000003dM1-3C5f;
	Mon, 23 Nov 2026 13:50:20 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUQx-00000003dGv-1dRs
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 13:50:18 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso3667256a12.2
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 05:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441814; x=1796046614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=;
        b=Qk0djgsRTKYHY0YDlHti8kS4INt9167/0xWKJO9dkDlc55kQFOvOddEGwcpnHkh9V3
         0DR6ucOuq9WUfmb3ESj/QNCNyHLQhJMNNUFSMMtMNZotooMNd75Yv7Scr9htHwEvkjgP
         6KC1tK+S+gXLsUVY9o7sYT+8B6Lf1u923UdepqQo5EtpzbS0pyD4CfzPzF9apRQINMCj
         1bpQ+q0lieV76hCPDHVxO9417ZfP4H6I9oJmfzgjJoaEPFh/YghVtf4mnHfucUXitBmn
         keHVUfO+P3EfxCpu0dtfPtBXVsSKsSNzFwQRo/swtbiSbhBgXiFTAbmD2cg4FVZbKx3F
         alpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441814; x=1796046614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=;
        b=bM0wPdtEGhVldQhA5CuCeFeHyhB/BtKoAlpUFuS2mad1XpCku3hUP+xnt0H1dR6yNk
         DJdcST1OtF2ETFvGB8dqTQwdDNxt7EtNDAgek95SHCCeqO/upQvm1BbDcZcUdFJgGD5W
         mBULIG4dlzwxokJe6XSUxMjowvOR8x4RKuBkN8vFXIx3Qt0I27fXivwkbWkFPmmeaTEm
         5NUq5hwaqskbSUcIXpzKn2GgMW960ADUSQDquuujLksE0CdfAHrN9FU3UyVrKA0EnQj2
         rCzLDsi2yknz1CR5fOKFk3eRPxzlVS01ZyBOObmfu+oOteuRcYWDP46GTv6GZ21qpJ91
         Kq7w==
X-Forwarded-Encrypted: i=1; AL+hErHCfl3ggATHnUaMU/GPYj53bY0zDmapI+WlcHa0tyj+jRMf5dWHmK5458CM2WsLCzNIncCwltM=@lists.infradead.org
X-Gm-Message-State: APuU4Z+uCp9WcO3kHf1NHE7T4fUD5S9ZVBUIibWqxZF7bbW+RZju0K9o
	LSYbDD6KxLRyemw92qFzWJxz9fZ9zIIdSQgO5tqYPeqz1HZN7x1srBKenNzcDbp0ng==
X-Gm-Gg: AZFdTZe1ClABzKAKqxCs1NMDAlEsz4VKbEs89iwZHGW5EVFSSPrfYOKVHnaOvaPrLKP
	83D5yyPHykboBqYO56deMKJVC6Djgd7lZdjDQT+VwM6BVMmNORztAJO1LAwaUvvtSn//oysHsc1
	G+e3xs4Yx6/Wn14pmkDt4DgNMueKRWY7hq59vNSSehO7l9olwcK+4YdsdoEBIJpfy9yivbdZBeU
	3icdwSk31RswCKyREIaZ5/XMB2/YSpWhSQ0KvpM5DXGr2woAf/wMH0B4YfqRNCHZv9XXw/PoME0
	pn35ATTP4tgHqY4wmsFfogB+RkzhiJ6lkhYw2kAiAuv5iyLdIl5Hsf9IgWB1qr/eqtXgzaLwK+5
	sualFyrEYvkcyWxEFvAcz86IqnC1otZlP7FKATxq2UXOcFq7ryPXUrXlM4mAw+fUjsI6eDLMcON
	TDPtO69AMd7l62XMakHPMRVibqLUvyZkyFrz35uQUAPhgY3zocOMj84TyneJf9jmjEudg/EQ9Nr
	x1WMNHByHOWo7m854+yXST927fnz5FxJqzZsaw1BXcN8YhBBUUnBFjrjKDR+skQQCLm8q91lq53
	uXWlrJlGQhNJLsi0jJjb/dr8xS8MBew8VF/GHZYD+hnpCarYtssHxiDOOft+IHFoq+1PuKDPkRf
	H4NVk45XSTiGXWD+N8WjogxMiXUjKckL7cXaaQm2ZleA/+C99Vf/WaoT9zUZsn3Ow2BsRFlYyG5
	7N5Fc7/AoXArZKrYkqnVNCJ9hJj/d1P5MXG5XlLW8vdAP2Bz+xldxhOtnK1W4lUERILsgsOCEpD
	YwU2fcwCudvomoHaOlTCwiKXs/H2JkcQhi0O3+eJ4cw8j1A7JJ07MEDrwWLtFzLf8wSVnOtQqdb
	biaKFt+amWMGjqioDouk3lKF1g5L7ZWj4gR+fur2StDYXXsQVJbRtBkigyjbooP7639ju7GDLA=
	=
X-Received: by 2002:a05:6402:1f0b:b0:6b5:87cb:d8ce with SMTP id 4fb4d7f45d1cf-6ba37edf001mr8720032a12.41.1795441813634;
        Mon, 23 Nov 2026 05:50:13 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:13 -0800 (PST)
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
Subject: [RFC PATCH ath-next 2/3] wifi: mac80211: tell a driver the netdev a station's 802.3 frames reach
Date: Mon, 23 Nov 2026 14:50:09 +0100
Message-ID: <20261123135010.721107-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135010.721107-1-julius@bairaktaris.de>
References: <20261123135010.721107-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055015_494889_72C5387C 
X-CRM114-Status: GOOD (  13.85  )
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

A driver that merges the received frames of a station as GRO on the
netdev would has to know that netdev: whether GRO is on there, whether
it builds frame lists, and which host sockets it looks up. The netdev
is not the vif's for a station on an AP_VLAN interface, and only
mac80211 knows which one the frames reach: the device of the station's
fast_rx, which __ieee80211_rx_handle_8023() delivers them to and drops
them without.

Add ieee80211_sta_rx_netdev(), which returns that device under RCU, or
NULL while the station has no fast_rx.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/mac80211.h | 17 +++++++++++++++++
 net/mac80211/rx.c      |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 76ff86ff9974..3c6784ad62c7 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -5472,6 +5472,23 @@ void ieee80211_rx_napi(struct ieee80211_hw *hw,
 		       struct ieee80211_link_sta *link_sta,
 		       struct sk_buff *skb, struct napi_struct *napi);
 
+/**
+ * ieee80211_sta_rx_netdev - the netdev the 802.3 frames of a station reach
+ * @sta: the station
+ *
+ * A frame the driver hands over with %RX_FLAG_8023 for @sta enters the stack
+ * on this netdev: the station's AP_VLAN interface if it is on one, else the
+ * interface of its vif. A driver that prepares such frames for the receive
+ * path of the netdev, as merging them the way its GRO would, reads the
+ * netdev's settings from it.
+ *
+ * Must be called under RCU; the netdev may be used until the read side
+ * critical section ends.
+ *
+ * Return: the netdev, or %NULL while frames of @sta take no 802.3 path.
+ */
+struct net_device *ieee80211_sta_rx_netdev(struct ieee80211_sta *sta);
+
 /**
  * ieee80211_rx - receive frame
  *
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index fd7dbd4b0611..397f5fc71a1b 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5310,6 +5310,15 @@ static bool ieee80211_prepare_and_rx_handle(struct ieee80211_rx_data *rx,
 	return true;
 }
 
+struct net_device *ieee80211_sta_rx_netdev(struct ieee80211_sta *pubsta)
+{
+	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
+	struct ieee80211_fast_rx *fast_rx = rcu_dereference(sta->fast_rx);
+
+	return fast_rx ? fast_rx->dev : NULL;
+}
+EXPORT_SYMBOL(ieee80211_sta_rx_netdev);
+
 static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 				       struct ieee80211_link_sta *link_pubsta,
 				       struct sk_buff *skb,
-- 
2.53.0


