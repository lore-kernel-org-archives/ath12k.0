Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D57C5321E
	for <ath12k@archiver.kernel.org>; Wed, 21 Aug 2024 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPYr8qU9qOW81Jgu1E9WZnu3VYSRUVy+8mOyi4vi/sk=; b=t4RcpeDMx1QZZVOwNU2su2BDb7
	uKxmakYuveVpVwiv7wrlMPi8Zu3uV20NKj8AVNOMjULhaenPy6YjUL80hN1mP+IOPvNwkqdmDU+mH
	TobdEMpADIC1nd0Hja4ut5Moix2dqrAJ8dsgr6zw5o067or8I96+A/qveIv61M172jJmScELs6ewA
	2Slb+ErLhWiEbLuHa6Z5BTZvpyNB0zgyU0vuP8wtouoz0ffwgyyxqsMWL2vXt4RyR9g8qTe8GfLGK
	95CwJvoHVi3hjJDkahaPIsb9htj+LfDsRlN+yD1VbCv9oF88IR1B5UkIYbAxY+pd0hE7DX/QQ6vXT
	x+iJhJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnPL-00000009WaW-2iXc
	for ath12k@archiver.kernel.org;
	Wed, 21 Aug 2024 15:37:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnOx-00000009WSB-3EHP
	for ath12k@lists.infradead.org;
	Wed, 21 Aug 2024 15:37:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11B3961062
	for <ath12k@lists.infradead.org>; Wed, 21 Aug 2024 15:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309F1C4AF09;
	Wed, 21 Aug 2024 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724254654;
	bh=yI+XTxfRTeCU0R+EJ6nKBT0kQiUN1oBcf83r56C2ztE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPPTfZ2lbMdeQ3aX+X0dWZ81vrJTa3VmJLWFUaQDvyj/5IUqnj8bU/9eI9No0OeSe
	 cmMrBSijO6pEnqzgJkljPGuyh0ou0eoJf2rL21CgKKqyPNgdk9HHHPWFFcJLiL2MId
	 r1JABW3GOk2rkOakuQqDguRSUuV0kCUFFVaYh2c3Iy7axzUoJxC2kYwqtniyVnotTL
	 VuaP2FFH9CqYkv6UjQKC511jNZOvlV0oCDic89O6MYj/9pcplotlKF1kmKspw5BQfN
	 ne1VMbtg3r8Dg0i/f6QVEl+fCzDCkSez+oAUoX5Pdls0BOn1gB+dB0BVhGwePjipLf
	 l9bspKnstX5Rw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH RFC 3/4] wifi: ath12k: ath12k_mac_op_set_key(): remove exit label
Date: Wed, 21 Aug 2024 18:37:27 +0300
Message-Id: <20240821153728.2121600-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821153728.2121600-1-kvalo@kernel.org>
References: <20240821153728.2121600-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_083735_906452_A34177CB 
X-CRM114-Status: GOOD (  13.43  )
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
2.39.2


