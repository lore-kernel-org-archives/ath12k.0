Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEEFC52D7C
	for <ath12k@archiver.kernel.org>; Fri, 23 Aug 2024 15:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h1sMGva4zvk+DO1CjXNG0vRsRviBRjI6p9NW+fVQK8=; b=ibk9r/jdbYsPwRFQ8M444/Pqki
	NPFZ0zN93sE6H3YN+FnvMleqmIv8Gisqnqfd/+GO2Bn1TWhgJnmPolXtOZ03XqrABbbr7P2igoKgk
	Kg3uTYsuh4kO3F/CFarxYpDaRm/AFjP7qSBTaagquqjJO6KGbkZb5LADMVabEauHpNsLG9NbCXfsd
	GkulLNY9yY2Z34YCMwNjuAxit3t1W0mZAnd1oZQeZp7dgfVaiPWiQaNGvagatF4B6Ya/mF2N3aqjA
	ABoqssfHJy32fS9QY0uRflotYQ2Repm3ltmUsoYTWZLgjrBpOMBqcbaFuXm0qTHMElly2sCTx3IXH
	ApA2th+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWdD-0000000HPuU-2E7H
	for ath12k@archiver.kernel.org;
	Fri, 23 Aug 2024 15:55:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWdA-0000000HPqi-05LO
	for ath12k@lists.infradead.org;
	Fri, 23 Aug 2024 15:55:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2020e83eca1so21457425ad.2
        for <ath12k@lists.infradead.org>; Fri, 23 Aug 2024 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428514; x=1725033314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7h1sMGva4zvk+DO1CjXNG0vRsRviBRjI6p9NW+fVQK8=;
        b=bZ8vRZ6ozZpw1BZjPmGGy/sr5rHRbJ5QbIHGjwm8tuIJPKrOYkMElNb9gXTBlbZj4Q
         1ud6qfC+cC9T+WcpVaxeInYdHbsYRaL9fxLOWfmWjpTn9v8qIeoKf6hz2wl8nkWl87Aq
         h5otdcunadtodD9jPeLSVDLxsXoCSVa4dzQlTl605QHKv5DIiXjq1cO5mvlhAU/JXK/E
         c6t7vWd5t7KnbsxCn4QnbR6vcaqmjOJ87rNilwcJJfER78QFsoWEny0kXfLEGbB8Zopz
         e4W92W3pRY62CeGNggz/lA2DdJAGHa7sRMQhych1V4TgUnaaHCuCpJ2s3VpiOHR42jCY
         KLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428514; x=1725033314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7h1sMGva4zvk+DO1CjXNG0vRsRviBRjI6p9NW+fVQK8=;
        b=HxmatL+KtYl7dV452dQwE12hRnVODu3bUvnViM5Lg+71UB4piYUCzMaEhK8Y/zlPuR
         QWwv4z6JdBdv3dk1jgYawa0WsHEu/kV6mkm0fNFAOkrOt0uopgItUlKWBSd1gECglDsB
         3N7i1P2K1ISn583s7733m29dFu+xzQNywSKQ8c8WC5oDma8MWDD/7nvV/WBh+TQZnjlk
         tDX39ymF5MvaJ6zFP4rpBHkEDmcrMwOappONj8MZM1ivSPIF9guJAAMO+x2eyVovc48t
         X/qS/mmt2g5wzh+LwlofGIOhMG0i59FbYbsGeS4xgL8g3o+k7W15XXuwYi5F8m3Pj2kI
         bgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKA4JNkjkspUo2PNAdJ2sCFDN4MfwwCDbuGNVUb8iO6mr3cfB6cxfl9tTAr4RE6RMBfkWSceo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzLbotKQckYcFSeVUA/+lphwsjkOmdqOCWLowITnyJStCh8dcl
	VxUP7CRhqARiotGpnzbeewPFezCpxpXYpaHa41XLfrCLtt4wv/+7J8W1/qwiiKQl1XoYTiqVpDM
	=
X-Google-Smtp-Source: AGHT+IHZT5UpGBKD3IsG3QWdp8UwkgHmxBD8wtk0Tk5ZI4z0cspx07kEdT1GkMzCcaK4JYmk/BQ8mA==
X-Received: by 2002:a17:902:a705:b0:1fc:2e38:d3de with SMTP id d9443c01a7336-2039e443915mr21530405ad.7.1724428514080;
        Fri, 23 Aug 2024 08:55:14 -0700 (PDT)
Received: from localhost.localdomain ([120.60.50.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556649bsm29824005ad.49.2024.08.23.08.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:55:13 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kvalo@kernel.org,
	jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [PATCH 1/3] wifi: ath11k: Set IRQ affinity hint after requesting all shared IRQs
Date: Fri, 23 Aug 2024 21:25:00 +0530
Message-Id: <20240823155502.57333-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085516_192341_6F94D940 
X-CRM114-Status: GOOD (  16.11  )
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

If a shared IRQ is used by the driver due to platform limitation, then the
IRQ affinity hint is set right after the allocation of IRQ vectors in
ath11k_pci_alloc_msi(). This does no harm unless one of the functions
requesting the IRQ fails and attempt to free the IRQ. This results in the
below warning:

[   29.804276] ath11k_pci 0000:01:00.0: failed to power up mhi: -110
[   29.810564] ath11k_pci 0000:01:00.0: failed to start mhi: -110
[   29.816566] ath11k_pci 0000:01:00.0: failed to power up :-110
[   29.847202] ath11k_pci 0000:01:00.0: failed to create soc core: -110
[   29.853735] ath11k_pci 0000:01:00.0: failed to init core: -110
[   29.859745] ------------[ cut here ]------------
[   29.864486] WARNING: CPU: 7 PID: 349 at kernel/irq/manage.c:1929 free_irq+0x278/0x29c
[   29.872529] Modules linked in: snd_soc_hdmi_codec ath11k_pci(+) venus_dec venus_enc ath11k videobuf2_dma_contig videobuf2_memops nb7vpq904m lontium_lt9611uxc mcp251xfd mac80211 can_dev libarc4 hci_uart
 btqca btbcm ax88179_178a usbnet option leds_qcom_lpg usb_wwan led_class_multicolor usbserial crct10dif_ce qcom_pmic_tcpm tcpm venus_core aux_hpd_bridge qcom_spmi_adc_tm5 v4l2_mem2mem qcom_pon qcom_spmi_a
dc5 videobuf2_v4l2 bluetooth videobuf2_common msm qcom_spmi_temp_alarm rtc_pm8xxx qcom_vadc_common ocmem snd_soc_sm8250 gpu_sched snd_soc_qcom_sdw videodev drm_exec phy_qcom_qmp_combo drm_display_helper s
nd_soc_qcom_common qcom_stats mc i2c_qcom_geni llcc_qcom spi_geni_qcom drm_dp_aux_bus aux_bridge icc_bwmon typec qcom_rng coresight_stm coresight_tmc coresight_replicator stm_core coresight_funnel soundwi
re_qcom qrtr pci_pwrctl_pwrseq qcrypto pci_pwrctl_core soundwire_bus snd_soc_lpass_va_macro pinctrl_sm8250_lpass_lpi snd_soc_lpass_wsa_macro authenc lpass_gfm_sm8250 coresight slimbus pinctrl_lpass_lpi
[   29.872610]  snd_soc_lpass_macro_common qcom_q6v5_pas libdes qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common pwrseq_qcom_wcn qcom_glink_smem mdt_loader pwrseq_core icc_osm_l3 qmi_helpers qcom_wdt socin
fo display_connector drm_kms_helper cfg80211 rfkill fuse drm backlight ip_tables x_tables ipv6
[   29.990067] CPU: 7 UID: 0 PID: 349 Comm: (udev-worker) Not tainted 6.11-rc4 #50
[   29.997564] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   30.004446] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   30.011591] pc : free_irq+0x278/0x29c
[   30.015355] lr : free_irq+0xb4/0x29c
[   30.019030] sp : ffff800081f236e0
[   30.022441] x29: ffff800081f236e0 x28: ffff64630d260000 x27: ffffd8d89a8c3458
[   30.029764] x26: ffff64630d26ac00 x25: 00000000000000d6 x24: ffff6463029c58dc
[   30.037086] x23: ffff6463029c5990 x22: ffff64630d261c58 x21: 0000000000000000
[   30.044408] x20: ffff646301431c00 x19: ffff6463029c5800 x18: 0000000000000010
[   30.051730] x17: 0000000000010108 x16: ffffd8d8f1d8b840 x15: 0763072007740769
[   30.059051] x14: 000000000000030d x13: ffff646306b35ae8 x12: ffffd8d8f3852b80
[   30.066374] x11: ffff646306b356c0 x10: 0000000000000000 x9 : 00000000000000d6
[   30.073696] x8 : 000000000000000f x7 : 1fffec8c605626a1 x6 : ffffd8d8f2e602b8
[   30.081017] x5 : 0000000000000030 x4 : ffff646302b13580 x3 : ffff646301431c98
[   30.088339] x2 : 0000000000200880 x1 : ffff646301431c00 x0 : ffffd8d8f2b2c1b8
[   30.095662] Call trace:
[   30.098183]  free_irq+0x278/0x29c
[   30.101595]  ath11k_pcic_free_irq+0x70/0x10c [ath11k]
[   30.106800]  ath11k_pci_probe+0x800/0x820 [ath11k_pci]
[   30.112081]  local_pci_probe+0x40/0xbc
[   30.115934]  pci_device_probe+0x1d4/0x1e8
[   30.120049]  really_probe+0xbc/0x268
[   30.123727]  __driver_probe_device+0x78/0x12c
[   30.128204]  driver_probe_device+0x40/0x11c
[   30.132505]  __driver_attach+0x74/0x124
[   30.136445]  bus_for_each_dev+0x78/0xe0
[   30.140383]  driver_attach+0x24/0x30
[   30.144059]  bus_add_driver+0xe4/0x208
[   30.147910]  driver_register+0x60/0x128
[   30.151849]  __pci_register_driver+0x44/0x50
[   30.156238]  ath11k_pci_init+0x2c/0x6c [ath11k_pci]
[   30.161242]  do_one_initcall+0x70/0x1b8
[   30.165182]  do_init_module+0x5c/0x1f0
[   30.169034]  load_module+0x19f0/0x1abc
[   30.172884]  init_module_from_file+0x88/0xc8
[   30.177273]  __arm64_sys_finit_module+0x1c4/0x2b0
[   30.182102]  invoke_syscall+0x44/0x100
[   30.185953]  el0_svc_common.constprop.0+0xc0/0xe0
[   30.190783]  do_el0_svc+0x1c/0x28
[   30.194196]  el0_svc+0x34/0xdc
[   30.197335]  el0t_64_sync_handler+0xc0/0xc4
[   30.201635]  el0t_64_sync+0x190/0x194
[   30.205399] ---[ end trace 0000000000000000 ]---
[   30.432731] ath11k_pci 0000:01:00.0: probe with driver ath11k_pci failed with error -110

The warning is due to not clearing the affinity hint before freeing the
IRQ.

So to fix this, let's set the IRQ affinity hint after requesting all the
shared IRQ. This will make sure that the affinity hint gets cleared in the
error path before freeing the IRQ.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Cc: Baochen Qiang <quic_bqiang@quicinc.com>
Fixes: e94b07493da3 ("ath11k: Set IRQ affinity to CPU0 in case of one MSI vector")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 8d63b84d1261..0c22e18e65c7 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -886,16 +886,10 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_pci_disable_msi;
 
-	ret = ath11k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
-	if (ret) {
-		ath11k_err(ab, "failed to set irq affinity %d\n", ret);
-		goto err_pci_disable_msi;
-	}
-
 	ret = ath11k_mhi_register(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to register mhi: %d\n", ret);
-		goto err_irq_affinity_cleanup;
+		goto err_pci_disable_msi;
 	}
 
 	ret = ath11k_hal_srng_init(ab);
@@ -916,6 +910,12 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_ce_free;
 	}
 
+	ret = ath11k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
+	if (ret) {
+		ath11k_err(ab, "failed to set irq affinity %d\n", ret);
+		goto err_free_irq;
+	}
+
 	/* kernel may allocate a dummy vector before request_irq and
 	 * then allocate a real vector when request_irq is called.
 	 * So get msi_data here again to avoid spurious interrupt
@@ -924,17 +924,20 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	ret = ath11k_pci_config_msi_data(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to config msi_data: %d\n", ret);
-		goto err_free_irq;
+		goto err_irq_affinity_cleanup;
 	}
 
 	ret = ath11k_core_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init core: %d\n", ret);
-		goto err_free_irq;
+		goto err_irq_affinity_cleanup;
 	}
 	ath11k_qmi_fwreset_from_cold_boot(ab);
 	return 0;
 
+err_irq_affinity_cleanup:
+	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
+
 err_free_irq:
 	ath11k_pcic_free_irq(ab);
 
@@ -947,9 +950,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 err_mhi_unregister:
 	ath11k_mhi_unregister(ab_pci);
 
-err_irq_affinity_cleanup:
-	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
-
 err_pci_disable_msi:
 	ath11k_pci_free_msi(ab_pci);
 
-- 
2.25.1


