Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB229CA5FE3
	for <ath12k@archiver.kernel.org>; Fri,  2 Oct 2026 23:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=mN4BUccomOxQP6dbLy3uvQNSnAAqcoTSVXqAPXIymNY=; b=Pl4jdOm45YId/t
	+BaKCXHZ4jZzlzbWjE9PdiYe13gHv9+rf5frGkhgrDbJnBS4bZ3pbFAfRDfv4EFe2DJK7NmzZyJcj
	VxsoAnXqMkhxcCYyysZrQYrRSGpIwQtQDiALygR+hI9La5UTDU//3O8wCqDWPq3KgaeBqkGgV7kq0
	dVg1Hk0jY6N89zsXdWwWfZ0KSAq5NVCnpikbJ1z99GkFSacBojjMtnBn2L1Ff48iThWTyX+5itkj9
	Eyqy0ob2VMgjOG8ljIk004LDXCIuYp00dbonj4SSq6e/5afm4qQYcuskWdMyOodKwXp9UYRSnOIHy
	/S7tddHWfGpdDvXSjlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmyn-0000000CkgF-0Y57;
	Fri, 02 Oct 2026 23:47:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmyl-0000000Ckfm-3SaW;
	Fri, 02 Oct 2026 23:47:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5077843C52;
	Fri,  2 Oct 2026 23:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0362B1F000FF;
	Fri,  2 Oct 2026 23:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790984871;
	bh=mN4BUccomOxQP6dbLy3uvQNSnAAqcoTSVXqAPXIymNY=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=PRabq4VU4ZLHFbxtawTgO6RXWIeLXb6I4LbdyVZboLOfbiCesxv0UKv8vK1UIytj1
	 wXmTfmTN1Bu1A7mkDrT1Z8OK5IVtSYeeaYlp8UJUa/nVXBAcTTByRRI3zpknkCtAyy
	 y7ukLW4ydY6pn1zVUQmxQkLoCJi4oNdForZ0I1xz1dVX1L+rX1k7cmYd21/4KLwjkg
	 /uaZ54lo+pyKodDxeYdvVbzeC5NCiEr2EBkxGlHTsSP7pbRhpjEsWEdg1S39TiNziT
	 JmYpQP8SbG/27yiI1AP8MMJ7YKil7aeLBo+xEpAiBy1sYi16BcGx3oOdwvHOocSYsI
	 vy3G8KKEPXPmQ==
Date: Fri, 2 Oct 2026 18:47:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Williamson <alex@shazbot.org>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, bhelgaas@google.com,
	mani@kernel.org, jjohnson@kernel.org, linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v14 0/2] PCI: Add device-specific reset for Qualcomm
 devices
Message-ID: <20261002234749.GA411439@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002170949.59c3d47a@shazbot.org>
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

On Fri, Oct 02, 2026 at 05:09:49PM -0600, Alex Williamson wrote:
> On Fri, 2 Oct 2026 16:40:58 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > [cc->to: Alex, +cc Jason]
> > 
> > On Thu, Sep 17, 2026 at 09:16:49AM +0200, Jose Ignacio Tornos Martinez wrote:
> > > Some Qualcomm PCIe devices (WCN6855, WCN7850 WLAN; SDX62/SDX65 modems)
> > > lack working reset methods for VFIO passthrough scenarios. These devices
> > > have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> > > broken bus reset (addressed by quirk_no_bus_reset, merged for v7.2).  
> > 
> > Specifically, 6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm
> > WCN6855/WCN7850 WiFi, SDX62/SDX65 modems").  I don't know what the
> > behavior was prior to that commit.  I suppose it was something
> > obvious?
> > 
> > > VFIO attempts to reset devices on every reassignment:
> > > - For the listed modems, without a proper reset capability, these devices
> > > never successfully initialize even on first VM assignment.
> > > - For the listed WLAN devices, without a working reset method, the attempt
> > > fails. On clean VM shutdown, the guest driver properly deinitializes the
> > > device via .shutdown/.remove callbacks, leaving it in a usable state despite
> > > the failed reset. However, on unclean VM termination (crash, force-off), the
> > > guest driver callbacks are not triggered, the device remains in an undefined
> > > state (DMA active, interrupts enabled, etc.), and without a working reset it
> > > cannot be reused.  
> > 
> > So IIUC, prior to these patches, these devices were functional when
> > passed through to several successive guests as long as the guests shut
> > down cleanly, but the resets done by VFIO didn't work, so the host
> > couldn't enforce isolation between those guests.
> > 
> > If true, I propose updating the commit logs to emphasize the lack of
> > isolation and de-emphasize the VM clean shutdown vs crash behavior,
> > e.g.:
> > 
> >   Resets of this device always failed prior to this commit, so VFIO on
> >   the host could not enforce isolation between successive passthrough
> >   users.
> > 
> >   If a guest driver deinitialized the device, it may have been
> >   functional if passed through to a subsequent guest, despite the lack
> >   of isolation.  Otherwise the device may have been left in an
> >   undefined state (e.g., DMA and interrupts active) and unusable.
> > 
> > It would also be great to have Alex's ack here.
> 
> Yes, aiui it's an isolation and repeatability issue.  In fact, without
> knowing what's actually stored in the hardware, I'd suspect it's more
> the latter and the testing proves that.  Mani is really the one
> vouching for it from the hardware, isolation perspective.
> 
> Standard reset methods have never worked on these devices and that's
> now evident by the quirks that disable them for these devices.  This
> fills the remaining gap by providing device specific resets for the same
> hardware.
> 
> Both patches should properly reference the quirk_no_bus_reset commit,
> but otherwise these look correct, afaict.
> 
> Acked-by: Alex Williamson <alex@shazbot.org>

Thanks, Alex!

