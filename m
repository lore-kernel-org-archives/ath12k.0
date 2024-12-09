Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A83E77180
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=um/DkaIiyn4STK2Pxzp+06SH7vDvWcyOTmWykVcXyBY=; b=ipwtWVwg2lxO/dp8HtAd0ccYaz
	6zS2d7Q+YlH8fJoYSC5/c6SgwG7qEDZV0xEscSFJXt8GVh5JE/FwP66ss48Ru9mXljXKPIkjEzmtC
	NNFVf096RPjDyzj8Z1Y01swoc+5SWomaOubOfB4PqZMm35WPeXvsr01kKL30gsFegh4BGCFkpV1QC
	YZK+HnBRuCBdfGuOg4N7W010t7bWCGOJPD+3aR/ugvJ+B44ypTECmC5oRRGFTuiaMJrCScVcQLj+J
	uxsRtEqHdzK2wY1sOodHIk2okC/qpDLHi+h3hyJH0ohsGr/O4dZbzDd1ygCWC7jbVOYoRANFXOjQ1
	bA28BYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitr-00000008wBu-2zT8
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:54:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKito-00000008w7t-2JYi
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 18:54:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 825CB5C5FDF
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 18:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345D5C4CED1;
	Mon,  9 Dec 2024 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770467;
	bh=hsXLb+QVjti8J3fnkWsLaJoZiRryxwvTmmZEee+NO4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nbj6LwXjErUwO00np+V48ahiIOYB8YqG3eUyxGrbX9u9JriIlSN/2YdzD/HnoAluG
	 izLTVWme2XFrpHdFvVoFfX+UqU7CT7xzL5b9pb1s67BDFwKQRgu7n6jr/NHrRMO7+E
	 UQW5Slc6Jp9wPoqEKe1zmb1J3N5L1MkMR1vdvHDQk2MbRn0KrByhGeQvj4WJIHRbtd
	 B1v4L1IKeu4hwd/Bpxcn3KZGPxg2YxZ+NQI+OJ6UKqjYFCspCpV3m3Q84o9ZK1Egxl
	 mPCbU2RrogUWCym1BzuJVUA6z6DJ4dDSjayPe4tWRzo3UUddM/WjVHcgwfvnN5MS1I
	 ZB802wntUJgvA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 4/9] wifi: ath12k: introduce interface combination cleanup helper
Date: Mon,  9 Dec 2024 20:54:16 +0200
Message-Id: <20241209185421.376381-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209185421.376381-1-kvalo@kernel.org>
References: <20241209185421.376381-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105428_672423_2EBC64F6 
X-CRM114-Status: GOOD (  10.25  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Introduce a cleanup helper function to avoid redundant code for interface
combination cleanup. Remove the cleanup code from ath12k_mac_hw_unregister()
and ath12k_mac_hw_register() and replace it with a new cleanup helper function.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7e8eb0feb871..dc61fe761090 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10351,6 +10351,14 @@ static bool ath12k_mac_is_iface_mode_enable(struct ath12k_hw *ah,
 	return is_enable;
 }
 
+static void ath12k_mac_cleanup_iface_combinations(struct ath12k_hw *ah)
+{
+	struct wiphy *wiphy = ah->hw->wiphy;
+
+	kfree(wiphy->iface_combinations[0].limits);
+	kfree(wiphy->iface_combinations);
+}
+
 static int ath12k_mac_setup_iface_combinations(struct ath12k_hw *ah)
 {
 	struct wiphy *wiphy = ah->hw->wiphy;
@@ -10479,7 +10487,6 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
 static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 {
 	struct ieee80211_hw *hw = ah->hw;
-	struct wiphy *wiphy = hw->wiphy;
 	struct ath12k *ar;
 	int i;
 
@@ -10493,8 +10500,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 	for_each_ar(ah, ar, i)
 		ath12k_mac_cleanup_unregister(ar);
 
-	kfree(wiphy->iface_combinations[0].limits);
-	kfree(wiphy->iface_combinations);
+	ath12k_mac_cleanup_iface_combinations(ah);
 
 	SET_IEEE80211_DEV(hw, NULL);
 }
@@ -10724,13 +10730,13 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	ret = ath12k_wow_init(ar);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to init wow: %d\n", ret);
-		goto err_free_if_combs;
+		goto err_cleanup_if_combs;
 	}
 
 	ret = ieee80211_register_hw(hw);
 	if (ret) {
 		ath12k_err(ab, "ieee80211 registration failed: %d\n", ret);
-		goto err_free_if_combs;
+		goto err_cleanup_if_combs;
 	}
 
 	if (is_monitor_disable)
@@ -10760,9 +10766,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	ieee80211_unregister_hw(hw);
 
-err_free_if_combs:
-	kfree(wiphy->iface_combinations[0].limits);
-	kfree(wiphy->iface_combinations);
+err_cleanup_if_combs:
+	ath12k_mac_cleanup_iface_combinations(ah);
 
 err_complete_cleanup_unregister:
 	i = ah->num_radio;
-- 
2.39.5


