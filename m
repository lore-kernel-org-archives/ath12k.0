Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F8C83F22
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqpEGxrSHjPnQapAo1n/KgA8xPOEaDfBWKwYDY9LCL4=; b=Nz8HmUuXw8w0qK+c1vS+zXxcJS
	YW27zxhs2lRpKAdsAjaaIHsohP/MKH6H4qEY8MBs3H0jh1x60/4hwXiR0IJs4UMCV23cQM4OFptP3
	XNTzKj5GHJNg1+xCrLZWP2VQ7O8eMG6fkuydzLyLsX4qv7k2tWDcIAdkeZWtAKSVgPuSZXqrcKJUA
	Lom4CA06QPweOcfy/e9E8DabXGAruSkWiCEFqrOG19yUWbI0wntr02LFhgC0iiry1bJ1BdRCdNzLV
	KwyRqgOprkIeyO7foROW/t3SwtQj2B4M9+u50iSjnM4GNvo1L1uy9MjQIHI8FY7Teww7JH75JGL+G
	S9JigErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLvE-00000009qan-0iPJ;
	Thu, 17 Jul 2025 10:33:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLtp-00000009qLy-0R9b;
	Thu, 17 Jul 2025 10:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FF355C572E;
	Thu, 17 Jul 2025 10:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B58EC4CEE3;
	Thu, 17 Jul 2025 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752748295;
	bh=GEF0Iea9tdt8h2xZCwTe5vufEO4aXfoWH9l3WAh+Oz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMzAIZPTr+EmY4y6vQDBLndTvsjtdW2C/Q37l47c2JiNuLSMKT9BgZRlUw63VrlMc
	 o6KoeKskW/7c4OjpccPNJAK+abKpRVqfzcLSQrnpSuC0gu2HKt2y6abARAnv0/ESi6
	 e/3h3CYaFvb6yK7PXocCosZMbF0BZ+zRUVP+3BxoIB+a4/rNVqQWeX8ocYwS8Cid8b
	 qySdiZSO14+KSkjzDUnZx3d+Xo4AkNFu4O7bBMj8NmEzKmgfLTEpVzYcFw+7I5QH9o
	 Yy7d9U055qgdEqcwFMdnAeRh5UkwaILFQitu1p5ms2/lYH4Hl5qHnTW8NHji091BM9
	 Cg904INvymVcw==
Date: Thu, 17 Jul 2025 16:01:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Jeff Johnson <jjohnson@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>, ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
Message-ID: <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033137_223309_007AD627 
X-CRM114-Status: GOOD (  12.97  )
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

On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:

[...]

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
> Not always, but sometimes seems the 'disable' does not work:
> 
> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
> 
> 
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
> 
> always, the 'enable' is not working:
> 
> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
> 

Interesting! I applied your diff and I never see this issue so far (across 10+
reboots):

[    3.758239] ath12k_pci_power_up 1475: link_ctl 0x42
[    3.758315] ath12k_pci_power_up 1480: link_ctl 0x40
[    4.383900] ath12k_pci_start 1180: link_ctl 0x40
[    4.384026] ath12k_pci_start 1185: link_ctl 0x42

Are you sure that you applied all the 6 patches in the series and not just the
ath patches? Because, the first 3 PCI core patches are required to make the API
work as intended.

> 
> >  }
> >  
> >  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
> > 
> 
> In addition, frequently I can see below AER warnings:
> 
> [  280.383143] aer_ratelimit: 30 callbacks suppressed
> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
> 0000:00:1c.0
> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
> Layer, (Transmitter ID)
> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
> 

I don't see any AER errors either.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

