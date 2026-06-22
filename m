Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AF5CDB46F
	for <ath12k@archiver.kernel.org>; Mon, 22 Jun 2026 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih+I5LnVu91b8pUW2V5GEe/78uVOQ3kGU5E/0iuy70k=; b=dTBJJF/mfPfibVZrYF4nfoxf14
	0yaO+nIzev8hdOeg8d7KDcgGb/Clq1Isjux+v20QJ1DjZcGNOFmsNzlRgPd0HMhugIvMANEcbuRyk
	B9XTlFulr2rGIL4l3zoR3Ew837bnjt3jRdaLyxxePgelxaWT61pJ7ZE4gX6voM5FCj25QOoCB9+RH
	5DZFitQirn+yekOWsFmwH6ojvp8tD23TkwGIYuQ9PCPRbB1g22V21Hiv0mgwK9q/vqlP+4gSByUbK
	3N6T8xHHBuPxi+mkz1b7hXH0KiYfCEuCAsd0KX4ksS/h4wC9B1LH6/CWstFdmYMHy7CeJ7nOCHZ8L
	9bSWu0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhQC-00000005B76-1a6x;
	Mon, 22 Jun 2026 16:22:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhQ8-00000005B6m-1pET;
	Mon, 22 Jun 2026 16:22:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D24D340134;
	Mon, 22 Jun 2026 16:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B481F000E9;
	Mon, 22 Jun 2026 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782145367;
	bh=ih+I5LnVu91b8pUW2V5GEe/78uVOQ3kGU5E/0iuy70k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ku1f72fKgdOM39icewQMIy5DxQcwfR3BAg894AtUwaqWJ6n9ma5vCgEAMSvjx8Eh/
	 rHdHjET/Ccg2I+FAvobyUTONrsxsIBhzVos8fy17w/P4/Su+F42/NH+ypA9WewiUU4
	 EgRHCS3Zad8Yz3Lwgm1Hx9FHLkEIWdLghmUZQ3QpS/xezkQoSDLclvYSSFnruZfW5Z
	 dRc3q4FwJ7i19lOXshPoidh6SwArl5dRNTYmGo6HiazmRGGxffnPN3uThvLj0c7c0g
	 7MBbS0hnVAOlC9sfWdQGVVmuxe6f4Y/bY4cLVYCBnxZ0pwpulEEISm3Vqy8EeBJ9iJ
	 OUzo0J0fKd9bw==
Date: Mon, 22 Jun 2026 18:22:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, bhelgaas@google.com, jjohnson@kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, 
	mhi@lists.linux.dev
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <4wmbans3ae5ayxqvs3wwn4hg3r3dcjuugmw2akoihvry35bq6k@k5lm6zjrp44l>
References: <n3maiuu5cctivlal4fozysz37ir6ecdfws5u2xxw2neclsfdfj@nsvwvlh7b4j5>
 <20260618063309.9536-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260618063309.9536-1-jtornosm@redhat.com>
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

On Thu, Jun 18, 2026 at 08:33:08AM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi Mani,
> 
> Let me clarify the exact scenario and where the reset is necessary:
> 
> * For the commented WiFi devices (WCN6855/WCN7850):
> 
> Standard VFIO passthrough flow (this works fine):
>   1. Unbind native driver (ath11k/ath12k/MHI)
>   2. Bind vfio-pci driver
>   3. Assign device to VM
>   4. VM boots, loads its own driver → device works perfectly
>   5. VM shuts down cleanly → device can be reassigned → works fine
> 
> The problem occurs with unclean VM termination:
>   1. VM crashes or is force-terminated
>   2. VFIO tries to reset the device before reassignment
>   3. Without a working PCI reset method, reset fails
>   4. Device stuck in undefined state → cannot be reassigned to another VM
>   
>      Unbinding the driver again doesn't help because the device hardware
>      itself is in a bad state. From hypervisor:
>      $ lspci -vvv -s 0000:03:00.0
>         03:00.0 Network controller: Qualcomm Technologies, Inc (rev ff) (prog-if ff)
>             !!! Unknown header type 7f
>      And a full host power-cycle is necessary to recover.
>      

Can you try the global reset available in the WLAN device BAR space?

WCN6855: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/tree/drivers/net/wireless/ath/ath11k/pci.c#n193
WCN7850: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/tree/drivers/net/wireless/ath/ath12k/pci.c#n182

> * For the commented modem devices (SDX62/SDX65): 
> 
> Even worse because it fails during the first VM boot without proper reset
> capability, standard VFIO passthrough flow:
>   1. Unbind native driver (MHI)
>   2. Bind vfio-pci driver
>   3. Assign device to VM
>   4. VM boots, loads its own driver and crashes:
>      [   24.024165] mhi mhi0: Device failed to enter MHI Ready
>      [   24.024168] mhi mhi0: MHI did not enter READY state
>      
>      Unbind/rebind attempts fail:
>      [  352.643601] mhi mhi0: Requested to power ON
>      [  352.643611] mhi mhi0: Power on setup success
>      [  373.442954] mhi mhi0: Device failed to clear MHI Reset
>      [  373.442970] mhi mhi0: MHI did not enter READY state
>      And requires a full host power cycle to recover,
>      even outside of VFIO scenarios.
> 
> * MHI Host driver's remove callback may handle clean software state
> teardown, but it doesn't provide a PCI reset capability that VFIO can
> invoke. VFIO needs a reset method registered in the PCI reset hierarchy
> (device_specific, pm, flr, bus, etc.). VFIO invokes this reset both during
> initial device binding (before the VM starts) and when reassigning the
> device between VMs - without a working reset method, the device cannot
> reach a clean state for initialization.
> 

Likewise, there is a SoC reset available in the modem BAR space. You can try it:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/tree/drivers/bus/mhi/host/main.c#n178

If these works, then you can hook these in the device_specific reset callback.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

