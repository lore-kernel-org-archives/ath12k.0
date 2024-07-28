Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CEFC3DA61
	for <ath12k@archiver.kernel.org>; Sun, 28 Jul 2024 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRG9Jf9NCD5c6XFyIbYd/4/Q3r/eWKD0xjeFCXSITyU=; b=W9xpfasQXFCWtlZcgTrFUuCrMn
	87ZsK8kXwic5BPraf3jzTLd1711vFW/p2nNkAAOdic87frYx8UEkVCPcgm2/F8FBlJyRPapFLppEz
	eTAQQkhcLAUq2jkJWIcJLANu+WzEy42rgwaPOZGxqdBkAy8AJhHgS+3zdSfQfcz1SQ1ZimqrdNhFw
	ckguxiGs75vrOiMWCDbSx/ZXLyEHDfkA9ORPRVvm/du9Beq0KiJnqVYNF5rGmS6CdBeRPhMAC7yPr
	/bS8mI095KhMKqChcTshFrHSNdUWF5fPxyrHj9CHLrzRK6eZa+S0wNd3hOkmtU++K+kpC6DFrA7Pf
	Biduk9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXsAM-00000007aap-3B0F
	for ath12k@archiver.kernel.org;
	Sun, 28 Jul 2024 00:53:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXsAJ-00000007aZn-4Ago
	for ath12k@lists.infradead.org;
	Sun, 28 Jul 2024 00:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D54DA6121F;
	Sun, 28 Jul 2024 00:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3341CC4AF0B;
	Sun, 28 Jul 2024 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722128014;
	bh=N8fZ0Qatlz+54nOb3qZAMay+Eh4I1PbadnR0ZEvnSW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcfBQVqmqawEZPvH025A9tjyb+iLiRZYvyma438EWhsmvO8JGhWhQJop7v/2duQ5Q
	 iIP+8dhZaJ/6KxUvDB2G5OoMdhQjvIqMFuR1hqSbKBepJPCViwnRx76joJpCpR1MtS
	 UvJW4VmTOJ/XY7HfBIHjk6175EkvVlBQULZWcVIjyGCCJj+nsK3NSq7vrBtLh0OUIt
	 mbxx9kgI/ONwzLB3ckLfaHrdgxj88ZiFKGn7zjsY8OVny50AsB60b3LSpPKEyCurCy
	 HnElfk4FYLA5Pihn4sAU/k2E2f9s4JdDakRz/N4M/OQBpjcMxZJcnH1jCywpcE3jDe
	 v31RYL0DIoQdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 02/27] wifi: ath12k: fix race due to setting ATH12K_FLAG_EXT_IRQ_ENABLED too early
Date: Sat, 27 Jul 2024 20:52:45 -0400
Message-ID: <20240728005329.1723272-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728005329.1723272-1-sashal@kernel.org>
References: <20240728005329.1723272-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_175336_300678_B55CC0F4 
X-CRM114-Status: GOOD (  14.15  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit 0a993772e0f0934d730c0d451622c80e03a40ab1 ]

Commit 5082b3e3027e ("wifi: ath11k: fix race due to setting
ATH11K_FLAG_EXT_IRQ_ENABLED too early") fixes a race in ath11k
driver. Since ath12k shares the same logic as ath11k, currently
the race also exists in ath12k: in ath12k_pci_ext_irq_enable(),
ATH12K_FLAG_EXT_IRQ_ENABLED is set before NAPI is enabled.
In cases where only one MSI vector is allocated, this results
in a race condition: after ATH12K_FLAG_EXT_IRQ_ENABLED is set
but before NAPI enabled, CE interrupt breaks in. Since IRQ is
shared by CE and data path, ath12k_pci_ext_interrupt_handler()
is also called where we call disable_irq_nosync() to disable
IRQ. Then napi_schedule() is called but it does nothing because
NAPI is not enabled at that time, meaning that
ath12k_pci_ext_grp_napi_poll() will never run, so we have
no chance to call enable_irq() to enable IRQ back. Since IRQ
is shared, all interrupts are disabled and we would finally
get no response from target.

So port ath11k fix here, this is done by setting
ATH12K_FLAG_EXT_IRQ_ENABLED after all NAPI and IRQ work are
done. With the fix, we are sure that by the time
ATH12K_FLAG_EXT_IRQ_ENABLED is set, NAPI is enabled.

Note that the fix above also introduce some side effects:
if ath12k_pci_ext_interrupt_handler() breaks in after NAPI
enabled but before ATH12K_FLAG_EXT_IRQ_ENABLED set, nothing
will be done by the handler this time, the work will be
postponed till the next time the IRQ fires.

This is found during code review.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240524023642.37030-1-quic_bqiang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 16af046c33d9e..b08e64a5c8932 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1090,14 +1090,14 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 {
 	int i;
 
-	set_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
-
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		napi_enable(&irq_grp->napi);
 		ath12k_pci_ext_grp_enable(irq_grp);
 	}
+
+	set_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
 }
 
 void ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
-- 
2.43.0


