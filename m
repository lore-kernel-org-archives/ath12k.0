Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F899C7115A
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNjbkfSgXOLCUAaEWOKloceerttvodvB06xZqZbfh10=; b=DjxLNM4Vd6QETbRW9vmmFhuGBR
	O8UFTRPs6Q/IQuYgLs5HkiPVDn2UznWbhHc/5+zV8a9tripSqSLiz4L22nexewSllXtnrP7v67FOE
	87jA/QPQTj+2UBVHLS2EJMqzjSpt3KhwS2l6eoK+5So0aqNThRTdoaGiIyxVlv5QjFfBjv6qL26aB
	u+4T/mYnclhKLVAbGgtEWRIfvml9cKNyh+nLAO3vFiABX8GTzFKXlyqKQmvVrN/eBCd6UQilbxnWf
	TqpiLxeg4V/gI+iR2Jsxd5h9YXPFrw+haGBz9ngq9UmeqVCwOUBFtnftygEapPln1A7pKHvAe3vpv
	nro3T7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRzt-00000006e82-0m7o;
	Tue, 17 Jun 2025 08:48:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRw4-00000006dLE-0Xe0
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 08:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95909A4AF5B;
	Tue, 17 Jun 2025 08:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECCDC4CEF0;
	Tue, 17 Jun 2025 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750149890;
	bh=SvXAxL/4I1X7cvYUjcC80e7Q09OqTbdWtCdJhyx3ICY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dA0zexcYVRjaBlixv11jjYTmBY8aLGf3clA5ljYPzD+L3DcSBUaP7lQz2Ca/MhVix
	 2+G/ZxLKUORNOMolJYDGVKGnT4e1hJu3FC/uU7w2YLWZHA7wtH+MQZwYOeqdpj6G7m
	 4duIoBHbcJf4QCzl8eotBjZoqwuzWYleB0FjaLrgqgcDqI83v5AgGuBgXeFPfVekjy
	 teUc3s3VuurpvINNr9XvLrhnncH2TRbIHahqSXqpiVnks0dfXB4sKK5OFJo3A1DLn2
	 lCoR/CaVan3pgKyHJxLZuqJs2KkFg88MDRzR44bPocGt651Nl0pC7yo5WuqjPRkxF1
	 t+rfCizdHCpJg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uRRw0-000000003mn-0BRJ;
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
Subject: [PATCH v3 1/4] wifi: ath12k: fix dest ring-buffer corruption
Date: Tue, 17 Jun 2025 10:43:59 +0200
Message-ID: <20250617084402.14475-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617084402.14475-1-johan+linaro@kernel.org>
References: <20250617084402.14475-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_014452_326930_B9E05D75 
X-CRM114-Status: GOOD (  12.48  )
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

Add the missing memory barrier to make sure that destination ring
descriptors are read after the head pointers to avoid using stale data
on weakly ordered architectures like aarch64.

The barrier is added to the ath12k_hal_srng_access_begin() helper for
symmetry with follow-on fixes for source ring buffer corruption which
will add barriers to ath12k_hal_srng_access_end().

Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org	# 6.3
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/ce.c  |  3 ---
 drivers/net/wireless/ath/ath12k/hal.c | 17 ++++++++++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index 3f3439262cf4..f7c15b547504 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -433,9 +433,6 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
 		goto err;
 	}
 
-	/* Make sure descriptor is read after the head pointer. */
-	dma_rmb();
-
 	*nbytes = ath12k_hal_ce_dst_status_get_length(desc);
 
 	*skb = pipe->dest_ring->skb[sw_index];
diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index a301898e5849..f8bd3837b9dc 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -2143,13 +2143,24 @@ void *ath12k_hal_srng_src_get_next_reaped(struct ath12k_base *ab,
 
 void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
 {
+	u32 hp;
+
 	lockdep_assert_held(&srng->lock);
 
-	if (srng->ring_dir == HAL_SRNG_DIR_SRC)
+	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
 		srng->u.src_ring.cached_tp =
 			*(volatile u32 *)srng->u.src_ring.tp_addr;
-	else
-		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
+	} else {
+		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
+
+		if (hp != srng->u.dst_ring.cached_hp) {
+			srng->u.dst_ring.cached_hp = hp;
+			/* Make sure descriptor is read after the head
+			 * pointer.
+			 */
+			dma_rmb();
+		}
+	}
 }
 
 /* Update cached ring head/tail pointers to HW. ath12k_hal_srng_access_begin()
-- 
2.49.0


