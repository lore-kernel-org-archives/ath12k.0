Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F9EC5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCs3m/nbR42yHyoYS36kqATC6DY/xbaSZxxoT3A5Xys=; b=Szr/4a/sqfIPwpnWbMBjaUS39k
	qC555Vrq+mvBJPiEQWq/jfNcWzfbdksWOB9G0T/m8V1svtUX902KSHDDu8I38htDEhSg9ZuyWZkMk
	Srq7pVwTBej/aJrDw48+KHJUuwebwyOTHqGSijf+Ow83knmLHdSzIzHoYwwwnhdvUAwRfjfoF2vKi
	LLqxBFz7NGwjrWacKhpmtW4Au2aoRdFOoNUNR0aPn/UJ5FgNYNSiefhxrY1cLhQApS5qE5aPFKMkP
	pInxw9eBoT+kpeZJ5TWT5JphvBBALWh7LOCl9oPYmrcIsfzNf8FwA/Ug39fsuzLY8hnQKZPHjOD9R
	AAaT6Kng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfby-00000009lq4-0b2L;
	Wed, 19 Aug 2026 12:41:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfbs-00000009lcV-16QK;
	Wed, 19 Aug 2026 12:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=FCs3m/nbR42yHyoYS36kqATC6DY/xbaSZxxoT3A5Xys=;
	t=1787143296; x=1788352896; b=Q296ymEeG2W52fu3XWIuiYj06txAMEIVEeu7I9gh99uCOqP
	1qxqcIbw1WclAa8MxKT9+6anmTZyHk4xYFXwt7MxY16MHaTH5qe2QQBS/hQAgCMOc/7NULPy5prGI
	qgNuWUd7z5BFPNJcyDYN0KAoJF8xCJpOGEUNIlTFttQYwHI857sKe5dXwWIv6cjMM9eMEUuXjIGzE
	Vg3u/V0q+w8GJv6HqxT+fbazQLycItWUx+d4Ywk/1rg4P9ZuJhL50gWFWuevTAHbLB5jTztRmVsNi
	mNC9UyWe3fYNa+EuGF6l/E94qHDn5hTcKIcTa2P6ebRdj9zd7SvadLNA2BrSNmTA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1wwfbd-000000089Cs-2pK4;
	Wed, 19 Aug 2026 14:41:22 +0200
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
Subject: [wireless-next PATCH v2 8/8] wifi: mac80211: pass error station if non-STA transmit was requested
Date: Wed, 19 Aug 2026 14:39:07 +0200
Message-ID: <20260819143858.594e05877995.I5ffe7bc0d4ccefca5c1e506d5d3d482e13989cda@changeid>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819123858.4025935-10-benjamin@sipsolutions.net>
References: <20260819123858.4025935-10-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_054136_333110_1A20F74C 
X-CRM114-Status: UNSURE (   9.30  )
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

v2:
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


