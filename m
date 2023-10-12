Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051EACDB46E
	for <ath12k@archiver.kernel.org>; Thu, 12 Oct 2023 10:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4ZJLqdPsxXUpBQU5XMvfCGOzwGP0j+sY0P+HaEA1YI=; b=v86hBHsPWzYP3LNOg6BQpclpeI
	aQeWnEP5eLjo7PMwJa7XCb5lzcvQWauwO1e/UQKHlXt4W8J71EGjgDXTAGQ5P9pf/hasHmWESNUfO
	ONZsw/EPjBpjru6S1+papJJwz1cYY2u1pNI+qrbz7hoMdfCWV5dmW1x55TaZw//h8nTem/rC8wz7v
	Drzfa3LvoXBLNcjt4i+7QOta0i4EwPLrrlh3+7B0ujMQ9kTfNts4hf3rTo0TyGQEFzC6dCtu3KL5I
	mZpJ7yO146oUri58x5dnHQk2fkCk7Dl+QkXChnDt7e1CPIQnwMx0N3w2Sah+nYvwDVJJzPB0Tw/aY
	P9WatJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtMi-000iJq-1y
	for ath12k@archiver.kernel.org;
	Thu, 12 Oct 2023 10:56:28 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtMf-000iIz-2V;
	Thu, 12 Oct 2023 10:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697108186; x=1728644186;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ncUYHUPUudbeDBu1X+DbOYSPV06JH2dv47rcK32PQ+0=;
  b=XbQ5cHut39GU+sCjyTF1Uyy+KgtcMhRoY1HUoC9XZg3r12SlRW925fFy
   S1t7OwiuLk4TWK56G6Os1JYg9OdvD9N3UCwWnIZ1xH2jzDFQYlivXEBBt
   fB0AMwYiAyurcIiViHKoXzt7J8UGCnbVi6SzzEUTMcDRckPYmR+w/DyXk
   9+LufoCXMoIy/yj/d6X5nA0G1xroQk/t2k65XWejEoSHhZTigRwnfyIMF
   nb4DbpA4/iq/AwOEpcfQ8fLY0KTbTwTuc6+9yVGLKIaOagJ14ADfHKOHc
   szZ8rsDSrWpexuHCfrZvjbXChKiG/QFdrQH35abmrlyqDZ5ekRdAbDJj9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3483262"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="3483262"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 03:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="789349717"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="789349717"
Received: from asroczyn-mobl.ger.corp.intel.com ([10.249.36.107])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 03:56:18 -0700
Date: Thu, 12 Oct 2023 13:56:16 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
    "Rafael J . Wysocki" <rafael@kernel.org>
cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    Rob Herring <robh@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Lukas Wunner <lukas@wunner.de>, Heiner Kallweit <hkallweit1@gmail.com>, 
    Emmanuel Grumbach <emmanuel.grumbach@intel.com>, 
    LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
    ath12k@lists.infradead.org, intel-wired-lan@lists.osuosl.org, 
    linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org, 
    linux-wireless@vger.kernel.org, Netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 03/13] PCI/ASPM: Disable ASPM when driver requests
 it
In-Reply-To: <20231011212206.GA1043224@bhelgaas>
Message-ID: <aa3386a4-c22d-6d5d-112d-f36b22cda6d3@linux.intel.com>
References: <20231011212206.GA1043224@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1326969328-1697108183=:1692"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_035625_857241_2BEE7D57 
X-CRM114-Status: GOOD (  32.27  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1326969328-1697108183=:1692
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 11 Oct 2023, Bjorn Helgaas wrote:

> On Mon, Sep 18, 2023 at 04:10:53PM +0300, Ilpo Järvinen wrote:
> > PCI core/ASPM service driver allows controlling ASPM state through
> > pci_disable_link_state() and pci_enable_link_state() API. It was
> > decided earlier (see the Link below), to not allow ASPM changes when OS
> > does not have control over it but only log a warning about the problem
> > (commit 2add0ec14c25 ("PCI/ASPM: Warn when driver asks to disable ASPM,
> > but we can't do it")). Similarly, if ASPM is not enabled through
> > config, ASPM cannot be disabled.
> > ...
> 
> > +#ifndef CONFIG_PCIEASPM
> > +/*
> > + * Always disable ASPM when requested, even when CONFIG_PCIEASPM is
> > + * not build to avoid drivers adding code to do it on their own
> > + * which caused issues when core does not know about the out-of-band
> > + * ASPM state changes.
> > + */
> > +int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
> > +{
> > +	struct pci_dev *parent = pdev->bus->self;
> > +	struct pci_bus *linkbus = pdev->bus;
> > +	struct pci_dev *child;
> > +	u16 aspm_enabled, linkctl;
> > +	int ret;
> > +
> > +	if (!parent)
> > +		return -ENODEV;
> 
> P.S. I think this should look the same to the user (same dmesg log and
> same taint, if we do that) as the CONFIG_PCIEASPM=y case.

Okay.

> > +	ret = pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &linkctl);
> > +	if (ret != PCIBIOS_SUCCESSFUL)
> > +		return pcibios_err_to_errno(ret);
> > +	aspm_enabled = linkctl & PCI_EXP_LNKCTL_ASPMC;
> > +
> > +	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &linkctl);
> > +	if (ret != PCIBIOS_SUCCESSFUL)
> > +		return pcibios_err_to_errno(ret);
> > +	aspm_enabled |= linkctl & PCI_EXP_LNKCTL_ASPMC;
> > +
> > +	/* If no states need to be disabled, don't touch LNKCTL */
> > +	if (state & aspm_enabled)
> > +		return 0;
> > +
> > +	ret = pcie_capability_clear_word(parent, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_ASPMC);
> > +	if (ret != PCIBIOS_SUCCESSFUL)
> > +		return pcibios_err_to_errno(ret);
> > +	list_for_each_entry(child, &linkbus->devices, bus_list)
> > +		pcie_capability_clear_word(child, PCI_EXP_LNKCTL, PCI_EXP_LNKCTL_ASPMC);
> 
> This disables *all* ASPM states, unlike the version when
> CONFIG_PCIEASPM is enabled.  I suppose there's a reason, and maybe a
> comment could elaborate on it?
>
> When CONFIG_PCIEASPM is not enabled, I don't think we actively
> *disable* ASPM in the hardware; we just leave it as-is, so firmware
> might have left it enabled.

This whole trickery is intended for drivers that do not want to have ASPM 
because the devices are broken with it. So leaving it as-is is not really 
an option (as demonstrated by the custom workarounds).

> > +
> > +	return 0;
> > +}
> 
> Conceptually it seems like the LNKCTL updates here should be the same
> whether CONFIG_PCIEASPM is enabled or not (subject to the question
> above).
> 
> When CONFIG_PCIEASPM is enabled, we might need to do more stuff, but
> it seems like the core should be the same.

So you think it's safer to partially disable ASPM (as per driver's 
request) rather than disable it completely? I got the impression that the 
latter might be safer from what Rafael said earlier but I suppose I might 
have misinterpreted him since he didn't exactly say that it might be safer 
to _completely_ disable it.

-- 
 i.

--8323329-1326969328-1697108183=:1692
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

--8323329-1326969328-1697108183=:1692--

