Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3255C36000
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9crh39LlPqbgacEVHEo8dv7Vi5RIc2/zrCP7K0yNE4g=; b=CL2oBzcZhQbESfMVqSPdQmvhWQ
	z9XuXcNWZW6Bujx+zhsHMHmXQhuLo0Mr26cprPibzIDKkJKVoo/awrt6XAHQEsbxMr+VQtMi2Knun
	zY+2xrNNU4CQs+3RDanWmFhPL/zzd1rHihOO8KcScHSHmFiyvCbILwClJm4DbF9akQ7z+SEkSNbCG
	920Y5p0IHNfC656Je8oZDxE4ZvydRvRx3BJMUNdWlrtxsuqFMJe4DKEDrGtO4xlpw2Og6TyfusJQS
	mWEr8vYKRdpWyeWvge2B0KsGBxOs9YuBiaTtInQ0309UTQ7caicjx2RGn+d8IdSJLVmEBxojUvByL
	Zo/ni/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfAh-0000000FUhV-3BUq
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 16:24:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfAf-0000000FUg9-0PmM
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 16:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FD1143B15;
	Fri, 21 Mar 2025 16:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80239C4CEE3;
	Fri, 21 Mar 2025 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742574272;
	bh=H2y2nRWmakGnpy3JeVRWta/rM5SXOOhVIXKcy4ezc8w=;
	h=From:To:Cc:Subject:Date:From;
	b=h/U7QE/SHSeUU5xH58Z1vAVXYlPB+DXTB6uQ5mEVRbnxNEEX/DWGufdSJo6gBfiLy
	 oqUZy2IItTtA3rmhu38IvyGPnRL1+1sRA/GRrASpdLRGvTTAkV4qoIgFsTZ/9tnzGT
	 meocn8pzJDQvtb1IS+GeGbI6J8Es8rdM+/dNI2s6D94cBan4PXpt4PGYI9wQDIVTSC
	 B5+Nzh0Ylf1scEar0Q4ycywHGu6buC1E3LqYXlpctg/NnbudPuZGjS9W5nvGvEGH/4
	 CyBBJc9s5wfwWDhIQBvHP+oKvEVRQdW9cUGKQK1OtaFWLgCiCMib7180yOVi9X8tji
	 qGC9CTPigkHSg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tvfAh-00000000562-0835;
	Fri, 21 Mar 2025 17:24:35 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] wifi: ath12k: extend dma mask to 36 bits
Date: Fri, 21 Mar 2025 17:23:31 +0100
Message-ID: <20250321162331.19507-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_092433_173728_51C86201 
X-CRM114-Status: GOOD (  13.90  )
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

Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
without an iommu (under OS control) similar to what was done for ath11k
in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
DMA").

This specifically avoids using bounce buffers on Qualcomm Snapdragon X
Elite machines like the Lenovo ThinkPad T14s when running at EL1.

Note that the mask could possibly be extended further but unresolved DMA
issues with 64 GiB X Elite machines currently prevents that from being
tested.

Also note that the driver is limited to 32 bits for coherent
allocations and that there is no need to check for errors when setting
masks larger than 32 bits.

Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mhi.c |  2 +-
 drivers/net/wireless/ath/ath12k/pci.c | 12 ++++--------
 drivers/net/wireless/ath/ath12k/pci.h |  1 +
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 2f6d14382ed7..9c929c4ad8a8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -379,7 +379,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		mhi_ctrl->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 
 	mhi_ctrl->iova_start = 0;
-	mhi_ctrl->iova_stop = 0xffffffff;
+	mhi_ctrl->iova_stop = ab_pci->dma_mask;
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 06cff3849ab8..e77c50fc48ca 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -17,7 +17,7 @@
 #include "debug.h"
 
 #define ATH12K_PCI_BAR_NUM		0
-#define ATH12K_PCI_DMA_MASK		32
+#define ATH12K_PCI_DMA_MASK		36
 
 #define ATH12K_PCI_IRQ_CE0_OFFSET		3
 
@@ -874,13 +874,9 @@ static int ath12k_pci_claim(struct ath12k_pci *ab_pci, struct pci_dev *pdev)
 		goto disable_device;
 	}
 
-	ret = dma_set_mask_and_coherent(&pdev->dev,
-					DMA_BIT_MASK(ATH12K_PCI_DMA_MASK));
-	if (ret) {
-		ath12k_err(ab, "failed to set pci dma mask to %d: %d\n",
-			   ATH12K_PCI_DMA_MASK, ret);
-		goto release_region;
-	}
+	ab_pci->dma_mask = DMA_BIT_MASK(ATH12K_PCI_DMA_MASK);
+	dma_set_mask(&pdev->dev, ab_pci->dma_mask);
+	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 
 	pci_set_master(pdev);
 
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 31584a7ad80e..9e89b64b3545 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -116,6 +116,7 @@ struct ath12k_pci {
 	unsigned long irq_flags;
 	const struct ath12k_pci_ops *pci_ops;
 	u32 qmi_instance;
+	u64 dma_mask;
 };
 
 static inline struct ath12k_pci *ath12k_pci_priv(struct ath12k_base *ab)
-- 
2.48.1


