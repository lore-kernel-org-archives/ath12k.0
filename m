Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB07C83F35
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 12:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWBqfJLA9m3RhGK5fp2dZabaat4g4uZ3OheHTQBuvOI=; b=F6QnKlC77F3rvtW3sBH8x0dVM1
	MuwAkaXx7ygxCG23RBxcFxLfGUwvj8bSfOWQsz2KNOnQs3w/iGuEUF7cIp0LZ6g3z0OFllTYfxbZf
	wlCZHCPGrnE0FTkZjuCJIjChFIo5pZcK8gbQaJClyDGCs8WgLpMr2uaNVOpwOLTTfVLcDJbbnnFjH
	FJfr53yZBnGAQ4bVR5EOHto8Tw2IIUHl9Ju/Dwc2uCQAMNMRKcGVlRaOf0ppH1bUxTmhMCSP8MFuo
	0oPTdySHSuj1abtsoVHE2fD5CSj8ZFRuBROAmqLjU49AZQpRaXKX0HTBB51gr8pGuFMHzvxKaNpRK
	+N9gKDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1iN-00000007j4n-2XiJ;
	Wed, 16 Jul 2025 12:58:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1gP-00000007ihU-44qO;
	Wed, 16 Jul 2025 12:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C2FE614AA;
	Wed, 16 Jul 2025 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5B09C4CEF6;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670584;
	bh=U4+/0Kn/irzrlmqtgZxjxMU14G54Aznp8RGU4IoJb5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V2PClDU2jQbChUUrLMEO13Ovau/25TPy5Qs9+Uu24QtGnbF1CfygyYdQ8C/zkQ8zZ
	 42Tmr5MwhKGU6IonKo5wWFIVxzpj1a0d0RS0vd1P/1XB6Pjhfc3wT7kq19PaCaYdxz
	 GrmoyU7aXJqg7RLgX7QXVXIXTqXW89QRZr6UPZ3huq987SrV6umuyn7/4rb7OqW4sO
	 egPGuoMp4lVUGbMCogYVxP6r5vNPg9DvCf4xrtLUrqpffSX3CQUsUutPd8aY5MpyZo
	 LpTNGpYIQuzXCUxKdWQ9IbXm2xRIUeSPFUADypCZA5PQD2CDo6PfKH2jODRs461jog
	 ZQS7kyA7r5UKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47C8C83F34;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 16 Jul 2025 18:26:21 +0530
Subject: [PATCH 2/6] PCI/ASPM: Transition the device to D0 (if required)
 inside pci_enable_link_state_locked() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-ath-aspm-fix-v1-2-dd3e62c1b692@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hi5J0pIF+iWnkMGXfocryMcFDAOXrwL22J4M8mGbdSU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBod6F2CULXLp8rTJpaJVU7H5c1oqS0BGUk5g7I+
 9t4OEB1veSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHehdgAKCRBVnxHm/pHO
 9fArB/9FulOSF4tSr+TT1URdaKWzJq1L7LhC7QODyaVsCQBKBBC1uFuFWVGCpMmJpWKVcC1QV7e
 E3MHNYuim9To+6GoJLEp1Xa5gftbc7lcqYJ3SFfDMAM4UsRu4eaegzWr6t3IayzMolyP3mn9woe
 UPzil9ZKDZZHbRZP/XDlj8B22yKN4Qvhldr0cpiziVqDqnb4Yjs6UzN/Oddr+66zOWQLhnmLb01
 RTniSwmV1Cz4hql1VvETn4DVr1SI+QdHJfPEF3rWQXp34o6LpRm5LfRrKrei+ARJHZW2ZqwmFZm
 tqJib9vtul6W0+aSZ8Nu0DRIpe2lx1NHo3FmLmdbe1oGkHuA
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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

Both of the current callers of the pci_enable_link_state_locked() API
transition the device to D0 before calling. This aligns with the PCIe spec
r6.0, sec 5.5.4:

"If setting either or both of the enable bits for PCI-PM L1 PM Substates,
both ports must be configured as described in this section while in D0."

But it looks redundant to let the callers transition the device to D0. So
move the logic inside the API and perform D0 transition only if the PCI-PM
L1 Substates are getting enabled.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c |  5 -----
 drivers/pci/controller/vmd.c           |  5 -----
 drivers/pci/pcie/aspm.c                | 22 ++++++++++++++++++----
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c789e3f856550bcfa1ce09962ba9c086d117de05..204f87607c0bc1ce31299aa5a5763b564ddeda29 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1018,11 +1018,6 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 
 static int qcom_pcie_enable_aspm(struct pci_dev *pdev, void *userdata)
 {
-	/*
-	 * Downstream devices need to be in D0 state before enabling PCI PM
-	 * substates.
-	 */
-	pci_set_power_state_locked(pdev, PCI_D0);
 	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
 
 	return 0;
diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index 8df064b62a2ff3e22dd8507a66783ca6c6a8b777..cf11036dd20cbae5d403739b226452ce17c4cb7f 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -765,11 +765,6 @@ static int vmd_pm_enable_quirk(struct pci_dev *pdev, void *userdata)
 	pci_info(pdev, "VMD: Default LTR value set by driver\n");
 
 out_state_change:
-	/*
-	 * Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
-	 * PCIe r6.0, sec 5.5.4.
-	 */
-	pci_set_power_state_locked(pdev, PCI_D0);
 	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
 	return 0;
 }
diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index ec63880057942cef9ffbf3f67dcd87ee3d2df17d..c56553de953c158cf9e8bf54c6b358a9a81a2691 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1474,13 +1474,20 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
  * Note that if the BIOS didn't grant ASPM control to the OS, this does
  * nothing because we can't touch the LNKCTL register.
  *
- * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
- * PCIe r6.0, sec 5.5.4.
+ * Note: The device will be transitioned to D0 state if the PCI-PM L1 Substates
+ * are getting enabled.
  *
  * Return: 0 on success, a negative errno otherwise.
  */
 int pci_enable_link_state(struct pci_dev *pdev, int state)
 {
+	/*
+	 * Ensure the device is in D0 before enabling PCI-PM L1 PM Substates, per
+	 * PCIe r6.0, sec 5.5.4.
+	 */
+	if (FIELD_GET(PCIE_LINK_STATE_L1_SS_PCIPM, state))
+		pci_set_power_state(pdev, PCI_D0);
+
 	return __pci_enable_link_state(pdev, state, false);
 }
 EXPORT_SYMBOL(pci_enable_link_state);
@@ -1494,8 +1501,8 @@ EXPORT_SYMBOL(pci_enable_link_state);
  * Note that if the BIOS didn't grant ASPM control to the OS, this does
  * nothing because we can't touch the LNKCTL register.
  *
- * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
- * PCIe r6.0, sec 5.5.4.
+ * Note: The device will be transitioned to D0 state if the PCI-PM L1 Substates
+ * are getting enabled.
  *
  * Context: Caller holds pci_bus_sem read lock.
  *
@@ -1505,6 +1512,13 @@ int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
 {
 	lockdep_assert_held_read(&pci_bus_sem);
 
+	/*
+	 * Ensure the device is in D0 before enabling PCI-PM L1 PM Substates, per
+	 * PCIe r6.0, sec 5.5.4.
+	 */
+	if (FIELD_GET(PCIE_LINK_STATE_L1_SS_PCIPM, state))
+		pci_set_power_state(pdev, PCI_D0);
+
 	return __pci_enable_link_state(pdev, state, true);
 }
 EXPORT_SYMBOL(pci_enable_link_state_locked);

-- 
2.45.2



