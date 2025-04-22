Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0250CC369C2
	for <ath12k@archiver.kernel.org>; Tue, 22 Apr 2025 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WN+PRgHyAf3nOCo6STp+CMmOb8/tTXBZONy2+wnMbbE=; b=sss7kCLsGJhdKo
	ZXGHmf4K1Hwb2j4UA+JZBfYBJmsANB1QH6kASTGRbM1n09I++kM6Ur2QPgivxt/5LeKLPGHQWpjLM
	4stwNFxJNjoUXDOgLWa312jSjUaTy5NZCdiaW3TsANs3ZIFHcMmj+KlSKRUVxa77N4BuUI6HenEh0
	on6gg3yTaTOYoYmT62G3t8WveTalVdv/lh2zzoXJdh3iH6o1UfgJ6cbNi5qrjurgl5wMfrrg/5Z4g
	5N7ZG7FcHstE5kD9I0B3OETLWI2n07NLZAvl4DPD3GjwPDXY0WLUeHTrHls1B7lZb9r9rYzAscird
	vmKyDwBSZ7XEFiDJPe1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IAC-000000088UL-1oDI;
	Tue, 22 Apr 2025 18:16:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GBb-00000007qBK-2gb7;
	Tue, 22 Apr 2025 16:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7C4444B4A;
	Tue, 22 Apr 2025 16:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83FCC4CEE9;
	Tue, 22 Apr 2025 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745338167;
	bh=Qd8a4qsvk9G4mClmpO236TQ3jYEPXO158QQTn0cWxKo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HX3Z65O5qlPLh9w2tzD5zgqTmEEUNEK6frdS/LWvlhyQODlex5+w4HSJdCbGoofuA
	 0gQn+BMTfXd7XLr5lao+kMAgSu5Txq5IIBHoQq02UTsB1+yfusdHTZI/mXSP95k5IE
	 JCqMtjnYl26+MirO5su+/S/djJo/B6kalqrlikwIdjb4Vu39zEDTDScyyECsjs7Fai
	 xj3CMInF+87Vc5jbImMVngqirfWPFFY/EVDQg/io5f0AlQfwCXr3BL8xM6gBslPVaG
	 2Q2/l3deREN+8U1BisoC7SipI13tcn9e/v9PO9fsuIMRuduBgAtTmFYvGLoD4BtpK9
	 aTOM6KqJS8fLw==
Date: Tue, 22 Apr 2025 11:09:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jonas Gorski <jonas.gorski@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig
 symbols
Message-ID: <20250422160925.GA331992@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402132634.18065-1-johan+linaro@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_090927_718341_2C8D0088 
X-CRM114-Status: GOOD (  24.16  )
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

[cc->to Catalin, Will: note the arm64 Kconfig change; my understanding
is that this shouldn't break existing configs]

On Wed, Apr 02, 2025 at 03:26:30PM +0200, Johan Hovold wrote:
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
> 
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
> 
> Let's rename also the Kconfig symbols before this gets any worse.
> 
> The ath11k, ath12k and arm64 changes could go theoretically go through
> the corresponding subsystem trees in turn once they have the new
> symbols, but to avoid tracking dependencies over multiple cycles it is
> much preferred to have all of these go in through the PCI tree.
> 
> The wifi patches have been acked by Jeff and I don't think Will or
> Catalin will mind the single rename in arm64 if they don't see this
> message in time.
> 
> Note that the patches could be squashed into one, but keeping them
> separate highlights the changes done to other subsystems. I also find it
> easier to review the changes this way.
> 
> There are some new pwrctrl drivers and an arm64 defconfig change on the
> lists, but the former should also go in through PCI anyway while we can
> make sure that the defconfig update matches the new slot symbol.
> 
> Note that getting this rename into rc1 would be great as that way it
> would end up in most subsystem trees soon as well.
> 
> Johan
> 
> 
> Changes in v2:
>  - drop deprecated symbol for the new slot driver to avoid having to a
>    add a new user visible symbol (e.g. any early adopters will be asked
>    to enable the renamed option again)
> 
>  - move arm64 patch last two avoid temporarily not having the pwrseq
>    driver selected (Jonas)
> 
> Johan Hovold (4):
>   PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
>   wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
>   wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
>   arm64: Kconfig: switch to HAVE_PWRCTRL
> 
>  arch/arm64/Kconfig.platforms            |  2 +-
>  drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/pci/pwrctrl/Kconfig             | 22 ++++++++++++++++------
>  drivers/pci/pwrctrl/Makefile            |  8 ++++----
>  5 files changed, 23 insertions(+), 13 deletions(-)

Applied to pci/pwrctrl for v6.16, thanks!


