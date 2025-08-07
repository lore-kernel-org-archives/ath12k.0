Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEF5C87FCF
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3a2/KC83RRH5zHKbQEVkzPRNvio8bmrz3u0KHdf0+w=; b=W6yqwRzYFQOblX/FLVS3d23Cjp
	0ImSp4u7w5seA/K3kp0FW4BLjEg6IAp5Sv+zSEvA6Pmljyxfpb0WWrYnrUfwDZiKxIMae7KObn6c+
	5I4yFbPMBl1ExlskqMmnWFMw+Zd5IAHPwV6nD4etjTSs+fO1BIJJDGK0LhcVF0Bwr4U/Nl9nns+Dk
	7L/jIDspf2pKKBn3VNI0Lsyub42WT1xEo0bccRpLCe311+RaaaGkgzzovlC5JjsRQ7Ko8fPr57+FF
	4/ry7umanEex/BYY6Mh7oj5X6tJmpFSziVAM/CZ8DYoGpkHjEdYb/O3tIYks0ZjWPtQvqHlpQJn8W
	3j9srV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujxZa-00000000B2E-0si2;
	Thu, 07 Aug 2025 10:10:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujxTY-000000009Y6-2Qdy;
	Thu, 07 Aug 2025 10:03:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57E0B600AE;
	Thu,  7 Aug 2025 10:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6A6C4CEEB;
	Thu,  7 Aug 2025 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754561033;
	bh=YsqhzwTGXsR1Inz4NSQKc7b929mseLNbPE/51iSw51I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQLXgkfT6CABBvINOQd0JkgipyPhzRY4X9At4aPhH2YDexocOd/T49lHaLOQ9T55Q
	 Fhjf1afz77KsJXqa5Qdn4/MkvJXaAjnBUQRhvuKx/CM6HCAt5LMN63ago/pVK2cPUy
	 JNY3NsFeOlWFqo1P90D3aPZvelkDYwTCiL9q+px3Jlu+MezxMrHFr6Rtg7wftkNQeJ
	 VJ3G8TshAj3JGk98t5Pb9pyj5aXLp9VyDlWsSrK0WMKb11i/5GeB3ZCMFs/o7dqyy5
	 0GOdUVfXBsUw2vU39ErMupqgB7vk98M5i+V/wA6NPK1LMM+Mt9aboc11Fr08iv4vnw
	 Khl6HMDo18RkQ==
Date: Thu, 7 Aug 2025 15:33:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, Jonathan Derrick <jonathan.derrick@linux.dev>, 
	linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath12k@lists.infradead.org, 
	ath11k@lists.infradead.org, ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
Message-ID: <poam3nvpyeahyvuyyow63u7hl63kq7ju6rondfonjjv6mix4vh@gflqxihdm2yk>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <7a97d075-2e37-5f40-5247-867146938613@linux.intel.com>
 <3q2gqo6ipzyqr7i64yhndtpg4etwep4lgffk7emxluxuhjfya5@vt7czmsgpbuw>
 <52baf40b-41ed-2588-7817-4d8cd859e0d1@linux.intel.com>
 <je7sz6lgig3picksxv4ncfjcnnw2sdsp5ja6bwofqjuydhc4v6@b3kavwicxggu>
 <fdfcc2c8-c749-2616-9295-7f4aa37fb0a4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdfcc2c8-c749-2616-9295-7f4aa37fb0a4@linux.intel.com>
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

On Mon, Jul 21, 2025 at 02:28:24PM GMT, Ilpo Järvinen wrote:
> On Mon, 21 Jul 2025, Manivannan Sadhasivam wrote:
> 
> > On Mon, Jul 21, 2025 at 01:09:05PM GMT, Ilpo Järvinen wrote:
> > > On Mon, 21 Jul 2025, Manivannan Sadhasivam wrote:
> > > > On Mon, Jul 21, 2025 at 11:04:10AM GMT, Ilpo Järvinen wrote:
> > > > > On Wed, 16 Jul 2025, Manivannan Sadhasivam via B4 Relay wrote:
> > > > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > > > 
> > > > > > It is not recommended to enable/disable the ASPM states on the back of the
> > > > > > PCI core directly using the LNKCTL register. It will break the PCI core's
> > > > > > knowledge about the device ASPM states. So use the APIs exposed by the PCI
> > > > > > core to enable/disable ASPM states.
> > > > > > 
> > > > > > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > > > > > 
> > > > > > Reported-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/net/wireless/ath/ath.h        | 14 ++++++++++++++
> > > > > >  drivers/net/wireless/ath/ath12k/pci.c | 10 ++++------
> > > > > >  2 files changed, 18 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
> > > > > > index 34654f710d8a1e63f65a47d4602e2035262a4d9e..ef685123b66bf4f41428fec67c1967f242a9ef27 100644
> > > > > > --- a/drivers/net/wireless/ath/ath.h
> > > > > > +++ b/drivers/net/wireless/ath/ath.h
> > > > > > @@ -21,6 +21,8 @@
> > > > > >  #include <linux/skbuff.h>
> > > > > >  #include <linux/if_ether.h>
> > > > > >  #include <linux/spinlock.h>
> > > > > > +#include <linux/pci.h>
> > > > > > +#include <linux/pci_regs.h>
> > > > > >  #include <net/mac80211.h>
> > > > > >  
> > > > > >  /*
> > > > > > @@ -336,4 +338,16 @@ static inline const char *ath_bus_type_to_string(enum ath_bus_type bustype)
> > > > > >  	return ath_bus_type_strings[bustype];
> > > > > >  }
> > > > > >  
> > > > > > +static inline int ath_pci_aspm_state(u16 lnkctl)
> > > > > > +{
> > > > > > +	int state = 0;
> > > > > > +
> > > > > > +	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
> > > > > > +		state |= PCIE_LINK_STATE_L0S;
> > > > > > +	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
> > > > > > +		state |= PCIE_LINK_STATE_L1;
> > > > > > +
> > > > > > +	return state;
> > > > > > +}
> > > > > > +
> > > > > >  #endif /* ATH_H */
> > > > > > diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> > > > > > index 489d546390fcdab8f615cc9184006a958d9f140a..a5e11509e3ab8faad6638ff78ce6a8a5e9c3cbbd 100644
> > > > > > --- a/drivers/net/wireless/ath/ath12k/pci.c
> > > > > > +++ b/drivers/net/wireless/ath/ath12k/pci.c
> > > > > > @@ -16,6 +16,8 @@
> > > > > >  #include "mhi.h"
> > > > > >  #include "debug.h"
> > > > > >  
> > > > > > +#include "../ath.h"
> > > > > > +
> > > > > >  #define ATH12K_PCI_BAR_NUM		0
> > > > > >  #define ATH12K_PCI_DMA_MASK		36
> > > > > >  
> > > > > > @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
> > > > > >  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
> > > > > >  
> > > > > >  	/* disable L0s and L1 */
> > > > > > -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> > > > > > -				   PCI_EXP_LNKCTL_ASPMC);
> > > > > > +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
> > > > > 
> > > > > I'd remove to comment too as the code is self-explanatory after this 
> > > > > change.
> > > > > 
> > > > 
> > > > Ack
> > > > 
> > > > > >  
> > > > > >  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
> > > > > >  }
> > > > > > @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
> > > > > >  {
> > > > > >  	if (ab_pci->ab->hw_params->supports_aspm &&
> > > > > >  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
> > > > > > -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> > > > > > -						   PCI_EXP_LNKCTL_ASPMC,
> > > > > > -						   ab_pci->link_ctl &
> > > > > > -						   PCI_EXP_LNKCTL_ASPMC);
> > > > > > +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
> > > > > >  }
> > > > > >  
> > > > > >  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
> > > > > 
> > > > > As you now depend on ASPM driver being there, these should also add to 
> > > > > Kconfig:
> > > > > 
> > > > > depends on PCIEASPM
> > > > > 
> > > > 
> > > > I thought about it, but since this driver doesn't necessarily enable ASPM for
> > > > all the devices it supports, I didn't add the dependency. But looking at it
> > > > again, I think makes sense to add the dependency since the driver cannot work
> > > > reliably without disabling ASPM (for the supported devices).
> > > 
> > > PCIEASPM is already default y and if EXPERT so it is not something 
> > > that is expected to be disabled.
> > > 
> > > You also no longer need to move the ASPM link state defines LKP found out 
> > > about after adding the depends on.
> > > 
> > 
> > Yes, it will fix the reported issue, but guarding the definitions feels wrong to
> > me still. Maybe that's something we can worry later.
> > 
> > > I'm a bit worried this series will regress in the cases where OS doesn't 
> > > control ASPM so it might be necessary to include something along the 
> > > lines of the patch below too (the earlier discussion on this is in Link 
> > > tags):
> > > 
> > 
> > atheros drivers didn't have such comment (why they were manually changing the
> > LNKCTL register), but I agree that there is a chance that they could cause issue
> > on platforms where BIOS didn't give ASPM control to the OS.
> > 
> > But as a non-ACPI developer, I don't know what does 'ACPI doesn't give
> > permission to manage ASPM' mean exactly. Does ACPI allow to disable ASPM but not
> > enable it?
> 
> While others are likely better qualified to answer this, my impression is 
> that even disabling ASPM is not allowed when OS does has not been granted 
> control over ASPM (OS should not change the value of ASPM Control in 
> LNKCTL at all).
> 
> The obvious trouble then is, if a driver/hw needs ASPM to be disabled over 
> certain period of its operation or entirely to ensure stable operation, 
> and ASPM is enabled, we're between a rock and a hard place when changes to 
> ASPM Control field are disallowed.
> 
> Because the ASPM driver took a hard stance of conformance here and did 
> not let touching the ASPM Control field, we ended up having drivers that 
> then write ASPM Control on their own to work around HW problems (see e.g. 
> the comments in drivers/net/ethernet/intel/e1000e/netdev.c that make it 
> very clear it was intentional from the driver) so it was considered that 
> allowing disabling ASPM might be acceptable compromise over drivers doing 
> it on their own (and leaving the ASPM driver out of the loop because it 
> cannot be relied to disable ASPM consistently in all cases).
> 

Since there was no comments from ACPI folks, I will go ahead with your patch. I
will also CC them in the next version so that they can yell at me if they want.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

