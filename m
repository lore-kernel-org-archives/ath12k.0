Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC14CC0218D
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFqIc+3j9XBxKI9j/3ZRrNaQdt3r2f1TZPqWY31uR0w=; b=cKG6Uv9Wy7quiUoxvXGJnIAUmU
	8aRd1CEnN+8IiZPCnar78Mk0OOnA5uQJxSqCXStj+1COL/GNYSxiApBm4G2GJjq6FdjaPPRXYjGJA
	XPhUlGlgF9yyiv2VGEju56xPQnLoudYzAKy11EwYvFXPBfFeErsneO2JpnnlItRArz2bqiaaT1Mlt
	rbOJAPYD2q3gHNR9z2rHlp0hj51WKyHM2UZgJgDMT94HpTRkMGbwBVfV86DmxIg8xxIETP0IEVYR5
	GLD8NaGZVisTsoJaUmuEQnL7SVQeYWP2E0lZyxZRLT3b+LO7VY8H/P4ILVLWmd8v10G5rUncauZMA
	BtUCLEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc47p-0000000HX2F-2sqy
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 15:00:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc47m-0000000HX12-2Syf
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 15:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDEE85C5F61;
	Sun, 26 Jan 2025 14:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A74AC4CEE3;
	Sun, 26 Jan 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903633;
	bh=etJYQKH9IMjbZbn+KKak13KlQlys5HDLkMgYkdbQ+NQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R8kuyeLSh1YTk2MxF+pi8hpVmjnx5uiBk+ZZPD6imCuFvrKUPgVKXUsvnQkVFhnRv
	 1fdJT5vsuv3Qp+hvgvLlcNAYcqgDgRlgSvALnzuzJlMQfnFfHZqcBcl8jEPXP+XOqq
	 X2CF2o4Os02Q/IiMcL/wdhtyyuUV8VI0XEcPNDTjYjcBaEUz5piRWP/lwTae3OIeP4
	 5Xvfyv7b2CFEQ4/Xg8RU8iDF0vbVSyLhMX9jmOUSH6BLqO3y3o88Lym9+Avq7bQ7qA
	 Q58149qkNIROp9ryZqkDMmuWD6tAcgqD2TNVpgBieeQRSwxNN6Qe8d72DHlgMhy5Z4
	 lBbSf+DQlyrzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 02/35] wifi: ath12k: ath12k_mac_op_set_key(): fix uninitialized symbol 'ret'
Date: Sun, 26 Jan 2025 09:59:56 -0500
Message-Id: <20250126150029.953021-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150029.953021-1-sashal@kernel.org>
References: <20250126150029.953021-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_070034_739036_4CEC94F4 
X-CRM114-Status: GOOD (  12.80  )
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

[ Upstream commit ad969bc9ee73fa9eda6223be2a7c0c6caf937d71 ]

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
Link: https://patch.msgid.link/20241126171139.2350704-10-kvalo@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 57 +++++++++++++++------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d493ec812055f..b1f0a5e9d6577 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4372,6 +4372,7 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	if (sta) {
 		ahsta = ath12k_sta_to_ahsta(sta);
+
 		/* For an ML STA Pairwise key is same for all associated link Stations,
 		 * hence do set key for all link STAs which are active.
 		 */
@@ -4394,41 +4395,47 @@ static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
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
+		arsta = &ahsta->deflink;
+		arvif = arsta->arvif;
+		if (WARN_ON(!arvif))
+			return -EINVAL;
 
-			ret = ath12k_mac_update_key_cache(cache, cmd, sta, key);
+		ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
+		if (ret)
+			return ret;
 
+		return 0;
+	}
+
+	if (key->link_id >= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
+		link_id = key->link_id;
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+	} else {
+		link_id = 0;
+		arvif = &ahvif->deflink;
+	}
+
+	if (!arvif || !arvif->is_created) {
+		cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
+		if (!cache)
+			return -ENOSPC;
+
+		ret = ath12k_mac_update_key_cache(cache, cmd, sta, key);
+		if (ret)
 			return ret;
-		}
 
-		ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
+		return 0;
 	}
 
-out:
+	ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
+	if (ret)
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 static int
-- 
2.39.5


