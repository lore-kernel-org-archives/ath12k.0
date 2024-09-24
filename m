Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB9DCF9C6B
	for <ath12k@archiver.kernel.org>; Tue, 24 Sep 2024 09:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqEPEHMkJn8aiX2yUsF18moYXDb+ftxe6IbbrQ4Qav8=; b=McA6TE7QT+c0WmmUtz6ZsF9xBL
	cW9lLMSxHyPv0dIyQdpPGRq3cA6hET+Mc9IkqhHvF0dlbhkRFWorksVwtssc05K6mLwuiiaiMLXKN
	KBDTeOD1r1nOhc5Q1iV7Ru/SZ5/CwVy1KTRxep0XwH3U9O35I5DOmu2/y4UFt9F0Tk5C7JanrW836
	K8eh76yFDhRvoOo6kFiSrHBvDqVh17ouNeBtgLAz/SvsFBtzAoytMqjBicEi6IaSPU+ER7H0t/PLx
	i0rQ+5nKqO8RL1NuXCKoudrUDmkReezJCXDl8LLPmnx/ClwYOMjBtFua5PozgdQ8B5pmeWPZqjm8i
	ZZ2GapQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1uH-00000001oYw-2ngr
	for ath12k@archiver.kernel.org;
	Tue, 24 Sep 2024 09:32:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1nQ-00000001mxH-0zF5
	for ath12k@lists.infradead.org;
	Tue, 24 Sep 2024 09:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D8C15C5BA8
	for <ath12k@lists.infradead.org>; Tue, 24 Sep 2024 09:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9512DC4CEC7;
	Tue, 24 Sep 2024 09:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169923;
	bh=VKUzvTr7g8w0XMTjwnJJJg8ssO4tx+8HtBNMDAyLejQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kTwTT9F3YJkDsyzOZh+s7iHj4xzlWTg32jSNXSIRcgud+9dt4fVqQwfTHQP+xeaRX
	 DZA+CVkrN8KFzV6rBlIWPcxMlfTe+koXTTmBIMh+klfkrcC7NDsSNRGgKUx1+98r4t
	 xLE2zRz2RNgwIyVJWtsNpPy79OVy+3SQKBlOAQ2EcqKPT3UrqcxdUGgpGO8DXLpe2o
	 wQMkqfp0R+yDXqPr29hw+TUNrBy6yhIl+AY9AzdRhzheoyoYWvw58ik3iaFi8mlLqx
	 51VEsrVMC8WPm4WHhSyQC03+vVSrfPRIzt4DqhanFn28aXPDsDOV2upghXqsshUmly
	 cn0abwsVDHWdg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC v3 5/6] wifi: ath12k: ath12k_mac_op_set_key(): remove exit label
Date: Tue, 24 Sep 2024 12:25:14 +0300
Message-Id: <20240924092515.1049885-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924092515.1049885-1-kvalo@kernel.org>
References: <20240924092515.1049885-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_022524_372955_396312A1 
X-CRM114-Status: GOOD (  13.18  )
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

In ath12k_mac_op_set_key() removing the exit label was a bit more complex so do
it in a separate patch. Remove the else branch and remove now the uncessary ret
initialisation.

No functional changes.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 47e8354bb436..c41740734fc8 100644
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


