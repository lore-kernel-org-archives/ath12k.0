Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64887CD98D9
	for <ath12k@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9WVanvaDPGBZOyMlBen4PPe6xSb3aQF/JsFC1M/M8M=; b=U+ocLBZ25mXe2NEPhpTfjkwWeu
	MPWXcCUG7CDGUJ5vMX7z0M2XmWekiUDJyTPJZIog2kJNydXCOHrVQn7V6PPX5h+fa5184Fip9E1HN
	hHx++o7/Ku2piK/63lsGtEQ59RsxtJHcsQgcMgl1R0of9jYacB+9Z+pz8uJ/1b3djmCw8KPmjNgcp
	JE0Dt0JRCj9Yw3ylw4JaDBu7DYFJpsgZZiw5OG/5h8QHdiRGbMjhKLqy9wz2vezvOUr3qGH/xT/93
	4BUW77oGui7YFeWtsU4c/6i/Kl0I/rsTrFq7Y1GRH1UTlvKhKi6EM1FsbMrCK/SUM2Nf3VOQf4l0F
	Up04xq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2qh-0000000B3v9-0cIM;
	Fri, 12 Jun 2026 14:27:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2qc-0000000B3sO-3XzX
	for ath12k@lists.infradead.org;
	Fri, 12 Jun 2026 14:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781274421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+9WVanvaDPGBZOyMlBen4PPe6xSb3aQF/JsFC1M/M8M=;
	b=Mf3hfpJCTwNvgfeB4TAl21TXQxPf54nPwt3ZEQF+1omGFBhMKBFfb3DwCPjq/rlbdkPf9c
	7+wO7UFpyWdWbrBXA6GtLiMK25CvpIbAmeSuepgo5mRmVC+8ww5vWIY3Lc7OErlUxwzyRT
	m7/QECStXFp7nHwlSBKNdFz76ZUZhMk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-Ykr_fRK1MZK2zdPPqwysZA-1; Fri,
 12 Jun 2026 10:26:59 -0400
X-MC-Unique: Ykr_fRK1MZK2zdPPqwysZA-1
X-Mimecast-MFC-AGG-ID: Ykr_fRK1MZK2zdPPqwysZA_1781274417
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C074118005A6;
	Fri, 12 Jun 2026 14:26:56 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.49])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9EA2030001A1;
	Fri, 12 Jun 2026 14:26:51 +0000 (UTC)
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
Subject: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Date: Fri, 12 Jun 2026 16:26:38 +0200
Message-ID: <20260612142638.1243895-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: uxGBifeHRXizPQtxXDzV3m3icX8BM-KXB3KMtMSHxk8_1781274417
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_072702_951881_E4B91BA4 
X-CRM114-Status: GOOD (  13.81  )
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

Add device-specific reset entries for these Qualcomm devices using D3hot
power cycling. Testing shows that despite advertising NoSoftRst+, D3hot
transition provides sufficient reset for VFIO reuse, particularly after
unexpected VM termination. While not a complete reset (BARs preserved),
it provides the only viable reset mechanism for these devices.

Testing was performed on desktop platforms with M.2 WiFi and modem cards
using M.2-to-PCIe adapters, including extensive force-reset cycling to
verify stability.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v9:
  - Complete redesign based on maintainer feedback (Alex Williamson, Bjorn
    Helgaas, Rafael Wysocki): dropped general d3cold infrastructure entirely
    and now just a single patch: the proven D3hot reset for specific
    Qualcomm devices (device-specific reset)
  - Previous v8 patch 1/3 (general d3cold) dropped: concerns about ACPI
    portability, bridge issues, runtime PM, and lack of _PR3 hardware for
    testing.
  - Previous v8 patch 3/3 (quirk_no_bus_reset) already merged for v7.2
v8: https://lore.kernel.org/all/20260609163649.319755-1-jtornosm@redhat.com/

 drivers/pci/quirks.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 431c021d7414..bac1edb6c2dc 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -4240,6 +4240,41 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
 	return 0;
 }
 
+/*
+ * Device-specific reset method for certain Qualcomm devices via D3hot power
+ * cycle.
+ *
+ * These specific Qualcomm devices lack FLR capability, advertise NoSoftRst+
+ * (blocking PM reset), and have broken bus reset. Despite advertising
+ * NoSoftRst+, testing shows that D3hot transition provides sufficient reset
+ * for VFIO reuse, particularly after unexpected VM termination where the
+ * device would otherwise remain in an undefined state. While not a complete
+ * reset (BARs are preserved), it provides the only viable reset mechanism for
+ * these devices in the commented situations.
+ */
+static int reset_qualcomm_d3hot(struct pci_dev *dev, bool probe)
+{
+	int ret;
+
+	if (probe)
+		return 0;
+
+	if (dev->current_state != PCI_D0)
+		return -EINVAL;
+
+	ret = pci_set_power_state(dev, PCI_D3hot);
+	if (ret)
+		return ret;
+	msleep(200);
+
+	ret = pci_set_power_state(dev, PCI_D0);
+	if (ret)
+		return ret;
+	msleep(200);
+
+	return 0;
+}
+
 static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82599_SFP_VF,
 		 reset_intel_82599_sfp_virtfn },
@@ -4255,6 +4290,9 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 		reset_chelsio_generic_dev },
 	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
 		reset_hinic_vf_dev },
+	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_qualcomm_d3hot },  /* WCN6855 */
+	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_qualcomm_d3hot },  /* WCN7850 */
+	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_qualcomm_d3hot },  /* SDX62/SDX65 */
 	{ 0 }
 };
 
-- 
2.54.0


