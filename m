Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE1FD1D895
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 17:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pl3si98Byotz4RAfUH5dVrCP5Q2duyGdX1K6sQU5wEQ=; b=CWL8Cu6KDsyAIcSjGTd/O3g8CA
	xNc8qvEoZoFPF3sH3kymJV5/x/tPUTCqIUtS6RYOenyzjJBf+lTIDZluuHphGb7DoQZabQZe3iv3y
	wredzRqxdxhS6vjMLc5Y5aE9deJ/sFGLC32jhlm+Sw0BOIR0XNu+vc7cdsPdrocub64LswdmuOa/0
	Ozwz5jZ1AWXAsfQ+YhnEi1xTmEdNVJ2GgTTx6rw5p2uLqN0MGeQfP2DbWMRNwN2wp5TEWIBcbodDf
	XnZ9nX0rJxvwvHkbBU1Kn34XU9xdhMF55dgwvniaJyC0vjYok9fc7OYDC52Ig58rjhb2EUJLo7cus
	96ONcGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l80-00000008ztD-3D1z
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 17:14:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0l7v-00000008zog-1zjW
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 17:14:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9070A42608
	for <ath12k@lists.infradead.org>; Tue, 15 Oct 2024 17:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEACC4CEC6;
	Tue, 15 Oct 2024 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012470;
	bh=0y6W5ldb2qg8kudHzb+ivwrZLPv0XWaWXc2me3HQcP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CExyeYA7xXT16UJ7Zj94SOBnT07A65dYGRLpohJQxjI8ghlFQrZcvnaaJ7Z4r6d82
	 LWAeQWTq4DRYaBuNAp3uIKjac8WdYS2da8kKyfBtczzA+8k2b1LorN3cFa5nOb/6I2
	 c1U44VKEGlPtiRZCME36hgOgWUnyfG3ihBcJMAMqqyOEKhd9vPScvUjhwuI4p6Cptb
	 eroFrc2GdFtVU/dFh1I9cTBuPZb3dCND9yCRVxqNBlL2yFR7NRfbcrMEKXsZ3Z+zdw
	 g0aN3aQ0pudIF0pAlcOVP6DA4B99CxcPFrJDpTVJSjkKk1cbpYutXpOm8D77s5DZ9P
	 Nj+Y6coMbT39Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 10/11] wifi: ath12k: update ath12k_mac_op_update_vif_offload() for MLO
Date: Tue, 15 Oct 2024 20:14:15 +0300
Message-Id: <20241015171416.518022-11-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241015171416.518022-1-kvalo@kernel.org>
References: <20241015171416.518022-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101431_612251_70A170BA 
X-CRM114-Status: UNSURE (   9.02  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Currently ath12k_mac_op_update_vif_offload() updates for vif encapsulation and
decapsulation offload configurations for intended vif's deflink.

But for an ML vif encapapsulation and decapsulation offloads are an MLD level
configuration so apply the same configuration for all affiliated links of the
ML vif.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8771d9738ffb..ba633dad4c47 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6683,9 +6683,25 @@ static void ath12k_mac_op_update_vif_offload(struct ieee80211_hw *hw,
 					     struct ieee80211_vif *vif)
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	struct ath12k_link_vif *arvif;
+	unsigned long links;
+	int link_id;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
+	if (vif->valid_links) {
+		links = vif->valid_links;
+		for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+			if (!(arvif && arvif->ar))
+				continue;
+
+			ath12k_mac_update_vif_offload(arvif);
+		}
+
+		return;
+	}
+
 	ath12k_mac_update_vif_offload(&ahvif->deflink);
 }
 
-- 
2.39.5


