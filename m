Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DD5CA1012
	for <ath12k@archiver.kernel.org>; Sat,  6 Sep 2025 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=popj7jVN7HyZNAr6hNoShTgCXv1ADnvUW/oI6+mWk1M=; b=aIFm1Rlxr6O5Vv+7tKwPk9gjXq
	CyniEJgtrJXmvI1ZPTy77zxS+gmbdmIaBNw4TU2omgpEmZdJ/hn8jB+kLgTik9mlg7PpojXxoahGB
	SGrqwoE+Re2SxaQwO3CrWOFXzIh8cB/yEsknPTSbElQXJLidGplYJJLAtiC63/yf8LT2/fl9viSiy
	HfB3OPECF1xRYN1aljQO0dex9MrC8CSF4b/UV3weOKcp/wLTm5ljUwRiFnC//YW0ZgGYKingk2Wzv
	McLAnk1HKwAl2ZsT2CuZBWfbvVaKEOjunYNVSNaITn8vjSRiBG6Vy+uoEObKZvWc+iCXz48WkQ9Jq
	DOlaCHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuuIo-00000007xnY-1R7l;
	Sat, 06 Sep 2025 14:54:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuuIm-00000007xn8-0ggz;
	Sat, 06 Sep 2025 14:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46333601D7;
	Sat,  6 Sep 2025 14:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B723BC4CEE7;
	Sat,  6 Sep 2025 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757170442;
	bh=9lGK3si2C+6VrnNOpedp6M1LTDiz7pJw+iJuj1mVc8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBqDCaiM+rFCZzSGqiDnmVRE5l5WyyF/DHEzciVNr/+bl+7y+3ROTm1DIid5X6XWE
	 JNcs+Sxe6Sx4K2TZvwxjwudbYI1vZAtGqWhfddeLmJzfU3LZY8qhq4CCiUat7vJGnU
	 v3ieSDu/GoiJa4ADqLsCBvxtlsVwPPSXGHJmbEubiQ1CjC0ov0D2OBdZjzVd0We51C
	 1RRpZgNzawJHLL9Mw4Vs68S+ecZiWFdKw9whXF/kwuR6aSqhx9HyQefRp/SPDngL2s
	 6BLhEyMeKox4EghELP1m7+16dIRBauBkcm9+C+SKCCdm13+wpg2e69GbYKwqnljL/3
	 9y/cMWMF7/4Bg==
Date: Sat, 6 Sep 2025 20:23:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	David Box <david.e.box@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/8] PCI/ASPM: Fix the behavior of
 pci_enable_link_state*() APIs
Message-ID: <67274gnjp4qy4h3bcawey2edmjiuufdbm262q2qxgcc76dwlic@hdjxqczr54nt>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-2-61b2f2db7d89@oss.qualcomm.com>
 <f644fc83-31cc-1f0e-58cf-7c007e6173e4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f644fc83-31cc-1f0e-58cf-7c007e6173e4@linux.intel.com>
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

On Tue, Aug 26, 2025 at 03:55:42PM GMT, Ilpo Järvinen wrote:
> +David
> 
> On Mon, 25 Aug 2025, Manivannan Sadhasivam via B4 Relay wrote:
> 
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > pci_enable_link_state() and pci_enable_link_state_locked() APIs are
> > supposed to be symmectric with pci_disable_link_state() and
> > pci_disable_link_state_locked() APIs.
> > 
> > But unfortunately, they are not symmetric. This behavior was mentioned in
> > the kernel-doc of these APIs:
> > 
> > " Clear and set the default device link state..."
> > 
> > and
> > 
> > "Also note that this does not enable states disabled by
> > pci_disable_link_state()"
> > 
> > These APIs won't enable all the states specified by the 'state' parameter,
> > but only enable the ones not previously disabled by the
> > pci_disable_link_state*() APIs. But this behavior doesn't align with the
> > naming of these APIs, as they give the impression that these APIs will
> > enable all the specified states.
> > 
> > To resolve this ambiguity, allow these APIs to enable the specified states,
> > regardeless of whether they were previously disabled or not. This is
> > accomplished by clearing the previously disabled states from the
> > 'link::aspm_disable' parameter in __pci_enable_link_state() helper. Also,
> > reword the kernel-doc to reflect this behavior.
> > 
> > The current callers of pci_enable_link_state_locked() APIs (vmd and
> > pcie-qcom) did not disable the ASPM states before calling this API. So it
> > is evident that they do not depend on the previous behavior of this API and
> > intend to enable all the specified states.
> 
> While it might be "safe" in the sense that ->aspm_disable is not set by 
> anything, I'm still not sure if overloading this function for two 
> different use cases is a good idea.
> 

Why? I thought your concern was with the callers of this API. Since that is
taken care, do you have any other concerns?

> I'd like to hear David's opinion on this as he grasps the ->aspm_default 
> vs ->aspm_disable thing much better than I do.
> 
> > And the other API, pci_enable_link_state() doesn't have a caller for now,
> > but will be used by the 'atheros' WLAN drivers in the subsequent commits.
> > 
> > Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> This tag sound like I'm endorsing this approach which is not the case. I'd 
> prefer separate functions for each use case, setting aspm_default and 
> another for the enable state.
> 

Sorry, I misunderstood then. I'll drop this tag.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

