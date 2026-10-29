Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D169606A31F
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DhmdVe4x;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jNDRxj4p;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GZhvIL89;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GZhvIL89;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GZhvIL89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+Hcw6ChGcYDsBOLvV15AWtaOoAcXtAbBHg8paBG5N7A=; b=DhmdVe4xVJTJMBqpDvRT6zptac
	66QMalmq47rvg4iohI1vYAa/s18qqSiFAOnXaINlNzzQzgxkHWoKWpxA/RXhZ552/zzJTvwTTSyRO
	JRuOl9SO5T567ycohf+B1PZu+njalIUGSLqxgM4oCF8VNuxVf6q+xW8u93HYBOiXcZoVrwBsFC67D
	oo3r+0NziWIKVKuN4zSfBYGwh4sKaPEbcCJ+9jH0LLJ49vvLYudxL3u0IKPCTZM2HLiwvegNnYFSN
	XkeVs5fBPwDu9aQFEup/mT5GCdK0zM7VABDcKBtY1o9sUJovCcbtYn+NIgsFMiZrX8HG5s1wBkGVF
	Bxx2u0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT9A-00000009poX-0ybj;
	Thu, 29 Oct 2026 16:38:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT98-00000009pma-0Way
	for ath12k@bombadil.infradead.org;
	Thu, 29 Oct 2026 16:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+Hcw6ChGcYDsBOLvV15AWtaOoAcXtAbBHg8paBG5N7A=; b=jNDRxj4psefx8AYMphHBXvGWhW
	l1FuXfDgmtmeHUiyr62XbFv0FVDN9slguoG6mky7WjtR6rcHKSZYXbneEkQUze1x+Mv6s9l5RSluy
	uYwjI98U8HrV9PQNfGJSWkIz8GVE3ajAQqaFmSpz7kjR24nVNnllOTuOvB7LjLRzvrxOVxPeo7135
	Ay1OL8BpofgX3Tn0mdMyFf7VjQZ0NOi9WZpI7cHrp/sq0m70ERw+9IaYWcJP7cY6F0tyC0qw/4Rr1
	9VhBcma8dqhqqB44iMC7aGpsdkX8fd+dtU+nP0pIzAy37Du8YaIQo92OkWNxZxhj4qAqAXT0AzuSk
	cm0D5Kpw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT92-0000000HCf2-3E7o
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Hcw6ChGcYDsBOLvV15AWtaOoAcXtAbBHg8paBG5N7A=;
	b=GZhvIL89YpHTLh3Gbb88B3Ibx5Y1Z9rK+4xqTcVCfue1EFcMz5kqu1Y8vDrS+7whwrMAnE
	+BA8u/9WhgjHVfxE737lvfWKQXBGYklxfbTx7dq5GphodVabLSTM2jUB6w7736VttpXrDX
	a+On6qMSEtqPn1GZ3Kp3g0n0HUzqw7k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Hcw6ChGcYDsBOLvV15AWtaOoAcXtAbBHg8paBG5N7A=;
	b=GZhvIL89YpHTLh3Gbb88B3Ibx5Y1Z9rK+4xqTcVCfue1EFcMz5kqu1Y8vDrS+7whwrMAnE
	+BA8u/9WhgjHVfxE737lvfWKQXBGYklxfbTx7dq5GphodVabLSTM2jUB6w7736VttpXrDX
	a+On6qMSEtqPn1GZ3Kp3g0n0HUzqw7k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Hcw6ChGcYDsBOLvV15AWtaOoAcXtAbBHg8paBG5N7A=;
	b=GZhvIL89YpHTLh3Gbb88B3Ibx5Y1Z9rK+4xqTcVCfue1EFcMz5kqu1Y8vDrS+7whwrMAnE
	+BA8u/9WhgjHVfxE737lvfWKQXBGYklxfbTx7dq5GphodVabLSTM2jUB6w7736VttpXrDX
	a+On6qMSEtqPn1GZ3Kp3g0n0HUzqw7k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-IZUHoYpdON-BLUmfP8xBgg-1; Thu,
 29 Oct 2026 12:38:24 -0400
X-MC-Unique: IZUHoYpdON-BLUmfP8xBgg-1
X-Mimecast-MFC-AGG-ID: IZUHoYpdON-BLUmfP8xBgg_1793291901
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6867A1935311;
	Thu, 29 Oct 2026 16:38:21 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5426E1956088;
	Thu, 29 Oct 2026 16:38:16 +0000 (UTC)
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
Subject: [PATCH v3 5/8] ath11k: use KVM MSI domain for VM passthrough
Date: Thu, 29 Oct 2026 17:37:10 +0100
Message-ID: <20261029163713.1366077-6-jtornosm@redhat.com>
In-Reply-To: <20261029163713.1366077-1-jtornosm@redhat.com>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 2fw5ACv_ZoT3__CoEFENvhB2AqqfV5N7EVYJqHwBzds_1793291901
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_163829_049082_CDC044CF 
X-CRM114-Status: GOOD (  14.52  )
X-Spam-Score: 2.7 (++)
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

The Qualcomm ath11k firmware programs MSI addresses directly into
device BAR registers for CE/SRNG ring interrupt delivery, bypassing
the standard PCI config MSI path managed by QEMU/VFIO. In a VM, the
firmware receives the guest virtual APIC address instead of the host
IRTE address, causing DMAR faults and non-functional interrupts.

When CONFIG_PCI_KVM_MSI_DOMAIN is enabled, use the KVM PCI MSI domain
synchronization functions to obtain the correct host physical MSI
address after MSI is enabled in power_up. The kvm_pci_msi_wait_ready()
function performs a KVM hypercall to retrieve the host MSI address,
and kvm_pci_msi_get_address() reads the cached values to update the
driver's internal MSI address/data used for ring configuration.

This placement (after msi_enable in power_up) ensures:
- Host MSI is enabled and stable (QEMU has completed setup)
- No MSI state transitions are in progress
- CE/SRNG rings have not been programmed yet
- The function runs on every power_up, including recovery

On baremetal, if CONFIG_PCI_KVM_MSI_DOMAIN is not enabled the code is
compiled out and the behavior is identical to the original. If
CONFIG_PCI_KVM_MSI_DOMAIN is enabled (e.g. distribution kernels), the
KVM MSI functions detect baremetal at runtime and return immediately,
preserving the original behavior with no side effects.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v3: new
v2: https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath11k/pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 7e29ebaf9773..31889e5caa8d 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -7,6 +7,9 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
+#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
+#include <linux/pci-kvm-msi.h>
+#endif
 #include <linux/of.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
@@ -855,6 +858,13 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
 
 	ath11k_pci_msi_enable(ab_pci);
 
+#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
+	if (kvm_pci_msi_wait_ready(ab_pci->pdev, 500) > 0)
+		kvm_pci_msi_get_address(ab_pci->pdev, &ab->pci.msi.addr_lo,
+					&ab->pci.msi.addr_hi,
+					&ab->pci.msi.ep_base_data);
+#endif
+
 	ret = ath11k_mhi_start(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to start mhi: %d\n", ret);
@@ -1350,6 +1360,9 @@ module_exit(ath11k_pci_exit);
 
 MODULE_DESCRIPTION("Driver support for Qualcomm Technologies PCIe 802.11ax WLAN devices");
 MODULE_LICENSE("Dual BSD/GPL");
+#if IS_ENABLED(CONFIG_PCI_KVM_MSI_DOMAIN)
+MODULE_SOFTDEP("pre: pci-kvm-msi");
+#endif
 
 /* firmware files */
 MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/*");
-- 
2.56.0


