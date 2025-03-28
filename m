Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2B7C36011
	for <ath12k@archiver.kernel.org>; Fri, 28 Mar 2025 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8bZhwwU9ePmpEeDj6f8479srMs+M3qelX22OGhw+9s=; b=sS/hBr+0C5cpsbXX7QH1USGAoc
	t5dZH55mU4xvENiKAIumERg8AajjWWTM5imcuHthtTKsGqns4SDrYkXB/yJhFGNGIQUROcc0z5mxu
	gGPAIvkYjgZY5VA4Twr449lOE9I5V7OdmGfLBBcEtVrSBkG/TPkC0hD//TyzdlKb4vxi+B4jt9lCa
	aXFM1QqbsnAdCnwfjJnPafm40M5CWbdinjA1VpKQO8SVFpy3kVmxUXDtvvNVQJidp0sG+5s4zLwun
	auysZVC4I54vK994h6gZVni5lX0Jb/P4OTVml8O8z1EwBB8Woqio/tU4lI2PqyQOiBifNtXIT77MJ
	pfiqhRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBQY-0000000DjjW-2yZe
	for ath12k@archiver.kernel.org;
	Fri, 28 Mar 2025 15:15:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAta-0000000DdAQ-3i8e;
	Fri, 28 Mar 2025 14:41:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A5DA4440D;
	Fri, 28 Mar 2025 14:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F1CC4CEE5;
	Fri, 28 Mar 2025 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172877;
	bh=1g4EHN9FsFeL8KcNzWB9FjbN2ttqTUJJvv9E0VghsJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g99fjolP1ynkbsDZq1bxszDEcMaRy32/d6dV9JXBzveXara9Rky+V+W/Z/rsuB+vf
	 cgLOKza/l5lSqxqewl4N18vNP6cjWNAiEauc1A3K6bJ/Nz3N77rPRfY49YFWSr3/+N
	 MeQH0RZSpMCgZXvqvxztGv3KH5QxTg264MSX5d/D5RFHD5ZHaIPeSQf2TEHQM0uU04
	 0NwohwgCfxYQv1ArN4GXUlntUzGhcux6XYIKzXq50EVCWuAgRBMNjX20CWFnzYhlhu
	 hB365hD3o8UxwChCVV1Ux4/bWMxboHdAH9J6QfxXtpulUr3eeUn7GhmgIW7okkz9Uf
	 gABQCL5CfAJWw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tyAte-000000007JI-42Hf;
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
Subject: [PATCH 2/4] arm64: Kconfig: switch to HAVE_PWRCTRL
Date: Fri, 28 Mar 2025 15:36:44 +0100
Message-ID: <20250328143646.27678-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
References: <20250328143646.27678-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_074118_973741_9F827B92 
X-CRM114-Status: UNSURE (   9.47  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

The HAVE_PWRCTRL symbol has been renamed to reflect the pwrctrl
framework name. Switch to the non-deprecated symbol.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/Kconfig.platforms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..cc94845e9bbf 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -269,7 +269,7 @@ config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
 	select PINCTRL
-	select HAVE_PWRCTL if PCI
+	select HAVE_PWRCTRL if PCI
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 
-- 
2.48.1


