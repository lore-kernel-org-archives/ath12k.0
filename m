Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D5FC3601A
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMV085jxv+9eeAt4Q9em+fq+HM2Mg91CAwLDQ2CRiK0=; b=FViN0mQ7PFy18gNzkGCa+PUgmQ
	xfBqhLR98KhKvO32nreJBQrxzd2sw75ZNO6XF9ut4caSC/e3jAIf8RIAmcogxRH8X9Dsv9fLytYgD
	6Cv4bTQr4llfoNCwVNerqnfSvCQ7y9YunsXWkDodJJ8Yv4IfM+chtbeIFGnFU7yZt380wBXiVpzU+
	SuIhTwpv+tLQd7HsihAGySwpe+nS0z79LU0DgfZuXPou1F//xOnLpF9qRPGXLlbBgzD4Dg8S8J/WO
	b2unIRM5KLfd1wbuYn28jHTse3STZSksjLhYJgb7XvYi8RFO+ilefS0zdedX2RNaBmLJL7nOcA+4F
	berIyCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzy9F-00000006EbI-16ft
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 13:28:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzy7S-00000006EF2-20hz;
	Wed, 02 Apr 2025 13:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 206694457E;
	Wed,  2 Apr 2025 13:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E079C4AF0C;
	Wed,  2 Apr 2025 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743600421;
	bh=sUaCyaEjEYggSl/kXXjuZDqRS5xLlh4DDfCG6MRWm7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sF44gpQ6clwCB0In8M9mY9sxmtUTTn0Zy5FU4gp1j0GBdgoEMftZyiKh7w89RMX+M
	 bQvehtlm2oDyuOL6JBa+qhXydZ6To4pJm+Q9L5aO+Ggg/RqjT9+ult2mk3VAvUL4Z5
	 wa6KlBzDeTPjYUgcTE0BUaL7Y4vKGYJtnedEveVpjaztX0w8NWT3+oT7Z+Gff2hSWF
	 0Tvt8EO1lrltt8CbJ+dGpyat4IT3NMBE3HSARnrHxy5kD+nU5T5IQBvhA99/Pz1fqr
	 JcyMinTPw5VBEmp7faUlIWVVMM+QEGAONLPvfydAptPtSzpFPjm4oDYcWW5g2qBX4f
	 eGldFLZpC3tAg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tzy7W-000000004iO-2htb;
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 4/4] arm64: Kconfig: switch to HAVE_PWRCTRL
Date: Wed,  2 Apr 2025 15:26:34 +0200
Message-ID: <20250402132634.18065-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402132634.18065-1-johan+linaro@kernel.org>
References: <20250402132634.18065-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_062702_535978_402B9781 
X-CRM114-Status: GOOD (  10.44  )
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
2.49.0


