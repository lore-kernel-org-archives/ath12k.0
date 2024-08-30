Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94B1CA0EEC
	for <ath12k@archiver.kernel.org>; Fri, 30 Aug 2024 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wuv9obc/Xx4ZaKo4kmCVXNgu0ZQZGPsA7BXAh4kjQ+s=; b=vtqyZQqVX+xopUg/QiBfTCKdG5
	ADTAzIpKhc9LCbOkgXq8Y0vbq1lOgqPb4oBFEgWEwVxWj7mMisHJXrmA0HScqu9yEEIZrMrSCt+I6
	d4GKLEv2EDYnNIFxYIrVYgotYLC6Kn6mZuySiazG0Cv8Rpv6sUqqZMVmInT/1qPaQszaJ/jnILrZw
	b/KOgIQzCSRhIC9GE8v7HhkqVdc8d2bXTvfdqaRCKdSnpN7A27IjB+37d2sCsIUbGw8bXVDFgxGcx
	X4dmjxQNJYxW6G2937HRrLJjL2MHTdrwc3bC1+vkIW62UkSGCUVlmEJTinOVfVBj8FOPzcDgOW2y/
	BOg2lUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwsU-00000005Jfw-1Jm6
	for ath12k@archiver.kernel.org;
	Fri, 30 Aug 2024 08:21:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwrD-00000005JHh-0f1k
	for ath12k@lists.infradead.org;
	Fri, 30 Aug 2024 08:19:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42bb81e795bso11093405e9.1
        for <ath12k@lists.infradead.org>; Fri, 30 Aug 2024 01:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725005985; x=1725610785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wuv9obc/Xx4ZaKo4kmCVXNgu0ZQZGPsA7BXAh4kjQ+s=;
        b=VqO1FJNf+LaYUzw0HI53N40abBe+Ol2DNZ7K/eIx5rbE0MuE5qN4L6yL0W2damSc1J
         tIztLd7DnmElzio3epzhe/kYPrYGUrI/xv1gKT5xiduXsWi/ppiAveIaDp+ghyiNNgcQ
         L/PaxxU1Gz88FYISG9cuwE+kcvG7KW5CCIAe39G7+f+FlUwP1RJyXVj1GsALbKVL+vhA
         qTxbZQ/u+nzzt0SujXB4mlkUr95trx9dZaVi8FOAOrzgenaSHA1dQecWNhKunLy0dbH1
         R0dDJ6KPr7geaMkZsWoOB5yDw46r6eS9X/7GwaY5QIbR+S96E0r3h1DO4DwNgUsNoa7G
         VrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005985; x=1725610785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wuv9obc/Xx4ZaKo4kmCVXNgu0ZQZGPsA7BXAh4kjQ+s=;
        b=Vj0vNrOP/caoTRaSgWpCCXYvFUt2CI9CTChIRl01USYEo4X5J+yKZ9EuNmXj+yHSe2
         iO732V5CaF1Si5pNSpU9h4dRgaufCDGqIFvC9KA6mC8cugjNQBwl8+uccvWeeA9YJkHX
         kLso7Kk36+dYaRpqm3V26d0+jPrwoW9u5Z/CjaSR2WgEvSmf6e50eKzy3ga35FS718ya
         NdiwRousu+x09o+zsZ5BsfvwJpm/b/JxmFtXeEKGELLhXWvak9P7mt1PrwaylLbQ1kep
         WyCy671xbvkI9EP+9G2aMDlQK1wSjBRlvGYePAxrI5NVmBJJ3v2FJPYebemZO9mLwcll
         wajg==
X-Gm-Message-State: AOJu0YxKUnCRoS17ODWfcpL00PO60BD72pcLeWHzc5evaLPs75KGrvCH
	akZgcWoEzi8VjfsXTAOKarF0An4bWOmEQML/UE4c1oAJ+3WJQr+/bVIgZA==
X-Google-Smtp-Source: AGHT+IEAFpZYeGmtteC9UnGx9qUAJ3fgJzSiGa5JxPKv7WaO1jcBGcjsCe2AM88YZ8qr8IDBCZ/tgg==
X-Received: by 2002:a05:6000:4012:b0:368:41e0:16c0 with SMTP id ffacd0b85a97d-374a9568b7bmr1313272f8f.22.1725005984394;
        Fri, 30 Aug 2024 01:19:44 -0700 (PDT)
Received: from syracuse.iliad.local ([2a01:e0a:0:2100:21ef:6d50:511c:bd79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef812b2sm3317624f8f.75.2024.08.30.01.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:19:44 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: move txbaddr/rxbaddr into struct ath12k_dp
Date: Fri, 30 Aug 2024 10:19:42 +0200
Message-ID: <20240830081942.3623380-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_011947_374490_9D25133B 
X-CRM114-Status: GOOD (  14.85  )
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

Those two fields are used to store the per SPT page of tx/rx descriptors send to
the firmware for cookie conversion. Right now they are in struct ath12k_spt_info
which means they are duplicated PPT page times while we only need one instance
of them. This works for now as we always use the first spt_info as a global
storage for all PPT pages.

Let's move them into struct ath12k_dp where they belong, alongside of the
spt_info array they are tied to, to avoid waisting a good bit of memory.

Tested-on: QCN9274 hw2.0 PCI CI_WLAN.WBE.1.3-03283.1-QCAHKSWPL_SILICONZ-2

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 18 +++++++++---------
 drivers/net/wireless/ath/ath12k/dp.h |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 61aa78d8bd8c..ecd3b5c76d26 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1162,7 +1162,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	spin_lock_bh(&dp->rx_desc_lock);
 
 	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
-		desc_info = dp->spt_info->rxbaddr[i];
+		desc_info = dp->rxbaddr[i];
 
 		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
 			if (!desc_info[j].in_use) {
@@ -1181,11 +1181,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	}
 
 	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
-		if (!dp->spt_info->rxbaddr[i])
+		if (!dp->rxbaddr[i])
 			continue;
 
-		kfree(dp->spt_info->rxbaddr[i]);
-		dp->spt_info->rxbaddr[i] = NULL;
+		kfree(dp->rxbaddr[i]);
+		dp->rxbaddr[i] = NULL;
 	}
 
 	spin_unlock_bh(&dp->rx_desc_lock);
@@ -1220,11 +1220,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 
 		for (i = 0; i < ATH12K_TX_SPT_PAGES_PER_POOL; i++) {
 			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
-			if (!dp->spt_info->txbaddr[tx_spt_page])
+			if (!dp->txbaddr[tx_spt_page])
 				continue;
 
-			kfree(dp->spt_info->txbaddr[tx_spt_page]);
-			dp->spt_info->txbaddr[tx_spt_page] = NULL;
+			kfree(dp->txbaddr[tx_spt_page]);
+			dp->txbaddr[tx_spt_page] = NULL;
 		}
 
 		spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
@@ -1415,7 +1415,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 
 		ppt_idx = ATH12K_RX_SPT_PAGE_OFFSET + i;
 		cookie_ppt_idx = dp->rx_ppt_base + ppt_idx;
-		dp->spt_info->rxbaddr[i] = &rx_descs[0];
+		dp->rxbaddr[i] = &rx_descs[0];
 
 		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
 			rx_descs[j].cookie = ath12k_dp_cc_cookie_gen(cookie_ppt_idx, j);
@@ -1445,7 +1445,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
 			ppt_idx = ATH12K_TX_SPT_PAGE_OFFSET + tx_spt_page;
 
-			dp->spt_info->txbaddr[tx_spt_page] = &tx_descs[0];
+			dp->txbaddr[tx_spt_page] = &tx_descs[0];
 
 			for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
 				tx_descs[j].desc_id = ath12k_dp_cc_cookie_gen(ppt_idx, j);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index b77497c14ac4..28c8bf22810c 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -300,8 +300,6 @@ struct ath12k_tx_desc_info {
 struct ath12k_spt_info {
 	dma_addr_t paddr;
 	u64 *vaddr;
-	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
-	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
 };
 
 struct ath12k_reo_queue_ref {
@@ -352,6 +350,8 @@ struct ath12k_dp {
 	struct ath12k_spt_info *spt_info;
 	u32 num_spt_pages;
 	u32 rx_ppt_base;
+	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
+	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
 	struct list_head rx_desc_free_list;
 	/* protects the free desc list */
 	spinlock_t rx_desc_lock;
-- 
2.46.0


