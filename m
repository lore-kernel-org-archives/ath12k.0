Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956C7C3DA6E
	for <ath12k@archiver.kernel.org>; Tue, 20 Dec 2022 12:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oJT2VTfgyPTvMbMutyM9BFoE1wVC28LE2JoyJudy1I=; b=qOh32CmOnoxT5r
	rtLk49i2iDYf7vrUm8jHx4yudGfZkQUKtZM1wPkAEWYyG4PyqvU1LFpwMFIC8b2aj69RkwCu0phyQ
	S/86nEo4qRjTDUdRqZAW/2AXE0ocEBbO6NprPo76+uGITBMS0r9X0hJ4+wndbFlTtaObLRg8w++cw
	p0/cpSQTyOb4YjEoLukmPHym9XXGhY06zfDzm+gx1CKGdmAe4b4HlKzmR8pheexybaQYPoXsSXEXi
	CES5w+QagGNRs8LkVVBkZEd2o5TRTcBycjtwNbFCDYrXiFrXwKEdUqtcbV5sIL2kSeYJbDAPvo9N9
	DXpSlrr1JMon8ILwSvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bOp-00EMJ2-Uh
	for ath12k@archiver.kernel.org; Tue, 20 Dec 2022 12:07:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bOl-00EM6s-An
	for ath12k@lists.infradead.org; Tue, 20 Dec 2022 12:07:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1428B81211
	for <ath12k@lists.infradead.org>; Tue, 20 Dec 2022 12:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2406C433F0;
	Tue, 20 Dec 2022 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671538022;
	bh=Y1kTfbdM42byAQZeBosdaf7QeTdLvj+mtpvhxkW8yW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xq860ZBOn1ShkSrig2vVwiACco742atbj7DqH67poaUYBeDKkVtFbLU8hPremCMjJ
	 etKccMpL90QSuJtGgu11qBosniXgN+HHTj35lClRCPgeaShXtIXk33DafCJDn0KP88
	 M8UgijGYURO8ACPP/s9CZqHTfgojRH3BAmNc9dJ2hcQ2+/KZf72bERXUcUvWdOQrhj
	 snnqasGARv0U9yd8QaCsq3n/31nUOKATQd26S3t6DCYloYc9ntpFWJwrlIjUNU1rsT
	 kHYDeor+McDIw+IRzJUjwdUbAHKyCHoVHZBeO9/wlvIgZRoEC9ZwIb7dt56xRamDX/
	 fZ4r1WKdA+34A==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/3] wifi: ath12k: hal: add ab parameter to macros using it
Date: Tue, 20 Dec 2022 14:06:53 +0200
Message-Id: <20221220120655.19389-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221220120655.19389-1-kvalo@kernel.org>
References: <20221220120655.19389-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_040707_781425_8BB9EF4B 
X-CRM114-Status: GOOD (  12.11  )
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

It's considered evil if a macro is using a variable but not having the variable
as a parameter. So add the ab parameter to macros using that.

No functional changes.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.c | 16 ++++++++--------
 drivers/net/wireless/ath/ath12k/hal.h | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 1e05e876af51..7b4a75ce5c82 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -1217,17 +1217,17 @@ static void ath12k_hal_srng_dst_hw_init(struct ath12k_base *ab,
 
 	if (srng->flags & HAL_SRNG_FLAGS_MSI_INTR) {
 		ath12k_hif_write32(ab, reg_base +
-				   HAL_REO1_RING_MSI1_BASE_LSB_OFFSET,
+				   HAL_REO1_RING_MSI1_BASE_LSB_OFFSET(ab),
 				   srng->msi_addr);
 
 		val = u32_encode_bits(((u64)srng->msi_addr >> HAL_ADDR_MSB_REG_SHIFT),
 				      HAL_REO1_RING_MSI1_BASE_MSB_ADDR) |
 				      HAL_REO1_RING_MSI1_BASE_MSB_MSI1_ENABLE;
 		ath12k_hif_write32(ab, reg_base +
-				       HAL_REO1_RING_MSI1_BASE_MSB_OFFSET, val);
+				   HAL_REO1_RING_MSI1_BASE_MSB_OFFSET(ab), val);
 
 		ath12k_hif_write32(ab,
-				   reg_base + HAL_REO1_RING_MSI1_DATA_OFFSET,
+				   reg_base + HAL_REO1_RING_MSI1_DATA_OFFSET(ab),
 				   srng->msi_data);
 	}
 
@@ -1237,7 +1237,7 @@ static void ath12k_hal_srng_dst_hw_init(struct ath12k_base *ab,
 			      HAL_REO1_RING_BASE_MSB_RING_BASE_ADDR_MSB) |
 	      u32_encode_bits((srng->entry_size * srng->num_entries),
 			      HAL_REO1_RING_BASE_MSB_RING_SIZE);
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_BASE_MSB_OFFSET, val);
+	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_BASE_MSB_OFFSET(ab), val);
 
 	val = u32_encode_bits(srng->ring_id, HAL_REO1_RING_ID_RING_ID) |
 	      u32_encode_bits(srng->entry_size, HAL_REO1_RING_ID_ENTRY_SIZE);
@@ -1251,15 +1251,15 @@ static void ath12k_hal_srng_dst_hw_init(struct ath12k_base *ab,
 				HAL_REO1_RING_PRDR_INT_SETUP_BATCH_COUNTER_THOLD);
 
 	ath12k_hif_write32(ab,
-			   reg_base + HAL_REO1_RING_PRODUCER_INT_SETUP_OFFSET,
+			   reg_base + HAL_REO1_RING_PRODUCER_INT_SETUP_OFFSET(ab),
 			   val);
 
 	hp_addr = hal->rdp.paddr +
 		  ((unsigned long)srng->u.dst_ring.hp_addr -
 		   (unsigned long)hal->rdp.vaddr);
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_HP_ADDR_LSB_OFFSET,
+	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_HP_ADDR_LSB_OFFSET(ab),
 			   hp_addr & HAL_ADDR_LSB_REG_MASK);
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_HP_ADDR_MSB_OFFSET,
+	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_HP_ADDR_MSB_OFFSET(ab),
 			   hp_addr >> HAL_ADDR_MSB_REG_SHIFT);
 
 	/* Initialize head and tail pointers to indicate ring is empty */
@@ -1278,7 +1278,7 @@ static void ath12k_hal_srng_dst_hw_init(struct ath12k_base *ab,
 		val |= HAL_REO1_RING_MISC_MSI_SWAP;
 	val |= HAL_REO1_RING_MISC_SRNG_ENABLE;
 
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_MISC_OFFSET, val);
+	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_MISC_OFFSET(ab), val);
 }
 
 static void ath12k_hal_srng_src_hw_init(struct ath12k_base *ab,
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 4962fa81d1c1..9d0f1d68c534 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -155,13 +155,13 @@ struct ath12k_base;
 #define HAL_REO1_AGING_THRESH_IX_2(ab)	((ab)->hw_params->regs->hal_reo1_aging_thres_ix2)
 #define HAL_REO1_AGING_THRESH_IX_3(ab)	((ab)->hw_params->regs->hal_reo1_aging_thres_ix3)
 
-#define HAL_REO1_RING_MSI1_BASE_LSB_OFFSET \
+#define HAL_REO1_RING_MSI1_BASE_LSB_OFFSET(ab)				\
 		(HAL_REO1_RING_MSI1_BASE_LSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_MSI1_BASE_MSB_OFFSET \
+#define HAL_REO1_RING_MSI1_BASE_MSB_OFFSET(ab)				\
 		(HAL_REO1_RING_MSI1_BASE_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_MSI1_DATA_OFFSET \
+#define HAL_REO1_RING_MSI1_DATA_OFFSET(ab)				\
 		(HAL_REO1_RING_MSI1_DATA(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_BASE_MSB_OFFSET \
+#define HAL_REO1_RING_BASE_MSB_OFFSET(ab)				\
 		(HAL_REO1_RING_BASE_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
 
 #define HAL_REO1_RING_ID_OFFSET(ab)					\
@@ -170,13 +170,13 @@ struct ath12k_base;
 		(HAL_REO1_RING_ID(_ab) - HAL_REO1_RING_BASE_LSB(_ab));	\
 	})
 
-#define HAL_REO1_RING_PRODUCER_INT_SETUP_OFFSET \
+#define HAL_REO1_RING_PRODUCER_INT_SETUP_OFFSET(ab)			\
 		(HAL_REO1_RING_PRODUCER_INT_SETUP(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_HP_ADDR_LSB_OFFSET \
+#define HAL_REO1_RING_HP_ADDR_LSB_OFFSET(ab)				\
 		(HAL_REO1_RING_HP_ADDR_LSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_HP_ADDR_MSB_OFFSET \
+#define HAL_REO1_RING_HP_ADDR_MSB_OFFSET(ab)				\
 		(HAL_REO1_RING_HP_ADDR_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_MISC_OFFSET \
+#define HAL_REO1_RING_MISC_OFFSET(ab)					\
 		(HAL_REO1_RING_MISC(ab) - HAL_REO1_RING_BASE_LSB(ab))
 
 /* REO2SW(x) R2 ring pointers (head/tail) address */
-- 
2.30.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
