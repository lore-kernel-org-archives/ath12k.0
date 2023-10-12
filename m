Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3025ACDB46E
	for <ath12k@archiver.kernel.org>; Thu, 12 Oct 2023 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sn47WvHrEyWpVv4FYQvSfam8ay+Bd9DBQVJRv1TEpGk=; b=AL6Ax7TUa6WAXFd1mkb0zMdBT5
	K+Mh4YKMG8e98iNZ8OO2spSE4u2EfaeNTtwI0QdPJhLjK15ShJ9pJSrnFWdRXjq7tzTVnNEDLpgMh
	gV123xjkgDhd9d8mJaUk0wWFcW8SVtSGDySB8FrYIgNUhyUp3ZNHnzte4P4SLkD22Rf9DCntf2lMP
	shRqD2dLAOhgUCbk+Jw6ZtKVNevHNr8I9CS2OQeFfsTjUPj+vIR3KlayWhi7L9ksKqyL6+KEcorCz
	te3RC+ZMm2eyu2wvoTIQfUfftQagZdA3efXFTbVqlNxx0z+iJxvlGFoZqBdFKKc2aAu8Orzpjahoi
	iGQgAuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvCK-0010jl-2X
	for ath12k@archiver.kernel.org;
	Thu, 12 Oct 2023 12:53:52 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvCG-0010i1-1s;
	Thu, 12 Oct 2023 12:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697115228; x=1728651228;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gNLNaEec64/5yPf43OhzXjxJ+9f0AwPObPN0gw90rTk=;
  b=l+KzQ3z0GQLCht0HmiqacGHhpEMtgMdO5q2rCnYomL1KYTbxShJs0zUa
   h+5o6jAsOs+jcq4yjmFn8OSsA32I1f3sJkuU1HRuXCYN5UuydAY9XG+/q
   g0o+icxIaCOEvmOZZMxknHpiWRX0Q5REJadAkofO8zObSG4VZiH62DSXy
   m2bSH2+oxjYLfCv+pw6oaYnN2ZEjXRiZ2/JgSD8lKbQotF9S5OxMN0ZUW
   00I3A5HGJIyt6s6j/8RrfxItDzCe3TktTjcLmigG8xsXsaEL/fPaMvgHT
   c+TViZ8cVXQV9X+EnUTGszKKj7QFRmxEULFp+thRjtCO3VzY0SwpSBlBF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471169653"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="471169653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 05:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783688889"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783688889"
Received: from asroczyn-mobl.ger.corp.intel.com ([10.249.36.107])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 05:53:41 -0700
Date: Thu, 12 Oct 2023 15:53:39 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    Rob Herring <robh@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Lukas Wunner <lukas@wunner.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
    Heiner Kallweit <hkallweit1@gmail.com>, 
    Emmanuel Grumbach <emmanuel.grumbach@intel.com>, 
    LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
    ath12k@lists.infradead.org, intel-wired-lan@lists.osuosl.org, 
    linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org, 
    linux-wireless@vger.kernel.org, Netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 05/13] PCI/ASPM: Add pci_enable_link_state()
In-Reply-To: <20231011215327.GA1043654@bhelgaas>
Message-ID: <afb4db5-5fe1-9f5d-a910-032adf195c@linux.intel.com>
References: <20231011215327.GA1043654@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1586418908-1697115226=:1692"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_055348_678866_24D31BB7 
X-CRM114-Status: GOOD (  29.48  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1586418908-1697115226=:1692
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 11 Oct 2023, Bjorn Helgaas wrote:

> On Mon, Sep 18, 2023 at 04:10:55PM +0300, Ilpo Järvinen wrote:
> > pci_disable_link_state() lacks a symmetric pair. Some drivers want to
> > disable ASPM during certain phases of their operation but then
> > re-enable it later on. If pci_disable_link_state() is made for the
> > device, there is currently no way to re-enable the states that were
> > disabled.
> 
> pci_disable_link_state() gives drivers a way to disable specified ASPM
> states using a bitmask (PCIE_LINK_STATE_L0S, PCIE_LINK_STATE_L1,
> PCIE_LINK_STATE_L1_1, etc), but IIUC the driver can't tell exactly
> what changed and can't directly restore the original state, e.g.,
> 
>   - PCIE_LINK_STATE_L1 enabled initially
>   - driver calls pci_disable_link_state(PCIE_LINK_STATE_L0S)
>   - driver calls pci_enable_link_state(PCIE_LINK_STATE_L0S)
>   - PCIE_LINK_STATE_L0S and PCIE_LINK_STATE_L1 are enabled now
> 
> Now PCIE_LINK_STATE_L0S is enabled even though it was not initially
> enabled.  Maybe that's what we want; I dunno.
> 
> pci_disable_link_state() currently returns success/failure, but only
> r8169 and mt76 even check, and only rtl_init_one() (r8169) has a
> non-trivial reason, so it's conceivable that it could return a bitmask
> instead.

It's great that you suggested this since it's actually what also I've been 
started to think should be done instead of this straightforward approach
I used in V2. 

That is, don't have the drivers to get anything directly from LNKCTL
but they should get everything through the API provided by the 
disable/enable calls which makes it easy for the driver to pass the same
value back into the enable call.

> > Add pci_enable_link_state() to remove ASPM states from the state
> > disable mask.
> > 
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  drivers/pci/pcie/aspm.c | 42 +++++++++++++++++++++++++++++++++++++++++
> >  include/linux/pci.h     |  2 ++
> >  2 files changed, 44 insertions(+)
> > 
> > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > index 91dc95aca90f..f45d18d47c20 100644
> > --- a/drivers/pci/pcie/aspm.c
> > +++ b/drivers/pci/pcie/aspm.c
> > @@ -1117,6 +1117,48 @@ int pci_disable_link_state(struct pci_dev *pdev, int state)
> >  }
> >  EXPORT_SYMBOL(pci_disable_link_state);
> >  
> > +/**
> > + * pci_enable_link_state - Re-enable device's link state
> > + * @pdev: PCI device
> > + * @state: ASPM link states to re-enable
> > + *
> > + * Enable device's link state that were previously disable so the link is
> 
> "state[s] that were previously disable[d]" alludes to the use case you
> have in mind, but I don't think it describes how this function
> actually works.  This function just makes it possible to enable the
> specified states.  The @state parameter may have nothing to do with
> any previously disabled states.

Yes, it's what I've been thinking between the lines. But I see your point 
that this API didn't make it easy/obvious as is.

Would you want me to enforce it too besides altering the API such that the 
states are actually returned from disable call? (I don't personally find
that necessary as long as the API pair itself makes it obvious what the 
driver is expect to pass there.)


-- 
 i.

--8323329-1586418908-1697115226=:1692
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

--8323329-1586418908-1697115226=:1692--

