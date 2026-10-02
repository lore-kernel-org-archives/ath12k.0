Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB238CA5FDD
	for <ath12k@archiver.kernel.org>; Fri,  2 Oct 2026 22:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XOjEC8uyWbqD359x8ka20z4mQO4Yg0kZahphsxZmvs0=; b=UqPEIeHsC/NPpg
	OLXFwnNKIRZoE84ukl1edmk09PLExTLvIzwgS4nDO7p1fFa8d7AUb+VBM+26mBvhuUrp8kCC6bKlz
	VkGagYlZ0buGRAU2iM8dTE79rA45KFEp9qg7lBMoZFF/UVOvkb9CkB6G+UKhnXsPcGMZgQ2Utqu86
	w07B/Kh2He/nr77HpdVqA6bUShsyaG01bOMu4FB65f7rubTRPKmdlakgKPa6zpsi3w1hQYMGRSuLD
	z0DVavUgdas6o9Rpk2JNV5eNsbNX/hikLJy0QHVP5fyTsv4//lTrL58MpbBHMPpg0M1/+TgQydvsJ
	jTomH7BxO+1yPcFQq1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmAO-0000000CeLB-3Ubw;
	Fri, 02 Oct 2026 22:55:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmAM-0000000CeKo-3Qjb;
	Fri, 02 Oct 2026 22:55:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AEFA960214;
	Fri,  2 Oct 2026 22:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3799E1F000FF;
	Fri,  2 Oct 2026 22:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790981745;
	bh=XOjEC8uyWbqD359x8ka20z4mQO4Yg0kZahphsxZmvs0=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=R7mgiFXKy++R6GgEPFPaHrS51wx6MPgzAu9gjhXmJ4d/e1U+MjoTrh0NpZE1EkFyj
	 imZ0ybz654P4TN9chsmB/dCfngz7OhRtayg6AXwa7ttfz5qedYZa1CUk4Yx076Kz5y
	 hmKgjatvC26TgqA06C4agSG/nst5p1BE/oYd1f6irNeKim+f5JMUtT+OcB9Fws/z1m
	 zx2CsEfThX2ApsWeQk3OBIPOLBXvTjfNIfzSuMhQS0Xdwtk0AYpvKfCS/jztMJxQZ7
	 ynXIU/igwz9woyKegxKuXY1W9WhzDa17uDQyCMgX5p4sYag9fJ357B92ynt6AiOzkV
	 7abl2rK/wmwaA==
Date: Fri, 2 Oct 2026 17:55:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v3 3/8] PCI/ASPM: Transition the device to D0 (if
 required) when enabling ASPM link states
Message-ID: <20261002225543.GA374513@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-pci-aspm-fix-v3-3-6bd72451746e@kernel.org>
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

[+cc Rafael because I'm not a power management user]

On Wed, Jul 08, 2026 at 04:30:17PM +0200, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Per PCIe spec r6.0, sec 5.5.4:
> 
> "If setting either or both of the enable bits for PCI-PM L1 PM Substates,
> both ports must be configured as described in this section while in D0."
> 
> Currently, the callers of pci_enable_link_state_locked() (vmd, pcie-qcom)
> transition the device to D0 themselves before enabling the link state. But
> this is easy to get wrong and has to be duplicated by every caller.
> 
> Move the D0 transition into the shared __pci_enable_link_state() helper so
> that all three APIs pci_enable_link_state(), pci_enable_link_state_locked()
> and pci_force_enable_link_state() perform it, and only when the PCI-PM L1
> PM Substates are getting enabled.
> 
> Now that the helper handles the transition, drop the redundant D0 transition
> from the vmd and pcie-qcom callers.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c |  5 -----
>  drivers/pci/controller/vmd.c           |  5 -----
>  drivers/pci/pcie/aspm.c                | 23 +++++++++++++++++------
>  3 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index d8eb52857f69..45f4caeb0814 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1085,11 +1085,6 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  
>  static int qcom_pcie_enable_aspm(struct pci_dev *pdev, void *userdata)
>  {
> -	/*
> -	 * Downstream devices need to be in D0 state before enabling PCI PM
> -	 * substates.
> -	 */
> -	pci_set_power_state_locked(pdev, PCI_D0);
>  	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
>  
>  	return 0;
> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index d4ae250d4bc6..20597d2cf66e 100644
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -762,11 +762,6 @@ static int vmd_pm_enable_quirk(struct pci_dev *pdev, void *userdata)
>  	pci_info(pdev, "VMD: Default LTR value set by driver\n");
>  
>  out_state_change:
> -	/*
> -	 * Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
> -	 * PCIe r6.0, sec 5.5.4.
> -	 */
> -	pci_set_power_state_locked(pdev, PCI_D0);
>  	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
>  	return 0;
>  }
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index c04fb71de91c..6d6862fd2ebb 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1524,6 +1524,17 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked,
>  		return -EPERM;
>  	}
>  
> +	/*
> +	 * Ensure the device is in D0 before enabling PCI-PM L1 PM Substates, per
> +	 * PCIe r6.0, sec 5.5.4.
> +	 */
> +	if (state & PCIE_LINK_STATE_L1_SS_PCIPM) {
> +		if (locked)
> +			pci_set_power_state_locked(pdev, PCI_D0);
> +		else
> +			pci_set_power_state(pdev, PCI_D0);
> +	}

I think it's a great thing to get the power state management out of
the callers of pci_enable_link_state().

But shouldn't we really have done this with pm_runtime_get_sync() and
a corresponding pci_runtime_put()?  Setting the power state with
pci_set_power_state() feels like it's too low-level and possibly racy
for use like this.

>  	if (!locked)
>  		down_read(&pci_bus_sem);
>  	mutex_lock(&aspm_lock);
> @@ -1550,8 +1561,8 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked,
>   * touch the LNKCTL register. Also note that this does not enable states
>   * disabled by pci_disable_link_state(). Return 0 or a negative errno.
>   *
> - * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
> - * PCIe r6.0, sec 5.5.4.
> + * Note: The device will be transitioned to D0 state if the PCI-PM L1 Substates
> + * are getting enabled.
>   *
>   * @pdev: PCI device
>   * @state: Mask of ASPM link states to enable
> @@ -1569,8 +1580,8 @@ EXPORT_SYMBOL(pci_enable_link_state);
>   * can't touch the LNKCTL register. Also note that this does not enable states
>   * disabled by pci_disable_link_state(). Return 0 or a negative errno.
>   *
> - * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
> - * PCIe r6.0, sec 5.5.4.
> + * Note: The device will be transitioned to D0 state if the PCI-PM L1 Substates
> + * are getting enabled.
>   *
>   * @pdev: PCI device
>   * @state: Mask of ASPM link states to enable
> @@ -1600,8 +1611,8 @@ EXPORT_SYMBOL(pci_enable_link_state_locked);
>   * Note that if the BIOS didn't grant ASPM control to the OS, this does nothing
>   * because we can't touch the LNKCTL register.
>   *
> - * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates, per
> - * PCIe r6.0, sec 5.5.4.
> + * Note: The device will be transitioned to D0 state if the PCI-PM L1 Substates
> + * are getting enabled.
>   *
>   * Return: 0 on success, a negative errno otherwise.
>   */
> 
> -- 
> 2.43.0
> 
> 

