Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677D5CDB482
	for <ath12k@archiver.kernel.org>; Mon, 16 Oct 2023 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Jvq4vhfpSOB8wXl5Ov1tIjd5f8qeamebm8h3bFLuQA=; b=BoGq0FR6YeygvzkZeLOQPhkhv5
	Or2J0zaCWr2R0qNA/ici639KB95F9HfjhzptQncGQffI7CfY1wY9MFw7JDAjBwvkJLnqkEbGw3cjD
	xoj2ng4ZA2sS8eiDTkB0d8WlngM+Tz9lQm8ydMYCUq3Lz3bZXCGwrKA0Dtt3YySgD0j8EA4gpY6rm
	8oMTpZZyFm2YHxKM5G2DVN/Pf1GkLyx5IdyHOCgmSI3zRD4GbiboXWW6eTVYgUXeuCTrRWbf8S2eB
	qH0AABawC0/E4HvhmdibZDEPVKbkyw6ZmYiECpIzsOmPzjhqrn92v8vavIHhrrgsLKm+SapfVjHcG
	JPxfG3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN9q-009evT-0R
	for ath12k@archiver.kernel.org;
	Mon, 16 Oct 2023 12:57:18 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsN9m-009euW-1l;
	Mon, 16 Oct 2023 12:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697461035; x=1728997035;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=33VN831uWAKG7f4eIn44PpDJgWUV0McuEtJM+oSWIh4=;
  b=lp+N0iDegos1KqT0YHUk8zJeCMUF891HPeNecMLT7Z88naTNfHsSkcgx
   QxsDd2OdH3NF6sY33CXGJ4W+CGAtBN77FUNwqpiuOt87MfgdZkxRN9Bet
   RFydGD5hSKrn3dlXzv3QToJkFQYsOY3JgFlyLabT2FGG2lDaFscvR9Jkj
   +2CDwF9J9ZAqUy/r21UPBBeql4cOU2JxUlKDVIdLMrB+C5+Hszkz+1P5/
   ErO19JsuND5+5Y1ETsrzEzVJLcoUFVaRi7yVk5ahk0RznzNH82YU9Bn+H
   uRMz7/OESAn0Ioe7hyo4wV0qlPQZ/AMsLSvgfPGb32Xu+fssy3JVhbOQF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4130584"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4130584"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 05:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1087063948"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="1087063948"
Received: from rhaeussl-mobl.ger.corp.intel.com (HELO bhoerz-mobl1.ger.corp.intel.com) ([10.252.59.103])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 05:57:07 -0700
Date: Mon, 16 Oct 2023 15:57:05 +0300 (EEST)
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
In-Reply-To: <20231013164850.GA1118214@bhelgaas>
Message-ID: <9da430a3-9336-8e75-7385-3d5ddcb6cb7@linux.intel.com>
References: <20231013164850.GA1118214@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1750157713-1697461032=:1986"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_055714_652251_7F6BD44E 
X-CRM114-Status: GOOD (  43.65  )
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

--8323329-1750157713-1697461032=:1986
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 Oct 2023, Bjorn Helgaas wrote:

> On Thu, Oct 12, 2023 at 03:53:39PM +0300, Ilpo Järvinen wrote:
> > On Wed, 11 Oct 2023, Bjorn Helgaas wrote:
> > > On Mon, Sep 18, 2023 at 04:10:55PM +0300, Ilpo Järvinen wrote:
> > > > pci_disable_link_state() lacks a symmetric pair. Some drivers want to
> > > > disable ASPM during certain phases of their operation but then
> > > > re-enable it later on. If pci_disable_link_state() is made for the
> > > > device, there is currently no way to re-enable the states that were
> > > > disabled.
> > > 
> > > pci_disable_link_state() gives drivers a way to disable specified ASPM
> > > states using a bitmask (PCIE_LINK_STATE_L0S, PCIE_LINK_STATE_L1,
> > > PCIE_LINK_STATE_L1_1, etc), but IIUC the driver can't tell exactly
> > > what changed and can't directly restore the original state, e.g.,
> > > 
> > >   - PCIE_LINK_STATE_L1 enabled initially
> > >   - driver calls pci_disable_link_state(PCIE_LINK_STATE_L0S)
> > >   - driver calls pci_enable_link_state(PCIE_LINK_STATE_L0S)
> > >   - PCIE_LINK_STATE_L0S and PCIE_LINK_STATE_L1 are enabled now
> > > 
> > > Now PCIE_LINK_STATE_L0S is enabled even though it was not initially
> > > enabled.  Maybe that's what we want; I dunno.
> > > 
> > > pci_disable_link_state() currently returns success/failure, but only
> > > r8169 and mt76 even check, and only rtl_init_one() (r8169) has a
> > > non-trivial reason, so it's conceivable that it could return a bitmask
> > > instead.
> > 
> > It's great that you suggested this since it's actually what also I've been 
> > started to think should be done instead of this straightforward approach
> > I used in V2. 
> > 
> > That is, don't have the drivers to get anything directly from LNKCTL
> > but they should get everything through the API provided by the 
> > disable/enable calls which makes it easy for the driver to pass the same
> > value back into the enable call.
> > 
> > > > Add pci_enable_link_state() to remove ASPM states from the state
> > > > disable mask.
> > > > 
> > > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > > ---
> > > >  drivers/pci/pcie/aspm.c | 42 +++++++++++++++++++++++++++++++++++++++++
> > > >  include/linux/pci.h     |  2 ++
> > > >  2 files changed, 44 insertions(+)
> > > > 
> > > > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > > > index 91dc95aca90f..f45d18d47c20 100644
> > > > --- a/drivers/pci/pcie/aspm.c
> > > > +++ b/drivers/pci/pcie/aspm.c
> > > > @@ -1117,6 +1117,48 @@ int pci_disable_link_state(struct pci_dev *pdev, int state)
> > > >  }
> > > >  EXPORT_SYMBOL(pci_disable_link_state);
> > > >  
> > > > +/**
> > > > + * pci_enable_link_state - Re-enable device's link state
> > > > + * @pdev: PCI device
> > > > + * @state: ASPM link states to re-enable
> > > > + *
> > > > + * Enable device's link state that were previously disable so the link is
> > > 
> > > "state[s] that were previously disable[d]" alludes to the use case you
> > > have in mind, but I don't think it describes how this function
> > > actually works.  This function just makes it possible to enable the
> > > specified states.  The @state parameter may have nothing to do with
> > > any previously disabled states.
> > 
> > Yes, it's what I've been thinking between the lines. But I see your point 
> > that this API didn't make it easy/obvious as is.
> > 
> > Would you want me to enforce it too besides altering the API such that the 
> > states are actually returned from disable call? (I don't personally find
> > that necessary as long as the API pair itself makes it obvious what the 
> > driver is expect to pass there.)
> 
> This was just a comment about the doc not matching the function
> behavior.
> 
> I think we have to support pci_enable_link_state() even if the driver
> hasn't previously called pci_disable_link_state(), so drivers have to
> be able to specify the pci_enable_link_state() @state from scratch.
> 
> Does that answer the enforcement question?

Yes.

-- 
 i.

> I don't think we can
> really enforce anything other than that @state specifies valid ASPM
> states.
> 
> Bjorn
> 

--8323329-1750157713-1697461032=:1986
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

--8323329-1750157713-1697461032=:1986--

