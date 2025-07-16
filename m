Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8416BC83F1B
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Va38Os5l2iER9a5LgFeigdbGSeCwflTlGTgfgC9gKrY=; b=UYrrAPLYmGHDrw
	A/19WbZT4ylqhtTbCbdK3aHGWrGpbN4J2gcFMbKQ9PbnQ9Ef+8SVOM1UNVCyq3wUd7jN78/anSxSs
	/hN4AlAApzzAsmlK3ILy5ov99/aiIsEOxaTdCa1ZCNRKdwjCGe9/vU05FMFVFn7YGnZcXVvPWVqls
	kTCZArcadSz/rjRNS9VnlXv0MBzkYOluO9yWqFlxe3dlkhF/CMLYaJl/m3VkXYr2VDSYHtLv7cCgY
	VT99kIOeCvEzrLYuvBZme0BGnir+pWSSSBPMpg912Q16nMQY0EoQTQGfm38BA5qbYhpuhdUPYTghv
	ctUjOQcZfxdbomDJvdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9OD-00000008g0L-15Ov;
	Wed, 16 Jul 2025 21:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Aa-00000008eCO-0VMJ;
	Wed, 16 Jul 2025 20:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61866436FB;
	Wed, 16 Jul 2025 20:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1039DC4CEF1;
	Wed, 16 Jul 2025 20:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752699363;
	bh=1eT1bU8K2ROCVSdByZdiqCJahWUYakFk0s/KHQHgDy0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Hs7DDZT5y7ghwrrP2RoLIPD/uvZHmLasbXo2TT4fFIO7edIcBrZV86BNmu6s52Pe2
	 GiXm1OSTqbaMlmfNhVJedqxHISA/wrhm2gLbzV7c7jkbfhFiiuLC38tyjBoPUYv2SI
	 c5gN69aqyBcZ6IX7zJxosf4QmOf4AUeQH4BAUNjE40OTOLWHCIupvCvIgEVG53phaI
	 VPoNle4itK3nDgSes+CYKnpEt2/l5BSdcMpFIOkTJ5n6dtkhB5pcJHezOQoRMlgkK5
	 GMrfGRzeI23y1uUdJ81ubwpBoYxkrOfhRw2XxAwcTjK+nQQwp+gBPd1oL5R7lGcE7f
	 CdHEgEcAb4nag==
Date: Wed, 16 Jul 2025 15:56:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org, ath11k@lists.infradead.org,
	ath10k@lists.infradead.org, ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] PCI/ASPM: Transition the device to D0 (if required)
 inside pci_enable_link_state_locked() API
Message-ID: <20250716205601.GA2555277@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-ath-aspm-fix-v1-2-dd3e62c1b692@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_135604_201092_0EB37F42 
X-CRM114-Status: GOOD (  17.37  )
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

On Wed, Jul 16, 2025 at 06:26:21PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Both of the current callers of the pci_enable_link_state_locked() API
> transition the device to D0 before calling. This aligns with the PCIe spec
> r6.0, sec 5.5.4:
> 
> "If setting either or both of the enable bits for PCI-PM L1 PM Substates,
> both ports must be configured as described in this section while in D0."
> 
> But it looks redundant to let the callers transition the device to D0. So
> move the logic inside the API and perform D0 transition only if the PCI-PM
> L1 Substates are getting enabled.

> +++ b/drivers/pci/pcie/aspm.c
> @@ -1474,13 +1474,20 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
>   * Note that if the BIOS didn't grant ASPM control to the OS, this does
>   * nothing because we can't touch the LNKCTL register.
>   *
> - * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
> - * PCIe r6.0, sec 5.5.4.
> + * Note: The device will be transitioned to D0 state if the PCI-PM L1 Substates
> + * are getting enabled.
>   *
>   * Return: 0 on success, a negative errno otherwise.
>   */
>  int pci_enable_link_state(struct pci_dev *pdev, int state)
>  {
> +	/*
> +	 * Ensure the device is in D0 before enabling PCI-PM L1 PM Substates, per
> +	 * PCIe r6.0, sec 5.5.4.
> +	 */
> +	if (FIELD_GET(PCIE_LINK_STATE_L1_SS_PCIPM, state))
> +		pci_set_power_state(pdev, PCI_D0);

This is really just a move, not new code, but this niggles at me a
little bit because my impression is that pci_set_power_state() doesn't
guarantee that the device *stays* in the given state.

Rafael, is there a get/put interface we should be wrapping this with
instead?

I'm also not sure it's worth the FIELD_GET().  This should be a
low-frequency operation and making the power state dependent on the
exact "state" makes more paths to worry about.

>  	return __pci_enable_link_state(pdev, state, false);
>  }

