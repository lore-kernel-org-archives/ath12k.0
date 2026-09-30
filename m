Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B83CA5FC7
	for <ath12k@archiver.kernel.org>; Wed, 30 Sep 2026 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BxRhMSUFbC0ZUhx2ycCj3+AeDAxyb/zT+LTlcEooUE=; b=H8ZBcSbAS/7lT/bmYQ6+TcVaZZ
	QucIGRQaYChUslzFrvl6hcaTNbXxrl6A9Irw3BPftWLspsk2MEruiUroouWbLojSG7fL2wBZI4kWa
	WSnfIVdCxFzcTHItZ1iaoosGXLJXjQIfaQw9OhGqZd/yyU1RIF3elOyDGcDLSoPBhA5u9srFo7n7z
	ENy4N9AXli+cYqZnvw3uvv4iW54I53kzr+UbgmrfrYhHrz/k8LE73ojyryYFyX0xTCqNLObz5MAIM
	yXs0O01FTe6dNec+GN8JY3MywWX1eeyv9O8yPfdhatrYnY7S57I+fYctPe7D64qCAu7IMQlPnpms5
	g0edghCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuzu-00000006EVa-2WLG;
	Wed, 30 Sep 2026 14:09:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuzr-00000006ETd-2gpo
	for ath12k@lists.infradead.org;
	Wed, 30 Sep 2026 14:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9BxRhMSUFbC0ZUhx2ycCj3+AeDAxyb/zT+LTlcEooUE=;
	b=gJjrkV+O0EYOTh4Zl+1BY1o0WIwUHDTziyH8lRGyDlFwgGI9r5T8gB46Hhdlgj1ftCLcpf
	itIE5GMOUAPv7Yi9TuEdRIXquWcEVvhnR/MN9ynKf1kctIvsEsLIy3OZxdsCcvzsV2baog
	W/ambIlhJKLgAFsLCH/zQy3T1hazFDs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317--DlMhR4oP8mqRPeBD6UlLg-1; Wed,
 30 Sep 2026 10:09:18 -0400
X-MC-Unique: -DlMhR4oP8mqRPeBD6UlLg-1
X-Mimecast-MFC-AGG-ID: -DlMhR4oP8mqRPeBD6UlLg_1790777356
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00CBD1977531;
	Wed, 30 Sep 2026 14:09:16 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8D5871956044;
	Wed, 30 Sep 2026 14:09:11 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	jjohnson@kernel.org
Cc: johannes@sipsolutions.net,
	mani@kernel.org,
	jgg@ziepe.ca,
	yishaih@nvidia.com,
	skolothumtho@nvidia.com,
	kevin.tian@intel.com,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 2/7] vfio: Add qcom_vfio.h header for MSI cache protocol
Date: Wed, 30 Sep 2026 16:08:28 +0200
Message-ID: <20260930140833.576941-3-jtornosm@redhat.com>
In-Reply-To: <20260930140833.576941-1-jtornosm@redhat.com>
References: <20260930140833.576941-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: xCvm4UovB_ooimpiPFcRpP0C9vb_SgSkeQbJiZS7fEo_1790777356
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_070923_958268_37320C6F 
X-CRM114-Status: GOOD (  16.49  )
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

Add shared header defining the communication protocol between
qcom-vfio-pci variant driver and Qualcomm device drivers (ath11k,
ath12k) for passing physical host MSI addresses to VMs.

Qualcomm device firmware requires physical host MSI addresses rather
than guest IOVA addresses. The qcom-vfio-pci driver caches host MSI
values in extended PCI config space with a magic signature "QMSI" for
VM discovery.

Protocol:
 1. Host: qcom-vfio-pci finds free space in extended config (0x100-0xFFF)
 2. Host: Writes magic signature "QMSI" (0x49534D51) followed by MSI data
 3. VM: Device driver searches for "QMSI" signature to locate cached MSI
 4. VM: Reads MSI values and programs device firmware

This avoids offset mismatch when QEMU filters certain capabilities,
causing host and VM to see different extended capability chains.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 include/linux/qcom_vfio.h | 88 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 include/linux/qcom_vfio.h

diff --git a/include/linux/qcom_vfio.h b/include/linux/qcom_vfio.h
new file mode 100644
index 000000000000..c59c81936e84
--- /dev/null
+++ b/include/linux/qcom_vfio.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-FileCopyrightText: Copyright Red Hat */
+
+#ifndef _QCOM_VFIO_H_
+#define _QCOM_VFIO_H_
+
+#include <linux/pci.h>
+
+/*
+ * MSI Address Passthrough Quirk
+ *
+ * Qualcomm device firmware requires physical host MSI addresses rather than
+ * guest IOVA addresses. The qcom-vfio-pci variant driver caches host MSI
+ * values in extended PCI config space with a magic signature for VM
+ * discovery.
+ *
+ * Protocol:
+ *  1. Host: qcom-vfio-pci finds free space in extended config (0x100-0xFFF)
+ *  2. Host: Writes magic signature "QMSI" (0x49534D51) followed by MSI data
+ *  3. VM: Device driver searches for "QMSI" signature to locate cached MSI
+ *  4. VM: Reads MSI values and programs device firmware
+ *
+ * This avoids offset mismatch when QEMU filters certain capabilities, causing
+ * host and VM to see different extended capability chains.
+ *
+ * Layout in extended config space:
+ *   +0x00: Magic signature "QMSI" (0x49534D51)
+ *   +0x04: MSI address low 32 bits
+ *   +0x08: MSI address high 32 bits
+ *   +0x0C: MSI data (16 bits)
+ *
+ * Applicable to:
+ *  - ath11k WiFi (PCI ID 0x17cb:0x1103)
+ *  - ath12k WiFi (PCI ID 0x17cb:0x1107)
+ */
+
+/* Magic signature "QMSI" to identify cached MSI data */
+#define QCOM_VFIO_MSI_MAGIC		0x49534D51
+
+/* Space needed for magic + MSI passthrough data */
+#define QCOM_VFIO_MSI_SPACE_SIZE	16
+
+/* Relative offsets from base discovered by qcom_vfio_find_msi_offset() */
+#define QCOM_VFIO_MSI_MAGIC_OFFSET	0x00	/* Magic signature "QMSI" */
+#define QCOM_VFIO_MSI_ADDR_LO_OFFSET	0x04	/* Host MSI address low 32 bits */
+#define QCOM_VFIO_MSI_ADDR_HI_OFFSET	0x08	/* Host MSI address high 32 bits */
+#define QCOM_VFIO_MSI_DATA_OFFSET	0x0C	/* Host MSI data (16 bits) */
+
+/**
+ * qcom_vfio_find_msi_offset - Find free space for host to cache MSI
+ * @pdev: PCI device
+ *
+ * Host-side function: Finds free space in extended config to write MSI cache.
+ * Uses PCI core utility to scan capability chain.
+ *
+ * Returns: Offset in extended config space (>= 0x100), or 0 if no space found
+ */
+static inline int qcom_vfio_find_msi_offset(struct pci_dev *pdev)
+{
+	return pci_find_free_ext_cap_offset(pdev, QCOM_VFIO_MSI_SPACE_SIZE);
+}
+
+/**
+ * qcom_vfio_find_msi_cache - Locate cached MSI data by magic signature
+ * @pdev: PCI device
+ *
+ * VM-side function: Searches extended config space for "QMSI" magic signature
+ * to locate host-cached MSI values. This avoids offset mismatch when QEMU
+ * filters certain capabilities.
+ *
+ * Returns: Offset of MSI data (after magic), or 0 if not found
+ */
+static inline int qcom_vfio_find_msi_cache(struct pci_dev *pdev)
+{
+	u32 magic;
+	int offset;
+
+	for (offset = 0x100; offset <= 0xf00; offset += 4) {
+		if (pci_read_config_dword(pdev, offset, &magic))
+			continue;
+		if (magic == QCOM_VFIO_MSI_MAGIC)
+			return offset;
+	}
+
+	return 0;
+}
+
+#endif /* _QCOM_VFIO_H_ */
-- 
2.53.0


