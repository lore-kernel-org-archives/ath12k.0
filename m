Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799CD606A31C
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hBjJ8iH/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=U/DrrKFw;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dGR5GaVb;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dGR5GaVb;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dGR5GaVb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rk+pfvv1vb7NTTtSUJmQv83uHi7ByrRhQkXx66jSAVY=; b=hBjJ8iH/gUEbgUWywBfRQ0i/Er
	h1a3sbso0csG1EKPGI+zsX7O+Qbtr7GZEzyheS4KN0dYTEq/rWZ7hn7TG2lgAe3sQZ08QndHQmA/c
	HH1a13eMqa9GDqIG0tIZtRfe/TNFfFyZUqOkVgsAvihlAbdHbwmLBC5133DeIF04igWDNx9pi+AZe
	sj64MwlMeTSDzubjxOLbBxeHE6Km9VC6jAtxaSNb508PSS1OuPKpaQrmUCmadEdltH3IkSw8dAhrj
	cDM6AuK1lmd9pBoNARElWKqW2bA1FvG07EN+haQuAzeHvdI+9bbVhI7QPLFySJSYH3+Rdnvj42lhs
	u7BnTYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT94-00000009pkE-0HZA;
	Thu, 29 Oct 2026 16:38:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT92-00000009piR-1Z28
	for ath12k@bombadil.infradead.org;
	Thu, 29 Oct 2026 16:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Rk+pfvv1vb7NTTtSUJmQv83uHi7ByrRhQkXx66jSAVY=; b=U/DrrKFwfCc1C3A3IOgAIQYFev
	LX0auJ116Q9FKNZTIRBXRLjo9eWG5RcQv8N0Md5p6QBQCyUdykqYj0Q51LdTHyzU7TdLHUO0oo8Ak
	lQAxhaz8KDmPnYeNgTol2rSUPl0nCCie3OGEqGdd6lnl545UiL0PO9wIbj1nPdkAW32v4GfBD+aFp
	smEnORZ983ITfmNJXFLh6YgAYTuPh9Q9U9SrIQU1R8YSMQYa6GS+mHPhgIhR64XuWJAjYPHty5z+c
	6cR5xui3gBTWjjIu+LTSVxUTsX6JxRcRvIrd0QmT2RNvt4KPQh3bbhexnvx5t9sjda/9IE512MM6Y
	p3L7rFNQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMT8x-0000000HCcs-002D
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rk+pfvv1vb7NTTtSUJmQv83uHi7ByrRhQkXx66jSAVY=;
	b=dGR5GaVb1c3JjAS5IAjKj4oy4PZiDrwf3cTHLfMZzFQLHSNSbIVyBX+mEKtihaTx24v9dJ
	hjJiyuIASVrB3ZPjIspWu6n/e+OcldCe2vzCXltrMAEdq6JgF9/uUJ7Xm2mgtC/25C4FZh
	FAhY0nEViDtHIDklfenVOS4pTTYc1R8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rk+pfvv1vb7NTTtSUJmQv83uHi7ByrRhQkXx66jSAVY=;
	b=dGR5GaVb1c3JjAS5IAjKj4oy4PZiDrwf3cTHLfMZzFQLHSNSbIVyBX+mEKtihaTx24v9dJ
	hjJiyuIASVrB3ZPjIspWu6n/e+OcldCe2vzCXltrMAEdq6JgF9/uUJ7Xm2mgtC/25C4FZh
	FAhY0nEViDtHIDklfenVOS4pTTYc1R8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793291900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rk+pfvv1vb7NTTtSUJmQv83uHi7ByrRhQkXx66jSAVY=;
	b=dGR5GaVb1c3JjAS5IAjKj4oy4PZiDrwf3cTHLfMZzFQLHSNSbIVyBX+mEKtihaTx24v9dJ
	hjJiyuIASVrB3ZPjIspWu6n/e+OcldCe2vzCXltrMAEdq6JgF9/uUJ7Xm2mgtC/25C4FZh
	FAhY0nEViDtHIDklfenVOS4pTTYc1R8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-9LRORvpiNdStrDF32nnCug-1; Thu,
 29 Oct 2026 12:38:16 -0400
X-MC-Unique: 9LRORvpiNdStrDF32nnCug-1
X-Mimecast-MFC-AGG-ID: 9LRORvpiNdStrDF32nnCug_1793291894
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B18E1935311;
	Thu, 29 Oct 2026 16:38:14 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 794E61956088;
	Thu, 29 Oct 2026 16:38:09 +0000 (UTC)
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
Subject: [PATCH v3 4/8] ath11k: add PCIe link recovery retry
Date: Thu, 29 Oct 2026 17:37:09 +0100
Message-ID: <20261029163713.1366077-5-jtornosm@redhat.com>
In-Reply-To: <20261029163713.1366077-1-jtornosm@redhat.com>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: UYcF1-I9TuhhiJpY9C_N8iZ9WIOrv8oL7PA1aA-my2g_1793291894
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_163823_156263_D88F4CD9 
X-CRM114-Status: GOOD (  16.09  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When ath11k devices are passed through to VMs via PCIe passthrough,
the PCIe link may not stabilize immediately after global reset due to
virtualization layer timing variations. This causes MHI initialization
to fail with "BHI offset: 0xffffffff is out of range" errors because
the device is read before it's ready.

Currently, ath11k_pci_soc_global_reset() just warns if the link is
down but continues anyway, leading to inevitable MHI failures.

This patch adds:
1. A retry loop (up to 5000ms) to wait for the PCIe link to recover
   after global reset (similar to the existing ath12k LTSSM retry logic)
2. Proper error propagation to prevent continuing with a dead link

This is especially important for VM environments where timing can vary
significantly from bare metal.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v3: no modification
v2: https://lore.kernel.org/all/20261011074514.515894-5-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath11k/pci.c | 38 ++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index a163168f3617..7e29ebaf9773 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -190,8 +190,10 @@ static void ath11k_pci_restore_window(struct ath11k_base *ab)
 	spin_unlock_bh(&ab_pci->window_lock);
 }
 
-static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
+static int ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 {
+	bool link_recovered = false;
+	int retries = 250;
 	u32 val, delay;
 
 	val = ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
@@ -215,14 +217,28 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 
 	mdelay(delay);
 
-	val = ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
-	if (val == 0xffffffff)
-		ath11k_warn(ab, "link down error during global reset\n");
+	/* Wait for PCIe link to recover, especially important in VM environments
+	 * where timing can vary significantly from bare metal.
+	 */
+	while (retries-- > 0) {
+		val = ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
+		if (val != 0xffffffff) {
+			link_recovered = true;
+			break;
+		}
+		mdelay(20);
+	}
+	if (!link_recovered) {
+		ath11k_err(ab, "PCIe link failed to recover - device may need power cycle\n");
+		return -ETIMEDOUT;
+	}
 
 	/* Restore window register as its content is cleared during
 	 * hardware global reset, such that it aligns with host cache.
 	 */
 	ath11k_pci_restore_window(ab);
+
+	return 0;
 }
 
 static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
@@ -377,8 +393,10 @@ static void ath11k_pci_force_wake(struct ath11k_base *ab)
 	mdelay(5);
 }
 
-static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
+static int ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 {
+	int ret;
+
 	mdelay(100);
 
 	if (power_on) {
@@ -391,8 +409,12 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 
 	ath11k_mhi_clear_vector(ab);
 	ath11k_pci_clear_dbg_registers(ab);
-	ath11k_pci_soc_global_reset(ab);
+	ret = ath11k_pci_soc_global_reset(ab);
+	if (ret)
+		return ret;
 	ath11k_mhi_set_mhictrl_reset(ab);
+
+	return 0;
 }
 
 static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
@@ -822,7 +844,9 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
 
 	ab_pci->register_window = 0;
 	clear_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags);
-	ath11k_pci_sw_reset(ab_pci->ab, true);
+	ret = ath11k_pci_sw_reset(ab_pci->ab, true);
+	if (ret)
+		return ret;
 
 	/* Disable ASPM during firmware download due to problems switching
 	 * to AMSS state.
-- 
2.56.0


