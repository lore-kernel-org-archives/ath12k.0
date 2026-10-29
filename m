Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AE60A2612
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FUS9HKG0;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NOv/zIGw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UPYTek6wuZR3RFTVbmpzV/dpdd/bHHoy5BiG4jXXPbk=; b=FUS9HKG0UKPXByCWaOE74j+L2P
	DzCY+xvQUGZjdmfUV/b8tvtIkzD1cmaROEs9zus5NdSThu0ACnYRv4OYKkpbV7butog+1C2spO2Rs
	ya84eboZldGT8gFME/86QPOe19ERimN+fkZKIQApieVWUS9+J55CHKPLZOFwxZRl5bIf7AQeA+ON9
	b8Z0q1VpkDJVCAoW/bYCbveTlEecJAOi3bORQ5a8TsyvHj1/wn/ccfFAowtKmEwJXh402kFs+ED2g
	ogtuWxAquFssLGEPjIE6eyL4CO2L0OsBsx8R8xI5LmNdSvbnhbAM0GG7KAXaQ3nrKzWRlpPhG0B37
	DJ5BMEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT8Q-00000009pCV-0qJS;
	Thu, 29 Oct 2026 16:37:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT8N-00000009pA9-3kxu
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPYTek6wuZR3RFTVbmpzV/dpdd/bHHoy5BiG4jXXPbk=;
	b=NOv/zIGwldGn2fRCuWIo32OuguJaeKus+shwd1zRAJ/u1cB+MNXl7RCiVCbDQugPc2VDu7
	+iWzdlvrf7z3koHxgCEyNg8GLCk6CIiWwMKxpzTWp7ESgIZwmd8dY7aMnKdY3akfbYmJTe
	VMPwlbruFwd7WDophl4Mq2kdl2l5zqM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-Pg7fpbxHOSyRPKo45j9n-w-1; Thu,
 29 Oct 2026 12:37:43 -0400
X-MC-Unique: Pg7fpbxHOSyRPKo45j9n-w-1
X-Mimecast-MFC-AGG-ID: Pg7fpbxHOSyRPKo45j9n-w_1793291861
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0EA21944F00;
	Thu, 29 Oct 2026 16:37:40 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 70AA81955F01;
	Thu, 29 Oct 2026 16:37:36 +0000 (UTC)
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
Subject: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Date: Thu, 29 Oct 2026 17:37:07 +0100
Message-ID: <20261029163713.1366077-3-jtornosm@redhat.com>
In-Reply-To: <20261029163713.1366077-1-jtornosm@redhat.com>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: EjQcxTGS7utefh0Dl8bPHDV35yOP1MNgZ9YbVvDoEDg_1793291861
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_093748_027575_66F9AB5B 
X-CRM114-Status: GOOD (  24.09  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some PCI devices (e.g. Qualcomm WiFi adapters) have firmware that
programs MSI addresses directly into device BAR registers, bypassing
the standard PCI config MSI path. When these devices are passed
through to VMs via VFIO, the firmware programs the guest virtual MSI
address instead of the host physical IRTE address, causing DMAR faults
and non-functional interrupts.

Add a KVM hypercall (KVM_HC_PCI_MSI_ALLOC) that allows a guest to
request the host's physical MSI address/data for a VFIO-assigned PCI
device. The hypercall is dispatched from the x86 hypercall handler to
a VFIO backend that:

1. Finds the host PCI device matching the guest's vendor:device ID
   using vfio_file_find_pci_device() (introduced in a previous patch)
2. Reads the host MSI address/data from the device's msi_desc or
   by walking the IRQ domain compose chain
3. Returns the result to the guest via a GPA response buffer

The VFIO handler is connected to the KVM instance via a function
pointer (pci_msi_alloc) in struct kvm, set when the VFIO device is
created and cleared on release. This avoids a hard dependency between
KVM and VFIO subsystems.

When MSI is not yet enabled by QEMU, or the IRQ vector is not
configured, the handler returns success with a zeroed response,
allowing the guest to poll until the host MSI is ready.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v3: new
v2: https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/

 arch/x86/kvm/x86.c            | 39 ++++++++++++++
 include/linux/kvm_host.h      |  3 ++
 include/uapi/linux/kvm_para.h |  1 +
 virt/kvm/vfio.c               | 97 +++++++++++++++++++++++++++++++++++
 virt/kvm/vfio.h               |  8 +++
 5 files changed, 148 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32563a91fba9..2f0cae07f978 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -86,6 +86,7 @@
 #include <asm/sgx.h>
 #include <asm/virt.h>
 
+#include <linux/msi.h>
 #include <clocksource/hyperv_timer.h>
 
 #define CREATE_TRACE_POINTS
@@ -7490,6 +7491,44 @@ int ____kvm_emulate_hypercall(struct kvm_vcpu *vcpu, int cpl,
 		vcpu->arch.complete_userspace_io = complete_hypercall;
 		return 0;
 	}
+	case KVM_HC_PCI_MSI_ALLOC: {
+		struct msi_msg msg = {};
+		struct {
+			u32 address_lo;
+			u32 address_hi;
+			u32 data;
+			u32 reserved;
+		} resp;
+
+		if (vcpu->kvm->pci_msi_alloc == NULL) {
+			ret = -KVM_ENOSYS;
+			break;
+		}
+
+		/*
+		 * a0 = PCI vendor:device (vendor << 16 | device)
+		 * a1 = MSI vector index
+		 * a2 = GPA of response buffer
+		 */
+		ret = vcpu->kvm->pci_msi_alloc(vcpu->kvm, a0, a1, &msg);
+		if (ret) {
+			ret = -KVM_EINVAL;
+			break;
+		}
+
+		resp.address_lo = msg.address_lo;
+		resp.address_hi = msg.address_hi;
+		resp.data = msg.data;
+		resp.reserved = 0;
+
+		if (kvm_write_guest(vcpu->kvm, a2, &resp, sizeof(resp))) {
+			ret = -KVM_EFAULT;
+			break;
+		}
+
+		ret = 0;
+		break;
+	}
 	default:
 		ret = -KVM_ENOSYS;
 		break;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a..4921810e9f3f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -871,6 +871,9 @@ struct kvm {
 	struct xarray mem_attr_array;
 #endif
 	char stats_id[KVM_STATS_NAME_SIZE];
+
+	int (*pci_msi_alloc)(struct kvm *kvm, u32 devid,
+			     unsigned int vector, struct msi_msg *msg);
 };
 
 #define kvm_err(fmt, ...) \
diff --git a/include/uapi/linux/kvm_para.h b/include/uapi/linux/kvm_para.h
index 960c7e93d1a9..3c7ca359faa6 100644
--- a/include/uapi/linux/kvm_para.h
+++ b/include/uapi/linux/kvm_para.h
@@ -30,6 +30,7 @@
 #define KVM_HC_SEND_IPI		10
 #define KVM_HC_SCHED_YIELD		11
 #define KVM_HC_MAP_GPA_RANGE		12
+#define KVM_HC_PCI_MSI_ALLOC		13
 
 /*
  * hypercalls use architecture specific
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index 19548a430942..60356173e69f 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -11,7 +11,10 @@
 #include <linux/kvm_host.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/irq.h>
+#include <linux/msi.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/vfio.h>
@@ -315,6 +318,8 @@ static void kvm_vfio_release(struct kvm_device *dev)
 
 	kvm_vfio_update_coherency(dev);
 
+	dev->kvm->pci_msi_alloc = NULL;
+
 	kfree(kv);
 	kfree(dev); /* alloc by kvm_ioctl_create_device, free by .release */
 }
@@ -349,6 +354,98 @@ static int kvm_vfio_create(struct kvm_device *dev, u32 type)
 	mutex_init(&kv->lock);
 
 	dev->private = kv;
+	dev->kvm->pci_msi_alloc = kvm_vfio_pci_msi_alloc;
+
+	return 0;
+}
+
+/**
+ * kvm_vfio_pci_msi_alloc - Get physical MSI address/data for a VFIO device
+ * @kvm: the VM instance
+ * @devid: PCI vendor:device packed as (vendor << 16 | device)
+ * @vector: MSI vector index
+ * @msg: output MSI message (address + data)
+ *
+ * Walks VFIO files attached to this VM, uses vfio_file_find_pci_device()
+ * to find the PCI device matching the given vendor:device ID, and returns
+ * the host's physical MSI address/data for the requested vector.
+ *
+ * Returns 0 on success, negative errno on failure.
+ */
+int kvm_vfio_pci_msi_alloc(struct kvm *kvm, u32 devid,
+			     unsigned int vector, struct msi_msg *msg)
+{
+	struct kvm_vfio_file *kvf;
+	struct kvm_vfio *kv = NULL;
+	struct vfio_device *vdev;
+	struct kvm_device *dev;
+	struct msi_desc *desc;
+	struct irq_data *irqd;
+	struct pci_dev *pdev;
+	u16 vendor = devid >> 16;
+	u16 device = devid & 0xffff;
+	int irq;
+
+	scoped_guard(mutex, &kvm->lock) {
+		list_for_each_entry(dev, &kvm->devices, vm_node) {
+			if (dev->ops == &kvm_vfio_ops) {
+				kv = dev->private;
+				break;
+			}
+		}
+	}
+
+	if (!kv)
+		return -ENODEV;
+
+	guard(mutex)(&kv->lock);
+
+	vdev = NULL;
+	list_for_each_entry(kvf, &kv->file_list, node) {
+		vdev = vfio_file_find_pci_device(kvf->file, vendor, device);
+		if (vdev)
+			break;
+	}
+
+	if (!vdev)
+		return -ENODEV;
+
+	pdev = to_pci_dev(vdev->dev);
+
+	if (!pdev->msi_enabled && !pdev->msix_enabled) {
+		memset(msg, 0, sizeof(*msg));
+		return 0;
+	}
+
+	irq = pci_irq_vector(pdev, vector);
+	if (irq <= 0) {
+		memset(msg, 0, sizeof(*msg));
+		return 0;
+	}
+
+	irqd = irq_get_irq_data(irq);
+	if (!irqd) {
+		memset(msg, 0, sizeof(*msg));
+		return 0;
+	}
+
+	desc = irq_get_msi_desc(irq);
+	if (desc) {
+		*msg = desc->msg;
+	} else {
+		struct irq_data *pos;
+
+		for (pos = irqd; pos; pos = pos->parent_data) {
+			if (pos->chip && pos->chip->irq_compose_msi_msg) {
+				pos->chip->irq_compose_msi_msg(pos, msg);
+				break;
+			}
+		}
+		if (!pos) {
+			memset(msg, 0, sizeof(*msg));
+			return 0;
+		}
+	}
 
 	return 0;
 }
diff --git a/virt/kvm/vfio.h b/virt/kvm/vfio.h
index e130a4a03530..c2237ca9ff38 100644
--- a/virt/kvm/vfio.h
+++ b/virt/kvm/vfio.h
@@ -5,6 +5,8 @@
 #ifdef CONFIG_KVM_VFIO
 int kvm_vfio_ops_init(void);
 void kvm_vfio_ops_exit(void);
+int kvm_vfio_pci_msi_alloc(struct kvm *kvm, u32 devid,
+			     unsigned int vector, struct msi_msg *msg);
 #else
 static inline int kvm_vfio_ops_init(void)
 {
@@ -13,6 +15,12 @@ static inline int kvm_vfio_ops_init(void)
 static inline void kvm_vfio_ops_exit(void)
 {
 }
+static inline int kvm_vfio_pci_msi_alloc(struct kvm *kvm, u32 devid,
+					   unsigned int vector,
+					   struct msi_msg *msg)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif
-- 
2.56.0


