Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE72C43458
	for <ath12k@archiver.kernel.org>; Fri, 10 Jul 2026 20:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xkkm/ay4UwW+LKTRMQXsXHe7l4TsIKcsEKX51F7sGr4=; b=Ugp+63mZTakHql
	NweZ4oLoMmwRtfLMbfXxIZ/8XdRn9G+oWlGpVUkg76tUGWum6TsgCSRX1GOIOMaPOkqeHq3qp1/hn
	HLjOtJZUd2eGAQK2LZZokpqMHpshHeCJuCUIf4SPCLhmJPXN+QAYPye44e6XNwWX/yAdvZMdr9Bac
	rWEyxWLehi2ZCwSWzVvsZitFIL5xmmaLLKQ4MYEZbVv7QqTDB9FOfejaciGfBf67zaNZRjf6Sn+fg
	ggBcPxEAmEQjQYSG/rYH1q1IDySMWvNQFOheHylNX5TWsorfsk58Jd/5DuJ2LbZoYy3ohVI3XDTB8
	BV5e8v1Lyfv+4i/uCUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHnB-00000005h97-0Eb5;
	Fri, 10 Jul 2026 20:25:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHnA-00000005h8e-0ar8;
	Fri, 10 Jul 2026 20:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0CB240C4B;
	Fri, 10 Jul 2026 20:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0831F00A3A;
	Fri, 10 Jul 2026 20:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783715147;
	bh=xkkm/ay4UwW+LKTRMQXsXHe7l4TsIKcsEKX51F7sGr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Sd7sj++52Pz2Pz2wGW3mFCJs7y5zatPJ6wjFHodxWDPYb9ZC+NX15p0Uny3xfhysj
	 wElnyMhbIk3ZUUOA5+t10GaPqjbbPsyfgHALPKW6KnJtDLUAyYaKU1fwOkEBJmolO7
	 0ePWxShhOkhgF2fBtCCjMwYKKC/CunYss+mySjVw3PW+rxJBWmsEXZyIZ3w2KvOSp6
	 a+wBIBpHFugDxxDB71+jUyYifB+wywDqnLXJE3CGR+A/MkdE1aESXoj8Lz8C+GBLyj
	 naz9D8aUs4b4ooSPfrhUV/DJVq9hOpsig9yUtQzeTvdZ6tfLFPgzxALqrTBDe3In7h
	 qzCiOIDuy6RgQ==
Date: Fri, 10 Jul 2026 15:25:46 -0500
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
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/8] wifi: ath12k: Use
 pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
Message-ID: <20260710202546.GA989860@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-pci-aspm-fix-v3-6-6bd72451746e@kernel.org>
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

On Wed, Jul 08, 2026 at 04:30:20PM +0200, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> It is not recommended to enable/disable the ASPM states on the back of the
> PCI core directly using the LNKCTL register. It will break the PCI core's
> knowledge about the device ASPM states. So use the APIs exposed by the PCI
> core to enable/disable ASPM states.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Reported-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/pci.c   | 19 +++----------------
>  drivers/net/wireless/ath/ath12k/pci.h   |  4 +++-
>  3 files changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4a2b240f967a..7852ede3eaea 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: BSD-3-Clause-Clear
>  config ATH12K
>  	tristate "Qualcomm Wi-Fi 7 support (ath12k)"
> -	depends on MAC80211 && HAS_DMA && PCI
> +	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM

As Sashiko pointed out [1], I think adding the PCIEASPM dependency is
an issue.  The PCI core should provide stubs or whatever is necessary
to make ath12k work even if PCIEASPM isn't selected.

I'm guessing this hardware depends on the ability to disable ASPM even
without PCIEASPM so we probably would need more than just empty stubs.
We do build aspm.c unconditionally now and we provide LTR and L1SS
save/restore regardless of PCIEASPM.  Maybe we need something similar
here.

[1] https://lore.kernel.org/all/20260708144904.0CC4F1F000E9@smtp.kernel.org

>  	select QCOM_QMI_HELPERS
>  	select MHI_BUS
>  	select QRTR
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index d9a22d6afbb0..6d48fb25690d 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -884,19 +884,9 @@ static void ath12k_pci_free_region(struct ath12k_pci *ab_pci)
>  
>  static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>  {
> -	struct ath12k_base *ab = ab_pci->ab;
> -
> -	pcie_capability_read_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> -				  &ab_pci->link_ctl);
> -
> -	ath12k_dbg(ab, ATH12K_DBG_PCI, "pci link_ctl 0x%04x L0s %d L1 %d\n",
> -		   ab_pci->link_ctl,
> -		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L0S),
> -		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
> +	ab_pci->aspm_states = pcie_aspm_enabled(ab_pci->pdev);
>  
> -	/* disable L0s and L1 */
> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> -				   PCI_EXP_LNKCTL_ASPMC);
> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_ASPM_ALL);
>  
>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>  }
> @@ -925,10 +915,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>  {
>  	if (ab_pci->ab->hw_params->supports_aspm &&
>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> -						   PCI_EXP_LNKCTL_ASPMC,
> -						   ab_pci->link_ctl &
> -						   PCI_EXP_LNKCTL_ASPMC);
> +		pci_force_enable_link_state(ab_pci->pdev, ab_pci->aspm_states);
>  }
>  
>  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
> diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
> index 0e0e2020c6ae..409ef063cd69 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.h
> +++ b/drivers/net/wireless/ath/ath12k/pci.h
> @@ -128,7 +128,9 @@ struct ath12k_pci {
>  
>  	/* enum ath12k_pci_flags */
>  	unsigned long flags;
> -	u16 link_ctl;
> +
> +	/* Cached PCIe ASPM states */
> +	u32 aspm_states;
>  	unsigned long irq_flags;
>  	const struct ath12k_pci_ops *pci_ops;
>  	u32 qmi_instance;
> 
> -- 
> 2.43.0
> 
> 

