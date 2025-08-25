Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7946FCA0FF0
	for <ath12k@archiver.kernel.org>; Mon, 25 Aug 2025 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30dccVeAaD88WRXZ2IvKzNMq/kNxpIlWs/4zzERS9z0=; b=Kxwat73q6dhz+vDEuIwbX9Zktv
	AUl5FGEqW/JVKrDc16Yt6Lxpr2P3kRm5EqQCICiCItr93Sf22cHSktpQiqinOOTSPqEDAy8JT28ci
	ApUHVox54pqXJF41vRFuifctlWxwwuYjD5YsqxB8E1l6Zi2p6pU+O0lyu3iwhqnTkIvjqcZ49E9dm
	/jYh2jX0L58LKzazVkj/Gh/0l1vdWK5S6V7/yHYJTwIRWE7Gfv1xkQEPcws+PnLUzORW8/isononc
	Q3Y5tBfR0jF4ioRGIBtBFZFdGgto1litEa9OxfFe4lDJHnCibV376hRC+ZRdX/5J9aTu8jcQnLWyl
	PEZH8m8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdih-00000009YwF-0YMO;
	Mon, 25 Aug 2025 20:23:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbFT-00000008rJm-2WAa;
	Mon, 25 Aug 2025 17:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E487644E97;
	Mon, 25 Aug 2025 17:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65332C4AF1A;
	Mon, 25 Aug 2025 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756143890;
	bh=W2VzOd4LaPPqd03f5mZn4e//pyUDYNDJInaL1ivlSb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oWvuaw4fY34Fat0zJPLQ7kPHaaOYJgM4O8T3jfYUYUnWgXkCt+zUcyNKGLHfpQFvF
	 YG7iJRa9WRiOm+gC/vpjA0ViELfa9lWuTluGvQYfYB1g0K68p123JM1MFeBXBYmwJl
	 4cNpEoj0cG0s33COjUZYyctZDye1Q5MymUpE2D+sKkqMKUydBDDoia906G98jJ2aVk
	 RDfleTU7oQE30h0Yzyx6/htVdwrJQU+R+6ddbutX2+7fSa+nk2vc9Ef6Bh2F3yjU3R
	 xCgXZO+sgy/aBi5MDYA5K6o54uQSQuL4/Rg6jGM3If8WfhStHwU99+j5w2XAhvaS4f
	 gw0l+uOKDpXqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552F7CA0FE7;
	Mon, 25 Aug 2025 17:44:50 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 25 Aug 2025 23:14:40 +0530
Subject: [PATCH v2 5/8] PCI/ASPM: Return enabled ASPM states from
 pcie_aspm_enabled() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-ath-aspm-fix-v2-5-61b2f2db7d89@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2836;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=jMfN6qwvopwk5oh/k0Cf9IL8m25slb1JveeGwVNhrME=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBorKEPiwhWp+/PSd/iBSrmb3dl5Tv2stjEC5I9s
 hxFRCLyDCmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaKyhDwAKCRBVnxHm/pHO
 9U8+B/0c1VbCfjh2R58dS1EgS8LhCsvsrwAoexW6nBilgkDlYrlhBMoBaLI9cifrzAIzOEwcpwp
 NcFXH/cJcNB4HE8+VOkeAosGiDRPAmkzhw0lCs0Zlke9MbptGXuiPFDUt3GmgUZFkni+1PmQiZ6
 t6ufSeZOuHr+lb4VOpYPvZuElkBpX9XkBPc2DkTZqNa2qxW6FlpPDQju2PvMuVCv7T7pt2oMDuZ
 cZ90VmyDcXelHokd348TRdPfCo7jMmed/A1/r531KO5UTv8PLsuSq9Qvt5HkrI2hNPVe0r0BCKj
 ycJ81OSii5p8Cs+xcBp48q2Q8kYaaB30f/wEOr4w8XM10UxL
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_104451_714399_0374A87A 
X-CRM114-Status: GOOD (  14.07  )
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

pcie_aspm_enabled() returns 'pcie_link_state::aspm_enabled' parameter which
contains the enabled states. But the API currently returns the 'bool' type
which is used by the callers to decide if ASPM is enabled or not.

To allow the future callers to also make use of the enabled ASPM states,
return the actual type of 'pcie_link_state::aspm_enabled' parameter, 'u32'.

Existing callers can still treat the return value as a 'bool' as the C11
standard guarantees the behavior (this API relied on the same behavior
before as well).

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 6 ++++--
 include/linux/pci.h     | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 3c8101023e80d3c0550136f729782c0e0a3e28cf..fed44b7cb46e9f34c9ef6d5fa6a7b009976cbfdc 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1582,15 +1582,17 @@ module_param_call(policy, pcie_aspm_set_policy, pcie_aspm_get_policy,
 	NULL, 0644);
 
 /**
- * pcie_aspm_enabled - Check if PCIe ASPM has been enabled for a device.
+ * pcie_aspm_enabled - Get the enabled PCIe ASPM states for a device.
  * @pdev: Target device.
  *
  * Relies on the upstream bridge's link_state being valid.  The link_state
  * is deallocated only when the last child of the bridge (i.e., @pdev or a
  * sibling) is removed, and the caller should be holding a reference to
  * @pdev, so this should be safe.
+ *
+ * Return: Enabled PCIe ASPM states. 0 if ASPM is disabled.
  */
-bool pcie_aspm_enabled(struct pci_dev *pdev)
+u32 pcie_aspm_enabled(struct pci_dev *pdev)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 59876de13860dbe50ee6c207cd57e54f51a11079..6f3c5d6a9a959abefbb69e1165aec704da507313 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1851,7 +1851,7 @@ int pci_enable_link_state(struct pci_dev *pdev, int state);
 int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
-bool pcie_aspm_enabled(struct pci_dev *pdev);
+u32 pcie_aspm_enabled(struct pci_dev *pdev);
 #else
 static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
@@ -1863,7 +1863,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
 { return 0; }
 static inline void pcie_no_aspm(void) { }
 static inline bool pcie_aspm_support_enabled(void) { return false; }
-static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
+static inline u32 pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
 #endif
 
 #ifdef CONFIG_HOTPLUG_PCI

-- 
2.45.2



