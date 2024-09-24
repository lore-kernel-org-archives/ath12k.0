Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D411CF9C74
	for <ath12k@archiver.kernel.org>; Tue, 24 Sep 2024 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WvxsfpUAiQBxF/OVKJ0XYW7GEU5FNEXXxLYUMI4E4Y=; b=r4s6ULMEBCuzCUO1vJewY+LypZ
	/dZ06BBoD/Yo+9AeSuXFU79lsR+qfq91PeUafYtwE+baWsiWWF+P+6ZrOiwOShunrXnL6z/s1NhEN
	+TZoBv1KYv5DcfXYt2tC/Wg+9s7g3b4Ieu52HVdEAx+RtZJ9KIP5ldNs5ca0bSqzGpNRlaCbPMJvu
	eV0supxYZHs//6mjF/6fl0oqZLkd4+RwiBUAQQy+9I6mopVKk+CrFaUEUc2eQAy1u/64d1yl5tlcm
	O99LxkU0Eu88osComSdscl2JWqTgAweO6RRaXyeLDZEkKJJxGYdSN5/uK3j3BwgzzOrNGQcOAuRR0
	WPTGa6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1uI-00000001oZo-2j0B
	for ath12k@archiver.kernel.org;
	Tue, 24 Sep 2024 09:32:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1nQ-00000001mxc-3vPZ
	for ath12k@lists.infradead.org;
	Tue, 24 Sep 2024 09:25:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D1AE5C5BB9
	for <ath12k@lists.infradead.org>; Tue, 24 Sep 2024 09:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08C2C4CEC4;
	Tue, 24 Sep 2024 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169924;
	bh=rYtGyWpC26I/ebghKbl9rCOAPkWyD+5nJWTsF72QZ2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t7n/UDmZRNw/R/2/XhcaByslW874ctCeStr/Pn4+4z8eknji/dhPeo5I/FJGXm40U
	 fbE61PgpJtqrUYGFJra4NtOyUgZELuxRnyeyotxRNFp4vzc8L1vmoNx8F1Uns3GUua
	 B21pxf5a8HYGjWnun+nPhTtS5lNtpKZxE7HZW/doGSIvQIxem9t4txSHX9QI+SpC1t
	 h+bF4Vdfv5csdaFGnDES0WNYUJmLzaCS2DLPIwfVammlUh2yfuZLi4k6TlXMExz2tB
	 t1lLGKIMQldcL1lQc89uJYq9ZyjTS68kVYUq7NePIfLWCd0yTt5sWXlRt0VTLG5guJ
	 aNqiii4RMwlxA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC v3 6/6] wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk cancellation
Date: Tue, 24 Sep 2024 12:25:15 +0300
Message-Id: <20240924092515.1049885-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924092515.1049885-1-kvalo@kernel.org>
References: <20240924092515.1049885-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_022525_042858_903A194C 
X-CRM114-Status: GOOD (  11.71  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Now that we have switched to using wiphy_lock() there's no need to have
update_wk cancel call separately, for consistency move it to the rest of code
handling IEEE80211_STA_NONE state.

No functional changes.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index c41740734fc8..dfd02b0c6bfc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4566,11 +4566,6 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	struct ath12k_peer *peer;
 	int ret = 0;
 
-	/* cancel must be done outside the mutex to avoid deadlock */
-	if ((old_state == IEEE80211_STA_NONE &&
-	     new_state == IEEE80211_STA_NOTEXIST))
-		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
-
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar) {
 		WARN_ON_ONCE(1);
@@ -4591,6 +4586,8 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr, arvif->vdev_id);
 	} else if ((old_state == IEEE80211_STA_NONE &&
 		    new_state == IEEE80211_STA_NOTEXIST)) {
+		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
+
 		if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
 			ath12k_bss_disassoc(ar, arvif);
 			ret = ath12k_mac_vdev_stop(arvif);
-- 
2.39.5


