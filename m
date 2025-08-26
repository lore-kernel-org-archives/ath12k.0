Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1342FCA0FF0
	for <ath12k@archiver.kernel.org>; Tue, 26 Aug 2025 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqk0Qa3lcm2+kEraWeweypKOwasPiNdkrnTS4rdiBXg=; b=vYO77RxgICgDqR/B2MvQmyqFpg
	U48eM5IosiH8kE4YyiYQfPDipzdQ/MCQKy65M8ph/1SRb6UDMV6xYtQewqLidzxMTeC9tmq1fbv+z
	OY8ZFvnqMqMl5RKOIR9uIM1T2TbLXA6b1eiZfvfOgVs+GyLznfzaP6Q0V52j4IJbbzvDkbkV54W8z
	UZh9JItS5zuF9r+RRHSDsoVipKBEpLQe1Uzc4b6tlhYQg6tx3fq/I3szapoWbKNz6oBjJJjEeGFeR
	PF++mL16KJfY7oh+A+GNFsUS9MpB8/eSbK+nejFwLHqMCELEd0GHZV32zdJlkOjzeXiBd+of16dTD
	hf75u8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur19K-0000000DB95-2rht;
	Tue, 26 Aug 2025 21:24:14 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur19I-0000000DB8M-04DL;
	Tue, 26 Aug 2025 21:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756243452; x=1787779452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=l883/XMWp2sJPEUKA3Wy082jQu7V8ivTJMDHeeXauTU=;
  b=NYL8sVMMs+RmORetW0uiydzE5mu0MsMoDYBe62jDA6QJVmdSigoyll6l
   3UucUg/oYxx0NDlMjYS3c+arfcftUb7Gkq4KtQrnMe6lcHImq1uNPEKcc
   sFUGBvnAw70p6oqNHXjVwHc6BL0U1XSHxgZ8NRx/25jrHP36geDcl29ts
   bQDZLqirtkOhKU2xu3Y0qC1xaYMV/QE/T5vx7lFU6uQWzkJNYJ8SYFYD5
   U/9oyw68rJPOK31KpsRuc/dcOFaMkA6ku5zRrDpA02jw2iZziVq4ulZXu
   KXgEagc9i0ulCS9fdJpayxjLXpUFnOCm5UxfBFg0+KUBxgp/E/aOOBwmQ
   A==;
X-CSE-ConnectionGUID: 9S2vAxClSUm8PA/IxF6A3Q==
X-CSE-MsgGUID: X9r08t/kSCelUrdPlO+kPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58644687"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58644687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 14:24:08 -0700
X-CSE-ConnectionGUID: FL09nxxnRhaPH9mjGQ3DxQ==
X-CSE-MsgGUID: ojYl6mGmTkKBIEZtGn/+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200632650"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO localhost) ([10.124.223.116])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 14:24:07 -0700
Date: Tue, 26 Aug 2025 14:24:05 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/8] PCI/ASPM: Fix the behavior of
 pci_enable_link_state*() APIs
Message-ID: <qfw7nv53hmy6whxnf4zqfdtvjzkdxkvxn7eghuxzuuojmvxl34@sxw2jvxze4wm>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-2-61b2f2db7d89@oss.qualcomm.com>
 <f644fc83-31cc-1f0e-58cf-7c007e6173e4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f644fc83-31cc-1f0e-58cf-7c007e6173e4@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_142412_106127_D9BE6012 
X-CRM114-Status: GOOD (  42.02  )
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

On Tue, Aug 26, 2025 at 03:55:42PM +0300, Ilpo Järvinen wrote:
> +David
> 
> On Mon, 25 Aug 2025, Manivannan Sadhasivam via B4 Relay wrote:
> 
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > pci_enable_link_state() and pci_enable_link_state_locked() APIs are
> > supposed to be symmectric with pci_disable_link_state() and
> > pci_disable_link_state_locked() APIs.
> > 
> > But unfortunately, they are not symmetric. This behavior was mentioned in
> > the kernel-doc of these APIs:
> > 
> > " Clear and set the default device link state..."
> > 
> > and
> > 
> > "Also note that this does not enable states disabled by
> > pci_disable_link_state()"
> > 
> > These APIs won't enable all the states specified by the 'state' parameter,
> > but only enable the ones not previously disabled by the
> > pci_disable_link_state*() APIs. But this behavior doesn't align with the
> > naming of these APIs, as they give the impression that these APIs will
> > enable all the specified states.
> > 
> > To resolve this ambiguity, allow these APIs to enable the specified states,
> > regardeless of whether they were previously disabled or not. This is
> > accomplished by clearing the previously disabled states from the
> > 'link::aspm_disable' parameter in __pci_enable_link_state() helper. Also,
> > reword the kernel-doc to reflect this behavior.
> > 
> > The current callers of pci_enable_link_state_locked() APIs (vmd and
> > pcie-qcom) did not disable the ASPM states before calling this API. So it
> > is evident that they do not depend on the previous behavior of this API and
> > intend to enable all the specified states.
> 
> While it might be "safe" in the sense that ->aspm_disable is not set by 
> anything, I'm still not sure if overloading this function for two 
> different use cases is a good idea.
> 
> I'd like to hear David's opinion on this as he grasps the ->aspm_default 
> vs ->aspm_disable thing much better than I do.

The concern I see is that this would override the init-time blacklist which is
set in pcie_aspm_sanity_check() and only consulted during initialization.
__pci_disable_link_state() doesn't do this. It ORs in bits to aspm_disable.  By
contrast, this change would clear bits from aspm_disable in the enable path,
which allows ASPM to be enabled on links that pcie_aspm_sanity_check()
determined should be disabled.

But I noticed the sysfs path, aspm_attr_store_common(), already permits this
override. That may be unintentional though since the comment in
pcie_aspm_sanity_check() implies the blacklist can only be overridden with
pcie_aspm=force. At minimum, that needs to be clarified.

David

> 
> > And the other API, pci_enable_link_state() doesn't have a caller for now,
> > but will be used by the 'atheros' WLAN drivers in the subsequent commits.
> > 
> > Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> This tag sound like I'm endorsing this approach which is not the case. I'd 
> prefer separate functions for each use case, setting aspm_default and 
> another for the enable state.
> 
> -- 
>  i.
> 
> > Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/pci/pcie/aspm.c | 33 ++++++++++++++++++---------------
> >  1 file changed, 18 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > index be9bd272057c3472f3e31dc9568340b19d52012a..fac46113a90c7fac6c97125e6a7e385045780005 100644
> > --- a/drivers/pci/pcie/aspm.c
> > +++ b/drivers/pci/pcie/aspm.c
> > @@ -1459,6 +1459,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
> >  		down_read(&pci_bus_sem);
> >  	mutex_lock(&aspm_lock);
> >  	link->aspm_default = pci_calc_aspm_enable_mask(state);
> > +	link->aspm_disable &= ~state;
> >  	pcie_config_aspm_link(link, policy_to_aspm_state(link));
> >  
> >  	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;
> > @@ -1471,17 +1472,18 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
> >  }
> >  
> >  /**
> > - * pci_enable_link_state - Clear and set the default device link state so that
> > - * the link may be allowed to enter the specified states. Note that if the
> > - * BIOS didn't grant ASPM control to the OS, this does nothing because we can't
> > - * touch the LNKCTL register. Also note that this does not enable states
> > - * disabled by pci_disable_link_state(). Return 0 or a negative errno.
> > + * pci_enable_link_state - Enable device's link state
> > + * @pdev: PCI device
> > + * @state: Mask of ASPM link states to enable
> > + *
> > + * Enable device's link state, so the link will enter the specified states.
> > + * Note that if the BIOS didn't grant ASPM control to the OS, this does
> > + * nothing because we can't touch the LNKCTL register.
> >   *
> >   * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
> >   * PCIe r6.0, sec 5.5.4.
> >   *
> > - * @pdev: PCI device
> > - * @state: Mask of ASPM link states to enable
> > + * Return: 0 on success, a negative errno otherwise.
> >   */
> >  int pci_enable_link_state(struct pci_dev *pdev, int state)
> >  {
> > @@ -1490,19 +1492,20 @@ int pci_enable_link_state(struct pci_dev *pdev, int state)
> >  EXPORT_SYMBOL(pci_enable_link_state);
> >  
> >  /**
> > - * pci_enable_link_state_locked - Clear and set the default device link state
> > - * so that the link may be allowed to enter the specified states. Note that if
> > - * the BIOS didn't grant ASPM control to the OS, this does nothing because we
> > - * can't touch the LNKCTL register. Also note that this does not enable states
> > - * disabled by pci_disable_link_state(). Return 0 or a negative errno.
> > + * pci_enable_link_state_locked - Enable device's link state
> > + * @pdev: PCI device
> > + * @state: Mask of ASPM link states to enable
> > + *
> > + * Enable device's link state, so the link will enter the specified states.
> > + * Note that if the BIOS didn't grant ASPM control to the OS, this does
> > + * nothing because we can't touch the LNKCTL register.
> >   *
> >   * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
> >   * PCIe r6.0, sec 5.5.4.
> >   *
> > - * @pdev: PCI device
> > - * @state: Mask of ASPM link states to enable
> > - *
> >   * Context: Caller holds pci_bus_sem read lock.
> > + *
> > + * Return: 0 on success, a negative errno otherwise.
> >   */
> >  int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
> >  {
> > 
> > 


