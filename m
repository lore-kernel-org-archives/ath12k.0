Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A61C3601A
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LHttKifARgYyF81ldV6+hu7ZLDM1Lc7yFe3f1HUVnXI=; b=GZjenrAhXTO95oOMdjG7ugoqBx
	bws9tL/NXw960CjtALpYXiRRGS4s77sOoJiUhgsWUEea/5GIx+uMIHbU7LdS6V09N/n4ZZRnCRDk+
	suDpZMiE4WSk3l02fsjS9H/3OUmJTQB5TN7mNV0c9mxMkNcYal4qrArxX9IQO92oY2cAKIOCcNLGO
	SGbGRrfHcXPKmOyJkkDZJw5Xl5zZnBqBqaaFxoLkpRfHNb1KP3skqjbKka9WW/iGZcHDvm7aaNimb
	tVWM6qFCm55lkneLIt6mpX516+gllrrYx2KgTCfd/O4DEVGCDxB31qQAlNKp1lFKCujQ8q7FfaoOs
	RRWuZ5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyAz-00000006Eui-1AIj
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 13:30:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzy7S-00000006EF4-20xw;
	Wed, 02 Apr 2025 13:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 823EA5C6890;
	Wed,  2 Apr 2025 13:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255AEC4CEE9;
	Wed,  2 Apr 2025 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743600421;
	bh=ClNiKdAaagNCBF9poM6ZVmYqqOtAci1UecszB5V3I5c=;
	h=From:To:Cc:Subject:Date:From;
	b=UtH73OU/kW3B3D43xBbmfrpfLXDrN7UH9K2u9Xr+YmIyZLa7+A0rlj9pQUMSzrdwN
	 SqYlJeNcA4LgKBPe6wjPh4bXUrlele19Yx/kkPTWT/ZECaSZw1G75/GnIfjYrEJ3Cv
	 LSR+eouyTdZF3guzUAiF+buNxaoGIuqDwHIogrSCI3eOOh9j5L66OqPEzIkP0Ev+Nd
	 Gds33G9CNdXLMMLWGx0Nun1b3tffn848JcPeVxNJiULVykTsTjtX2t0t5GxG8z7wEI
	 1d1erz0Yb0jZHYFr0fzt9H86qKHoZVgB81RLEJ6ioGrbjJ7dAcbf91NerpywAfaqlz
	 CSb7puTLyYjEA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tzy7V-000000004iG-2W68;
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
Subject: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
Date: Wed,  2 Apr 2025 15:26:30 +0200
Message-ID: <20250402132634.18065-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_062702_572163_10EFE8C0 
X-CRM114-Status: GOOD (  14.20  )
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

The ath11k, ath12k and arm64 changes could go theoretically go through
the corresponding subsystem trees in turn once they have the new
symbols, but to avoid tracking dependencies over multiple cycles it is
much preferred to have all of these go in through the PCI tree.

The wifi patches have been acked by Jeff and I don't think Will or
Catalin will mind the single rename in arm64 if they don't see this
message in time.

Note that the patches could be squashed into one, but keeping them
separate highlights the changes done to other subsystems. I also find it
easier to review the changes this way.

There are some new pwrctrl drivers and an arm64 defconfig change on the
lists, but the former should also go in through PCI anyway while we can
make sure that the defconfig update matches the new slot symbol.

Note that getting this rename into rc1 would be great as that way it
would end up in most subsystem trees soon as well.

Johan


Changes in v2:
 - drop deprecated symbol for the new slot driver to avoid having to a
   add a new user visible symbol (e.g. any early adopters will be asked
   to enable the renamed option again)

 - move arm64 patch last two avoid temporarily not having the pwrseq
   driver selected (Jonas)

Johan Hovold (4):
  PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
  wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
  wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
  arm64: Kconfig: switch to HAVE_PWRCTRL

 arch/arm64/Kconfig.platforms            |  2 +-
 drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
 drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
 drivers/pci/pwrctrl/Kconfig             | 22 ++++++++++++++++------
 drivers/pci/pwrctrl/Makefile            |  8 ++++----
 5 files changed, 23 insertions(+), 13 deletions(-)

-- 
2.49.0


