Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330C9C982D0
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPdusZxTyj8mitpC+u9jyzHi6BGB6YoFEK0SAz87ojo=; b=zK3TLfhPzdmphgkEqY50A7qsuJ
	45qLlVmwRInX3ToAptzm6TllXp0vHvu9y9Zsoky2dgPbhvRMiKa5pmtLsyF5w/5E6qOjbjgDKSI1A
	MSHxUEiXkiYSGcxFjY2fyxD2J8lYHFyYB+87cEeYXJfVU1c2naIUPrxYCHnSuY+IeETmD8/jMfug5
	GlyD/RrzkCDvOa11y9xzejJGhTvv9Q5sV8v9fqA9AFkTtP/2gRlilRR9agZhXy8io6JGLgm7ba4FK
	RPoxqeNMnesBhqxP6Jim1dnnVE9pOj1jbthVa6wtqkdvujkgZz0h6kBvSoq0pfhYweaFrd8qYsipA
	Q+MJm3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76N0-0000000Akhz-3iE5;
	Thu, 17 Sep 2026 07:17:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76My-0000000AkfQ-1AZv
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 07:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789629439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPdusZxTyj8mitpC+u9jyzHi6BGB6YoFEK0SAz87ojo=;
	b=SMSKYOS+kP/MX2IM6QzrT8rmBF6N7aGZzEUhaNHB+S5N4cXJHz+LnBUaT5FqP/3/FJiB+r
	GUa4SMG+ObdIyYh+6TSqccwiQpkTfAt04xhd8ZQM/lfUls4r2YPI3rJ5K8f7+HdfGswTzF
	Jzp9R7si2tLEr77vgtnGMCgfV8vzbkM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-OWl_W37vPJGlJSfexxtjow-1; Thu,
 17 Sep 2026 03:17:14 -0400
X-MC-Unique: OWl_W37vPJGlJSfexxtjow-1
X-Mimecast-MFC-AGG-ID: OWl_W37vPJGlJSfexxtjow_1789629432
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6AF7F1956049;
	Thu, 17 Sep 2026 07:17:12 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AAD37427;
	Thu, 17 Sep 2026 07:17:09 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	mani@kernel.org
Cc: jjohnson@kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v14 2/2] PCI: Add device-specific reset for Qualcomm WCN6855/WCN7850 WLAN
Date: Thu, 17 Sep 2026 09:16:51 +0200
Message-ID: <20260917071651.14174-3-jtornosm@redhat.com>
In-Reply-To: <20260917071651.14174-1-jtornosm@redhat.com>
References: <20260917071651.14174-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: UzlViNCgfhVgRctAiHkoF1eIkXYMbGbMAt0WNoprbFY_1789629432
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_001720_397589_BC63DCBC 
X-CRM114-Status: GOOD (  16.43  )
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

Qualcomm WCN6855 (17cb:1103) and WCN7850 (17cb:1107) WLAN devices lack
working reset methods for VFIO passthrough scenarios. These devices have no
FLR capability, advertise NoSoftRst+ (blocking PM reset), and have broken
bus reset (addressed by quirk_no_bus_reset, merged for v7.2).

VFIO attempts to reset devices on every reassignment. Without a working
reset method, the attempt fails. On clean VM shutdown, the guest driver
properly deinitializes the device via .shutdown/.remove callbacks, leaving
it in a usable state despite the failed reset. However, on unclean VM
termination (crash, force-off), the guest driver callbacks are not
triggered, the device remains in an undefined state (DMA active, interrupts
enabled, etc.), and without a working reset it cannot be reused.

Add a device-specific reset method using BAR-space hardware reset registers
that exist in these devices.

WCN6855/WCN7850 WLAN devices use SoC global reset via BAR0 (sequence from
ath11k/ath12k driver: ath11k_pci_soc_global_reset(), ath11k_pci_sw_reset(),
ath11k_mhi_set_mhictrl_reset()):
- Write/clear reset bit at offset 0x3008
- Wait for PCIe link recovery (up to 5 seconds)
- Clear MHI controller SYSERR status at offset 0x38

This is a true hardware reset mechanism (not power management or firmware
error recovery), providing proper device reset for VFIO scenarios.

Testing shows stable operation over 100+ VM crash/reset cycles, compared
to previous approaches that failed after ~30 cycles. Device-specific reset
is position #1 in the reset hierarchy, so these Qualcomm devices will use
hardware reset as their primary reset method.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
v14: Address Bjorn Helgaas feedback:
  - Split WLAN and modem resets into two separate patches
  - Clarify commit message: VFIO resets on every reassignment, clean
    shutdown leaves device in usable state via driver callbacks, but
    unclean termination is where the lack of reset is critical
  - No code changes from v13, only patch split and commit message
    clarification (Mani's Reviewed-by retained)
v13: https://lore.kernel.org/all/20260915223634.GA878346@bhelgaas/

 drivers/pci/quirks.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index e72af7d2c775..e800dd517614 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -22,6 +22,7 @@
 #include <linux/isa-dma.h> /* isa_dma_bridge_buggy */
 #include <linux/init.h>
 #include <linux/iommu.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
@@ -4230,6 +4231,79 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
 	return 0;
 }
 
+#define QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET	0x3008
+#define QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET_V	BIT(0)
+#define QUALCOMM_WLAN_MHICTRL			0x38
+#define QUALCOMM_WLAN_MHICTRL_RESET_MASK	0x2
+
+/*
+ * Qualcomm WLAN device-specific reset using SoC global reset via BAR0
+ * registers.
+ */
+static int reset_qualcomm_wlan(struct pci_dev *pdev, bool probe)
+{
+	void __iomem *bar;
+	u32 val;
+	u16 cmd;
+	int ret;
+
+	if (probe)
+		return 0;
+
+	if (pdev->current_state != PCI_D0)
+		return -EINVAL;
+
+	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
+	pci_write_config_word(pdev, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
+
+	bar = pci_iomap(pdev, 0, 0);
+	if (!bar) {
+		pci_write_config_word(pdev, PCI_COMMAND, cmd);
+		return -ENODEV;
+	}
+
+	val = ioread32(bar + QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET);
+	if (PCI_POSSIBLE_ERROR(val)) {
+		ret = -ENODEV;
+		goto out_restore;
+	}
+	val |= QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET_V;
+	iowrite32(val, bar + QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET);
+	ioread32(bar + QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET);
+
+	msleep(10);
+
+	val &= ~QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET_V;
+	iowrite32(val, bar + QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET);
+	ioread32(bar + QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET);
+
+	msleep(10);
+
+	ret = read_poll_timeout(ioread32, val,
+				!PCI_POSSIBLE_ERROR(val),
+				20 * USEC_PER_MSEC,
+				5 * USEC_PER_SEC, false,
+				bar + QUALCOMM_WLAN_PCIE_SOC_GLOBAL_RESET);
+	if (ret) {
+		pci_err(pdev, "PCIe link failed to recover after reset\n");
+		goto out_restore;
+	}
+
+	/* After SOC_GLOBAL_RESET, MHISTATUS may still have SYSERR bit set
+	 * and thus need to set MHICTRL_RESET to clear SYSERR.
+	 */
+	iowrite32(QUALCOMM_WLAN_MHICTRL_RESET_MASK, bar + QUALCOMM_WLAN_MHICTRL);
+	ioread32(bar + QUALCOMM_WLAN_MHICTRL);
+
+	msleep(10);
+
+out_restore:
+	pci_iounmap(pdev, bar);
+	pci_write_config_word(pdev, PCI_COMMAND, cmd);
+
+	return ret;
+}
+
 #define MHI_SOC_RESET_REQ_OFFSET		0xb0
 #define MHI_SOC_RESET_REQ			BIT(0)
 
@@ -4285,6 +4359,8 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
 		reset_hinic_vf_dev },
 	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_qualcomm_modem }, /* SDX62/SDX65 modems */
+	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_qualcomm_wlan },  /* WCN6855 WLAN */
+	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_qualcomm_wlan },  /* WCN7850 WLAN */
 	{ 0 }
 };
 
-- 
2.54.0


