Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE19C88E7B
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3qD+/A7jhv0PWCPSvpwUGPxq8lg0rVk9lWjUUhnDS4=; b=BunX3t2uWMyBBC/Oj33O+fzcv5
	Nnjjc6ZvaxJ8Owhtkl7m9oy9pJvndxXtnwW7LTjtSD+FfgTRzCLeMYB3ZAtTwHpWx8JfafIIc58Dt
	738WmM4tS5jRR21P+nxBkqScQoNoYh7q4zkaVgTI7bf6wxkrYHux4jXOl7nk2ildci9pblNJ2cJMA
	XvLHiJrTovPfo2AUPiQFSTf7rhtE4LT+qG3mwmd+fQa16E4WkOVBzOqiQ2sP5Vmig7P8Etwelj7+3
	eWzVeaEtPqbWfo2jNt46gtgDkT/VBV60ZA+l7lWLMN2vV+c56Z4qn/2RyGNKjlT/r/0sSXVhm9QO8
	xjL+IprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T72-00000006hNC-1SGI;
	Tue, 15 Sep 2026 13:22:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6T70-00000006hKr-1bYc;
	Tue, 15 Sep 2026 13:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z3qD+/A7jhv0PWCPSvpwUGPxq8lg0rVk9lWjUUhnDS4=; b=br+CI4bkOhTdrdGmAsLNP5YsCn
	kCrdRCJruYYRpJYgY2uNCiddAD7DByUjQ35vfgFxVdS9svIstBvPIz/WsKOtpSmCvkuLUl8sd+15p
	3TgR1OSmfwfHuKAfOI47dhyBPITLLkjYE47PtD191S3thwlIs3/zjXmaDXhOPFaCFn/p2Td60M7LD
	itxZOJU5k2Y0R2bdJh0fXou3zU9GbRpyjRP6EeeuiCw3ppmYl2FijozoBQf9GfNM7sDoGB/7lOlpG
	vZB7gVgOzirXZs+bTV9NVpaqBRybQvkXcY7uejm8wb7ieMtH7N9xCZ1kl7DZluZLfw2Pa8906k6Ka
	Z8saWTmQ==;
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6T6x-00000006oJz-36ys;
	Tue, 15 Sep 2026 13:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Z3qD+/A7jhv0PWCPSvpwUGPxq8lg0rVk9lWjUUhnDS4=;
	t=1789478531; x=1790688131; b=D0dnmiZCPc9rPuCUJ2TIf0E+FdJ1QDd9F0x0cwSBvRRlNIo
	GwOrCZs90XeA2ldAamU5oBcTaqNpHs5l5Qp6cnY2bjkoGwi7XS7aaMyVu9w0f6NsOppO3VBtwvC94
	VZzliboZtHC76eeH93g9lXB0Qpyo3eMkkhLJSCj7Qv48Onsw9qzAWoZFFWXfbjtSknZp3M1PGuSD8
	lcMEY5xWvnaipdRy7SV9Fo2fIvWbbBm2PYYcJP17uTmpLsTNDYIYUxnX1p6QQo/IYEhApuFf0OR4j
	yof9OSyVYyOP0IizEYAS82pqWJqmiSKExwja1l8IqvC3HH5d3ZUF4sLu79EbjctQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1x6T6n-0000000H08V-3olp;
	Tue, 15 Sep 2026 15:22:02 +0200
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
Subject: [PATCH wireless-next v4 8/8] wifi: mac80211: pass error station if non-STA transmit was requested
Date: Tue, 15 Sep 2026 15:19:34 +0200
Message-ID: <20260915151925.92499fb21e4a.I5ffe7bc0d4ccefca5c1e506d5d3d482e13989cda@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915131925.1780764-10-benjamin@sipsolutions.net>
References: <20260915131925.1780764-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_142211_888862_56C359BF 
X-CRM114-Status: UNSURE (   9.14  )
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

When cfg80211 requested a transmit without a station, pass an error
station to ieee80211_tx_skb_tid instead of the correct one.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>

---

v4:
 * Fix typo in subject

v3:
 * Fix logic error in v1 update

v1:
 * Only pass error station if NO_STA flag is set
---
 net/mac80211/offchannel.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/offchannel.c b/net/mac80211/offchannel.c
index 5cec8747b193..ddd7a96a2f81 100644
--- a/net/mac80211/offchannel.c
+++ b/net/mac80211/offchannel.c
@@ -854,8 +854,10 @@ int ieee80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 			need_offchan = true;
 
 		rcu_read_lock();
-		sta = sta_info_get_bss(sdata, mgmt->da);
-		mlo_sta = sta && sta->sta.mlo;
+		if (!params->no_sta) {
+			sta = sta_info_get_bss(sdata, mgmt->da);
+			mlo_sta = sta && sta->sta.mlo;
+		}
 
 		if (!ieee80211_is_action(mgmt->frame_control) ||
 		    mgmt->u.action.category == WLAN_CATEGORY_PUBLIC ||
@@ -884,7 +886,8 @@ int ieee80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 		     local->ops->remain_on_channel &&
 		     memcmp(sdata->vif.cfg.ap_addr, mgmt->bssid, ETH_ALEN))) {
 			need_offchan = true;
-		} else if (sdata->u.mgd.associated &&
+		} else if (!params->no_sta &&
+			   sdata->u.mgd.associated &&
 			   ether_addr_equal(sdata->vif.cfg.ap_addr, mgmt->da)) {
 			sta = sta_info_get_bss(sdata, mgmt->da);
 			mlo_sta = sta && sta->sta.mlo;
@@ -1022,7 +1025,9 @@ int ieee80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	}
 
 	if (!need_offchan) {
-		ieee80211_tx_skb_tid(sdata, skb, NULL, 7, link_id);
+		ieee80211_tx_skb_tid(sdata, skb,
+				     params->no_sta ? ERR_PTR(-ENOENT) : sta,
+				     7, link_id);
 		ret = 0;
 		goto out_unlock;
 	}
-- 
2.55.0


