Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3258BCA5FE3
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jAcakh0V+w1Mu4hFJYcBeyHBo4skXLnPZjvWkRcwaw=; b=Xgb/4KwjgKvqQWqkwkqDT29qI8
	ySUM5iisNO+ZDX7Fhnk3YxBnHO9P1ErgLhaVVAWRu/FNKBIdRBu20iDRFybIVytZH5gl8EQPrAiPS
	DUAqtCUMJxnKhRFJjnl2tCULJ1rMNx1eXdD0+DAANz05gYr72prBqIrmOXSA4U68vxJfARagBFTOb
	MTG9AkTUNE0748JMwhl4GgkuuKPRY8cAeDY5yuSI/NZt1LZEvQSw6vYWwwBmtTOrhCE8fPRZ7xo4d
	92jETRsY2KFSW0W0LqHJ6DM7PLGJlhMVkKUZYCWyIzvLauilt/5F/WpjYASZBe4KwoWAqk6iWWRZW
	25+jmotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvvp-0000000DFzV-3dDg;
	Sat, 03 Oct 2026 09:21:25 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvvk-0000000DFxm-3Vds
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 09:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5j
	Acakh0V+w1Mu4hFJYcBeyHBo4skXLnPZjvWkRcwaw=; b=cTQOKLpThNkEBB7dTn
	Qmq4sciAOeOxcrs8DuYxn2oRa22eddZ9bTpLerzlL5MF1pbdSHfl7y6pzaZufiGD
	j0+4ZOS3wD7ABYNhO/arEuR3lNY5iW8FMryefS6RfZG4rQFc/qIkNsrfslc6rLcs
	vNP1obK64aWdHjpFCb3tlXKNY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3n1YCycBqC7WjCQ--.62376S7;
	Sat, 03 Oct 2026 17:21:14 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Sriram R <quic_srirrama@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 5/5] wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
Date: Sat,  3 Oct 2026 17:21:02 +0800
Message-Id: <20261003092104.520135-6-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
References: <20261003092104.520135-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n1YCycBqC7WjCQ--.62376S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyrKrWkWw4fKr1kAw13Jwb_yoW8tF4DpF
	47W342yFyUua15Xrs5Jr45A3WrG3Z8Gana9r4UGas5WF9xAr1agFyFvFy2qryrtF4rKFy2
	k3yjkr18Gw4kG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pib4SwUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wo-eWrAyQoqVQAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_022121_362305_D4E294D6 
X-CRM114-Status: GOOD (  10.53  )
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
index c0acb92b7320..108ace48cc97 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9196,16 +9196,18 @@ void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
 		ath12k_mac_tx_mgmt_free(ar, buf_id);
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
@@ -10967,8 +10969,7 @@ static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ath12k_link_vif *arv
 	ath12k_peer_cleanup(ar, arvif->vdev_id);
 	ath12k_ahvif_put_link_cache(ahvif, arvif->link_id);
 
-	idr_for_each(&ar->txmgmt_idr,
-		     ath12k_mac_vif_txmgmt_idr_remove, vif);
+	ath12k_mac_vif_txmgmt_cleanup(ar, vif);
 
 	ath12k_mac_vif_unref(ath12k_ab_to_dp(ab), vif);
 
-- 
2.34.1


