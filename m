Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D62C83F1B
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VgfqKSpH1mkF8AhdPSQTTgH3Mhqt/FWkPtdTVpU+to=; b=1r1ZDK5iOM5LB6oFomQiGSkVCS
	cOpJ137iDqNcAmZA1+FkBqCw9vtivHYvGr5D9XY6LPNJHobRO+Be/USLy7Zmd0ri0wQhGdufb4kqs
	LaCot4suREmYBCU6vc1VZb/WdF6oh35qJ+rxIKRPQfUQptajF1ImWXyAtykxWWLiKI6G+N0Wr6Cpa
	wiUQzY/aH6DRrgEIXZFDHjoIovx5Yfq5WpZTElNQyBdbEjuVAqwbpS9NI/0dp+IuS04DhQ1ZJypSh
	9iBzjdh7MLBvDCAqP/Ub2/e4WDG7C0vZTqq0ChE5IkSR84jEtqsIIAj+rH5CgYBMVwpq3uEBLIOdu
	DfI1Z1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1iY-00000007jOM-3474;
	Wed, 16 Jul 2025 12:58:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1gP-00000007ihW-3pDh;
	Wed, 16 Jul 2025 12:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A59646C23;
	Wed, 16 Jul 2025 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB6A9C116B1;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670585;
	bh=N7blyqfQuKX3ng2cz062bliqBtPysSE2ISnQjV9aR9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IITQe2BAL2dS1TnBFMJM6SZDIBfJHfyZCSXbLAD86InIqnrYN5urpZHbI8dS0Mjae
	 G3JFESY/3ep/kaQvE+BZrv8YLgTcKhin3zXT9C0xR8p1s2gqc6DQJYG7kPeq2rwloP
	 VaEf24sKxypHJ9Js5pFw0BNSrLHMgv81plA5wV/dYuPxvx7M4O/w6M+0CDqJPvlMu9
	 555QxOCbU/xMVayngrDdJs1+cGYmQXoYqHYLQpF7mRlxB8fX0YCwhlO9Zz9Bg9MkaU
	 ASipx0soW7lzwJYwhsK+gtnLaFcQ6RYPze0LWAH6CV6s4rXjKb/HHaeFm0jPtdzTdd
	 40vDKQfAGhYhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EE1C83F34;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 16 Jul 2025 18:26:24 +0530
Subject: [PATCH 5/6] wifi: ath11k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-ath-aspm-fix-v1-5-dd3e62c1b692@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
In-Reply-To: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
 ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, 
 ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=kXpW2mQuCN8+CNqdT+kLur7VSEl5MgZkBtsfbPtL7RY=;
 b=owEBbAGT/pANAwAKAVWfEeb+kc71AcsmYgBod6F22QPsndaD+8odr4XoI0/ocyp1ircoReHgt
 YGA0cbP6aCJATIEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHehdgAKCRBVnxHm/pHO
 9Sb9B/i3iAtipHaPFAxLp2zZTxGLgKyKliJu5K7gSsTqxmv7SltOMJyZmnTaGZYLk6v3zQnRcg6
 sw2o2uIH9fSmM8+4XO79TkWTmnh6trf1HQAgJs02XVm8x90kChSY3mH+1mglMtfm1Z5wZsMFXMD
 6d2HdNNBDBi7DvWJnPlv3kjjhOQa6eBwGh9J0tCBghOy2ZOsg27sEwItnHNfsCEpPNpi4zMluiq
 3zhfrwOB3g3t8SfYyX+0Zs1X2Rv2MVfl8EahkwZra0x7yV32Ina7XpSomJ1UGz46Atp4b61+BFT
 FRYW9/TtiB1XC9iicOaEtvo4z7d87s1a+ypf/M1h6fxvkfE=
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_055626_080691_02AC82D3 
X-CRM114-Status: GOOD (  10.05  )
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

It is not recommended to enable/disable the ASPM states on the back of the
PCI core directly using the LNKCTL register. It will break the PCI core's
knowledge about the device ASPM states. So use the APIs exposed by the PCI
core to enable/disable ASPM states.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 78444f8ea15356f1f4c90a496efd52780499bfb2..cec399765e04104ddcfcee5003c209e14c7d4ca0 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -19,6 +19,8 @@
 #include "pcic.h"
 #include "qmi.h"
 
+#include "../ath.h"
+
 #define ATH11K_PCI_BAR_NUM		0
 #define ATH11K_PCI_DMA_MASK		36
 #define ATH11K_PCI_COHERENT_DMA_MASK	32
@@ -597,8 +599,7 @@ static void ath11k_pci_aspm_disable(struct ath11k_pci *ab_pci)
 		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
 
 	/* disable L0s and L1 */
-	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
+	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	set_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags);
 }
@@ -606,10 +607,7 @@ static void ath11k_pci_aspm_disable(struct ath11k_pci *ab_pci)
 static void ath11k_pci_aspm_restore(struct ath11k_pci *ab_pci)
 {
 	if (test_and_clear_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags))
-		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-						   PCI_EXP_LNKCTL_ASPMC,
-						   ab_pci->link_ctl &
-						   PCI_EXP_LNKCTL_ASPMC);
+		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
 }
 
 #ifdef CONFIG_DEV_COREDUMP

-- 
2.45.2



