Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891E9CA0FE7
	for <ath12k@archiver.kernel.org>; Tue, 26 Aug 2025 13:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkWRgKKm9FxeOFnQsAZESgl378dIsMxSS/KweLozGsQ=; b=SDisV05ebbn22JP6e7lOQ5aSjZ
	/Tj4yaXHAu6EOjattFfwb5aR1nkntd/Qcot6Ac0RKHrYb9h+JCugpcjPXykrxyOMIPO+YExMZmtEc
	NkHR6oII67Qb5u21zF3nAyJy/NYdDeRK/5bkXKrK08tKxK1TXq02jvFS1JdXkg6G99Lx+rHv9Gmc0
	tJwswnVS4JBTwAWvCTjkr3uK1Kw/9PwJXDAma4hRPBuwWr81twsIXXZmaz0cGY6xD1GC9yMHo5ggI
	2fN7WkpT4gSSlge8YWQKECpCa6QZAAXoRPalIbSdU91zijgISaWO0i4qrmn26TGa5Mv4ctlKi6auQ
	a9q9NjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtJe-0000000C1PU-0fLq;
	Tue, 26 Aug 2025 13:02:22 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtDR-0000000C0T5-1AQ2;
	Tue, 26 Aug 2025 12:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756212957; x=1787748957;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=R4iU1jfyixe8o3Lo4PGR4XGLQyegIIrVAMccWj8FMcM=;
  b=CZkEIP5GFcymLrdX+w97I/kQQGjNQRy/SM7RK/3nVdgDgyS+5JbN7ctb
   9g03BeyZbliV8AJOTJmd/EKgXO6V6XPeidnlpA+j3b7sgyly3buzTzjop
   bAtOmDT0QuHX+9GAqKvNIQSB9ia1i0lF/TEijJwz6cqy5/EVZw0FwqDQF
   7tzD6UKLO9pX+AukCCDuNh0dnd1/i61FJuir8Th40cC3ZOD8BXzWuoj/A
   AwMI1LSuEQKk+cJ70wmbINDKOqE/61Mn4nUCr2zv8uOLoMSW8ZjWHK1ZC
   Q6Y7iG0LseaXolBJwt14KtAHlc3oA+5vje9W3GZ2GJ9sZiUHWylFjukPw
   A==;
X-CSE-ConnectionGUID: tgJv800dRpKcebMedKl5yw==
X-CSE-MsgGUID: tPZl8uW8SC6C5KkFPPkwBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69814754"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69814754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 05:55:53 -0700
X-CSE-ConnectionGUID: auHUum6tRHS2IljYMCxSQg==
X-CSE-MsgGUID: o1h+Y04mS+OxNUWKpynnLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="206733326"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 05:55:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 Aug 2025 15:55:42 +0300 (EEST)
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
    David Box <david.e.box@linux.intel.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
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
In-Reply-To: <20250825-ath-aspm-fix-v2-2-61b2f2db7d89@oss.qualcomm.com>
Message-ID: <f644fc83-31cc-1f0e-58cf-7c007e6173e4@linux.intel.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com> <20250825-ath-aspm-fix-v2-2-61b2f2db7d89@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-846575285-1756206986=:934"
Content-ID: <ed51a60b-2da2-8824-e685-a71851c626aa@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_055557_330415_343B59C5 
X-CRM114-Status: GOOD (  31.78  )
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

--8323328-846575285-1756206986=:934
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <96a2aa14-031e-f827-2cad-088a1b047808@linux.intel.com>

+David

On Mon, 25 Aug 2025, Manivannan Sadhasivam via B4 Relay wrote:

> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>=20
> pci_enable_link_state() and pci_enable_link_state_locked() APIs are
> supposed to be symmectric with pci_disable_link_state() and
> pci_disable_link_state_locked() APIs.
>=20
> But unfortunately, they are not symmetric. This behavior was mentioned in
> the kernel-doc of these APIs:
>=20
> " Clear and set the default device link state..."
>=20
> and
>=20
> "Also note that this does not enable states disabled by
> pci_disable_link_state()"
>=20
> These APIs won't enable all the states specified by the 'state' parameter=
,
> but only enable the ones not previously disabled by the
> pci_disable_link_state*() APIs. But this behavior doesn't align with the
> naming of these APIs, as they give the impression that these APIs will
> enable all the specified states.
>=20
> To resolve this ambiguity, allow these APIs to enable the specified state=
s,
> regardeless of whether they were previously disabled or not. This is
> accomplished by clearing the previously disabled states from the
> 'link::aspm_disable' parameter in __pci_enable_link_state() helper. Also,
> reword the kernel-doc to reflect this behavior.
>=20
> The current callers of pci_enable_link_state_locked() APIs (vmd and
> pcie-qcom) did not disable the ASPM states before calling this API. So it
> is evident that they do not depend on the previous behavior of this API a=
nd
> intend to enable all the specified states.

While it might be "safe" in the sense that ->aspm_disable is not set by=20
anything, I'm still not sure if overloading this function for two=20
different use cases is a good idea.

I'd like to hear David's opinion on this as he grasps the ->aspm_default=20
vs ->aspm_disable thing much better than I do.

> And the other API, pci_enable_link_state() doesn't have a caller for now,
> but will be used by the 'atheros' WLAN drivers in the subsequent commits.
>=20
> Suggested-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

This tag sound like I'm endorsing this approach which is not the case. I'd=
=20
prefer separate functions for each use case, setting aspm_default and=20
another for the enable state.

--=20
 i.

> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.=
com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/pci/pcie/aspm.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index be9bd272057c3472f3e31dc9568340b19d52012a..fac46113a90c7fac6c97125e6=
a7e385045780005 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1459,6 +1459,7 @@ static int __pci_enable_link_state(struct pci_dev *=
pdev, int state, bool locked)
>  =09=09down_read(&pci_bus_sem);
>  =09mutex_lock(&aspm_lock);
>  =09link->aspm_default =3D pci_calc_aspm_enable_mask(state);
> +=09link->aspm_disable &=3D ~state;
>  =09pcie_config_aspm_link(link, policy_to_aspm_state(link));
> =20
>  =09link->clkpm_default =3D (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;
> @@ -1471,17 +1472,18 @@ static int __pci_enable_link_state(struct pci_dev=
 *pdev, int state, bool locked)
>  }
> =20
>  /**
> - * pci_enable_link_state - Clear and set the default device link state s=
o that
> - * the link may be allowed to enter the specified states. Note that if t=
he
> - * BIOS didn't grant ASPM control to the OS, this does nothing because w=
e can't
> - * touch the LNKCTL register. Also note that this does not enable states
> - * disabled by pci_disable_link_state(). Return 0 or a negative errno.
> + * pci_enable_link_state - Enable device's link state
> + * @pdev: PCI device
> + * @state: Mask of ASPM link states to enable
> + *
> + * Enable device's link state, so the link will enter the specified stat=
es.
> + * Note that if the BIOS didn't grant ASPM control to the OS, this does
> + * nothing because we can't touch the LNKCTL register.
>   *
>   * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates=
, per
>   * PCIe r6.0, sec 5.5.4.
>   *
> - * @pdev: PCI device
> - * @state: Mask of ASPM link states to enable
> + * Return: 0 on success, a negative errno otherwise.
>   */
>  int pci_enable_link_state(struct pci_dev *pdev, int state)
>  {
> @@ -1490,19 +1492,20 @@ int pci_enable_link_state(struct pci_dev *pdev, i=
nt state)
>  EXPORT_SYMBOL(pci_enable_link_state);
> =20
>  /**
> - * pci_enable_link_state_locked - Clear and set the default device link =
state
> - * so that the link may be allowed to enter the specified states. Note t=
hat if
> - * the BIOS didn't grant ASPM control to the OS, this does nothing becau=
se we
> - * can't touch the LNKCTL register. Also note that this does not enable =
states
> - * disabled by pci_disable_link_state(). Return 0 or a negative errno.
> + * pci_enable_link_state_locked - Enable device's link state
> + * @pdev: PCI device
> + * @state: Mask of ASPM link states to enable
> + *
> + * Enable device's link state, so the link will enter the specified stat=
es.
> + * Note that if the BIOS didn't grant ASPM control to the OS, this does
> + * nothing because we can't touch the LNKCTL register.
>   *
>   * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substates=
, per
>   * PCIe r6.0, sec 5.5.4.
>   *
> - * @pdev: PCI device
> - * @state: Mask of ASPM link states to enable
> - *
>   * Context: Caller holds pci_bus_sem read lock.
> + *
> + * Return: 0 on success, a negative errno otherwise.
>   */
>  int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
>  {
>=20
>=20
--8323328-846575285-1756206986=:934--

