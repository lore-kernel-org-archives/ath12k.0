Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F53C83F22
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 08:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olj9SVSYOMAee2ZNUVyTimcHAgnGvsKbMK91Ogrysx8=; b=hbR/xM0CefviexmE4b+Q73PnpM
	TSWpfPLqvGcHqlMsMoWCBoPv1IbOo1Lul/onRF5JEmyix6Z0xkKfUfwBB0zEziqmAevwq+3jxKml5
	QFRMBFOqUmXrjxji8LZP6Sj9t1AuKc1tnH0acFzvHLKEplcyvugP/DCMSl/td5xa6DtY2BFm6laGK
	kXqREoCJLrXCIDx2ueknC/5xK09bzpqt3xgF1sp+SGQs9jnZpm/y/RK8F4BpbVvZjVRYNHFW413W6
	f3rqZ9qjZw1ssQf8S5uF0o7i5kXYEuOew2hi6COARrxAjwF/q78GPD9lFYyDiKwzu4uad4GdgUJaL
	aYyX1lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucK3R-00000009a2z-0sQK;
	Thu, 17 Jul 2025 08:33:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJAA-00000009TGm-2foh;
	Thu, 17 Jul 2025 07:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9CE9601E7;
	Thu, 17 Jul 2025 07:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5176C4CEE3;
	Thu, 17 Jul 2025 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752737777;
	bh=hhhU4e4aqKE8PpZkiDXzguQPAKgEofaDpsLTegsHWz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JY6/41s4bMy5D4wwJjhvJZzgFBcooHC/UdvQVnxZHAwfUwdEjNWYkekFrsuR8xAb9
	 F3YhWBbgeP9ssrmp8DnS4maFzQ5Npt5gl9LFbvwkQF3YqHy+dbrKSLyxOJiejJmkol
	 FWy+Yaf3a/rialpN/MtQfwHiucFCVWo2BqdXGE3ZtTwOcjc8ptpWg9X3wI4ToSHEXW
	 pGaPbkxgv4T7L1Go7BuyB0MnqXPeR2H9L1vuppR6bNwg4goK+Ugx47k8pw2lbBNo4i
	 Jqedvh/Xon9tIqaDxtDBPsRsLxQECHWy+X3K6Ch5INn4tPAs1HO1Kal10ynNriUlMs
	 33amfuvbQ7hNA==
Date: Thu, 17 Jul 2025 13:06:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, Jonathan Derrick <jonathan.derrick@linux.dev>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath12k@lists.infradead.org, 
	ath11k@lists.infradead.org, ath10k@lists.infradead.org, ilpo.jarvinen@linux.intel.com, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] PCI/ASPM: Transition the device to D0 (if required)
 inside pci_enable_link_state_locked() API
Message-ID: <7o23kvvetjcohrucjhgkonrkkunykybce7q6tlfycbb6pafg4y@lpxvbepupemp>
References: <20250716-ath-aspm-fix-v1-2-dd3e62c1b692@oss.qualcomm.com>
 <20250716205601.GA2555277@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716205601.GA2555277@bhelgaas>
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

On Wed, Jul 16, 2025 at 03:56:01PM GMT, Bjorn Helgaas wrote:
> On Wed, Jul 16, 2025 at 06:26:21PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > Both of the current callers of the pci_enable_link_state_locked() API
> > transition the device to D0 before calling. This aligns with the PCIe spec
> > r6.0, sec 5.5.4:
> > 
> > "If setting either or both of the enable bits for PCI-PM L1 PM Substates,
> > both ports must be configured as described in this section while in D0."
> > 
> > But it looks redundant to let the callers transition the device to D0. So
> > move the logic inside the API and perform D0 transition only if the PCI-PM
> > L1 Substates are getting enabled.
> 
> > +++ b/drivers/pci/pcie/aspm.c
> > @@ -1474,13 +1474,20 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
> >   * Note that if the BIOS didn't grant ASPM control to the OS, this does
> >   * nothing because we can't touch the LNKCTL register.
> >   *
> > - * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
> > - * PCIe r6.0, sec 5.5.4.
> > + * Note: The device will be transitioned to D0 state if the PCI-PM L1 Substates
> > + * are getting enabled.
> >   *
> >   * Return: 0 on success, a negative errno otherwise.
> >   */
> >  int pci_enable_link_state(struct pci_dev *pdev, int state)
> >  {
> > +	/*
> > +	 * Ensure the device is in D0 before enabling PCI-PM L1 PM Substates, per
> > +	 * PCIe r6.0, sec 5.5.4.
> > +	 */
> > +	if (FIELD_GET(PCIE_LINK_STATE_L1_SS_PCIPM, state))
> > +		pci_set_power_state(pdev, PCI_D0);
> 
> This is really just a move, not new code, but this niggles at me a
> little bit because my impression is that pci_set_power_state() doesn't
> guarantee that the device *stays* in the given state.
> 
> Rafael, is there a get/put interface we should be wrapping this with
> instead?
> 

I don't quite understand this statement. A device cannot transition itself to
any D-states without host software intervention. So only host software should
intiate the transition. So are you saying that this API could be used by other
entities to change the device state? So you want to use some lock to prevent
callers from racing aganist each other?

I believe the current users of this API doesn't use any locks and just go by the
fact that the device stays in the give state. It does look racy, but seems to be
working fine so far. Obviously, the client driver need to ensure that it doesn't
create any race within itself. But the race could exist between the PCI core and
the driver theoretically.

> I'm also not sure it's worth the FIELD_GET().  This should be a
> low-frequency operation and making the power state dependent on the
> exact "state" makes more paths to worry about.
> 

Are you worrying about the usage of FIELD_GET() to check the ASPM state or the
existence of the check itself?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

