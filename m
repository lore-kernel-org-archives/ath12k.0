Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6014CDE000
	for <ath12k@archiver.kernel.org>; Thu, 25 Jun 2026 13:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SybMIkwobe3FEtfhKnM3aPAHyhkZL+tIP9Fxj1kdDsA=; b=TY3xPjqN02xRyJh6Ke8ghZ0nvI
	wVHMFb1pUcYBN3uZXt5iri5XQPK/qqcg24JVFlM6cSuJv+7cZyu1uTeK1NAIgxqjNityEZhwh21qe
	o/sl5LOctOgxXF6pqvzwBwyp1ounjU5ZHrL+zZNUHuG3036VgHwV6DHz7BwvVK7F8GLsQaje1UYhO
	5t05WbLLLPR1ZqBbL11uIshvHF90yTNvFZcY3BXW3i6vnfBb2wCe7zT6y67KAgqGsVruYzAG8m48v
	ValuRIFcgAcilnwpmx1pVtJb4maWiTaeXSAS5w5c4n5k2WvRrDarkZ8c6AL0RomGcmT/QsH8wSo/u
	7szQ4nbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcjjt-00000009DaZ-3i4U;
	Thu, 25 Jun 2026 13:03:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcjjs-00000009DaI-1cZx;
	Thu, 25 Jun 2026 13:03:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E8A9600FC;
	Thu, 25 Jun 2026 13:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2484C1F00A3A;
	Thu, 25 Jun 2026 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782392607;
	bh=SybMIkwobe3FEtfhKnM3aPAHyhkZL+tIP9Fxj1kdDsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gqj3yzK4p4I20bQEslq4B9XPtyWmj/LBb8p9OCRJqluJlsVlvwV+GSFoRutXaT0tn
	 v0gI4mb/+S/oFwnRNP9rWqAxJgxz3HPYKsl5oH1aXWYme74K8vFyeVKUja/46Su8nf
	 LzYEGoAhrfntFe7RUvUlu5EQoCB968Mn6iJsP/5w/0cvsDruqSNjvSO1sexEqpK2AP
	 LqIYyvbxMQqG/6671hgFh2kYb1Z6Wh7h9hKcf0A5vexTvXYJ3sp/+vRNBQWV39VBx/
	 uV6HbPahnHGAVgqjgR9ovlbTpC4Sw4F/yVyQyZembfV3XbvAkbIFvx92XyjRVJ8oDO
	 vvPYYPqlyx4aw==
Date: Thu, 25 Jun 2026 15:03:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, 
	bhelgaas@google.com, alex@shazbot.org, jjohnson@kernel.org, linux-pci@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10] Add device-specific reset for Qualcomm devices
Message-ID: <l3pcelhxn46p4smkkg5yob5enf4d4garp2p6macopnq5h2gwyf@zbbn65k4tz2q>
References: <20260623183115.1585273-1-jtornosm@redhat.com>
 <4cdfb71b-2ef8-4985-8294-c4a29e37faa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cdfb71b-2ef8-4985-8294-c4a29e37faa3@oss.qualcomm.com>
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

On Wed, Jun 24, 2026 at 03:47:12PM +0800, Baochen Qiang wrote:
> 
> 
> On 6/24/2026 2:31 AM, Jose Ignacio Tornos Martinez wrote:
> > Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
> > lack working reset methods for VFIO passthrough scenarios. These devices
> > have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> > broken bus reset.
> > 
> > The problem manifests in VFIO passthrough scenarios:
> > 
> > - WCN6855 (17cb:1103) and WCN7850 (17cb:1107) WiFi devices:
> >   Normal VM operation works fine, including clean shutdown/reboot.
> >   However, when the VM terminates uncleanly (crash, force-off), VFIO
> >   attempts to reset the device before it can be assigned to another VM.
> >   Without a working reset method, the device remains in an undefined state,
> >   preventing reuse.
> > 
> > - SDX62/SDX65 (17cb:0308) 5G modems: Never successfully initialize even
> >   on first VM assignment without proper reset capability.
> > 
> > Add device-specific reset methods using BAR-space hardware reset registers
> > that exist in these devices:
> > 
> > - WCN6855/WCN7850 WiFi devices use SoC global reset via BAR0 (sequence from
> >   ath11k/ath12k driver: ath11k_pci_soc_global_reset(), ath11k_pci_sw_reset(),
> >   ath11k_mhi_set_mhictrl_reset()):
> >   - Write/clear reset bit at offset 0x3008
> >   - Wait for PCIe link recovery (up to 5 seconds)
> >   - Clear MHI controller SYSERR status at offset 0x38
> > 
> > - SDX62/SDX65 modem devices use MHI SoC reset via BAR0 (sequence from MHI
> >   driver: mhi_soc_reset(), mhi_pci_reset_prepare()):
> >   - Write reset request to offset 0xb0
> >   - Wait 2 seconds for reset completion
> > 
> > These are true hardware reset mechanisms (not power management or firmware
> > error recovery), providing proper device reset for VFIO scenarios.
> > 
> > Testing was performed on desktop platforms with M.2 WiFi and modem cards
> > using M.2-to-PCIe adapters, including extensive force-reset cycling to
> > verify stability.
> > 
> > Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> > ---
> > v10:
> >   - Complete redesign based on maintainer feedback (Manivannan Sadhasivam,
> >     Alex Williamson): use actual hardware reset registers from
> >     device drivers instead of D3hot power cycling
> > v9: https://lore.kernel.org/all/20260612142638.1243895-1-jtornosm@redhat.com/
> > 
> >  drivers/pci/quirks.c | 118 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 118 insertions(+)
> > 
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 431c021d7414..8ad3f214e520 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -4240,6 +4240,121 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
> >  	return 0;
> >  }
> >  
> > +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET	0x3008
> > +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V	BIT(0)
> > +#define QUALCOMM_WIFI_MHISTATUS			0x48
> > +#define QUALCOMM_WIFI_MHICTRL			0x38
> > +#define QUALCOMM_WIFI_MHICTRL_RESET_MASK	0x2
> > +
> > +/*
> > + * Qualcomm WiFi device-specific reset using SoC global reset via BAR0
> > + * registers.
> > + */
> > +static int reset_qualcomm_wifi(struct pci_dev *pdev, bool probe)
> > +{
> > +	bool link_recovered = false;
> > +	unsigned long timeout;
> > +	void __iomem *bar;
> > +	u32 val;
> > +	u16 cmd;
> > +
> > +	if (probe)
> > +		return 0;
> > +
> > +	if (pdev->current_state != PCI_D0)
> > +		return -EINVAL;
> > +
> > +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> > +	pci_write_config_word(pdev, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
> > +
> > +	bar = pci_iomap(pdev, 0, 0);
> > +	if (!bar) {
> > +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
> > +		return -ENODEV;
> > +	}
> > +
> > +	val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> 
> QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET is beyond the first 4K bar area hence requires MHI
> wakeup before accessing, see [1]. the wakeup callback for WCN6855 is
> ath11k_pci_bus_wake_up() which calls mhi_device_get_sync(). Not sure how this can be done
> here. Maybe Mani can provide some hints?
> 

I don't think the device needs to be waken up before
QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET. ath11k driver wakes up the device for
accessing the MHI interface I believe. Since this callback is not touching MHI,
there is no need to wakeup the device, AFAIK.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

