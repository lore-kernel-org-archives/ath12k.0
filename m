Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DE2C36013
	for <ath12k@archiver.kernel.org>; Fri, 28 Mar 2025 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f/+xVXmyifsKxzZW6qvHUn1JTmdvqrYJfpZm/vXSIzA=; b=oM1e/i+MQRXptRnXJXQTjXeON6
	MNxsJ8y3g2h1Ha99EpgVRgdWE1AuGAv5duu5lQUbdktpG/EwmD8QvInrJHIvLT8Z7iDJHODR4UY1S
	Hvdce9xsyQ/vkgPUmK9hJFeUgqVKpcICFtaxbFO49SCltq3Y5XrXfLuFviJb/CGTkYs4oMSCSwKiK
	LFOY4TdQv0XGKw5v4KGi7pRV698hQwYv3qhVs4/jUpxc9e6pjLi2QZdJ+PMpROmVXXDvlX6c1SDcy
	MY+/OKN0MSMFRikTwxdKRrObHHUvNT2n9OhesfgUcCGd+GP9KDW8y65PxezHngnWbmPB2N1XPw47K
	qFlEhIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBQY-0000000DjjB-0wP8
	for ath12k@archiver.kernel.org;
	Fri, 28 Mar 2025 15:15:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAta-0000000DdAP-3Z6m;
	Fri, 28 Mar 2025 14:41:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB1CD5C637C;
	Fri, 28 Mar 2025 14:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416FFC4CEE4;
	Fri, 28 Mar 2025 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172877;
	bh=y7cHCyZAEfSlg6AyD3uU4qQU2vhubF/C2tytpK45mgI=;
	h=From:To:Cc:Subject:Date:From;
	b=FhE2tGtwR/3+u2Pxi0Nic1s8CgrzGIuTvwq6WqBTWMA2CxUrHpLNg8V5M5U/5NMbz
	 sfkvii5DH4bxQq9Wr7+QsOJT4hKvSiENvMymmNdqLgyirCpuhaIYs7T+X60hfE5Hd4
	 lyBqTyiMMZDj2qBNM5DGdqCFo/YJV0xjBkQlmYgePwNu8IbTQ4v6baT/nbgkY7ZaPa
	 OX4ew5klYUT0UvgmxuRhinMtYq17kp5BPn5KPgAkGg2HaskmQyiom7Y2sYKWeet0g+
	 C/ZFo5TZh/XU7FjWncQ7FilvaeVkgqk2TAkB1WBn1jZ0nX/JdUN7k8bb2tuLrzsMzc
	 6Iif3uzKrFgBw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tyAte-000000007JE-3B3i;
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
Subject: [PATCH 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
Date: Fri, 28 Mar 2025 15:36:42 +0100
Message-ID: <20250328143646.27678-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_074118_930671_8420BFFE 
X-CRM114-Status: UNSURE (   9.85  )
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

The PCI pwrctrl framework was renamed after being merged, but the
Kconfig symbols still reflect the old name ("pwrctl" without an "r").

This leads to people not knowing how to refer to the framework in
writing, inconsistencies in module naming, etc.

Let's rename also the Kconfig symbols before this gets any worse.

The arm64, ath11k and ath12k changes could go through the corresponding
subsystem trees once they have the new symbols (e.g. in the next cycle)
or they could all go in via the PCI tree with an ack from their
maintainers.

There are some new pwrctrl drivers and an arm64 defconfig change on the
lists so we may need to keep deprecated symbols for a release or two.

Johan


Johan Hovold (4):
  PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
  arm64: Kconfig: switch to HAVE_PWRCTRL
  wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
  wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ

 arch/arm64/Kconfig.platforms            |  2 +-
 drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
 drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
 drivers/pci/pwrctrl/Kconfig             | 27 +++++++++++++++++++------
 drivers/pci/pwrctrl/Makefile            |  8 ++++----
 5 files changed, 28 insertions(+), 13 deletions(-)

-- 
2.48.1


