Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3674CD98F2
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07uoq0PIndTVBv8tgnHeAEJeFAtrzEKE7E1mnPuM/Dg=; b=pzj8gM1g5sIKfnPFeV7wkhZDoE
	jrUfIrn8a9tT1wwYQcPaiCXq8G9+u1r8q2qJHuAtp4XsvcGTUGmnbA8+KQo1cLH1y6e/WOo3UNz+j
	Hmx6YB0ddaqHVoKlo2hfJiU5wodH28lWh6S8SHnqwmYDTsBrtQ1rBpCkB4TRBNaVhRco7cCasv6Q7
	AJYlYNhqib3tZlueHtzz3BCnqk+nn3ixGvvaDWW+fl7fDjy8ieLROLR71XR1oZkONZhxvUP1NFcrb
	Ja+RyAhZU8eUduqu97nEt8YMAq6Is4mV1xWqsLeBuvuANrlLpQQ7/Hoa7ZmDSAniDz2eVoxFj8WQF
	cbEJVBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1WD-00000006MrX-24Sj;
	Tue, 23 Jun 2026 13:50:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1WC-00000006MrH-1O3U;
	Tue, 23 Jun 2026 13:50:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BAF84001F;
	Tue, 23 Jun 2026 13:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A441F000E9;
	Tue, 23 Jun 2026 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782222623;
	bh=07uoq0PIndTVBv8tgnHeAEJeFAtrzEKE7E1mnPuM/Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gtW8ybMCR3A8frppplBqKA6GR+ojYF+zzFnO8rMTDlzZXqh81kXWWIfEbS1bV+0ex
	 Pq1th8wk6FIFljyGQDEbPGKOeQaQFpBrhZqrcnoIgJdy0m6Fj0NCg1m/ifnlkD1dVb
	 fN9yLXJXV5rBTTfVwBDadrOrF49Tkpbf806Gy7XEQjQzI6wXMtZS21S1R3rjnyo34E
	 2oo7Cm5zFUH3NHHTfONxIriOOXGLStnIz2sTBgMmv6isAfxQyCGM2ixoAt+M2/ffLT
	 YnK2VTDwt1wRaxUln/ozWqe4nooDXt4Fc+q3/d7/eAUTXDjzD7jQntvBI2kwPO5b13
	 DR5xGFXyr+cMg==
Date: Tue, 23 Jun 2026 15:50:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alex Williamson <alex@shazbot.org>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, bhelgaas@google.com, 
	jjohnson@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-wireless@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <nlbqw3h2m6cux2cbpq2ka4kq7fl7qlizkndw5zltsqd3qf346n@xmxssbpalqih>
References: <n3maiuu5cctivlal4fozysz37ir6ecdfws5u2xxw2neclsfdfj@nsvwvlh7b4j5>
 <20260618063309.9536-1-jtornosm@redhat.com>
 <4wmbans3ae5ayxqvs3wwn4hg3r3dcjuugmw2akoihvry35bq6k@k5lm6zjrp44l>
 <20260622160822.09350246@shazbot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622160822.09350246@shazbot.org>
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

On Mon, Jun 22, 2026 at 04:08:22PM -0600, Alex Williamson wrote:
> On Mon, 22 Jun 2026 18:22:39 +0200
> Manivannan Sadhasivam <mani@kernel.org> wrote:
> 
> > On Thu, Jun 18, 2026 at 08:33:08AM +0200, Jose Ignacio Tornos Martinez wrote:
> > > Hi Mani,
> > > 
> > > Let me clarify the exact scenario and where the reset is necessary:
> > > 
> > > * For the commented WiFi devices (WCN6855/WCN7850):
> > > 
> > > Standard VFIO passthrough flow (this works fine):
> > >   1. Unbind native driver (ath11k/ath12k/MHI)
> > >   2. Bind vfio-pci driver
> > >   3. Assign device to VM
> > >   4. VM boots, loads its own driver → device works perfectly
> > >   5. VM shuts down cleanly → device can be reassigned → works fine
> > > 
> > > The problem occurs with unclean VM termination:
> > >   1. VM crashes or is force-terminated
> > >   2. VFIO tries to reset the device before reassignment
> > >   3. Without a working PCI reset method, reset fails
> > >   4. Device stuck in undefined state → cannot be reassigned to another VM
> > >   
> > >      Unbinding the driver again doesn't help because the device hardware
> > >      itself is in a bad state. From hypervisor:
> > >      $ lspci -vvv -s 0000:03:00.0
> > >         03:00.0 Network controller: Qualcomm Technologies, Inc (rev ff) (prog-if ff)
> > >             !!! Unknown header type 7f
> > >      And a full host power-cycle is necessary to recover.
> > >        
> > 
> > Can you try the global reset available in the WLAN device BAR space?
> > 
> > WCN6855: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/tree/drivers/net/wireless/ath/ath11k/pci.c#n193
> > WCN7850: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/tree/drivers/net/wireless/ath/ath12k/pci.c#n182
> > 
> > > * For the commented modem devices (SDX62/SDX65): 
> > > 
> > > Even worse because it fails during the first VM boot without proper reset
> > > capability, standard VFIO passthrough flow:
> > >   1. Unbind native driver (MHI)
> > >   2. Bind vfio-pci driver
> > >   3. Assign device to VM
> > >   4. VM boots, loads its own driver and crashes:
> > >      [   24.024165] mhi mhi0: Device failed to enter MHI Ready
> > >      [   24.024168] mhi mhi0: MHI did not enter READY state
> > >      
> > >      Unbind/rebind attempts fail:
> > >      [  352.643601] mhi mhi0: Requested to power ON
> > >      [  352.643611] mhi mhi0: Power on setup success
> > >      [  373.442954] mhi mhi0: Device failed to clear MHI Reset
> > >      [  373.442970] mhi mhi0: MHI did not enter READY state
> > >      And requires a full host power cycle to recover,
> > >      even outside of VFIO scenarios.
> > > 
> > > * MHI Host driver's remove callback may handle clean software state
> > > teardown, but it doesn't provide a PCI reset capability that VFIO can
> > > invoke. VFIO needs a reset method registered in the PCI reset hierarchy
> > > (device_specific, pm, flr, bus, etc.). VFIO invokes this reset both during
> > > initial device binding (before the VM starts) and when reassigning the
> > > device between VMs - without a working reset method, the device cannot
> > > reach a clean state for initialization.
> > >   
> > 
> > Likewise, there is a SoC reset available in the modem BAR space. You can try it:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/tree/drivers/bus/mhi/host/main.c#n178
> > 
> > If these works, then you can hook these in the device_specific reset callback.
> 
> 
> These look promising as simple flows to implement in a device specific
> reset: save command register, set memory enable, ioremap BAR space,
> match read/write/delay sequences of reset function and caller, iounmap,
> restore command.
> 
> Note the delay in this latter reset is in the caller.  It's also
> surprising that none of these implement a read to flush the posted
> write that initiates the reset.  I wonder if that contributes to the 2s
> delay in the latter example.
> 

While I agree that the absence of read-back after the posted write is a problem,
especially with a delay afterwards, the delay itself is required to let the
device reset itself and do a warm boot.

I'll submit fixes to do a read-back after triggering the reset to ensure that
the write gets flushed to the device before the delay.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

