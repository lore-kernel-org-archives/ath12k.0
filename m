Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2947C636D6
	for <ath12k@archiver.kernel.org>; Wed, 22 Feb 2023 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q+BXyfCc4WmytJDdDrBWtjfe7r4i67moyQTO/zerPTM=; b=Z2qhhh3Eao+QW8
	8OAJ+w32PhTcGt7dfOyVP9sUKERIuW2FheApBYsIh1ZNUCXZq4Ji7mql4b60l4QACa0BJAYH2OhYr
	gzTIeVQZinkgAd1KWds/43+42O61FtaZFoVBuXdHqKvz0KPgPxEgq9r+Iq3zi2yzC7r8608NvL3BT
	X2i07WuiZUXjPvnpFZVWZRmHIHtvZtCIujm+j23j78DuAgIVtGBs8+s+Q6FNkVjGQxQfWFdTeVo3j
	m6kykxf4Cp9IGDB8mqsOP95mutFQEjkSczlt/tHr66tsclEk9YnUm53Ssdcwo/mEDLvDr3ync15Sh
	JS5bfGb9QM6WT/MSG6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsAG-00D3qv-5J
	for ath12k@archiver.kernel.org; Wed, 22 Feb 2023 16:40:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsAD-00D3q6-Oz
	for ath12k@lists.infradead.org; Wed, 22 Feb 2023 16:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A0DA614C4
	for <ath12k@lists.infradead.org>; Wed, 22 Feb 2023 16:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30514C433EF;
	Wed, 22 Feb 2023 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677084016;
	bh=Cq5LJA51WZMVZRD+6jr03EpdMGj/1bo1DYkBpIiNA9o=;
	h=From:To:Cc:Subject:Date:From;
	b=c5y0rKj7bsPD2J77uL3PPZe9c2tCU58PBGI25U3vjN2hovtM31xSAqNc3fVFCsQk4
	 NgBdS/XLI+DkaJC24TC5/zNut4DK39LCX+sh3x4tH5UoYYdHSbdy0NXvLE6yV/IBgo
	 Yc//bO12ewrlzCfF+dN2AKLAl8JpOG1u4i8Jy6D+dOy/lqM7/pbAiFTghAH64/Li9i
	 qMsuCam5fOGQVcYmTjGOKi65JCm9tj3Ck35HR5Q3ViYZ5/C+bCNIUKsvq+yHbhDWaL
	 e9xtHKf/aKUhc8C2mCJbMnKQJczQoKEbRP7AyJlOQbyTyI827nquJPvpke09twI9Fi
	 s7hWyDiaVrzqQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: remove memset with byte count of 278528
Date: Wed, 22 Feb 2023 18:40:14 +0200
Message-Id: <20230222164014.860-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_084017_874091_0F497A40 
X-CRM114-Status: GOOD (  10.25  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Sparse warns:

drivers/net/wireless/ath/ath12k/dp.c:1471:15: warning: memset with byte count of 278528

There's no need to use memset() here, instead call dma_alloc_coherent() with __GFP_ZERO.

While at it, remove an extra line before the error handler.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 9926d81c5fe4..ae1645d0f42a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1461,15 +1461,12 @@ static int ath12k_dp_reoq_lut_setup(struct ath12k_base *ab)
 	dp->reoq_lut.vaddr = dma_alloc_coherent(ab->dev,
 						DP_REOQ_LUT_SIZE,
 						&dp->reoq_lut.paddr,
-						GFP_KERNEL);
-
+						GFP_KERNEL | __GFP_ZERO);
 	if (!dp->reoq_lut.vaddr) {
 		ath12k_warn(ab, "failed to allocate memory for reoq table");
 		return -ENOMEM;
 	}
 
-	memset(dp->reoq_lut.vaddr, 0, DP_REOQ_LUT_SIZE);
-
 	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE0(ab),
 			   dp->reoq_lut.paddr);
 	return 0;

base-commit: 5aa9ff08c0b71be15a607341fa5344546e19ceb2
-- 
2.30.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
