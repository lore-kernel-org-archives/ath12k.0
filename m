Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF57D65533
	for <ath12k@archiver.kernel.org>; Tue, 26 Nov 2024 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZm+lon7noWtTjrFo6jEVB4kSUEVzF650Gd+KRxO98Y=; b=bWc2eXCH9n1+rCaUl+jMRnYghq
	aWXjdNyIreyZzEqYy5QSEgOshqes+mBpFZxf6PUQuwcxY74fyZ62gzU9xvnMFqixu7hqtxonUjd3F
	8s9Ar8jIrqbsX3w8a1tdvoGfyVhyyqbvKIhPZCqJldIUzz1LgckYHY0r3KBk3rcHwklYVVRxAUjoH
	R8KojZvIz59Zd6pEvjhCjOqOH9w3A1XbiyLjEqEVkGLtrsheIU2TblQHAH9Ah+GjwUFAXizarXD6s
	eLZaLpPR5qspxfy8gtMrRsA33a8+h+2ymkIxGZUr1jU/52vROMhfsDteCT3XZMIwbecufclgFES+h
	9waxPg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6T-0000000BGMJ-3XnS
	for ath12k@archiver.kernel.org;
	Tue, 26 Nov 2024 17:11:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6O-0000000BGE1-0XKE
	for ath12k@lists.infradead.org;
	Tue, 26 Nov 2024 17:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9221B5C581C
	for <ath12k@lists.infradead.org>; Tue, 26 Nov 2024 17:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D9CC4CED0;
	Tue, 26 Nov 2024 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732641111;
	bh=hQjedzDvhSnv4P35mhnpee32q6txbwbayatXB510sAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pmfvHdp+9TNBrlrTmJ+KrT1juzzy4mtam7dTsFZGlZscj58dPpFpFW6hxqyYnF3bU
	 59Fbd+FXcInGKHZVbVHVbXfcz+GvJOHlsfn1OHpaYIHmW0Z52EcW/201gs6emP/2Ty
	 bv6+JCQq5NN3GCEhFlCKuqZTPV/MgNnTogBX+a7QxV9zoRtoEoBzBBWCS235WHQJMj
	 0PcYu/vjVQuK+Kq1tDpRsSgdWAZSuM6wgqyAzP/uNl4XjVzBrjAL6ChqXSoIIjosP/
	 Wq1W0IdEb3adN/wfbBx0s8iVUgd4tZPR0DmBP6JZbZ7n61rze/ezXZHr4aPNAGa+48
	 dDLr3FXVHf++A==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 09/10] wifi: ath12k: ath12k_mac_op_set_key(): fix uninitialized symbol 'ret'
Date: Tue, 26 Nov 2024 19:11:38 +0200
Message-Id: <20241126171139.2350704-10-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126171139.2350704-1-kvalo@kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091152_256642_F5492B59 
X-CRM114-Status: GOOD (  12.75  )
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

Dan reported that in some cases the ret variable could be uninitialized. Fix
that by removing the out label entirely and returning zero explicitly on
succesful cases.

Also remove the unnecessary else branches to follow more the style used in
ath12k and now it's easier to see the error handling.

No functional changes.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/7e7afd00-ad84-4744-8d94-416bab7e7dd9@stanley.mountain/
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 59 +++++++++++++++------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f85661534d9e..f6c3128a675a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4657,6 +4657,7 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	if (sta) {
 		ahsta = ath12k_sta_to_ahsta(sta);
+
 		/* For an ML STA Pairwise key is same for all associated link Stations,
 		 * hence do set key for all link STAs which are active.
 		 */
@@ -4679,41 +4680,47 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 				if (ret)
 					break;
 			}
-		} else {
-			arsta = &ahsta->deflink;
-			arvif = arsta->arvif;
-			if (WARN_ON(!arvif)) {
-				ret = -EINVAL;
-				goto out;
-			}
 
-			ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
-		}
-	} else {
-		if (key->link_id >= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
-			link_id = key->link_id;
-			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-		} else {
-			link_id = 0;
-			arvif = &ahvif->deflink;
+			return 0;
 		}
 
-		if (!arvif || !arvif->is_created) {
-			cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
-			if (!cache)
-				return -ENOSPC;
-
-			ret = ath12k_mac_update_key_cache(cache, cmd, sta, key);
+		arsta = &ahsta->deflink;
+		arvif = arsta->arvif;
+		if (WARN_ON(!arvif))
+			return -EINVAL;
 
+		ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
+		if (ret)
 			return ret;
-		}
 
-		ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
+		return 0;
 	}
 
-out:
+	if (key->link_id >= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
+		link_id = key->link_id;
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+	} else {
+		link_id = 0;
+		arvif = &ahvif->deflink;
+	}
 
-	return ret;
+	if (!arvif || !arvif->is_created) {
+		cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
+		if (!cache)
+			return -ENOSPC;
+
+		ret = ath12k_mac_update_key_cache(cache, cmd, sta, key);
+		if (ret)
+			return ret;
+
+		return 0;
+	}
+
+	ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static int
-- 
2.39.5


