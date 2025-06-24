Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB53AC77B7F
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iHFqrr/kNilRxKIzI+lsKlq6Egg4F7XUceUPXNKtTSQ=; b=dj/O/4vZoeY74zgZ7XC/RPjjSN
	kqOLOhpcX7xS9SIedApl9f5+2e17ZrPvCUU1wiDIOJ8MjkEOp/mAqtCsY6ZpqrLlyUVG9TzD5+S9i
	g2obrgXDIiOqBjkPU3LIMYpcl38SqtDEBEaRw7t22Ct7+66ti+gOYXivRb6gh6COuRtpSgsFwe6TX
	O67WFKujqrtLqWNQq4Ze73MlxlMhZhl4spEeScKF0zJhjew8swUvGcQzwBIHEtvFHfgH3hvTFJqrN
	TiYDmAiCdzlHQyq38NBQqw9JNuFYvzuuXlybMaWDmpUBsBHzdAzUaiHzK9cHw5oAKlc6OF6w/WYad
	gZHiB5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jm-00000006gKA-0WU8;
	Tue, 24 Jun 2025 19:55:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6rI-00000006JWM-44nn
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 16:50:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4537deebb01so5657575e9.0
        for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750783855; x=1751388655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHFqrr/kNilRxKIzI+lsKlq6Egg4F7XUceUPXNKtTSQ=;
        b=LzFt2HlBlfzP9HS0lNtKReR88keLTXmQTcE04NO/Zu9ad66OMCSRJLD1xX/I3N3Wo7
         Siz38xXxmW6qIeo5ELkEPErS3soiM+TY4FftZrBk5zMXQlnsjn09z9nGnOg1Xo/7PRkL
         piiLbGszAqbUklxqYCTGHcMpc+j26Po0YdvY1FASg6qEi9lrP2ng+UPVPnR0AtYoMDTY
         Ir4Q4ZkxB7jlIjKd9v0lbwtby38t/0e2QAPeVGrRmz4/mPCdvRSy1M6k7wzLABhW6f9s
         vCbVdFLnQGmf5gtoX5+vPVomWn30F3+jcCNK7MI1jmVn8XFT79PRFNh60qqjjFNE5og+
         XLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783855; x=1751388655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHFqrr/kNilRxKIzI+lsKlq6Egg4F7XUceUPXNKtTSQ=;
        b=Y94kiprKFbQu/A4A+GlqCHdHDyw7PiyV3ny+VrmLnDPTTQ/eSJR8AK1NBSEAuNiFtA
         TlVUtd568ki8GRFAULAfbWPK3FGpr4LvIIA2rTCDBOWG7ByTgMVAvYm+ZncGBt99pVSc
         IJo6KuDPjGyluNIWm1UdquK4RCgUD2ummpQit/K3pHjHLN1X8iMhKFWIMeXC3FSxKmvE
         4I8fqhOUNJpzs3bE1fetCoGD05eblOnjZcEFjHczHUe3M5vh1Tv1lNOu5w4Q3e2XA0ML
         +hrNcoyxPWUwyEysprisN5oWroQ0eu3xBK5Diou3D2HsXxlmSMQ3H4LVOjcbfA8SVlbi
         2L0Q==
X-Gm-Message-State: AOJu0YwB3wBNfI1EJs1p5dnL9s2b3M+z18JKFLp+yNDwtrvgKewdy5O/
	O+rD46GTLdUhGEDXbVOPkUfVCMLuTr70MA9QUW2qu5ftUb+rYVHWNFcfHeK7hU860mDTBQ==
X-Gm-Gg: ASbGnctm2dAkbzexszbLdVIHB9NUH4RzUdEwDc6W1VXJVfP1sNuiR23TrI7LgXc2KWm
	O48K4lnRwB+7/ghPDXlKBLaBU2dhrTrAIRbKeu/QkFpdrnTsdDlZBde/CRPHjmsQGkzXuhxiVmC
	IdglP4KRXC3euKcwLdLgxV+vG+yiHy1sGTgNJmS1QRr/1p7ulXN6h0xOtHsQ2pO50f6N6QjU4Bu
	8gJwdH5P5dP029NH5rdU3Oa0jBbRtpCNPe/v3H9Hiro//bT7+XsmkfFnd2mOwWrX9YieWL6HRbo
	b5vGRDt0bB+vDHiPnzlfIlZcASUWIOp38pGSPBQCocJz4RCwk9oE/ApVS4Y5RLIi2iFu3KVAxTy
	ocXnfPZ+UUuLtI5L0ZxE78JT1OV4=
X-Google-Smtp-Source: AGHT+IFwQc4zbsyjGnbBX2eygzyIbIn2JHqWT8OfveOdOyrkeTPZP3hcBq0rOTK6GxlfyWpx9ffnVg==
X-Received: by 2002:a05:600c:45cb:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-453656c2c49mr150048265e9.26.1750783854821;
        Tue, 24 Jun 2025 09:50:54 -0700 (PDT)
Received: from govindsingh-ThinkPad-P1-Gen-3.tii.local ([2001:8f8:1d0a:b6eb:5d08:e639:26e7:bf0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45369eae840sm120723675e9.38.2025.06.24.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:50:54 -0700 (PDT)
From: Govind Singh <govind.sk85@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Govind Singh <govind.sk85@gmail.com>
Subject: [PATCH] ath12k: add module param to control MSI mode and address width
Date: Tue, 24 Jun 2025 20:50:31 +0400
Message-Id: <20250624165031.58616-1-govind.sk85@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_095057_016028_952E45BF 
X-CRM114-Status: GOOD (  14.75  )
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

This patch adds two module parameters to the ath12k PCI driver.

 - ath12k_msi_mode: Allows selecting the MSI allocation mode.
   * 0 = multi-vector MSI (default)
   * 1 = single-vector MSI

 - ath12k_32bit_msi: Forces the use of 32-bit MSI addressing
   by setting pdev->no_64bit_msi = 1 before IRQ vector allocation.

These options are useful for working around hardware or platform
limitations(ex:  i.MX 8M Plus) where 64-bit MSI or multi-vector MSI
allocations fails or cause stability issues.

The original MSI allocation logic remains unchanged unless the
parameters are explicitly set via modprobe or kernel boot options.

Tested-on: QCN9274 hw2.0 WLAN.WBE.1.4.1-00103-QCAHKSWPL_SILICONZ-1 with
           i.MX 8M Plus SOC
Signed-off-by: Govind Singh <govind.sk85@gmail.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 25 +++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/pci.h |  5 +++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 1f3cfd9b89fd..4f58cb1e03f6 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -45,6 +45,14 @@
 #define DOMAIN_NUMBER_MASK		GENMASK(7, 4)
 #define BUS_NUMBER_MASK			GENMASK(3, 0)
 
+int ath12k_msi_mode;
+module_param(ath12k_msi_mode, int, 0644);
+MODULE_PARM_DESC(ath12k_msi_mode, "MSI mode: 0 = multi-vector (default), 1 = single-vector");
+
+bool ath12k_32bit_msi;
+module_param(ath12k_32bit_msi, bool, 0644);
+MODULE_PARM_DESC(ath12k_32bit_msi, "Force 32-bit MSI addressing");
+
 static const struct pci_device_id ath12k_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCN9274_DEVICE_ID) },
 	{ PCI_VDEVICE(QCOM, WCN7850_DEVICE_ID) },
@@ -773,10 +781,19 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 	int num_vectors;
 	int ret;
 
-	num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
-					    msi_config->total_vectors,
-					    msi_config->total_vectors,
-					    PCI_IRQ_MSI);
+	/* Set 32-bit MSI flag early if requested */
+	if (ath12k_32bit_msi)
+		ab_pci->pdev->no_64bit_msi = 1;
+
+	/* Force single MSI mode if requested */
+	if (ath12k_msi_mode == ATH12K_MSI_VEC_SINGLE) {
+		num_vectors = -EINVAL; /* Force fallback path */
+	} else {
+		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
+						    msi_config->total_vectors,
+						    msi_config->total_vectors,
+						    PCI_IRQ_MSI);
+	}
 
 	if (num_vectors == msi_config->total_vectors) {
 		set_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index d1ec8aad7f6c..4fa8bb619cd9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -92,6 +92,11 @@ enum ath12k_pci_flags {
 	ATH12K_PCI_FLAG_MULTI_MSI_VECTORS,
 };
 
+enum ath12k_msi_mode {
+	ATH12K_MSI_VEC_AUTO = 0,
+	ATH12K_MSI_VEC_SINGLE = 1,
+};
+
 struct ath12k_pci_ops {
 	int (*wakeup)(struct ath12k_base *ab);
 	void (*release)(struct ath12k_base *ab);
-- 
2.34.1


