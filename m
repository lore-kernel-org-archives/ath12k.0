Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B42CCA5FC7
	for <ath12k@archiver.kernel.org>; Wed, 30 Sep 2026 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4bGrMOUWdoYXf6v3KdbzJjmhcHDPSMNv6CXzNuUff8=; b=TUYYsE80w0zjRJgBIx/QeQ8E4f
	PwRRSyehIYfqPpU5xqzS/dLkbS1HU6MDRghvgVp6z+RzRM0FEA+OlnKM0QNgHPQhBxXwzo8sMI5G+
	hrRlsLpt6+xe1qa6ZiQXdpYrklVC/U/EFD6qO2earmAOxPIE8qXZyKLJbdROI1JO+9ttI4d4lexSl
	Id7YXF0S9hBHxYBCMjDVUuub8Diwbsno5wZT9T8IZn7XjaZaiLBUZoMSo/QklEFCqd4pYO/DkXGO9
	SX+SVPXy0q2X5S5//2fspurpyH5yzR0J737xUf4mW2+rs8+74CQULnj69BNSTbmE8wlxo2XGuUHSb
	7OHZFLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1s-00000006FLd-3yrd;
	Wed, 30 Sep 2026 14:11:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1k-00000006FH6-0hFp
	for ath12k@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I4bGrMOUWdoYXf6v3KdbzJjmhcHDPSMNv6CXzNuUff8=; b=kvt6EOh3/tdAdA8k1tUwdujeiP
	1IPzwYS6yGa6+W8viSaFmkV1nkfXPtru0YH4SKufdBlF2RFF44ASVHUJqArklEPSzbM7c0FB3L4fb
	/kWiBk4zTf9kPaThzwtRx+R/yHl0r/Un/3L/Cy+YYbXH8psDuL859/m97vno3AT+DFslY18BNt/nE
	5gOnsZN96pJ769gNSOBb3EHq/1hjsgDAAzyjYCqsISAilwfx7+lv7UPU76r4oIbyNA2BXKhhC5GM7
	k+OD87CHC0GpOef+Ex9ovOTW4KfjIn/YYP5DNGENs674G/oK7clbAz+rFpRTG0XuhAXuGIPgjZaes
	ObkvJ/YQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv1g-00000003tfZ-3oI8
	for ath12k@lists.infradead.org;
	Wed, 30 Sep 2026 14:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4bGrMOUWdoYXf6v3KdbzJjmhcHDPSMNv6CXzNuUff8=;
	b=WJPIuAHyuyJ8MdtLlwFSR87Sg8/bt0AiAW8oet0b69cm2RrojeSFDtVcOP8c+/nYQ12RM4
	UjjbdyBZ+TKO/WUat21Iqf+WvUqOqCU2zIP7E/f2d+sRVIAtpCMBIrmjdEhuFlHHslr2Fl
	OhGm2ejUvputyr8+bkC56DqFN/d2rqU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4bGrMOUWdoYXf6v3KdbzJjmhcHDPSMNv6CXzNuUff8=;
	b=TzHUYscqqUYe2pySxl89sH+RVrloCdZKWwmz727VFkbHSMZ1LFjQ7LRUkMY5silZ+alGa/
	ibZscb7khWi4h2BNZ+s9GqNPSW/G5JCgPHWP8zrKVoOwO15KhvS5dkuXcjqwFYhvgjq6jm
	WSDTzBQBcKR9fuhbcUH//2VpFM2gcgI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4bGrMOUWdoYXf6v3KdbzJjmhcHDPSMNv6CXzNuUff8=;
	b=WJPIuAHyuyJ8MdtLlwFSR87Sg8/bt0AiAW8oet0b69cm2RrojeSFDtVcOP8c+/nYQ12RM4
	UjjbdyBZ+TKO/WUat21Iqf+WvUqOqCU2zIP7E/f2d+sRVIAtpCMBIrmjdEhuFlHHslr2Fl
	OhGm2ejUvputyr8+bkC56DqFN/d2rqU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-578-OJAZKP2XNZWxpABNWi0t0w-1; Wed,
 30 Sep 2026 10:09:54 -0400
X-MC-Unique: OJAZKP2XNZWxpABNWi0t0w-1
X-Mimecast-MFC-AGG-ID: OJAZKP2XNZWxpABNWi0t0w_1790777392
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 350C61955D5A;
	Wed, 30 Sep 2026 14:09:52 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D653A1956044;
	Wed, 30 Sep 2026 14:09:47 +0000 (UTC)
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
Subject: [PATCH 6/7] ath12k: add PCIe link recovery retry
Date: Wed, 30 Sep 2026 16:08:32 +0200
Message-ID: <20260930140833.576941-7-jtornosm@redhat.com>
In-Reply-To: <20260930140833.576941-1-jtornosm@redhat.com>
References: <20260930140833.576941-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: sNgk7ixiaSdwG9bCzM5xcQYierVYW-_LQjPIyeXcp5I_1790777392
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151117_115903_FE901682 
X-CRM114-Status: GOOD (  16.55  )
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

When ath12k devices are passed through to VMs via PCIe passthrough,
the PCIe link may not stabilize immediately after global reset due to
virtualization layer timing variations. This causes MHI initialization
to fail with "BHI offset: 0xffffffff is out of range" errors because
the device is read before it's ready.

Currently, ath12k_pci_soc_global_reset() just warns if the link is
down but continues anyway, leading to inevitable MHI failures.

This patch adds:
1. A retry loop (up to 5000ms) to wait for the PCIe link to recover
   after global reset (similar to the existing LTSSM retry logic)
2. Proper error propagation to prevent continuing with a dead link

This is especially important for VM environments where timing can vary
significantly from bare metal.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 39 ++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index af0e882fd0b5..65712486d312 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -181,8 +181,10 @@ static void ath12k_pci_restore_window(struct ath12k_base *ab)
 	spin_unlock_bh(&ab_pci->window_lock);
 }
 
-static void ath12k_pci_soc_global_reset(struct ath12k_base *ab)
+static int ath12k_pci_soc_global_reset(struct ath12k_base *ab)
 {
+	unsigned long timeout;
+	bool link_recovered = false;
 	u32 val, delay;
 
 	val = ath12k_pci_read32(ab, PCIE_SOC_GLOBAL_RESET);
@@ -206,14 +208,29 @@ static void ath12k_pci_soc_global_reset(struct ath12k_base *ab)
 
 	mdelay(delay);
 
-	val = ath12k_pci_read32(ab, PCIE_SOC_GLOBAL_RESET);
-	if (val == 0xffffffff)
-		ath12k_warn(ab, "link down error during global reset\n");
+	/* Wait for PCIe link to recover, especially important in VM environments
+	 * where timing can vary significantly from bare metal.
+	 */
+	timeout = jiffies + msecs_to_jiffies(5000);
+	while (time_before(jiffies, timeout)) {
+		val = ath12k_pci_read32(ab, PCIE_SOC_GLOBAL_RESET);
+		if (val != 0xffffffff) {
+			link_recovered = true;
+			break;
+		}
+		mdelay(20);
+	}
+	if (!link_recovered) {
+		ath12k_err(ab, "PCIe link failed to recover - device may need power cycle\n");
+		return -ETIMEDOUT;
+	}
 
 	/* Restore window register as its content is cleared during
 	 * hardware global reset, such that it aligns with host cache.
 	 */
 	ath12k_pci_restore_window(ab);
+
+	return 0;
 }
 
 static void ath12k_pci_clear_dbg_registers(struct ath12k_base *ab)
@@ -299,8 +316,10 @@ static void ath12k_pci_force_wake(struct ath12k_base *ab)
 	mdelay(5);
 }
 
-static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
+static int ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
 {
+	int ret;
+
 	if (power_on) {
 		ath12k_pci_enable_ltssm(ab);
 		ath12k_pci_clear_all_intrs(ab);
@@ -309,8 +328,12 @@ static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
 
 	ath12k_mhi_clear_vector(ab);
 	ath12k_pci_clear_dbg_registers(ab);
-	ath12k_pci_soc_global_reset(ab);
+	ret = ath12k_pci_soc_global_reset(ab);
+	if (ret)
+		return ret;
 	ath12k_mhi_set_mhictrl_reset(ab);
+
+	return 0;
 }
 
 static void ath12k_pci_free_ce_irq(struct ath12k_base *ab, int num_ce)
@@ -1452,7 +1475,9 @@ int ath12k_pci_power_up(struct ath12k_base *ab)
 
 	ab_pci->register_window = 0;
 	clear_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
-	ath12k_pci_sw_reset(ab_pci->ab, true);
+	ret = ath12k_pci_sw_reset(ab_pci->ab, true);
+	if (ret)
+		return ret;
 
 	/* Disable ASPM during firmware download due to problems switching
 	 * to AMSS state.
-- 
2.55.0


