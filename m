Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBA7C28B20
	for <ath12k@archiver.kernel.org>; Fri, 28 Mar 2025 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BHDENvoiM5Dl7BWke74hGDgHZbA3kblcglFXOMN7SMM=; b=IwPM6CU160/ROY
	YMh4cCTjkaEplEYZP0biuxIvpGeXlSAfbL7JnAGyu0uEBXmJyDzYPvKFXM+6DPicBq0mhBXnSUo+o
	ZBfJbHVzNrvdK64bTnnex5Hq7/YKT+i2XcHPaIkL8jxDjcgAmM1A8D1+uRn//rQVMn5KMC1GXA+ad
	FSN/mvUCQAYl3tXv8+Mgl1LH4Hc0dN0TaUJTgmxTuIk1BzEzrOvvbabdwTTWIOHaG3TlQbsw8gWBe
	ox6zJXoxx7yKXH5TTRLqoGJb5uMoqMdeImBAmPY5OsrbaE/lHHi93JA71ennAr/UNjL2jXIr5eCk4
	M9GdqVpbFqfJGdDhe2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyC2F-0000000Dp7i-1WXo
	for ath12k@archiver.kernel.org;
	Fri, 28 Mar 2025 15:54:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBP0-0000000DjOo-03cp;
	Fri, 28 Mar 2025 15:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92435614C7;
	Fri, 28 Mar 2025 15:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBCBC4CEE4;
	Fri, 28 Mar 2025 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743174824;
	bh=Dtnjl7os46EKSTPdEv2lx+mACntQjIU6u4CtZiCQQME=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KU1uKX31NIaglimesxqTFb0KuT4jfPg992rwxEwDDBRmZo4e+KcWh7jK3uM6wRR0O
	 XivE8gGp99t/FKqhRCGrTvMNsGS36IXO6G35woETJXQ6FLPnjuSmri5dVj15LxPF6U
	 3RkABxexXyg2Px6CkfnzwVf26HKwK7gZG1IHwv1nC8FAjSPYGPf3lkGwDpLLy0vo7W
	 wtw7BQyiXoAZej8iX30/hKYam2qPSM0+im66TREcruDoWcrEfgqYIbc8PyJB7J59qO
	 7M84zHKKHia5fYP/gf+79wS1rdLaN7pWVRXRDnWxiscYqkTwHZXmdwkdwXuqp+l354
	 lljSM9ycVccIQ==
Date: Fri, 28 Mar 2025 10:13:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot
 module
Message-ID: <20250328151343.GA1505019@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328143646.27678-2-johan+linaro@kernel.org>
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

On Fri, Mar 28, 2025 at 03:36:43PM +0100, Johan Hovold wrote:
> Commits b88cbaaa6fa1 ("PCI/pwrctrl: Rename pwrctl files to pwrctrl") and
> 3f925cd62874 ("PCI/pwrctrl: Rename pwrctrl functions and structures")
> renamed the "pwrctl" framework to "pwrctrl" for consistency reasons.
> 
> Rename also the Kconfig symbols so that they reflect the new name while
> adding entries for the deprecated ones. The old symbols can be removed
> once everything that depends on them has been updated.

I considered changing the Kconfig symbols at the time, but didn't do
it because I didn't want to break existing .config files.  Is that not
a concern?  Or do you think the long-term benefit is worth having
users re-answer these config questions?

We have lots of Kconfig symbols that are not what we would choose
today, e.g., my misguided suggestion years ago to use "CONFIG_PCI_*"
instead of "CONFIG_PCIE_*" for PCIe controller drivers that didn't
have any PCIe content.

If we do want this, I would think we should squash all these so we
don't have breakage between this patch and the following ones.

Bjorn

