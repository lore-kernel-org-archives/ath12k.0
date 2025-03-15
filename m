Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2813C28B30
	for <ath12k@archiver.kernel.org>; Sat, 15 Mar 2025 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh4IIbrQl/wmpdp/H+6U5Jt/H1Ogci6/Q3Sjmb9F4PY=; b=kqblAHYwELcqgMwkpCVzojgo3o
	r0m+FFWNXLQh5vIgzEVgnTwNQClL2isTWhFdaVZWbh+xl3DmLnSZyOU5wwVxF3DWe6dzS+WDLTEYh
	gNsZsD2KVctt1AaenF/7xUMPSWb6OncorKEqraWWGANDJvb6LX6Aw3iQAejf9ozUf16xfc2tGMZgW
	ynC542aTcqUwiaUtwAuMvFluB/FX8epavVqEfJaUfOG34uIlum4pmIx6E3n9NCehtI5SeQsjSrDm4
	JiSKKHL8T2DhH9KzsEbT6A9goXOTgi3jecufcT7xYF2D2yjmNiN1MHJ0pzPHCkpy9HsuJJa3scIla
	oTEnSUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttU68-0000000Ga1h-2HxS
	for ath12k@archiver.kernel.org;
	Sat, 15 Mar 2025 16:10:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttToE-0000000GYQJ-3M4x
	for ath12k@lists.infradead.org;
	Sat, 15 Mar 2025 15:52:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FCT20r016321;
	Sat, 15 Mar 2025 15:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lh4IIbrQl/wmpdp/H+6U5Jt/
	H1Ogci6/Q3Sjmb9F4PY=; b=QCeFIEKVBnYHofp5pDzs6KABlp8kKb82o/ZdW2EH
	C3UXW5lYNfFbKxCcPerdrEV+I94uF1h4ag3CVclQseDp8vk3D3QUTc328b+tVvwD
	zmGjLynROxhxsFrfT/VOW90eow6XKlrvC/FebBY/fz+5OSqN3EiaKrGbzmEJC8b/
	gcVtJFAsU0WZ/FG4Q3ivXwMKnHzOkSrpIiKhpGuN+wYGP+kKg+sqhr23imUhtJyK
	43LrJo0rRweT71JyU86A/3C8k947WqtEy5+Z4ubj1zteY9eQtMrPx2c6j3ckFZjM
	6KBvmvKn76GFAyT12JFNg5LXoVTMzFwVAMcEKogjzEVqyA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2qm0tue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 15:52:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52FFqLkm022096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 15:52:21 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 15 Mar 2025 08:52:19 -0700
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Subject: [PATCH ath-next v3 1/3] wifi: ath12k: Fix the enabling of REO queue lookup table feature
Date: Sat, 15 Mar 2025 21:21:57 +0530
Message-ID: <20250315155159.2475885-2-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250315155159.2475885-1-quic_nithp@quicinc.com>
References: <20250315155159.2475885-1-quic_nithp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qMnGogdwZOL3HKp3NSUMVaT9NHKr5z-n
X-Proofpoint-GUID: qMnGogdwZOL3HKp3NSUMVaT9NHKr5z-n
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=67d5a236 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=g2FoUW2gZ6yCIXOu_74A:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=1 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_085222_851142_E91E241C 
X-CRM114-Status: GOOD (  22.29  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Instead of storing the REO queue address inside peer entries, REO
hardware module prefers them to be stored in SRAM which could be
directly accessed by REO using peer_ID/TID based lookup table
mechanism.

Fix the enabling of the REO queue lookup table(LUT) feature by
configuring the LUT address information in the REO hardware register
and setting the host service flags.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    | 77 +++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h    |  5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 10 +++-
 drivers/net/wireless/ath/ath12k/hal.h   |  8 ++-
 drivers/net/wireless/ath/ath12k/hw.c    |  4 +-
 drivers/net/wireless/ath/ath12k/hw.h    |  5 +-
 drivers/net/wireless/ath/ath12k/wmi.c   |  8 ++-
 drivers/net/wireless/ath/ath12k/wmi.h   |  1 +
 8 files changed, 86 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index b1f27c3ac723..80b9f4594dee 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1261,22 +1261,24 @@ static void ath12k_dp_reoq_lut_cleanup(struct ath12k_base *ab)
 	if (!ab->hw_params->reoq_lut_support)
 		return;
 
-	if (dp->reoq_lut.vaddr) {
+	if (dp->reoq_lut.vaddr_unaligned) {
 		ath12k_hif_write32(ab,
 				   HAL_SEQ_WCSS_UMAC_REO_REG +
 				   HAL_REO1_QDESC_LUT_BASE0(ab), 0);
-		dma_free_coherent(ab->dev, DP_REOQ_LUT_SIZE,
-				  dp->reoq_lut.vaddr, dp->reoq_lut.paddr);
-		dp->reoq_lut.vaddr = NULL;
+		dma_free_coherent(ab->dev, dp->reoq_lut.size,
+				  dp->reoq_lut.vaddr_unaligned,
+				  dp->reoq_lut.paddr_unaligned);
+		dp->reoq_lut.vaddr_unaligned = NULL;
 	}
 
-	if (dp->ml_reoq_lut.vaddr) {
+	if (dp->ml_reoq_lut.vaddr_unaligned) {
 		ath12k_hif_write32(ab,
 				   HAL_SEQ_WCSS_UMAC_REO_REG +
 				   HAL_REO1_QDESC_LUT_BASE1(ab), 0);
-		dma_free_coherent(ab->dev, DP_REOQ_LUT_SIZE,
-				  dp->ml_reoq_lut.vaddr, dp->ml_reoq_lut.paddr);
-		dp->ml_reoq_lut.vaddr = NULL;
+		dma_free_coherent(ab->dev, dp->ml_reoq_lut.size,
+				  dp->ml_reoq_lut.vaddr_unaligned,
+				  dp->ml_reoq_lut.paddr_unaligned);
+		dp->ml_reoq_lut.vaddr_unaligned = NULL;
 	}
 }
 
@@ -1608,39 +1610,66 @@ static int ath12k_dp_cc_init(struct ath12k_base *ab)
 	return ret;
 }
 
+static int ath12k_dp_alloc_reoq_lut(struct ath12k_base *ab,
+				    struct ath12k_reo_q_addr_lut *lut)
+{
+	lut->size =  DP_REOQ_LUT_SIZE + HAL_REO_QLUT_ADDR_ALIGN - 1;
+	lut->vaddr_unaligned = dma_alloc_coherent(ab->dev, lut->size,
+						  &lut->paddr_unaligned,
+						  GFP_KERNEL | __GFP_ZERO);
+	if (!lut->vaddr_unaligned)
+		return -ENOMEM;
+
+	lut->vaddr = PTR_ALIGN(lut->vaddr_unaligned, HAL_REO_QLUT_ADDR_ALIGN);
+	lut->paddr = lut->paddr_unaligned +
+		     ((unsigned long)lut->vaddr - (unsigned long)lut->vaddr_unaligned);
+	return 0;
+}
+
 static int ath12k_dp_reoq_lut_setup(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = &ab->dp;
+	u32 val;
+	int ret;
 
 	if (!ab->hw_params->reoq_lut_support)
 		return 0;
 
-	dp->reoq_lut.vaddr = dma_alloc_coherent(ab->dev,
-						DP_REOQ_LUT_SIZE,
-						&dp->reoq_lut.paddr,
-						GFP_KERNEL | __GFP_ZERO);
-	if (!dp->reoq_lut.vaddr) {
+	ret = ath12k_dp_alloc_reoq_lut(ab, &dp->reoq_lut);
+	if (ret) {
 		ath12k_warn(ab, "failed to allocate memory for reoq table");
-		return -ENOMEM;
+		return ret;
 	}
 
-	dp->ml_reoq_lut.vaddr = dma_alloc_coherent(ab->dev,
-						   DP_REOQ_LUT_SIZE,
-						   &dp->ml_reoq_lut.paddr,
-						   GFP_KERNEL | __GFP_ZERO);
-	if (!dp->ml_reoq_lut.vaddr) {
+	ret = ath12k_dp_alloc_reoq_lut(ab, &dp->ml_reoq_lut);
+	if (ret) {
 		ath12k_warn(ab, "failed to allocate memory for ML reoq table");
-		dma_free_coherent(ab->dev, DP_REOQ_LUT_SIZE,
-				  dp->reoq_lut.vaddr, dp->reoq_lut.paddr);
-		dp->reoq_lut.vaddr = NULL;
-		return -ENOMEM;
+		dma_free_coherent(ab->dev, dp->reoq_lut.size,
+				  dp->reoq_lut.vaddr_unaligned,
+				  dp->reoq_lut.paddr_unaligned);
+		dp->reoq_lut.vaddr_unaligned = NULL;
+		return ret;
 	}
 
+	/* Bits in the register have address [39:8] LUT base address to be
+	 * allocated such that LSBs are assumed to be zero. Also, current
+	 * design supports paddr upto 4 GB max hence it fits in 32 bit register only
+	 */
+
 	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE0(ab),
-			   dp->reoq_lut.paddr);
+			   dp->reoq_lut.paddr >> 8);
+
 	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE1(ab),
 			   dp->ml_reoq_lut.paddr >> 8);
 
+	val = ath12k_hif_read32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_ADDR(ab));
+
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_ADDR(ab),
+			   val | HAL_REO_QDESC_ADDR_READ_LUT_ENABLE);
+
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_MAX_PEERID(ab),
+			   HAL_REO_QDESC_MAX_PEERID);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 75435a931548..dece8e5b0e86 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -309,8 +309,11 @@ struct ath12k_reo_queue_ref {
 } __packed;
 
 struct ath12k_reo_q_addr_lut {
-	dma_addr_t paddr;
+	u32 *vaddr_unaligned;
 	u32 *vaddr;
+	dma_addr_t paddr_unaligned;
+	dma_addr_t paddr;
+	u32 size;
 };
 
 struct ath12k_dp {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index ff6a709b5042..2244f025ec17 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3242,8 +3242,14 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
 	reo_ent_ring->rx_mpdu_info.peer_meta_data =
 		reo_dest_ring->rx_mpdu_info.peer_meta_data;
 
-	reo_ent_ring->queue_addr_lo = cpu_to_le32(lower_32_bits(rx_tid->paddr));
-	queue_addr_hi = upper_32_bits(rx_tid->paddr);
+	if (ab->hw_params->reoq_lut_support) {
+		reo_ent_ring->queue_addr_lo = reo_dest_ring->rx_mpdu_info.peer_meta_data;
+		queue_addr_hi = 0;
+	} else {
+		reo_ent_ring->queue_addr_lo = cpu_to_le32(lower_32_bits(rx_tid->paddr));
+		queue_addr_hi = upper_32_bits(rx_tid->paddr);
+	}
+
 	reo_ent_ring->info0 = le32_encode_bits(queue_addr_hi,
 					       HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI) |
 			      le32_encode_bits(dst_ind,
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 94e2e8735958..c4cfe093a5dd 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_HAL_H
@@ -21,6 +21,7 @@ struct ath12k_base;
 #define HAL_MAX_AVAIL_BLK_RES			3
 
 #define HAL_RING_BASE_ALIGN	8
+#define HAL_REO_QLUT_ADDR_ALIGN 256
 
 #define HAL_WBM_IDLE_SCATTER_BUF_SIZE_MAX	32704
 /* TODO: Check with hw team on the supported scatter buf size */
@@ -39,6 +40,7 @@ struct ath12k_base;
 #define HAL_OFFSET_FROM_HP_TO_TP		4
 
 #define HAL_SHADOW_REG(x) (HAL_SHADOW_BASE_ADDR + (4 * (x)))
+#define HAL_REO_QDESC_MAX_PEERID		8191
 
 /* WCSS Relative address */
 #define HAL_SEQ_WCSS_UMAC_OFFSET		0x00a00000
@@ -132,6 +134,8 @@ struct ath12k_base;
 #define HAL_REO1_DEST_RING_CTRL_IX_1		0x00000008
 #define HAL_REO1_DEST_RING_CTRL_IX_2		0x0000000c
 #define HAL_REO1_DEST_RING_CTRL_IX_3		0x00000010
+#define HAL_REO1_QDESC_ADDR(ab)		((ab)->hw_params->regs->hal_reo1_qdesc_addr)
+#define HAL_REO1_QDESC_MAX_PEERID(ab)	((ab)->hw_params->regs->hal_reo1_qdesc_max_peerid)
 #define HAL_REO1_SW_COOKIE_CFG0(ab)	((ab)->hw_params->regs->hal_reo1_sw_cookie_cfg0)
 #define HAL_REO1_SW_COOKIE_CFG1(ab)	((ab)->hw_params->regs->hal_reo1_sw_cookie_cfg1)
 #define HAL_REO1_QDESC_LUT_BASE0(ab)	((ab)->hw_params->regs->hal_reo1_qdesc_lut_base0)
@@ -319,6 +323,8 @@ struct ath12k_base;
 #define HAL_REO1_SW_COOKIE_CFG_ALIGN			BIT(18)
 #define HAL_REO1_SW_COOKIE_CFG_ENABLE			BIT(19)
 #define HAL_REO1_SW_COOKIE_CFG_GLOBAL_ENABLE		BIT(20)
+#define HAL_REO_QDESC_ADDR_READ_LUT_ENABLE		BIT(7)
+#define HAL_REO_QDESC_ADDR_READ_CLEAR_QDESC_ARRAY	BIT(6)
 
 /* CE ring bit field mask and shift */
 #define HAL_CE_DST_R0_DEST_CTRL_MAX_LEN			GENMASK(15, 0)
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index a106ebed7870..51c2033cec46 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/types.h>
@@ -734,6 +734,8 @@ static const struct ath12k_hw_regs qcn9274_v2_regs = {
 	.hal_reo1_sw_cookie_cfg1 = 0x00000070,
 	.hal_reo1_qdesc_lut_base0 = 0x00000074,
 	.hal_reo1_qdesc_lut_base1 = 0x00000078,
+	.hal_reo1_qdesc_addr = 0x0000007c,
+	.hal_reo1_qdesc_max_peerid = 0x00000088,
 	.hal_reo1_ring_base_lsb = 0x00000500,
 	.hal_reo1_ring_base_msb = 0x00000504,
 	.hal_reo1_ring_id = 0x00000508,
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 8d52182e28ae..abc1dbd89ef0 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_HW_H
@@ -296,6 +296,9 @@ struct ath12k_hw_regs {
 
 	u32 hal_tcl_status_ring_base_lsb;
 
+	u32 hal_reo1_qdesc_addr;
+	u32 hal_reo1_qdesc_max_peerid;
+
 	u32 hal_wbm_idle_ring_base_lsb;
 	u32 hal_wbm_idle_ring_misc_addr;
 	u32 hal_wbm_r0_idle_list_cntl_addr;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 6d1ea5f3a791..a51fe63a4914 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3665,7 +3665,8 @@ ath12k_fill_band_to_mac_param(struct ath12k_base  *soc,
 }
 
 static void
-ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cfg,
+ath12k_wmi_copy_resource_config(struct ath12k_base *ab,
+				struct ath12k_wmi_resource_config_params *wmi_cfg,
 				struct ath12k_wmi_resource_config_arg *tg_cfg)
 {
 	wmi_cfg->num_vdevs = cpu_to_le32(tg_cfg->num_vdevs);
@@ -3732,6 +3733,9 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
 					   WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION);
 	wmi_cfg->host_service_flags = cpu_to_le32(tg_cfg->is_reg_cc_ext_event_supported <<
 				WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT);
+	if (ab->hw_params->reoq_lut_support)
+		wmi_cfg->host_service_flags |=
+			cpu_to_le32(1 << WMI_RSRC_CFG_HOST_SVC_FLAG_REO_QREF_SUPPORT_BIT);
 	wmi_cfg->ema_max_vap_cnt = cpu_to_le32(tg_cfg->ema_max_vap_cnt);
 	wmi_cfg->ema_max_profile_period = cpu_to_le32(tg_cfg->ema_max_profile_period);
 	wmi_cfg->flags2 |= cpu_to_le32(WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET);
@@ -3772,7 +3776,7 @@ static int ath12k_init_cmd_send(struct ath12k_wmi_pdev *wmi,
 	ptr = skb->data + sizeof(*cmd);
 	cfg = ptr;
 
-	ath12k_wmi_copy_resource_config(cfg, &arg->res_cfg);
+	ath12k_wmi_copy_resource_config(ab, cfg, &arg->res_cfg);
 
 	cfg->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_RESOURCE_CONFIG,
 						 sizeof(*cfg));
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 1ba33e30ddd2..5fa785434e15 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2461,6 +2461,7 @@ struct wmi_init_cmd {
 } __packed;
 
 #define WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT 4
+#define WMI_RSRC_CFG_HOST_SVC_FLAG_REO_QREF_SUPPORT_BIT   12
 #define WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION		GENMASK(5, 4)
 #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64	BIT(5)
 #define WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET      BIT(9)
-- 
2.17.1


