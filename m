Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6E9CFB454
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbC5drJ3tzqUtN86LJjpO8fdKzS7YV87tdIZuBqsFzU=; b=Srj9lAjTNapV7GxSFBwNueF4o1
	TAqNHdnt0r+YeDyK30CtMCfCTmzPGVHKpdmZeRmsVqNn/l7lvSLEhb8VQYy5nZQ2FGjyxFDvz3ps7
	wFW9TD7/uHUu95PgQa178zgbuiVTy9SRUmdvycrHh+TUiv4WXHng4fxx6qw8m7OKj91QVRSClFCWI
	7+oilsYP+BrCWSseYlzzkS6TtNSGNgYXs7kndZGeZkpQpTbsJ6QAmrWktEdOJ41zDufZQnIrPCpMu
	ALrgGgpx3yUiZ7PbK2qAPGbD8nGU82pfTQL/Qtmsu/joC+mehdn6umHOdXeWx3tXZrK9IpZW/IH9G
	Qn8WTq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5r-00000003GTH-1QFM
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 17:00:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5F-00000003GLx-3NDK
	for ath12k@bombadil.infradead.org;
	Mon, 07 Oct 2024 16:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wbC5drJ3tzqUtN86LJjpO8fdKzS7YV87tdIZuBqsFzU=; b=SiMYSeg5RI2djOp3eqNsqPj4fR
	nptOFjEO36cLO/nlUZNg0zWl+I+5Lsq+3R47nhdEPCCzzuvEkEl5qDOCNJ1nYSeqOm/8u5LvB0fxQ
	ZZtgXBlwJ7hV5sgHearzEnl5aF9808EAxwo+UpoBa+jCQ/jl7NINVKLmELnUkTDb79VUs96oFDN4Q
	D+7G9yuqbFsa7Acxern0rFnb6aqPM8FF0VSiB8zt0D9hb24ADbxsAEFyt10o/wucepfQxs7+X9aQ3
	Pz7Kzx5HA/D2yiYBkWM2lUhOVCViCsO1JA77dfTZImugL4eyzNbY6E4/IYTd3QL9RZC8euvPPvJ7T
	VeUot4zg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxr5C-00000004Sla-3aur
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 16:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F8775C5942
	for <ath12k@lists.infradead.org>; Mon,  7 Oct 2024 16:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C87FC4CECF;
	Mon,  7 Oct 2024 16:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728320380;
	bh=2W6wdVzPNu8qasNaX+ZRraHrtjNheF4CRWeSR3gh1nQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KS9MF4wkc8gffTCOKcQk0TYYaqE20zUKEAEDULQ7ayTQ5gnYMM/7PbK8iE1xXYren
	 UnCgkYooG1KYDghEwFBXNclF+Djp0pwR1WlTSrsCMmLF+GaYpEm7Akv+hkU3QJqeK/
	 CVmue0mghAE/ixFGVFLEIGhb+tea4cTaQZ6r0XDcueCntRPxUkmS17RixAM1jH2ZP3
	 nVLc7ErSql5rlhtRGGPeFFU7KMpDnEhv8ge99ugQ7JdjjZgvLwyvYhNHzcXNJ4K/NC
	 jNH/SRa6NKpdS3rjDqQzvz9J7jNn7VjCdVcOlQw2xoXHsUy8rpSqHdZ9scvrD3ssyd
	 BLUBKk9MpNrFg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v4 5/6] wifi: ath12k: ath12k_mac_set_key(): remove exit label
Date: Mon,  7 Oct 2024 19:59:31 +0300
Message-Id: <20241007165932.78081-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007165932.78081-1-kvalo@kernel.org>
References: <20241007165932.78081-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_175943_144169_14BB8A00 
X-CRM114-Status: GOOD (  12.90  )
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

In ath12k_mac_set_key() removing the exit label was a bit more complex so do
it in a separate patch. Remove the else branch and remove now the uncessary ret
initialisation.

No functional changes.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1d1e91b124ca..0c0b87a6e9fa 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3945,7 +3945,7 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 	struct ath12k_peer *peer;
 	struct ath12k_sta *arsta;
 	const u8 *peer_addr;
-	int ret = 0;
+	int ret;
 	u32 flags = 0;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -3973,14 +3973,13 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
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
@@ -3991,13 +3990,13 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
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
@@ -4043,8 +4042,7 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 
 	spin_unlock_bh(&ab->base_lock);
 
-exit:
-	return ret;
+	return 0;
 }
 
 static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
-- 
2.39.5


