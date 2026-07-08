Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AA5C44513
	for <ath12k@archiver.kernel.org>; Wed,  8 Jul 2026 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NWO424/7A5Nx/tizU7jC7pCIathyw4FCp9DdoHRqf3E=; b=GPXMFigZBapcnQ
	1134N4km9AZwOYVm6+R54JrUmylreah6HIh59pxYhur2aZvkPhn+UBOdrsJ2mwrx/vQZvB8QrtMXR
	pvgEmo9C5yxdpnWhXcjuysSZE/iLxb4E5/xy2sTqsDLCTXEGdST+G+SrPrlX1HmiO9pv2yhOhNcfM
	RZAGy6fIcevc+dcWX0bpLBX/6wfbykXyAkYH7zsVbTAfzscpUo6onxUFEeY8Zy5MSDHsryks5fVh3
	IeGx4wtgtGkdSxvJof7xLjFcTAztyT6apbM+0n03i4VdRx8DudUfInOF3DpV4uO6HUkZGAbbUrSZD
	x+2/tvD36s9RmdcFjOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTIC-0000000HKH5-295v;
	Wed, 08 Jul 2026 14:30:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTI6-0000000HK33-19K2;
	Wed, 08 Jul 2026 14:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47FE46001A;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E49EDC2BCB7;
	Wed,  8 Jul 2026 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783521021;
	bh=gQhapFU2gHvnflkP8Shzdby92+Ir7fqJ5ZXyGhEN0WI=;
	h=From:Subject:Date:To:Cc:From;
	b=JX03yOPTVQvNuAbErhlJVQe8E1RpFeIRKMPxI1o6sw3aMGBdhfCWlHYLcsfOopDsI
	 Y0FiLiHDrQsM+J0LxFK1AmUu50TSBvJ8Wjl2MDhRpyDJ+AmS6aAKg+IPRg/xpV6tbB
	 HUwIPV+aKJ5mbyOrXmEZWMP9hdI2IpfLNTfkGOvkhppM8sQ3L50AtUQWxH0aDPDlKX
	 SNvH7NJ9JDxX0FCHR73mS9QvkNJXjf7ayPM42v2ibqLIUAIG5WjVTTUG4gdfcLzUgN
	 uKsQkN1Kb7H2s463uOIKGg9QqGM+znkBQIKgViI4URX0j5X4PwIqvQT7pnSXBciO8j
	 0kkxNiLRayMWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB04C43458;
	Wed,  8 Jul 2026 14:30:20 +0000 (UTC)
From: Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v3 0/8] PCI/ASPM: Add pci_force_enable_link_state() API and
 convert Atheros drivers
Date: Wed, 08 Jul 2026 16:30:14 +0200
Message-Id: <20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPZeTmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3YLkTN3E4oJc3bTMCl1jY0MLI7NEo+Qk0xQloJaColSgMNi46Fg
 Iv7g0KSs1uQRkhlJtLQCyes/GcAAAAA==
X-Change-ID: 20260708-pci-aspm-fix-331826a2cb5d
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
 ath10k@lists.infradead.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>, mani@kernel.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5491; i=mani@kernel.org;
 h=from:subject:message-id;
 bh=gQhapFU2gHvnflkP8Shzdby92+Ir7fqJ5ZXyGhEN0WI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqTl73YP36FvIsLRoHSB3uLXBEmb1VLP8fzrjGo
 vopGvPHqqGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCak5e9wAKCRBVnxHm/pHO
 9VItB/9+NlfefDWPw3NDZQfzENbdPK5CjbHbDyMYfvDUBd+0D+ymYnONXpd9fnx6TyydIiRfiCe
 ZSlkrclpD5J7Y7QCkDo0hAc1ErkkCRx8ujsWjFonBGX2vTBr5edjBf6TcWOVe68wbfqvWk5eO5n
 Z/dqImoNjC7RXgnTtaXHLHjfyXXD42JgXDQZHxoXXRDlR7WrZRQ3cVRwUyO1MN0KfmCGfTR9Koi
 dKoAfVHGpw0hQCCVM386cmF2NHMWzkDg8KIQvYHnCU15sE11lxO1mbZXxtKNd+qhJKMCJydHCAU
 z1wbhqEUFE4eQzcBw80/kj4qbP3OZnyOtVEwPfjjwGBDlvpi
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for mani@kernel.org/default with
 auth_id=787
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

Hi,

This series converts the atheros WLAN drivers (ath10k/ath11k/ath12k) to
use the PCI core ASPM APIs for enabling/disabling ASPM instead of writing
to the LNKCTL register directly. Touching LNKCTL behind the PCI core's
back leaves the ASPM service driver's view of the link state out of sync
with the hardware, which is not nice.

The catch is that these drivers save the currently enabled ASPM states,
disable ASPM before firmware download, and restore the saved states
afterwards. pci_enable_link_state() cannot restore states that were
disabled via pci_disable_link_state() or blacklisted during init (like
the pre-1.1 device blacklist, which is only meant to be overridden with
pcie_aspm=force), and that is intentional. So the save/restore sequence
cannot be expressed with the existing APIs.

In v2 I tried to fix this by making pci_enable_link_state*() symmetric
with the disable APIs, but as pointed out during review, that also ends
up overriding the init-time blacklist for every caller (including VMD),
which is not something we want. So instead, this version adds a separate
pci_force_enable_link_state() API (patch 2) that re-enables the requested
states unconditionally. The caller is responsible for only asking for
states the device actually supports, and the ath drivers do this by
restoring exactly what pcie_aspm_enabled() reported earlier.

The first five patches touch the PCI core: patch 1 (from Ilpo) makes
pci_disable_link_state() disable ASPM unconditionally, patch 2 adds the
new API, patch 3 moves the D0 transition needed before enabling PCI-PM
L1 PM Substates (PCIe r6.0, sec 5.5.4) into the shared helper and drops
it from the vmd and pcie-qcom callers, patch 4 cleans up the kernel-doc,
and patch 5 makes pcie_aspm_enabled() return the enabled state mask so it
can be used for save/restore. The last three patches convert the ath
drivers.

Testing
=======

I've tested this series on a Lenovo Thinkpad T14s with WCN7850 (so that's
just the ath12k driver). Rest of the drivers are compile tested only.

Merging Strategy
================

Even though there is no build dependency between the PCI core and atheros
patches, there is a functional dependency. So I'd recommend creating an
immutable branch with the PCI patches and merging that branch into both
the PCI and linux-wireless trees, and finally merging the atheros patches
into the linux-wireless tree.

If the immutable branch seems like a hassle, then the PCI core patches
could get merged first and the atheros patches can wait for the next
cycle.

- Mani

Changes in v3:
* Dropped the change that made pci_enable_link_state*() symmetric with the
  disable APIs. Instead added a new pci_force_enable_link_state() API used
  only by the ath drivers, so the init-time blacklist stays overridable
  only via pcie_aspm=force and existing callers like VMD are left
  untouched.
* Fixed the locked path to use pci_set_power_state_locked() for the D0
  transition. The previous version called the non-locked variant, which
  re-acquires pci_bus_sem.
* ath drivers now disable PCIE_LINK_STATE_ASPM_ALL instead of
  PCIE_LINK_STATE_ALL so that CLKPM is preserved and can be restored
  (pcie_aspm_enabled() doesn't report CLKPM).
* Reworked the kernel-doc patch to cover both the enable and disable APIs
  and reference the new API.
* Rebased on top of v7.2-rc1.

Changes in v2:
* Reworked the pcie_aspm_enabled() API to return the enabled states
  instead of bool and used it to save/restore the ASPM states in ath
  drivers.
* Added a patch from Ilpo to disable ASPM even if BIOS didn't grant
  permission.
* Added the CONFIG_PCIEASPM dependency to ath{10/11/12}k drivers.
* Rebased on top of v6.17-rc1.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Ilpo Järvinen (1):
      PCI/ASPM: Always disable ASPM when driver requests it

Manivannan Sadhasivam (7):
      PCI/ASPM: Add pci_force_enable_link_state() API
      PCI/ASPM: Transition the device to D0 (if required) when enabling ASPM link states
      PCI/ASPM: Improve the kernel-doc for pci_{enable,disable}_link_state*() APIs
      PCI/ASPM: Return enabled ASPM states from pcie_aspm_enabled() API
      wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
      wifi: ath11k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
      wifi: ath10k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states

 drivers/net/wireless/ath/ath10k/Kconfig |   2 +-
 drivers/net/wireless/ath/ath10k/pci.c   |  11 +--
 drivers/net/wireless/ath/ath10k/pci.h   |   5 +-
 drivers/net/wireless/ath/ath11k/Kconfig |   2 +-
 drivers/net/wireless/ath/ath11k/pci.c   |  19 +----
 drivers/net/wireless/ath/ath11k/pci.h   |   3 +-
 drivers/net/wireless/ath/ath12k/Kconfig |   2 +-
 drivers/net/wireless/ath/ath12k/pci.c   |  19 +----
 drivers/net/wireless/ath/ath12k/pci.h   |   4 +-
 drivers/pci/controller/dwc/pcie-qcom.c  |   5 --
 drivers/pci/controller/vmd.c            |   5 --
 drivers/pci/pcie/aspm.c                 | 140 ++++++++++++++++++++++++--------
 include/linux/pci.h                     |   7 +-
 13 files changed, 129 insertions(+), 95 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260708-pci-aspm-fix-331826a2cb5d

Best regards,
--  
மணிவண்ணன் சதாசிவம்



