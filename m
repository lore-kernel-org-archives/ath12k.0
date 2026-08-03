Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62F1C55184
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nSgj8zlDZc5joIVlXlduVr+DQqNvZ+EbjUHgczdt5o=; b=IQ4Zib+p2JSIgPSMMseRK7eQ/C
	60dFllR1kPNGvtqTsIVNZ5bfmOHxNvYPOfskEVXsdEwI94RsxFuwD3AzaQjaoegMHV0C4qyEfkPIK
	sR2/Jz2L1Bxq4toj3yKy+K2R1sk2l2QYDpBNVKP7na1eC7w2POthAVmSkQAO76ZWmB9NUdB48AmBR
	O7Ga89XzlRydndGxWxtyY2FdF1IjJNnKSKh0x9jXfKQgamw3h4D2koLb7WWNTwr6KUywipzQB6US8
	kDxObNqCCsQrJra4gBWulYqU4rebsRb3hIYnwpLfufzpJ3baB6dVITHmBdZWW9EJjHo4gosQdIAfB
	p7mRF3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqw9w-00000000BWE-1K3T;
	Mon, 03 Aug 2026 17:09:04 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqw9t-00000000BVQ-2my2;
	Mon, 03 Aug 2026 17:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785776942; x=1817312942;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=I6zcxJO/xtHszKp/1BchexOKkdlM6T63zoh6Dkdw3aA=;
  b=oHsxQLsS74boDVEapf1Qvcqnh+1+/vUaM47+Lub8MpY6D7oNtt1W8Rxt
   6C1GJsNo8diOy7oLH1xrLvyC1pH+Pg27cbHBaMo532PbsWRh+InqJIra+
   5hsF9i+khuc07KStlpYfZ2fzv6UCUDOKUPVP2d5iDasrU+vfOVGufzSVy
   nfpr3f4xZ7HuRDk58ACXgiM4y1oR/S0qpQq5vBHSXWyAfLOlG9Ty6TDkF
   DAEw1PHRO/VnRK9cgfcKLtI8QFeK3X6PjRQTRWdc8O16uia8C7oyfQ6Mq
   Igbj94TAEA6HTSa+OtkZZ2RB/83XNOfm4ZBB557a0bLF0wdhHUglk9cKW
   g==;
X-CSE-ConnectionGUID: ssKp4L1vQKKcPf2lQXK/Gw==
X-CSE-MsgGUID: htkK7x3IShWwNBqn8R7HAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86267667"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86267667"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 10:09:01 -0700
X-CSE-ConnectionGUID: tVLy63j4QYumtUhtBPDFUQ==
X-CSE-MsgGUID: yd4EEuREQdqDZBXrpIDoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="256951519"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 10:08:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Aug 2026 20:08:51 +0300 (EEST)
To: Manivannan Sadhasivam <mani@kernel.org>
cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
    Jonathan Derrick <jonathan.derrick@linux.dev>, 
    Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, 
    linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
    ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    Qiang Yu <qiang.yu@oss.qualcomm.com>, 
    Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/8] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
In-Reply-To: <lmmrcv2dpuitbqmuargtsbk647z66gs6aqanzis226py2hjhys@d5h5p6ltmg4e>
Message-ID: <658436eb-af18-4343-67db-63e484617239@linux.intel.com>
References: <20260708-pci-aspm-fix-v3-6-6bd72451746e@kernel.org> <20260710202546.GA989860@bhelgaas> <lmmrcv2dpuitbqmuargtsbk647z66gs6aqanzis226py2hjhys@d5h5p6ltmg4e>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_100901_768309_0FBCF09B 
X-CRM114-Status: GOOD (  29.46  )
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

On Fri, 31 Jul 2026, Manivannan Sadhasivam wrote:
> On Fri, Jul 10, 2026 at 03:25:46PM -0500, Bjorn Helgaas wrote:
> > On Wed, Jul 08, 2026 at 04:30:20PM +0200, Manivannan Sadhasivam wrote:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > 
> > > It is not recommended to enable/disable the ASPM states on the back of the
> > > PCI core directly using the LNKCTL register. It will break the PCI core's
> > > knowledge about the device ASPM states. So use the APIs exposed by the PCI
> > > core to enable/disable ASPM states.
> > > 
> > > Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > > 
> > > Reported-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > ---
> > >  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
> > >  drivers/net/wireless/ath/ath12k/pci.c   | 19 +++----------------
> > >  drivers/net/wireless/ath/ath12k/pci.h   |  4 +++-
> > >  3 files changed, 7 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> > > index 4a2b240f967a..7852ede3eaea 100644
> > > --- a/drivers/net/wireless/ath/ath12k/Kconfig
> > > +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> > > @@ -1,7 +1,7 @@
> > >  # SPDX-License-Identifier: BSD-3-Clause-Clear
> > >  config ATH12K
> > >  	tristate "Qualcomm Wi-Fi 7 support (ath12k)"
> > > -	depends on MAC80211 && HAS_DMA && PCI
> > > +	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM
> > 
> > As Sashiko pointed out [1], I think adding the PCIEASPM dependency is
> > an issue.  The PCI core should provide stubs or whatever is necessary
> > to make ath12k work even if PCIEASPM isn't selected.
> > 
> > I'm guessing this hardware depends on the ability to disable ASPM even
> > without PCIEASPM so we probably would need more than just empty stubs.
> > We do build aspm.c unconditionally now and we provide LTR and L1SS
> > save/restore regardless of PCIEASPM.  Maybe we need something similar
> > here.
> > 
> 
> This was discussed in v2 and Ath maintainer Jeff was in agreement with the
> dependency:
> https://lore.kernel.org/linux-pci/705a4fe5-658e-25ac-9e4d-6b8089abca46@linux.intel.com

To further that, any driver that has to disable ASPM clearly does depend 
on capacility to disable ASPM. So having depends on PCIEASPM makes perfect 
sense in these cases. I suppose the status quo of drivers doing that on 
their own has just gotten many blind for that obvious dependency.

In any case, PCIEASPM is gated by EXPERT so one should really know what 
one is doing if one is goind to disable it, if that ends up losing some 
driver that depends on PCIEASPM important for that config minimalist, 
clearly the person wasn't expert enough to touch that config option :-).

So I think sashiko is simply wrong in this case, and having empty stubs is 
wrong as well because it encourages drivers to do driver-side ASPM disable 
behind core's ASPM back.

I don't see much benefit from letting these drivers to build without 
PCIEASPM (the non-empty "stubs" approach Bjorn suggests). Is that ability 
to satisfy some extreme config minimalist who wants to partially disable 
ASPM on system that has a broken HW? Or just to make sashiko happy? Why 
make things harder than what "depends on PCIEASPM" already provides for 
us, regardless of sashiko thinking we "lose" something in that trade.

I, on the other hand, think it's win to properly mark drivers that need 
PCIEASPM with depends on, even if it's just for the capability to disable 
ASPM.

-- 
 i.


