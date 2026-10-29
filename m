Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B35606A326
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhaD28wV;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+iG5sPd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EL2/HLZV7T4w8h6BrUAxNvEjpz/gOsDFSWb10I0z+sQ=; b=KhaD28wVidf8rIF9n/B4s9Zt1T
	pbyzE2KC7zQ1i+91qT6AWxkcxRMgvXNtsCMQK3235tBEY8dxqtk64DeWg8lATx/SZT4+O5DWUdsaD
	hHqXiWG4KiQFRI9u6sqVav9kuboPi+ZJcjiQWUx7OmZ+pTyK8b2GphQ0QrRlitZkeikz3AJTRLK/E
	cUON6w8KnJRYHb5mcjhd0yiS4YZ541VeWTUrD2kBIL/t9sXASVKCysYWwyFWICPgv+83PB3OPbvRC
	xYhxd/zRBKFbuEK4u2p9TwJJ5T+ON98/SB+FZZFia5f4buqoX+UXW5G9wfpmei1ZggLfX7GLyEnNi
	35dFp/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT8K-00000009p79-3WUH;
	Thu, 29 Oct 2026 16:37:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT8H-00000009p5f-3HLM
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EL2/HLZV7T4w8h6BrUAxNvEjpz/gOsDFSWb10I0z+sQ=;
	b=O+iG5sPdaqjZzgBreZEqxI3yGPCOSK1SJRUkszqAYq/OnTYpPE57raDbQG/0+2FVK8O44j
	41uDQV2HppgKNBqVIC3m9qAxgmSdXR1l9JN+w61O6/M2IqecUi8cjZVaE+UZkwiVwXV/aG
	j6uOYeE1CUlefcCR6JBpY/5EeJlVrQM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-U8TEP4GpNzm9BiNBv0dUfQ-1; Thu,
 29 Oct 2026 12:37:37 -0400
X-MC-Unique: U8TEP4GpNzm9BiNBv0dUfQ-1
X-Mimecast-MFC-AGG-ID: U8TEP4GpNzm9BiNBv0dUfQ_1793291854
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 12ADE195FDF4;
	Thu, 29 Oct 2026 16:37:34 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2A4BC1956088;
	Thu, 29 Oct 2026 16:37:28 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca,
	alex@shazbot.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	bhelgaas@google.com,
	jjohnson@kernel.org
Cc: johannes@sipsolutions.net,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	vkuznets@redhat.com,
	kevin.tian@intel.com,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v3 1/8] vfio: add helper to find PCI device by vendor/device ID
Date: Thu, 29 Oct 2026 17:37:06 +0100
Message-ID: <20261029163713.1366077-2-jtornosm@redhat.com>
In-Reply-To: <20261029163713.1366077-1-jtornosm@redhat.com>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: L7kha2gyp0HRAoUeh8ukNtApjEuwEi3arbDlTaibXYM_1793291854
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_093741_896688_E3845185 
X-CRM114-Status: GOOD (  14.35  )
X-Spam-Score: 0.5 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add vfio_file_find_pci_device() that searches for a PCI device with
the specified vendor/device ID within a VFIO group or device file. The
function walks the group device list to find a matching PCI device, or
checks the single device for a cdev-based file.

This helper enables other subsystems (e.g. KVM PCI MSI domain) to
locate VFIO-owned PCI devices by their IDs without depending on VFIO
internals. The companion vfio_file_device() provides access to the
underlying vfio_device from a device file descriptor.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v3: new
v2: https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/

 drivers/vfio/group.c     | 41 ++++++++++++++++++++++++++++++++++++++++
 drivers/vfio/vfio_main.c |  6 ++++++
 include/linux/vfio.h     | 10 ++++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 185f359f75d3..0b6cf90edda3 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -10,6 +10,7 @@
  * Author: Tom Lyon, pugs@cisco.com
  */
 
+#include <linux/pci.h>
 #include <linux/vfio.h>
 #include <linux/iommufd.h>
 #include <linux/anon_inodes.h>
@@ -894,6 +895,46 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
 }
 EXPORT_SYMBOL_GPL(vfio_file_has_dev);
 
+struct vfio_device *vfio_file_find_pci_device(struct file *file,
+					      u16 vendor, u16 device_id)
+{
+	struct vfio_group *group;
+	struct vfio_device *vdev;
+	struct vfio_device *ret = NULL;
+
+	group = vfio_group_from_file(file);
+	if (group) {
+		mutex_lock(&group->device_lock);
+		list_for_each_entry(vdev, &group->device_list, group_next) {
+			struct pci_dev *pdev;
+
+			if (!dev_is_pci(vdev->dev))
+				continue;
+
+			pdev = to_pci_dev(vdev->dev);
+			if (pdev->vendor == vendor &&
+			    pdev->device == device_id) {
+				ret = vdev;
+				break;
+			}
+		}
+		mutex_unlock(&group->device_lock);
+		return ret;
+	}
+
+	vdev = vfio_file_device(file);
+	if (vdev && dev_is_pci(vdev->dev)) {
+		struct pci_dev *pdev = to_pci_dev(vdev->dev);
+
+		if (pdev->vendor == vendor &&
+		    pdev->device == device_id)
+			return vdev;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(vfio_file_find_pci_device);
+
 static char *vfio_devnode(const struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "vfio/%s", dev_name(dev));
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 4e5d738ccf4b..a83e5d805eac 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1551,6 +1551,12 @@ void vfio_file_set_kvm(struct file *vfio_file, struct file *kvm)
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 
+struct vfio_device *vfio_file_device(struct file *file)
+{
+	return vfio_device_from_file(file);
+}
+EXPORT_SYMBOL_GPL(vfio_file_device);
+
 /*
  * Sub-module support
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 0cc91c6f96d2..a62fbf42458a 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -364,6 +364,8 @@ struct iommu_group *vfio_file_iommu_group(struct file *file);
 #if IS_ENABLED(CONFIG_VFIO_GROUP)
 bool vfio_file_is_group(struct file *file);
 bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
+struct vfio_device *vfio_file_find_pci_device(struct file *file,
+					      u16 vendor, u16 device_id);
 #else
 static inline bool vfio_file_is_group(struct file *file)
 {
@@ -374,10 +376,18 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
 {
 	return false;
 }
+
+static inline struct vfio_device *vfio_file_find_pci_device(struct file *file,
+							    u16 vendor,
+							    u16 device_id)
+{
+	return NULL;
+}
 #endif
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 void vfio_file_set_kvm(struct file *vfio_file, struct file *kvm);
+struct vfio_device *vfio_file_device(struct file *file);
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-- 
2.56.0


