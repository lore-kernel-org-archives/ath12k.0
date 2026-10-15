Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C9CCC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 08:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8VPapOsmCY72fitC4ohk6L4n0u7np+8nOCC5dgJyfU=; b=nCzpKJGsv1xiGSDDT1ac4rgKG2
	guwCzPiR4wtmgqieECg6rT2Zw+6ASmtmoeTrrUjncDuXdX4h+jjE0WScbrWCaWR1r9D+RlEwscrW9
	wrVNugdI+erxiXwlD4F6zQgjDJLXpqG3KCdizSbL9a4VvGBfLYALl8eT/YiFCamH79AYUYQE0FZ/n
	0K81B2giO6uKxr3bdRTh/IMvHWyxpXzwYWua7UiYqRh0FvoILhDWd1vstUN1uu+tHxuiq1OdwrlDd
	bzYed/lMpxMa9DtINP3d9me6n0IPa3HZiD175wwkmaJphnj2fcdI7YO4beskhlDrWdJeljJxH1Rpz
	Wu9LMjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGw3-0000000H9ya-26If;
	Thu, 15 Oct 2026 08:35:35 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGw0-0000000H9xV-2paU;
	Thu, 15 Oct 2026 08:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792053332; x=1823589332;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pVvQ3KKvitHRAPJVAnlZcFqINR1f9Sbt+S8x9HaqwLk=;
  b=gTQk9nnCI/ab4XVcgBDO29v7wQbnqT65wvP2F8eLxgsiAloI/5qDwrOC
   X+2wpagSydasvh7Bd6Z6KcR/zsHz7wdvvBQz9aYbWnDHnKOp00lwUCpnI
   AhCfdaodxDxe1a0OvRjMiWwwY8JFNp/An2T5GKint1SRGE/UVgf2wu4qc
   0bmjy3ADipDMrO7gnSpS2E57KC1S5MElXE+Exp9w6hjLMADoYbIsQBEvn
   t27ZrS8FUzapFmKa/tnNpUp0v4QNFW7Af473pyRxB1K8HOYuQiBRUWfTv
   p6b3dlstvMuTGXnL5qWFq7wrFx/gETvOpTLKXeDk5Sxq5gWorvxDOqZCl
   g==;
X-CSE-ConnectionGUID: O4DqKbIUTpy4klxWDy3vbA==
X-CSE-MsgGUID: C7bHx/h4Tum+YUsJQPaYHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="818146"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="818146"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 01:35:31 -0700
X-CSE-ConnectionGUID: qY1s9havR7S48f+/BilHog==
X-CSE-MsgGUID: H3lFISSnTrqQxKgw2Qdl9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1699888"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 01:35:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Oct 2026 11:35:19 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Manivannan Sadhasivam <mani@kernel.org>, 
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
    Qiang Yu <qiang.yu@oss.qualcomm.com>, 
    Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
    Emmanuel Grumbach <egrumbach@gmail.com>, 
    Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v3 0/8] PCI/ASPM: Add pci_force_enable_link_state() API
 and convert Atheros drivers
In-Reply-To: <20261014205117.GA1665327@bhelgaas>
Message-ID: <2ddb1f53-b0bd-abf8-be0f-dc77da8a669e@linux.intel.com>
References: <20261014205117.GA1665327@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-606769928-1792053319=:1307"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_013532_758369_992AECAE 
X-CRM114-Status: GOOD (  47.41  )
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

--8323328-606769928-1792053319=:1307
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 14 Oct 2026, Bjorn Helgaas wrote:

> [+cc Emmanuel, Matthew]
>=20
> On Wed, Jul 08, 2026 at 04:30:14PM +0200, Manivannan Sadhasivam wrote:
> > Hi,
> >=20
> > This series converts the atheros WLAN drivers (ath10k/ath11k/ath12k) to
> > use the PCI core ASPM APIs for enabling/disabling ASPM instead of writi=
ng
> > to the LNKCTL register directly. Touching LNKCTL behind the PCI core's
> > back leaves the ASPM service driver's view of the link state out of syn=
c
> > with the hardware, which is not nice.
> >=20
> > The catch is that these drivers save the currently enabled ASPM states,
> > disable ASPM before firmware download, and restore the saved states
> > afterwards. pci_enable_link_state() cannot restore states that were
> > disabled via pci_disable_link_state() or blacklisted during init (like
> > the pre-1.1 device blacklist, which is only meant to be overridden with
> > pcie_aspm=3Dforce), and that is intentional. So the save/restore sequen=
ce
> > cannot be expressed with the existing APIs.
> >=20
> > In v2 I tried to fix this by making pci_enable_link_state*() symmetric
> > with the disable APIs, but as pointed out during review, that also ends
> > up overriding the init-time blacklist for every caller (including VMD),
> > which is not something we want. So instead, this version adds a separat=
e
> > pci_force_enable_link_state() API (patch 2) that re-enables the request=
ed
> > states unconditionally. The caller is responsible for only asking for
> > states the device actually supports, and the ath drivers do this by
> > restoring exactly what pcie_aspm_enabled() reported earlier.
> >=20
> > The first five patches touch the PCI core: patch 1 (from Ilpo) makes
> > pci_disable_link_state() disable ASPM unconditionally, patch 2 adds the
> > new API, patch 3 moves the D0 transition needed before enabling PCI-PM
> > L1 PM Substates (PCIe r6.0, sec 5.5.4) into the shared helper and drops
> > it from the vmd and pcie-qcom callers, patch 4 cleans up the kernel-doc=
,
> > and patch 5 makes pcie_aspm_enabled() return the enabled state mask so =
it
> > can be used for save/restore. The last three patches convert the ath
> > drivers.
> >=20
> > Testing
> > =3D=3D=3D=3D=3D=3D=3D
> >=20
> > I've tested this series on a Lenovo Thinkpad T14s with WCN7850 (so that=
's
> > just the ath12k driver). Rest of the drivers are compile tested only.
> >=20
> > Merging Strategy
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Even though there is no build dependency between the PCI core and ather=
os
> > patches, there is a functional dependency. So I'd recommend creating an
> > immutable branch with the PCI patches and merging that branch into both
> > the PCI and linux-wireless trees, and finally merging the atheros patch=
es
> > into the linux-wireless tree.
> >=20
> > If the immutable branch seems like a hassle, then the PCI core patches
> > could get merged first and the atheros patches can wait for the next
> > cycle.
> >=20
> > - Mani
> >=20
> > Changes in v3:
> > * Dropped the change that made pci_enable_link_state*() symmetric with =
the
> >   disable APIs. Instead added a new pci_force_enable_link_state() API u=
sed
> >   only by the ath drivers, so the init-time blacklist stays overridable
> >   only via pcie_aspm=3Dforce and existing callers like VMD are left
> >   untouched.
> > * Fixed the locked path to use pci_set_power_state_locked() for the D0
> >   transition. The previous version called the non-locked variant, which
> >   re-acquires pci_bus_sem.
> > * ath drivers now disable PCIE_LINK_STATE_ASPM_ALL instead of
> >   PCIE_LINK_STATE_ALL so that CLKPM is preserved and can be restored
> >   (pcie_aspm_enabled() doesn't report CLKPM).
> > * Reworked the kernel-doc patch to cover both the enable and disable AP=
Is
> >   and reference the new API.
> > * Rebased on top of v7.2-rc1.
> >=20
> > Changes in v2:
> > * Reworked the pcie_aspm_enabled() API to return the enabled states
> >   instead of bool and used it to save/restore the ASPM states in ath
> >   drivers.
> > * Added a patch from Ilpo to disable ASPM even if BIOS didn't grant
> >   permission.
> > * Added the CONFIG_PCIEASPM dependency to ath{10/11/12}k drivers.
> > * Rebased on top of v6.17-rc1.
> >=20
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcom=
m.com>
> > ---
> > Ilpo J=C3=A4rvinen (1):
> >       PCI/ASPM: Always disable ASPM when driver requests it
>=20
> I put this first patch on pci/aspm for v7.4 because there seems to be
> a consensus that it's better to have the ASPM core disable things even
> if it doesn't technically have control of ASPM, because the
> alternative is that drivers just do it themselves, also ignoring ASPM
> ownership concerns.  Having the drivers do it just means the PCI core
> ASPM support doesn't know what's happening.

Hi,

Can you tweak the opening sentence as it has a small grammar error=20
("Drivers can controlling") now that it has been altered from my original=
=20
wording.

--
 i.

> I think we should defer the rest of these because I think there's a
> little room to make the enable/disable/force-enable dance more
> intuitive for the drivers.  As far as I know, the rest of the series
> is definite cleanups but doesn't fix any actual functional issues.
>=20
> > Manivannan Sadhasivam (7):
> >       PCI/ASPM: Add pci_force_enable_link_state() API
> >       PCI/ASPM: Transition the device to D0 (if required) when enabling=
 ASPM link states
> >       PCI/ASPM: Improve the kernel-doc for pci_{enable,disable}_link_st=
ate*() APIs
> >       PCI/ASPM: Return enabled ASPM states from pcie_aspm_enabled() API
> >       wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enabl=
e/disable ASPM states
> >       wifi: ath11k: Use pci_{enable/disable}_link_state() APIs to enabl=
e/disable ASPM states
> >       wifi: ath10k: Use pci_{enable/disable}_link_state() APIs to enabl=
e/disable ASPM states
> >=20
> >  drivers/net/wireless/ath/ath10k/Kconfig |   2 +-
> >  drivers/net/wireless/ath/ath10k/pci.c   |  11 +--
> >  drivers/net/wireless/ath/ath10k/pci.h   |   5 +-
> >  drivers/net/wireless/ath/ath11k/Kconfig |   2 +-
> >  drivers/net/wireless/ath/ath11k/pci.c   |  19 +----
> >  drivers/net/wireless/ath/ath11k/pci.h   |   3 +-
> >  drivers/net/wireless/ath/ath12k/Kconfig |   2 +-
> >  drivers/net/wireless/ath/ath12k/pci.c   |  19 +----
> >  drivers/net/wireless/ath/ath12k/pci.h   |   4 +-
> >  drivers/pci/controller/dwc/pcie-qcom.c  |   5 --
> >  drivers/pci/controller/vmd.c            |   5 --
> >  drivers/pci/pcie/aspm.c                 | 140 ++++++++++++++++++++++++=
--------
> >  include/linux/pci.h                     |   7 +-
> >  13 files changed, 129 insertions(+), 95 deletions(-)
> > ---
> > base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> > change-id: 20260708-pci-aspm-fix-331826a2cb5d
> >=20
> > Best regards,
> > -- =20
> > =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D
> >=20
> >=20
>=20
--8323328-606769928-1792053319=:1307--

