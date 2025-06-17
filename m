Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF0BC7115F
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB8EUSq9ETd+TrnLPNQDSQxUSi0Mlq2cP35hoZRBxYs=; b=F9VzJZYCItHLiyhtqlpmx8cJen
	+TRtSziMvpndnpV8Jx4+4drukSA/IbYqn817Xc7g4h2sJayyjq19/JtHeAalfIS5+UpjQ8XqnP5K5
	Zzo7vO07YODkgku2tRaTuodGntd4gBODQku4vqUtZU2hNdR/i5ZlUZf/m1sTS16YAgIoMSxomHgQs
	EHqHEZm74uGRZ9lR6riYdBvfC7X7sEkf5g2EuDkgIhyG5doI+gK24ZDDgbF3l1B8oiyTT/jgfE4Y3
	d7gKtI2jjUy1+emsVRnWm9cTSiPtvXAUHMfd1CT2X/kS79uG5C2SYha+jQ7bA3dWmDPoB+B5E/mCO
	ZMToVojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRzu-00000006e8v-1VPl;
	Tue, 17 Jun 2025 08:48:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRw4-00000006dLG-2cYz
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 08:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D41BDA4AFB0;
	Tue, 17 Jun 2025 08:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC1FC4CEF8;
	Tue, 17 Jun 2025 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750149890;
	bh=XlOa4Weus0mkUtfWT3aYaV9OXWVLYZr4aEDz/snbCxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2KAgB8xCCpCAXskBTZ4pYd1aCutL+dYB9ERBVMeeojdtwDRyVQfnXwgd1R3OW6a5
	 O+i6+M09v3D+1mxRbPvdN0o0yBv6jF4uFgnIfRbQdq+Yj8tuYZyUQsSHAa6z9hNPv/
	 wP4gQTcXBRolYRKTP1iE/NVSRzWbL1M+SDgrNhlFnRQq9ihUDvOnUTouAKQRRdN3Ai
	 Grfuwa8AR6wJsNm/ycqU5RCSeDenNYYByn8FGupL2Qv7itxeF1TSaMhRviecHXh7nc
	 D2VLRJkRgTJfQxzF+FIE349OsouVsDmtikYt6vA2XGc73LnUNQmuqTYhyLXZ6myLcu
	 I3wT85r2nyWqw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uRRw0-000000003mv-1M6K;
	Tue, 17 Jun 2025 10:44:48 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 4/4] wifi: ath12k: fix dest ring-buffer corruption when ring is full
Date: Tue, 17 Jun 2025 10:44:02 +0200
Message-ID: <20250617084402.14475-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617084402.14475-1-johan+linaro@kernel.org>
References: <20250617084402.14475-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_014452_728013_C8BE4DA6 
X-CRM114-Status: GOOD (  10.72  )
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

Add the missing memory barriers to make sure that destination ring
descriptors are read before updating the tail pointer (and passing
ownership to the device) to avoid memory corruption on weakly ordered
architectures like aarch64 when the ring is full.

Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org      # 6.3
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/hal.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index d8193d9577bb..6406fcf5d69f 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -2170,7 +2170,6 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
 {
 	lockdep_assert_held(&srng->lock);
 
-	/* TODO: See if we need a write memory barrier here */
 	if (srng->flags & HAL_SRNG_FLAGS_LMAC_RING) {
 		/* For LMAC rings, ring pointer updates are done through FW and
 		 * hence written to a shared memory location that is read by FW
@@ -2185,7 +2184,11 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
 			WRITE_ONCE(*srng->u.src_ring.hp_addr, srng->u.src_ring.hp);
 		} else {
 			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
-			*srng->u.dst_ring.tp_addr = srng->u.dst_ring.tp;
+			/* Make sure descriptor is read before updating the
+			 * tail pointer.
+			 */
+			dma_mb();
+			WRITE_ONCE(*srng->u.dst_ring.tp_addr, srng->u.dst_ring.tp);
 		}
 	} else {
 		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
@@ -2201,6 +2204,10 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
 					   srng->u.src_ring.hp);
 		} else {
 			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
+			/* Make sure descriptor is read before updating the
+			 * tail pointer.
+			 */
+			mb();
 			ath12k_hif_write32(ab,
 					   (unsigned long)srng->u.dst_ring.tp_addr -
 					   (unsigned long)ab->mem,
-- 
2.49.0


