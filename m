Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19356CA9EC9
	for <ath12k@archiver.kernel.org>; Sun, 11 Oct 2026 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh45bfH6uhfT3Ksu8Vh+24tRbIBlwKOVnSGn6jCmHg4=; b=yeFV5/SRQbc1OO9ZLAqgLR+PYI
	kEUY+nbwU6OeaqKAJvP65qFgQtppjuFxJfEY6lpo5nQ3xD12pv32Oz0mrwb34lcOt2NbmyN53JX8p
	fYcaFSJzalGXqYNXc8+O+WHlZEuyiJ2UOXo0Dvu68oz4Np8z9ezDZ59eIOzQl08tlwPASQM+L9IGb
	petQ+6Lvd4guw4I47RQ/IQAwGc891N6pdD7PsKLBW9Fq8q9yMyQscgDlCvkv8wNuGmVuMU0WkUVRy
	72Cb+Nje3ygjTxo7l/RhiQtrdBLaNihaVRAhfUZolMRWHXd40Low/5FPtfJvcf/qTk8GQeovpp06C
	mR5UG1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoFk-00000008oWi-17V5;
	Sun, 11 Oct 2026 07:45:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoFa-00000008oUO-153v
	for ath12k@lists.infradead.org;
	Sun, 11 Oct 2026 07:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791704741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sh45bfH6uhfT3Ksu8Vh+24tRbIBlwKOVnSGn6jCmHg4=;
	b=Un/JRxLr6lu2VALXdC/Fr4e9gaWCuN4BuNQ0rfggugm5lo2ONBM5gSQf3cYmfQbjCKXyNi
	NVxdqnuveKex877d7b8TcQO81G/7ZUzuEZwVTUBqA2aol9CN1nPU9GOy6D8lpT/cEq+CZB
	dZEq8nQCWzJp5ScNaMa4URq2a+T0atU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-zjclJS8vPteu2r2wac3_Jg-1; Sun,
 11 Oct 2026 07:45:37 +0000
X-MC-Unique: zjclJS8vPteu2r2wac3_Jg-1
X-Mimecast-MFC-AGG-ID: zjclJS8vPteu2r2wac3_Jg_1791704735
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50ADD1954ACF;
	Sun, 11 Oct 2026 07:45:34 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9DB8E1956041;
	Sun, 11 Oct 2026 07:45:29 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca,
	alex@shazbot.org,
	bhelgaas@google.com,
	jjohnson@kernel.org
Cc: johannes@sipsolutions.net,
	mani@kernel.org,
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
Subject: [PATCH v2 1/7] PCI: Add pci_find_free_ext_cap_offset() helper
Date: Sun, 11 Oct 2026 09:45:08 +0200
Message-ID: <20261011074514.515894-2-jtornosm@redhat.com>
In-Reply-To: <20261011074514.515894-1-jtornosm@redhat.com>
References: <20261011074514.515894-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: dj9A79kS2cXQqp378PV2_6jTQNQcwqEvCukVwZwPb18_1791704735
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_004543_454158_0E8A9021 
X-CRM114-Status: GOOD (  18.07  )
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

Add helper function to find free space in PCI extended configuration
space. This is needed by VFIO variant drivers that need to use unused
extended config space for device-specific purposes, such as passing
metadata to VMs.

The function walks the extended capability chain (with TTL to prevent
infinite loops on malformed chains), then scans for a contiguous region
of zeroed space of at least the requested size. This avoids hardcoding
capability sizes and correctly handles capabilities of any length.

Use case: The qcom-vfio-pci variant driver uses this to find space for
caching host MSI addresses that need to be passed to Qualcomm device
firmware in VMs.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v2: Address Sashiko comments:
    - Add TTL to capability chain walk to prevent infinite loops on
      malformed capability chains (matching pci_find_next_ext_capability)
    - Replace hardcoded 64-byte offset with zero-scan approach to
      correctly handle capabilities of any size
    - Fix potential integer underflow in size comparison
    - Add cfg_size and size parameter validation
v1: https://lore.kernel.org/all/20260930140833.576941-2-jtornosm@redhat.com/

 drivers/pci/pci.c   | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  3 +++
 2 files changed, 75 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8f7cfcc00090..7fa261140457 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -552,6 +552,78 @@ u16 pci_find_ext_capability(struct pci_dev *dev, int cap)
 }
 EXPORT_SYMBOL_GPL(pci_find_ext_capability);
 
+/**
+ * pci_find_free_ext_cap_offset - Find free space in extended config
+ * @dev: PCI device to query
+ * @size: Minimum size needed (in bytes)
+ *
+ * Scans the extended capability chain and then searches for a contiguous
+ * region of zeroed space of at least @size bytes in the extended
+ * configuration space (0x100-0xFFF). This can be used by drivers that
+ * need to use unused extended config space for device-specific purposes
+ * (e.g., VFIO quirks for VM passthrough).
+ *
+ * Returns the offset to free space, or 0 if no suitable gap found.
+ */
+int pci_find_free_ext_cap_offset(struct pci_dev *dev, size_t size)
+{
+	int ttl = (PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) / 8;
+	int pos = PCI_CFG_SPACE_SIZE;
+	int start = 0, run = 0;
+	int highest_pos = 0;
+	u32 header;
+	int offset;
+
+	if (!pci_is_pcie(dev) || dev->cfg_size <= PCI_CFG_SPACE_SIZE)
+		return 0;
+
+	if (size == 0 || size > PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE)
+		return 0;
+
+	if (pci_read_config_dword(dev, pos, &header))
+		return 0;
+	if (header == 0 || header == 0xffffffff)
+		return 0;
+
+	while (ttl-- > 0) {
+		if (pos > highest_pos)
+			highest_pos = pos;
+
+		pos = PCI_EXT_CAP_NEXT(header);
+		if (!pos || pos < PCI_CFG_SPACE_SIZE)
+			break;
+
+		if (pci_read_config_dword(dev, pos, &header))
+			break;
+		if (header == 0 || header == 0xffffffff)
+			break;
+	}
+
+	if (!highest_pos)
+		return 0;
+
+	for (offset = highest_pos; offset <= (int)PCI_CFG_SPACE_EXP_SIZE - 4;
+	     offset += 4) {
+		u32 val;
+
+		if (pci_read_config_dword(dev, offset, &val))
+			break;
+
+		if (val == 0) {
+			if (run == 0)
+				start = offset;
+			run += 4;
+			if (run >= (int)size)
+				return start;
+		} else {
+			run = 0;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_find_free_ext_cap_offset);
+
 /**
  * pci_get_dsn - Read and return the 8-byte Device Serial Number
  * @dev: PCI device to query
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..5d1ccbb2ed29 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1287,6 +1287,7 @@ u8 pci_find_ht_capability(struct pci_dev *dev, int ht_cap);
 u8 pci_find_next_ht_capability(struct pci_dev *dev, u8 pos, int ht_cap);
 u16 pci_find_ext_capability(struct pci_dev *dev, int cap);
 u16 pci_find_next_ext_capability(struct pci_dev *dev, u16 pos, int cap);
+int pci_find_free_ext_cap_offset(struct pci_dev *dev, size_t size);
 struct pci_bus *pci_find_next_bus(const struct pci_bus *from);
 u16 pci_find_vsec_capability(struct pci_dev *dev, u16 vendor, int cap);
 u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec);
@@ -2160,6 +2161,8 @@ static inline u8 pci_find_next_capability(struct pci_dev *dev, u8 post, int cap)
 { return 0; }
 static inline u16 pci_find_ext_capability(struct pci_dev *dev, int cap)
 { return 0; }
+static inline int pci_find_free_ext_cap_offset(struct pci_dev *dev, size_t size)
+{ return 0; }
 
 static inline u64 pci_get_dsn(struct pci_dev *dev)
 { return 0; }
--
2.53.0


