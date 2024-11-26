Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D1FD65531
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/sspmOsI2fgdvfNoNq5A19v0qUJb6cdsBsj0ttp1RA=; b=pApeHDXxjBlpG2Hspt0t15aF2z
	N1hWt02G5t6g8TsMPM+aZhTsWfrOjWZtUhQ/mERqYq9aF0Dhj1CxhUXoDR7uxghOqfqBvVqFPJi+/
	2pdCIXn/azVEz+qUg+bvrzMAwCcajsJHK9aUczCd6oYpO1ExqNGsLwJOAjTv+fv5QVTlM8VWaB1/q
	qchrbuWN3IxyFlSEUNQEkJDgy8V6x+c/UHZ0XbvLFwp053N0/FBhd6/qzWSVGFWh3geuHIXj+H3fn
	OzHMYj8TntGgBfjdCfliMNLFaI4FJAA2oA0DbUW1sL1KL1QcubqNvYbHW/FyWHUQPsZnQHkXSi1Zg
	CTeoKX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6P-0000000BGHA-2EJL
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6I-0000000BGD0-2K0k
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF41DA41001
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019D0C4CECF;
	Tue, 26 Nov 2024 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641105;
	bh=fLIf5yldob4kP1I/+Xg/0aAFAjapHLuzwrm1v8slJfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jyRa2fDz10SGugi77JL7HOOa9EkJLj9UrJVChCkGSeaXc3AIpncyjSrqBO89chCG6
	 /3C08367vCc+ODxs+mtcJm0LdLj41eW/jNvXhONCDlmV5tABKedVvmjRrvl14r5DX6
	 +4iqkJ/39S9meLAFIpytUX68LLsv/KgqxIr9gTq78VlJP716aTaIjb7px5uA7tSQSx
	 2LKny7DpYuebsbBBGR7fcgugyxrlUk/rp0D1y8wuAjSYQ6r9jdAsivV6LJAvvDxxWl
	 q2s9Zz7rcChHpjOZVSlpwyxBL6aEuAqiq2mBDd2j2nrHgVRJIUJfVUc906Mz8PYsaj
	 fpW7KNZRRWDdQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 03/10] wifi: ath12k: ath12k_mac_op_flush(): MLO support
Date: Tue, 26 Nov 2024 19:11:32 +0200
Message-Id: <20241126171139.2350704-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091146_652160_DA7E68F8 
X-CRM114-Status: GOOD (  10.52  )
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

Currently when tx flush is requested for an vif only packets corresponding to
deflink are flushed, with MLO multiple link arvif could be affiliated to the ML
vif and packets corresponding to all of them should be flushed.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 97a5f26cc577..d1c94eb8145a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9287,7 +9287,11 @@ static void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
 				u32 queues, bool drop)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct ath12k_link_vif *arvif;
+	struct ath12k_vif *ahvif;
+	unsigned long links;
 	struct ath12k *ar;
+	u8 link_id;
 	int i;
 
 	lockdep_assert_wiphy(hw->wiphy);
@@ -9302,12 +9306,18 @@ static void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
 		return;
 	}
 
-	ar = ath12k_get_ar_by_vif(hw, vif);
+	for_each_ar(ah, ar, i)
+		wiphy_work_flush(hw->wiphy, &ar->wmi_mgmt_tx_work);
 
-	if (!ar)
-		return;
+	ahvif = ath12k_vif_to_ahvif(vif);
+	links = ahvif->links_map;
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		if (!(arvif && arvif->ar))
+			continue;
 
-	ath12k_mac_flush(ar);
+		ath12k_mac_flush(arvif->ar);
+	}
 }
 
 static int
-- 
2.39.5


