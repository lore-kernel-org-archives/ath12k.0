Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ED7C54FB3
	for <ath12k@archiver.kernel.org>; Mon, 26 May 2025 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io7F30k24U0LuPCYw5ipu4J0WFh0cCg/TWciR+xU9hQ=; b=ziQTwk7IxsAuNOj2E8D5yHKjTh
	JYCPYMiONDXIRbq3oun/aw0lyWlfvcC42a2wtKPYIelIGEVFUXOlh/LfKaxCkXLLPGljFwLFDMErK
	fB1xZaJgo/sSvIiszI4V2dJIOTA6heErOH2wFxqeBGOAodDTnhEjhDziTbJDKd2lC5h81fbQOLtB0
	0PnPsQ0XE2eyToDp8nO4A9NQ8lJqsOeBn1l9Lj6vBYmXYr55No/UNtVUNp6MANwWj+nxihtOFKefz
	kVia/Tm2yeEjube/cP/riWCrMixJgVUmEDmsax2PF6tcITd+DL2K4d+7fGUtfjrgHtb+mqO7lwBWP
	/UfL28Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWNP-00000008k7E-0eGg;
	Mon, 26 May 2025 11:52:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWNM-00000008k5x-47U1
	for ath12k@lists.infradead.org;
	Mon, 26 May 2025 11:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B3034A3CE;
	Mon, 26 May 2025 11:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5701AC4CEEF;
	Mon, 26 May 2025 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748260336;
	bh=PerCT+iLxD5zsw5LMxLFNaQeXnIW4oHIuRshGvuczYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OdRUSMXv6KQLm9B35acLeX2FNOh3q2aBIQYLdcSP9kM0HRmMdLdcPLev302MCgbea
	 XY0dPc9kuLMHPDIg0MxLjyVurTAdwG81Wn8NId9xd6as8/NZZIq7x359PIzHiJJsBB
	 4oPxmlKiM8zOwnNwiz8Gkgba5Ufj3t/WlpiNxTzk+v/UK2f7UJOPjiGqfs6hsX7qbl
	 TqIKzeskWILxkW0MxIHzOUA+9bGuT35AY1bzHRG5l87TX5hpweGSAe0TpRHTnuyYG9
	 LyAJ7sMducBK9TV8anKItVGYHDLuNXGyk3YxAlhXNs5qJNVL4G6m/eoKy1amWMBvmz
	 CFYLg+uozcg6Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uJWNN-000000000fG-3sio;
	Mon, 26 May 2025 13:52:17 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath12k: fix dest ring-buffer corruption
Date: Mon, 26 May 2025 13:51:36 +0200
Message-ID: <20250526115137.2490-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526115137.2490-1-johan+linaro@kernel.org>
References: <20250526115137.2490-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_045217_059921_9F1EF7E4 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
descriptors are read after the head pointers to avoid using stale data
on weakly ordered architectures like aarch64.

Note that this may fix the empty descriptor issue recently worked around
by commit 51ad34a47e9f ("wifi: ath12k: Add drop descriptor handling for
monitor ring").

Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org	# 6.3
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c |  3 +++
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/dp_tx.c  |  3 +++
 3 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index d22800e89485..90a7763502c8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -3258,6 +3258,9 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 	spin_lock_bh(&srng->lock);
 	ath12k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while (likely(*budget)) {
 		*budget -= 1;
 		mon_dst_desc = ath12k_hal_srng_dst_peek(ab, srng);
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 75bf4211ad42..68fceb4201d7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2753,6 +2753,9 @@ int ath12k_dp_rx_process(struct ath12k_base *ab, int ring_id,
 try_again:
 	ath12k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while ((desc = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
 		struct rx_mpdu_desc *mpdu_info;
 		struct rx_msdu_desc *msdu_info;
@@ -3599,6 +3602,9 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 
 	ath12k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while (budget &&
 	       (reo_desc = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
 		drop = false;
@@ -3941,6 +3947,9 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
 
 	ath12k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while (budget) {
 		rx_desc = ath12k_hal_srng_dst_get_next_entry(ab, srng);
 		if (!rx_desc)
@@ -4122,6 +4131,9 @@ void ath12k_dp_rx_process_reo_status(struct ath12k_base *ab)
 
 	ath12k_hal_srng_access_begin(ab, srng);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while ((hdr = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
 		tag = le64_get_bits(hdr->tl, HAL_SRNG_TLV_HDR_TAG);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index ced232bf4aed..3124eafa0201 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -853,6 +853,9 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 
 	ath12k_hal_srng_access_begin(ab, status_ring);
 
+	/* Make sure descriptor is read after the head pointer. */
+	dma_rmb();
+
 	while (ATH12K_TX_COMPL_NEXT(tx_ring->tx_status_head) != tx_ring->tx_status_tail) {
 		desc = ath12k_hal_srng_dst_get_next_entry(ab, status_ring);
 		if (!desc)
-- 
2.49.0


