Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F683C83F34
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xJWU9+hra7bBSZnsoa+8wIfWFZUnULuYmjrRz4QvZhE=; b=mTLPDoOxOj+bISY/Jdo2ICPFJr
	L/xgKzDQKlIrOm30IZM/IG3VBz3wSnuARcXHvn8PqP8ULjldRFcZMJHCmluinbeVJYe4qjgsJJyZL
	f77GNyoSba6KtolIj37ryEaU9y2bBURvzMKmFz4eBqOyOrr0QkjSBWmBpXVCT3elVNj/nboXVQfsQ
	kGTQ7rPaH04mf2kAmXDF0WFEVXmHyFKKRJ/MJd3TWVCFDG/Lj4c+sE4Tid2BbjZkBc3Ewhz8HSRah
	AYgoQ95OzFcrf9WmvkwbAKSY/HASgaH1t6xec9ndaYn8fqZ2WBb+2AHxz8muQ0fHDBqNKZ3souE5M
	vVcyCJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1iP-00000007j6m-0rP7;
	Wed, 16 Jul 2025 12:58:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1gP-00000007ihR-2hSx;
	Wed, 16 Jul 2025 12:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BF3F5C04FA;
	Wed, 16 Jul 2025 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A128EC4CEF4;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670584;
	bh=XJHu0BU6B2oAYGh4zlJhKIwWPQugh47Z5AJ6yeiT7Z4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=T6f37LOL55CAf6De29GNzmhzCyVDSGnGtukns/GoO03iBooiZmthuBpMqVQlRYK9C
	 W46IF4PieyurJp8WQmqlUCMT2R/HP6hJfdJljwXpZ1UaRYu33EAm/kZFPgYEfpJUuW
	 enp5lezsZOWEYssn+Ykp98f5p6itslJv5lBa8x5x0hyIV56ZXdA69YxkboqlMNFG4+
	 VeXyb2H3+7qXz6eugC8jNqjNHjrgn9lcgl416dpT0qFLHF9mYZnCj1LKUG5k/yQJoT
	 5VID/Ks5gM3fZ1K1sQROXTiWOPRZ4dP4ZjlA5AqshFYzpkw74x8v1X4JrHxn5wUQ3r
	 DLMdbaHUJmXNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9C6C83F22;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH 0/6] PCI/ASPM: Fix pci_enable_link_state*() APIs behavior
Date: Wed, 16 Jul 2025 18:26:19 +0530
Message-Id: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHOhd2gC/x2MQQqAMAzAviI9W7BjMvQr4qFodT04ZRURxL87P
 CaQPGCSVQz66oEsl5ruqQDVFUyR0yqoc2FwjWubQIR8RmQ7Nlz0xomC945b7ligJEeWov/dML7
 vBxDLtA5eAAAA
X-Change-ID: 20250711-ath-aspm-fix-c17442a5a9ae
To: Jeff Johnson <jjohnson@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
 ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, 
 ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=XJHu0BU6B2oAYGh4zlJhKIwWPQugh47Z5AJ6yeiT7Z4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBod6F2iDbObtlH1SjC+CqMAksFgzOriAQ1Avz7v
 IVgkpT7eMSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHehdgAKCRBVnxHm/pHO
 9YnKB/wIw+Evh74fkz1+e3zKFQWHQKJJSazZGHS5g4sICCMPZ/4M93vTf+iLF4Blp3veDJhLy1B
 BGe8V3AJq+xqMdOOWmaPj/fEy7ukevvMlLZHnS5yHIrebv9ehwe60fjePHZ+kkwke2JXgh5SMn2
 aoNSydN026Nm+C+XW0IVVbZqMpsq3pFyN5MLTUVKM9zREWmmg/RAd75jPZ0oWkNiqzEj2C4XoVV
 M3swsNxSU7uFYHGzLxGFSLk3zf3Sm1Tl48owufc1zv9xTnXYeobMvQIsx4hvQSBACG7gwFxjUmc
 4epgfpo4UEHaA5y6LDHB/oAZex/9Q6hTaG0SGH/st9KFUCxN
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_055625_781751_0AB7C244 
X-CRM114-Status: GOOD (  12.59  )
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,

This series fixes the behavior of the pci_enable_link_state() and
pci_enable_link_state_locked() APIs to be in symmetry with
pci_disable_link_state*() couterparts.

First 3 patches fixes and cleans up the ASPM code and the last 3 patches
modifies the atheros drivers to use the pci{enable/disable}_link_state() APIs
instead of modifying the LNKCTL register directly for enabling ASPM.

NOTE: The current callers of the pci_enable_link_state_locked() APIs (vmd and
pcie-qcom) drivers doesn't look like depending on the old behavior of the API. I
can atleast assure that for pcie-qcom. For VMD, it would be great if VMD folks
CCed could provide their review tags for patch 1/6.

Testing
=======

I've tested this series on Lenovo Thinkpad T14s with WCN7850 chipset (so that's
just ath12k driver). Rest of the drivers are compile tested only.

Merging Strategy
================

Even though there is no build dependency between PCI core and atheros patches,
there is a functional dependency. So I'd recommend creating an immutable branch
with PCI patches and merging that branch into both PCI and linux-wireless trees
and finally merging the atheros patches into linux-wireless tree.

If immutable branch seems like a hassle, then PCI core patches could get merged
for 6.17 and atheros patches can wait for 6.18.

- Mani

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (6):
      PCI/ASPM: Fix the behavior of pci_enable_link_state*() APIs
      PCI/ASPM: Transition the device to D0 (if required) inside pci_enable_link_state_locked() API
      PCI/ASPM: Improve the kernel-doc for pci_disable_link_state*() APIs
      wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
      wifi: ath11k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
      wifi: ath10k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states

 drivers/net/wireless/ath/ath.h         | 14 ++++++
 drivers/net/wireless/ath/ath10k/pci.c  |  7 +--
 drivers/net/wireless/ath/ath11k/pci.c  | 10 ++---
 drivers/net/wireless/ath/ath12k/pci.c  | 10 ++---
 drivers/pci/controller/dwc/pcie-qcom.c |  5 ---
 drivers/pci/controller/vmd.c           |  5 ---
 drivers/pci/pcie/aspm.c                | 78 ++++++++++++++++++++++++----------
 7 files changed, 79 insertions(+), 50 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250711-ath-aspm-fix-c17442a5a9ae

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



