Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C362C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMagSuV/KEPQnZY+XS5s3kJW3BcH6iR0+wLbzdgK2X0=; b=1U3tELHKehOHuLI6ipulGCYVCs
	Utq6YFrBL+XkAvyayOdCRK3WcRi+A2iNNgoBeozQA/Zc5uGinfUVQlqmw8HJIg7XESyKXnOmkVlFl
	RuykMSv8M2EoAOYEmN2Jwr7DO9EePmLklw6JkXMbVpHgtNE26T53qGwWH0fjZEiyGPI/cS7ACsU+H
	eRgJHhC9nRdrZKvyNwLs6Faks2VaxN5yHBXsSdFcEU0iYP1oMfAEzsRcKbm/VRDX923jtsdH94FqU
	dOQSjWu0pNYgUV1KUgExYVW3LoJxkpc/HWUkILzVMo90y5UcouAXpkBR33vVyBNsX9SlMqdnRlKV1
	2PldGOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEQd-0000000F9SV-3FQe;
	Mon, 29 Jun 2026 16:01:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEQb-0000000F9SA-3n9w;
	Mon, 29 Jun 2026 16:01:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FD2E434CD;
	Mon, 29 Jun 2026 16:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780AD1F000E9;
	Mon, 29 Jun 2026 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782748905;
	bh=ZMagSuV/KEPQnZY+XS5s3kJW3BcH6iR0+wLbzdgK2X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NmwCUn9fNzlLN6RHJFD4f7AaI7M+siGWgaA6KKEP8+YaHgbCT8Eo8ua71Hrl3tsBb
	 EpcinpRLb8K5+ZYGfFCrfm7EX5pUXhwd2BSqPwDcPUh64Nk5R6nFyv7fw9tmx/PWoa
	 s69IS3QurF0gsSQrR2oF5sNahDh46sdOzkV2qJUBVdWI9wGP4VGkAi+UmP5kFjb/Ds
	 meVJPowgZXAb7UJobfEJ81GhUUY0N+OGFRk5wNRqM/PZgIS0yfCIQVKPoMH597Gonz
	 PY9ic9oKw/XQW/PxJLHU+q6JjPJcYIjAlGlPO+EzOkAuHa1iOiwDQAOk+nrX2N1xLA
	 JmMc0obmWEe7w==
Date: Mon, 29 Jun 2026 18:01:37 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, alex@shazbot.org, jjohnson@kernel.org, 
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <5mrwcurlf6xnqla5x5idpt7ug34nv2eqpijnjmccgdwazrmwyv@64tixxe4aa57>
References: <20260626055023.197470-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260626055023.197470-1-jtornosm@redhat.com>
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

On Fri, Jun 26, 2026 at 07:50:23AM +0200, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.
> 
> The problem manifests in VFIO passthrough scenarios:
> 
> - WCN6855 (17cb:1103) and WCN7850 (17cb:1107) WiFi devices:
>   Normal VM operation works fine, including clean shutdown/reboot.
>   However, when the VM terminates uncleanly (crash, force-off), VFIO
>   attempts to reset the device before it can be assigned to another VM.
>   Without a working reset method, the device remains in an undefined state,
>   preventing reuse.
> 
> - SDX62/SDX65 (17cb:0308) 5G modems: Never successfully initialize even
>   on first VM assignment without proper reset capability.
> 
> Add device-specific reset methods using BAR-space hardware reset registers
> that exist in these devices:
> 
> - WCN6855/WCN7850 WiFi devices use SoC global reset via BAR0 (sequence from
>   ath11k/ath12k driver: ath11k_pci_soc_global_reset(), ath11k_pci_sw_reset(),
>   ath11k_mhi_set_mhictrl_reset()):
>   - Write/clear reset bit at offset 0x3008
>   - Wait for PCIe link recovery (up to 5 seconds)
>   - Clear MHI controller SYSERR status at offset 0x38
> 
> - SDX62/SDX65 modem devices use MHI SoC reset via BAR0 (sequence from MHI
>   driver: mhi_soc_reset(), mhi_pci_reset_prepare()):
>   - Write reset request to offset 0xb0
>   - Wait 2 seconds for reset completion
> 
> These are true hardware reset mechanisms (not power management or firmware
> error recovery), providing proper device reset for VFIO scenarios.
> 
> Testing was performed on desktop platforms with M.2 WiFi and modem cards
> using M.2-to-PCIe adapters, including extensive force-reset cycling to
> verify stability.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Couple of comments below, including one bug due to my previous suggestion. Once
those are addressed, feel free to add:

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> ---
> v11: Address Manivannan Sadhasivam feedback:
>   - Remove unused QUALCOMM_WIFI_MHISTATUS define
>   - Use PCI_ERROR_RESPONSE instead of 0xffffffff
>   - Sort device IDs in ascending order (0x0308, 0x1103, 0x1107)
> v10: https://lore.kernel.org/all/20260623183115.1585273-1-jtornosm@redhat.com/
> 
>  drivers/pci/quirks.c | 117 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 431c021d7414..0de606366200 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -4240,6 +4240,120 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>  	return 0;
>  }
>  
> +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET	0x3008
> +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V	BIT(0)
> +#define QUALCOMM_WIFI_MHICTRL			0x38
> +#define QUALCOMM_WIFI_MHICTRL_RESET_MASK	0x2

Qcom calls these WiFi devices as WLAN devices. So I'd prefer to use this term
all around even for function names.

> +
> +/*
> + * Qualcomm WiFi device-specific reset using SoC global reset via BAR0
> + * registers.
> + */
> +static int reset_qualcomm_wifi(struct pci_dev *pdev, bool probe)
> +{
> +	bool link_recovered = false;
> +	unsigned long timeout;
> +	void __iomem *bar;
> +	u32 val;
> +	u16 cmd;
> +
> +	if (probe)
> +		return 0;
> +
> +	if (pdev->current_state != PCI_D0)
> +		return -EINVAL;
> +
> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> +	pci_write_config_word(pdev, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
> +
> +	bar = pci_iomap(pdev, 0, 0);
> +	if (!bar) {
> +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
> +		return -ENODEV;
> +	}
> +
> +	val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +	val |= QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V;
> +	iowrite32(val, bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +	ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +
> +	msleep(10);
> +
> +	val &= ~QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V;
> +	iowrite32(val, bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +	ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +
> +	msleep(10);
> +
> +	timeout = jiffies + msecs_to_jiffies(5000);
> +	while (time_before(jiffies, timeout)) {
> +		val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
> +		if (val != PCI_ERROR_RESPONSE) {

As Sashiko also pointed out, this will always evaluate to true due to
PCI_ERROR_RESPONSE being ~0ULL. Please use:

	if (!PCI_POSSIBLE_ERROR(val))

Sorry for the wrong suggestion earlier.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

