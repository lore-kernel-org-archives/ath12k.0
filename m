Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45056606A329
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jogKQcA1;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bxKp1chy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=60oBdK7pSBMfkj8btrUeLXs/eWEM8pNj/zNxGpSWBnU=; b=jogKQcA1Mn1Xfejofj880Af2MZ
	cqreI7UXgJBW6W1BdbdofHKjvN3sGMkjVXl0V0dpl5uLezAJRDlhHhxCffTO/IWe4ybpYs2Jm/gOq
	OnDCrNHLkJhxrtjm380VPXeuYfaOgwhums0NL4LD9EDGBjq9wXL9ItTBxiLR75G13bFARlxC7KFVv
	ih70c2vLioe76BicAYpjcAb9U4bN3AHRDtLX4+lR/R5MBq9Gn+8tg5eYt6rAiwz6WpGk4SgToThXW
	z4O7ErvlVzicv+ArKocrw3vISETvRRLO+dU4T2aXklmxcxDxhD3325SHZMEJa2umE4+fSRDzzKDxP
	a/fYbQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT8C-00000009p2y-2ZY5;
	Thu, 29 Oct 2026 16:37:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT89-00000009p1y-1RmS
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=60oBdK7pSBMfkj8btrUeLXs/eWEM8pNj/zNxGpSWBnU=;
	b=bxKp1chy1rmIGpEU3WZMueFB4zG2bl1m0IvwWTTo7wXMQkmIHYE4jyfT4fQvoQT4gMzA+m
	EVnMoxdl9ITvCYv0pwJB8hS3/aJpQGdRLRHylu+zZ718D596P4xHEKQD3jTbsFbj6N3vMG
	U936Hd17hlaz1ECeJvi96nRFmA8keFE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-93ymQZXkP_6lq8rkYhGv0A-1; Thu,
 29 Oct 2026 12:37:26 -0400
X-MC-Unique: 93ymQZXkP_6lq8rkYhGv0A-1
X-Mimecast-MFC-AGG-ID: 93ymQZXkP_6lq8rkYhGv0A_1793291844
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B424180AEBD;
	Thu, 29 Oct 2026 16:37:24 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0BAD91956088;
	Thu, 29 Oct 2026 16:37:17 +0000 (UTC)
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
Subject: [PATCH v3 0/8] PCI/KVM/VFIO: MSI address passthrough for Qualcomm WiFi devices
Date: Thu, 29 Oct 2026 17:37:05 +0100
Message-ID: <20261029163713.1366077-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 7tWhQNLOWF8--O4ot_oOqhr6Abchpl-Xt6xXJfJrbI8_1793291844
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_093733_461015_C97184A8 
X-CRM114-Status: GOOD (  11.54  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series enables Qualcomm ath11k/ath12k WiFi devices to work in VM
passthrough scenarios, addressing a long-standing issue where these
devices fail to initialize when passed through to VMs via VFIO.

Qualcomm ath11k/ath12k WiFi devices have been broken in VM passthrough
since they were introduced. These devices have embedded firmware that
programs MSI target addresses directly into device BAR registers,
bypassing the standard PCI config MSI path. The driver extracts the
addr/data from the MSI descriptor and programs the firmware's private
registers. In a VM, the driver only sees the guest's virtual APIC
address instead of the host's physical IRTE address. The firmware
programs the guest address into the BAR registers, and the resulting
MSI writes hit a stale or invalid IRTE in the host's interrupt
remapping table, causing DMAR faults:

  DMAR: DRHD: ... INTR-REMAP
  DMAR: [INTR-REMAP] ... Present field in the IRTE entry is clear

Standard VFIO MSI virtualization handles PCI config space MSI
correctly (MHI interrupts work fine), but has no visibility into
firmware-managed BAR-level MSI programming.

Multiple attempts have been made to solve this over the past 2 years:

March 2024: Workaround using module parameters [1]
  - Required manually copying MSI values from host to VM
  - Rejected by Johannes Berg as too manual, suggested VMM solution

August 2024: QEMU + kernel solution by Alex Williamson [2]
  - Kernel disables MSI virtualization, QEMU intercepts config writes
  - Uses brute force pattern matching to infer MSI data writes
  - Stuck as RFC - no progress in 14+ months

No action from Qualcomm: Despite multiple reports [4], no vendor
solution.

The PCI reset support for these devices has already landed in mainline
(commit f8522a518e59 "PCI: Add device-specific reset for Qualcomm
WCN6855/WCN7850 WLAN") [3], solving the device reset path for VFIO
passthrough. This MSI series is the remaining piece, with both in
place, these Qualcomm WiFi devices would be fully operational in VMs
for the first time.

v1/v2 explored passing the host MSI address through VFIO extended
config space. Jason Gunthorpe pointed out [5] that a guest-initiated
approach via KVM paravirtualization would be cleaner, avoid VFIO
internal coupling, and generalize better to other devices with
similar firmware behavior. The proposal here is a new guest module
that tries to address this by creating a custom MSI domain that
provides the physical host values instead.

v3 implements this as a 3-piece kernel-only solution:

  1. Host side (KVM + VFIO): A new KVM hypercall
     (KVM_HC_PCI_MSI_ALLOC) dispatches to a VFIO handler that reads
     the host's physical MSI address/data for the passthrough device.
     Connected via function pointer in struct kvm to avoid hard
     subsystem dependencies.

  2. Guest side (PCI controller): A new MSI IRQ domain module
     (pci-kvm-msi, taking pci-hyperv.c as a reference as Jason
     suggested) that intercepts MSI composition for matched devices.
     In order to sync host initialization with the guest driver, it
     provides kvm_pci_msi_wait_ready() to poll the hypercall until the
     host MSI is configured, and kvm_pci_msi_get_address() to read
     cached values.

  3. Driver changes (ath11k, ath12k): Guarded with
     IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN). Call wait_ready after
     msi_enable in power_up, then use get_address where needed.
     Zero overhead on baremetal (kvm_para_available() returns false).

The solution requires no QEMU changes. Tested with WCN6855 (ath11k),
WCN7850 (ath12k), and QCN9274 (ath12k) on host with KVM/VFIO
passthrough, all three create fully working WiFi interfaces in
the guest VM.

Patches:
  1-3: Core infrastructure (VFIO helpers, KVM handler, guest module)
  4-5: ath11k support (link retry + KVM MSI integration)
  6-7: ath12k support (link retry + KVM MSI integration)
    8: QCN9274 device support (reset quirks + KVM MSI ID)

[1] https://lore.kernel.org/all/20240322104912.94811-1-jtornosm@redhat.com/
[2] https://lore.kernel.org/kvm/20240812170014.1583783-1-alex.williamson@redhat.com/
[3] https://lore.kernel.org/all/20261005105436.83962-1-jtornosm@redhat.com/
[4] https://lore.kernel.org/all/fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com/
[5] https://lore.kernel.org/all/20261014150047.GO14213@ziepe.ca/

---
v3: KVM paravirtualization approach based on Jason Gunthorpe feedback.
    New hypercall + guest MSI domain module replaces VFIO variant
    driver.
    Added QCN9274 support.
v2: https://lore.kernel.org/all/20261014142606.418972-1-jtornosm@redhat.com/
v1: https://lore.kernel.org/all/20260930140833.576941-1-jtornosm@redhat.com/

Jose Ignacio Tornos Martinez (8):
  vfio: add helper to find PCI device by vendor/device ID
  KVM: add PCI MSI hypercall for VFIO passthrough
  PCI: add KVM MSI domain guest module
  ath11k: add PCIe link recovery retry
  ath11k: use KVM MSI domain for VM passthrough
  ath12k: add PCIe link recovery retry
  ath12k: use KVM MSI domain for VM passthrough
  PCI: add QCN9274 to reset quirks and KVM MSI domain


