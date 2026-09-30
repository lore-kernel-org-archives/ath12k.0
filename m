Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E83CA5FC7
	for <ath12k@archiver.kernel.org>; Wed, 30 Sep 2026 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lKY5zSooUG9J2WAMt80T6mv1JymFjL65pHqXNpRbZ0=; b=0goe85f4rSopeiBuPxhi1mr7s/
	KUGYC/7/GESX6GmqYJIoYvEb8hUIiN+3b7bGXJPyzLozLBc07ofRRZRkh6tyq1DeUuWq5Pi3joIWL
	iYXcjqt/evCUUDQvZg5WMEIY+zAGc+xdjfMSI6E/zsSypptyXcUjFmSgYSPyTxInhTDMGi38VAoBf
	oCRnBxRhsmRiYuh4EqEjzv0lVgIVjLfgUz5/NvvNrqb5L3t7fh1+jJcZImAMXsTQb5yLixI/+z5FN
	En+cUL+VZAzf50VDFewvX/E1tdBuOL6WOcKcmTR5vGFfTQ8MyC4GL9Ln8ZswmSFMGN9ByhK43xija
	M/UxBhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv22-00000006FTa-0bal;
	Wed, 30 Sep 2026 14:11:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1u-00000006FMW-0SSU
	for ath12k@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9lKY5zSooUG9J2WAMt80T6mv1JymFjL65pHqXNpRbZ0=; b=Z0bHUy6JgjcYMoI2HdKi50A0Ac
	1eSoRk33lyu064SKrapfnFYpiekmdUFaWo8z471zOM5f4HF8FZ5YUUzmjzPUXAJwtMB9e+9cuVNU7
	aQ6dTrD9IdPLpIYYxB1Ww6ieOk/3isY0Xo9zKwp7mC0saCkiE+L2oDJwgUKUgcZesESFpdiID5eAF
	gr0zTaORrOqXpvFG0v3RsdkhXW+uMLDhVaF9DFcHVhQP0MzchySmGndB6DDmYCiQ6g2t5WgNKNrEr
	+U2HGXcBVwicxr3oqsFcfha874nw2nqYVkFU+0vwYK7VXoV2lNQP+n144zJ6Gdw21leIrby4P4Zgt
	mT68iaYQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv1q-00000003thc-15y2
	for ath12k@lists.infradead.org;
	Wed, 30 Sep 2026 14:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lKY5zSooUG9J2WAMt80T6mv1JymFjL65pHqXNpRbZ0=;
	b=MaKcB/y3E1SRHpfeR80N5MDJPSotn2M7i2I5sNK5VhoSuuvZLopi74/gOuA0LP7ix412XA
	GmMUg87tRZ1WIqRds9xcz87/MXjQCdwswinc7IFlvZE2ES+fPv9I9avOjoaG3phtQFSQyD
	HV3dovjqJJ6Pb/H3CkMjCR+qw+c1ZME=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lKY5zSooUG9J2WAMt80T6mv1JymFjL65pHqXNpRbZ0=;
	b=MaKcB/y3E1SRHpfeR80N5MDJPSotn2M7i2I5sNK5VhoSuuvZLopi74/gOuA0LP7ix412XA
	GmMUg87tRZ1WIqRds9xcz87/MXjQCdwswinc7IFlvZE2ES+fPv9I9avOjoaG3phtQFSQyD
	HV3dovjqJJ6Pb/H3CkMjCR+qw+c1ZME=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lKY5zSooUG9J2WAMt80T6mv1JymFjL65pHqXNpRbZ0=;
	b=MaKcB/y3E1SRHpfeR80N5MDJPSotn2M7i2I5sNK5VhoSuuvZLopi74/gOuA0LP7ix412XA
	GmMUg87tRZ1WIqRds9xcz87/MXjQCdwswinc7IFlvZE2ES+fPv9I9avOjoaG3phtQFSQyD
	HV3dovjqJJ6Pb/H3CkMjCR+qw+c1ZME=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-1gEACnZ4PZGdvatH_SoJfQ-1; Wed,
 30 Sep 2026 10:10:01 -0400
X-MC-Unique: 1gEACnZ4PZGdvatH_SoJfQ-1
X-Mimecast-MFC-AGG-ID: 1gEACnZ4PZGdvatH_SoJfQ_1790777399
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B9DD18001F7;
	Wed, 30 Sep 2026 14:09:59 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10BCD1956044;
	Wed, 30 Sep 2026 14:09:54 +0000 (UTC)
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
Subject: [PATCH 7/7] ath12k: Use VFIO MSI cache when available
Date: Wed, 30 Sep 2026 16:08:33 +0200
Message-ID: <20260930140833.576941-8-jtornosm@redhat.com>
In-Reply-To: <20260930140833.576941-1-jtornosm@redhat.com>
References: <20260930140833.576941-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: CvDow6vLVk3MtGAGA3jNmZZ3BSMF-dMGz4dLyAvOcTk_1790777399
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151126_541075_97E3338D 
X-CRM114-Status: GOOD (  19.05  )
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

The Qualcomm ath12k firmware requires physical host MSI addresses for
interrupt configuration but cannot handle IOVA-based MSI addressing in
virtualized environments.

When the device is passed through to a VM via VFIO:
- The guest kernel allocates MSI vectors and sees IOVA addresses
- The ath12k firmware expects physical host MSI addresses
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
 drivers/net/wireless/ath/ath12k/pci.c | 43 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pci.h |  6 ++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 65712486d312..832d3cf652d9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
+#include <linux/qcom_vfio.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
 
@@ -783,8 +784,11 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 {
 	struct ath12k_base *ab = ab_pci->ab;
 	const struct ath12k_msi_config *msi_config = ab_pci->msi_config;
+	u32 msi_addr_lo = 0, msi_addr_hi = 0;
 	struct msi_desc *msi_desc;
+	u16 msi_data = 0;
 	int num_vectors;
+	int msi_offset;
 	int ret;
 
 	num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
@@ -812,6 +816,39 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 
 	ath12k_info(ab, "MSI vectors: %d\n", num_vectors);
 
+	/*
+	 * Try to get host MSI address from VFIO cache.
+	 * When running on a VM, the ath12k firmware requires physical host
+	 * MSI addresses and cannot handle guest IOVA addresses.
+	 * qcom-vfio-pci writes host MSI values to extended config space with
+	 * a magic signature "QMSI" for discovery. Search for it.
+	 */
+	msi_offset = qcom_vfio_find_msi_cache(ab_pci->pdev);
+	if (msi_offset) {
+		pci_read_config_dword(ab_pci->pdev,
+				      msi_offset + QCOM_VFIO_MSI_ADDR_LO_OFFSET,
+				      &msi_addr_lo);
+		pci_read_config_dword(ab_pci->pdev,
+				      msi_offset + QCOM_VFIO_MSI_ADDR_HI_OFFSET,
+				      &msi_addr_hi);
+		pci_read_config_word(ab_pci->pdev,
+				     msi_offset + QCOM_VFIO_MSI_DATA_OFFSET,
+				     &msi_data);
+
+		if (msi_addr_lo && msi_addr_lo != 0xFFFFFFFF) {
+			ab_pci->msi_addr_hi = msi_addr_hi;
+			ab_pci->msi_addr_lo = msi_addr_lo;
+			ab_pci->msi_ep_base_data = msi_data;
+			ab_pci->msi_addr_cached = true;
+
+			ath12k_info(ab,
+				    "using host MSI from VFIO at offset 0x%x: addr_lo=0x%x addr_hi=0x%x data=%d\n",
+				    msi_offset, msi_addr_lo, msi_addr_hi, msi_data);
+			return 0;
+		}
+	}
+	ab_pci->msi_addr_cached = false;
+
 	ath12k_pci_msi_disable(ab_pci);
 
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
@@ -1083,6 +1120,12 @@ void ath12k_pci_get_msi_address(struct ath12k_base *ab, u32 *msi_addr_lo,
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
 
+	if (ab_pci->msi_addr_cached) {
+		*msi_addr_hi = ab_pci->msi_addr_hi;
+		*msi_addr_lo = ab_pci->msi_addr_lo;
+		return;
+	}
+
 	pci_read_config_dword(pci_dev, pci_dev->msi_cap + PCI_MSI_ADDRESS_LO,
 			      msi_addr_lo);
 
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 0e0e2020c6ae..ee3696d40dfb 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -129,6 +129,12 @@ struct ath12k_pci {
 	/* enum ath12k_pci_flags */
 	unsigned long flags;
 	u16 link_ctl;
+
+	/* Cached host MSI address for firmware configuration in VMs */
+	u32 msi_addr_hi;
+	u32 msi_addr_lo;
+	bool msi_addr_cached;
+
 	unsigned long irq_flags;
 	const struct ath12k_pci_ops *pci_ops;
 	u32 qmi_instance;
-- 
2.55.0


