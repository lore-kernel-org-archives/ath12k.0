Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B30C44501
	for <ath12k@archiver.kernel.org>; Wed,  8 Jul 2026 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSc3qslxGcyHNYgPDLuFbwdZcLvUqK4arxv4rSk0axo=; b=PohdAfqYq8XhNpt3mcj8yduG7g
	4KKbWL0V3jg3pndIXFT7EMZbmkaNFhHxCw7cjsQiqzkh9gIj3GJogWYKvDNy1X5264XDWsmbqAH+s
	CCC09eDXpVSSgUWqyaxaD1dGMiwdfAK6SXOaDclBW+lpCMyKVe686cSXMoGERAod5WIeqsDjERNbY
	mo+mHLLO90lYAIysCVxxqReTTNbSUTj7zPv0ba8ATcAMss1OEBmHyoHcXoHJW67m5ZIexkNyAcn7H
	lACRrXzr/BYgTcsyfklRXvlmy1LXbyk6zueU9ZgBCq4Y+obBnI4QRk5/wHKscbqORj6FuzTbHN1cf
	u+IvbGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTIB-0000000HKET-2aRQ;
	Wed, 08 Jul 2026 14:30:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTI6-0000000HK3I-0Z09;
	Wed, 08 Jul 2026 14:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D39A43F74;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5787AC2BCB9;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783521021;
	bh=TqQr0msAx4grAoY90aiW5jbpDptHFeE3x0YSBfqdt/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gOQSqBShMKYl+w/39ebTEvy4rTe6DqFOob3FkYnC2lckYh1L5sT9EgpU62xsrmyg5
	 pAlkNW3qf5VVz8qUmyAWWnBFAoyex6tpT314lz7/j5AczKNt2uD/UPhn+NWekd+Gh5
	 cnSlKXI4kdBw1/9uuAnwyTTBPKXfxLAqBT+6YDxTxRH3HWQ3ucvc0pFmNuvWTI9wr4
	 C6zgwJlFu8oQ6eg56iqsrncZ8P3qLDK+UfCpa7l9ejkAT/25A6s2gfyjAWWHULl6dm
	 0JHg3c1vpDabNJH4L2ot8Zlaghz9fdUGrA5h/OdB9CesauphBr/VtgntDcBurEIiI0
	 /xzflhOj2F5/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42460C44503;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Wed, 08 Jul 2026 16:30:20 +0200
Subject: [PATCH v3 6/8] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-pci-aspm-fix-v3-6-6bd72451746e@kernel.org>
References: <20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org>
In-Reply-To: <20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
 ath10k@lists.infradead.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>, mani@kernel.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280; i=mani@kernel.org;
 h=from:subject:message-id;
 bh=fI4OgbaPQvxdUdvQa5firVs9z5T3bQjOqFuWB+LMbBg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqTl75VwhT+5dcnzfCyLucqXIxYRsokyBQxiGRy
 E53judLsUqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCak5e+QAKCRBVnxHm/pHO
 9cxgCACCZmQ4ZHcdD5iDF15DWrWzCvR8nBREuRoCrrlIwmWq63iwTxavA29WGJJWKfFBrJXcdil
 1aOMoiu/Al2R5zSjVFvRUhLFG7tt97Xx4J+pSKbos+8HKVuaJE0O3gYNoHBFHXp6X5JKkVSRdwZ
 9w8fESRhXhywBZzS3BN6iKtLxEySaXPVe09b15fmBSix7LVRjHRG5eZn0KU/hLltqijgpcZHW9K
 4tWc0FL090YuNf52Xc9J2U6WgO7nMMQ857NpXzMtiNR0LeFuDlgJt871REsetU/10At4cPcnd2Z
 7pCSogU1ACJWcmikj6ZX1r2a6k9QHDBdyoQKLXGH2srrDMsB
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for mani@kernel.org/default with
 auth_id=787
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

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

It is not recommended to enable/disable the ASPM states on the back of the
PCI core directly using the LNKCTL register. It will break the PCI core's
knowledge about the device ASPM states. So use the APIs exposed by the PCI
core to enable/disable ASPM states.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Reported-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
 drivers/net/wireless/ath/ath12k/pci.c   | 19 +++----------------
 drivers/net/wireless/ath/ath12k/pci.h   |  4 +++-
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 4a2b240f967a..7852ede3eaea 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 config ATH12K
 	tristate "Qualcomm Wi-Fi 7 support (ath12k)"
-	depends on MAC80211 && HAS_DMA && PCI
+	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM
 	select QCOM_QMI_HELPERS
 	select MHI_BUS
 	select QRTR
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index d9a22d6afbb0..6d48fb25690d 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -884,19 +884,9 @@ static void ath12k_pci_free_region(struct ath12k_pci *ab_pci)
 
 static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
 {
-	struct ath12k_base *ab = ab_pci->ab;
-
-	pcie_capability_read_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-				  &ab_pci->link_ctl);
-
-	ath12k_dbg(ab, ATH12K_DBG_PCI, "pci link_ctl 0x%04x L0s %d L1 %d\n",
-		   ab_pci->link_ctl,
-		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L0S),
-		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
+	ab_pci->aspm_states = pcie_aspm_enabled(ab_pci->pdev);
 
-	/* disable L0s and L1 */
-	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
+	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_ASPM_ALL);
 
 	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
 }
@@ -925,10 +915,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
 {
 	if (ab_pci->ab->hw_params->supports_aspm &&
 	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
-		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-						   PCI_EXP_LNKCTL_ASPMC,
-						   ab_pci->link_ctl &
-						   PCI_EXP_LNKCTL_ASPMC);
+		pci_force_enable_link_state(ab_pci->pdev, ab_pci->aspm_states);
 }
 
 static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 0e0e2020c6ae..409ef063cd69 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -128,7 +128,9 @@ struct ath12k_pci {
 
 	/* enum ath12k_pci_flags */
 	unsigned long flags;
-	u16 link_ctl;
+
+	/* Cached PCIe ASPM states */
+	u32 aspm_states;
 	unsigned long irq_flags;
 	const struct ath12k_pci_ops *pci_ops;
 	u32 qmi_instance;

-- 
2.43.0



