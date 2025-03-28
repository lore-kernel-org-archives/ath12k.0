Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E0BC36013
	for <ath12k@archiver.kernel.org>; Fri, 28 Mar 2025 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDTFWD7eVeXm3ReaL29jgjiMG/Iz6d2Os++9wfFx7cU=; b=j+ZNmRKCpgUI0FaEmhBr5K9e4k
	3kNly1+RT02NSNoWRN+2OA0Xjqol+q7n470edh46xqZ4OwIH1GInef9CkYCYu8i/LDHWvDXARtS3Z
	3qUuAGm1pv2v5m9B0NbNJXxQV/PzfTXJdNxI3gDKIbUL42VwusbvEV7XBRoZ2GIknxnIvyTlJpWSh
	1yVQYLFdVaQQPGUgG5nYSqPFNh0D+rGB8MqemjY612Op1odL+ccIHbo/GCM+eI5l/56ZFNY25PA4W
	E/m59buUTxHh8V/z+OHIMc7RN28hyeZ2dN0HxdMaawhcq5h9WR6yIZd1ulV94XRtZe2u5yIp9O2Ju
	m1sd/AOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBU1-0000000DkeR-1M7g
	for ath12k@archiver.kernel.org;
	Fri, 28 Mar 2025 15:18:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAtb-0000000DdAS-0BG8;
	Fri, 28 Mar 2025 14:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 900B1445FE;
	Fri, 28 Mar 2025 14:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8747FC4CEF3;
	Fri, 28 Mar 2025 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172877;
	bh=8PuT1jV9b0Y7GZnMGFM7vZCfZDWEJjSwlXvGrPuWeAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tpimyxMMCICZIjv7JGOqZl85llXmWPMxffKm9ij8USgb/H1h5x3gO7Mdn7wtNcUNE
	 RjScx0Ech9GanW7ELk5oHeAmk9utDRfEA7Ov+PmUUNtPrwDWAnbwPw4TuSqVFOs0y+
	 GXk4OuhwULDchJL7nr+pY6VJ/gTmIVtLOB42cU9O6DoagdALsKZHHpnFR4iPao4kU0
	 fGZsksUwnEk6ewj2k9UMBuHE9YHjT1qCX8g/5eSjpKMc/fcnV6PR6Zs4RGYBLVf4iL
	 8S6NnNjv4zqFdmuQCGPfulrIf818n8PkrXLvaLnuJgo9TDIvh3yamCrpVma5ftPp3w
	 60cycul5X4e0A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tyAtf-000000007JN-0bcM;
	Fri, 28 Mar 2025 15:41:23 +0100
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
Subject: [PATCH 4/4] wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
Date: Fri, 28 Mar 2025 15:36:46 +0100
Message-ID: <20250328143646.27678-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
References: <20250328143646.27678-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_074119_144359_7347D4CE 
X-CRM114-Status: UNSURE (   9.15  )
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

The PCI_PWRCTRL_PWRSEQ and HAVE_PWRCTRL symbols have been renamed to
reflect the pwrctrl framework name. Switch to the non-deprecated
symbols.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath12k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 52a1bb19e3da..2d1eb22deda7 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -7,7 +7,7 @@ config ATH12K
 	select MHI_BUS
 	select QRTR
 	select QRTR_MHI
-	select PCI_PWRCTL_PWRSEQ if HAVE_PWRCTL
+	select PCI_PWRCTRL_PWRSEQ if HAVE_PWRCTRL
 	help
 	  Enable support for Qualcomm Technologies Wi-Fi 7 (IEEE
 	  802.11be) family of chipsets, for example WCN7850 and
-- 
2.48.1


