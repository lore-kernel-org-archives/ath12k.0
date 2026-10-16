Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0614CC6B38
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 05:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktqFSsAx52niNcMbY6VRLuj3WY+yJAl8EZhfxOg24+s=; b=F5hH8ARR8fYEEH703B9YlCa0I9
	m87l7KCZ/jJa5etDrHyHCy/XEj77Q7FReH6MHauT8iAjJpWlnn5nGEwpESb3Es2+Qk0uvzOyeolG9
	CLy3U6seh/HZypFzZw/Ij0UK0ZWUZcFQrUw+1636HuQ8BC3ol+h9ILZ+DYJFT54Xz6ZLIWrBWcfCM
	8SVchepgBTs3PNV9+igdBnY5qU1WdBwgunenIYW+Gz/blUPMFNN9q3USzzE3J/RvdHbh4LW8WWI7Y
	lRoEH7GdfBYEis08BwGjprL367GrnhvQ7Bqn3lKZ9/7RNhS43GL+T8IvQzhRh4rtyDEbulcq1ELWi
	w5ykuwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaeT-000000022jn-1fZb;
	Fri, 16 Oct 2026 05:38:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaeR-000000022iY-2n93;
	Fri, 16 Oct 2026 05:38:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBAB7600D4;
	Fri, 16 Oct 2026 05:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45551F000C4;
	Fri, 16 Oct 2026 05:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792129122;
	bh=ktqFSsAx52niNcMbY6VRLuj3WY+yJAl8EZhfxOg24+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TGISrgXLsZT/CTjeLsAIaY1W0qIJ+pKBQSG0YeThNt4I/0JCvBaoFTZAPXWGmHCad
	 FsWo1l2SSLWIKzSvLrhQpv5RbEyMiS+3pLkdKeUqdI9Uk4YLk/L/vJ2HvpJaGqnDDO
	 +xukVVIwCLfi9Vf2MFtSwhWzIhF20wpuJ+19jo3+tYu6fOGJZ1jb3P3d7137vUmDcE
	 VXwdaCVqJW2wbuIlM5oNG8z7Xoa2OlFQ1P8YDaXGTBofxnC5/nd93f02C2zlRsXGwa
	 Es0sLy0Tre9LPf3lT0Es5b2CEG0RwsvGfI7IcwB7oqKiYzEIxG7NnvW+SDXs2+7s7s
	 tytdwblQwdoDA==
Date: Fri, 16 Oct 2026 11:08:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 1/8] PCI/ASPM: Always disable ASPM when driver
 requests it
Message-ID: <atG4Gaq7GLiq2H7t@debian>
References: <20260708-pci-aspm-fix-v3-1-6bd72451746e@kernel.org>
 <20261015230714.GA1802070@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015230714.GA1802070@bhelgaas>
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

On Thu, Oct 15, 2026 at 06:07:14PM -0500, Bjorn Helgaas wrote:
> On Wed, Jul 08, 2026 at 04:30:15PM +0200, Manivannan Sadhasivam wrote:
> > From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > 
> > PCI core/ASPM service driver allows controlling ASPM state through
> > pci_disable_link_state() API. It was decided earlier (see the Link
> > below), to not allow ASPM changes when OS does not have control over it
> > but only log a warning about the problem 'commit 2add0ec14c25 ("PCI/ASPM:
> > Warn when driver asks to disable ASPM, but we can't do it")'.
> > 
> > A number of drivers have added workarounds to force ASPM off with own
> > writes into the Link Control Register (some even with comments
> > explaining why PCI core does not disable it under some circumstances).
> > According to the comments, some drivers require ASPM to be off for
> > reliable operation.
> > 
> > Having custom ASPM handling in drivers is problematic because the state
> > kept in the ASPM service driver is not updated by the changes made
> > outside the link state management API.
> > 
> > As the first step to address this issue, make pci_disable_link_state()
> > to unconditionally disable ASPM so the motivation for drivers to come
> > up with custom ASPM handling code is eliminated.
> > 
> > To fully take advantage of the ASPM handling core provides, the drivers
> > that need to quirk ASPM have to be altered depend on PCIEASPM and the
> > custom ASPM code is removed. This is to be done separately. As PCIEASPM
> > is already behind EXPERT, it should be no problem to limit disabling it
> > for configurations that do not require touching ASPM.
> > 
> > Make pci_disable_link_state() function comment to comply kerneldoc
> > formatting while changing the description.
> > 
> > Link: https://lore.kernel.org/all/CANUX_P3F5YhbZX3WGU-j1AGpbXb_T9Bis2ErhvKkFMtDvzatVQ@mail.gmail.com/
> > Link: https://lore.kernel.org/all/20230511131441.45704-1-ilpo.jarvinen@linux.intel.com/
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > [mani: commit message fixup]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> I was a little confused about the provenance of this patch.  It
> *looks* like it should have been posted somewhere by Ilpo and
> something tweaked by Mani when applying, but none of the links above
> are a posting of this patch.  I dug around and found
> https://lore.kernel.org/linux-pci/20230918131103.24119-4-ilpo.jarvinen@linux.intel.com/,
> and this patch looks like basically the aspm.c part of it, so I assume
> that should probably be the https://patch.msgid.link/?
> 

Ilpo shared this patch during the review of v1 of this series:
https://lore.kernel.org/linux-pci/52baf40b-41ed-2588-7817-4d8cd859e0d1@linux.intel.com/

> To fix the provenance and the "Drivers can controlling" typo mentioned
> by Ilpo, I replaced this with just the aspm.c changes from
> https://lore.kernel.org/linux-pci/20230918131103.24119-4-ilpo.jarvinen@linux.intel.com/
> and added the CONFIG_PCIEASPM dependency to the commit log.  The code
> change is the same.
> 

This looks good to me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

