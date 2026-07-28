Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4ABC54F4D
	for <ath12k@archiver.kernel.org>; Tue, 28 Jul 2026 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9kHCUyLF0kHDD8ILRj4/H/sMOeT2Xi/hZ4Ns4Kmdsok=; b=z2B2z3EbG2OxclP25LKfrf0R0L
	cUgNXwEgwTDUyqAEhamKFW+6JsvD4+lQNzNUEXF5NsiymB/7p65bm61TnOJZQrkE0DtQIeMqp7ezf
	zr6/7DLTVyxSlR8pmT/Zuknw6bRLaj9es+qlsKznwPDApjyEUfr+oPDHy+BvILfpdTTThc5RC1c7/
	YTE1qTb+AR+ZJuRYdDDopCNDKPCOmHnphYMzc+vNqSjKcZbeXaBepgICpIjJIKHWQJh1+2IPTL6cm
	JFG1b84c2nJPTOYa6jm/FEglJld1V/94kLat5pz+Q/QFqwQvzppA48oB+/NNCkAE5Wx2RzjgMpccp
	D1W54UPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokHD-00000005lxi-32iC;
	Tue, 28 Jul 2026 16:03:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokHA-00000005lwk-1smy
	for ath12k@lists.infradead.org;
	Tue, 28 Jul 2026 16:03:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so25985e9.0
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785254605; x=1785859405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kHCUyLF0kHDD8ILRj4/H/sMOeT2Xi/hZ4Ns4Kmdsok=;
        b=IwzbJg40A6r6IYoX4CwAq18BWe1AvqmIUk4O1Gm9fLWAojuDJ6AD1ZeQfT3zai6jh4
         11xNVVYDdK78SqAriNMthdOChjvnVXU6XngGpXdi0bMssEkJOuHMVp9kYzj54qwOfnVD
         1emC9mS8j5ar6yeGoCjlhmPHGx72i242YWNPiBnyH22Kk/gn3IEsjciOII77foCqGsz2
         sFxq3TPtPWSIdau12K7+IInKECxWAAjQcpekIlvl7aqysWzbFDrluCCwqBX1oBc4qy+D
         0EIJyhySF89qQfVGCvfNXTw19tfMXA5b1QbldSivDvuj+Hyg0ecFuKDKcs5om3l/p1fQ
         Yu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254605; x=1785859405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kHCUyLF0kHDD8ILRj4/H/sMOeT2Xi/hZ4Ns4Kmdsok=;
        b=XjS2/Fn8SP7FSBIEWjA31wM5nM2ieIUulEOxIfT3wqPS4UfRBOUcZ+AAvckx9gFahh
         hCYIde72hvaX94BVk0SE2k8g3VtlkC/d6F+ShaM+cf6e1JNojd0POrXHJd6GoqRYZ0WL
         lDV8u0VMaTS2iqL3Xsl0EG49IRXenyTDJA9RhIPgBI88oS5G6AFbsTN9ioHs4UOXzRUb
         bEJmsxp4rQRDEelRZlTB6NiVuR3OUW/cL3rJdV9yUKIOfDirs40WNDp1kTISFYJ9vRJg
         WwgIijtW6Ql/G4sHncYz+E5xzGaLmKhcYi7o1htrNkI8R71fPLnr7m9xtQizzYManrcg
         kURg==
X-Gm-Message-State: AOJu0YzGUMpgU2pRz1MPixz2db691UohMjUmFRIeVy+T7/Vj3DT6/sie
	wtgKHdVHeK8RH4wYZjb3pmZJ/wmmKXBZ+Btl6/TCBxDW00TbHDvnFCiFDh9BfQ==
X-Gm-Gg: AR+sD11ZUjRtVT13F40I17HPXowR2oy4DKkhFK3WoIbKTHerVaPSvMIQuOBe55gdN/R
	5c9sa5qa+2pyeAaQ9KobhP5OMdNC4Ud/vFo6+KH2IS1jnNjGAly0Wv4C3hc9S0b9ON9heFKEMER
	K8ef6y7Oj63kpMq2Mfc0KPidLe/JxMfJFpPKHqi1SAX8N5Cjl7MnYoOz9UjFMGM5wt2KWLeopgR
	02AFQr+iX9Q8SSlKr0Tm+ZaotRmqpbvKCXGEMLdXayb5/nEXa+HLrNneQRLZfdvLKVTsgnAOEul
	X2gw00BiXXf8IKKrhXgsVol+HOcAikZ17T3Y0TjO314+p+kVoo7t8E3RH69Lv1sQmy+nQ25YnHH
	44Wfe4n/01SaxiGXwFx6L0zO0h9Qxksmo6bgtsHbhQnK1b5JJY70kGiUBxPtLA1T/3w13MQPFYw
	SazjRqT7FDMUDrcU83fpmBUeohTMCl4atOOx4=
X-Received: by 2002:a05:600c:a00b:b0:495:515a:dad9 with SMTP id 5b1f17b1804b1-496c65a14b2mr36015295e9.37.1785254604651;
        Tue, 28 Jul 2026 09:03:24 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b18a9fsm106276f8f.32.2026.07.28.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:03:23 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()
Date: Tue, 28 Jul 2026 18:03:22 +0200
Message-ID: <20260728160322.2773915-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_090328_512014_32638AD8 
X-CRM114-Status: GOOD (  14.57  )
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

When mac80211 removes a sta, it calls .sta_state() which in turn calls
ath11k_mac_station_remove(). In that function we clean up both  peers &
arsta related resources.

But when the firmware crashes, ath11k calls ieee80211_restart_hw(), which
assumes that all driver related resources are cleanup up beforehand. This
cleanup is supposedly done by ath11k_mac_peer_cleanup_all() but does not
in fact free arsta->rx_stats / tx_stats.

So lets extract the arsta cleanup from ath11k_mac_station_remove() into a
new ath11k_mac_station_cleanup() and call it from both there and
ath11k_mac_peer_cleanup_all().

This should handle kmemleaks reports like:
	unreferenced object 0xffffff801ae66400 (size 1024):
	  comm "hostapd", pid 1306, jiffies 4295011565
	  hex dump (first 32 bytes):
	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	  backtrace (crc d61c08ec):
	    kmemleak_alloc+0x3c/0x50
	    __kmalloc_cache_noprof+0x2b0/0x3e0
	    ath11k_mac_op_sta_state+0x1dc/0xb10
	    drv_sta_state+0xac/0x6f8
	    sta_info_insert_rcu+0x314/0x5e0
	    sta_info_insert+0x14/0x38
	    ieee80211_add_station+0x10c/0x1a0
	    nl80211_new_station+0x3e8/0x680
	    genl_family_rcv_msg_doit+0xc0/0x120
	    genl_rcv_msg+0x1b4/0x258
	    netlink_rcv_skb+0x4c/0x108
	    genl_rcv+0x38/0x60
	    netlink_unicast+0x190/0x278
	    netlink_sendmsg+0x15c/0x370
	    ____sys_sendmsg+0x120/0x290
	    ___sys_sendmsg+0x70/0xa0

Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: 9d5f28c1366f ("wifi: ath11k: fix connection failure due to unexpected peer delete")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 Note the problem this is in fact older that the referenced commit, but as
 it would need another patch to backport to older kernel and the leak is
 quite minimal & seldom happens, I was hopping to not have to do it.
---
 drivers/net/wireless/ath/ath11k/mac.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2d55cdc4d165..ae91b57c8422 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -873,6 +873,22 @@ static int ath11k_mac_set_kickout(struct ath11k_vif *arvif)
 	return 0;
 }
 
+static void ath11k_mac_station_cleanup(struct ieee80211_sta *sta)
+{
+	struct ath11k_sta *arsta;
+
+	if (!sta)
+		return;
+
+	arsta = ath11k_sta_to_arsta(sta);
+
+	kfree(arsta->tx_stats);
+	arsta->tx_stats = NULL;
+
+	kfree(arsta->rx_stats);
+	arsta->rx_stats = NULL;
+}
+
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 {
 	struct ath11k_peer *peer, *tmp;
@@ -885,6 +901,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
 		ath11k_peer_rx_tid_cleanup(ar, peer);
 		ath11k_peer_rhash_delete(ab, peer);
+		ath11k_mac_station_cleanup(peer->sta);
 		list_del(&peer->list);
 		kfree(peer);
 	}
@@ -9892,7 +9909,6 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
-	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
 	int ret;
 
 	if (ab->hw_params.vdev_start_delay &&
@@ -9916,12 +9932,7 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 			   sta->addr, arvif->vdev_id);
 
 	ath11k_mac_dec_num_stations(arvif, sta);
-
-	kfree(arsta->tx_stats);
-	arsta->tx_stats = NULL;
-
-	kfree(arsta->rx_stats);
-	arsta->rx_stats = NULL;
+	ath11k_mac_station_cleanup(sta);
 
 	return ret;
 }
-- 
2.55.0


