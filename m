Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4A5C36011
	for <ath12k@archiver.kernel.org>; Fri, 28 Mar 2025 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cs94rJr36M245m//XhRJSO5zo9e+EowQQQU+m86V3HA=; b=cfQzAOJywfU2cKxtNXr7H2THI9
	d1UbXbbh2nBjhnHe3ZhXfc4BEYQHrhbCgIenKyaPi4WE5w7koYvnuJdzki9GcclYHI0bXGZr3XwbN
	pc0CgA6sc++H/LgmJ1PTpRKd6od9XZBFmCkkfyaLgCr3QjM3YYVVX5M3G1E97gjENld1s2XNmI/TX
	xtqfAn7gTOfU4jv8fwnoTx/xoeurXwta/Fh29gU4kTR5xYANzqhaPwVyshEkiytJcIey8XwXd+c/z
	BD/ZauyFZyJT5j4JjOAGThrtwLowMkMjqS60Ua9dXyTa5ZN6Ps/9C5wavNnsCTGmDBD3h8W0UtExB
	shfZ3a5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBXT-0000000DlL0-1Xru
	for ath12k@archiver.kernel.org;
	Fri, 28 Mar 2025 15:22:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAtb-0000000DdAR-0Emr;
	Fri, 28 Mar 2025 14:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB1805C598F;
	Fri, 28 Mar 2025 14:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B145C4CEEA;
	Fri, 28 Mar 2025 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172877;
	bh=+YTvdE2iZ788wN7Wc+2uw+Dvl6sYCHoidGkWfyHGi94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RCRE8Z1LhBsgr2sxxO+SC9iT/1qQQzQNPGQwZCR9iheW/x2fyQQ50kfRUQyNR0tbO
	 CG8B64yJL0LOl32J2nrreBQlspSafic3QlZwfGCIkIT1cLrbS2oLaNydTaB5Q27RK2
	 qKGNmpXnePK3uw2DsT8QzTrebcGvNfGohKyJJq0skcztjXEMYBUghGh2x1UdbL2Xwf
	 FsU3I+sKia9ebnGhsjknGZNghv8nrmeX+fp2AyYh6a34hNqrwMCojyLF4uP0whvA+h
	 H2O4OpUvZEjrg2f6ZszIYBdHUtI3YY6pry0NA7j3RfhgB7q32mKnAR4L7zJYsKLk1c
	 zu6N6IQbUtbDw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tyAte-000000007JG-3cJz;
	Fri, 28 Mar 2025 15:41:22 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/4] PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
Date: Fri, 28 Mar 2025 15:36:43 +0100
Message-ID: <20250328143646.27678-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
References: <20250328143646.27678-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_074119_219420_E73DA559 
X-CRM114-Status: GOOD (  11.78  )
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

Commits b88cbaaa6fa1 ("PCI/pwrctrl: Rename pwrctl files to pwrctrl") and
3f925cd62874 ("PCI/pwrctrl: Rename pwrctrl functions and structures")
renamed the "pwrctl" framework to "pwrctrl" for consistency reasons.

Rename also the Kconfig symbols so that they reflect the new name while
adding entries for the deprecated ones. The old symbols can be removed
once everything that depends on them has been updated.

The new slot module is also renamed to reflect the framework name and
match the other pwrctrl modules.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/pci/pwrctrl/Kconfig  | 27 +++++++++++++++++++++------
 drivers/pci/pwrctrl/Makefile |  8 ++++----
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index 990cab67d413..62f176e42e33 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -1,19 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config HAVE_PWRCTL
+config HAVE_PWRCTRL
 	bool
 
-config PCI_PWRCTL
+config PCI_PWRCTRL
 	tristate
 
-config PCI_PWRCTL_PWRSEQ
+config PCI_PWRCTRL_PWRSEQ
 	tristate
 	select POWER_SEQUENCING
-	select PCI_PWRCTL
+	select PCI_PWRCTRL
 
-config PCI_PWRCTL_SLOT
+config PCI_PWRCTRL_SLOT
 	tristate "PCI Power Control driver for PCI slots"
-	select PCI_PWRCTL
+	select PCI_PWRCTRL
 	help
 	  Say Y here to enable the PCI Power Control driver to control the power
 	  state of PCI slots.
@@ -21,3 +21,18 @@ config PCI_PWRCTL_SLOT
 	  This is a generic driver that controls the power state of different
 	  PCI slots. The voltage regulators powering the rails of the PCI slots
 	  are expected to be defined in the devicetree node of the PCI bridge.
+
+# deprecated
+config HAVE_PWRCTL
+	bool
+	select HAVE_PWRCTRL
+
+# deprecated
+config PCI_PWRCTL_PWRSEQ
+	tristate
+	select PCI_PWRCTRL_PWRSEQ
+
+# deprecated
+config PCI_PWRCTL_SLOT
+	tristate
+	select PCI_PWRCTRL_SLOT
diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
index ddfb12c5aadf..a4e5808d7850 100644
--- a/drivers/pci/pwrctrl/Makefile
+++ b/drivers/pci/pwrctrl/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_PCI_PWRCTL)		+= pci-pwrctrl-core.o
+obj-$(CONFIG_PCI_PWRCTRL)		+= pci-pwrctrl-core.o
 pci-pwrctrl-core-y			:= core.o
 
-obj-$(CONFIG_PCI_PWRCTL_PWRSEQ)		+= pci-pwrctrl-pwrseq.o
+obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
 
-obj-$(CONFIG_PCI_PWRCTL_SLOT)		+= pci-pwrctl-slot.o
-pci-pwrctl-slot-y			:= slot.o
+obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
+pci-pwrctrl-slot-y			:= slot.o
-- 
2.48.1


