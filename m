Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0156AC7115B
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kDZb+mdn7JCLPJ5u3ArqeKD27urtwDNmqER59tjCYA=; b=X33bw3hkiqXs3QyseSI3HLMT+l
	3jqgjTNgLva+7AzyPeeS1TWCaOcXQPO1iKSyFSvxMYktisqvyMfXfrLpTBrou2Fjea+jJJWmlm7eo
	+BA7A1WtFtyS0xKW8G+Dx+Ip1ljUWgVmEEuc+LfLwOb65Vw79EhiJlF8G4pLWL4v8hcJNyXN37inS
	8RVO6KcDZkeA91hip76sEez2jAgDFKqdiGkkZBpUOGkdBH1nXGlbYtHl7kfAWgOkmLOApuCjRxxOG
	T2GGO0msSkgm6RzXxxm813Z6a/WSlNz/u2ZY4k4JRvPpi6z90IUDqM+FxUb6/BSlNavKQHnsmKeCd
	Mv4nXwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRzt-00000006e8K-33Jf;
	Tue, 17 Jun 2025 08:48:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRw4-00000006dLB-0Xoq
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 08:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7EA02A4AD3D;
	Tue, 17 Jun 2025 08:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29ACEC4CEE3;
	Tue, 17 Jun 2025 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750149890;
	bh=8TdcpNaOAnT6sQbogFZJL8X+FGsz3jK1CDvlMPWZFoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tA08Rkge3dARox3RhosuJBCQhyuXL73DtBFR3JKG1io9kPU4kmY9e+fK+fdx8DeLJ
	 ihcyrRGQ1+pDICNQlSmd+KhRLUrJkdUmC/D7YPJ8FbtGTnHPq3RKcKMgV9rvmwxjRv
	 JFIrjMbkNFmjJk9pm6atz42lj+kK2da4V2fJQMGPf1O6u2LhQ8vBVdLT2WFyd0nvcG
	 h/ZEKNFlYqaZxzJQr6wJiE57x6s63die96wD/04R6nGkik921gExhH8XHxl7mdrQK6
	 CIbkTaeDi3YBdzZCBb/y90r0KW+X63eDjPXO93Ee5keCOasoeQsfFBcM/vrr/80bHn
	 e77S5uLxAG24A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uRRw0-000000003mp-0YYK;
	Tue, 17 Jun 2025 10:44:48 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 2/4] wifi: ath12k: use plain access for descriptor length
Date: Tue, 17 Jun 2025 10:44:00 +0200
Message-ID: <20250617084402.14475-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617084402.14475-1-johan+linaro@kernel.org>
References: <20250617084402.14475-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_014452_322839_B5663E5E 
X-CRM114-Status: UNSURE (   9.21  )
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
index f8bd3837b9dc..726969cfcaec 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -1950,7 +1950,7 @@ u32 ath12k_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc
 {
 	u32 len;
 
-	len = le32_get_bits(READ_ONCE(desc->flags), HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
+	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 
 	return len;
-- 
2.49.0


