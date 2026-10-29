Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3B606A31A
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ky3SWI2R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kCNdqA3m;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VLjBCXnt;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eKRjPkAT;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VLjBCXnt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4UgMdOKrtB64nXpcXBIKe/cthT0pJUT9b78xEaySiIs=; b=ky3SWI2RSJpERkw7RKNKgvD7/p
	EHniKpgpw+e+4Lim8X5wQle7JQfufLA7T+qfN0eenNgUOTEgazZi2jKf0hHeayyoJeexifMv6uiXC
	H++7FN5d1SuvefqosqcwD6N/5QxEMVTTiLChZXnc3+TlFilOxejwXQz6gOJ5tQCEq9nIaZgLIWh0i
	uoFA0rT3SCtdWBnZ9SGdeHBTsphBiz3WaAT/yuULdqqTADPEh2o2WJoldiRyfF5ZRQ9kOcR2xuQ8s
	exQwA58z6n1ePokIren7FhnS7InA+zupuE/wQted+5Yik4qdn8OkG1T1BEpdtuT6IOEeraYp2Sl8j
	hpgA4qxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT9S-00000009q2W-3t7T;
	Thu, 29 Oct 2026 16:38:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT9R-00000009q1P-2vy0
	for ath12k@bombadil.infradead.org;
	Thu, 29 Oct 2026 16:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4UgMdOKrtB64nXpcXBIKe/cthT0pJUT9b78xEaySiIs=; b=kCNdqA3mYIDhZvoe3CaCZIX5+2
	Z2HD2z3gb6srOKDr57CcUGAWJyNbz8CVn1pR+fRWjYL5YKAxT7EL6qjrVvwMKBeYGgmNpE14A/JGr
	nYtjfT7hpfqDhCnkICmW5daktHFsxDzheE+buMid1SrRyDdaBVJ38xmb1/qV5ssmFT8y9vF0B7Ljm
	70is7PAqsNHPNA+csLlX9AGzD5YqkB/T4M6qVC2T/ltJP3s9ZIV49ORVYMcmcpuMGE6stZENrcZvE
	TW+WVkqLyfkOqIUt5fWaYBvdDlx06LQYr4A7VlpK3Ku77isgwRwvRPWfLua2OyuLURyfJQI5+Nd0M
	k5yM3FNw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT9O-0000000HChX-2GHz
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4UgMdOKrtB64nXpcXBIKe/cthT0pJUT9b78xEaySiIs=;
	b=VLjBCXntv6LaWoJ4uKFfWREfOfqgYrVOF8EexioL9NW4w+APQNvZDkPFRt8N2mRsnZpAo+
	vifVL96zTf2WWnqlyM/KoEpACRlJTuLnzZ+iazqMXGJc2ZiWMMHHAcnsUMbadR7kOHkmwM
	kYs43bvKWD5XSOVAVDTtSfuNU+Nt/zo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4UgMdOKrtB64nXpcXBIKe/cthT0pJUT9b78xEaySiIs=;
	b=eKRjPkAT5m+b34PiIlnXEBjVyyBsLehtvfnGmebmHqFML8+XSI5Ot5SVb29VMJKTSbvv2Z
	ngw1+BRN6qldvFQbhzchuJyR+JoMtkwZkM5Gdsy5Zge0Tnd7ziYICwqZRb8g+hah3yFAf+
	1Xpowzj8ytVJGXtNQbDlje5KlVoyqfU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4UgMdOKrtB64nXpcXBIKe/cthT0pJUT9b78xEaySiIs=;
	b=VLjBCXntv6LaWoJ4uKFfWREfOfqgYrVOF8EexioL9NW4w+APQNvZDkPFRt8N2mRsnZpAo+
	vifVL96zTf2WWnqlyM/KoEpACRlJTuLnzZ+iazqMXGJc2ZiWMMHHAcnsUMbadR7kOHkmwM
	kYs43bvKWD5XSOVAVDTtSfuNU+Nt/zo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-573-3zgHXh3SP9WTJ94dViTHCQ-1; Thu,
 29 Oct 2026 12:38:43 -0400
X-MC-Unique: 3zgHXh3SP9WTJ94dViTHCQ-1
X-Mimecast-MFC-AGG-ID: 3zgHXh3SP9WTJ94dViTHCQ_1793291921
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 613891809C8F;
	Thu, 29 Oct 2026 16:38:41 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 30FD81955F0A;
	Thu, 29 Oct 2026 16:38:37 +0000 (UTC)
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
Subject: [PATCH v3 7/8] ath12k: use KVM MSI domain for VM passthrough
Date: Thu, 29 Oct 2026 17:37:12 +0100
Message-ID: <20261029163713.1366077-8-jtornosm@redhat.com>
In-Reply-To: <20261029163713.1366077-1-jtornosm@redhat.com>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: gZOpybCR-xOk8DSKSu1poWb_eZFzefmc8LIRE8XTPI0_1793291921
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_163850_838339_BFD5ACA8 
X-CRM114-Status: GOOD (  12.46  )
X-Spam-Score: -0.9 (/)
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

The Qualcomm ath12k firmware programs MSI addresses directly into
device BAR registers for CE/SRNG ring interrupt delivery, bypassing
the standard PCI config MSI path managed by QEMU/VFIO. In a VM, the
firmware receives the guest virtual APIC address instead of the host
IRTE address, causing DMAR faults and non-functional interrupts.

When CONFIG_PCI_KVM_MSI_DOMAIN is enabled, use the KVM PCI MSI domain
synchronization functions:

1. In power_up, after msi_enable, call kvm_pci_msi_wait_ready() to
   retrieve and cache the host physical MSI address via KVM hypercall.

2. In ath12k_pci_get_msi_address(), call kvm_pci_msi_get_address() to
   return the cached host MSI address instead of reading from PCI
   config (which contains the guest virtual address in a VM).

Unlike ath11k which caches MSI address once during power_up, ath12k
reads MSI address on-the-fly via get_msi_address() each time rings
are configured. The kvm_pci_msi_get_address() function provides the
cached host values from a previous successful wait_ready call.

On baremetal, if CONFIG_PCI_KVM_MSI_DOMAIN is not enabled the code is
compiled out and the behavior is identical to the original. If
CONFIG_PCI_KVM_MSI_DOMAIN is enabled (e.g. distribution kernels), the
KVM MSI functions detect baremetal at runtime and return immediately,
preserving the original behavior with no side effects.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v3: new
v2: https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath12k/pci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index f7879fb48d32..dbd960f88d38 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -8,6 +8,9 @@
 #include <linux/interrupt.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
+#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
+#include <linux/pci-kvm-msi.h>
+#endif
 #include <linux/time.h>
 #include <linux/vmalloc.h>
 
@@ -1082,6 +1085,11 @@ void ath12k_pci_get_msi_address(struct ath12k_base *ab, u32 *msi_addr_lo,
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
 
+#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
+	if (kvm_pci_msi_get_address(pci_dev, msi_addr_lo, msi_addr_hi, NULL))
+		return;
+#endif
+
 	pci_read_config_dword(pci_dev, pci_dev->msi_cap + PCI_MSI_ADDRESS_LO,
 			      msi_addr_lo);
 
@@ -1485,6 +1493,10 @@ int ath12k_pci_power_up(struct ath12k_base *ab)
 
 	ath12k_pci_msi_enable(ab_pci);
 
+#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
+	kvm_pci_msi_wait_ready(ab_pci->pdev, 500);
+#endif
+
 	if (ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MULTI_QRTR_ID))
 		ath12k_pci_update_qrtr_node_id(ab);
 
@@ -1886,3 +1898,6 @@ EXPORT_SYMBOL(ath12k_pci_unregister_driver);
 /* firmware files */
 MODULE_FIRMWARE(ATH12K_FW_DIR "/QCN9274/hw2.0/*");
 MODULE_FIRMWARE(ATH12K_FW_DIR "/WCN7850/hw2.0/*");
+#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
+MODULE_SOFTDEP("pre: pci-kvm-msi");
+#endif
-- 
2.56.0


