Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E02CD8CB9
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 16:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlJUbNpU0pTX5NWiNJbaiX2FROLLctIsfkxEzOcvkg8=; b=3H/M5SCdyNlPSeFPy87aChY/Q9
	ysjIBRfbbcjBqk9Ri/HJUyTElCRqbegjyyqSVRZqfL+grbozypWWpukD18znSDCl/m+W1C3fIr+At
	T1jvbqBEADDboJ/uX1uub3xl2R+QezyHG0H4B7YpkeFXg3jPeI7nh3AP6DpbXNQllPpKTnWm0CgrR
	j6iPCgh613BDwmkTqIQoCnHoLxjKkf6L7VqtNimhj/3+U/V2UmrRPEKMBUBRAuPwtIIDYF3bpphcR
	VIl79qF4tvf/zeDXoBv3VB72cgyIN6bJQWlspbR6z5AquQXEVRCWoO96uaS7CXQurluiHuNoFNWF4
	9NF4tHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzS3-000000063hZ-1yOo;
	Tue, 09 Jun 2026 16:37:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzS0-000000063fu-3zqP
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 16:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781023036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BlJUbNpU0pTX5NWiNJbaiX2FROLLctIsfkxEzOcvkg8=;
	b=CkfzNk0Z3fvOKio+vnKsY/l52/QsKNH6rZ2z97zgb94dczyB97hVSGZe9hx+ffYwJrSiTj
	E+pBnzVFdX/P2oTnb4si/XSb2WkI9PpCtIAGOcmVgxDbc//1e0Kmsv9kdpFTVxqUTOl0hx
	+LHDx5+3iziAb0U3d79GbeqzeFCzRcI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-FuDVg-dlNkCYHEmFdXSS1w-1; Tue,
 09 Jun 2026 12:37:09 -0400
X-MC-Unique: FuDVg-dlNkCYHEmFdXSS1w-1
X-Mimecast-MFC-AGG-ID: FuDVg-dlNkCYHEmFdXSS1w_1781023027
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D076219560BC;
	Tue,  9 Jun 2026 16:37:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.77])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8502C1800662;
	Tue,  9 Jun 2026 16:37:01 +0000 (UTC)
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
Subject: [PATCH v8 1/3] PCI: Add d3cold as general reset method
Date: Tue,  9 Jun 2026 18:36:47 +0200
Message-ID: <20260609163649.319755-2-jtornosm@redhat.com>
In-Reply-To: <20260609163649.319755-1-jtornosm@redhat.com>
References: <20260609163649.319755-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: _tc73K8Nk1vnbfVkSVx7TfLppyB41jRPRr-8SjLf08M_1781023027
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_093717_334651_FDD63B05 
X-CRM114-Status: GOOD (  16.41  )
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

Add D3cold power cycle as a general PCI reset method for single-function
devices on platforms with ACPI _PR3 power resources. This provides true
power cycle reset capability when the platform can physically cut power
to the device.

The implementation strictly requires _PR3 to be present - the platform
must be able to control device power. This ensures d3cold only attempts
true power cycling, not falling back to D3hot transitions.

D3cold reset is placed at the end of the reset hierarchy since it requires
specific platform support and should be tried after standard methods.

Reset hierarchy with this change:
1. device_specific
2. acpi
3. flr
4. af_flr
5. pm (D3hot via config space, checks NoSoftRst)
6. bus (SBR)
7. cxl_bus
8. d3cold (NEW - true power cycle, requires _PR3)

This benefits:
- Platforms with _PR3 support
- Single-function devices needing true power cycle
- VFIO passthrough scenarios where FLR/PM unavailable

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v8: code unchanged from v7
v7: https://lore.kernel.org/all/20260603105853.326290-2-jtornosm@redhat.com/ 

 drivers/pci/pci.c   | 50 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  2 +-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8f7cfcc00090..096868f80cd4 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4491,6 +4491,55 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
 	return ret;
 }
 
+/**
+ * pci_d3cold_reset - Put device into D3cold and back to D0 for reset
+ * @dev: PCI device to reset
+ * @probe: if true, check if D3cold reset is supported; if false, perform reset
+ *
+ * Reset the device by transitioning through D3cold (actual power removal via
+ * platform power control) and back to D0. This requires ACPI _PR3 power
+ * resources to be present - the platform must be able to physically cut power
+ * to the device.
+ *
+ * Only available for single-function devices to avoid affecting other
+ * functions in multi-function devices.
+ *
+ * Returns 0 if device can be/was reset this way, -ENOTTY if not supported,
+ * or other negative error code on failure.
+ */
+static int pci_d3cold_reset(struct pci_dev *dev, bool probe)
+{
+	int ret;
+
+	if (dev->multifunction)
+		return -ENOTTY;
+
+	if (!pci_pr3_present(dev))
+		return -ENOTTY;
+
+	if (probe)
+		return 0;
+
+	if (dev->current_state != PCI_D0)
+		return -EINVAL;
+
+	ret = pci_dev_reset_iommu_prepare(dev);
+	if (ret) {
+		pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
+		return ret;
+	}
+
+	ret = pci_set_power_state(dev, PCI_D3cold);
+	if (ret)
+		goto done;
+
+	ret = pci_set_power_state(dev, PCI_D0);
+
+done:
+	pci_dev_reset_iommu_done(dev);
+	return ret;
+}
+
 /**
  * pcie_wait_for_link_status - Wait for link status change
  * @pdev: Device whose link to wait for.
@@ -5065,6 +5114,7 @@ const struct pci_reset_fn_method pci_reset_fn_methods[] = {
 	{ pci_pm_reset, .name = "pm" },
 	{ pci_reset_bus_function, .name = "bus" },
 	{ cxl_reset_bus_function, .name = "cxl_bus" },
+	{ pci_d3cold_reset, .name = "d3cold" },
 };
 
 /**
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..1ca7b880ead7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -51,7 +51,7 @@
 			       PCI_STATUS_PARITY)
 
 /* Number of reset methods used in pci_reset_fn_methods array in pci.c */
-#define PCI_NUM_RESET_METHODS 8
+#define PCI_NUM_RESET_METHODS 9
 
 #define PCI_RESET_PROBE		true
 #define PCI_RESET_DO_RESET	false
-- 
2.54.0


