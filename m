Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745E1C982D2
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 07:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oVowQPD2pzOvsnV2vQtmoDtP9e65GcjkY+VkNiJx7c=; b=sZD21aO3nYvu03CsT6yYTEOobc
	UR2PGnhXXkA778iXVLekfhUBgYXKmyU+uWUZxB+bP68YAo16ULc5DI1jk9pgXdS71WUbt5FdFOL9A
	ZHJALWAeuy7T1ZDhH0w4IZIAC+5E4e/QdZmu3o9xVgz0gxDFMetRZzSxZu1sYHY2QMnD9ZmtAmIN6
	wfEuQvLvcVrKHz5f6iqmuUk2fSDUya+PkuazKPzYGPlQkN8W+NkJtz68HYqnb7apO+ssWeeqhTjIR
	arCXyTVVkgc2bh3JvSRFJafSpx1LPd7NhldrJNaGaCnf3sMiEspbdrXMkUPcgBOFBJnfFfUzTR0d4
	Z7mlaDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76Ms-0000000AkcG-3BJz;
	Thu, 17 Sep 2026 07:17:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76Mq-0000000AkaO-3LF5
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 07:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789629431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oVowQPD2pzOvsnV2vQtmoDtP9e65GcjkY+VkNiJx7c=;
	b=N8zrkcblYRqNTZ/cggo4hxFuPJ1T2HSCr2rRa93SEi7NimlAA/c/RttTEzElVT01L+LXiD
	vjVtoSQVX6O+YgE+xOs7DSuel4M3Ybqez17KxJ6gP+sNpQ3aoq3TyEXOADHfyWIT0Mleuj
	e2w+EcY2wfvsslnujy1xwO9Qyjs3hCs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-348-60u2YI-APXKyemquFbe4Cg-1; Thu,
 17 Sep 2026 03:17:10 -0400
X-MC-Unique: 60u2YI-APXKyemquFbe4Cg-1
X-Mimecast-MFC-AGG-ID: 60u2YI-APXKyemquFbe4Cg_1789629428
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44EE9195DE7A;
	Thu, 17 Sep 2026 07:17:08 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA97E427;
	Thu, 17 Sep 2026 07:17:04 +0000 (UTC)
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
Subject: [PATCH v14 1/2] PCI: Add device-specific reset for Qualcomm SDX62/SDX65 modems
Date: Thu, 17 Sep 2026 09:16:50 +0200
Message-ID: <20260917071651.14174-2-jtornosm@redhat.com>
In-Reply-To: <20260917071651.14174-1-jtornosm@redhat.com>
References: <20260917071651.14174-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: EKF82TrrR9DCmk5VVq6Y6uJzGf7UtcNndg-v0Rls4fk_1789629428
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_001712_918438_69E8EFF1 
X-CRM114-Status: GOOD (  14.19  )
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
NoSoftRst+ (blocking PM reset), and have broken bus reset (addressed by
quirk_no_bus_reset, merged for v7.2).

VFIO attempts to reset devices on every reassignment. Without a proper
reset capability, these devices never successfully initialize even on first
VM assignment.

Add a device-specific reset method using BAR-space hardware reset registers
that exist in these devices.

SDX62/SDX65 modem devices use MHI SoC reset via BAR0 (sequence from MHI
driver: mhi_soc_reset(), mhi_pci_reset_prepare()):
- Write reset request to offset 0xb0
- Wait 2 seconds for reset completion

This is a true hardware reset mechanism (not power management or firmware
error recovery), providing proper device reset for VFIO scenarios.

Testing shows stable operation over 109 VM crash/reset cycles. Device-
specific reset is position #1 in the reset hierarchy, so these Qualcomm
devices will use hardware reset as their primary reset method.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
v14: Address Bjorn Helgaas feedback:
  - Split WLAN and modem resets into two separate patches
  - No code changes from v13, only patch split and commit message
    clarification (Mani's Reviewed-by retained)
v13: https://lore.kernel.org/all/20260915223634.GA878346@bhelgaas/

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


