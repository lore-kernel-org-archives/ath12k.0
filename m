Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B0DC9832A
	for <ath12k@archiver.kernel.org>; Sat, 26 Sep 2026 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1C5Kknk8OPRgaUyHr2WrphfIU+P9gaNOQznFxQmRB1s=; b=ixK5R2b32ZJ+G/YsgbV5tHzkt4
	WjmPcjMmM4K3xz7WyYzZED9UIuL35F+ZgtL3sTbSdhpLOPF+YN5OKmC6vbjLdMLLqbFzSW2i/qGTU
	Vs3Lj+6KE/6oQa0a1TyaZ5SsT6jtfMwJDL/yqo62JvMFhjwW75Ctk8HzMA7QzGlsWwo+vXznq1cXK
	vu5xNQ7G6itmWEeSYamx/w/bGzXgYfi0iMFIBNmk4khn4jr/+RC8ZdaAvN4fnR+a6R1rSAZ5mzWwT
	OhxmtIQB48BGRAMooxeFZg9+sIe1AMup21keOELA3rct9W+Icva2SjyM1GvsReSPe35R3hUXQoLoo
	BZvxFLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe7-0000000Fbgi-09Z8;
	Sat, 26 Sep 2026 15:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe5-0000000Fbfj-35Vt
	for ath12k@bombadil.infradead.org;
	Sat, 26 Sep 2026 15:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1C5Kknk8OPRgaUyHr2WrphfIU+P9gaNOQznFxQmRB1s=; b=TVkpn6f8k2hQds3QuP8YXYazFH
	1UiogSMTreT4xUrZejEUCZEG0JICt974sypI8vlynVlYJYGe7hdVWDcC7Iqs+ZsS8F9o5Suc1jIMq
	Y1ZCzn98hmnV+I0dkrNhS4mZ2Y+31ISMaMQF78eMOLD1cd6RkNd1Cz2qiOPaqYFw69vkvhLCVZLgW
	RLB6AMVBD+Hg5Cmzt8a67m2Q9Kouvnl8qQBIax+gyMf7I2pD4loQucvSBdLNm77WpUwvY6Ta7sQBo
	Bv+v6Cc40JxpsqjB6ac9OJEjZD65mW3mROjQJJOWIe+ATCqjaMUlB4FvhY53mKIm1PKeSuVKBLEmi
	yBEff8pw==;
Received: from m16.mail.163.com ([220.197.31.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xAUe1-00000000GIj-2x4n
	for ath12k@lists.infradead.org;
	Sat, 26 Sep 2026 15:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1C
	5Kknk8OPRgaUyHr2WrphfIU+P9gaNOQznFxQmRB1s=; b=Fc+EIc6Vf8Q9nSlorW
	eZz6dnw3ruhLBX4l3qJBtUhwQ7r3/nN+mL5RTkkwMl6zM01xq/kPUZKpJqa4M8cD
	0euaztFxRpKP41oU/veNJXX9pEkSGRhL/HnezSTqUNtF/J83MSrp/De/++jGp/3s
	gXU+vWhid7XJAumQT3iFAn2Rw=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F4pL6bdqlpIIBA--.11355S6;
	Sat, 26 Sep 2026 23:48:33 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 4/5] wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
Date: Sat, 26 Sep 2026 23:48:23 +0800
Message-Id: <20260926154824.75224-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926154824.75224-1-yaojiale02@163.com>
References: <20260926154824.75224-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3F4pL6bdqlpIIBA--.11355S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1xJr4fXw4kZw18JF1kZrb_yoW8tw4fpF
	4rur9FyFy7Cw45Xr4ktF48G3WrX3Z5Ga1kKrW3Ga4rGFn8XrnagFy8ta4Iyry5KFWfJF1Y
	krWUKry8Grs8taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pijQ6AUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzREXUWq36VH7ZAAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_164858_195210_16CB1905 
X-CRM114-Status: GOOD (  10.34  )
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

ath12k_mac_tx_mgmt_pending_free() is passed as an idr_for_each()
callback and removes the current entry from txmgmt_idr. This can
invalidate the radix-tree iterator retained by idr_for_each().

Both callers destroy the IDR immediately after the walk, so removing
each entry in the callback is unnecessary. Split skb release from IDR
removal and let the callback release the supplied skb without updating
the IDR. The following idr_destroy() tears down the IDR itself.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 99bf5cf79d10..7695b21149d1 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9166,18 +9166,11 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
 		wake_up(&ar->txmgmt_empty_waitq);
 }
 
-static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
+static void ath12k_mac_tx_mgmt_free_skb(struct ath12k *ar,
+					struct sk_buff *msdu)
 {
-	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 
-	spin_lock_bh(&ar->txmgmt_idr_lock);
-	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
-	spin_unlock_bh(&ar->txmgmt_idr_lock);
-
-	if (!msdu)
-		return;
-
 	dma_unmap_single(ar->ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
 			 DMA_TO_DEVICE);
 
@@ -9187,11 +9180,23 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
 	ath12k_mgmt_over_wmi_tx_drop(ar, msdu);
 }
 
+static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
+{
+	struct sk_buff *msdu;
+
+	spin_lock_bh(&ar->txmgmt_idr_lock);
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
+
+	if (msdu)
+		ath12k_mac_tx_mgmt_free_skb(ar, msdu);
+}
+
 int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 {
 	struct ath12k *ar = ctx;
 
-	ath12k_mac_tx_mgmt_free(ar, buf_id);
+	ath12k_mac_tx_mgmt_free_skb(ar, skb);
 
 	return 0;
 }
-- 
2.34.1


