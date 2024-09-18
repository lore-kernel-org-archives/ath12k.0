Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568D5CDD551
	for <ath12k@archiver.kernel.org>; Wed, 18 Sep 2024 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIOjBBldZYchZTka0MKNmoullAOkKxsLFp2pBBEOOko=; b=jAZouyzP3FxfnGfcbAHIvxThuB
	wekHvydcgkdQQlDQTxsZwHBGgtYvsSemQIOngonDQ6WnN0jREs1Z4Z8ji5ZZiSpToSma3wlmGBhPG
	pVplbgryOefzNPHwTrzjlgwXh+3QLp47BDIZCs6IelVGYQKzeLyj8IbPPX3x3rWLiwmMtBuHhLFaD
	Jj626UV9m1IJuDNt4Ld+L6OGrlEEfdMCaZ/FHi237WYvm0pek/KmT7z5rOIG+ClorAtSNUB1MaFuk
	HWQ6RJQItEfXLdcUxyPcJ3cEwGz40/pBdp2xrKrbLJSu3Jbeqf3cuYL6y/KCuzB6bg66oNXnJF9jY
	tsUjAVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqz8f-00000008n2M-44LS
	for ath12k@archiver.kernel.org;
	Wed, 18 Sep 2024 18:10:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqz8b-00000008mzA-1Ljr
	for ath12k@lists.infradead.org;
	Wed, 18 Sep 2024 18:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4686A438AF
	for <ath12k@lists.infradead.org>; Wed, 18 Sep 2024 18:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFD3C4CEC6;
	Wed, 18 Sep 2024 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726683048;
	bh=MWVesHo1qywTujYrfE4SGg4HnpXQDUExxEOEBYByavc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UJCIKWvcW63HN8ENuaZciZcgnB8gzZYDjnAkN26w2SBoJAe2GFnE6XhCNhNXyehAd
	 4Yl4sUOo4+Mp4hYaAGXsX8heSQD+ceNid2fcO3VYO5tqD4wehWnqWqjPIB6MFJJyZK
	 hKjq90kxPX5TvnkghSd0aMROSlNJvAKRP8afE0fT5drm80EAvVHOmWXXJWQy1qE63c
	 CxsRhSZ+sjOb8P7nJPYsedK6cPTx8kIxuB6M35W/HVrfnD2XGFisQG9j2ihrTmV+Ns
	 AtQ1MSpvrlE5oVajIVVDyorIRib+kTJYvhHGjNAAdWVH960doxFef9IgoIZYL3Zlqw
	 39w8mvSevY/DA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC v2 3/4] wifi: ath12k: ath12k_mac_op_set_key(): remove exit label
Date: Wed, 18 Sep 2024 21:10:41 +0300
Message-Id: <20240918181042.91891-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240918181042.91891-1-kvalo@kernel.org>
References: <20240918181042.91891-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_111049_457603_003C1FE9 
X-CRM114-Status: GOOD (  13.39  )
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

In ath12k_mac_op_set_key() removing the exit label was a bit more complex as
checkpatch complained about the unnecessary else branch after a return. So
remove the else branch and remove now the unncessary ret initialisation.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a9d37a59a8c2..80db9004cdd7 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3942,7 +3942,7 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 	struct ath12k_peer *peer;
 	struct ath12k_sta *arsta;
 	const u8 *peer_addr;
-	int ret = 0;
+	int ret;
 	u32 flags = 0;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -3970,14 +3970,13 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 		if (cmd == SET_KEY) {
 			ath12k_warn(ab, "cannot install key for non-existent peer %pM\n",
 				    peer_addr);
-			ret = -EOPNOTSUPP;
-			goto exit;
-		} else {
-			/* if the peer doesn't exist there is no key to disable
-			 * anymore
-			 */
-			goto exit;
+			return -EOPNOTSUPP;
 		}
+
+		/* if the peer doesn't exist there is no key to disable
+		 * anymore
+		 */
+		return 0;
 	}
 
 	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
@@ -3988,13 +3987,13 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 	ret = ath12k_install_key(arvif, key, cmd, peer_addr, flags);
 	if (ret) {
 		ath12k_warn(ab, "ath12k_install_key failed (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	ret = ath12k_dp_rx_peer_pn_replay_config(arvif, peer_addr, cmd, key);
 	if (ret) {
 		ath12k_warn(ab, "failed to offload PN replay detection %d\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	spin_lock_bh(&ab->base_lock);
@@ -4040,8 +4039,7 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 
 	spin_unlock_bh(&ab->base_lock);
 
-exit:
-	return ret;
+	return 0;
 }
 
 static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
-- 
2.39.5


