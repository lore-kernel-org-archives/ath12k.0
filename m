Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DB7CC6B08
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKHgPqu2Azg7/nNri0RDYdQFf19RQLzbv3/NH2TS2ck=; b=ZZuCZMpwCGXWTQAUHWMdMUvxL8
	U87CqT+glcdrzNhYfxcb+CxRV4gR7tC/GMPB6amiPqzA+XHeL49cKFNiu8I6rAiaU6vjptStmUwez
	orSTyLh1Zl8VPo+XLKTAUMjip6Jwo2KvL44UHqotbUvyY9eX/a7Ti4ymKMzG2GYxsm7r0OwOpiiii
	YkeQkJDbrHJLwx3jqLfFzxejLm3YnAFjBhizkI9gJL/z3dQjDLB6dBRYMN3c/KJcnq1DBKU2hd/Cv
	8vohQhbSjReZ9FNqQfWCj66XCJkTXzo8301jo7J7Q831wMF8Sff+f+kiAjmhsXBrDJMeKlXkyzxqu
	ANuegtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGatE-0000000Cj6V-34V5;
	Tue, 13 Oct 2026 11:41:52 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGat7-0000000Cj5l-3Zw0;
	Tue, 13 Oct 2026 11:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791891706; x=1823427706;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=YAJaHA3FL843BSgj3aVZh2SzSmUdAo8/w5ok0jPj4ro=;
  b=npu+QCRdxHDeQ+hopmntH8gv6i/ESNlGJk1TX/xF3RNfXOAl+Qx6VW/h
   ubozrqrGhDTvFDvekO4D98ycDLQ2C/iivUEewR1ALAGOKmuXV/wgKrrGN
   q4GGAQ0cCtAdY3Xh8vKpwa9Jrvfv6dzYzmW0UPegyiPOpTQwJn+p3ixBF
   OLmqjkZzKg2ILDlvCWEVfauYx/Jh94j7DXMdO22yYX0K/Cd6pR+L9EjVx
   3KVnZhFqL2dI0URDrp5Br1i3kRX7biWO87qs97NUAiJuVG3d+ELPZMXlT
   LqpF60TCsWHuatdhsx2k5f+r50vDiKblsHbwxssCungEOt2Wh+mN+4/d6
   w==;
X-CSE-ConnectionGUID: j22tdh1JQvipLTeF40PYvA==
X-CSE-MsgGUID: QgY6QZ3FSQ6AEGGKP+VH0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="515084"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="515084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 04:41:45 -0700
X-CSE-ConnectionGUID: b8gYIYLoRdyjmsQDQ/nStQ==
X-CSE-MsgGUID: JaGIfAB3QKqpSXdMgk+ecQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1501815"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 04:41:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Oct 2026 14:41:32 +0300 (EEST)
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
    Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] PCI/ASPM: Add pci_force_enable_link_state() API
In-Reply-To: <20261012225832.GA1415301@bhelgaas>
Message-ID: <f1390db8-2369-9ab7-49a9-b7f09ef7b1ea@linux.intel.com>
References: <20261012225832.GA1415301@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-2110680251-1791890800=:1237"
Content-ID: <eb4da7c3-6b95-7dae-87b6-bb3fda24da91@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_044145_910615_3F87716A 
X-CRM114-Status: GOOD (  39.68  )
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

--8323328-2110680251-1791890800=:1237
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6e83485e-223f-0f0c-17ad-c73df48cefdf@linux.intel.com>

On Mon, 12 Oct 2026, Bjorn Helgaas wrote:

> On Wed, Jul 08, 2026 at 04:30:16PM +0200, Manivannan Sadhasivam wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >=20
> > pci_enable_link_state() and pci_enable_link_state_locked() APIs only en=
able
> > the ASPM states that were not previously disabled via
> > pci_disable_link_state*() API or blacklisted during init (e.g. the pre-=
1.1
> > device blacklist, which is only meant to be overridden with
> > 'pcie_aspm=3Dforce'). This is an intentional behavior as these APIs mus=
t not
> > silently re-enable states that were deliberately disabled, since doing =
so
> > could enable ASPM on a link where it is known to be unsafe.
>=20
> I think this is saying that many uses of pci_disable_link_state() are
> to avoid hardware errata, i.e., these are basically quirks, and we
> should *never* enable those ASPM states.
>=20
> > However, some drivers (e.g. the atheros WLAN drivers) save the currentl=
y
> > enabled ASPM states, disable all ASPM states before firmware download, =
and
> > then try to restore exactly the states that were enabled before. Restor=
ing
> > those states requires re-enabling states that were just disabled via
> > pci_disable_link_state() API. But, this cannot be achieved using the
> > existing APIs.
>=20
> This sounds like it's also for hardware errata: if ASPM works
> correctly, there's no need to disable it during firmware download.  I
> think this is *only* the atheros drivers, isn't it?  I didn't see any
> others.

Hi,

There are more that should use disable/enable API. In addition ath*, I had=
=20
also these in my unfinished series:

  brcmfmac
  ib-hfi1
  rtlwifi
  rtsx
  r8169

> > Hence, add pci_force_enable_link_state() API for such callers. Unlike
> > pci_enable_link_state(), it re-enables the requested states even if the=
y
> > were previously disabled via pci_disable_link_state() or disabled durin=
g
> > init. The caller is therefore responsible for only enabling states the
> > device actually supports, typically the ones previously reported by
> > pcie_aspm_enabled().
>=20
> The problem is that pci_enable_link_state() cannot enable things that
> were disabled by pci_disable_link_state().  They're not symmetric,
> which violates the caller's expectation.

Yes.

This patch seems to come with my Suggested-by but what I suggested (and=20
had a patch for) was to make disable/enable proper symmetric pairs because=
=20
it is very trappy otherwise. If something else is needed in addition, that=
=20
should be named differently like Bjorn also seems to suggest (however see=
=20
my alternative suggestion below).

I renamed the current pci_enable_link_state() to=20
pci_set_default_link_state() in my own attempt to get room for adding the=
=20
symmetric pair.

> Instead of adding pci_force_enable_link_state(), I think we should add
> a new interface for the *quirk* behavior that permanently disables
> states.  Then pci_enable_link_state() and pci_disable_link_state()
> could be made symmetric.

My suggestion is to make the disables/enables counted per state which=20
would allow parallel sources of disables to function without clashing.

Disable quirks could simply not have the pairing enable, no special=20
interface needed.

And the lane margining proposal would also just fit in with that approach=
=20
as well.

--
 i.

> > This API is implemented by adding a 'force' parameter to the shared
> > __pci_enable_link_state() helper. When 'force' is true, the requested
> > states are cleared from 'link->aspm_disable' before enabling.
> >=20
> > Suggested-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcom=
m.com>
> > ---
> >  drivers/pci/pcie/aspm.c | 37 ++++++++++++++++++++++++++++++++++---
> >  include/linux/pci.h     |  3 +++
> >  2 files changed, 37 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > index 1c15a14718e8..c04fb71de91c 100644
> > --- a/drivers/pci/pcie/aspm.c
> > +++ b/drivers/pci/pcie/aspm.c
> > @@ -1506,7 +1506,8 @@ int pci_disable_link_state(struct pci_dev *pdev, =
int state)
> >  }
> >  EXPORT_SYMBOL(pci_disable_link_state);
> > =20
> > -static int __pci_enable_link_state(struct pci_dev *pdev, int state, bo=
ol locked)
> > +static int __pci_enable_link_state(struct pci_dev *pdev, int state, bo=
ol locked,
> > +=09=09=09=09   bool force)
> >  {
> >  =09struct pcie_link_state *link =3D pcie_aspm_get_link(pdev);
> > =20
> > @@ -1527,6 +1528,10 @@ static int __pci_enable_link_state(struct pci_de=
v *pdev, int state, bool locked)
> >  =09=09down_read(&pci_bus_sem);
> >  =09mutex_lock(&aspm_lock);
> >  =09link->aspm_default =3D pci_calc_aspm_enable_mask(state);
> > +
> > +=09/* Force enable states that were previously disabled */
> > +=09if (force)
> > +=09=09link->aspm_disable &=3D ~link->aspm_default;
> >  =09pcie_config_aspm_link(link, policy_to_aspm_state(link));
> > =20
> >  =09link->clkpm_default =3D (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;
> > @@ -1553,7 +1558,7 @@ static int __pci_enable_link_state(struct pci_dev=
 *pdev, int state, bool locked)
> >   */
> >  int pci_enable_link_state(struct pci_dev *pdev, int state)
> >  {
> > -=09return __pci_enable_link_state(pdev, state, false);
> > +=09return __pci_enable_link_state(pdev, state, false, false);
> >  }
> >  EXPORT_SYMBOL(pci_enable_link_state);
> > =20
> > @@ -1576,10 +1581,36 @@ int pci_enable_link_state_locked(struct pci_dev=
 *pdev, int state)
> >  {
> >  =09lockdep_assert_held_read(&pci_bus_sem);
> > =20
> > -=09return __pci_enable_link_state(pdev, state, true);
> > +=09return __pci_enable_link_state(pdev, state, true, false);
> >  }
> >  EXPORT_SYMBOL(pci_enable_link_state_locked);
> > =20
> > +/**
> > + * pci_force_enable_link_state - Force enable device link state
> > + * @pdev: PCI device
> > + * @state: Mask of ASPM link states to enable
> > + *
> > + * Enable device link state, so the link will enter the specified stat=
es.
> > + * Unlike pci_enable_link_state(), this also re-enables states previou=
sly
> > + * disabled by pci_disable_link_state() and overrides the ASPM states =
disabled
> > + * during init (e.g., the pre-1.1 device blacklist). The caller is the=
refore
> > + * responsible for only enabling states the device supports, typically=
 the ones
> > + * previously reported by pcie_aspm_enabled().
> > + *
> > + * Note that if the BIOS didn't grant ASPM control to the OS, this doe=
s nothing
> > + * because we can't touch the LNKCTL register.
> > + *
> > + * Note: Ensure devices are in D0 before enabling PCI-PM L1 PM Substat=
es, per
> > + * PCIe r6.0, sec 5.5.4.
> > + *
> > + * Return: 0 on success, a negative errno otherwise.
> > + */
> > +int pci_force_enable_link_state(struct pci_dev *pdev, int state)
> > +{
> > +=09return __pci_enable_link_state(pdev, state, false, true);
> > +}
> > +EXPORT_SYMBOL(pci_force_enable_link_state);
> > +
> >  void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap)
> >  {
> >  =09if (lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index ebb5b9d76360..be6719626c8f 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -1918,6 +1918,7 @@ int pci_disable_link_state(struct pci_dev *pdev, =
int state);
> >  int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
> >  int pci_enable_link_state(struct pci_dev *pdev, int state);
> >  int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
> > +int pci_force_enable_link_state(struct pci_dev *pdev, int state);
> >  void pcie_no_aspm(void);
> >  bool pcie_aspm_support_enabled(void);
> >  bool pcie_aspm_enabled(struct pci_dev *pdev);
> > @@ -1930,6 +1931,8 @@ static inline int pci_enable_link_state(struct pc=
i_dev *pdev, int state)
> >  { return 0; }
> >  static inline int pci_enable_link_state_locked(struct pci_dev *pdev, i=
nt state)
> >  { return 0; }
> > +static inline int pci_force_enable_link_state(struct pci_dev *pdev, in=
t state)
> > +{ return 0; }
> >  static inline void pcie_no_aspm(void) { }
> >  static inline bool pcie_aspm_support_enabled(void) { return false; }
> >  static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return fa=
lse; }
> >=20
> > --=20
> > 2.43.0
> >=20
> >=20
>=20

--=20
 i.
--8323328-2110680251-1791890800=:1237--

