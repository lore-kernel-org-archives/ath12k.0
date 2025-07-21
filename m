Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39158C87FC5
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QDcWmcrw2JQR7xHkjnJlLuEOHSJjmVW7Iq0KXD0Vc0=; b=HHkVI4SZtD9F8BZZmqo8czSjR3
	xKPEv8WD4xtLWDJGleA6rMatsG4t2ViOBnOXOdvwsI6WgP9bpojI7vEWBo0VovzP+i9qsDqE5Uf+Z
	3j0B9fz0R/0trSd6RygsxUduftt/qrzdYQxshZ2EC9hZPMnAi9ovmUrVIQq0A5xsTLV9qf3LYYANl
	XdeThu/Hv1dMMUqspyanhERmYRZge9HSfeenM0ygjjQOeQYoqDDQoS2WkySW06TYpbXnkrkG7r9gR
	AbUufIwL8nntCm4BO2SUrb8XLMY838oxyp3JGxw2XuMozVCLFhA7Yyl6eE1SKOvQITEBaBNWQ0IcN
	IP4RprAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlVY-0000000Gajz-47vO;
	Mon, 21 Jul 2025 08:04:24 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlVW-0000000GajU-00eu;
	Mon, 21 Jul 2025 08:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753085062; x=1784621062;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2o9zyX3cerqp5g/7zwFTMs7Wun4Ck/BEYMqIIsd5pSI=;
  b=AZenL2dWG9Kowglnf/Jg+mchQaWQiqybdD8kLyFI4Dtgt3sXea9310dl
   DfwOO0y/wPde9rOuOmUKh0FBNwrsL63TAK1uYlWbmiq8KDTLLd+dm93Zw
   Wn1BTHotdqGmkkx1EE1HPJHqQFwewaj9eqsN3hxtQdr2S9hFowzEPzdjw
   SDtuEDH3cjlOvlqkVtBC47h646c5GIHMjzOWCZV33FuhjLBBXKh8ZporO
   9hkQlvqMCaPJMw2k2/21kF3zexQP1iApa2XiShqsh5icR4yiMHNPcX9UK
   AgeTaenDm6VdINZX6Sd1GBRYGKmoT5rvdj5UU7jfRIDYoZk6h1ozwjufd
   Q==;
X-CSE-ConnectionGUID: +90MaIulSlaHzyQybnZsMA==
X-CSE-MsgGUID: eWQFG5aURLSZoRLzqPRAuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55447607"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="55447607"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 01:04:21 -0700
X-CSE-ConnectionGUID: BWkutBHqS9af8EK7EQYPNw==
X-CSE-MsgGUID: YTV/OCYcRgOXDZIMMaHlpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="158888328"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 01:04:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Jul 2025 11:04:10 +0300 (EEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
cc: Jeff Johnson <jjohnson@kernel.org>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    Nirmal Patel <nirmal.patel@linux.intel.com>, 
    Jonathan Derrick <jonathan.derrick@linux.dev>, 
    linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
    ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, 
    linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
In-Reply-To: <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
Message-ID: <7a97d075-2e37-5f40-5247-867146938613@linux.intel.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com> <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_010422_108665_E45FF246 
X-CRM114-Status: GOOD (  19.70  )
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

On Wed, 16 Jul 2025, Manivannan Sadhasivam via B4 Relay wrote:

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
>  drivers/net/wireless/ath/ath.h        | 14 ++++++++++++++
>  drivers/net/wireless/ath/ath12k/pci.c | 10 ++++------
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
> index 34654f710d8a1e63f65a47d4602e2035262a4d9e..ef685123b66bf4f41428fec67c1967f242a9ef27 100644
> --- a/drivers/net/wireless/ath/ath.h
> +++ b/drivers/net/wireless/ath/ath.h
> @@ -21,6 +21,8 @@
>  #include <linux/skbuff.h>
>  #include <linux/if_ether.h>
>  #include <linux/spinlock.h>
> +#include <linux/pci.h>
> +#include <linux/pci_regs.h>
>  #include <net/mac80211.h>
>  
>  /*
> @@ -336,4 +338,16 @@ static inline const char *ath_bus_type_to_string(enum ath_bus_type bustype)
>  	return ath_bus_type_strings[bustype];
>  }
>  
> +static inline int ath_pci_aspm_state(u16 lnkctl)
> +{
> +	int state = 0;
> +
> +	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
> +		state |= PCIE_LINK_STATE_L0S;
> +	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
> +		state |= PCIE_LINK_STATE_L1;
> +
> +	return state;
> +}
> +
>  #endif /* ATH_H */
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 489d546390fcdab8f615cc9184006a958d9f140a..a5e11509e3ab8faad6638ff78ce6a8a5e9c3cbbd 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -16,6 +16,8 @@
>  #include "mhi.h"
>  #include "debug.h"
>  
> +#include "../ath.h"
> +
>  #define ATH12K_PCI_BAR_NUM		0
>  #define ATH12K_PCI_DMA_MASK		36
>  
> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>  
>  	/* disable L0s and L1 */
> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> -				   PCI_EXP_LNKCTL_ASPMC);
> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);

I'd remove to comment too as the code is self-explanatory after this 
change.

>  
>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>  }
> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>  {
>  	if (ab_pci->ab->hw_params->supports_aspm &&
>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> -						   PCI_EXP_LNKCTL_ASPMC,
> -						   ab_pci->link_ctl &
> -						   PCI_EXP_LNKCTL_ASPMC);
> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>  }
>  
>  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)

As you now depend on ASPM driver being there, these should also add to 
Kconfig:

depends on PCIEASPM

-- 
 i.


