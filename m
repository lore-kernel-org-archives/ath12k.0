Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB29CCD4F24
	for <ath12k@archiver.kernel.org>; Wed, 13 May 2026 11:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bq5nPZBrtofTc/PLgAQAjNmqAUgRMVNaxX7Ip5Cz9N4=; b=24GhXRjuOk5c6ePPkZvmFCiO8W
	Z+Z9HNtLp2kPXxjNw/3sDjGug/ESFPOO4ij9D45/PFCEbBw2vMGWT+/r5wvQfCTy40Olg1IkjHGL/
	9cCz39yO4FYaIJPySZn4S8v7tbe6OCN9I4IR5mW7cY/kVSAx2d+/+1snRil+fuqYAAEGpPy4Yl/Kv
	lGQ1tRS0u0q6xB5siBCAqJYCjj5GaWAZVWO0ftqBDtnbQlxhWIh/oaj7EASaAI10x8Kb0uBMkK6/4
	Spdwqm8/RzY5JSry0q55HLTZApC64B0UG6yNQdmvrS71/Al3b9GXB6ls7WXi1Jxk2V6TQRBxJ4t1g
	YFXh9xBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN7js-00000002LSA-1bSE;
	Wed, 13 May 2026 11:26:56 +0000
Received: from gollum.nazgul.ch ([82.197.176.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN7jp-00000002LQl-264Y
	for ath12k@lists.infradead.org;
	Wed, 13 May 2026 11:26:55 +0000
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id c8f6739e;
	Wed, 13 May 2026 13:26:49 +0200 (CEST)
Date: Wed, 13 May 2026 13:26:49 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Maxim Storetvedt <m.tvedt@tutanota.com>, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, jjohnson@kernel.org, kvalo@kernel.org, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: ath12k WCN7850: Q6 Hexagon fault at WLAON region 0x1792000 ~2s
 post-AUTHORIZE on X1E80100
Message-ID: <cz6dbqafvulifyrefsxzwrlq5z5uojylphqkq5oydbn2bvcns5@bhj3hr2rvxhq>
References: <g7dkeq3uwg7eby57zcuu5eysf4tqomh5civlvkpnlziipn6xis@45eevyzgfmaq>
 <0b450204-9afc-4ba1-b9c5-1876b5a7078a@oss.qualcomm.com>
 <tzkh5t3bmiqff67g72rihapizz2u2dlj4xfrr324d6yg4rtltt@3qrsymzw7c2c>
 <92ace4b9-143e-4962-90fa-215a22e24796@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ace4b9-143e-4962-90fa-215a22e24796@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_042653_857628_54772582 
X-CRM114-Status: GOOD (  39.29  )
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

On Wed, May 13, 2026 at 11:05:05AM +0800, Baochen Qiang wrote:

> 
> 
> On 5/13/2026 3:59 AM, Marcus Glocker wrote:
> > On Tue, May 12, 2026 at 11:38:06AM +0800, Baochen Qiang wrote:
> > 
> >>
> >>
> >> On 5/5/2026 5:08 AM, Marcus Glocker wrote:
> >>> Hi,
> >>>
> >>> We're porting ath12k to OpenBSD as the qwz(4) driver, targeting Samsung
> >>> Galaxy Book4 Edge (X1E80100 SoC, WCN7850 hw2.0).  Scan, auth, 4-way
> >>> handshake all complete; ~2 seconds after WPA2 AUTHORIZE the WCN7850
> >>> firmware crashes deterministically with:
> >>>
> >>> 	dlpager_main.c:147 Non Page Fault Exception cause code 0x 23
> >>> 	at Address: 0x 1792000
> >>>
> >>> Cause code 0x23 isn't a valid arm64 exception -- the fault is on the
> >>> WCN7850's on-die Hexagon Q6 DSP, with QURT's generic exception handler
> >>> (which happens to live in dlpager_main.c) printing it.  So this is not
> >>> a host CPU fault.
> >>>
> >>> Per the RDDM segment table (at the start of the dump), VA 0x01792000
> >>> is the start of the chip's WLAON_DUMP region (size 0x820).  The Q6 is
> >>> trying to read its own always-on hardware state region and the chip
> >>> refuses the access.
> >>>
> >>> (Samsung, Asus, Honor) with multiple FW builds.  Currently testing
> >>> with WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> >>> (fw 0x110cffff, 2025-06-25) -- the exact blob a Linux ath12k user
> >>> runs successfully on the identical Samsung hardware.  Same board-2.bin,
> >>> same compiled DTB (upstream hamoa.dtsi based).
> >>>
> >>> We've field-compared qwz against ath12k and ruled out (byte-level or
> >>> wire-level):
> >>>
> >>>   * QMI host_cap, m3_info, wlan_cfg, wlan_ini, bdf_download (all
> >>>     fields including ce_config, svc_to_ce_map, shadow_reg_v3,
> >>>     feature_list, m3 paddr/size, nm_modem)
> >>>   * MHI bringup ordering (BHI -> wait SBL EE -> wait M0 -> BHIE)
> >>>   * BHI/BHIE DMA coherency
> >>>   * ASPM disable before MHI start
> >>>   * WLAON_WARM_SW_ENTRY zeroing + QFPROM_PWR_CTRL VDD4BLOW clear
> >>>   * static_window_map=false + window-bank register init
> >>>   * Per-chunk vs monolithic respond_mem allocation
> >>>   * WMI_PEER_MIMO_PS_STATE = WMI_PEER_SMPS_PS_NONE (added matching
> >>>     ath12k_setup_peer_smps; doesn't help)
> >>>   * FW image variation (c5 and c7 both fail identically)
> >>>
> >>> Specifically NOT involved (we have evidence either way):
> >>>
> >>>   * Gunyah -- X1E80100 is reportedly run in EL2 without Gunyah by
> >>>     users where ath12k works; so Gunyah isn't programming WLAON
> >>>     access for the Q6.
> >>>   * SMMU / pcie_smmu -- pcie_smmu is status="reserved" upstream,
> >>>     pcie4 has no iommus property; PCIe DMA bypasses SMMU.
> >>>   * SCM/PAS -- ath12k's PCIe path makes no qcom_scm_* calls.
> >>>
> >>> Question: what subsystem inside the WCN7850 firmware touches the
> >>> WLAON region at 0x01792000 around 2 seconds after the host sends
> >>> WMI_PEER_AUTHORIZE?  And what host-side configuration (WMI command,
> >>> HTT message, MHI state, etc.) primes that path so the access
> >>> succeeds on Linux?
> >>>
> >>> Even a pointer at the right Linux code path or the right FW-side
> >>> component would unblock us.  We have full RDDM dumps and dmesg
> >>> captures available; happy to share off-list or as attachments.
> >>
> >> please help collect ath12k successful dmesg log and qwz failed dmesg log for compare.
> >>
> >> Please enable verbose ath12k log when loading ath12k driver:
> >>
> >> If you are using the latest upstream ath12k:
> >>
> >> 	sudo modprobe ath12k debug_mask=0xffffffff
> >> 	sudo modprobe ath12k_wifi7
> >>
> >> If you are using an old ath12k:
> >>
> >> 	sudo modprobe ath12k debug_mask=0xffffffff
> >>
> >>>
> >>> Thanks,
> >>> Marcus
> >>>
> >>
> > 
> > Hi Baochen,
> >                                         
> > Thanks for coming back on this topic.
> >                                         
> > Attached the OpenBSD dmesg, with full ath12k driver debug logging
> 
> the dmesg shows several WMI_INIT cmd instances which is not expected, because in normal
> operation this command should be sent only once.
> 
> cat dmesg |grep -w 'sending WMI command 0x1'
> May 12 19:35:46 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
> May 12 19:37:20 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
> May 12 19:37:41 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
> May 12 19:37:46 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
> May 12 19:37:50 x1e /bsd: qwz_wmi_cmd_send_nowait: sending WMI command 0x1
> 
> other than that I don't find any other clues.

Yes, that is specific to the OpenBSD NIC framework.  I've just tested
a quick hack with which the WMI_INIT cmd only gets issued once, but it
makes no difference to the firmware crash.
 
> > enabled, plus the resulting RDDM binary after the firmware crash:
> 
> how did you collect the RDDM binary, seems not in the right format, my tool can not parse
> it correctly. Looking into the binary, at least the magic 'ATH12K-FW-DUMP' is not present
> at the very beginning.

It looks like ath12k wraps the raw RDDM dump in some ath12k firmware
dump structure, which we don't do with our driver.  I did write a small
conversion program, trying to generate the dump which you expect.  You
can find the converted dump file here:

https://nazgul.ch/pub/qwz0-rddm.bin.out.gz

I hope you can load that in to your tool.

> And from which Linux version you take the ath12k codebase?

Well, that is a good question.  qwz (the ath12k OpenBSD driver), is
an initial clone of the qwx (the ath11k OpenBSD driver), which is
functional.  On top of that we did changes, of which the recent ones
did sync missing functionality from the Linux ath12k driver.  We did
already do a lot of comparison between qwz and the ath12k driver, but
we can't spot an obvious difference which could explain the firmware
crash.  Obviously doesn't mean that there isn't a gap between qwz and
ath12k related to this issue which we don't see.

> > 
> > https://nazgul.ch/pub/qwz0-rddm.bin.gz
> >                                         
> > The command sequence on OpenBSD to re-produce that was:
> >                                         
> > ifconfig qwz0 up                        # Bring the ath12k device up
> > ifconfig qwz0 scan                      # Scan for networks
> > ifconfig qwz0 nwid nazgul wpakey xxx    # Start association
> >                                         
> > Hi Max,
> >                                         
> > Since you have Linux running on exactly the same Samsung Galaxy Book4
> > Edge 14" laptop, where ath12k works, would you be so kind and also
> > provide the dmesg output showing an successful association with the
> > ath12k driver debug logging enabled?  See above how to enable that.
> > That would be very helpful!
> >                                         
> > Thanks and Regards,
> > Marcus
> 

