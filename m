Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F4CCA0FF0
	for <ath12k@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/718QguiAnExEOa3uQoLgpOV84l4SN1qF2AVrHPhQtg=; b=y6/hcc5qLvMkGuHswYGqzaF5mV
	G2/YUXIkTI43At+sQrJyqQLC4loGEO5bAVKuwg4g1t0KCcbAq7xrmUZy1mLMkMcEsl+ppkcq/xVFa
	tPcUkcm1AjItbyjQqUWEnKYQ+YEu0wyWLhNgTjdFNrgcEoMjtXWZFksFRMQqyHfVAhlbbA627G1IL
	Z5ywKVidIcW2XdIWfwVhWv5viA8SZ9wCE/efdquQDp4S76G/CgusrhGigtgBeiDOwlczAdh+eYhCP
	CT6qvqB4rsWiOwMpO6SBTngmRoW2YxLQd5lHWD/4fmEOUS236S+6TPWyyeD6/vrvzBtEsuwRba2ro
	5km8S1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYf-00000009BZv-0FD1;
	Mon, 25 Aug 2025 19:08:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbFT-00000008rJk-2VlT;
	Mon, 25 Aug 2025 17:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C930544E89;
	Mon, 25 Aug 2025 17:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4151AC19421;
	Mon, 25 Aug 2025 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756143890;
	bh=XIKXkwSdpDFgryuO8AscrjzoCScXTyqY2YV5IZIW2eE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qU3VIkwi9ipzyXAef3IHjOfSkA6fgbg36bhmnZ6ctYJqEONhyVMlhjRj1OLRCXmCl
	 We2AO005UwaSCw0ORnwxjnbO8eC5sKEb/l/jW0cDm6fbEz63phFgsNGsAOE78nVNFS
	 vLOGt8CWmYmxw1yqX5deRc4MORmZsVwRKk8Z8Ur33ptY2rsnhswCd2hYkhcaWXGmNA
	 Tec/KlStxskkAA94AYXo0hgSjDeX+zBclWxT2JqqxfvfyQIXB73wlZgcDwdEnLYr8y
	 N+0z7XVD1Nn1dqtESANyeE7fbm0TNwZUXleBhnkoktx5zpp11Hk5uV0SBTrNYx9hKs
	 WTbBRmbqidnGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F01CA0FED;
	Mon, 25 Aug 2025 17:44:50 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 25 Aug 2025 23:14:38 +0530
Subject: [PATCH v2 3/8] PCI/ASPM: Transition the device to D0 (if required)
 inside pci_enable_link_state_locked() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-ath-aspm-fix-v2-3-61b2f2db7d89@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qjbd70IC+ShOK3ZDf4DRoBiUH5NS5aHCnprLq7DQ7iM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBorKEPLbdqO2EWRQxfmgtisJzzWpgiy2ZIIPyDr
 wXo38kcIkeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaKyhDwAKCRBVnxHm/pHO
 9Y3zB/9zEs5uWjC3Xrp3WhZFy5crlFwe49xFUi+A+EJpbRJDiMhgTxouJpKvRY/cZvY8DxcuyWq
 Q6VKk/Q1UWHC054LHzynKwqasTaviVYQgMqMwjJ4C06i9hMSyr/L2Hywarv9Nni8mhUD372eY4O
 Ry0svyzfWZJplUYBwqnbbhvSYfeX3oN++0ibNInhZ9fFX4dLGMvQUfAj1+EoX7Zk11ND+Z44c7q
 /34v40Br95YeTKp/FOIwVK8dayq7uZiqEKwRc3AcrXGobv4humuJVCA8HaXe79RalBT9kairD6/
 KQbjIRML/SnxYy9jMFN3tTtwmRh5tpXkjm+u8YXE6E7wjWXP
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_104451_708171_609CF3F7 
X-CRM114-Status: GOOD (  12.93  )
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
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..af705d71f72b2b7c3004cbb69cbd779c637bb22b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1042,11 +1042,6 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 
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
index b679c7f28f51c13468b60f1e6481a26d5967d4eb..85cfd8cbc6f7ed2730f4f8e5357d9b90d8906ad3 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -768,11 +768,6 @@ static int vmd_pm_enable_quirk(struct pci_dev *pdev, void *userdata)
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
index fac46113a90c7fac6c97125e6a7e385045780005..1243715bc054f859af175143a7ffaef0971f097a 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1480,13 +1480,20 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
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
@@ -1500,8 +1507,8 @@ EXPORT_SYMBOL(pci_enable_link_state);
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
@@ -1511,6 +1518,13 @@ int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
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



