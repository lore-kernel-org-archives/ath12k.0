Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4AFC83F22
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMitGX+xisG28b2DdHkJwlbV479kANDid2fRMPaBWso=; b=DM1IlnocW9qcpdj5K8BlN7Ac6B
	oTTV9qpf5Z67+BcU1rFmHBSQd65Akt2yEyURkUhBLaqbfDiPKydTZz2wsQsN9XPbrkKRS6jyeuEOS
	JjIJiwMbVciZTcxGp16BykHcZ/TwuNhJ2hEuVBOSD/lz0vJfzqb4FnTE8qY5lYATUBs7+hSY0t5A2
	9f5cCOlakifCfQBKAaJ1nt0HbJR3pUF1uLk8rbIqRkdZoWcdx5ReMve5eQHK5x0PduUNt+Qmgu21j
	OTcVNHPaSj/IV1CVcck4JQLXVGuqQYxw/1ZuEwreqkDQEIJVXr7jf9DqqFMWzzcwFDbxyRkSfN2bu
	t+y6aYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucODC-0000000ABdQ-1z1Y;
	Thu, 17 Jul 2025 12:59:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMoF-00000009z2i-2dAB;
	Thu, 17 Jul 2025 11:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEBDC5C694E;
	Thu, 17 Jul 2025 11:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81258C4CEE3;
	Thu, 17 Jul 2025 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752751794;
	bh=1IupY/CooA5f6pTF5w5s9P710FrsORD0Fd3kcUZOJkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8KeEUQXcg+1wnwbQNzAzQ/n9tnkOAg7Au4X3cFOHr7O4BvmKNAB/yHXs0QaRPvu9
	 OXfKJmgdOGZeO8BnednyRslMU3sZhQdALSDu5F/k42bKOS2H+GlKvGro9zMHxbhbFs
	 3FtlsoYJXdxINg3qjEGUcQUkqS6lpVGd/cSgFLbpSZGQJOC7i1MPrTdzsl67kHdCzs
	 SZh2XGyU0SXLPyskQ+d2hNQs1C9xxmcHcSjFawNXYRFUFIrAjreR35aEbZpbXfCHYr
	 O8KE5bgHoXe84Mvy38u4gaaeu2zWhiTD3uWSN28rke7U/AfOKhYZ8yELOR64NfuA73
	 4oilaLZmvjm0A==
Date: Thu, 17 Jul 2025 16:59:42 +0530
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
Message-ID: <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_042955_751913_FDC350D9 
X-CRM114-Status: GOOD (  23.48  )
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

On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
> 
> 
> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
> > 
> > [...]
> > 
> >>> @@ -16,6 +16,8 @@
> >>>  #include "mhi.h"
> >>>  #include "debug.h"
> >>>  
> >>> +#include "../ath.h"
> >>> +
> >>>  #define ATH12K_PCI_BAR_NUM		0
> >>>  #define ATH12K_PCI_DMA_MASK		36
> >>>  
> >>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
> >>>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
> >>>  
> >>>  	/* disable L0s and L1 */
> >>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> >>> -				   PCI_EXP_LNKCTL_ASPMC);
> >>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
> >>
> >> Not always, but sometimes seems the 'disable' does not work:
> >>
> >> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
> >> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
> >>
> >>
> >>>  
> >>>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
> >>>  }
> >>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
> >>>  {
> >>>  	if (ab_pci->ab->hw_params->supports_aspm &&
> >>>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
> >>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> >>> -						   PCI_EXP_LNKCTL_ASPMC,
> >>> -						   ab_pci->link_ctl &
> >>> -						   PCI_EXP_LNKCTL_ASPMC);
> >>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
> >>
> >> always, the 'enable' is not working:
> >>
> >> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
> >> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
> >>
> > 
> > Interesting! I applied your diff and I never see this issue so far (across 10+
> > reboots):
> 
> I was not testing reboot. Here is what I am doing:
> 
> step1: rmmod ath12k
> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
> the issue)
> 
> 	sudo setpci -s 02:00.0 0x80.B=0x43
> 
> step3: insmod ath12k and check linkctrl
> 

So I did the same and got:

[ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
[ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
[ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
[ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42

My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
that's why the lnkctl value once enabled becomes 0x42. This is exactly the
reason why the drivers should not muck around LNKCTL register manually.

> > 
> > [    3.758239] ath12k_pci_power_up 1475: link_ctl 0x42
> > [    3.758315] ath12k_pci_power_up 1480: link_ctl 0x40
> > [    4.383900] ath12k_pci_start 1180: link_ctl 0x40
> > [    4.384026] ath12k_pci_start 1185: link_ctl 0x42
> > 
> > Are you sure that you applied all the 6 patches in the series and not just the
> > ath patches? Because, the first 3 PCI core patches are required to make the API
> > work as intended.
> 
> pretty sure all of them:
> 
> $ git log --oneline
> 07387d1bc17f (HEAD -> VALIDATE-pci-enable-link-state-behavior) wifi: ath12k: dump linkctrl reg
> dbb3e5a7828b wifi: ath10k: Use pci_{enable/disable}_link_state() APIs to enable/disable
> ASPM states
> 392d7b3486b3 wifi: ath11k: Use pci_{enable/disable}_link_state() APIs to enable/disable
> ASPM states
> f2b0685c456d wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable
> ASPM states
> b1c8fad998f1 PCI/ASPM: Improve the kernel-doc for pci_disable_link_state*() APIs
> b8f5204ba4b0 PCI/ASPM: Transition the device to D0 (if required) inside
> pci_enable_link_state_locked() API
> 186b1bbd4c62 PCI/ASPM: Fix the behavior of pci_enable_link_state*() APIs
> 5a1ad8faaa16 (tag: ath-202507151704, origin/master, origin/main, origin/HEAD) Add
> localversion-wireless-testing-ath
> 

Ok!

> 
> > 
> >>
> >>>  }
> >>>  
> >>>  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
> >>>
> >>
> >> In addition, frequently I can see below AER warnings:
> >>
> >> [  280.383143] aer_ratelimit: 30 callbacks suppressed
> >> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
> >> 0000:00:1c.0
> >> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
> >> Layer, (Transmitter ID)
> >> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
> >> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
> >>
> > 
> > I don't see any AER errors either.
> 
> My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
> never saw them until your changes applied.
> 

I don't think it should matter. I have an Intel NUC lying around with QCA6390
attached via M.2. Let me test this change on that and report back the result.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

