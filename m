Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0947DCFB44F
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM2akAghCyfWGehS1CPkVrSV39ZmmPqCIVkaAB1yiho=; b=xniOYVYmdja7ZaCy+SAWoTpZ6k
	sj4z3TUaZPb5wBn0ey0b0W+xUnBVnsowSd88qTEpeANSpr6zEfbgR+RaaZK/8Oq14UUl07BZkcJ1j
	AHcWRhJYHci+MTgR0GO0IcGcGoSasiWnaNOUlUCF3fJ8CCgGP4IWEenF7ikVKDa0dLMZHJhmaa+BS
	U1p4rIvovsLcusmpSiGlp57SgN66USaZvqUK50u7IyAqlXgMYpg6ufZLP29f6V47WlXjHpREYG9nh
	8TxXK4HNWydKzzsolrRLgE7anx7Y22ugtmvgZ21cC9fPBgxWhd8/fkPG2gwT/65kUhld9wXHFbvtl
	XPf8DEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5p-00000003GRu-2rHW
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 17:00:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5D-00000003GLI-0MfW
	for ath12k@bombadil.infradead.org;
	Mon, 07 Oct 2024 16:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GM2akAghCyfWGehS1CPkVrSV39ZmmPqCIVkaAB1yiho=; b=Rou6mFMiBsSy0Aw9jgCrdW8PTA
	edRSAmzNcrbqmSYmPeDyIlpp6BWCRa6T3ZYbHEZpQ2cBgJrmdLWVYLn02LPGB8wWQkjOa3lGTBg9p
	Vmf8kDqEbwo8i2Zsif4WPnsDJ3rxiWgqehXdwOhvX1rhAlNCUoibrI9hwR0vuB9/qeexUVvbaIqgT
	pXu+3fhYXV19ZgVVU5791vVTDZBx0sSyweWuGYqIVhOICm3YDAcHKBOt/gWNz+bWv/aU1GFBY+Bhr
	oHrup3CT6ktnRIyA9DO3/eLXoiP+cPE65m79AMBn2WgVlli3dF7MaCZYfRJI/SsQx0QRyndaTh/WL
	fj+G17iA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr59-00000004SkJ-1PbI
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 16:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87C9BA41D17
	for <ath12k@lists.infradead.org>; Mon,  7 Oct 2024 16:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BA5C4CEC6;
	Mon,  7 Oct 2024 16:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728320376;
	bh=4D0NbqWJHWF8fm96FKs/VR5B6JhWGiEMEUytta2exx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qd+5cnUw5yYWZ4Goz4Rf4AZ1/2HI2n5TWJTIeylz+8U6EU+Xj8Z4pcp8Bs1498b/i
	 mJgtbEfuvcJ0Of7mHXICQX0F2vTY+slhjcqgwLJOaxr2Jb6SnJEkADNhADXda7r2iy
	 mdS08PJ4yhToMGtS3h9aT7ymPLdAv6+wlNFBIXCtrPrHEnLrNjO89SNTBVA08oCGPv
	 6vxUsRv0O0StHGCGQqMOAci+2BxMQuLWlEQVXaj65HpQVgUNlXs46AV6071fw89nY+
	 BqLR27G20Bth/iocZ19tTZ2tdCT4o74cV7BSluW+xZ88GnsFruVJ6293Wz3rI0Av5Q
	 cMNLuMD0g76cA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v4 2/6] wifi: ath12k: convert struct ath12k_sta::update_wk to use struct wiphy_work
Date: Mon,  7 Oct 2024 19:59:28 +0300
Message-Id: <20241007165932.78081-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007165932.78081-1-kvalo@kernel.org>
References: <20241007165932.78081-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_175939_800626_449A8F71 
X-CRM114-Status: GOOD (  12.81  )
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

For preparation to switch ath12k to use wiphy_lock() we can convert
ath12k_sta_rc_update_wk() to use wiphy_work_queue() for consistency. To avoid
any deadlocks do the struct ath12k_sta::update_wk conversion before switching
to using wiphy_lock() throughout the driver.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7f2e9a9b4097..5163b5b07376 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -451,7 +451,7 @@ struct ath12k_sta {
 	u32 smps;
 	enum hal_pn_type pn_type;
 
-	struct work_struct update_wk;
+	struct wiphy_work update_wk;
 	struct rate_info txrate;
 	struct rate_info last_txrate;
 	u64 rx_duration;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8946141aa0dc..34b6caaaf33c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4273,7 +4273,7 @@ static int ath12k_station_disassoc(struct ath12k *ar,
 	return 0;
 }
 
-static void ath12k_sta_rc_update_wk(struct work_struct *wk)
+static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 {
 	struct ath12k *ar;
 	struct ath12k_vif *arvif;
@@ -4289,6 +4289,8 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
 	struct ath12k_wmi_peer_assoc_arg peer_arg;
 	enum wmi_phy_mode peer_phymode;
 
+	lockdep_assert_wiphy(wiphy);
+
 	arsta = container_of(wk, struct ath12k_sta, update_wk);
 	sta = container_of((void *)arsta, struct ieee80211_sta, drv_priv);
 	arvif = arsta->arvif;
@@ -4586,7 +4588,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	/* cancel must be done outside the mutex to avoid deadlock */
 	if ((old_state == IEEE80211_STA_NONE &&
 	     new_state == IEEE80211_STA_NOTEXIST))
-		cancel_work_sync(&arsta->update_wk);
+		wiphy_work_cancel(hw->wiphy, &arsta->update_wk);
 
 	ar = ath12k_get_ar_by_vif(hw, vif);
 	if (!ar) {
@@ -4600,7 +4602,7 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	    new_state == IEEE80211_STA_NONE) {
 		memset(arsta, 0, sizeof(*arsta));
 		arsta->arvif = arvif;
-		INIT_WORK(&arsta->update_wk, ath12k_sta_rc_update_wk);
+		wiphy_work_init(&arsta->update_wk, ath12k_sta_rc_update_wk);
 
 		ret = ath12k_mac_station_add(ar, vif, sta);
 		if (ret)
@@ -4811,7 +4813,7 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 
 	spin_unlock_bh(&ar->data_lock);
 
-	ieee80211_queue_work(hw, &arsta->update_wk);
+	wiphy_work_queue(hw->wiphy, &arsta->update_wk);
 }
 
 static int ath12k_conf_tx_uapsd(struct ath12k_vif *arvif,
@@ -8113,7 +8115,7 @@ static void ath12k_mac_set_bitrate_mask_iter(void *data,
 	arsta->changed |= IEEE80211_RC_SUPP_RATES_CHANGED;
 	spin_unlock_bh(&ar->data_lock);
 
-	ieee80211_queue_work(ath12k_ar_to_hw(ar), &arsta->update_wk);
+	wiphy_work_queue(ath12k_ar_to_hw(ar)->wiphy, &arsta->update_wk);
 }
 
 static void ath12k_mac_disable_peer_fixed_rate(void *data,
-- 
2.39.5


