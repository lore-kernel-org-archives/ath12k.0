Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C485DCA5FCE
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+fZ4tkxAhsRlZKdZeMrprE3kIM5heVV5x1LvJR9F+0=; b=l4ZYaXQa/auJELCq6WYVBB7xvO
	jSoFKm7S9C/TKLE4s9W4Pguqo7QrZhSlxjyc/htAGTLsB6t0/Gjbc00GRjY9Ud8SArHQnWlvGwchJ
	gSdSoc2/QFQ9uk6dfCke8PDhdsecM/ofg8aTSaO2qF26XmEH/cyy2mqmehxPDuWLJ+9VDyIsvALEj
	TZOyUSLHFRnSWA3XUHW8oXUq4pW54CxfcGvmuLR1OSaT6Yx/SFm/mBq6FGWbTgxyYSKScvmwuzDYP
	DptFZ0KrZYegPTfwuOb4qNa7fkwofzBuHewGfIG78cX860DF+bz5aIFiVU/aI/GSQY819KlO2RcLy
	i+kKNLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgLY-0000000GEr8-1wCt;
	Mon, 05 Oct 2026 10:55:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgLU-0000000GEnt-3gV6
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 10:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791197700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+fZ4tkxAhsRlZKdZeMrprE3kIM5heVV5x1LvJR9F+0=;
	b=MlQpgyLBsk64tCZuPmB8FviXcGprYAcuCW1GtWQzdTwmKi87s4ltvxX+IG+xFxNkHoYNR1
	uWvRMFJz2zmHJRsJjs6MiOZtA/0WCcU/6lEYPTkI+TEPhPlF9Q+0/obyVktdRXzsiM+aAC
	FU856Bam5aSjCevPF3OBEKmp9RSiVKY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-yDCbDQ_zOPO44zyDm5S0tw-1; Mon,
 05 Oct 2026 06:54:58 -0400
X-MC-Unique: yDCbDQ_zOPO44zyDm5S0tw-1
X-Mimecast-MFC-AGG-ID: yDCbDQ_zOPO44zyDm5S0tw_1791197696
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97E8B19540F2;
	Mon,  5 Oct 2026 10:54:56 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B0A641800446;
	Mon,  5 Oct 2026 10:54:53 +0000 (UTC)
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
Subject: [PATCH v15 2/2] PCI: Add device-specific reset for Qualcomm WCN6855/WCN7850 WLAN
Date: Mon,  5 Oct 2026 12:54:36 +0200
Message-ID: <20261005105436.83962-3-jtornosm@redhat.com>
In-Reply-To: <20261005105436.83962-1-jtornosm@redhat.com>
References: <20261005105436.83962-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 0RCoW0gKG6F8iAOg-bDEnPCWmetUsBbrJecHEbrWOsk_1791197696
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_035501_008909_055D1A07 
X-CRM114-Status: GOOD (  15.44  )
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
bus reset.

Standard reset methods were already disabled for these devices by commit
6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm WCN6855/WCN7850 WiFi,
SDX62/SDX65 modems") because they were not working (quirk_no_bus_reset).

Resets of this device always failed prior to this commit, so VFIO on
the host could not enforce isolation between successive passthrough
users.

If a guest driver deinitialized the device, it may have been functional
if passed through to a subsequent guest, despite the lack of isolation.
Otherwise the device may have been left in an undefined state (e.g., DMA
and interrupts active) and unusable.

Add a device-specific reset method using BAR-space hardware reset
registers that exist in these devices.

WCN6855/WCN7850 WLAN devices use SoC global reset via BAR0 (sequence from
ath11k/ath12k driver: ath11k_pci_soc_global_reset(), ath11k_pci_sw_reset(),
ath11k_mhi_set_mhictrl_reset()):
- Write/clear reset bit at offset 0x3008
- Wait for PCIe link recovery (up to 5 seconds)
- Clear MHI controller SYSERR status at offset 0x38

These are true hardware reset mechanisms (not power management or firmware
error recovery), providing proper device reset for VFIO scenarios.

Testing shows stable operation over 100+ VM crash/reset cycles, compared
to previous approaches that failed after ~30 cycles. Device-specific reset
is position #1 in the reset hierarchy, so these Qualcomm devices will use
hardware reset as their primary reset method.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Alex Williamson <alex@shazbot.org>
---
v15: Address Bjorn Helgaas feedback:
  - Explain the relationship with 6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm
    WCN6855/WCN7850 WiFi, SDX62/SDX65 modems") and previous status.
  - Emphasize isolation.
  - No code changes from v14, only commit message clarification (Mani's
    Reviewed-by and Alex's Acked-by retained)
v14: https://lore.kernel.org/all/20260917071651.14174-3-jtornosm@redhat.com/

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


