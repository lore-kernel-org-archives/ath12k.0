Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1BBC3601A
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAxFexgQmB2TfK1mr+GQq7cgXCt/uMUFHyjb1c4s5Hk=; b=FsxRJ6gBwYVi0sR+1jpgWZgCVj
	iYm/JV1pMSnJ4/lYIRFACBuVm9NRnES7yPCZSK3Hc5kORGGKPHwtTNK7thlb+bHzSQxoDTWlkiJi+
	BkBZ85tYeKJ0rRM7he5+f2JC10+0A2oe2fxe1wzT5vHEvWF7lcyVZWz4VPYfpDS/g+o8t9h3EwzOJ
	mpYIg/Oq2DVNfRJth4dxp3j/J5KsKHXtrYYlQwFA9Q4uliK0STuRICrBJt/oETgvikUtud0qSoAxf
	oFy5QwOuCbkzncw5frOBsOEa4FXai8SfRggNnHIJK+Wt0KYSi7EGz+Rexc4dv/MUDM6jbFUyZ3Rpk
	P2xHi1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxXU-000000068YF-41l7
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 12:49:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxMj-000000066XI-3dnN;
	Wed, 02 Apr 2025 12:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42B9261163;
	Wed,  2 Apr 2025 12:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46D7C4CEE9;
	Wed,  2 Apr 2025 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743597524;
	bh=oEhyNyNMZHsFewfythTjj6m7g/dZV8hw3gXRVCT8pNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCdFlrZivFl/UJ2eMNNSfT9+UYFDzF4gq16A9L9FZp24YoZaAz6/fL1v+ZsvmabGx
	 FfVb5eltNG21n8hvETXN+F8aSCRv1JaELc3N9cZmNMxi2XEdwfhzL3LnpQPBR5S3o5
	 EJd6NoP/8IUu/pu3A6RrSqgnRoPViqomT5lF8lHTpFwmATgtKJ2wzmrCuQJD9r27XB
	 UTozMtVBJ2TlCDxA9A7PoIMyAhveFophTU4wtibnMkpMkgStfoKd4vpFNS3aEyLPKX
	 dOmH3+IJ+CYAoy3dTQF9jrY9MEE/lVwHR6g7QloS9SxqlnyqP8zbsw09we9+fALFcA
	 fjRsTa0533DYw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzxMn-000000001WI-1voi;
	Wed, 02 Apr 2025 14:38:49 +0200
Date: Wed, 2 Apr 2025 14:38:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot
 module
Message-ID: <Z-0v2RAtDe0bSfWI@hovoldconsulting.com>
References: <20250328143646.27678-1-johan+linaro@kernel.org>
 <20250328143646.27678-2-johan+linaro@kernel.org>
 <CAOiHx=mo6Qd+7WrO2JvBLhqjGR7oHds14FwFFAVoEkVWLnbhdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiHx=mo6Qd+7WrO2JvBLhqjGR7oHds14FwFFAVoEkVWLnbhdA@mail.gmail.com>
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

On Wed, Apr 02, 2025 at 01:54:36PM +0200, Jonas Gorski wrote:

> I have some nitpicks ...

Thanks for taking a look.

> On Fri, Mar 28, 2025 at 3:41 PM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > Commits b88cbaaa6fa1 ("PCI/pwrctrl: Rename pwrctl files to pwrctrl") and
> > 3f925cd62874 ("PCI/pwrctrl: Rename pwrctrl functions and structures")
> > renamed the "pwrctl" framework to "pwrctrl" for consistency reasons.
> >
> > Rename also the Kconfig symbols so that they reflect the new name while
> > adding entries for the deprecated ones. The old symbols can be removed
> > once everything that depends on them has been updated.
> >
> > The new slot module is also renamed to reflect the framework name and
> > match the other pwrctrl modules.
> >
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  drivers/pci/pwrctrl/Kconfig  | 27 +++++++++++++++++++++------
> >  drivers/pci/pwrctrl/Makefile |  8 ++++----
> >  2 files changed, 25 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > index 990cab67d413..62f176e42e33 100644
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -1,19 +1,19 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> > -config HAVE_PWRCTL
> > +config HAVE_PWRCTRL
> >         bool
> >
> > -config PCI_PWRCTL
> > +config PCI_PWRCTRL
> >         tristate
> >
> > -config PCI_PWRCTL_PWRSEQ
> > +config PCI_PWRCTRL_PWRSEQ
> >         tristate
> >         select POWER_SEQUENCING
> > -       select PCI_PWRCTL
> > +       select PCI_PWRCTRL
> >
> > -config PCI_PWRCTL_SLOT
> > +config PCI_PWRCTRL_SLOT
> >         tristate "PCI Power Control driver for PCI slots"
> > -       select PCI_PWRCTL
> > +       select PCI_PWRCTRL
> >         help
> >           Say Y here to enable the PCI Power Control driver to control the power
> >           state of PCI slots.
> > @@ -21,3 +21,18 @@ config PCI_PWRCTL_SLOT
> >           This is a generic driver that controls the power state of different
> >           PCI slots. The voltage regulators powering the rails of the PCI slots
> >           are expected to be defined in the devicetree node of the PCI bridge.
> > +
> > +# deprecated
> > +config HAVE_PWRCTL
> > +       bool
> > +       select HAVE_PWRCTRL
> 
> I'm not sure this will work as intended. This symbol can only be != n
> if anything selects it, but there may also be (outdated) config
> symbols that depend on its value. E.g. ath1*k has "select
> PCI_PWRCTL_PWRSEQ if HAVE_PWRCTL", and if there is nothing selecting
> HAVE_PWRCTL, but HAVE_PWRCTRL directly instead, HAVE_PWRCTL will be =n
> and the condition will fail.
> 
> Since you rename the only one selecting HAVE_PWRCTL in patch 2/4, but
> update ath1*k in 3/4 and 4/4, their select PCI_PWRCT(R)L_PWRSEQ use is
> temporarily ineffective. Moving the arm64 patch last would avoid that
> though, at least for the current state.

You're right, thanks for catching this.

> The alternative would be split this by config symbol instead of per
> tree, so all users would be atomatically updated as well. These
> patches need to go through the same tree anyways, so I see no issue
> doing it that way.

Moving the arm64 patch last would take care of the temporary glitch, but
since it seems we need to take this through one tree (e.g. to avoid
merging it over three cycles) perhaps we can just squash them.

That said, it seems I would need to reverse the logic for HAVE_PWRCTL so
that it is selected by HAVE_PWRCTRL if we think we still need to worry
about new users of HAVE_PWRCTL being adding to other trees.

If we could get this renamed already in rc1, we probably do no need to
care about that though.

> > +
> > +# deprecated
> > +config PCI_PWRCTL_PWRSEQ
> > +       tristate
> > +       select PCI_PWRCTRL_PWRSEQ
> 
> Similar issue, but there are no conditionals based on this, so this may be fine.

Yeah, this one should be fine.

> > +
> > +# deprecated
> > +config PCI_PWRCTL_SLOT
> > +       tristate
> > +       select PCI_PWRCTRL_SLOT
> 
> This one won't work. Its value will be automatically calculated based
> on other symbols selecting it, and since there is nothing selecting
> it, it will always be n, regardless what any existing .config says.
> 
> So unless you make this a user selectable symbol as well, this will
> (potentially) break existing .configs since its value will be then
> automatically calculated as =n, and the new symbol takes the default
> =n (unless explicitly enabled, or selected by ath1*k).

Right. Since PCI_PWRCTL_SLOT will be new in rc1 and there is nothing
selecting it, I think we can just rename this one. At least if we can
get this into rc1 and make sure that the pending defconfig update is
respun.

Otherwise it would indeed need to be user selectable.

Let me respin this. Since this is all quite new, we should be able to
just rip of the band-aid for rc1 and not need to worry about this going
forward.

Johan

