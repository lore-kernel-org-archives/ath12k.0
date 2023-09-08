Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174A1EEB560
	for <ath12k@archiver.kernel.org>; Fri,  8 Sep 2023 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxqJ1g9vj0kshINQip0dXAWMkpq1hsip3C9+05mXjho=; b=cgJKqqtoBjf20e
	dJbVrgEsqrXOGfgzoshImZDyXPGdoQrUIeWBcByhsXTAvyedIWg3EBTJ5swfnL+SfH81Ei5bvFJCE
	JHdiPiY8FTRhRqmeH9s+bOXvizMEFfwV21EW0PYMSOPsPPpp06uC8tEc3fdUIVqa1Gh5zxGVkyWRZ
	+FNWpxs9vsikfheciLynTWJKZbdICWX8Ui8KfDZQrWDrWu2TsAdHozPYCdIxC05Bpdlk7gOxcgWIP
	eP/cg47dvo0EhNdB/poKKn4OVqpsUwnF3BjYc1OSCE1wxVE9RpiQte9IhPWrfCaellGlePBJ/Ajk4
	ae4Be1YklxT39Z+8DC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg0o-00EF94-2f
	for ath12k@archiver.kernel.org;
	Fri, 08 Sep 2023 18:15:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeg0l-00EF6p-1Q
	for ath12k@lists.infradead.org;
	Fri, 08 Sep 2023 18:15:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A3E4B821D5;
	Fri,  8 Sep 2023 18:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC88C433BA;
	Fri,  8 Sep 2023 18:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694196916;
	bh=kPzyhGpLgYOWktsL2OvjuWdZRDytUuhx+35KEFmIYus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAO/qa7iY26VEB7qidb4HXJeWYx/Fk0OqzwWoxZChBky2Uf/uEiMqovl00TPM1hmL
	 JXvFP8L5FZQ9GjlJM1GnOuJhW6heVq+HAlUZt2KcvMBBEpg4sHllNUffw86K9miZ5P
	 BfPwma5VVXJEKW5nhF4GfkahoQBYc07aF2BltOQdgeRYB38ePPwOQRp8N17JwoiCxQ
	 9+MpVPx0nq1dseE9cdKel/KCoUWh5tx25vhCcwPAtugPtYLrQ0pxxQPDh1JEJ9w5T5
	 vlhHUaApjfnRTbbz3vFm79qlQe9F5VfTeYEx8zGps5QFM+k3CoNWQp3ur1lwMsHX3m
	 vY4F3gPq3tFmw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rajat Soni <quic_rajson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 40/45] wifi: ath12k: Fix memory leak in rx_desc and tx_desc
Date: Fri,  8 Sep 2023 14:13:21 -0400
Message-Id: <20230908181327.3459042-40-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908181327.3459042-1-sashal@kernel.org>
References: <20230908181327.3459042-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111519_787390_25391B16 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Rajat Soni <quic_rajson@quicinc.com>

[ Upstream commit afb522b36e76acaa9f8fc06d0a9742d841c47c16 ]

Currently when ath12k_dp_cc_desc_init() is called we allocate
memory to rx_descs and tx_descs. In ath12k_dp_cc_cleanup(), during
descriptor cleanup rx_descs and tx_descs memory is not freed.

This is cause of memory leak. These allocated memory should be
freed in ath12k_dp_cc_cleanup.

In ath12k_dp_cc_desc_init(), we can save base address of rx_descs
and tx_descs. In ath12k_dp_cc_cleanup(), we can free rx_descs and
tx_descs memory using their base address.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230718053510.30894-1-quic_rajson@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp.c | 30 +++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.h |  2 ++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index ae1645d0f42a2..f933896f2a68d 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1129,6 +1129,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	struct ath12k_dp *dp = &ab->dp;
 	struct sk_buff *skb;
 	int i;
+	u32 pool_id, tx_spt_page;
 
 	if (!dp->spt_info)
 		return;
@@ -1148,6 +1149,14 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 		dev_kfree_skb_any(skb);
 	}
 
+	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
+		if (!dp->spt_info->rxbaddr[i])
+			continue;
+
+		kfree(dp->spt_info->rxbaddr[i]);
+		dp->spt_info->rxbaddr[i] = NULL;
+	}
+
 	spin_unlock_bh(&dp->rx_desc_lock);
 
 	/* TX Descriptor cleanup */
@@ -1170,6 +1179,21 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 		spin_unlock_bh(&dp->tx_desc_lock[i]);
 	}
 
+	for (pool_id = 0; pool_id < ATH12K_HW_MAX_QUEUES; pool_id++) {
+		spin_lock_bh(&dp->tx_desc_lock[pool_id]);
+
+		for (i = 0; i < ATH12K_TX_SPT_PAGES_PER_POOL; i++) {
+			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
+			if (!dp->spt_info->txbaddr[tx_spt_page])
+				continue;
+
+			kfree(dp->spt_info->txbaddr[tx_spt_page]);
+			dp->spt_info->txbaddr[tx_spt_page] = NULL;
+		}
+
+		spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
+	}
+
 	/* unmap SPT pages */
 	for (i = 0; i < dp->num_spt_pages; i++) {
 		if (!dp->spt_info[i].vaddr)
@@ -1343,6 +1367,8 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 			return -ENOMEM;
 		}
 
+		dp->spt_info->rxbaddr[i] = &rx_descs[0];
+
 		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
 			rx_descs[j].cookie = ath12k_dp_cc_cookie_gen(i, j);
 			rx_descs[j].magic = ATH12K_DP_RX_DESC_MAGIC;
@@ -1368,8 +1394,10 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 				return -ENOMEM;
 			}
 
+			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
+			dp->spt_info->txbaddr[tx_spt_page] = &tx_descs[0];
+
 			for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
-				tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
 				ppt_idx = ATH12K_NUM_RX_SPT_PAGES + tx_spt_page;
 				tx_descs[j].desc_id = ath12k_dp_cc_cookie_gen(ppt_idx, j);
 				tx_descs[j].pool_id = pool_id;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 7c5dafce5a68d..9aeda0321cd75 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -289,6 +289,8 @@ struct ath12k_tx_desc_info {
 struct ath12k_spt_info {
 	dma_addr_t paddr;
 	u64 *vaddr;
+	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
+	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
 };
 
 struct ath12k_reo_queue_ref {
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
