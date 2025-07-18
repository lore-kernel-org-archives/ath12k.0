Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D008DC83F1A
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQOPmJA7K+xj6UEr8wLchEMP+OoeZCyb98dWHrMrlTw=; b=xPBZrioqB6KEv016bpfVeM7f6S
	YnsyCQznc6O208h3e9b1ZdRPx4nSUWEsyuCnrAAJ5B8NV6B1JIfSYAEPhqD2BLfvipQ4LcDdEgDUd
	hiQK5HWiREZsj1GElcwnO+0pv7a8mzbMHgoB76ACuV9aWVroXYrJN1Gz34Ri7X5CeOXo24AODNpFn
	Wfk0+A6Ad6tujS48NRjhpwO6vJEBqstfkOF6oaImNkOjogqDuzFEiFIejEakmkw9zYBP24TaA4qxJ
	Zn9Tf8pNdTQkXODicKgglfnq4aOnTB6qm1HttxgUUYHZtLQIJ/+ohQjKE0vdWMTPafNgbX4gOQT/7
	jASTdYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoq0-0000000DDJk-2UPP;
	Fri, 18 Jul 2025 17:25:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucojt-0000000DCi3-0eiX;
	Fri, 18 Jul 2025 17:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F8FD419BF;
	Fri, 18 Jul 2025 17:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D492EC4CEEB;
	Fri, 18 Jul 2025 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752859156;
	bh=mljt/m6pDjyin7CmecUSJC0AWe2g4NWfh4t5P5lPJlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEP8lrnMy3WJ5T+X/JwfsKsMsFjX7gn1+L/uaIurjVW/b8RNxluNmMoHNt7Shp78b
	 Nb+HTeUL0DGh7jVbzarEdbA/mNHEbaupxLvUCxwFE+BW1ViuqsxwOQPnGlsQgDlY/4
	 xKwxnN+T+mqgmuzSOfw8XNE9SHnr+2SlYHfY5mQgXXz5bESvF+H0ppY0a5fuxH59N9
	 zLIgD3fOTKPdzsqFnHOAQYJR3z91+O1sLXzKAoRv1YMVEF+Xf2QnciVQEXBbvsMWip
	 k4ctmJp/td2uN+CrX4jooN0ifp99j1Q0a4WsRLDYVXr60ZAB/VffyBZ6HZ903CJQnr
	 Rpb3fk9b44qvQ==
Date: Fri, 18 Jul 2025 22:49:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	manivannan.sadhasivam@oss.qualcomm.com, Jeff Johnson <jjohnson@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, Jonathan Derrick <jonathan.derrick@linux.dev>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath12k@lists.infradead.org, 
	ath11k@lists.infradead.org, ath10k@lists.infradead.org, ilpo.jarvinen@linux.intel.com, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
Message-ID: <qqskde7ar4dthidew2wrwbu5zzqhna7b27ivsyngzdanztdzwf@nvmxi7kzqkgv>
References: <wkapzhyr6hzp5az4jae3y5c77c3fg4uwrmyyipbq4uosamcivq@z7nv6w7nbyrp>
 <20250718162600.GA2700538@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718162600.GA2700538@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_101917_237176_64EA2220 
X-CRM114-Status: GOOD (  54.64  )
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

On Fri, Jul 18, 2025 at 11:26:00AM GMT, Bjorn Helgaas wrote:
> On Fri, Jul 18, 2025 at 05:19:28PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Jul 18, 2025 at 07:05:03PM GMT, Baochen Qiang wrote:
> > > On 7/18/2025 6:20 PM, Manivannan Sadhasivam wrote:
> > > > On Fri, Jul 18, 2025 at 01:27:27PM GMT, Manivannan Sadhasivam wrote:
> > > >> On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
> > > >>> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
> > > >>>> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
> > > >>>>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
> > > >>>>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
> > > >>>>>>
> > > >>>>>> [...]
> > > >>>>>>
> > > >>>>>>>> @@ -16,6 +16,8 @@
> > > >>>>>>>>  #include "mhi.h"
> > > >>>>>>>>  #include "debug.h"
> > > >>>>>>>>  
> > > >>>>>>>> +#include "../ath.h"
> > > >>>>>>>> +
> > > >>>>>>>>  #define ATH12K_PCI_BAR_NUM		0
> > > >>>>>>>>  #define ATH12K_PCI_DMA_MASK		36
> > > >>>>>>>>  
> > > >>>>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
> > > >>>>>>>>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
> > > >>>>>>>>  
> > > >>>>>>>>  	/* disable L0s and L1 */
> > > >>>>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> > > >>>>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
> > > >>>>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
> > > >>>>>>>
> > > >>>>>>> Not always, but sometimes seems the 'disable' does not work:
> > > >>>>>>>
> > > >>>>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
> > > >>>>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
> > > >>>>>>>
> > > >>>>>>>
> > > >>>>>>>>  
> > > >>>>>>>>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
> > > >>>>>>>>  }
> > > >>>>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
> > > >>>>>>>>  {
> > > >>>>>>>>  	if (ab_pci->ab->hw_params->supports_aspm &&
> > > >>>>>>>>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
> > > >>>>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> > > >>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
> > > >>>>>>>> -						   ab_pci->link_ctl &
> > > >>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
> > > >>>>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
> > > >>>>>>>
> > > >>>>>>> always, the 'enable' is not working:
> > > >>>>>>>
> > > >>>>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
> > > >>>>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> Interesting! I applied your diff and I never see this issue so far (across 10+
> > > >>>>>> reboots):
> > > >>>>>
> > > >>>>> I was not testing reboot. Here is what I am doing:
> > > >>>>>
> > > >>>>> step1: rmmod ath12k
> > > >>>>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
> > > >>>>> the issue)
> > > >>>>>
> > > >>>>> 	sudo setpci -s 02:00.0 0x80.B=0x43
> > > >>>>>
> > > >>>>> step3: insmod ath12k and check linkctrl
> > > >>>>>
> > > >>>>
> > > >>>> So I did the same and got:
> > > >>>>
> > > >>>> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
> > > >>>> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
> > > >>>> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
> > > >>>> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
> > > >>>>
> > > >>>> My host machine is Qcom based Thinkpad T14s and it doesn't
> > > >>>> support L0s. So that's why the lnkctl value once enabled
> > > >>>> becomes 0x42. This is exactly the reason why the drivers
> > > >>>> should not muck around LNKCTL register manually.
> > > >>>
> > > >>> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should
> > > >>> not be a concern. But still the random 0x43 -> 0x43 -> 0x43 ->
> > > >>> 0x42 sequence seems problematic.
> > > >>>
> > > >>> How many iterations have you done with above steps? From my
> > > >>> side it seems random so better to do some stress test.
> > > >>>
> > > >>
> > > >> So I ran the modprobe for about 50 times on the Intel NUC that
> > > >> has QCA6390, but didn't spot the disparity. This is the script
> > > >> I used:
> > > >>
> > > >> for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
> > > >> sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done
> > > >>
> > > >> And I always got:
> > > >>
> > > >> [ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
> > > >> [ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
> > > >> [ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
> > > >> [ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42
> > > >>
> > > >> Also no AER messages. TBH, I'm not sure how you were able to
> > > >> see the random issues with these APIs. That looks like a race,
> > > >> which is scary.
> > > >>
> > > >> I do not want to ignore your scenario, but would like to
> > > >> reproduce and get to the bottom of it.
> > > > 
> > > > I synced with Baochen internally and able to repro the issue.
> > > > Ths issue is due to hand modifying the LNKCTL register from
> > > > userspace. The PCI core maintains the ASPM state internally and
> > > > uses it to change the state when the
> > > > pci_{enable/disable}_link_state*() APIs are called.
> > > > 
> > > > So if the userspace or a client driver modifies the LNKCTL
> > > > register manually, it makes the PCI cached ASPM states invalid.
> > > > So while this series fixes the driver from doing that, nothing
> > > > prevents userspace from doing so using 'setpci' and other tools.
> > > > Userspace should only use sysfs attributes to change the state
> > > > and avoid modifying the PCI registers when the PCI core is
> > > > controlling the device.  So this is the reason behind the
> > > > errantic behavior of the API and it is not due to the issue with
> > > > the API or the PCI core.
> > > 
> > > IMO we can not rely on userspace doing what or not doing what, or
> > > on how it is doing, right? So can we fix PCI core to avoid this?
> > 
> > I'm not sure it is possible to *fix* the PCI core here. Since the
> > PCI core gives userspace access to the entire config space of the
> > device, the userspace reads/writes to any of the registers it want.
> > So unless the config space access if forbidden if a driver is bound
> > to the device, it is inevitable. And then there is also /dev/mem...
> > 
> > Interestingly, there is an API available for this purpose:
> > pci_request_config_region_exclusive(), but it is used only by the
> > AMD arch driver to prevent userspace from writing to the entire
> > config space of the device.
> > 
> > Maybe it makes sense to use something like this to prevent the
> > userspace access to the entire config space if the driver is bind to
> > the device.
> 
> I'm not really a fan of pci_request_config_region_exclusive() because
> it's such a singleton thing.  I don't like to be one of only a few
> users of an interface.
> 

If the API is serving the purpose, I don't see why we cannot be 'one among the
few users'.

> Linux has a long tradition of allowing root users to shoot themselves
> in the foot, and setpci is very useful as a debugging tool.  Maybe
> tainting the kernel for config writes from userspace, and possibly
> even a WARN_ONCE() at the time, would be a compromise.
> 

I really do not see a need to let the userspace modify the config space when a
driver is bind to it. It fully makes sense when there is no driver attached to
the device. But if there is one, then it just warrants trouble.

If we want to be really cautious with userspace tooling, then we can introduce
a kernel config option similar to CONFIG_IO_STRICT_DEVMEM and keep it disabled
by default.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

