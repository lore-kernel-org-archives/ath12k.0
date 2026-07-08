Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C6EC4450F
	for <ath12k@archiver.kernel.org>; Wed,  8 Jul 2026 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRMBqlhE603mftqZUzmL/YwYvARZizsMI+w9c4KEcCE=; b=01s/b7Qo3XqRErZkK91m3omRRu
	RxIjlOOzJ29P/Jf4ZQPg0Rf1O26joPBnzreDuHjM26d9G6lT1Soc7hbKcSOXgJmzboyTudncWUXET
	NQp4N2gBFTCx5yQG9DkCqfY/W+0IL0+z31QJyReG4tVH6ZMxtrJh/KbyaXjuXn4cvwfqHhXxvbpbM
	cMYhd6ZfhIc6I0rbKeJmvHrecHWYTVUTgSOyh7uQgW16rWWNKn4DInmO4Hk9+dDwPmI4ObQ+na9LU
	/HSbub2qSFQEuY2YGeyjf2WZINvTeqEOX0lR6ihPWEovV70ZfMEuXqRVzDQw7AQSIONNjn1e5jeLT
	v0m1Bp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTIB-0000000HKEp-3NSI;
	Wed, 08 Jul 2026 14:30:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTI6-0000000HK3K-0Z6C;
	Wed, 08 Jul 2026 14:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9558C43E6C;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77425C2BCF5;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783521021;
	bh=FBm9gNuNzt9SJsQ0hC9UT2oUPY0iinHKBxh/yqQB+Zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MTZhMT+7duBMhXAvbpqWaXcnTAmXbG384xFmed2kGbvGk9oPbBaSs4HpsugdMpxNx
	 679ztub8wi742TQH8aH6yHI/gW93ChTb3xDyRuO8zCsxgoyjraKaeklI+BdNzx97DC
	 MgXq0fbDRCbUziTzx49vGCHf1hbJq+n9jF8QxnmY/59MhFDDcDmxo+9n9EZ63aG2lE
	 qfdK8BuRgRH/Td7/GYfgjJisAGOfkOdnJAQOfOv3QY4U0JzWvdx3TKXvH80MNrBkQq
	 k4OW9664oK7p2EsfFxUwEU1Vf3jJ8sgoDqEtp1V3QKeGhbxIaHwYuvn2JJ1EGGqk2R
	 fMYlINc9lwA7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6241FC43602;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Wed, 08 Jul 2026 16:30:22 +0200
Subject: [PATCH v3 8/8] wifi: ath10k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-pci-aspm-fix-v3-8-6bd72451746e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2824; i=mani@kernel.org;
 h=from:subject:message-id;
 bh=1V3SgamKnKbZCTaqKi1kk2ScK2GisZBgIvhrbdDfnK8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqTl76e2nfaUZvQNRIS2JAPpu0u23/DFhDhZ81P
 q/TDV/Dm+eJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCak5e+gAKCRBVnxHm/pHO
 9Tw7CAClHNhscV05//m5Z7wi7IlDfyYBab+jNO+wyaShe6hkjqEqWMyHT6/VoLxuobAHNoUOunm
 TTTFtKSglloBBVmGdDeo2vQusyiSbq2D3jecIfM2HWf01oPR/lDhMPM9iu6NP/dTnjPifoFqGfv
 XdHF3Vicrqbavf6w5sZsEAJ74QbBA9UUc3ncielCX8s36O+Ij0cvdEJRpRCTKLxR6WSarpbBz7F
 JbVIyPPBhRVHZswbvVTi48SJxq1IBYZAsIQIbxR6TyWtKgj5KKpdvTYVZq62bqgLmXbnHt1MRNd
 T9Nf2E44HV5nLkqcXnF+3mtJL2czXg7lcRLMpw+sZrEe41go
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

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/Kconfig |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c   | 11 ++++-------
 drivers/net/wireless/ath/ath10k/pci.h   |  5 ++---
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index efb9f022d8c6..eac3ec5a4e78 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -17,7 +17,7 @@ config ATH10K_CE
 
 config ATH10K_PCI
 	tristate "Atheros ath10k PCI support"
-	depends on ATH10K && PCI
+	depends on ATH10K && PCI && PCIEASPM
 	help
 	  This module adds support for PCIE bus
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..2e27a70065cc 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1965,9 +1965,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 	ath10k_pci_irq_enable(ar);
 	ath10k_pci_rx_post(ar);
 
-	pcie_capability_clear_and_set_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC,
-					   ar_pci->link_ctl & PCI_EXP_LNKCTL_ASPMC);
+	pci_force_enable_link_state(ar_pci->pdev, ar_pci->aspm_states);
 
 	return 0;
 }
@@ -2822,10 +2820,9 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar,
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif power up\n");
 
-	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-				  &ar_pci->link_ctl);
-	pcie_capability_clear_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
+	ar_pci->aspm_states = pcie_aspm_enabled(ar_pci->pdev);
+
+	pci_disable_link_state(ar_pci->pdev, PCIE_LINK_STATE_ASPM_ALL);
 
 	/*
 	 * Bring the target up cleanly.
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index d114778edb41..122e365b7cdd 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -128,10 +128,9 @@ struct ath10k_pci {
 	struct timer_list rx_post_retry;
 
 	/* Due to HW quirks it is recommended to disable ASPM during device
-	 * bootup. To do that the original PCI-E Link Control is stored before
-	 * device bootup is executed and re-programmed later.
+	 * bootup. To do that the ASPM states are saved and re-programmed later.
 	 */
-	u16 link_ctl;
+	u32 aspm_states;
 
 	/* Protects ps_awake and ps_wake_refcount */
 	spinlock_t ps_lock;

-- 
2.43.0



