Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A108CD98C7
	for <ath12k@archiver.kernel.org>; Wed, 10 Jun 2026 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xnrO31LLlSXPRgDvDd03PEdMDaXIr+aCbScw5GFqWuU=; b=yePx6bFwSTyTK3
	wSXuL3qDMJfrINiJQh845sRJqh3lidNsza9tfLokTmPUvVdYctlSDli5aLny6+5JZvBYRC1z14lhj
	0pzRl30IGFhHaXZ+TU3rSmZIl6uwTNEvYDPZsUkXni6tiTz1PuF4s6XUJydTVAJQNd/vMUQW+QqP/
	OGo7HXfJC8z84VZibrjXEix1I8P9+YYHIbRDvht+GbQf7jlSqs7GAuR2pW0fGbgir5XIMdZczvE8G
	oMZVJVLGLlRpvVBc17zg2swpx5olkWzG1tYFr6Led/ydfUWV/3nL0VahypXwUYTp+dShSure07rzh
	Avd0Z+o+UzJv9VTlBWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXNsv-00000008F5y-3NIy;
	Wed, 10 Jun 2026 18:42:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXNst-00000008F5l-2cUN;
	Wed, 10 Jun 2026 18:42:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A5613600AF;
	Wed, 10 Jun 2026 18:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2812E1F00893;
	Wed, 10 Jun 2026 18:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781116958;
	bh=xnrO31LLlSXPRgDvDd03PEdMDaXIr+aCbScw5GFqWuU=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=gpyZegFrsmlQCERexafvFL8huHGeATz3YXutJXCy3MFp08VXEsP/Tx8O3Hp3qUhlp
	 HNY4ULM+9Sx/MlKcfrKbjfVKXQNpZs5FX5JNUbwrvgyPjDRXjHryZKNDe76hI0JVIE
	 jUYTffFgdsfo8plKCaZPsVlldj2JtoqJHMO5ecLfUs5gZvlZ0U/GMBLuv/MUY1F4X4
	 xFkQbfBYV1bDTRz54GDZxSuOFTlGMPIGRmHEaBUVUHB9/U8hg6djZB95N7AKe0FvqM
	 0DB/0stigbLyXUHWSulkgaf03pnMZjUnOpieehIb6JBD3KpCyHqF6DPyjw5msHmrIq
	 YgDuFmUZxz2SA==
Date: Wed, 10 Jun 2026 13:42:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, alex@shazbot.org, jjohnson@kernel.org,
	mani@kernel.org, linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 1/3] PCI: Add d3cold as general reset method
Message-ID: <20260610184236.GA236984@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603105853.326290-2-jtornosm@redhat.com>
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

[+cc linux-pm]

On Wed, Jun 03, 2026 at 12:58:51PM +0200, Jose Ignacio Tornos Martinez wrote:
> Add D3cold power cycle as a general PCI reset method for single-function
> devices on platforms with ACPI _PR3 power resources. This provides true
> power cycle reset capability when the platform can physically cut power
> to the device.
> 
> The implementation strictly requires _PR3 to be present - the platform
> must be able to control device power. This ensures d3cold only attempts
> true power cycling, not falling back to D3hot transitions.
> 
> D3cold reset is placed at the end of the reset hierarchy since it requires
> specific platform support and should be tried after standard methods.
> 
> Reset hierarchy with this change:
> 1. device_specific
> 2. acpi
> 3. flr
> 4. af_flr
> 5. pm (D3hot via config space, checks NoSoftRst)
> 6. bus (SBR)
> 7. cxl_bus
> 8. d3cold (NEW - true power cycle, requires _PR3)
> 
> This benefits:
> - Platforms with _PR3 support
> - Single-function devices needing true power cycle
> - VFIO passthrough scenarios where FLR/PM unavailable

I assume you have some specific device(s) in mind here; can we mention
any examples so this is more than just theoretically useful?

> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> v7: code unchanged from v6
> v6: https://lore.kernel.org/all/20260602160024.1171949-2-jtornosm@redhat.com/
> 
>  drivers/pci/pci.c   | 50 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci.h |  2 +-
>  2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8f7cfcc00090..096868f80cd4 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4491,6 +4491,55 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
>  	return ret;
>  }
>  
> +/**
> + * pci_d3cold_reset - Put device into D3cold and back to D0 for reset
> + * @dev: PCI device to reset
> + * @probe: if true, check if D3cold reset is supported; if false, perform reset
> + *
> + * Reset the device by transitioning through D3cold (actual power removal via
> + * platform power control) and back to D0. This requires ACPI _PR3 power
> + * resources to be present - the platform must be able to physically cut power
> + * to the device.
> + *
> + * Only available for single-function devices to avoid affecting other
> + * functions in multi-function devices.
> + *
> + * Returns 0 if device can be/was reset this way, -ENOTTY if not supported,
> + * or other negative error code on failure.
> + */
> +static int pci_d3cold_reset(struct pci_dev *dev, bool probe)
> +{
> +	int ret;
> +
> +	if (dev->multifunction)
> +		return -ENOTTY;
> +
> +	if (!pci_pr3_present(dev))
> +		return -ENOTTY;

platform_pci_set_power_state() is currently only implemented for MID
and ACPI, but we're starting to see DT systems with power control for
devices, so I assume it may someday be extended to support them.

Checking pci_pr3_present() seems wrong to me because it assumes ACPI.  

On ACPI systems, it seems like pci_set_power_state(PCI_D3cold) should
return an error if the necessary ACPI methods are not present, and we
wouldn't need this check.  Is that not the case?

Or is this _PR3 check here just to support the "probe"?  I don't know
if there's a generic interface to tell us whether we can control the
power to a device.

> +	if (probe)
> +		return 0;
> +
> +	if (dev->current_state != PCI_D0)
> +		return -EINVAL;
> +
> +	ret = pci_dev_reset_iommu_prepare(dev);
> +	if (ret) {
> +		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = pci_set_power_state(dev, PCI_D3cold);
> +	if (ret)
> +		goto done;
> +
> +	ret = pci_set_power_state(dev, PCI_D0);
> +
> +done:
> +	pci_dev_reset_iommu_done(dev);
> +	return ret;
> +}
> +
>  /**
>   * pcie_wait_for_link_status - Wait for link status change
>   * @pdev: Device whose link to wait for.
> @@ -5065,6 +5114,7 @@ const struct pci_reset_fn_method pci_reset_fn_methods[] = {
>  	{ pci_pm_reset, .name = "pm" },
>  	{ pci_reset_bus_function, .name = "bus" },
>  	{ cxl_reset_bus_function, .name = "cxl_bus" },
> +	{ pci_d3cold_reset, .name = "d3cold" },
>  };
>  
>  /**
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 2c4454583c11..1ca7b880ead7 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -51,7 +51,7 @@
>  			       PCI_STATUS_PARITY)
>  
>  /* Number of reset methods used in pci_reset_fn_methods array in pci.c */
> -#define PCI_NUM_RESET_METHODS 8
> +#define PCI_NUM_RESET_METHODS 9
>  
>  #define PCI_RESET_PROBE		true
>  #define PCI_RESET_DO_RESET	false
> -- 
> 2.54.0
> 

