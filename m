Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA41D606A325
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llXWBqp4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oloUDt64;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hLwF+uYk;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hLwF+uYk;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hLwF+uYk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bNMG+lIhxZcEUu3kzAXgyCfzh9SPkmetdc8XLLC9LrM=; b=llXWBqp4zghiyNPNqEEIoIhKp4
	5b9+lVXXNOXkeSyi6W+F7hi254oe6SyW3pdEIWpbdPRGtdQ9Gbh7ndUqDcfVB3vXzrp8IPe+JFUuR
	JrBBTrhyVa38x9DOQjItVxuC1lfFT6n29FsvgAbFlEG06RETcNO2SHZVxCDGSL2WIscJ8UwGn1aT8
	LFoK6Wdbsyp/3YkduvGbyO0IOezXgdMjbLEm8sxqHVQnp4BhftoEQKj9A2IKqPn366cX5K3YFz+GX
	mZmdpt3t/IZwgESIi5NCqRcdsp0nf5QFCXLJ8j6Lm1WzxhGyx9zdy0Pu05nEoimi3/CIFkh+AS59A
	RDQNOjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT9b-00000009q9u-2d3n;
	Thu, 29 Oct 2026 16:39:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT9a-00000009q7k-0rep
	for ath12k@bombadil.infradead.org;
	Thu, 29 Oct 2026 16:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bNMG+lIhxZcEUu3kzAXgyCfzh9SPkmetdc8XLLC9LrM=; b=oloUDt64PPirtpRbPYXPrXtWOJ
	BvnBOXxFVj3682G2VVskkTk+ByzQL9KS6GabHzBhqyOIaXLZ7LTriMjaP6lr8w+7Z5oHIpGjj+Jdc
	HdmNcbVOTR20bDY8l4iuGNVMRfFeKYjSVf19qUS8812ljjawh0zwKS2TO2DQ+8QwmDHRYjFkj9Mh+
	K56cXe6r+wnYfBXWbtRYg0KDuV3AcxB/HRUvhZ6x+GsUxvwW6g55qs3o1WwW0VhtsqNu37IqvttDJ
	E6f0bo+tnR20Wbif5OhaGSuWn39SpxokWTINtBDi3CsXgYqdmYcVIvq2z3D45AZj/RngHEdqVkTUF
	K9b1g1TA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT9V-0000000HCiv-2XJB
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNMG+lIhxZcEUu3kzAXgyCfzh9SPkmetdc8XLLC9LrM=;
	b=hLwF+uYkcqocREQd88lP3tfl4rvjIdTZj8Icd0fbl13c58LLDobsOCAuohshOo9XluvVk/
	qM9tE9D8dZZzbPJwLXIXe2GJBV253/9ExhYcFnOCEIIP76F5y2hMmLIUI6ZUgfMz0nMByz
	hIS1ZHmUZ10JuVckynoPhacRXIIfQZ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNMG+lIhxZcEUu3kzAXgyCfzh9SPkmetdc8XLLC9LrM=;
	b=hLwF+uYkcqocREQd88lP3tfl4rvjIdTZj8Icd0fbl13c58LLDobsOCAuohshOo9XluvVk/
	qM9tE9D8dZZzbPJwLXIXe2GJBV253/9ExhYcFnOCEIIP76F5y2hMmLIUI6ZUgfMz0nMByz
	hIS1ZHmUZ10JuVckynoPhacRXIIfQZ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNMG+lIhxZcEUu3kzAXgyCfzh9SPkmetdc8XLLC9LrM=;
	b=hLwF+uYkcqocREQd88lP3tfl4rvjIdTZj8Icd0fbl13c58LLDobsOCAuohshOo9XluvVk/
	qM9tE9D8dZZzbPJwLXIXe2GJBV253/9ExhYcFnOCEIIP76F5y2hMmLIUI6ZUgfMz0nMByz
	hIS1ZHmUZ10JuVckynoPhacRXIIfQZ4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-428-eg23MM3yOHGLfjy1yaOlzQ-1; Thu,
 29 Oct 2026 12:38:53 -0400
X-MC-Unique: eg23MM3yOHGLfjy1yaOlzQ-1
X-Mimecast-MFC-AGG-ID: eg23MM3yOHGLfjy1yaOlzQ_1793291930
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 999A9180B5F2;
	Thu, 29 Oct 2026 16:38:50 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 57B161955F0A;
	Thu, 29 Oct 2026 16:38:46 +0000 (UTC)
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
Subject: [PATCH v3 8/8] PCI: add QCN9274 to reset quirks and KVM MSI domain
Date: Thu, 29 Oct 2026 17:37:13 +0100
Message-ID: <20261029163713.1366077-9-jtornosm@redhat.com>
In-Reply-To: <20261029163713.1366077-1-jtornosm@redhat.com>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: R-XQzqka5zpbqVAB0Nrw8gYzuiAdODqcdSqz3KQO91c_1793291930
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_163858_195493_2A07B8BF 
X-CRM114-Status: GOOD (  10.84  )
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

In order to have Qualcomm QCN9274 (PCI ID 17cb:1109) completely
operational from VM environments, add to:

1. quirk_no_bus_reset: Disable broken bus reset, as with WCN6855 and
   WCN7850.

2. pci_dev_specific_reset_methods: Use the existing
   reset_qualcomm_wlan function. Unlike WCN7850, the QCN9274 is not
   initialized at all without a valid device-specific reset method.

3. kvm_msi_devids in pci-kvm-msi: Enable KVM MSI domain support for
   VFIO passthrough to VMs.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v3: new
v2: https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/

 drivers/pci/controller/pci-kvm-msi.c | 1 +
 drivers/pci/quirks.c                 | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pci-kvm-msi.c b/drivers/pci/controller/pci-kvm-msi.c
index e935e5d9846d..b008e73fedce 100644
--- a/drivers/pci/controller/pci-kvm-msi.c
+++ b/drivers/pci/controller/pci-kvm-msi.c
@@ -336,6 +336,7 @@ static int kvm_msi_create_domain(struct pci_dev *ref_dev)
 static const struct pci_device_id kvm_msi_devids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103) },	/* WCN6855 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107) },	/* WCN7850 */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1109) },	/* QCN9274 */
 	{ }
 };
 
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7f1f47ea2ee4..89d82675a76c 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3818,6 +3818,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0034, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x003e, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1103, quirk_no_bus_reset); /* WCN6855 */
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1107, quirk_no_bus_reset); /* WCN7850 */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1109, quirk_no_bus_reset); /* QCN9274 */
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x0308, quirk_no_bus_reset); /* SDX62/SDX65 */
 
 /*
@@ -4398,6 +4399,7 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
 	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_qualcomm_modem }, /* SDX62/SDX65 modems */
 	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_qualcomm_wlan },  /* WCN6855 WLAN */
 	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_qualcomm_wlan },  /* WCN7850 WLAN */
+	{ PCI_VENDOR_ID_QCOM, 0x1109, reset_qualcomm_wlan },  /* QCN9274 WLAN */
 	{ 0 }
 };
 
-- 
2.56.0


