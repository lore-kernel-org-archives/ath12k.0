Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A77D65530
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQ5qUx9BBcWxpUnZKdl7XEoyV4wLjh6zrJLqd9D2AsI=; b=fuJbhi2OA0OQzTi6+1Q48p0tBM
	zdHLwbDf25OE+431iPjxAtIW3mPgd9uoC5O2wTkBWAU0z7VbRaLmbnb1fCrVT9QCO59lobpUDEWdP
	qt4dITskZMnK1kl+6kZwRtX/YIA4+a1qjjt6nm6c6zUoOBah/gCjRBcO73x8NiSjc5UDQx1jF9eYE
	GZ1cObFmIy+CKBdjKIEBO6px7yWuQxiO2tbvsBifltze+FgcslQ0Ys3Visy+7KOuNFGOuTUHP5U85
	sThxr15934BQcgK2NcYBzfSzHqHGvY+7rxtTbINLnJEn4EioQ0jA1NqTmLjG4KbxwiCgoT/lByx4I
	VM/wWt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6P-0000000BGGI-0I6C
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6H-0000000BGCe-2dvK
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E67F0A40FF8
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEB1C4CED2;
	Tue, 26 Nov 2024 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641104;
	bh=mmvIW/IEd+Ls1otCbRDKjH2ZkkyS/s7NWLA8uNPqUMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FSYuQK+oEwtCLvc2hES+g1kvL3zmHTx2inutKx8BU1u7jOwxDlaBfVMoPo3VX995X
	 Oe33Lk3svmjq7q+IXAm6FHPdJzKe1n11iO3ePsWWLXv3B6gBwzr1DxSjKyERK6710v
	 XZA+4PpMMn+xbzKws9p0idOolPYJSKxoEj1gbp4t5uU8vDVr+9rNqHeG8Z1RcOIuQu
	 mQFo7cUU6mUDCOANMCUkEtNYTqb61dhqnXiHryH0CRFF+gTa8A8YHG7DfuFjutsDQb
	 dATdOMg0sERzPgWinOvDTeZz1QH4oVdDW3twMblsSLywcnHcyOT/jCngcS0zjmOjER
	 NiIIdpkFDAyCg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 02/10] wifi: ath12k: ath12k_mac_op_tx(): MLO support
Date: Tue, 26 Nov 2024 19:11:31 +0200
Message-Id: <20241126171139.2350704-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091145_799578_A6F0131E 
X-CRM114-Status: GOOD (  24.98  )
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

For a frame transmission for an ML vif, mac80211 mentions transmit link id in
the tx control info. Use it to convert the RA/TA to the corresponding link sta
and link vif address before enqueueing the frame for transmission.

For 802.3 data frames, always enqueue the frame on the primary (assoc) link id.
Firmware does the link selection, builds 802.11 header and therefore the address
translation too.

Also ensure right link vif is used for WMI based management transmission and
add comments to document when RCU read lock is held.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 141 ++++++++++++++++++++++++-
 2 files changed, 138 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 5be977008319..e246e3d3c162 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -122,6 +122,7 @@ struct ath12k_skb_cb {
 	dma_addr_t paddr_ext_desc;
 	u32 cipher;
 	u8 flags;
+	u8 link_id;
 };
 
 struct ath12k_skb_rxcb {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a6fe998c177e..97a5f26cc577 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6848,6 +6848,7 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
 static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
 {
 	struct ath12k *ar = container_of(work, struct ath12k, wmi_mgmt_tx_work);
+	struct ath12k_hw *ah = ar->ah;
 	struct ath12k_skb_cb *skb_cb;
 	struct ath12k_vif *ahvif;
 	struct ath12k_link_vif *arvif;
@@ -6865,7 +6866,15 @@ static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work
 		}
 
 		ahvif = ath12k_vif_to_ahvif(skb_cb->vif);
-		arvif = &ahvif->deflink;
+		if (!(ahvif->links_map & BIT(skb_cb->link_id))) {
+			ath12k_warn(ar->ab,
+				    "invalid linkid %u in mgmt over wmi tx with linkmap 0x%X\n",
+				    skb_cb->link_id, ahvif->links_map);
+			ath12k_mgmt_over_wmi_tx_drop(ar, skb);
+			continue;
+		}
+
+		arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[skb_cb->link_id]);
 		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id)) {
 			ret = ath12k_mac_mgmt_tx_wmi(ar, arvif, skb);
 			if (ret) {
@@ -6875,9 +6884,10 @@ static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work
 			}
 		} else {
 			ath12k_warn(ar->ab,
-				    "dropping mgmt frame for vdev %d, is_started %d\n",
+				    "dropping mgmt frame for vdev %d link_id %u, is_started %d\n",
 				    arvif->vdev_id,
-				    arvif->is_started);
+				    arvif->is_started,
+				    skb_cb->link_id);
 			ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 		}
 	}
@@ -6936,6 +6946,105 @@ static void ath12k_mac_add_p2p_noa_ie(struct ath12k *ar,
 	spin_unlock_bh(&ar->data_lock);
 }
 
+/* Note: called under rcu_read_lock() */
+static u8 ath12k_mac_get_tx_link(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
+				 u8 link, struct sk_buff *skb, u32 info_flags)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ieee80211_link_sta *link_sta;
+	struct ieee80211_bss_conf *bss_conf;
+	struct ath12k_sta *ahsta;
+
+	/* Use the link id passed or the default vif link */
+	if (!sta) {
+		if (link != IEEE80211_LINK_UNSPECIFIED)
+			return link;
+
+		return ahvif->deflink.link_id;
+	}
+
+	ahsta = ath12k_sta_to_ahsta(sta);
+
+	/* Below translation ensures we pass proper A2 & A3 for non ML clients.
+	 * Also it assumes for now support only for MLO AP in this path
+	 */
+	if (!sta->mlo) {
+		link = ahsta->deflink.link_id;
+
+		if (info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP)
+			return link;
+
+		bss_conf = rcu_dereference(vif->link_conf[link]);
+		if (bss_conf) {
+			ether_addr_copy(hdr->addr2, bss_conf->addr);
+			if (!ieee80211_has_tods(hdr->frame_control) &&
+			    !ieee80211_has_fromds(hdr->frame_control))
+				ether_addr_copy(hdr->addr3, bss_conf->addr);
+		}
+
+		return link;
+	}
+
+	/* enqueue eth enacap & data frames on primary link, FW does link
+	 * selection and address translation.
+	 */
+	if (info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP ||
+	    ieee80211_is_data(hdr->frame_control))
+		return ahsta->assoc_link_id;
+
+	/* 802.11 frame cases */
+	if (link == IEEE80211_LINK_UNSPECIFIED)
+		link = ahsta->deflink.link_id;
+
+	if (!ieee80211_is_mgmt(hdr->frame_control))
+		return link;
+
+	/* Perform address conversion for ML STA Tx */
+	bss_conf = rcu_dereference(vif->link_conf[link]);
+	link_sta = rcu_dereference(sta->link[link]);
+
+	if (bss_conf && link_sta) {
+		ether_addr_copy(hdr->addr1, link_sta->addr);
+		ether_addr_copy(hdr->addr2, bss_conf->addr);
+
+		if (vif->type == NL80211_IFTYPE_STATION && bss_conf->bssid)
+			ether_addr_copy(hdr->addr3, bss_conf->bssid);
+		else if (vif->type == NL80211_IFTYPE_AP)
+			ether_addr_copy(hdr->addr3, bss_conf->addr);
+
+		return link;
+	}
+
+	if (bss_conf) {
+		/* In certain cases where a ML sta associated and added subset of
+		 * links on which the ML AP is active, but now sends some frame
+		 * (ex. Probe request) on a different link which is active in our
+		 * MLD but was not added during previous association, we can
+		 * still honor the Tx to that ML STA via the requested link.
+		 * The control would reach here in such case only when that link
+		 * address is same as the MLD address or in worst case clients
+		 * used MLD address at TA wrongly which would have helped
+		 * identify the ML sta object and pass it here.
+		 * If the link address of that STA is different from MLD address,
+		 * then the sta object would be NULL and control won't reach
+		 * here but return at the start of the function itself with !sta
+		 * check. Also this would not need any translation at hdr->addr1
+		 * from MLD to link address since the RA is the MLD address
+		 * (same as that link address ideally) already.
+		 */
+		ether_addr_copy(hdr->addr2, bss_conf->addr);
+
+		if (vif->type == NL80211_IFTYPE_STATION && bss_conf->bssid)
+			ether_addr_copy(hdr->addr3, bss_conf->bssid);
+		else if (vif->type == NL80211_IFTYPE_AP)
+			ether_addr_copy(hdr->addr3, bss_conf->addr);
+	}
+
+	return link;
+}
+
+/* Note: called under rcu_read_lock() */
 static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 			     struct ieee80211_tx_control *control,
 			     struct sk_buff *skb)
@@ -6945,13 +7054,16 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 	struct ieee80211_vif *vif = info->control.vif;
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
 	struct ath12k_link_vif *arvif = &ahvif->deflink;
-	struct ath12k *ar = arvif->ar;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_key_conf *key = info->control.hw_key;
+	struct ieee80211_sta *sta = control->sta;
 	u32 info_flags = info->flags;
+	struct ath12k *ar;
 	bool is_prb_rsp;
+	u8 link_id;
 	int ret;
 
+	link_id = u32_get_bits(info->control.flags, IEEE80211_TX_CTRL_MLO_LINK);
 	memset(skb_cb, 0, sizeof(*skb_cb));
 	skb_cb->vif = vif;
 
@@ -6960,6 +7072,27 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 		skb_cb->flags |= ATH12K_SKB_CIPHER_SET;
 	}
 
+	/* handle only for MLO case, use deflink for non MLO case */
+	if (vif->valid_links) {
+		link_id = ath12k_mac_get_tx_link(sta, vif, link_id, skb, info_flags);
+		if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS) {
+			ieee80211_free_txskb(hw, skb);
+			return;
+		}
+	} else {
+		link_id = 0;
+	}
+
+	arvif = rcu_dereference(ahvif->link[link_id]);
+	if (!arvif || !arvif->ar) {
+		ath12k_warn(ahvif->ah, "failed to find arvif link id %u for frame transmission",
+			    link_id);
+		ieee80211_free_txskb(hw, skb);
+		return;
+	}
+
+	ar = arvif->ar;
+	skb_cb->link_id = link_id;
 	is_prb_rsp = ieee80211_is_probe_resp(hdr->frame_control);
 
 	if (info_flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
-- 
2.39.5


