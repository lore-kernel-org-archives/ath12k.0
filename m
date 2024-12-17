Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11153E77187
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 20:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+6E3lTBsBY3e1hW4ev9RsZbZcOY2QOKi55XaNbHdL0=; b=bjNg7ZAiLcrV+GFjG2hgGK8oJl
	CxJ1dLa9Fi4pwSdPj3SEonank9uU6GwGhgg3nzVM7dbkoThqoeVnPCl6p8kN9HeMtyNN40KC3YM3G
	CzvGMFxPGfGtsK5rbEOCoFARs8oS9s4zaclV8wiu/txBDUpysxgFoeP5/w6JhZdHKHgRHnD704UXL
	3b6DqIYzmNvsdLRWTcUribCbetDBzn5yC9hD4/7w9LxWnRIyGHuf8LpHayMZx21MG/W/dbs8lm88a
	ctcHzHvDDz7UJAFDVo3WsIrV+yxTz7twr6CK02wNPqUsRW0kdyXbX7TGp5Nh5gSOYD1nVxx7f5vuJ
	NCCe3mXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe9A-0000000EkG2-3V4h
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 20:26:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe99-0000000EkEx-1NVV
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 20:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAB745C5937
	for <ath12k@lists.infradead.org>; Tue, 17 Dec 2024 20:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7144C4CED3;
	Tue, 17 Dec 2024 20:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734467182;
	bh=VQm3hiNA3kQgkmtCDPPom8HziQB3vh3sJutG7be7roQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WRLlI3z+9qlYlrUL2d4MkKeCsOIhiJ6Ddd4O0qbRt6zBNNp+/S3HfKooLgMCADkeu
	 p4Y5Kbb+CQja4CQoecFwAY6ZMnQFWcRQOXHPH2YPTU2nw5+LWcbbMtjdtsheL39qSi
	 Dl11sU6ZSZQUJAJN2lK/Tm7BI6aQ7R/1IvphNxOS57lqgaB/oO5iTyf+lVuAuy/Iu5
	 MmgDlFki8RHbRawIkd092HvzMmDRZzy2+Ats5zGNZnRnTf7v5BvtsaHlY6yFKetbwT
	 1HlLyZ2f1ryAVc3HC/sEtEaCAea1bV3KV4p9uXGNO41Jd+G4EjewQNOjv2yCSKD1L7
	 X5mt0HYPs5qbg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/4] wifi: ath12k: Decrease ath12k_bss_assoc() stack usage
Date: Tue, 17 Dec 2024 22:26:16 +0200
Message-Id: <20241217202618.1329312-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217202618.1329312-1-kvalo@kernel.org>
References: <20241217202618.1329312-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_122623_416191_DF772A71 
X-CRM114-Status: GOOD (  10.35  )
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

Currently when building ath12k with gcc-14.2.0 the following warning
is observed:

drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_bss_assoc':
drivers/net/wireless/ath/ath12k/mac.c:3080:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]

A major contributor to the stack usage in this function is:

	struct ath12k_wmi_peer_assoc_arg peer_arg;

Avoid the excess stack usage by dynamically allocating peer_arg
instead of declaring it on the stack.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 05d2c75e5df2..2a30a11903c5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3133,7 +3133,6 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
 	struct ath12k_wmi_vdev_up_params params = {};
-	struct ath12k_wmi_peer_assoc_arg peer_arg = {};
 	struct ieee80211_link_sta *link_sta;
 	u8 link_id = bss_conf->link_id;
 	struct ath12k_link_sta *arsta;
@@ -3145,6 +3144,11 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
+	struct ath12k_wmi_peer_assoc_arg *peer_arg __free(kfree) =
+					kzalloc(sizeof(*peer_arg), GFP_KERNEL);
+	if (!peer_arg)
+		return;
+
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
 		   "mac vdev %i link id %u assoc bssid %pM aid %d\n",
 		   arvif->vdev_id, link_id, arvif->bssid, ahvif->aid);
@@ -3177,11 +3181,11 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 		return;
 	}
 
-	ath12k_peer_assoc_prepare(ar, arvif, arsta, &peer_arg, false);
+	ath12k_peer_assoc_prepare(ar, arvif, arsta, peer_arg, false);
 
 	rcu_read_unlock();
 
-	ret = ath12k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
+	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to run peer assoc for %pM vdev %i: %d\n",
 			    bss_conf->bssid, arvif->vdev_id, ret);
-- 
2.39.5


