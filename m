Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97286CA5FF0
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9ybfkjjQyEBOnKyW7ywsxv+01LedkQkjdz2/XCnQyA=; b=mbNvQnKyToi3H993C2rhkGHXvt
	y0Englx49pPmINIqafkv7v1xCDVgCFXnBBgnlTHFRw+hexRz1htm0EJZz1hpy0JWv4kL0aXgRii51
	11oFtvPDBicUtcCi4rRw+re8vNq1A3DvFYx2i/EgoVlGklx/EBHLB/f073dP8bfvQpXIVViOIVkCh
	KkPMO2FQiZefiE2dDQHQdmqYp4+AN73l84leQi9GRzZAVr5zRSoApsg69aDBAjcmjhRc1vzRjeCOW
	M8jSomBZMhRvynxwk23o0l5cS1fuo5yOkHZXFk38yL2VozhAfRxk6oYqCdSTF7PRxFp2Q7H/w4fk5
	g2NlR4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgLX-0000000GEq4-16U0;
	Mon, 05 Oct 2026 10:55:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgLS-0000000GEno-0cYN
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 10:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791197697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9ybfkjjQyEBOnKyW7ywsxv+01LedkQkjdz2/XCnQyA=;
	b=PDicREENdyWElIXtgR+GxrBz8JaT3eQmdZbjoVnP9KxmPh/bSkHvR0DeCw4O/E/IlsOQx6
	yNkjw6JKGfW+DEeqjbVmxoXzWkFoM4VCuCFd1rr4s0GDqM4LMXO11SmiTokyPoD0rmCMJr
	9+sXgtc5T+B4HQ91xjicJlqeMRkkkqk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-0fQc6ZMxMuKEoHzXhDfGmw-1; Mon,
 05 Oct 2026 06:54:53 -0400
X-MC-Unique: 0fQc6ZMxMuKEoHzXhDfGmw-1
X-Mimecast-MFC-AGG-ID: 0fQc6ZMxMuKEoHzXhDfGmw_1791197691
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF876182A128;
	Mon,  5 Oct 2026 10:54:51 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 549501800446;
	Mon,  5 Oct 2026 10:54:48 +0000 (UTC)
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
Subject: [PATCH v15 1/2] PCI: Add device-specific reset for Qualcomm SDX62/SDX65 modems
Date: Mon,  5 Oct 2026 12:54:35 +0200
Message-ID: <20261005105436.83962-2-jtornosm@redhat.com>
In-Reply-To: <20261005105436.83962-1-jtornosm@redhat.com>
References: <20261005105436.83962-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: V-lw_78_ylrURwY10XiOKcCS2YZkrkiX_xgmyfa02RQ_1791197691
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_035500_580840_DA28AB17 
X-CRM114-Status: GOOD (  13.49  )
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

Qualcomm SDX62/SDX65 5G modems (17cb:0308) lack working reset methods for
VFIO passthrough scenarios. These devices have no FLR capability, advertise
NoSoftRst+ (blocking PM reset), and have broken bus reset.

Standard reset methods were already disabled for these devices by commit
6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm WCN6855/WCN7850 WiFi,
SDX62/SDX65 modems") because they were not working (quirk_no_bus_reset).

VFIO attempts to reset devices on every reassignment. Without a proper
reset capability, these devices never successfully initialize even on first
VM assignment.

Add a device-specific reset method using BAR-space hardware reset registers
that exist in these devices.

SDX62/SDX65 modem devices use MHI SoC reset via BAR0 (sequence from MHI
driver: mhi_soc_reset(), mhi_pci_reset_prepare()):
- Write reset request to offset 0xb0
- Wait 2 seconds for reset completion

These are true hardware reset mechanisms (not power management or firmware
error recovery), providing proper device reset for VFIO scenarios, allowing
to enforce isolation between successive passthrough users.

Testing shows stable operation over 109 VM crash/reset cycles. Device-
specific reset is position #1 in the reset hierarchy, so these Qualcomm
devices will use hardware reset as their primary reset method.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Alex Williamson <alex@shazbot.org>
---
v15: Address Bjorn Helgaas feedback:
    - Explain the relationship with 6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm
    WCN6855/WCN7850 WiFi, SDX62/SDX65 modems") and previous status.
    - No code changes from v14, only commit message clarification (Mani's
    Reviewed-by and Alex's Acked-by retained)
v14: https://lore.kernel.org/all/20260917071651.14174-2-jtornosm@redhat.com/

 drivers/pci/quirks.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index de9bbccda21f..e72af7d2c775 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4230,6 +4230,45 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
 	return 0;
 }
 
+#define MHI_SOC_RESET_REQ_OFFSET		0xb0
+#define MHI_SOC_RESET_REQ			BIT(0)
+
+/*
+ * Qualcomm modem device-specific reset using MHI SoC reset via BAR0
+ * register.
+ */
+static int reset_qualcomm_modem(struct pci_dev *pdev, bool probe)
+{
+	void __iomem *bar;
+	u16 cmd;
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
+	iowrite32(MHI_SOC_RESET_REQ, bar + MHI_SOC_RESET_REQ_OFFSET);
+	ioread32(bar + MHI_SOC_RESET_REQ_OFFSET);
+
+	/* Be sure device reset has been executed */
+	msleep(2000);
+
+	pci_iounmap(pdev, bar);
+	pci_write_config_word(pdev, PCI_COMMAND, cmd);
+
+	return 0;
+}
+
 static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82599_SFP_VF,
 		 reset_intel_82599_sfp_virtfn },
@@ -4245,6 +4284,7 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 		reset_chelsio_generic_dev },
 	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
 		reset_hinic_vf_dev },
+	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_qualcomm_modem }, /* SDX62/SDX65 modems */
 	{ 0 }
 };
 
-- 
2.54.0


