Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E78C41513
	for <ath12k@archiver.kernel.org>; Thu, 12 Oct 2023 10:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7My+bXo/L+WXkN4jEfeAHCsYytSjPBkfeaCCzTXy6Eo=; b=qtOnbcLJw6r1c72baqT79WhS02
	DOtVxRp2Gzrogn4ehFsoHnnYkYEc8cFSOjawJfvBdl8nnuo5jIRqBJ8cnQMZYvBeWoUmDxOogJNTr
	8B5gfobeDP00eIQJLhe7L8WRajfIwZUnJA+NcAB+sfDDmqDdKC4LCtALgdhgChbKY9NlSpJbi0WCv
	/9598RB+1e+OwuvUFYZR2J9iCfG71satpdVwJnZqnhHouOcEl5V7OCMVPN/q/o7+wQecCIAbDE1Jk
	Xoqn3O0Rj0PhMSG2sfUUGPDSiNCLmdEN/+yNSpilrQR1cb0rVRFd9n9m9Sr4Hw7DYl9vkLSbyl0Fk
	E/CxXHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt19-000fsW-0R
	for ath12k@archiver.kernel.org;
	Thu, 12 Oct 2023 10:34:11 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt16-000frW-0B;
	Thu, 12 Oct 2023 10:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697106847; x=1728642847;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ji8x2F8u0U0ggxefEbWPL9IJWQlQGGYyAuJIBploLj8=;
  b=OE6l4ddimoxfTTVOsME1Ja2Z6eAVv26IaC2lwruRl14aUM5heMpEg3Ak
   CagCWlpu1rNj5EcUqEnMeR6UfLWfZUYY7YisY7dgi2dq06nUESQeOR9Cg
   F8Jw1MAY4NJsADNMSi4ulyPEN/QRxbEXf2RgxajbM7b/up7Omw3YXK8Ga
   6VP1raw8rj32AYbXTbu418+kyouaQvOIvycmIUllEfOIUxXzbb3hT1t2M
   oT5EJ8FUl6nWMFRWBX/0GzdjB1Ca1phtz4viwcSdJhpEBIh/4R1C+iW17
   llMvqFq3/KMza3RXFjbnA3+8HyAU/QrIQWu3tNKK5vHhd5RczzaxnwdxH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388748390"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="388748390"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 03:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870527710"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="870527710"
Received: from asroczyn-mobl.ger.corp.intel.com ([10.249.36.107])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 03:34:00 -0700
Date: Thu, 12 Oct 2023 13:29:49 +0300 (EEST)
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
Subject: Re: [PATCH v2 04/13] PCI/ASPM: Move L0S/L1/sub states mask calculation
 into a helper
In-Reply-To: <20231011193206.GA1039708@bhelgaas>
Message-ID: <bcecb577-bf69-e854-6f59-f4cb26c4b354@linux.intel.com>
References: <20231011193206.GA1039708@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1380828921-1697106845=:1692"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_033408_156430_889AE8E8 
X-CRM114-Status: GOOD (  23.16  )
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

--8323329-1380828921-1697106845=:1692
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 11 Oct 2023, Bjorn Helgaas wrote:

> On Mon, Sep 18, 2023 at 04:10:54PM +0300, Ilpo Järvinen wrote:
> > ASPM service driver does the same L0S / L1S / sub states allowed
> > calculation in __pci_disable_link_state() and
> > pci_set_default_link_state().
> 
> Is there a typo or something here?  This patch only adds a call to
> __pci_disable_link_state(), not to pci_set_default_link_state().

This was because one of the changes that got included in the meantime made 
the state handling in those two functions to differ so I removed the call 
from the code but forgot to update the changelog to match the code. I'll 
fix the changelog.

-- 
 i.


> > Create a helper to calculate the mask for the allowed states.
> > 
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  drivers/pci/pcie/aspm.c | 33 +++++++++++++++++++++------------
> >  1 file changed, 21 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > index ec6d7a092ac1..91dc95aca90f 100644
> > --- a/drivers/pci/pcie/aspm.c
> > +++ b/drivers/pci/pcie/aspm.c
> > @@ -1034,6 +1034,26 @@ static struct pcie_link_state *pcie_aspm_get_link(struct pci_dev *pdev)
> >  	return bridge->link_state;
> >  }
> >  
> > +static u8 pci_link_state_mask(int state)
> > +{
> > +	u8 result = 0;
> > +
> > +	if (state & PCIE_LINK_STATE_L0S)
> > +		result |= ASPM_STATE_L0S;
> > +	if (state & PCIE_LINK_STATE_L1)
> > +		result |= ASPM_STATE_L1;
> > +	if (state & PCIE_LINK_STATE_L1_1)
> > +		result |= ASPM_STATE_L1_1;
> > +	if (state & PCIE_LINK_STATE_L1_2)
> > +		result |= ASPM_STATE_L1_2;
> > +	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
> > +		result |= ASPM_STATE_L1_1_PCIPM;
> > +	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
> > +		result |= ASPM_STATE_L1_2_PCIPM;
> > +
> > +	return result;
> > +}
> > +
> >  static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
> >  {
> >  	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
> > @@ -1063,18 +1083,7 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
> >  	if (sem)
> >  		down_read(&pci_bus_sem);
> >  	mutex_lock(&aspm_lock);
> > -	if (state & PCIE_LINK_STATE_L0S)
> > -		link->aspm_disable |= ASPM_STATE_L0S;
> > -	if (state & PCIE_LINK_STATE_L1)
> > -		link->aspm_disable |= ASPM_STATE_L1;
> > -	if (state & PCIE_LINK_STATE_L1_1)
> > -		link->aspm_disable |= ASPM_STATE_L1_1;
> > -	if (state & PCIE_LINK_STATE_L1_2)
> > -		link->aspm_disable |= ASPM_STATE_L1_2;
> > -	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
> > -		link->aspm_disable |= ASPM_STATE_L1_1_PCIPM;
> > -	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
> > -		link->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
> > +	link->aspm_disable |= pci_link_state_mask(state);
> >  	pcie_config_aspm_link(link, policy_to_aspm_state(link));
> >  
> >  	if (state & PCIE_LINK_STATE_CLKPM)


--8323329-1380828921-1697106845=:1692
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

--8323329-1380828921-1697106845=:1692--

