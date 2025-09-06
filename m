Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2104BCA101C
	for <ath12k@archiver.kernel.org>; Sat,  6 Sep 2025 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yxQ9EyK2pTr9vVhdT4MnxAghjUtIi6ijwxgT2P4Q5c=; b=DUk3dR8rm+PEdTL8TdgUDT6xIK
	yHd1tCkl1i3Wc1m5ZGTaQ8Tbp7exkMyphpV4wCO+Mwvfq/b1JHVa79WIn97zT+rlm7duWZnicfiAa
	C0Wnm9TvQPgmgXSszTQTtyX7Ue3L9+b1b3PjtSbbjJ30/b+kA5rHRz8eJMR9CMNRKSY77dNwLpKz/
	p3fbL+lnkcuFYDZUPTmzc0C4T9Ueag90TZ6EbGLZVhMPXXyr16olrUVj1IqcqGfHuTRv1g+cSa66p
	laXNz7jhuHESCLBpxBHi90aUZknygbejEX+9oYkRR4XPABQEkvIErYyjjQhXkBhu77Tw9cCLzE5gS
	H2qo+5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuuzF-000000081EM-3CNE;
	Sat, 06 Sep 2025 15:37:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuuzE-000000081DV-0dSj;
	Sat, 06 Sep 2025 15:37:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AE44601D7;
	Sat,  6 Sep 2025 15:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A68CC4CEE7;
	Sat,  6 Sep 2025 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757173074;
	bh=eXqndn9A8d2Q3IcwKZULqQ6qeZg1mGIiF7oNPpimTcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKYW6YY4tPWJv/ZQnUeI7fcMKU9JzBDQphos9U2d7sKnANJLDyHq1ldi0w9Sjku4e
	 Fz2M1qvzLf/EtldVTmcS/gO521zho7kqkI8nmM05fkADBS3yqKloP687Nfn+FFs4tm
	 YqQcQbRcNiObYnSfl7OzCPDmmGgl/FWo+9KNXB29m9GpEOkCWLbkA93+t6471MbOSO
	 Op7z7I+xx8muUcjETfDWg+qSseX9cMYIBraD6Q1C52jHzbYzF3l4nqhw8cWYnM6A//
	 cp2+xaeBLuh1ozk1JXv/5knstboMxTQKUkAzEEOAl+5w3CsrB9uDv/GJmIHzrOFeIE
	 ruveltpRtbCtg==
Date: Sat, 6 Sep 2025 21:07:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: David Box <david.e.box@linux.intel.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/8] PCI/ASPM: Fix the behavior of
 pci_enable_link_state*() APIs
Message-ID: <rci6ku374tvbco2leey3ccyjf4r6bfa6mdksasn2c26v2a5ydc@xqbccsco3x5o>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-2-61b2f2db7d89@oss.qualcomm.com>
 <f644fc83-31cc-1f0e-58cf-7c007e6173e4@linux.intel.com>
 <qfw7nv53hmy6whxnf4zqfdtvjzkdxkvxn7eghuxzuuojmvxl34@sxw2jvxze4wm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qfw7nv53hmy6whxnf4zqfdtvjzkdxkvxn7eghuxzuuojmvxl34@sxw2jvxze4wm>
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

On Tue, Aug 26, 2025 at 02:24:05PM GMT, David Box wrote:
> On Tue, Aug 26, 2025 at 03:55:42PM +0300, Ilpo Järvinen wrote:
> > +David
> > 
> > On Mon, 25 Aug 2025, Manivannan Sadhasivam via B4 Relay wrote:
> > 
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > 
> > > pci_enable_link_state() and pci_enable_link_state_locked() APIs are
> > > supposed to be symmectric with pci_disable_link_state() and
> > > pci_disable_link_state_locked() APIs.
> > > 
> > > But unfortunately, they are not symmetric. This behavior was mentioned in
> > > the kernel-doc of these APIs:
> > > 
> > > " Clear and set the default device link state..."
> > > 
> > > and
> > > 
> > > "Also note that this does not enable states disabled by
> > > pci_disable_link_state()"
> > > 
> > > These APIs won't enable all the states specified by the 'state' parameter,
> > > but only enable the ones not previously disabled by the
> > > pci_disable_link_state*() APIs. But this behavior doesn't align with the
> > > naming of these APIs, as they give the impression that these APIs will
> > > enable all the specified states.
> > > 
> > > To resolve this ambiguity, allow these APIs to enable the specified states,
> > > regardeless of whether they were previously disabled or not. This is
> > > accomplished by clearing the previously disabled states from the
> > > 'link::aspm_disable' parameter in __pci_enable_link_state() helper. Also,
> > > reword the kernel-doc to reflect this behavior.
> > > 
> > > The current callers of pci_enable_link_state_locked() APIs (vmd and
> > > pcie-qcom) did not disable the ASPM states before calling this API. So it
> > > is evident that they do not depend on the previous behavior of this API and
> > > intend to enable all the specified states.
> > 
> > While it might be "safe" in the sense that ->aspm_disable is not set by 
> > anything, I'm still not sure if overloading this function for two 
> > different use cases is a good idea.
> > 
> > I'd like to hear David's opinion on this as he grasps the ->aspm_default 
> > vs ->aspm_disable thing much better than I do.
> 
> The concern I see is that this would override the init-time blacklist which is
> set in pcie_aspm_sanity_check() and only consulted during initialization.
> __pci_disable_link_state() doesn't do this. It ORs in bits to aspm_disable.  By
> contrast, this change would clear bits from aspm_disable in the enable path,
> which allows ASPM to be enabled on links that pcie_aspm_sanity_check()
> determined should be disabled.
> 
> But I noticed the sysfs path, aspm_attr_store_common(), already permits this
> override. That may be unintentional though since the comment in
> pcie_aspm_sanity_check() implies the blacklist can only be overridden with
> pcie_aspm=force. At minimum, that needs to be clarified.
> 

Thanks for pointing out the blacklist devices issue. I have no concerns with
pcie-qcom as we are going to drop the pci_enable_link_state_locked() API anyway
from it. But I'm not sure about VMD as one may still connect pre 1.1 device to
it and observe issues.

So I'll create a separate API for this new behavior and use it with ath drivers
only since they know what kind of devices they are dealing with and since they
were changing the LNKCTL manually, there shouldn't be any issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

