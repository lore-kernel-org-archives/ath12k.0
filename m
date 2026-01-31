Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEA9D46C1D
	for <ath12k@archiver.kernel.org>; Sat, 31 Jan 2026 00:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NdZ/Sc5hV/uhGzu0pWshiyKD65Sr9XHMviGrv3h2kCQ=; b=oxZyj3eeAEkyOpzsXJYSQggVwv
	Ny1oPqUaURgSsvDg28ouDHBVca605taQVAmKRApobi4enzjNvdCasmklfcbV3cFnLgLfVXKk9+uNU
	ND+NZtFDMTsGZW4v3swDd+eC8gpQfG3EJNSD+Bl9UVuU1BB6SJTal+XbCvXHOHiZzp23LGyPGiXXb
	7CoWlR5E+87NI76Xauj5zY60J8ELjFzDexrEUnD0sc08+QHPmK1W6VT8l+8iutORGoZAGikP22RcF
	edruE0OYHYWobVTOsXwFWj+yTGGBHeAIS3cpfsF5utHcCOr3PGPhy3u0vkQfcyQSB50q2UNJIqQyX
	1M4I+ZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyuj-000000029WE-13lI;
	Sat, 31 Jan 2026 00:32:37 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyug-000000029Vq-2lxu
	for ath12k@lists.infradead.org;
	Sat, 31 Jan 2026 00:32:36 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8c5386f1c9fso347081985a.1
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 16:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769819553; x=1770424353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdZ/Sc5hV/uhGzu0pWshiyKD65Sr9XHMviGrv3h2kCQ=;
        b=IPOYCH+LZ/btphh9zkfIo+/BYpjVGAow1mWurZ8i9mgfFqRqNOGQuv09Q95Ya5rN6a
         a1weiArjbqJW3SBudUwjLsjy985kfOoJm0yfPLTIixB0GuIJNXoW67r0hm7KLxArNi+w
         HyUVMt5XAHpsqxuKCha4tW0N8ogDuUvAbWgIxy6yBsQvoE8KuJYjlSXD4QAOj2immGZl
         xYDa+2yc3nPslreyO7uTw8t7hV8NQvQGawzVrr/nXjKKInLeEjrpgedb348Cc/YvOgiU
         s+9bxbsRYxxhlXlCQUE2wi8Y44S8TKKoC+EGNg61p88yj7N6AY0HznUPL/ygMY/Fmmbd
         k9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769819553; x=1770424353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdZ/Sc5hV/uhGzu0pWshiyKD65Sr9XHMviGrv3h2kCQ=;
        b=wVEwcKjiFwBouODsofXqTc8DSSSuHA6eVnYhkEnKOnhG0vTM6elr0tO4kJQMef7Dro
         Iw7o1FTag8FD5M1zgyJlBtFKW5eoWnQIas4cUVeLa44uc+V8o2BNhLnHCgziOEdEMcDS
         fwPNPaw6t4FJU8ypnR5hJKmoGfIw4EaKgoWV8JLC8BbIfXjRaOYeazUDxiWAXkXyWeLG
         lcJHrlhcr1d9mpH3GsoRP7gJUlDr3IyfKnwxfLKXglk6hJstzwFf3Dm17qnBWsROcYAX
         dGMfu2MBgSEyvMNThaPM+gDHyItNvgXHnwAddKlV2fTtjVf0lCVSMx9WgFF9rtFd3GeA
         gFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXStsEwRHlllpDDcqA37hm2nBhcNJvFYdKov2THndy5O0YHgQLZ0u8n+EQzGPa0A2Xh1iB9xB8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUpHDB+fSfedh2ZAsjHV0jdrnBIWTenplC3UajqD8owu0gIKKV
	usZTQVgS7uJrve3beAjbjqkI7XkN1OgGW49hnTT8/N526dX2uudp2UuE
X-Gm-Gg: AZuq6aJ/jP1Ep3H2GcaTSLRiOEssdAiTIaitJE9my6O9APGWyZSSlC7pYJvP9Y4cljb
	OI9XUqw8QSCGkr3KBD4CZV1Dck4LoTPofkTm5XHBnPnRjcW9TlQ2tRhUzq6W6zVFlnSFguxn7sW
	TzqC00N8OIfealQ0PRFJ71SjP17MUIzNQKmCyqM9d4POHhiTUKdJh5MhUWLdZ5qkX+1JBEqJdcy
	hZRrhJvgQWQUEo2TI1lLYCrxBB9nxcdQxIZjSzk4rl+fMFE4ZIQmAxg5yT/4YM0jAUj1ujT3q8r
	v83BlRVQztHUReKdfkL027t47tgRZC55gSYj3N9jrUWfbIAyRBNG0l+9lf3MxCazPuDPSMHph6T
	ZZVlIw0Ge1ar07mbIl51ZWHd4ek5YKBPs5fioFa/v3ts8Ls6BOlX0R8wOuYa4bA3rd+CmsA==
X-Received: by 2002:a05:620a:1a26:b0:8b2:e17a:37 with SMTP id af79cd13be357-8c9eb2fa58cmr623720085a.43.1769819552944;
        Fri, 30 Jan 2026 16:32:32 -0800 (PST)
Received: from dev.lan ([2601:19b:4201:3e2::ff7])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-8c711d29044sm719968485a.30.2026.01.30.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 16:32:32 -0800 (PST)
From: Andrew LaMarche <andrewjlamarche@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrewjlamarche@gmail.com
Subject: [PATCH 1/1] wifi: ath12k: support calibration-variant from device tree
Date: Sat, 31 Jan 2026 00:32:22 +0000
Message-ID: <20260131003222.2011259-1-andrewjlamarche@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_163234_710149_E95269FE 
X-CRM114-Status: GOOD (  16.08  )
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
binding already describes using qcom,calibration-variant and
qcom,ath12k-calibration-variant, but it is not implemented in the code.

Many ath12k designs expose all the radios under a single phy, each of
which typically require a separate BDF. Without this, the radios may not
come up or will not be calibrated correctly.

Fix this by parsing the device tree for the generation-agnostic
qcom,calibration-variant node or ath12k-specific
qcom,ath12k-calibration-variant node. This allows the driver to properly
select, read and apply the correct BDF.

Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 25 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/qmi.c  |  4 ++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index cc352eef1939..e45f76d81337 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -806,6 +806,31 @@ int ath12k_core_check_smbios(struct ath12k_base *ab)
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
+		of_property_read_string(node, "qcom,ath12k-calibration-variant",
+				&variant);
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
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3c1e0069be1e..39700a780ee2 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1352,7 +1352,7 @@ int ath12k_core_fetch_bdf(struct ath12k_base *ath12k,
 			  struct ath12k_board_data *bd);
 void ath12k_core_free_bdf(struct ath12k_base *ab, struct ath12k_board_data *bd);
 int ath12k_core_fetch_regdb(struct ath12k_base *ab, struct ath12k_board_data *bd);
-int ath12k_core_check_dt(struct ath12k_base *ath12k);
+int ath12k_core_check_dt(struct ath12k_base *ab);
 int ath12k_core_check_smbios(struct ath12k_base *ab);
 void ath12k_core_halt(struct ath12k *ar);
 int ath12k_core_resume_early(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b7c48b6706df..22ef5aab871f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2903,6 +2903,10 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
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


