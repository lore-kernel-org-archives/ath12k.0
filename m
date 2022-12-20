Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2CEC4332F
	for <ath12k@archiver.kernel.org>; Tue, 20 Dec 2022 12:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tk9McZUzZbljGtV89IgYVj54l6/Oy5Qdwf5dEycyr+Y=; b=mSHBjwvdcdj/5A
	BZ3F8VAJSWaOMluk6eJg7JB4PK0NUi/uxBNomYTIOImHS3DQWgi0lsSwFjaOdJX4Q05rCgYqHeIel
	D/jVG3NVii37nXoP6Ftl4YZrCu386npBlfurs+Llk7eIhJIKaEYRhBrZ8dwUBrt5UqRS2FXaULI64
	jI3c9Au8K07JPBjmIbZoYWFRBHEddGAdx+uAzEbdmCHQ6//pc2xOSmbT8Ny34UQfns1Obz43us68y
	3gYcumvZWAqz87wDYjddsLkvDdz95rpRzflIJshgKbXmuwGqrWS7g7irOqdFED1ytPS9WAeGDqVEO
	H++CqvVEmLCJM2SoX3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bOp-00EMIw-NZ
	for ath12k@archiver.kernel.org; Tue, 20 Dec 2022 12:07:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bOl-00EM86-7Y
	for ath12k@lists.infradead.org; Tue, 20 Dec 2022 12:07:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C55EBB81230
	for <ath12k@lists.infradead.org>; Tue, 20 Dec 2022 12:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECDEC433EF;
	Tue, 20 Dec 2022 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671538023;
	bh=QxMrnwNBu4v93t4mRmVTx+CyQtgobAjnfpLfICSD/+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X2igKxeg+b9+h58h1uZykgQLhuFwMRr16uXmiRA14GnrH8tt4pv2b4fLzGEqN6Ydu
	 oXPr0QaxtDmk7PZNllKGu6UW8jq5Ii42Wc3fsOjRGb35JEG1IP1KYqPZsHjV2lFpU2
	 dl808ZEUtxx8smKpZU82rgYv3x8TeocJvwbdRZVviFxSfpBNExcG27dejWY/bDZz+2
	 uSVhykuOL6aNKgEf00omNOF7wHNIe85hdVJn8kvThQDjQ6+Kyyzf7qrCZPTZTs1o6R
	 CgS4+yn0pJqUQ+TspPmrZejLkydpyzs+rN+3e/WH9gPgfqqpC4u3ohm04nd9e2Y2JV
	 GtDDfL7YrzudQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/3] wifi: ath12k: hal: convert offset macros to functions
Date: Tue, 20 Dec 2022 14:06:54 +0200
Message-Id: <20221220120655.19389-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221220120655.19389-1-kvalo@kernel.org>
References: <20221220120655.19389-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_040707_626615_6ADD716D 
X-CRM114-Status: GOOD (  12.03  )
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

After previous patch checkpatch was giving warnings:

drivers/net/wireless/ath/ath12k/hal.h:158: Macro argument reuse 'ab' - possible side-effects?
drivers/net/wireless/ath/ath12k/hal.h:160: Macro argument reuse 'ab' - possible side-effects?
drivers/net/wireless/ath/ath12k/hal.h:162: Macro argument reuse 'ab' - possible side-effects?
drivers/net/wireless/ath/ath12k/hal.h:164: Macro argument reuse 'ab' - possible side-effects?
drivers/net/wireless/ath/ath12k/hal.h:173: Macro argument reuse 'ab' - possible side-effects?
drivers/net/wireless/ath/ath12k/hal.h:175: Macro argument reuse 'ab' - possible side-effects?
drivers/net/wireless/ath/ath12k/hal.h:177: Macro argument reuse 'ab' - possible side-effects?
drivers/net/wireless/ath/ath12k/hal.h:179: Macro argument reuse 'ab' - possible side-effects?

To fix those convert the macros into functions. As it was difficult to use
struct ath12k_base within hal.h, core.h was already including hal.h so
including back core.h would not work, move the functions also to hal.c.

No functional changes.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.c | 63 +++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/hal.h | 24 ----------
 2 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 7b4a75ce5c82..95d04819083f 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -242,6 +242,51 @@ ath12k_hal_wcn7850_tcl_to_wbm_rbm_map[DP_TCL_NUM_RING_MAX] = {
 	},
 };
 
+static unsigned int ath12k_hal_reo1_ring_id_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_ID(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
+static unsigned int ath12k_hal_reo1_ring_msi1_base_lsb_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_MSI1_BASE_LSB(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
+static unsigned int ath12k_hal_reo1_ring_msi1_base_msb_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_MSI1_BASE_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
+static unsigned int ath12k_hal_reo1_ring_msi1_data_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_MSI1_DATA(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
+static unsigned int ath12k_hal_reo1_ring_base_msb_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_BASE_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
+static unsigned int ath12k_hal_reo1_ring_producer_int_setup_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_PRODUCER_INT_SETUP(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
+static unsigned int ath12k_hal_reo1_ring_hp_addr_lsb_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_HP_ADDR_LSB(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
+static unsigned int ath12k_hal_reo1_ring_hp_addr_msb_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_HP_ADDR_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
+static unsigned int ath12k_hal_reo1_ring_misc_offset(struct ath12k_base *ab)
+{
+	return HAL_REO1_RING_MISC(ab) - HAL_REO1_RING_BASE_LSB(ab);
+}
+
 static bool ath12k_hw_qcn9274_rx_desc_get_first_msdu(struct hal_rx_desc *desc)
 {
 	return !!le16_get_bits(desc->u.qcn9274.msdu_end.info5,
@@ -1217,17 +1262,17 @@ static void ath12k_hal_srng_dst_hw_init(struct ath12k_base *ab,
 
 	if (srng->flags & HAL_SRNG_FLAGS_MSI_INTR) {
 		ath12k_hif_write32(ab, reg_base +
-				   HAL_REO1_RING_MSI1_BASE_LSB_OFFSET(ab),
+				   ath12k_hal_reo1_ring_msi1_base_lsb_offset(ab),
 				   srng->msi_addr);
 
 		val = u32_encode_bits(((u64)srng->msi_addr >> HAL_ADDR_MSB_REG_SHIFT),
 				      HAL_REO1_RING_MSI1_BASE_MSB_ADDR) |
 				      HAL_REO1_RING_MSI1_BASE_MSB_MSI1_ENABLE;
 		ath12k_hif_write32(ab, reg_base +
-				   HAL_REO1_RING_MSI1_BASE_MSB_OFFSET(ab), val);
+				   ath12k_hal_reo1_ring_msi1_base_msb_offset(ab), val);
 
 		ath12k_hif_write32(ab,
-				   reg_base + HAL_REO1_RING_MSI1_DATA_OFFSET(ab),
+				   reg_base + ath12k_hal_reo1_ring_msi1_data_offset(ab),
 				   srng->msi_data);
 	}
 
@@ -1237,11 +1282,11 @@ static void ath12k_hal_srng_dst_hw_init(struct ath12k_base *ab,
 			      HAL_REO1_RING_BASE_MSB_RING_BASE_ADDR_MSB) |
 	      u32_encode_bits((srng->entry_size * srng->num_entries),
 			      HAL_REO1_RING_BASE_MSB_RING_SIZE);
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_BASE_MSB_OFFSET(ab), val);
+	ath12k_hif_write32(ab, reg_base + ath12k_hal_reo1_ring_base_msb_offset(ab), val);
 
 	val = u32_encode_bits(srng->ring_id, HAL_REO1_RING_ID_RING_ID) |
 	      u32_encode_bits(srng->entry_size, HAL_REO1_RING_ID_ENTRY_SIZE);
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_ID_OFFSET(ab), val);
+	ath12k_hif_write32(ab, reg_base + ath12k_hal_reo1_ring_id_offset(ab), val);
 
 	/* interrupt setup */
 	val = u32_encode_bits((srng->intr_timer_thres_us >> 3),
@@ -1251,15 +1296,15 @@ static void ath12k_hal_srng_dst_hw_init(struct ath12k_base *ab,
 				HAL_REO1_RING_PRDR_INT_SETUP_BATCH_COUNTER_THOLD);
 
 	ath12k_hif_write32(ab,
-			   reg_base + HAL_REO1_RING_PRODUCER_INT_SETUP_OFFSET(ab),
+			   reg_base + ath12k_hal_reo1_ring_producer_int_setup_offset(ab),
 			   val);
 
 	hp_addr = hal->rdp.paddr +
 		  ((unsigned long)srng->u.dst_ring.hp_addr -
 		   (unsigned long)hal->rdp.vaddr);
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_HP_ADDR_LSB_OFFSET(ab),
+	ath12k_hif_write32(ab, reg_base + ath12k_hal_reo1_ring_hp_addr_lsb_offset(ab),
 			   hp_addr & HAL_ADDR_LSB_REG_MASK);
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_HP_ADDR_MSB_OFFSET(ab),
+	ath12k_hif_write32(ab, reg_base + ath12k_hal_reo1_ring_hp_addr_msb_offset(ab),
 			   hp_addr >> HAL_ADDR_MSB_REG_SHIFT);
 
 	/* Initialize head and tail pointers to indicate ring is empty */
@@ -1278,7 +1323,7 @@ static void ath12k_hal_srng_dst_hw_init(struct ath12k_base *ab,
 		val |= HAL_REO1_RING_MISC_MSI_SWAP;
 	val |= HAL_REO1_RING_MISC_SRNG_ENABLE;
 
-	ath12k_hif_write32(ab, reg_base + HAL_REO1_RING_MISC_OFFSET(ab), val);
+	ath12k_hif_write32(ab, reg_base + ath12k_hal_reo1_ring_misc_offset(ab), val);
 }
 
 static void ath12k_hal_srng_src_hw_init(struct ath12k_base *ab,
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9d0f1d68c534..dfbd8bce70e5 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -155,30 +155,6 @@ struct ath12k_base;
 #define HAL_REO1_AGING_THRESH_IX_2(ab)	((ab)->hw_params->regs->hal_reo1_aging_thres_ix2)
 #define HAL_REO1_AGING_THRESH_IX_3(ab)	((ab)->hw_params->regs->hal_reo1_aging_thres_ix3)
 
-#define HAL_REO1_RING_MSI1_BASE_LSB_OFFSET(ab)				\
-		(HAL_REO1_RING_MSI1_BASE_LSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_MSI1_BASE_MSB_OFFSET(ab)				\
-		(HAL_REO1_RING_MSI1_BASE_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_MSI1_DATA_OFFSET(ab)				\
-		(HAL_REO1_RING_MSI1_DATA(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_BASE_MSB_OFFSET(ab)				\
-		(HAL_REO1_RING_BASE_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-
-#define HAL_REO1_RING_ID_OFFSET(ab)					\
-	({								\
-		struct ath12k_base *_ab = (ab);				\
-		(HAL_REO1_RING_ID(_ab) - HAL_REO1_RING_BASE_LSB(_ab));	\
-	})
-
-#define HAL_REO1_RING_PRODUCER_INT_SETUP_OFFSET(ab)			\
-		(HAL_REO1_RING_PRODUCER_INT_SETUP(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_HP_ADDR_LSB_OFFSET(ab)				\
-		(HAL_REO1_RING_HP_ADDR_LSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_HP_ADDR_MSB_OFFSET(ab)				\
-		(HAL_REO1_RING_HP_ADDR_MSB(ab) - HAL_REO1_RING_BASE_LSB(ab))
-#define HAL_REO1_RING_MISC_OFFSET(ab)					\
-		(HAL_REO1_RING_MISC(ab) - HAL_REO1_RING_BASE_LSB(ab))
-
 /* REO2SW(x) R2 ring pointers (head/tail) address */
 #define HAL_REO1_RING_HP			0x00003048
 #define HAL_REO1_RING_TP			0x0000304c
-- 
2.30.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
