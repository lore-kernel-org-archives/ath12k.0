Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBDDC36017
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4g9uAhX6zxcCbKcsW1SycVp/qsfwIU9/zuPGk6yrOf8=; b=jC6k5QCWSZmIia4C01BrfXErm1
	9HTIgM/f0GgUGmPX4bsx5GSVFnlUYC2QpeMvUmrC7UMrU+xmQ2EZyvhd4Hlb2mY4Vjp3zmOEOXH8B
	SK7jdAwCNp6ttXdIXwWV577P9zLQV4UFSGIOE2sb5Ze7L1zV8Sc/urBYSJ0BP31WUJ0yZDVfz+rkb
	xeFyhUN6fdF/JlebDT0yHqQeo/X+bCBXWWts3R+hkaihAIrWCWKPuPFM//Sua2tw8U7F2p2TgYlNY
	YJ8QAW32d1DKjvq2FCFBagWerIu/ueRpxx9vGOrldorBBfjZWCqlewGS4aZ3j58MtHDxyTj4RtLRR
	pDdi+ZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyB0-00000006EvQ-0Hte
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 13:30:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzy7S-00000006EF3-3BWg;
	Wed, 02 Apr 2025 13:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8496C5C68BD;
	Wed,  2 Apr 2025 13:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2263BC4CEDD;
	Wed,  2 Apr 2025 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743600421;
	bh=q8MlTcMdTxqASv9J/gaoNv8sWTK+B2H8IJ7Qnbtnb1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LVfo+JTYRbWK1cu1fOodOq39dmcomePZ+LktifxPm6ESLTvdMXIHtIXzClQpBgXf1
	 mpmQAIcLOngU9OSCXKbFHE2c5XGeJiSfdsGStGQi+V8Cmm/dEn20UYWn6QRabWWrtD
	 frAQEdD25dqgxVy0l8JCvwTyWopF9Lur/0Z7xw9vCqg4MaauQCt70tuRC032WNejVs
	 nsQd39VEY3cflmGP9VuxUgIOj/+m5O+OQ/E1fiEl9l+JNC2E9j/GAVLIU4o6aij2nX
	 HFeZ++gE1vT7S/OwMQ9XN0GRyHdWHD7dLW4JyShRHRQPL89q1z+jf2+m0UUUfrbLFQ
	 B4dZQtnOt9IBQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tzy7W-000000004iI-1d0r;
	Wed, 02 Apr 2025 15:27:06 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/4] PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
Date: Wed,  2 Apr 2025 15:26:31 +0200
Message-ID: <20250402132634.18065-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402132634.18065-1-johan+linaro@kernel.org>
References: <20250402132634.18065-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_062702_875985_9CB2FE19 
X-CRM114-Status: GOOD (  13.34  )
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

Note that no deprecated symbol is added for the new slot driver to avoid
having to add a user visible option.

The new slot module is also renamed to reflect the framework name and
match the other pwrctrl modules.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/pci/pwrctrl/Kconfig  | 22 ++++++++++++++++------
 drivers/pci/pwrctrl/Makefile |  8 ++++----
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index 990cab67d413..6956c1854811 100644
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
@@ -21,3 +21,13 @@ config PCI_PWRCTL_SLOT
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
2.49.0


