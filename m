Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E128BFF8855
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrPVsXYF+rEIhZTNZMoNGMlP2TTLr2NqMrps8rU1RAk=; b=T7QsO+LtRxxttT4/l0rwY/EBEF
	41S+XO+NvyHbjSntdr+8/b2nhj3ABnn1hF66r5IEJbUjMJm4EidTtCNiSw1B0Q+HGJ3PJXL9nB1gr
	F/XEHEyiWc+he89Hf+A7VfpYAH9rvx8DLeXmyaQjcqCj2e/geObn/dmS6YcCgCVxuk2vbFmVje5/l
	FJO+HBOWwdU8nia2/LLx1qXC3Go55zlj6heNYK8sgY8275GFxDzrsCgJl6VnTNeEPPJjhNUi33NS+
	QAGHs4LXrSPs7sNecEjwvrl2lz0Y/RaKGJY9ULmBM03XWEl3sJ875LbkkLra3BPu+dzffeD4hD2VT
	3r2MB8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJVj-0000000H322-2qii;
	Tue, 05 May 2026 17:24:43 +0000
Received: from mail.mokrynskyi.com ([65.109.39.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJVh-0000000H30k-0A8l
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 17:24:42 +0000
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1778001871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrPVsXYF+rEIhZTNZMoNGMlP2TTLr2NqMrps8rU1RAk=;
	b=pVRmpnwheC58nBJJ5PhOGpyLIuqJq/d7UwqKiPb/AfPBZHgx4msVlbScsErcyGxq/qqh5U
	jMb5kOjZD9q9+WNiTu/9MsOvbzREKAuyZAaf/QGqcvi7Q4t+3D6XgXCjELbq2SpWVyYGDz
	MVJzbzfCgv1+Z8GhAv0UdBlTHYz5b4NiBEDnPo5UE3D7PWFREXu7NcgyIE6snrGrEPOFxm
	pZQ9gmkqnDsrqaDJuiCvyx9+55MbvvcSSUfNZFFL+qPnjlAZ3z4HfL3wepWh+DlW/piRv1
	6OPre1Gd2wxA7GnuwolxzAFHtJ6PmOwLgV8Eja79ZZ9eaeFKhTN/Djqc+ciOOQ==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jeff.johnson@oss.qualcomm.com,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH 1/2] wifi: ath12k: skip PCIe global reset on initial power-up
Date: Tue,  5 May 2026 20:24:14 +0300
Message-ID: <20260505172415.566328-2-nazar@mokrynskyi.com>
In-Reply-To: <20260505172415.566328-1-nazar@mokrynskyi.com>
References: <20260505172415.566328-1-nazar@mokrynskyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: -----
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_102441_288461_39EAEEDD 
X-CRM114-Status: GOOD (  11.42  )
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

ath12k_pci_sw_reset() unconditionally calls ath12k_pci_soc_global_reset()
regardless of whether the device is being powered up for the first time or
recovering from a previous run. The global reset drops the PCIe link and
relies on the host root complex to perform physical link retraining before
the MHI BHI register can be accessed.

When the device is passed through to a VM via VFIO, no physical link
retraining occurs after the reset since QEMU's virtual PCIe bridge does
not implement hardware LTSSM negotiation. As a result, all subsequent
MMIO reads return 0xffffffff and MHI initialization fails with -EREMOTEIO.

On initial power-up, vfio-pci has already performed a Function Level
Reset before handing the device to the guest driver, placing it in a
known clean state equivalent to what the global reset achieves. The global
reset is therefore redundant on power-up and only necessary on the
shutdown/recovery path where it tears down an already-running firmware.

Skip ath12k_pci_soc_global_reset() when power_on is true to allow MHI
initialization to succeed under VFIO passthrough without affecting bare
metal behavior.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nazar Mokrynskyi <nazar@mokrynskyi.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 375277ca2..a3d7aeb72 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -303,7 +303,8 @@ static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
 
 	ath12k_mhi_clear_vector(ab);
 	ath12k_pci_clear_dbg_registers(ab);
-	ath12k_pci_soc_global_reset(ab);
+	if (!power_on)
+		ath12k_pci_soc_global_reset(ab);
 	ath12k_mhi_set_mhictrl_reset(ab);
 }
 
-- 
2.43.0


