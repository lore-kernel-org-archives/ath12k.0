Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C30C83F1B
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7lZWKPS+t5TB2Wi0vfn+OURbk/I8CFK5D8Ex7SSyWg=; b=KBjLfBPI3eQF2YkY7p8eIbGBMs
	xaYtU0xNzaiiylZ40+gF8jVdpmn6U2koL+oNCvfZ8zZoBazQZVR7LljKTymK5emGjRLuBLSAoz9Yq
	iWfqoN5fuRjmz7IoAVBQc6uFvukslatZilpu97CS8+EmgsUsIDBaLMbbrqFBZfB0gYRyZqGyMXQnf
	ZwYEDoVyyyidZPI8OtYeqMSXAxb1T6MlWfBAKtD1VNKHic4Ifpk8VWFxf1fCa2WLYm8x+B89oDh8P
	wj1iWZhazHYDcfpS1MbGlsLs3OIOs/ABLFnl7rmdNukGOa1FzBBs3uuu+j6ptYl7FXet9vWdZk2JR
	PjG+z3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1iU-00000007jH5-3Pgx;
	Wed, 16 Jul 2025 12:58:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1gP-00000007ihX-3oxN;
	Wed, 16 Jul 2025 12:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66C0D46C2F;
	Wed, 16 Jul 2025 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08C0CC19421;
	Wed, 16 Jul 2025 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670585;
	bh=d5ezahiJEgmQKnKdHKwl1RCHamaJ0esu7vRT109SEbQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zjwn+piGRW4ptJ/z0z/uECdIuQMEStd2Q07dBMlSQJ3syeuKkk9W1IysDQ/1idTk2
	 pFcHTVlwQYQZqe9s1pj1axXyV2JP97Z1EhuEjol2fdSniYLHSf0u/SSYcMlOt5Saed
	 n0DYy4c8/qPHEw3eUlDF3qzUMYs9dvaDVGec6vtO/ZGk0AktP3oZTUIx42nMtvJ/XM
	 T7SSbSL6HzDVGF53Ni9x2NILo5T0w1LRoyPaAX9el7x3uEvrWh1S28tl3SG0PYUUUv
	 Q3ibcCFPXXQnjxZ/ak+N2438aCO6wUrwqg4eKFha89W/tBOzEaj5r4S7Xp6jVAGDPH
	 2nYUVc1/IOK+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AB0C83F22;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 16 Jul 2025 18:26:25 +0530
Subject: [PATCH 6/6] wifi: ath10k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-ath-aspm-fix-v1-6-dd3e62c1b692@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fx4ej/EicH41+mIOpWKF1WcnMWq9PYq0rbjy+/KSq0Q=;
 b=kA0DAAoBVZ8R5v6RzvUByyZiAGh3oXbIxqk80Tgh+RxdditU6/SfcGzUbtEKyagt0528i4qmg
 okBMwQAAQoAHRYhBGelQyqBSMvYpFgnl1WfEeb+kc71BQJod6F2AAoJEFWfEeb+kc71+zwH/j9g
 77XQ+TyQtXbct+iV57W9c8g3ZQmgOtKIHRMLu+mcrcqHfSxz/V/4OcFnyjatqAbs33eteSiCZ55
 LoVeVbo3qOjovyINbJXFwgSGgb7MrPELoEBPbwyZvr7H6mp2v1GP3XUzZsi6NwIHjh1J7BQUqHV
 aDnAaoWlbmAChlKp0tbmRkWVN2LpMwTe6EfcYqrCmz7nBm1x0QLTpGPJkNYzV/HgleNa8aMEQFV
 eQP3tLVUolrRr8ZS4IJHlOEVQus5Ub4hqfKpnW3BFAvywjtvLCovpSp6Diwn0zkfZ0WLLS5Xk0R
 6jeK1WBsuL8Emy0OHC085U9qIOq5psdkZ9ca4Pc=
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_055626_030004_295F4C61 
X-CRM114-Status: UNSURE (   9.33  )
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
 drivers/net/wireless/ath/ath10k/pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1e6d43285138ece619b9d7dc49f113a439e2085d..b20ab535a850ef1f5fe606bd7e7a230ebcd894c8 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1965,9 +1965,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 	ath10k_pci_irq_enable(ar);
 	ath10k_pci_rx_post(ar);
 
-	pcie_capability_clear_and_set_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC,
-					   ar_pci->link_ctl & PCI_EXP_LNKCTL_ASPMC);
+	pci_enable_link_state(ar_pci->pdev, ath_pci_aspm_state(ar_pci->link_ctl));
 
 	return 0;
 }
@@ -2824,8 +2822,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar,
 
 	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
 				  &ar_pci->link_ctl);
-	pcie_capability_clear_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
+	pci_disable_link_state(ar_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	/*
 	 * Bring the target up cleanly.

-- 
2.45.2



