Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10FBC5B543
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 14:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEl4oLT0KrGbc8PXpcSR67dgBqeV1aKOv/aMPtqZaV8=; b=A4TjY6lK7FBK56DuW5jaR8CVnZ
	fv2gru4aMEikUsfRLtyD/B83ef80YVkMN8Y6VJjemuqUa+IFnyGJX+B9DXDnNbe9xydxLfpao8p4m
	Y1zID9pkLx688/y3ofLvhbIklCe0wnyqz6dHXRQzIwRW7fNhiaxcJ05hR6ARnM0Dknw47+hYZueRJ
	VmOVoZHMqC5NwuLuHENRS4u+BqAPVVM2tiJQrFbTRtiaL7EcDEo+Grtcns0kQe69v3qdUvL+pPoZn
	ghQISXaKk5s4rV9BgYjHitJiLVIhuktg57jEC2bjKuQ7kq2eajAxOekTTZyGrqn1J7FXh+S1bLSLj
	LEIf47Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpNI-0000000Dc14-1aQs;
	Wed, 04 Jun 2025 14:45:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpNF-0000000DbzF-3MDR
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 14:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 725814A872;
	Wed,  4 Jun 2025 14:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5051CC4CEF2;
	Wed,  4 Jun 2025 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749048349;
	bh=w++DUul6WcS0rSeeNY1gMqZO7ksu6qS8oACYN9qdE9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkrLm8KyEgBIdcnPkUh6cZBTFEjtbBHQX++sOEqB/pzXthf3AHJqb/zAXTT8E/Lgd
	 pI8TfaFYm3T8ElVMgZ+DWjX87LuF0790VA9kIVn3+e8RtTP4zIl0jtjkd03W5jWIEB
	 ikt5zblFvelL8rd8/sBkuOitWX/M4BN5nLHA5Z8y3ep1RKTiG3GihM54cF/6FSdpRG
	 ugPZbiMhztgLJJnqY6WlD2rimfEAQqGwDOpQk3ucXncIcrtprdkqFaeLQwi9a4Z0Q5
	 zBiyfpShGcoreRT+lkGwjIkn6gGTZ2Ila/eL8apzfzrsZWmsO7AojJMPd0KTyUf6l9
	 6071CGX5zPpLw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uMpND-000000007Of-1tJZ;
	Wed, 04 Jun 2025 16:45:47 +0200
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
Subject: [PATCH v2 4/4] wifi: ath12k: fix dest ring-buffer corruption when ring is full
Date: Wed,  4 Jun 2025 16:45:09 +0200
Message-ID: <20250604144509.28374-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604144509.28374-1-johan+linaro@kernel.org>
References: <20250604144509.28374-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_074549_858888_97C78B42 
X-CRM114-Status: GOOD (  11.04  )
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
index 1e2d13cc2d19..4da354e86a75 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -2153,7 +2153,6 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
 {
 	lockdep_assert_held(&srng->lock);
 
-	/* TODO: See if we need a write memory barrier here */
 	if (srng->flags & HAL_SRNG_FLAGS_LMAC_RING) {
 		/* For LMAC rings, ring pointer updates are done through FW and
 		 * hence written to a shared memory location that is read by FW
@@ -2168,7 +2167,11 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
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
@@ -2184,6 +2187,10 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
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


