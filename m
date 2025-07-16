Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F417C83F3A
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8MmkSHLtnoTbKagDdZUXbjE2pvrxwt6Z4wbzWGUfkU=; b=PsiqjqcUCMhZ4spJxvaAAFy1W4
	NqEFBDEw7C/VI/MAcAhFUTRfP51ygQJ0aIXeQWhjhuBVre5VTkEmsiukhC0rAoBH8N4pyh6NQi5l2
	4yGu9g3Deu+7Gg01s9JxfLRegeP98WC/SjXu36qn3BAydOdJcY7KYA+gGpV88Sh+G/YMWqpwwRhz0
	rFN7wERO+9oOgHauUDSmr12sWCjpH13Emu/fmm2exqooB/CulT/WjWne64ZTF5+93Ok3cIA+enlD/
	75hTsRDLiUruc7YpUFxhDmFpQ4EQetG84RqwLRtcDnA6SkLSzcfbAa44/xPIaFkK8WrUIxG9Kgvbs
	n8VnkEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1iS-00000007jCy-3O7F;
	Wed, 16 Jul 2025 12:58:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1gP-00000007ihV-3sat;
	Wed, 16 Jul 2025 12:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 564BA5C599F;
	Wed, 16 Jul 2025 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D10E7C4CEFB;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670584;
	bh=49se/cV6QgtAokglmFcczz9Ifzd3nxCW5Sn2n0Qc8cA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XCZIZVf9F9mujtGMeE7PtbcRfjU3tQrNiCDSFTczH7hroWYYGmokqZT92ngb+i1q/
	 v/gj4zheOcphI+6GAjWkUFZHt2l8OaOzHClZI9Uyj4+NDipP2PiIOsC8mw3of7zCyZ
	 jLY7+KTVkTZPYpiDiHoRfCevypNUMudP9kGu41K2DqN3jY9Nd/w2Ah1vMGVPctv4QQ
	 Eykmv7NtmyPVV9GE5rmeVoO3UBQcGg/WpS0eI205XYhBPWUoveJiz/HsCko/CGkiY/
	 r/a/B4mzF/atrEBsylPH9ZbgX5EkkcjKf4/wKwoDrLYj7el3/UMu6/UTyspnMUIXg0
	 dMvv9ef/AW8kA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37F4C83F27;
	Wed, 16 Jul 2025 12:56:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 16 Jul 2025 18:26:22 +0530
Subject: [PATCH 3/6] PCI/ASPM: Improve the kernel-doc for
 pci_disable_link_state*() APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-ath-aspm-fix-v1-3-dd3e62c1b692@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
In-Reply-To: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=B9VKKJAdfTeTxxxIgX26hLbY56JMsQhRCw6qWnhJsGw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBod6F2mMxYhWLaZfeExPfHrvfJGSkYizEHM7CpQ
 8Qti9q+oi6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHehdgAKCRBVnxHm/pHO
 9WPGB/9BzzL32x5gdgQQgBO1xt+px2X1J3TuNhPv4s4j0uknjpnIrinkONw0yAA8jblKNU1MM4J
 9GO0/n2fXQk42/YjhSyhLrEXhZvnzVqcEj307CJY721C0rbc5QYClC5tNFRRdqlbyanBAXO3a52
 mJ0CbY7KO5Wz8pxKZTFN08Hg/YML4Vhbi/1nYriFINdR+J0LJZqrZGkYjx7cYk7rhUpfHMyvfTr
 1chKJsI1XoU/K2Z2KOVLGnPe6XWeuRhyds9pEYB+zXYNHntdF4wHgVXfb7dyk/rKrOKx5tU9qDA
 wlI+s6LmIGwxhla/AZ4BtKrhp/GBffKLWArRkvZhVKCzBB7z
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_055626_081489_123991AC 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Add kernel-doc for pci_disable_link_state_locked() API and fix the
kernel-doc for pci_disable_link_state() API.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index c56553de953c158cf9e8bf54c6b358a9a81a2691..4d30e894198c40a168fc03626270b361d5124b67 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1409,6 +1409,19 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool locked
 	return 0;
 }
 
+/**
+ * pci_disable_link_state_locked - Disable device's link state
+ * @pdev: PCI device
+ * @state: ASPM link state to disable
+ *
+ * Disable device's link state, so the link will never enter specific states.
+ * Note that if the BIOS didn't grant ASPM control to the OS, this does nothing
+ * because we can't touch the LNKCTL register.
+ *
+ * Context: Caller holds pci_bus_sem read lock.
+ *
+ * Return: 0 on success, a negative errno otherwise.
+ */
 int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
 {
 	lockdep_assert_held_read(&pci_bus_sem);
@@ -1418,13 +1431,15 @@ int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
 EXPORT_SYMBOL(pci_disable_link_state_locked);
 
 /**
- * pci_disable_link_state - Disable device's link state, so the link will
- * never enter specific states.  Note that if the BIOS didn't grant ASPM
- * control to the OS, this does nothing because we can't touch the LNKCTL
- * register. Returns 0 or a negative errno.
- *
+ * pci_disable_link_state - Disable device's link state
  * @pdev: PCI device
  * @state: ASPM link state to disable
+ *
+ * Disable device's link state, so the link will never enter specific states.
+ * Note that if the BIOS didn't grant ASPM control to the OS, this does nothing
+ * because we can't touch the LNKCTL register.
+ *
+ * Return: 0 on success, a negative errno otherwise.
  */
 int pci_disable_link_state(struct pci_dev *pdev, int state)
 {

-- 
2.45.2



