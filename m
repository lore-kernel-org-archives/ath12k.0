Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B15CA5FDD
	for <ath12k@archiver.kernel.org>; Fri,  2 Oct 2026 21:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=61/R3wV1NWOE7HoqVebj9mBBmgNaHG+WOnm/3sC4cmQ=; b=sUDGDH23nPCPXO
	eHTKM0D12xK8aqrEJBJxyuaZGdzlL9QNMW8edLFqMiT/kINvbNZh+k+eIcNiCRC52JNaUJaCe34M6
	S7fuCfEL5wLjiBy1x3YUqSHR44pdKoDdoiCWbD2p9QVqxqam+jm3H3nUxgY9OPmq4wKNIXD/68rSK
	rNo3PThRWGZJ0IcPZZUNEcdI/jfGj8Q/J43H8ZkidKMPs1pCLK7y5S6uivFaGlBkOofGTCreS7Lij
	IjuY24UHoxKvoOYuwCTOoT3eb+8VVaPkBXuJud6sFZtN7T1wGefsiqO0kqOLh1U5aqTtERmLEHU30
	xxkzePABjPXytS3KyyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCl03-0000000CXn2-1CjZ;
	Fri, 02 Oct 2026 21:41:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCl01-0000000CXmi-0jaG;
	Fri, 02 Oct 2026 21:41:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8803F44018;
	Fri,  2 Oct 2026 21:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093F71F000FF;
	Fri,  2 Oct 2026 21:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977260;
	bh=61/R3wV1NWOE7HoqVebj9mBBmgNaHG+WOnm/3sC4cmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=QLeXmgTDJEE8p5eWTzIXSvYXsfvtao+l8O8886gPdU1izn35ejFHcWBvDWnftjgDw
	 ZxiJvtS1vONSgMAEkyW0mOlyURTGbgSjHJmpKwbfQ5NsVblwokR3GXK5u7ff//bVL6
	 mp9IiYPz+CmRPKkF4c754VWqF5xLjibG8VtpoQVu8Sf/BzmHHfTUukmPdmfFStm5iz
	 4TSRk9l1CBq54U+4nwwnqkKrmG2Vef2V1GChyQjuWaJ7JxLi7JgQVxU1TI2dntf3Li
	 tPQhO8cho59LNs5j6EegyuBt3w9L4GjFadc1h2kcML6BaiShNUh58so/5IER2kHC8N
	 j7LQiwQDB//hg==
Date: Fri, 2 Oct 2026 16:40:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Alex Williamson <alex@shazbot.org>
Cc: bhelgaas@google.com, mani@kernel.org, jjohnson@kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v14 0/2] PCI: Add device-specific reset for Qualcomm
 devices
Message-ID: <20261002214058.GA284603@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917071651.14174-1-jtornosm@redhat.com>
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

[cc->to: Alex, +cc Jason]

On Thu, Sep 17, 2026 at 09:16:49AM +0200, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (WCN6855, WCN7850 WLAN; SDX62/SDX65 modems)
> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset (addressed by quirk_no_bus_reset, merged for v7.2).

Specifically, 6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm
WCN6855/WCN7850 WiFi, SDX62/SDX65 modems").  I don't know what the
behavior was prior to that commit.  I suppose it was something
obvious?

> VFIO attempts to reset devices on every reassignment:
> - For the listed modems, without a proper reset capability, these devices
> never successfully initialize even on first VM assignment.
> - For the listed WLAN devices, without a working reset method, the attempt
> fails. On clean VM shutdown, the guest driver properly deinitializes the
> device via .shutdown/.remove callbacks, leaving it in a usable state despite
> the failed reset. However, on unclean VM termination (crash, force-off), the
> guest driver callbacks are not triggered, the device remains in an undefined
> state (DMA active, interrupts enabled, etc.), and without a working reset it
> cannot be reused.

So IIUC, prior to these patches, these devices were functional when
passed through to several successive guests as long as the guests shut
down cleanly, but the resets done by VFIO didn't work, so the host
couldn't enforce isolation between those guests.

If true, I propose updating the commit logs to emphasize the lack of
isolation and de-emphasize the VM clean shutdown vs crash behavior,
e.g.:

  Resets of this device always failed prior to this commit, so VFIO on
  the host could not enforce isolation between successive passthrough
  users.

  If a guest driver deinitialized the device, it may have been
  functional if passed through to a subsequent guest, despite the lack
  of isolation.  Otherwise the device may have been left in an
  undefined state (e.g., DMA and interrupts active) and unusable.

It would also be great to have Alex's ack here.

> Add device-specific reset methods using BAR-space hardware reset registers
> that exist in these devices:
> 
>   Patch 1: SDX62/SDX65 modem reset via MHI SoC reset
>   Patch 2: WCN6855/WCN7850 WLAN reset via SoC global reset
> 
> These are true hardware reset mechanisms (not power management or firmware
> error recovery), providing proper device reset for VFIO scenarios.
> 
> Testing shows stable operation over 100+ VM crash/reset cycles. Device-
> specific reset is position #1 in the reset hierarchy, so these devices
> will use hardware reset as their primary reset method.
> 
> Jose Ignacio Tornos Martinez (2):
>   PCI: Add device-specific reset for Qualcomm SDX62/SDX65 modems
>   PCI: Add device-specific reset for Qualcomm WCN6855/WCN7850 WLAN
> 
>  drivers/pci/quirks.c | 116 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> ---
> v14: Address Bjorn Helgaas feedback:
>   - Split WLAN and modem resets into two separate patches
>   - Clarify commit message for WLAN devices: VFIO resets on every
>     reassignment, clean shutdown leaves device in usable state via
>     driver callbacks, but unclean termination is where the lack of reset
>     is critical
>   - No code changes from v13, only patch split and commit message
>     clarification (Mani's Reviewed-by retained)
> v13: https://lore.kernel.org/all/20260915223634.GA878346@bhelgaas/
> 
> --
> 2.54.0
> 

