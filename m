Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6686AE7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 20:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUslnFN5QWO95wPUwpIqqrKtWKkn/rEgavMPR/CUz9k=; b=cL1Tfh3JdBvxUcA/nzWVMS/DwW
	r+TrBrbsiL6t4CnYc05CZkpJUxFpczAlyPpiDKLWjSrvv7ar19RmWwmC6ApGERDjrLJEOgBQ2iSPh
	etlV1H0qbNH7a7+/E26dWXY2i8DEl0aie7e/YvpE4KsLfg9Tj/WnI+T2k/XvwrhHBp5lUxfJmrJpA
	v/kcrw4HU4PRqaaEWy8Bb67j8f3CD2Zf6GzOEXLSX3foxMBbUgSUUNKmcSL8c5S6p8geUD4j9XzeW
	Oh2VlS7RIjY+xi3fa7isjh4kt069skvHnWKsnXPd6TrHk4vNWvth4fJSGfyPJsKQecLW/X4Ef/10a
	mAhP0n5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe9D-0000000EkGr-0iQ4
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 20:26:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe9A-0000000EkFJ-1Tyb
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 20:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B481A5C594B
	for <ath12k@lists.infradead.org>; Tue, 17 Dec 2024 20:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A77C4CED7;
	Tue, 17 Dec 2024 20:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734467183;
	bh=szKv4c+yIO8qpqVrfikQ7GZl6LC2oSeWMMQ6QkdbdLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oPe7YA12IiP7UuVtrgt9k7bcZKqTM914yb2GhTqIREs9gWk62KjasVBtHx/BvVQGe
	 n7diYP2LJJPTAWXXsFKr7RelCB9MT0dghkNSiRY94n0Pz0JraN6eo3uOu6JPt7jvXT
	 BZbwYY23mIJzMmauR4wUtxdEVFTzPQXmczwOu1s7DLZ9WL9JawMiafj03olqYg1yrs
	 YA/HY6XuolzIFLnYjYqrsRwUbSd07hKsiERBwpfsj/pTTPz0xnybWhF9NScve5kDGT
	 FHIUjgdpfGCTHF+4otkj/PqOI+JyRmCAuv4DZsFt7D+BbP3uodgEWWoKt0MbUQhgDm
	 dBrRsWJ0mRXzA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 3/4] wifi: ath12k: Decrease ath12k_sta_rc_update_wk() stack usage
Date: Tue, 17 Dec 2024 22:26:17 +0200
Message-Id: <20241217202618.1329312-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217202618.1329312-1-kvalo@kernel.org>
References: <20241217202618.1329312-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_122624_507663_5E416443 
X-CRM114-Status: GOOD (  10.57  )
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

From: Jeff Johnson <quic_jjohnson@quicinc.com>

Currently when building ath12k with llvm-18.1.7-x86_64 the following warning is
observed:

drivers/net/wireless/ath/ath12k/mac.c:4946:13: warning: stack frame size (1112) exceeds limit (1024) in 'ath12k_sta_rc_update_wk' [-Wframe-larger-than]

A major contributor to the stack usage in this function is:

        struct ath12k_wmi_peer_assoc_arg peer_arg;

Avoid the excess stack usage by dynamically allocating peer_arg
instead of declaring it on the stack.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2a30a11903c5..10293e9c1d49 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4956,7 +4956,6 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 	u32 changed, bw, nss, smps, bw_prev;
 	int err, num_vht_rates;
 	const struct cfg80211_bitrate_mask *mask;
-	struct ath12k_wmi_peer_assoc_arg peer_arg;
 	enum wmi_phy_mode peer_phymode;
 	struct ath12k_link_sta *arsta;
 	struct ieee80211_vif *vif;
@@ -4992,9 +4991,14 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 	nss = min(nss, max(ath12k_mac_max_ht_nss(ht_mcs_mask),
 			   ath12k_mac_max_vht_nss(vht_mcs_mask)));
 
+	struct ath12k_wmi_peer_assoc_arg *peer_arg __free(kfree) =
+					kzalloc(sizeof(*peer_arg), GFP_KERNEL);
+	if (!peer_arg)
+		return;
+
 	if (changed & IEEE80211_RC_BW_CHANGED) {
-		ath12k_peer_assoc_h_phymode(ar, arvif, arsta, &peer_arg);
-		peer_phymode = peer_arg.peer_phymode;
+		ath12k_peer_assoc_h_phymode(ar, arvif, arsta, peer_arg);
+		peer_phymode = peer_arg->peer_phymode;
 
 		if (bw > bw_prev) {
 			/* Phymode shows maximum supported channel width, if we
@@ -5096,9 +5100,9 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 			 * other rates using peer_assoc command.
 			 */
 			ath12k_peer_assoc_prepare(ar, arvif, arsta,
-						  &peer_arg, true);
+						  peer_arg, true);
 
-			err = ath12k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
+			err = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
 			if (err)
 				ath12k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
 					    arsta->addr, arvif->vdev_id, err);
-- 
2.39.5


