Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85B8CA9EC7
	for <ath12k@archiver.kernel.org>; Sun, 11 Oct 2026 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2rnnuYRwfl7EBDWudk8zYLjPm/rdAuXGql81lB9mOU=; b=XMImJOn+2fBjqhEdxoFuaoMAdg
	YpNGCEATI54D4RNyyGzBfuPfgLoCieAIMALKTlB7ECRsAvJ6BsJ6PENvSmCQKAuiUsDn4aRZSIk5Y
	6YhguIqariwjIVZkWjuOCGosVRzRHyET39qlNz4OxT0sx0Fq5dEo4ZEGYV3yS0arOQodv9nUPXWgA
	v/6J6grzPCIszdlq+VQKH019+FOVqDex7NsfTgSLLeUkm4fTfRNrA58vfsDSVEBkEKvD+GFT2lQGk
	ZTVYmijtrMpCgkbx42YH5SyRS9e+hIo982SLY0Adax8sWv1e6/5Dw6NyxLE4btVxIT9SuVYMwPXfW
	47k+B90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoGK-00000008ovK-1OIK;
	Sun, 11 Oct 2026 07:46:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoG3-00000008ol5-30L7
	for ath12k@lists.infradead.org;
	Sun, 11 Oct 2026 07:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791704770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2rnnuYRwfl7EBDWudk8zYLjPm/rdAuXGql81lB9mOU=;
	b=GUdCAtwFWwC0CdJrRel3q7u3GYAWBH4FaY4JVMrTqWBsqx3C2CpXs2aBUaz342KmMd2duB
	8QbvI7x4Jdkj5T6ZEWXI/dGYzQBekaz/QSC7p0ATi2mLNmCK1NcdE9+2hAVXAaV6d5onx7
	zzag1QIipuK3jwJ+EuUE1H+5eeEYiOE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-1b1fYC2TP6aUqISaHG1wJQ-1; Sun,
 11 Oct 2026 07:46:07 +0000
X-MC-Unique: 1b1fYC2TP6aUqISaHG1wJQ-1
X-Mimecast-MFC-AGG-ID: 1b1fYC2TP6aUqISaHG1wJQ_1791704765
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6480B1955F23;
	Sun, 11 Oct 2026 07:46:05 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 332671956042;
	Sun, 11 Oct 2026 07:46:00 +0000 (UTC)
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
Subject: [PATCH v2 5/7] ath11k: Use VFIO MSI cache when available
Date: Sun, 11 Oct 2026 09:45:12 +0200
Message-ID: <20261011074514.515894-6-jtornosm@redhat.com>
In-Reply-To: <20261011074514.515894-1-jtornosm@redhat.com>
References: <20261011074514.515894-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: we2ko0P6_NFvVnOl4GLtaIl9JbqxSiX4pmfMzGOM7Yg_1791704765
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_004611_834428_305CC402 
X-CRM114-Status: GOOD (  17.36  )
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

The Qualcomm ath11k firmware requires physical host MSI addresses for
interrupt configuration but cannot handle IOVA-based MSI addressing in
virtualized environments.

When the device is passed through to a VM via VFIO:
- The guest kernel allocates MSI vectors and sees IOVA addresses
- The ath11k firmware expects physical host MSI addresses
- Providing IOVA to the firmware causes interrupt delivery to fail
- Result: device is non-functional in VMs

The qcom-vfio-pci variant driver (introduced in earlier patches) solves
this by caching the physical host MSI values and exposing them through
PCI extended config space with a "QMSI" magic signature for discovery.

Search for the QMSI magic signature in extended config space. If found,
the device is running on a VM and we can read the cached host MSI values
from that location. If the VFIO cache is not present (i.e. on baremetal),
fall back to standard PCI MSI configuration.

This change is transparent, arch independent and requires no user
configuration when used with the qcom-vfio-pci driver.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v2: Address Sashiko comments:
  - Add vfio_msi_cached flag to ath11k_pci struct to track when VFIO
    cached values are in use
  - Guard config_msi_data() to skip overwrite when VFIO cached values
    are already set, preventing guest virtual MSI data from overwriting
    host physical values
v1: https://lore.kernel.org/all/20260930140833.576941-6-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath11k/pci.c | 37 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index c372676b097f..b5e4a3f21d89 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
+#include <linux/qcom_vfio.h>

 #include "pci.h"
 #include "core.h"
@@ -463,8 +464,11 @@ static int ath11k_pci_alloc_msi(struct ath11k_pci *ab_pci)
 	struct ath11k_base *ab = ab_pci->ab;
 	const struct ath11k_msi_config *msi_config = ab->pci.msi.config;
 	struct pci_dev *pci_dev = ab_pci->pdev;
+	u32 msi_addr_lo = 0, msi_addr_hi = 0;
 	struct msi_desc *msi_desc;
+	u16 msi_data = 0;
 	int num_vectors;
+	int msi_offset;
 	int ret;

 	num_vectors = pci_alloc_irq_vectors(pci_dev,
@@ -488,6 +492,36 @@ static int ath11k_pci_alloc_msi(struct ath11k_pci *ab_pci)
 	}
 	ath11k_info(ab, "MSI vectors: %d\n", num_vectors);

+	/*
+	 * Try to get host MSI address from VFIO cache.
+	 * When running on a VM, the ath11k firmware requires physical host
+	 * MSI addresses and cannot handle guest IOVA addresses.
+	 * qcom-vfio-pci writes host MSI values to extended config space with
+	 * a magic signature "QMSI" for discovery. Search for it.
+	 */
+	msi_offset = qcom_vfio_find_msi_cache(pci_dev);
+	if (msi_offset) {
+		pci_read_config_dword(pci_dev,
+				      msi_offset + QCOM_VFIO_MSI_ADDR_LO_OFFSET,
+				      &msi_addr_lo);
+		pci_read_config_dword(pci_dev,
+				      msi_offset + QCOM_VFIO_MSI_ADDR_HI_OFFSET,
+				      &msi_addr_hi);
+		pci_read_config_word(pci_dev,
+				     msi_offset + QCOM_VFIO_MSI_DATA_OFFSET,
+				     &msi_data);
+
+		if (msi_addr_lo && msi_addr_lo != 0xFFFFFFFF) {
+			ab->pci.msi.addr_lo = msi_addr_lo;
+			ab->pci.msi.addr_hi = msi_addr_hi;
+			ab->pci.msi.ep_base_data = msi_data;
+			ab_pci->vfio_msi_cached = true;
+			ath11k_info(ab, "VFIO MSI cache at offset 0x%x: addr_lo=0x%x addr_hi=0x%x data=%d\n",
+				    msi_offset, msi_addr_lo, msi_addr_hi, msi_data);
+			return 0;
+		}
+	}
+
 	ath11k_pci_msi_disable(ab_pci);

 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
@@ -527,7 +561,10 @@ static void ath11k_pci_free_msi(struct ath11k_pci *ab_pci)
 static int ath11k_pci_config_msi_data(struct ath11k_pci *ab_pci)
 {
 	struct msi_desc *msi_desc;

+	if (ab_pci->vfio_msi_cached)
+		return 0;
+
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
 	if (!msi_desc) {
 		ath11k_err(ab_pci->ab, "msi_desc is NULL!\n");
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 9a17fbc1e5d2..4c8b6d3f7a21 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -74,6 +74,8 @@ struct ath11k_pci {
 	unsigned long flags;
 	u16 link_ctl;
 	u64 dma_mask;
+
+	bool vfio_msi_cached;
 };

 static inline struct ath11k_pci *ath11k_pci_priv(struct ath11k_base *ab)
--
2.55.0


