Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAC9C36002
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 10:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OZZaiGPTTMV6+hHUpehviBxtqZ+wHwuRgYI/bKicRPo=; b=Dp2lvvfIdrb9aMyJlr6kNQmDCb
	T2QJB34DKn4u3EOxT8Olp113qAhwQaJuuDkeXm1UdNB1eoJVisL8Alo3ZdfwIK6IIAMUfz4UFuJfh
	Nx/FN8pOWsXkmSLcNcsx/+V+Vv2EnNhchNQf/fa48ea8Bq2Wqk7tbsqjw7TKGWO0bzkF715hvgXAS
	OxtDUHPDBsRB1I0K1KhmThAUPYZxaE59JY0aLf9W5QOYK+p9gR2j5XCGeAUB4/88affvfoKlngJTe
	QWVXYX3M9lE7eINC+ZLTAl/U+Qt0M39AN5+eLa0hHwtp0+DDTrH5LzwVCuUCiUni4nFPDX1XZxS9p
	sRT8/Rxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZea-0000000EWqX-0aJK
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 10:31:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZ3W-0000000ERQw-0tnp
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 09:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90D20A47826;
	Fri, 21 Mar 2025 09:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ADAC4CEE3;
	Fri, 21 Mar 2025 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550764;
	bh=NSVAITNBqV2fChMLATBR7BnFfMZSXgBvEHhNVh9sGMI=;
	h=From:To:Cc:Subject:Date:From;
	b=liheWtiSlemz6WGHszVKHmgrdO5t8mc5pNqvSBtAfZL+XpiKWTQWbQIAcomAKUGZk
	 NeRbbF87LAsjlG8VIbIsBsrOWod1yn0S1VFlAhaLJPh4kBj9yhIu7ACNqSXmixKLjj
	 d3qC4+2YcIHNCkbb4rzw3t4FZW/mvpUAEO1Q0p5+XpPLmUgLjr59Qj/MLJiVKTNbvv
	 ZKuWp0M5MRPsS+hRVGeC6bg3/0q2eJEespSlF9/f/keoJ7ENchU+9AyN4bhwbtcY8S
	 47Zfn2D5XC0r1V0Oa7jV8cnfHVX+Pn7Lh5Y8Q1H9CbQsqiR2TJ4HeqVomigTjx1FZX
	 ALl+YoqIcYrPw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tvZ3W-0000000053C-26Gm;
	Fri, 21 Mar 2025 10:52:46 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Clayton Craft <clayton@craftyguy.net>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix ring-buffer corruption
Date: Fri, 21 Mar 2025 10:52:19 +0100
Message-ID: <20250321095219.19369-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_025246_378244_A0E860F6 
X-CRM114-Status: GOOD (  15.98  )
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

Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
breaks and the log fills up with errors like:

    ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
    ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484

which based on a quick look at the ath11k driver seemed to indicate some
kind of ring-buffer corruption.

Miaoqing Pan tracked it down to the host seeing the updated destination
ring head pointer before the updated descriptor, and the error handling
for that in turn leaves the ring buffer in an inconsistent state.

While this has not yet been observed with ath12k, the ring-buffer
implementation is very similar to the ath11k one and it suffers from the
same bugs.

Add the missing memory barrier to make sure that the descriptor is read
after the head pointer to address the root cause of the corruption while
fixing up the error handling in case there are ever any (ordering) bugs
on the device side.

Note that the READ_ONCE() are only needed to avoid compiler mischief in
case the ring-buffer helpers are ever inlined.

Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org	# 6.3
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218623
Link: https://lore.kernel.org/20250310010217.3845141-3-quic_miaoqing@quicinc.com
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/ce.c  | 11 +++++------
 drivers/net/wireless/ath/ath12k/hal.c |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index be0d669d31fc..740586fe49d1 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -343,11 +343,10 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
 		goto err;
 	}
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	*nbytes = ath12k_hal_ce_dst_status_get_length(desc);
-	if (*nbytes == 0) {
-		ret = -EIO;
-		goto err;
-	}
 
 	*skb = pipe->dest_ring->skb[sw_index];
 	pipe->dest_ring->skb[sw_index] = NULL;
@@ -380,8 +379,8 @@ static void ath12k_ce_recv_process_cb(struct ath12k_ce_pipe *pipe)
 		dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(skb)->paddr,
 				 max_nbytes, DMA_FROM_DEVICE);
 
-		if (unlikely(max_nbytes < nbytes)) {
-			ath12k_warn(ab, "rxed more than expected (nbytes %d, max %d)",
+		if (unlikely(max_nbytes < nbytes || nbytes == 0)) {
+			ath12k_warn(ab, "unexpected rx length (nbytes %d, max %d)",
 				    nbytes, max_nbytes);
 			dev_kfree_skb_any(skb);
 			continue;
diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index cd59ff8e6c7b..91d5126ca149 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -1962,7 +1962,7 @@ u32 ath12k_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc
 {
 	u32 len;
 
-	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
+	len = le32_get_bits(READ_ONCE(desc->flags), HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 
 	return len;
@@ -2132,7 +2132,7 @@ void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
 		srng->u.src_ring.cached_tp =
 			*(volatile u32 *)srng->u.src_ring.tp_addr;
 	else
-		srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
+		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
 }
 
 /* Update cached ring head/tail pointers to HW. ath12k_hal_srng_access_begin()
-- 
2.48.1


