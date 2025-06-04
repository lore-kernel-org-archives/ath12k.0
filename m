Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF53C5B549
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yW0q/P2uEosW+vCHVJeF560J9Fn4wlUFknPbT1kJ44U=; b=PbpTnlqbHg4JthaESxBEko81+D
	3ZtOMV/2MeNnPM/7j2BZ3rx0hTv9KroPml5MHkHVZbgdGjz5Np6ePwt94P5bJD72CL57jTIeTS2ey
	rwFh0qaeyWkN8N24Mc3CkIhFoIUOZ2GIgjzlSVnoeddHU0hxpzutBDJWkxh2p7q3gN8unv29aYihS
	RZyvvWplxKIcyH7HKmvCgiDoGFQCudmHS9UvxsuOq9OeQO3PhNZtSW5/c73DB6u2L2INGsHMJaEKC
	4SpnOXQFMh0Co+NT49zJK/KUfwPl8lh8yBwP28qUMpG2lYq1vE+zOCnha81383K5f60kjmB53dPwb
	+lzBpjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpNI-0000000Dc1r-3JEC;
	Wed, 04 Jun 2025 14:45:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpNF-0000000DbzB-3MOI
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 14:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42BB64A789;
	Wed,  4 Jun 2025 14:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC2FC4AF09;
	Wed,  4 Jun 2025 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749048349;
	bh=y9HygGfhYvQ4+bq3qESNXQX/H9b1zgxy9prCNKq4TX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lPpZExvUaF9XWORXR5+H4kYbKMlp+Y50XA50lzLec3PlOtXC82GB9RDeYBgpvzW95
	 djGdlXdHZNz1qHAkRPmLpKSjbfegSpqZUdzytcZFQBiFERWt/rl+N7D8ziivuqpuZm
	 mWigyDPy7k1Kt5eIdvobRbb0o8V9wBeI/JFGgYQjfkUekVtGJS2pMMtMz/FGdG+f/j
	 qidmwuHJXXXQe5sRXyXQ/FX0u/3dCgUva2EIliy3FdYgaR7xMBR42BMlfi4fFXsjC5
	 W95dApUrxlqtIWHi6h3oJo1qVYs9nibizMWPjH2z1SWxBgchzNunZs6/kdMeSRL3qC
	 8EPZUv1AK1itA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uMpND-000000007Oa-1Apm;
	Wed, 04 Jun 2025 16:45:47 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 2/4] wifi: ath12k: use plain access for descriptor length
Date: Wed,  4 Jun 2025 16:45:07 +0200
Message-ID: <20250604144509.28374-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604144509.28374-1-johan+linaro@kernel.org>
References: <20250604144509.28374-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_074549_858683_F8236A2B 
X-CRM114-Status: UNSURE (   9.30  )
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

The read memory barrier added by commit 6b67d2cf14ea ("wifi: ath12k: fix
ring-buffer corruption") is enough to guarantee ordering also for plain
descriptor accesses if the length helper is ever inlined so drop the
unnecessary READ_ONCE().

Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 9eea13ed5565..8615578bb802 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -1962,7 +1962,7 @@ u32 ath12k_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc
 {
 	u32 len;
 
-	len = le32_get_bits(READ_ONCE(desc->flags), HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
+	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 
 	return len;
-- 
2.49.0


