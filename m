Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C66CD98CF
	for <ath12k@archiver.kernel.org>; Fri, 12 Jun 2026 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6XpxeIXcm0bcntaNBOITL3pX8sOGQ/dSwg/AQ/P7ms4=; b=N+BI5jV7G1d6RA
	mvgDzTk3Yt24jZb90aDLF/XkyGjY+l1IKROvYNVXzTlyojIdLM4kCJjwLtHc/kUIqOSR8EM2ccFIy
	TRPukzTmII1sXa0TGh3Y+5P6WJtGnHE4gtimbWLFCWU/7wLRxQS2dYu45YQCvid4vPKfMDtsbVJ7h
	Smb2D8UgH7IQhfEuY4ZEs7t0OiyUwA6joQp87oRhfaR4l4pR8itGpzALZfpDepP1daVAAWIsrrB1k
	GmaK34IzUCTM+dw1NLZNGKd2n2ef4G6FXzsQJbWf5kqygO1k/qu3fxoHs/Elm7ZwZtJEjqL+QYpbc
	jDLqpI7izfWrMxCD578A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3dp-0000000B94V-0uLu;
	Fri, 12 Jun 2026 15:17:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3dn-0000000B94I-49sq;
	Fri, 12 Jun 2026 15:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85B7142AAF;
	Fri, 12 Jun 2026 15:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F791F000E9;
	Fri, 12 Jun 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781277471;
	bh=6XpxeIXcm0bcntaNBOITL3pX8sOGQ/dSwg/AQ/P7ms4=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=fRS8UoxTBVb4rjGnYIwpI1u8mm+LKqLs/UKIe2+xv44fYHk8PoTevfj9MV/O1HD+H
	 OLVwNhdiVr/PDit8ZkqapCQ4Kd3HwfDtPOq7ldw4enMG9cH25buCz/2Fff5FHTdQQw
	 MeJRzZv4oKxo6RKAyS7nMh1vxIBPA8Ucxwv+Flv3qYlOYDd+Q1/fGxcovQKFqArt2T
	 WeuEJUALKmD7dJzVnz5ifVEnIIfmbTwxiCZyPwlt8v1CVvGgVy4tZL4k/7bd3sKNWD
	 tmwDmp62wqcZ6VKiLv4HGRhnGesNFX5jt5lm6HYOs60imYuOy3mRBvAKjmsuWzN+xU
	 tOR09zOWG5emw==
Date: Fri, 12 Jun 2026 10:17:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Alex Williamson <alex@shazbot.org>
Cc: bhelgaas@google.com, jjohnson@kernel.org, mani@kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <20260612151749.GA603817@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612142638.1243895-1-jtornosm@redhat.com>
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

[+to: Alex, VFIO resets]

On Fri, Jun 12, 2026 at 04:26:38PM +0200, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.

I guess "bus reset" here refers to Secondary Bus Reset being asserted
by the bridge upstream from these devices?  Seems a bit surprising if
that doesn't work.  Or is it just that we can't use SBR because there
are multiple devices below that bridge?

> The problem manifests in VFIO passthrough scenarios:
> 
> - WCN6855 WiFi card (17cb:1103): Normal VM operation works fine, including
>   clean shutdown/reboot. However, when the VM terminates uncleanly
>   (crash, force-off), VFIO attempts to reset the device before it can
>   be assigned to another VM. Without a working reset method, the device
>   remains in an undefined state, preventing reuse.

I don't know enough about VFIO, but I sort of expected that VFIO would
reset devices between reassignment regardless of how a VM terminates.
I guess that's not true?

> - WCN7850 WiFi card (17cb:1107): Same behavior as WCN6855.
> 
> - SDX62/SDX65 5G modems (17cb:0308): Never successfully initialize even
>   on first VM assignment without proper reset capability.
> 
> Add device-specific reset entries for these Qualcomm devices using D3hot
> power cycling. Testing shows that despite advertising NoSoftRst+, D3hot
> transition provides sufficient reset for VFIO reuse, particularly after
> unexpected VM termination. While not a complete reset (BARs preserved),
> it provides the only viable reset mechanism for these devices.

Since the device claims to preserve internal state across D3hot->D0
(and it sounds like at least BARs *are* preserved), is this a
potential leak of state between VMs?  To play devil's advocate, how do
we convince a customer that none of their data is ever leaked to a
subsequent tenant using this device?

> Testing was performed on desktop platforms with M.2 WiFi and modem cards
> using M.2-to-PCIe adapters, including extensive force-reset cycling to
> verify stability.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v9:
>   - Complete redesign based on maintainer feedback (Alex Williamson, Bjorn
>     Helgaas, Rafael Wysocki): dropped general d3cold infrastructure entirely
>     and now just a single patch: the proven D3hot reset for specific
>     Qualcomm devices (device-specific reset)
>   - Previous v8 patch 1/3 (general d3cold) dropped: concerns about ACPI
>     portability, bridge issues, runtime PM, and lack of _PR3 hardware for
>     testing.
>   - Previous v8 patch 3/3 (quirk_no_bus_reset) already merged for v7.2
> v8: https://lore.kernel.org/all/20260609163649.319755-1-jtornosm@redhat.com/
> 
>  drivers/pci/quirks.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 431c021d7414..bac1edb6c2dc 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -4240,6 +4240,41 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>  	return 0;
>  }
>  
> +/*
> + * Device-specific reset method for certain Qualcomm devices via D3hot power
> + * cycle.
> + *
> + * These specific Qualcomm devices lack FLR capability, advertise NoSoftRst+
> + * (blocking PM reset), and have broken bus reset. Despite advertising
> + * NoSoftRst+, testing shows that D3hot transition provides sufficient reset
> + * for VFIO reuse, particularly after unexpected VM termination where the
> + * device would otherwise remain in an undefined state. While not a complete
> + * reset (BARs are preserved), it provides the only viable reset mechanism for
> + * these devices in the commented situations.
> + */
> +static int reset_qualcomm_d3hot(struct pci_dev *dev, bool probe)
> +{
> +	int ret;
> +
> +	if (probe)
> +		return 0;
> +
> +	if (dev->current_state != PCI_D0)
> +		return -EINVAL;
> +
> +	ret = pci_set_power_state(dev, PCI_D3hot);
> +	if (ret)
> +		return ret;
> +	msleep(200);
> +
> +	ret = pci_set_power_state(dev, PCI_D0);
> +	if (ret)
> +		return ret;
> +	msleep(200);
> +
> +	return 0;

If we think this is a viable method, it seems like we should use
pci_pm_reset(), which takes care of IOMMU and device readiness issues.

We would have to change pci_pm_reset() to deal with the fact that
PCI_PM_CTRL_NO_SOFT_RESET seems wrong on these devices.  Maybe we
could cache PCI_PM_CTRL_NO_SOFT_RESET in pci_pm_init(), then override
it with quirks for these devices?

> +}
> +
>  static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82599_SFP_VF,
>  		 reset_intel_82599_sfp_virtfn },
> @@ -4255,6 +4290,9 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  		reset_chelsio_generic_dev },
>  	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
>  		reset_hinic_vf_dev },
> +	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_qualcomm_d3hot },  /* WCN6855 */
> +	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_qualcomm_d3hot },  /* WCN7850 */
> +	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_qualcomm_d3hot },  /* SDX62/SDX65 */
>  	{ 0 }
>  };
>  
> -- 
> 2.54.0
> 

