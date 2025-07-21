Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC01C83F1A
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O/zkHDhZ0rghSkgPOXfosT5BudLlMoH9NHAAEi22fo=; b=YqxAAm64y0I+B0rtyOauCHHV7D
	jvAfXwib6rjrclui+RodFgdyJma5RNZH0GKszS6wEyhxl9W5ihZ13WO+zsm89nAF3O6QuHIktqcob
	Zyl5fAx9Yg7iciJr3AAXSgqx5mM5NI5PYG93vdBwvq85VX/7ZKf++EF8W+mFbhs5mTIlcDfHhJv1q
	VNC4Zq4ak0GCVjAGEqvYH9NV4v1npvXWKfYE9JvRTklQ5A2t/sop2OeZdKCys2sO4QWPQRuWA+nkC
	ojUwMHU5xQRF95saD438R0BOszLxBVbxw+d8140hq7/0Io/3d1LeZTvW0qr1yG5hq7NftI632norm
	XJl5m4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmEZ-0000000Gikr-46Lq;
	Mon, 21 Jul 2025 08:50:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udltd-0000000Gezt-0VjL;
	Mon, 21 Jul 2025 08:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 210625C54B8;
	Mon, 21 Jul 2025 08:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F534C4CEED;
	Mon, 21 Jul 2025 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753086554;
	bh=JBnNlikKn4hKl1kwixnp+zTVImmONrxMYvjBn6S0QSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXPPLrKrfVEHpfv/xEQxunALtEua2TyseOCciF04kWCyerh+94NLHyENnQ4xgGbJp
	 Ot5/SDQEDpcxKockpY3CbHDncQciOgV5bU5mHZLvN+6c8/6e3FSJKPq18YX8w94/VF
	 3tTrEzgekpqPv7tQNNCj0bpVjkbdjUj2WknJiALpVXInaoGV8rg0EMokckWDTlE9qE
	 LwMZmfz1Yk/u4YghxZ6lKBpbw8AyWqufQK41tbH5YlTl6ifHv34+DeOK03N1aGO/Yk
	 dybOPhz/IkxFBHoCUDYLbu1OyQF9/RZVxOvw/1tEcI7BwR1ABmDFFdtPKVtfEatpLO
	 DVLFg5JuL4jWg==
Date: Mon, 21 Jul 2025 13:59:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-wireless@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
Message-ID: <3q2gqo6ipzyqr7i64yhndtpg4etwep4lgffk7emxluxuhjfya5@vt7czmsgpbuw>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <7a97d075-2e37-5f40-5247-867146938613@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a97d075-2e37-5f40-5247-867146938613@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_012917_236676_BF9ED121 
X-CRM114-Status: GOOD (  26.36  )
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

On Mon, Jul 21, 2025 at 11:04:10AM GMT, Ilpo Järvinen wrote:
> On Wed, 16 Jul 2025, Manivannan Sadhasivam via B4 Relay wrote:
> 
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > It is not recommended to enable/disable the ASPM states on the back of the
> > PCI core directly using the LNKCTL register. It will break the PCI core's
> > knowledge about the device ASPM states. So use the APIs exposed by the PCI
> > core to enable/disable ASPM states.
> > 
> > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > 
> > Reported-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath.h        | 14 ++++++++++++++
> >  drivers/net/wireless/ath/ath12k/pci.c | 10 ++++------
> >  2 files changed, 18 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
> > index 34654f710d8a1e63f65a47d4602e2035262a4d9e..ef685123b66bf4f41428fec67c1967f242a9ef27 100644
> > --- a/drivers/net/wireless/ath/ath.h
> > +++ b/drivers/net/wireless/ath/ath.h
> > @@ -21,6 +21,8 @@
> >  #include <linux/skbuff.h>
> >  #include <linux/if_ether.h>
> >  #include <linux/spinlock.h>
> > +#include <linux/pci.h>
> > +#include <linux/pci_regs.h>
> >  #include <net/mac80211.h>
> >  
> >  /*
> > @@ -336,4 +338,16 @@ static inline const char *ath_bus_type_to_string(enum ath_bus_type bustype)
> >  	return ath_bus_type_strings[bustype];
> >  }
> >  
> > +static inline int ath_pci_aspm_state(u16 lnkctl)
> > +{
> > +	int state = 0;
> > +
> > +	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
> > +		state |= PCIE_LINK_STATE_L0S;
> > +	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
> > +		state |= PCIE_LINK_STATE_L1;
> > +
> > +	return state;
> > +}
> > +
> >  #endif /* ATH_H */
> > diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> > index 489d546390fcdab8f615cc9184006a958d9f140a..a5e11509e3ab8faad6638ff78ce6a8a5e9c3cbbd 100644
> > --- a/drivers/net/wireless/ath/ath12k/pci.c
> > +++ b/drivers/net/wireless/ath/ath12k/pci.c
> > @@ -16,6 +16,8 @@
> >  #include "mhi.h"
> >  #include "debug.h"
> >  
> > +#include "../ath.h"
> > +
> >  #define ATH12K_PCI_BAR_NUM		0
> >  #define ATH12K_PCI_DMA_MASK		36
> >  
> > @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
> >  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
> >  
> >  	/* disable L0s and L1 */
> > -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> > -				   PCI_EXP_LNKCTL_ASPMC);
> > +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
> 
> I'd remove to comment too as the code is self-explanatory after this 
> change.
> 

Ack

> >  
> >  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
> >  }
> > @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
> >  {
> >  	if (ab_pci->ab->hw_params->supports_aspm &&
> >  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
> > -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> > -						   PCI_EXP_LNKCTL_ASPMC,
> > -						   ab_pci->link_ctl &
> > -						   PCI_EXP_LNKCTL_ASPMC);
> > +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
> >  }
> >  
> >  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
> 
> As you now depend on ASPM driver being there, these should also add to 
> Kconfig:
> 
> depends on PCIEASPM
> 

I thought about it, but since this driver doesn't necessarily enable ASPM for
all the devices it supports, I didn't add the dependency. But looking at it
again, I think makes sense to add the dependency since the driver cannot work
reliably without disabling ASPM (for the supported devices).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

