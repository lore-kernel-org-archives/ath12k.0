Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B0BC83F17
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlfHJqUxHbUzcGCvDOMlkA5t4BEXtS2ajd2qxZoohb8=; b=aA+EA79cB0T0OBknIHivLIab2U
	X+tjNIzd+PjNx0OigQoCUjbKaMANFqCT2l8jAnU/sLTiJWvgur10cH3Bl3juTarGDRaIuLmAIlN0O
	EpGiFP3/WWvyKnmGyaq/el+DaqzEUlSq7EuVVaA8lLcIS1jH1hAtH4cRyWYWQk81PRZf28hoqOsTI
	r/+s1HY2J6H6Gr2AD3jd7et/663cVy2j/q0L+kifjgLN9a9OKvlcyswZByR3KmStrF5/noXoV8+Wi
	EADXm7Otxscq9qoU7x3HaZhSxbX0pXfdnCNkqy0seWs7B9E0enNQB5LWAK02WSOHr4A8jaU6UuFf4
	I+xRf7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg9G-0000000ByWb-3yIf;
	Fri, 18 Jul 2025 08:08:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfyC-0000000BwlC-0fdK;
	Fri, 18 Jul 2025 07:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 521DAA42700;
	Fri, 18 Jul 2025 07:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F15CC4CEEB;
	Fri, 18 Jul 2025 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752825447;
	bh=HtMkyMiApABrG1p0fj6Rh2/bC8EWBoPtuZRmkETmM0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GP3I1yO/9x3yN3ztQdGGuVWsFEAv4IonhkZC1/YuylH9hk3rpUPH6F3fVgr1nBYUf
	 pnjoEs60AqCkiHB1vwHE1GJk5niNnYTesz+OM25VQJACJ6mweiS2wTad1iy/Xu0YVS
	 5hYVKzMuwFyTQQJHMKWVPQB0kJ6ZYkRg2hXwMPLi9wwyrVhcW9TtruacgcUt23KmTG
	 U881qJIoxdy/PdRoxOokJt/J/xDiR0qYVZ4h6pAkE85IQvrhWDQTD20uw9pXyOgloh
	 JTiudxV6DJiT2J+wQjw+Yq5boYxCBvLMQMZOJ1qsIwI7G8ZVbHkLk/r/rM+PeieYM4
	 8tuGfZbpapCSg==
Date: Fri, 18 Jul 2025 13:27:14 +0530
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
Message-ID: <gx5gruyhrhwhvwkiqlkp2bggqd4oqe4quvqiiphfzolhjtzun6@okogvabkqah3>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
 <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
 <1db7c119-882f-4184-9ca4-9dbe5a49cb16@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1db7c119-882f-4184-9ca4-9dbe5a49cb16@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_005728_336527_E9108FD6 
X-CRM114-Status: GOOD (  23.58  )
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

On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
> 
> 
> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
> >>
> >>
> >> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
> >>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
> >>>
> >>> [...]
> >>>
> >>>>> @@ -16,6 +16,8 @@
> >>>>>  #include "mhi.h"
> >>>>>  #include "debug.h"
> >>>>>  
> >>>>> +#include "../ath.h"
> >>>>> +
> >>>>>  #define ATH12K_PCI_BAR_NUM		0
> >>>>>  #define ATH12K_PCI_DMA_MASK		36
> >>>>>  
> >>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
> >>>>>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
> >>>>>  
> >>>>>  	/* disable L0s and L1 */
> >>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> >>>>> -				   PCI_EXP_LNKCTL_ASPMC);
> >>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
> >>>>
> >>>> Not always, but sometimes seems the 'disable' does not work:
> >>>>
> >>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
> >>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
> >>>>
> >>>>
> >>>>>  
> >>>>>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
> >>>>>  }
> >>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
> >>>>>  {
> >>>>>  	if (ab_pci->ab->hw_params->supports_aspm &&
> >>>>>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
> >>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
> >>>>> -						   PCI_EXP_LNKCTL_ASPMC,
> >>>>> -						   ab_pci->link_ctl &
> >>>>> -						   PCI_EXP_LNKCTL_ASPMC);
> >>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
> >>>>
> >>>> always, the 'enable' is not working:
> >>>>
> >>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
> >>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
> >>>>
> >>>
> >>> Interesting! I applied your diff and I never see this issue so far (across 10+
> >>> reboots):
> >>
> >> I was not testing reboot. Here is what I am doing:
> >>
> >> step1: rmmod ath12k
> >> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
> >> the issue)
> >>
> >> 	sudo setpci -s 02:00.0 0x80.B=0x43
> >>
> >> step3: insmod ath12k and check linkctrl
> >>
> > 
> > So I did the same and got:
> > 
> > [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
> > [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
> > [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
> > [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
> > 
> > My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
> > that's why the lnkctl value once enabled becomes 0x42. This is exactly the
> > reason why the drivers should not muck around LNKCTL register manually.
> 
> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
> the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.
> 
> How many iterations have you done with above steps? From my side it seems random so better
> to do some stress test.
> 

So I ran the modprobe for about 50 times on the Intel NUC that has QCA6390, but
didn't spot the disparity. This is the script I used:

for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done

And I always got:

[ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
[ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
[ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
[ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42

Also no AER messages. TBH, I'm not sure how you were able to see the random
issues with these APIs. That looks like a race, which is scary.

I do not want to ignore your scenario, but would like to reproduce and get to
the bottom of it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

