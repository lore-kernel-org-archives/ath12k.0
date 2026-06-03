Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A809CD6E64
	for <ath12k@archiver.kernel.org>; Wed,  3 Jun 2026 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkKgSZKbs0xLT6aF382KOTk5j9dcLvy/bEt1kDc5Ik4=; b=3E0QB1qIFEwZTlS95IZX3Zc7dv
	lVefdkEUZNZgngYGWp90lEfZ75Ese1KRhtw2k+FM+sukKRdyqNDna777idBXfezUcoXuRG8lxhM35
	8NqGoDMit23YDaezqn0h1DVvnIc7+/BmKmalU7+5fRlRE6/JMvet01bGKh+JFtG5ISmjwcUZYr3W5
	LFaQlSjDkIElb4zAKk/WSHtzXmRZM2A/M43Y7rG5AyrINSg8Ae2K69JCfj1NquWlXAf3Zdgwjv0GC
	r0Yv/uH8Ad6LOqIunLP77IDuswV4myJehdExsB3SNPXeGzKSi+BEezCmqkI58cegWCcNF00vqdWyn
	YxISyr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjJk-0000000ErHF-0TZZ;
	Wed, 03 Jun 2026 10:59:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjJh-0000000ErDt-0LUM
	for ath12k@lists.infradead.org;
	Wed, 03 Jun 2026 10:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780484360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jkKgSZKbs0xLT6aF382KOTk5j9dcLvy/bEt1kDc5Ik4=;
	b=MRkMuJy6gpqPZU/cpGmpO1P+rzv/jgcIhVOKQGlnuk9ZBje5vEer/dK9/4+VRSfSGDTFER
	yF7snz91zMHVuHOEBejh+CiPu9jjWAuXDsvCdRiEZHzfREzVUlq18LKi3a1uBy5m99LwcY
	SOYYmUTo5dOhMJDvQYKFVmy+M+YEa8Q=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-56ind7lZMZCMooqSRig8uA-1; Wed,
 03 Jun 2026 06:59:17 -0400
X-MC-Unique: 56ind7lZMZCMooqSRig8uA-1
X-Mimecast-MFC-AGG-ID: 56ind7lZMZCMooqSRig8uA_1780484355
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57F11195608E;
	Wed,  3 Jun 2026 10:59:15 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.81])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7DD4A1956095;
	Wed,  3 Jun 2026 10:59:10 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org
Cc: jjohnson@kernel.org,
	mani@kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v6 2/3] PCI: Add device-specific reset for Qualcomm devices
Date: Wed,  3 Jun 2026 12:58:52 +0200
Message-ID: <20260603105853.326290-3-jtornosm@redhat.com>
In-Reply-To: <20260603105853.326290-1-jtornosm@redhat.com>
References: <20260603105853.326290-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: At8jOt38V0h6rJUZZVrpaogk1Ev29L5Kc6iM63z7LLo_1780484355
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_035921_237029_1B263E06 
X-CRM114-Status: GOOD (  18.38  )
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

Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
lack working reset methods for VFIO passthrough scenarios. These devices
have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
broken bus reset.

The problem manifests in VFIO passthrough scenarios:

- WCN6855 WiFi card (17cb:1103): Normal VM operation works fine, including
  clean shutdown/reboot. However, when the VM terminates uncleanly
  (crash, force-off), VFIO attempts to reset the device before it can
  be assigned to another VM. Without a working reset method, the device
  remains in an undefined state, preventing reuse.

- WCN7850 WiFi card (17cb:1107): Same behavior as WCN6855.

- SDX62/SDX65 5G modems (17cb:0308): Never successfully initialize even
  on first VM assignment without proper reset capability.

Add device-specific reset entries for these Qualcomm devices using D3cold
power cycling with automatic D3hot fallback. The implementation uses
pci_set_power_state(D3cold) which automatically falls back to D3hot on
platforms without ACPI _PR3 power resources. While not a complete reset
(BARs preserved), testing shows D3hot transition provides sufficient reset
for VFIO reuse.

Extract a shared pci_dev_d3cold_d0_cycle() helper function to avoid code
duplication between pci_d3cold_reset() (strict _PR3 requirement) and the
new reset_d3cold_d3hot() device-specific reset (automaticfallback). The
helper handles IOMMU preparation, performs the power cycle via
pci_set_power_state(), and cleans up IOMMU state.

Device-specific reset is position #1 in the reset hierarchy, so these
Qualcomm devices will use power cycling as their primary reset method,
with the general d3cold method (position #8) available as a fallback on
_PR3-capable platforms if users override via sysfs.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v7: Address the comments from Jeff Johnson: the problem was detected for
    the specific devices WCN6855 and WCN7850, use the name of the devices
    instead of the related drivers ath11k and ath12k, which support a large
    number of devices
v6: https://lore.kernel.org/all/20260602160024.1171949-3-jtornosm@redhat.com/

 drivers/pci/pci.c    | 37 +++++++++++++++++++++++++++----------
 drivers/pci/pci.h    |  1 +
 drivers/pci/quirks.c | 19 +++++++++++++++++++
 3 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 096868f80cd4..f7a7443287fd 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4491,6 +4491,32 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
 	return ret;
 }
 
+/**
+ * pci_dev_d3cold_d0_cycle - Perform D3cold->D0 power cycle
+ * @dev: Device to power cycle
+ *
+ * Common helper to perform D3cold->D0 power cycle for reset methods.
+ * Attempts D3cold transition with automatic fallback to D3hot on platforms
+ * without ACPI _PR3 power resources.
+ *
+ * Caller must handle IOMMU preparation/cleanup if needed.
+ *
+ * Returns 0 on success, negative error code on failure.
+ */
+int pci_dev_d3cold_d0_cycle(struct pci_dev *dev)
+{
+	int ret;
+
+	if (dev->current_state != PCI_D0)
+		return -EINVAL;
+
+	ret = pci_set_power_state(dev, PCI_D3cold);
+	if (ret)
+		return ret;
+
+	return pci_set_power_state(dev, PCI_D0);
+}
+
 /**
  * pci_d3cold_reset - Put device into D3cold and back to D0 for reset
  * @dev: PCI device to reset
@@ -4520,22 +4546,13 @@ static int pci_d3cold_reset(struct pci_dev *dev, bool probe)
 	if (probe)
 		return 0;
 
-	if (dev->current_state != PCI_D0)
-		return -EINVAL;
-
 	ret = pci_dev_reset_iommu_prepare(dev);
 	if (ret) {
 		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
 		return ret;
 	}
 
-	ret = pci_set_power_state(dev, PCI_D3cold);
-	if (ret)
-		goto done;
-
-	ret = pci_set_power_state(dev, PCI_D0);
-
-done:
+	ret = pci_dev_d3cold_d0_cycle(dev);
 	pci_dev_reset_iommu_done(dev);
 	return ret;
 }
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4a14f88e543a..a9942787de9e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -234,6 +234,7 @@ void pci_init_reset_methods(struct pci_dev *dev);
 int pci_bridge_secondary_bus_reset(struct pci_dev *dev);
 int pci_bus_error_reset(struct pci_dev *dev);
 int pci_try_reset_bridge(struct pci_dev *bridge);
+int pci_dev_d3cold_d0_cycle(struct pci_dev *dev);
 
 struct pci_cap_saved_data {
 	u16		cap_nr;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index e49136ac5dbf..70f3b0f26799 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4237,6 +4237,22 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
 	return 0;
 }
 
+/*
+ * Device-specific reset method via D3cold/D3hot power cycle.
+ *
+ * Some devices lack working FLR, advertise NoSoftRst+ (blocking PM reset),
+ * and have broken bus reset. This function provides device-specific reset via
+ * power cycling, attempting D3cold with automatic fallback to D3hot on platforms
+ * without ACPI _PR3 power resources.
+ */
+static int reset_d3cold_d3hot(struct pci_dev *dev, bool probe)
+{
+	if (probe)
+		return 0;
+
+	return pci_dev_d3cold_d0_cycle(dev);
+}
+
 static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82599_SFP_VF,
 		 reset_intel_82599_sfp_virtfn },
@@ -4252,6 +4268,9 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 		reset_chelsio_generic_dev },
 	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
 		reset_hinic_vf_dev },
+	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_d3cold_d3hot },  /* WCN6855 */
+	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_d3cold_d3hot },  /* WCN7850 */
+	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_d3cold_d3hot },  /* SDX62/SDX65 */
 	{ 0 }
 };
 
-- 
2.54.0


