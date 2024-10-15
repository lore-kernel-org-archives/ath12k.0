Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE54D1D88F
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm0OiFcVjNGVSGfnao3P0E1SrgDDjDIIojY3wLS4LYI=; b=Qq/JfdA4cW+hH9CRQENDiPTNVe
	qx7BGXBOBsXx+xsUsf48/Erq2eVGdHhLO26LtVONwwnabfGeubNjLobeNSKx5Tsl+JN/YdC96A6L9
	DxIpUhXEVZZ7f9gFOivWYkePU6feMR7gRFrpFSSvrGv6u8eRdU7YGt4kJ+jQmxNIJPjM9M6Ml4dno
	WJpTYyxpltCf0T5/pdOKS7Ujy8U6ZTKz7nQb4DzNCFTXkirLcnCYg73SKZ1CDGooUAjLa6vBfADJX
	r86bD9pHyHugXuVdlabvL/nkIYGVyiGx3urGQY6lvlN0xOweI1gS5JjmdF70SXpCHpwaV/z38nQDn
	BKbaWcQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7z-00000008zsN-37dV
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 17:14:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7u-00000008zo5-37Dz
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 17:14:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C82FEA43358
	for <ath12k@lists.infradead.org>; Tue, 15 Oct 2024 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2133C4CECD;
	Tue, 15 Oct 2024 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012469;
	bh=05KhMOzaooeluGWi94e/pW5onMxTOfbE+WujlvKgDHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TcKcQnAusF4c7qqPmqu08iFQxE7Sx1bcJoYRg4wBXb+MY/IHBIpkbQm1MR+1pFoxZ
	 OjR/p9fMOI6oUjwDuPxis3E9WRvwuooVjWzFvArK5olKv03kZVNCJq/Anqvu0pMTsu
	 +cGfWw/wvUK2h7zPFVOQhfedWPepmYKtWeULnPDJnNI4wgKNQyVeeRPd5rs8ow/Hcj
	 OrTBf1Smz+cAao+5d/L+dnM6AP1p1ATNEsA5dGOmH9bg+dEeNjK82rkFw6W6pKsYIc
	 RPE8sWRuh2Tm/vWTHhaTU3cqskG/g1OsFxgxCgPpil7oAEed3H0A3ATj+dmcudF7Vg
	 mtEOEZfg/ml+g==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 09/11] wifi: ath12k: update ath12k_mac_op_conf_tx() for MLO
Date: Tue, 15 Oct 2024 20:14:14 +0300
Message-Id: <20241015171416.518022-10-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241015171416.518022-1-kvalo@kernel.org>
References: <20241015171416.518022-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101430_964965_B5ED429C 
X-CRM114-Status: GOOD (  11.31  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Refactor ath12k_mac_op_conf_tx() to apply and cache the TX parameters based on
the link id provided by mac80211.

While at it, the link id argument of ath12k_mac_conf_tx() is not used so remove
it.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7185cffe7dd4..8771d9738ffb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5127,8 +5127,7 @@ static int ath12k_conf_tx_uapsd(struct ath12k_link_vif *arvif,
 	return ret;
 }
 
-static int ath12k_mac_conf_tx(struct ath12k_link_vif *arvif,
-			      unsigned int link_id, u16 ac,
+static int ath12k_mac_conf_tx(struct ath12k_link_vif *arvif, u16 ac,
 			      const struct ieee80211_tx_queue_params *params)
 {
 	struct wmi_wmm_params_arg *p = NULL;
@@ -5188,16 +5187,16 @@ static int ath12k_mac_op_conf_tx(struct ieee80211_hw *hw,
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif;
 	struct ath12k_vif_cache *cache;
-	struct ath12k *ar;
 	int ret;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arvif = &ahvif->deflink;
-	ar = ath12k_get_ar_by_vif(hw, vif);
-	if (!ar) {
-		/* cache the info and apply after vdev is created */
-		cache = ath12k_ahvif_get_link_cache(ahvif, ATH12K_DEFAULT_LINK_ID);
+	if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
+		return -EINVAL;
+
+	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+	if (!arvif || !arvif->is_created) {
+		cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
 		if (!cache)
 			return -ENOSPC;
 
@@ -5208,7 +5207,7 @@ static int ath12k_mac_op_conf_tx(struct ieee80211_hw *hw,
 		return 0;
 	}
 
-	ret = ath12k_mac_conf_tx(arvif, link_id, ac, params);
+	ret = ath12k_mac_conf_tx(arvif, ac, params);
 
 	return ret;
 }
@@ -6962,7 +6961,7 @@ static void ath12k_mac_vif_cache_flush(struct ath12k *ar, struct ath12k_link_vif
 		return;
 
 	if (cache->tx_conf.changed) {
-		ret = ath12k_mac_conf_tx(arvif, 0, cache->tx_conf.ac,
+		ret = ath12k_mac_conf_tx(arvif, cache->tx_conf.ac,
 					 &cache->tx_conf.tx_queue_params);
 		if (ret)
 			ath12k_warn(ab,
-- 
2.39.5


