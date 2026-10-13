Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC376CC6B19
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OKaeHoDMxbcRdhaEWBqicGHaLuwHpHXnx6ahTNQjleE=; b=Go8xTvGSpIyMHpUpBCoogqqNxN
	yCU2kl5PxDeh36/zmN5BTJEmlOzYhRLRyD9JXtsKM6OGBfaQl73KP8K4Q8wdUqrO7fe65mISvIP1c
	O4cNWtFTLjd+1QYX+/9bWxIg13A3ii9WeNK/RQ6fAagJiy57JpkLlVqwjLV9hW1Xa+zDzgwEgRHd0
	vS8FUMfmg1MRdl26wkCsYk6NiukJ6jsR1qWp1FGfUXmabPKlcKqf2Q6NWSQ/2JYZA6RwrsqzrRoeT
	GPgrGuseBTFgHq5O3yWG9gfNbGrs/sIjRZCXehBC5e0EJKUs/8usf9EJwJhkdiy0rp/3ZtuNxHIFh
	l+cCtyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfPE-0000000DW6e-2SVA;
	Tue, 13 Oct 2026 16:31:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfPC-0000000DW62-0ifK;
	Tue, 13 Oct 2026 16:31:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C8D9602C3;
	Tue, 13 Oct 2026 16:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B351F00893;
	Tue, 13 Oct 2026 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791909068;
	bh=OKaeHoDMxbcRdhaEWBqicGHaLuwHpHXnx6ahTNQjleE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=ngPdDnNjKhLyQT2N6RhyXzNbBJDw86DCky0DDkFZybGOWOVKgXN/ad/0sBCVkayei
	 HNYj9hrjWpWtBFX/UYrVuXDu9Nm7T92X1bPsmBFtk4Y//+tnDFq0hvpgYtRGyFnd2P
	 c30Gm7kdg0sOrDiIM+eseypQum5fGKkqjPdbpcWGVdosSz8LpVBEl5UHRwM88GzhMF
	 LxJV4rIAovtRgv9XNXWPgotqgnhY5XjoeljLa9b9heAjpcpggcX2vRtxecvBr3LGzE
	 e4URZupBZVLhzqUcLPkBuj4YCM0EBklpXxFGlAABFL+uXuGY4FJty1HMPPxJ406n+g
	 bQsk8Di+vLpcw==
Date: Tue, 13 Oct 2026 11:31:07 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] PCI/ASPM: Add pci_force_enable_link_state() API
Message-ID: <20261013163107.GA1522779@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1390db8-2369-9ab7-49a9-b7f09ef7b1ea@linux.intel.com>
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

On Tue, Oct 13, 2026 at 02:41:32PM +0300, Ilpo Järvinen wrote:
> On Mon, 12 Oct 2026, Bjorn Helgaas wrote:
> > On Wed, Jul 08, 2026 at 04:30:16PM +0200, Manivannan Sadhasivam wrote:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > 
> > > pci_enable_link_state() and pci_enable_link_state_locked() APIs only enable
> > > the ASPM states that were not previously disabled via
> > > pci_disable_link_state*() API or blacklisted during init (e.g. the pre-1.1
> > > device blacklist, which is only meant to be overridden with
> > > 'pcie_aspm=force'). This is an intentional behavior as these APIs must not
> > > silently re-enable states that were deliberately disabled, since doing so
> > > could enable ASPM on a link where it is known to be unsafe.
> > 
> > I think this is saying that many uses of pci_disable_link_state() are
> > to avoid hardware errata, i.e., these are basically quirks, and we
> > should *never* enable those ASPM states.
> > 
> > > However, some drivers (e.g. the atheros WLAN drivers) save the currently
> > > enabled ASPM states, disable all ASPM states before firmware download, and
> > > then try to restore exactly the states that were enabled before. Restoring
> > > those states requires re-enabling states that were just disabled via
> > > pci_disable_link_state() API. But, this cannot be achieved using the
> > > existing APIs.
> > 
> > This sounds like it's also for hardware errata: if ASPM works
> > correctly, there's no need to disable it during firmware download.  I
> > think this is *only* the atheros drivers, isn't it?  I didn't see any
> > others.
> 
> There are more that should use disable/enable API. In addition ath*, I had 
> also these in my unfinished series:
> 
>   brcmfmac
>   ib-hfi1
>   rtlwifi
>   rtsx
>   r8169

Thanks for those pointers!

> > > Hence, add pci_force_enable_link_state() API for such callers. Unlike
> > > pci_enable_link_state(), it re-enables the requested states even if they
> > > were previously disabled via pci_disable_link_state() or disabled during
> > > init. The caller is therefore responsible for only enabling states the
> > > device actually supports, typically the ones previously reported by
> > > pcie_aspm_enabled().
> > 
> > The problem is that pci_enable_link_state() cannot enable things that
> > were disabled by pci_disable_link_state().  They're not symmetric,
> > which violates the caller's expectation.
> 
> Yes.
> 
> This patch seems to come with my Suggested-by but what I suggested (and 
> had a patch for) was to make disable/enable proper symmetric pairs because 
> it is very trappy otherwise. If something else is needed in addition, that 
> should be named differently like Bjorn also seems to suggest (however see 
> my alternative suggestion below).
> 
> I renamed the current pci_enable_link_state() to 
> pci_set_default_link_state() in my own attempt to get room for adding the 
> symmetric pair.

We might need new names for pci_enable_link_state(),
pci_disable_link_state(), and the quirk thing.  If we keep the same
names, I think it will be pretty complicated to manage the changing
semantics when backporting driver changes that use them.

> > Instead of adding pci_force_enable_link_state(), I think we should add
> > a new interface for the *quirk* behavior that permanently disables
> > states.  Then pci_enable_link_state() and pci_disable_link_state()
> > could be made symmetric.
> 
> My suggestion is to make the disables/enables counted per state which 
> would allow parallel sources of disables to function without clashing.

By parallel sources, are you thinking of sysfs and driver calls?  If
locking would be sufficient I think that would end up being simpler.

But maybe the issue is these devices where we think ASPM breakage only
happens in certain circumstances, e.g., firmware download, so we want
to keep states disabled for that period.  Then I guess locking inside
the enable/disable doesn't prevent sysfs from enabling those states
during that period.

> Disable quirks could simply not have the pairing enable, no special 
> interface needed.

I'm not sure what this looks like to the caller.  A parameter that
says whether to count the disable?

I think having a different function name would be helpfully
descriptive because permanently removing an advertised capability is
different from temporarily disabling a feature.

Bjorn

