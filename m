Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D31C2BD09
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o4oE+M8pAsQAIv82liUyoMI38SoKZlDrdXu8W+OvHpU=; b=vbcbgGVwuJRRNq3K09WdmVCXHW
	QuwHt559oub9PeIqb76ykERwjZnkkS+Ol1f5Lo1N6TL642DUUimhA01UKuaOD0N7GxccptRvQBdOK
	FStA6CEjIpReAj9L4TmArly/gvX8jwzRvRHVwD/20GfMg0j0/1z1dva66qkTz0rZFMR6RO0uq5sIw
	reGdSSVTtSHiCsZ1GkrN85jCG0V2vrBk5hXKbDAhumL3pQLApL5ezXRr6yw67HJKPC+rMfQpmTL/V
	ijl5vKLU/aBU5KUX5ewk0JdFYqEfypNeCou8s8CPDcPvYNqbszaGlQsCc3ULlN0te+gt+qSBQ5xqd
	QG1ERhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR5KS-00000006Epc-30uW
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 07:32:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR5KQ-00000006Ep7-27N3
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 07:31:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09DDC60F3E;
	Tue,  9 Jul 2024 07:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0754C3277B;
	Tue,  9 Jul 2024 07:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720510316;
	bh=tOLVytebM6kjmTjWDA4Ja4R2xGEMQnffElBDnEJ7wsY=;
	h=From:To:Cc:Subject:Date:From;
	b=J4UzD6tEXnPoolrRlbkm+09zsThJvA73SHeBDe+68+28HiqnYomNrq+97ptCL3FTr
	 V5gcr5rvOLM9Xl5sEMjC1vORw82foCIPUtC7JNmV4Uq5PiUoGBTvR1DDSf/LFsh6Qt
	 MghhjV3ZqvNv7wcSnNiQq52/OK5P9qgLSvmobZJuhXT+O1OnWnSmMQ8KrtUOrLLc05
	 UzPlpj+Sru3ntWQ8ekhIzQ1lJy2j42rDe8XgJU+UMsIb6ZmAuoq/FW1DEfmBTvjW1u
	 GWazb6ftAzj245PW1rJ9xOenOXC9sNJdOSJLMMFrtUoTbPV/49pZ+kj2T+hvSDK3tm
	 02XtA7qDT5RmA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sR5KT-000000002OW-21T0;
	Tue, 09 Jul 2024 09:32:02 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix soft lockup on suspend
Date: Tue,  9 Jul 2024 09:31:32 +0200
Message-ID: <20240709073132.9168-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_003158_630106_6E1748B9 
X-CRM114-Status: GOOD (  13.13  )
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

The ext interrupts are enabled when the firmware has been started, but
this may never happen, for example, if the board configuration file is
missing.

When the system is later suspended, the driver unconditionally tries to
disable interrupts, which results in an irq disable imbalance and causes
the driver to spin indefinitely in napi_synchronize().

Make sure that the interrupts have been enabled before attempting to
disable them.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org	# 6.3
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 16af046c33d9..55fde0d33183 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -472,7 +472,8 @@ static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 {
 	int i;
 
-	clear_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
+	if (!test_and_clear_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags))
+		return;
 
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
-- 
2.44.1


