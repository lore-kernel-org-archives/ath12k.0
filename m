Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3751BC8303F
	for <ath12k@archiver.kernel.org>; Mon, 25 Aug 2025 17:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLe+h2np14phRb3+noCfGdhiSsUGFyAxR3WZBI2munE=; b=crxvnU8ouqDGCpBuMwKJHpHfZ0
	B43TQZVonlAQ1pyxeZDGWpHGJn2Eq0SqNypwtq1rhJdiMntvq8bLUg/U1vCHX3H1SAUDfPQbqFZAf
	pgtAbBMZCUWtKT8DafXUxgYpqYZqbi1byonNONjUZlOxNF2qo3W43P5WXexawcPo1n7w5/AinldlN
	70WmshnJEnOOGsDp0PArpemEcAtYyFtkNQ4uFFRIy4DfkH3HPOuVPe7AdnolIXbMhmMFGGT1FtbVO
	ZK8nREU4JyvbXJ/M68JbuA88if6XCSP8cG6qOZhoTgAVv8NNmvYeImufzmRFCgsG2u0nUZCoWt5sq
	n/O/dlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbNi-00000008sXj-47dM;
	Mon, 25 Aug 2025 17:53:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbFo-00000008rOp-15Gy;
	Mon, 25 Aug 2025 17:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=WLe+h2np14phRb3+noCfGdhiSsUGFyAxR3WZBI2munE=; b=cHZM+0PMcunkNkmHvijvSMRUKk
	brfdU9EXvQPg8kCHolxyAG3VxYsE9nTcnpsU64Ii/Pd6LipnLKL0abMFlhYpUki+/VCbGI84Y1AJf
	sZjOwBCWIjTrzTXgbaaRl44sJx1qFUsP/s4NfZOKWz4f1IhyPSTYDKXnx4ULJn+CO9lVi4zIWGpjh
	Ejx54pMVv0D7fA6/6pc+TmL1MfeZ6ISkNQpKSKjsHZvgNv4q3JsTyC7gNipwvhg4HlFT3dACEdfhx
	Fv5MN1R4RQmfdNIVdIORte5IaREr90WRYtDVbzszk9NDzQ7Ab0smtlGjk9Py4olzkM8ri2XyFa78a
	2eMe6gEw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbFi-00000001yEm-2S2p;
	Mon, 25 Aug 2025 17:45:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12F1C44EA7;
	Mon, 25 Aug 2025 17:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D119C2BCB8;
	Mon, 25 Aug 2025 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756143890;
	bh=wR8n9PC4Wpobpkagw3KloQik+7kZ3Q16exFMhXd1Als=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GBcEzqOlJx243XSWJy++JUANDmKo6xXJZnOSU6qMOENYCQaBONFoPdt5a8csOQA9b
	 FauW5o+R2ZcIWpfjlLkn+s58iPLonKAmPczIezwYVSvmu9nB/NIbE9DzLv5xenklcj
	 F3MVZA0vIPll3SXdcjr37Jl40GMrcgo9+P+1nXv/g5k4OVIpVeHTX1dPh92G84R8r5
	 Y4N5vCsW8lwyIKuMowLSy6XNsRNPERHa51a66bFFVFMbUQTOmkmSnwI1AIev7LzUUe
	 qWWx3PXWbSj6gdoXSR/M6cBewaMT3eHJDqt0dueMtGa//0cCsuOw7CJ4KM9wGYR/Jw
	 KVcXNwrBZXR1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803FFCA0FE7;
	Mon, 25 Aug 2025 17:44:50 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 25 Aug 2025 23:14:43 +0530
Subject: [PATCH v2 8/8] wifi: ath10k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-ath-aspm-fix-v2-8-61b2f2db7d89@oss.qualcomm.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
In-Reply-To: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
 ath10k@lists.infradead.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2981;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=uyS1xPT5jai72N0zPRdwC7Qm7l2NSu7PXBp1orIlTxc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBorKEPRWN+gOX5AI/H8Qt+I/bU07xvKvOqN3b//
 wAwlMaWZYSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaKyhDwAKCRBVnxHm/pHO
 9ZvaB/0aBwu3PdJ2Emz8jlL9GAiOxXptrtjecGqLk6v30XEdaVaojuE7OgGSLZEJCUioo/Pr8Rr
 AhPxQZ8wVvR4Gs3aLlaHHK0yXOlR773NdbR4fjzmmMd2voUct61ZoOf1bMjUV1bfYmsJRAokE4y
 kLcYOFSsm6gkZgXU+LO+qBUM/F70H1K3cbIRW0jsFKFudESOATJ4xLyL+uTmiUHM4Z2qN/WNaD/
 8dX2TNfTic37YyIHb7q5c0IOzK16nEdKKuI49YQ89jMSGmyoO/6WVNpz6dQ9OniobDFv+qmc1EM
 lZK49YL/I5S1vBsg/SqO8l8h9ecsqMjPBCqr99TB9C5NnoB5
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_184507_207529_9CB16852 
X-CRM114-Status: GOOD (  14.64  )
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
 drivers/net/wireless/ath/ath10k/Kconfig |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c   | 11 ++++-------
 drivers/net/wireless/ath/ath10k/pci.h   |  5 ++---
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 876aed76583318724e4dab0b537d5c93c77460c6..02f9a78e252b124666edcc2395fda01d779803f1 100644
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
index 97b49bf4ad80916dd139acd5f5744922317191aa..c11266cf31370abf1218ba08ac344598aa655cff 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1966,9 +1966,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 	ath10k_pci_irq_enable(ar);
 	ath10k_pci_rx_post(ar);
 
-	pcie_capability_clear_and_set_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC,
-					   ar_pci->link_ctl & PCI_EXP_LNKCTL_ASPMC);
+	pci_enable_link_state(ar_pci->pdev, ar_pci->aspm_states);
 
 	return 0;
 }
@@ -2823,10 +2821,9 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar,
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif power up\n");
 
-	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-				  &ar_pci->link_ctl);
-	pcie_capability_clear_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
+	ar_pci->aspm_states = pcie_aspm_enabled(ar_pci->pdev);
+
+	pci_disable_link_state(ar_pci->pdev, PCIE_LINK_STATE_ALL);
 
 	/*
 	 * Bring the target up cleanly.
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 4c3f536f2ea1a95a78a0703d1f82d37d52f4b6d4..5f3e5739276f0bb1a14292bb596b4b5fa34e0acc 100644
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
2.45.2



