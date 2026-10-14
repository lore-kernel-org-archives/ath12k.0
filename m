Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9087DCC6B2D
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 20:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sr+m1LBFmL3abttFSdfmitCgd/MxEt7eWX87V5LweSg=; b=WhI4m64UDR5hmV1dzSm1q+o97R
	7QAQbmYv4mmAy12y9Xic4BtxgbcabCPn+0Owe/gM9CGmdDAfBeOGTc7b1PuTg/7Kpl6n3H3NWhBng
	8tPFs7UI2BBDQQx8x+sa8qPL2kFgZJ6MMttc2qdyfmnyDxid1Oc5PVvqE2moycDgfBb+8OiPjwwoV
	9xmI3w0pMGVlU1BNw7sva6Zi4JXptox+mum/XEFsBsZGv9/FhnUnVUgIMYjyauqv+J9VLaMa7KOfp
	DxIJjllPGuW1tDZSgs0s46Qk1cayuVcIojJxIdiGh7N+F3MtPMK1mRNrDljN7WLe0t/sRmgp20QPw
	BKJofrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5wa-0000000GIdI-0yMs;
	Wed, 14 Oct 2026 20:51:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5wX-0000000GIco-1Pqw;
	Wed, 14 Oct 2026 20:51:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18B036020C;
	Wed, 14 Oct 2026 20:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954581F000C4;
	Wed, 14 Oct 2026 20:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792011078;
	bh=sr+m1LBFmL3abttFSdfmitCgd/MxEt7eWX87V5LweSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=k8K+1tFPZoXGs5NKvloT7Y4Xiwz1g4WNa6qoMQXu6T1aefH+iXTkGiHZesJLjtYXs
	 PrasAkZ9p/smMGEE+/Y1//znxm1U9cLU+eNMsjF0TOxPjg5OST/Ce+U7Xlws6Hd05s
	 on+n74IZGprxa1FXPlgbc+u9II6o0d7kTkgarvWE3g1ZcVvz3tgFH+ddZiQx1UFO1e
	 qhXmMgAfsD01e5pZcHEHZcnJXDakpS9Rd+u+DGYA+0hNueiNBb/FgZXWVDoS9BrYkk
	 Yc6JPsQ5g3sGtB2nQ/BPDxVCaNA1lx4uGJqXrtE364fXrRady0YOtrCCQq3zl+CFOE
	 TkLPy7IWt4KFQ==
Date: Wed, 14 Oct 2026 15:51:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Emmanuel Grumbach <egrumbach@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v3 0/8] PCI/ASPM: Add pci_force_enable_link_state() API
 and convert Atheros drivers
Message-ID: <20261014205117.GA1665327@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org>
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

[+cc Emmanuel, Matthew]

On Wed, Jul 08, 2026 at 04:30:14PM +0200, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series converts the atheros WLAN drivers (ath10k/ath11k/ath12k) to
> use the PCI core ASPM APIs for enabling/disabling ASPM instead of writing
> to the LNKCTL register directly. Touching LNKCTL behind the PCI core's
> back leaves the ASPM service driver's view of the link state out of sync
> with the hardware, which is not nice.
> 
> The catch is that these drivers save the currently enabled ASPM states,
> disable ASPM before firmware download, and restore the saved states
> afterwards. pci_enable_link_state() cannot restore states that were
> disabled via pci_disable_link_state() or blacklisted during init (like
> the pre-1.1 device blacklist, which is only meant to be overridden with
> pcie_aspm=force), and that is intentional. So the save/restore sequence
> cannot be expressed with the existing APIs.
> 
> In v2 I tried to fix this by making pci_enable_link_state*() symmetric
> with the disable APIs, but as pointed out during review, that also ends
> up overriding the init-time blacklist for every caller (including VMD),
> which is not something we want. So instead, this version adds a separate
> pci_force_enable_link_state() API (patch 2) that re-enables the requested
> states unconditionally. The caller is responsible for only asking for
> states the device actually supports, and the ath drivers do this by
> restoring exactly what pcie_aspm_enabled() reported earlier.
> 
> The first five patches touch the PCI core: patch 1 (from Ilpo) makes
> pci_disable_link_state() disable ASPM unconditionally, patch 2 adds the
> new API, patch 3 moves the D0 transition needed before enabling PCI-PM
> L1 PM Substates (PCIe r6.0, sec 5.5.4) into the shared helper and drops
> it from the vmd and pcie-qcom callers, patch 4 cleans up the kernel-doc,
> and patch 5 makes pcie_aspm_enabled() return the enabled state mask so it
> can be used for save/restore. The last three patches convert the ath
> drivers.
> 
> Testing
> =======
> 
> I've tested this series on a Lenovo Thinkpad T14s with WCN7850 (so that's
> just the ath12k driver). Rest of the drivers are compile tested only.
> 
> Merging Strategy
> ================
> 
> Even though there is no build dependency between the PCI core and atheros
> patches, there is a functional dependency. So I'd recommend creating an
> immutable branch with the PCI patches and merging that branch into both
> the PCI and linux-wireless trees, and finally merging the atheros patches
> into the linux-wireless tree.
> 
> If the immutable branch seems like a hassle, then the PCI core patches
> could get merged first and the atheros patches can wait for the next
> cycle.
> 
> - Mani
> 
> Changes in v3:
> * Dropped the change that made pci_enable_link_state*() symmetric with the
>   disable APIs. Instead added a new pci_force_enable_link_state() API used
>   only by the ath drivers, so the init-time blacklist stays overridable
>   only via pcie_aspm=force and existing callers like VMD are left
>   untouched.
> * Fixed the locked path to use pci_set_power_state_locked() for the D0
>   transition. The previous version called the non-locked variant, which
>   re-acquires pci_bus_sem.
> * ath drivers now disable PCIE_LINK_STATE_ASPM_ALL instead of
>   PCIE_LINK_STATE_ALL so that CLKPM is preserved and can be restored
>   (pcie_aspm_enabled() doesn't report CLKPM).
> * Reworked the kernel-doc patch to cover both the enable and disable APIs
>   and reference the new API.
> * Rebased on top of v7.2-rc1.
> 
> Changes in v2:
> * Reworked the pcie_aspm_enabled() API to return the enabled states
>   instead of bool and used it to save/restore the ASPM states in ath
>   drivers.
> * Added a patch from Ilpo to disable ASPM even if BIOS didn't grant
>   permission.
> * Added the CONFIG_PCIEASPM dependency to ath{10/11/12}k drivers.
> * Rebased on top of v6.17-rc1.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Ilpo Järvinen (1):
>       PCI/ASPM: Always disable ASPM when driver requests it

I put this first patch on pci/aspm for v7.4 because there seems to be
a consensus that it's better to have the ASPM core disable things even
if it doesn't technically have control of ASPM, because the
alternative is that drivers just do it themselves, also ignoring ASPM
ownership concerns.  Having the drivers do it just means the PCI core
ASPM support doesn't know what's happening.

I think we should defer the rest of these because I think there's a
little room to make the enable/disable/force-enable dance more
intuitive for the drivers.  As far as I know, the rest of the series
is definite cleanups but doesn't fix any actual functional issues.

> Manivannan Sadhasivam (7):
>       PCI/ASPM: Add pci_force_enable_link_state() API
>       PCI/ASPM: Transition the device to D0 (if required) when enabling ASPM link states
>       PCI/ASPM: Improve the kernel-doc for pci_{enable,disable}_link_state*() APIs
>       PCI/ASPM: Return enabled ASPM states from pcie_aspm_enabled() API
>       wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
>       wifi: ath11k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
>       wifi: ath10k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
> 
>  drivers/net/wireless/ath/ath10k/Kconfig |   2 +-
>  drivers/net/wireless/ath/ath10k/pci.c   |  11 +--
>  drivers/net/wireless/ath/ath10k/pci.h   |   5 +-
>  drivers/net/wireless/ath/ath11k/Kconfig |   2 +-
>  drivers/net/wireless/ath/ath11k/pci.c   |  19 +----
>  drivers/net/wireless/ath/ath11k/pci.h   |   3 +-
>  drivers/net/wireless/ath/ath12k/Kconfig |   2 +-
>  drivers/net/wireless/ath/ath12k/pci.c   |  19 +----
>  drivers/net/wireless/ath/ath12k/pci.h   |   4 +-
>  drivers/pci/controller/dwc/pcie-qcom.c  |   5 --
>  drivers/pci/controller/vmd.c            |   5 --
>  drivers/pci/pcie/aspm.c                 | 140 ++++++++++++++++++++++++--------
>  include/linux/pci.h                     |   7 +-
>  13 files changed, 129 insertions(+), 95 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260708-pci-aspm-fix-331826a2cb5d
> 
> Best regards,
> --  
> மணிவண்ணன் சதாசிவம்
> 
> 

