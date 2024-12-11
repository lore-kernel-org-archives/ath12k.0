Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87461E7717D
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIXNZWOgQZjCt2axMlmQyI00607oCb1zTMrXhv4vsMo=; b=NeLTtNs5g0tr2khGG0dv21Oa14
	hlT+va+P9lEpZxZ6B5ljH6kT/mb7wz+7OCCA4URQ9icSdc44NlJAmqFlH/CAo5YHUHCWhrAKEkwSO
	5+nL4MVRPVW5ZHUObksBMGI89VSfZ7KT3/u2Z88+MpYhhgl9/+QHn5WA/sdUy1Od//cLALElOVwCk
	ZAebNxfwZfa5HvX5MAF/ttQcI74LeQAXCt+eytiLc9i4KPdcsJI7cgbOd/rgwfuxjuzjnUjbgCQXJ
	LIW9EfTIwwyA3zrbIo1ZNBl5hoeY6EdNSfueoEzqMsENAklOKc8q/sl0CFAaeehFc5cDeiZBYiyWw
	kmUxD7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsh-0000000FIyx-1CXY
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:44:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsd-0000000FIw7-3Vuu
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1C545C62E8
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAB7C4CED4;
	Wed, 11 Dec 2024 15:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931843;
	bh=tboF5zHLY+awhgwSforkB0qKkI0bgoMMkM7j9lFOmSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mvesHzblt61sucaDo3KfWUzSH0vNIQLvUZ3zdFmrMZB72UidWNE9TipesK9hxaeXI
	 BF98FgquR1Gdh9+XajqVPzgmzooWR7cEbbPR59GHzDYbkoMkHi54kfjBvKNCTQ9F4Q
	 rhWs/773ZliEctwPbGtt3l7Hi0MZa0QjJHKKum61jHHpHUakcbCmyIIXIHV6jAXkEe
	 bstg9Zh+x0QKD3WfX8DjAeTpJzLj5TWr26v8xlFgTJgnKJSoD0SAnaW8sFZ/pQzrf/
	 P6NT3HTXCjWcgv3i/ruzhlsL1xU0MikMWr89NlJVHaj1OHsVZEyP4ntw4VWYJmmBrP
	 THVliyEIQ8PHw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/7] wifi: ath12k: add can_activate_links mac operation
Date: Wed, 11 Dec 2024 17:43:53 +0200
Message-Id: <20241211154358.776279-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211154358.776279-1-kvalo@kernel.org>
References: <20241211154358.776279-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074403_978304_AD2A1AAE 
X-CRM114-Status: GOOD (  15.96  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

When operating as an ML station, mac80211 initially activates only one link in
the driver until the peer is authorized. Once the state changes to authorized,
the driver should call mac80211 API to activate all other partner links.

Before doing so, mac80211 checks if the driver supports activating links via
the can_activate_links mac80211_ops. Therefore, add support for this
mac80211_ops and call the API to activate the links once the state changes to
authorized.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bd5a3c790c3b..7962bfa955ba 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5645,6 +5645,19 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 	}
 
+	/* In the ML station scenario, activate all partner links once the
+	 * client is transitioning to the associated state.
+	 *
+	 * FIXME: Ideally, this activation should occur when the client
+	 * transitions to the authorized state. However, there are some
+	 * issues with handling this in the firmware. Until the firmware
+	 * can manage it properly, activate the links when the client is
+	 * about to move to the associated state.
+	 */
+	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION &&
+	    old_state == IEEE80211_STA_AUTH && new_state == IEEE80211_STA_ASSOC)
+		ieee80211_set_active_links(vif, ieee80211_vif_usable_links(vif));
+
 	/* Handle all the other state transitions in generic way */
 	valid_links = ahsta->links_map;
 	for_each_set_bit(link_id, &valid_links, IEEE80211_MLD_MAX_NUM_LINKS) {
@@ -5939,6 +5952,15 @@ static int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 	return 0;
 }
 
+static bool ath12k_mac_op_can_activate_links(struct ieee80211_hw *hw,
+					     struct ieee80211_vif *vif,
+					     u16 active_links)
+{
+	/* TODO: Handle recovery case */
+
+	return true;
+}
+
 static int ath12k_conf_tx_uapsd(struct ath12k_link_vif *arvif,
 				u16 ac, bool enable)
 {
@@ -10249,6 +10271,7 @@ static const struct ieee80211_ops ath12k_ops = {
 	.remain_on_channel              = ath12k_mac_op_remain_on_channel,
 	.cancel_remain_on_channel       = ath12k_mac_op_cancel_remain_on_channel,
 	.change_sta_links               = ath12k_mac_op_change_sta_links,
+	.can_activate_links             = ath12k_mac_op_can_activate_links,
 #ifdef CONFIG_PM
 	.suspend			= ath12k_wow_op_suspend,
 	.resume				= ath12k_wow_op_resume,
-- 
2.39.5


