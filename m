Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DC2C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UDoAFc8XKizPW/kSqNJO42Z0ejdb4d/GRE8OyCY0WHU=; b=Dj3BtOzKcG3uemf4SR0he4Wu8U
	m9DU8D63qWFjYjHRcD4xAubQXwLd9NmLFBzNsGWeRtQoQLzBiO2vpI8u4xez7IjpJ3HsP5+FXmBjr
	Btdmv63RjQlgOLrIAZQv1JvFycZsKLQ0822gUTxpzZvkF37BdpS9gS8E/4qYmhJ0IZemU0zcWjG0w
	OpT5odEOPbSvBjUM0oKpDu6mYhvmdUEPWlfhvrMdDfk39itqTx5yTTZkw/jFmJRM26oHWBwcMQAHv
	J77N/sxFvRfrY30RVewnwaKItlnkdHGvhwWnq2In0W0ARciDkPZMdtoykD958suHjr8ttlQOVYvO7
	sC7UeXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYXe-0000000HAMR-242x;
	Tue, 30 Jun 2026 13:30:22 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYXa-0000000HALh-18mD
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 13:30:20 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8eeb4508f29so33940936d6.0
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826217; x=1783431017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDoAFc8XKizPW/kSqNJO42Z0ejdb4d/GRE8OyCY0WHU=;
        b=lxKJfvyB0K1zHpqIFNMxGtaN1oPaTS4xx5JGcb52QrrIuMWssu4Jet/cQIy7e6rZPZ
         +xQj6GBpHtJ3NNqEsAiF9oTWG11me0x0c4nYgCmtq6Bx3UDH7Z9LjFsM6+ayHFaL5CXX
         ooz0EP4ZveHG4m8KKvz3EPgW1Qmc1twdPeHrBl2r5Y5n7NqIJSGpJca2HpWmwKdvDGE6
         I+E2Oi29N8BQcRzhj7BfJi2bbYkZf9GKSzyxMPUH/bDfmL4PKaL5qGwNCgvOFFZOLWMp
         VzmsAMwuBrXXU2sWpKNrhxnUsGTx8WOXjvT7pZ4QcfBBGKqBI4ty5+qSVQdKvO3iz9Ps
         ba7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826217; x=1783431017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDoAFc8XKizPW/kSqNJO42Z0ejdb4d/GRE8OyCY0WHU=;
        b=DC+X65PaMllEVM3neAHu6956Fe+QTbkmVN0pxeVgFBfQTM9R6ecWpfIqaK2hn71R1S
         OKG+O/7XwGIqCRDWIybfqgJ8nW9ubD/2iYmEnuX50AZ9a5vmtS3sSXoYt+nFaiIFXU3R
         Ik/cksH8lPfXwUIktz8DoJEnlWNUtLqMh4IMBqsWmky+UYQy+Xdrg+L1EBNQYqXIOIq8
         eZWvRqgir8HSR15QDCJsg3ksBADkutCPc0FOoDLwVykXPT8xuDrAJa97R6joGPBgrCfl
         UdioCFlTp9Zi07VczLyqlkCbcIStB3tkcpxhdNa2zTM8DQMYqm8U/C044tKnEoR6P6CY
         H6ig==
X-Forwarded-Encrypted: i=1; AHgh+RpwZX/26W720hoMuXcGbo8jGV5qi2wrLP3JLfdXBNN/dvgQzwgjocS364jKLwH4wiKZBo0YU5I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJttftRx0QyMmL6QFvly/SJN1oH7248OcPVynmKcrfpnVZItjR
	zOM8A9JYhwxLUFTxMcyVxYJFER290kH0t5z9U/nGEFiP947LPOzZWSD4
X-Gm-Gg: AfdE7ckYJCBO0FxZjk09yHT9SQ0ehwTqHfN0CjtfrDbjsmDpjM2RaPqGBgpQWetEYVF
	NdNIfQMsy4fD4J7MSMiwDbXtxcgSRZgUUhNFf/P5VRv1NmnxYNtN1RAyvA+lpQWHZhJeeS8OG63
	zGc5mfMkVVojm8QtubzZh+Br4oQnM0pQ+aoL+x/7GNHwUVmhfYxpOmsVllTFlJi4UUdUYks+xd6
	vkmzwCHY5CPostSq7XvGDxChMAjJ8uks30y6qbTsluMBwAeblPFaTTHyzJdnJqL5qoWhexz2bkj
	zVvYfRaPlUgdnFhQnUr4q94HcbPRTxLgukwH5q399Clyc0IR1/ZPU+IluiCoz5+/UU74n4PgdJl
	NshGrXM3uS10ubGEsQs7rZFXfgjeVT1Ge+MWsElxXgEO5TNVDCEKR6JSLc5Fl5gNz903z4Frr3b
	0sgFVnCqMaH+MsdIM0XlT163xBNn4LFBaAiQoPI5DShpVOqQ==
X-Received: by 2002:a05:6214:8082:b0:8f0:ead1:a00c with SMTP id 6a1803df08f44-8f2d25b4bc8mr7948476d6.55.1782826216155;
        Tue, 30 Jun 2026 06:30:16 -0700 (PDT)
Received: from dev.lan (c-75-67-38-46.hsd1.ma.comcast.net. [75.67.38.46])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-8f1a7b26b2csm23003536d6.45.2026.06.30.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:30:15 -0700 (PDT)
From: Andrew LaMarche <andrewjlamarche@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew LaMarche <andrewjlamarche@gmail.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from device tree
Date: Tue, 30 Jun 2026 13:30:00 +0000
Message-ID: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_063019_253719_E3CC4469 
X-CRM114-Status: GOOD (  15.60  )
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

ath10k and ath11k support reading calibration variants from the device
tree to locate the correct Board Description File (BDF). The ath12k-wsi
binding already describes using qcom,calibration-variant but it is not
implemented in the driver.

Many ath12k designs expose all the radios under a single phy, each of
which typically require a separate BDF. Without this, the radios may not
come up or will not be calibrated correctly.

Fix this by parsing the device tree for the generation-agnostic
qcom,calibration-variant. This allows the driver to properly select,
read and apply the correct BDF.

Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
---
Changes in v2:
- Drop ath12k-specific binding qcom,ath12k-calibration-variant in favor
  of generation agnostic qcom,calibration-variant.
- Link to v1: https://lore.kernel.org/all/20260131003222.2011259-1-andrewjlamarche@gmail.com
---
 drivers/net/wireless/ath/ath12k/core.c | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.c  |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 742d4fd1b598..52c28864c63c 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -812,6 +812,28 @@ int ath12k_core_check_smbios(struct ath12k_base *ab)
 	return 0;
 }
 
+int ath12k_core_check_dt(struct ath12k_base *ab)
+{
+	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
+	const char *variant = NULL;
+	struct device_node *node;
+
+	node = ab->dev->of_node;
+	if (!node)
+		return -ENOENT;
+
+	of_property_read_string(node, "qcom,calibration-variant",
+			&variant);
+	if (!variant)
+		return -ENODATA;
+
+	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				"bdf variant string is longer than the buffer can accommodate (variant: %s)\n", variant);
+
+	return 0;
+}
+
 static int ath12k_core_soc_create(struct ath12k_base *ab)
 {
 	int ret;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..3cf39ae06fd3 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2945,6 +2945,10 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 	if (r)
 		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
 
+	r = ath12k_core_check_dt(ab);
+	if (r)
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "DT bdf variant name not set.\n");
+
 	r = ath12k_acpi_start(ab);
 	if (r)
 		/* ACPI is optional so continue in case of an error */
-- 
2.43.0


