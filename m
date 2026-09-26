Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FEC98332
	for <ath12k@archiver.kernel.org>; Sat, 26 Sep 2026 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYAzUI9KJfrVAPUm+dLjsna0fsaIT2KUR47d5rbMV4Q=; b=dUqQkWziXGT3QZcoRQ4J7ji9tp
	Illt1P/oARWcFHcq7iXxsm6Hud/nuUxVZ+wzaIh2Xia+4+ocDhbY0Yjsxus26qOwmlIz0QPv9fSUT
	m9r206urI2kdRsyeLoUcUC4NNChO7pIbiu7lmpPfrM+pRbS8y5vI8CETqehZ9wEQ7dCxX6d1v0nYf
	+RD2fgZnV3dyRaIXdB/kBGlzaUfuSWwVFHurZL4dgelKHCFX41gfh8OlW5IqfmcTIyXzzN8PHyT5C
	DlINCksUJ1UNguyD6Z8NljujL0nvbUepLXL3w//KsvPESMrh7bKnp6GJO8DEYfgu4WRM/K7iTJyzS
	N6XrGYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe7-0000000FbhC-1gZS;
	Sat, 26 Sep 2026 15:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe5-0000000Fbfh-2zEU
	for ath12k@bombadil.infradead.org;
	Sat, 26 Sep 2026 15:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IYAzUI9KJfrVAPUm+dLjsna0fsaIT2KUR47d5rbMV4Q=; b=pQIyrXixlcSPw80kYipa9yY4zY
	TCykeXuPRab3EW8LXv22buBUO2U3l24XA+pk0ougAHnOG54AoXjwU5Go175xVtn/Vdee45JeVl61E
	XenS21lOBkoC0hqd2byVQNoDo4V9IKmgNCBla4SC3dBwtCkyLCUJdN+WO1YZ/vsjAuKfx56c1p/AS
	8KDwvCvFs5E+9MJZiUrz8AjPgcurXs7lkcvG5DIoD+5NanaIZ/rVWuSiJrvVIAHt+EgOm40nEp0wc
	vSn5J1oJ7ko/fN9Y6MIp5kl1N9KDN90epgud+nGoSx5Gji6Odg62uXWMZ4ISIYs0nVBpVXHaVnwDD
	K2B8fkbw==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xAUe1-00000000GIL-1AjP
	for ath12k@lists.infradead.org;
	Sat, 26 Sep 2026 15:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=IY
	AzUI9KJfrVAPUm+dLjsna0fsaIT2KUR47d5rbMV4Q=; b=ckfcvo9NElmrxtAsS7
	Q23rowQ5H7/VENQwE0rs7LRngh+15JdAKwsEbpkOpg2HuZtX0x4Laah/W5sQct8P
	oxRE25LyMyv3XQe7GA/sWvJbZQp9340XgqXcfJxTnhYQod0tjMNSgoMeG3BV76BZ
	iia7kRqXauULzntjBozw/WjV8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F4pL6bdqlpIIBA--.11355S7;
	Sat, 26 Sep 2026 23:48:34 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 5/5] wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
Date: Sat, 26 Sep 2026 23:48:24 +0800
Message-Id: <20260926154824.75224-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926154824.75224-1-yaojiale02@163.com>
References: <20260926154824.75224-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3F4pL6bdqlpIIBA--.11355S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyrKrWkWw4fKr1kAw13Jwb_yoW8tF15pF
	47W342yFyUuF45Xrs5Jr48A3WrJ3WDGws29r4UGas5WFnxAr1agFyFvFy7ZryrtFWrGFy2
	k3yjkr18Gw4kG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pib4SwUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xIXUWq36VK0IAAA3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_164857_960582_DB4E386A 
X-CRM114-Status: GOOD (  10.05  )
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

ath12k_mac_vdev_delete() walks txmgmt_idr with idr_for_each(), and its
callback removes each entry belonging to the interface. Removing the
current entry can invalidate the radix-tree iterator retained by
idr_for_each().

Move the walk into a helper that uses idr_for_each_entry(). It performs a
fresh lookup for every iteration, so each matching entry can be removed
through the locked removal helper without retaining iterator state across
the removal.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7695b21149d1..ba41b0fa728e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9201,16 +9201,18 @@ int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 	return 0;
 }
 
-static int ath12k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
+static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
+					  struct ieee80211_vif *vif)
 {
-	struct ieee80211_vif *vif = ctx;
-	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
-	struct ath12k *ar = skb_cb->ar;
-
-	if (skb_cb->vif == vif)
-		ath12k_mac_tx_mgmt_free(ar, buf_id);
+	struct ath12k_skb_cb *skb_cb;
+	struct sk_buff *skb;
+	int buf_id;
 
-	return 0;
+	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
+		skb_cb = ATH12K_SKB_CB(skb);
+		if (skb_cb->vif == vif)
+			ath12k_mac_tx_mgmt_free(ar, buf_id);
+	}
 }
 
 static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arvif,
@@ -10972,8 +10974,7 @@ static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ath12k_link_vif *arv
 	ath12k_peer_cleanup(ar, arvif->vdev_id);
 	ath12k_ahvif_put_link_cache(ahvif, arvif->link_id);
 
-	idr_for_each(&ar->txmgmt_idr,
-		     ath12k_mac_vif_txmgmt_idr_remove, vif);
+	ath12k_mac_vif_txmgmt_cleanup(ar, vif);
 
 	ath12k_mac_vif_unref(ath12k_ab_to_dp(ab), vif);
 
-- 
2.34.1


