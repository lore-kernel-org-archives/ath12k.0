Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8037CAC581
	for <ath12k@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0KOxhH62sBkri3rGmHBHOsEJlo1qWSi+q9KO2LRTCo=; b=WDu6huwLTmSjeSAPLGCgsFaz8f
	d5goCdQLM9B+XyRIEgwHeUhDgA82jvk27N8KDtQ6xfANCgwgEnZhtIZ/7kcgUmBLez5yisYVrwvVL
	CY5/CdnlqDHc+a4epwIJc8i212e8FHoGpqbWy4rdu2D5RmlLmNSk6yjKImDH8NW1vI4pdbAEJwzGX
	u3aUeOEMBAlbeIHfaUoO1GTYt69B0zI1hHk8RqjtAKcTL0SqgofOGEiZQrElDISnZsNCPSNuS9YBZ
	1EY5cSsEuFr4MuFmooiDnnvBAfTDJpYc4fkN1umb4DqHL2OZXjTwKRr56VfsEJdF6aGGrwYme94oK
	QP2PBmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacN-0000000GrQd-162T;
	Mon, 08 Sep 2025 12:05:07 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZ3I-0000000GM3I-3Sc8;
	Mon, 08 Sep 2025 10:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757327088; x=1788863088;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3c4d46dbwYhFkAIji9CnButKaWApe47Fg8Mn2cBmfHg=;
  b=a7D4Kl4AZXz32ROqv0O9C3r8DP8UXoyYqT3y+7n3X8JTtr3EfzaHNcMd
   o1SWpEXTTyG+p/CnihiMuRuo9H/Sorh6wLdOfc3oiIZ7ChWX53++YwegF
   9SB6DTnepFAbk9NCQEuC9DLHigusKyctD3XSdtXxoWlPO8VRVsmH3t9r2
   n9oJZBv2HQPKA92xUJVZ68Y5o6MtIsthOjvo52NngavQMHj72NgMEWmGc
   gE8zZ2YW30tsJMjgeLtIIm5AQAOY0oQU4YedavenzkW30tJwHLs/rAzEN
   Gg3JS2A4BgokEb4j7JliPB8w81D6XE1pHcngB3tckzHi9IObhNERpfQ1C
   Q==;
X-CSE-ConnectionGUID: /Dn83mXBRVi8b7liqdFjEg==
X-CSE-MsgGUID: wGsMNPF9TrG5GNvUGjbQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="69832945"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="69832945"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:24:46 -0700
X-CSE-ConnectionGUID: whEKi/v8TFudb7tIU+AjHA==
X-CSE-MsgGUID: U/YpIi0KRGSt2P0AfeFMvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="172875576"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.11])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:24:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Sep 2025 13:24:35 +0300 (EEST)
To: Manivannan Sadhasivam <mani@kernel.org>
cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
    David Box <david.e.box@linux.intel.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
    Jonathan Derrick <jonathan.derrick@linux.dev>, 
    Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, 
    linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
    ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/8] PCI/ASPM: Fix the behavior of pci_enable_link_state*()
 APIs
In-Reply-To: <67274gnjp4qy4h3bcawey2edmjiuufdbm262q2qxgcc76dwlic@hdjxqczr54nt>
Message-ID: <df354ae2-03bd-d17c-4e3a-9e62b248cc2a@linux.intel.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com> <20250825-ath-aspm-fix-v2-2-61b2f2db7d89@oss.qualcomm.com> <f644fc83-31cc-1f0e-58cf-7c007e6173e4@linux.intel.com> <67274gnjp4qy4h3bcawey2edmjiuufdbm262q2qxgcc76dwlic@hdjxqczr54nt>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1505528149-1757327075=:938"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_032448_926713_86D59147 
X-CRM114-Status: GOOD (  32.60  )
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

--8323328-1505528149-1757327075=:938
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 6 Sep 2025, Manivannan Sadhasivam wrote:

> On Tue, Aug 26, 2025 at 03:55:42PM GMT, Ilpo J=C3=A4rvinen wrote:
> > +David
> >=20
> > On Mon, 25 Aug 2025, Manivannan Sadhasivam via B4 Relay wrote:
> >=20
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > >=20
> > > pci_enable_link_state() and pci_enable_link_state_locked() APIs are
> > > supposed to be symmectric with pci_disable_link_state() and
> > > pci_disable_link_state_locked() APIs.
> > >=20
> > > But unfortunately, they are not symmetric. This behavior was mentione=
d in
> > > the kernel-doc of these APIs:
> > >=20
> > > " Clear and set the default device link state..."
> > >=20
> > > and
> > >=20
> > > "Also note that this does not enable states disabled by
> > > pci_disable_link_state()"
> > >=20
> > > These APIs won't enable all the states specified by the 'state' param=
eter,
> > > but only enable the ones not previously disabled by the
> > > pci_disable_link_state*() APIs. But this behavior doesn't align with =
the
> > > naming of these APIs, as they give the impression that these APIs wil=
l
> > > enable all the specified states.
> > >=20
> > > To resolve this ambiguity, allow these APIs to enable the specified s=
tates,
> > > regardeless of whether they were previously disabled or not. This is
> > > accomplished by clearing the previously disabled states from the
> > > 'link::aspm_disable' parameter in __pci_enable_link_state() helper. A=
lso,
> > > reword the kernel-doc to reflect this behavior.
> > >=20
> > > The current callers of pci_enable_link_state_locked() APIs (vmd and
> > > pcie-qcom) did not disable the ASPM states before calling this API. S=
o it
> > > is evident that they do not depend on the previous behavior of this A=
PI and
> > > intend to enable all the specified states.
> >=20
> > While it might be "safe" in the sense that ->aspm_disable is not set by=
=20
> > anything, I'm still not sure if overloading this function for two=20
> > different use cases is a good idea.
> >=20
>=20
> Why? I thought your concern was with the callers of this API. Since that =
is
> taken care, do you have any other concerns?

I don't think it really matters anymore as it looks the vmd one is going=20
to be removed by the David's patch and the qcom one is removed by your patc=
h
so no users remain.

> > I'd like to hear David's opinion on this as he grasps the ->aspm_defaul=
t=20
> > vs ->aspm_disable thing much better than I do.
> >=20
> > > And the other API, pci_enable_link_state() doesn't have a caller for =
now,
> > > but will be used by the 'atheros' WLAN drivers in the subsequent comm=
its.
> > >=20
> > > Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> >=20
> > This tag sound like I'm endorsing this approach which is not the case. =
I'd=20
> > prefer separate functions for each use case, setting aspm_default and=
=20
> > another for the enable state.
> >=20
>=20
> Sorry, I misunderstood then. I'll drop this tag.
>=20
> - Mani
>=20
>=20

--=20
 i.

--8323328-1505528149-1757327075=:938--

