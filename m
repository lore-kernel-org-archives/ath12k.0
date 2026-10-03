Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5128ACA5FE6
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+M26q6jZ9Bjj1t5nPehKPJpfjHJapIPhP4g+LU0QHr4=; b=H1F6d+z1q3KxeIBZYRx36FK8T+
	46uffhIYemOlcesApR0P+cZsq3zvOwKOcQXsakPZS3cMoBrkUIt+rbrg5dxWHt7iMnCGsVl2nf5p5
	sq25QIm9sTkqEprSLhNaLylHEReFNkQHFqbVcmwBsGwxzC+j7ojhkuauY0npG+2ev2hyrLK5Xd7wU
	MHZ+qMxhzjZC3eiAjjxarHomtp+gHyClHfIx5fFRGx+ccpKeioKBNErMkNds2mCh3q8oFRTmqCXwB
	2YwH5Vb5oJdiYpJyBT/lIg0xn2f/Mzc7EnYsCfhVC+iCpxDtbivOxu8t+PpKtMRWEb3CSYfZeuAPD
	OYAV4nww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvvq-0000000DFze-05vi;
	Sat, 03 Oct 2026 09:21:26 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvvl-0000000DFxl-0N2B
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 09:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+M
	26q6jZ9Bjj1t5nPehKPJpfjHJapIPhP4g+LU0QHr4=; b=RR6GMvHy0CCs/kGh6N
	a3o6QW/5KJZk/3q/7oqBm6as1g1+Y882n2rmvtdwvyeJv2zWLJM/hZ+SS2n2k714
	kpVOau8WaqcuNIIkY29iH9/Zvec/OftafhSZpo3endpvLvdz1sAKj9Ejf5pzTH3d
	9QPaC7PDV8lTlwNDOY5GRRWiY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3n1YCycBqC7WjCQ--.62376S6;
	Sat, 03 Oct 2026 17:21:12 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 4/5] wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
Date: Sat,  3 Oct 2026 17:21:01 +0800
Message-Id: <20261003092104.520135-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
References: <20261003092104.520135-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n1YCycBqC7WjCQ--.62376S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFyxtw47urW8KF4xtF4fKrg_yoW5KFyxpF
	W8uF9rAFyUCw4UXws5JF4xCa4rX3WDJws2kr4kCa4rWF98Xr1FqF1YqFy3Jry0yF45tFyY
	93yjyr18Gwn8t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pijQ6AUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgg-eWrAyQiiAQAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_022121_532040_857CF668 
X-CRM114-Status: GOOD (  10.51  )
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

The pending management TX cleanup walks txmgmt_idr with idr_for_each(),
and its callback removes the current entry. This can invalidate the
radix-tree iterator retained by idr_for_each().

Use idr_for_each_entry() so every iteration starts with a fresh lookup.
Continue to remove each entry under txmgmt_idr_lock before freeing its skb,
preventing concurrent TX completion from finding a stale skb pointer.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  3 +--
 drivers/net/wireless/ath/ath12k/mac.c  | 12 ++++++------
 drivers/net/wireless/ath/ath12k/mac.h  |  2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 262a2045309b..e9aa5e4e999d 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1514,8 +1514,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete_all(&ar->thermal.wmi_sync);
 
 			wake_up(&ar->dp.tx_empty_waitq);
-			idr_for_each(&ar->txmgmt_idr,
-				     ath12k_mac_tx_mgmt_pending_free, ar);
+			ath12k_mac_tx_mgmt_pending_free(ar);
 			idr_destroy(&ar->txmgmt_idr);
 			wake_up(&ar->txmgmt_empty_waitq);
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 99bf5cf79d10..c0acb92b7320 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9187,13 +9187,13 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
 	ath12k_mgmt_over_wmi_tx_drop(ar, msdu);
 }
 
-int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
+void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
 {
-	struct ath12k *ar = ctx;
-
-	ath12k_mac_tx_mgmt_free(ar, buf_id);
+	struct sk_buff *msdu;
+	int buf_id;
 
-	return 0;
+	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
+		ath12k_mac_tx_mgmt_free(ar, buf_id);
 }
 
 static int ath12k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
@@ -14725,7 +14725,7 @@ static struct wiphy_iftype_ext_capab ath12k_iftypes_ext_capa[] = {
 
 static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
 {
-	idr_for_each(&ar->txmgmt_idr, ath12k_mac_tx_mgmt_pending_free, ar);
+	ath12k_mac_tx_mgmt_pending_free(ar);
 	idr_destroy(&ar->txmgmt_idr);
 
 	kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index aba98afd4365..ae44ebfd9bd9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -173,7 +173,7 @@ struct ath12k *ath12k_mac_get_ar_by_pdev_id(struct ath12k_base *ab, u32 pdev_id)
 void ath12k_mac_drain_tx(struct ath12k *ar);
 void ath12k_mac_peer_cleanup_all(struct ath12k *ar);
 void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah);
-int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
+void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar);
 enum rate_info_bw ath12k_mac_bw_to_mac80211_bw(enum ath12k_supported_bw bw);
 enum ath12k_supported_bw ath12k_mac_mac80211_bw_to_ath12k_bw(enum rate_info_bw bw);
 enum hal_encrypt_type ath12k_dp_tx_get_encrypt_type(u32 cipher);
-- 
2.34.1


