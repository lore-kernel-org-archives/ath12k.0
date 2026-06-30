Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56081C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 01:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UDoAFc8XKizPW/kSqNJO42Z0ejdb4d/GRE8OyCY0WHU=; b=gEm59/s/sUbJrt4VqGzmjkYKKp
	7/RPWaNvjESOOyS18pgQ45RzM7e7y/Z7HzLjlXArV+n16NzRnTj+nw0dbiEN3LBDW2GmrqBaOaE2e
	C/aAllLKDrt792KQbq9S0HdCO6FldFfQyZ7GzDlUN648Dhay6PJCOwMTyaSkRQi4+rbDlZXAErSWx
	7ZvVaZGCvgoKYCUDa4piFbMpZB96b9Z40fwJzbDLHKgRRZhADZCCPTy8G6DhUguu3Wj3dcVF9lTVS
	J1wB6++SrfLHN0lR2KcnmyEHLgEEG5aqJkOZSpsTf28v9QoDci3VdXqsqUcm8OtGiFwTTk4ft0D17
	9+R7pKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN3R-0000000FdqV-3HFd;
	Tue, 30 Jun 2026 01:14:25 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN3O-0000000Fdq7-3Q6G
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 01:14:24 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-51c0ecfaee7so6323271cf.0
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 18:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782061; x=1783386861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDoAFc8XKizPW/kSqNJO42Z0ejdb4d/GRE8OyCY0WHU=;
        b=ElAIdO8lEwniojWU6m6sbnX/9d/8PquK/mSoE/F/4JU+Fv4sRkKNkh3Hs2mH2dSH0D
         6B+k4PfAcHHIHlpblEBqhNALX6bqebQcPCvlkI1xUKdIW9XH9EEZHsgZJ+RlglYotno3
         9ffHIUr9zA5/tGTcvplfB8ZTHz8ywwxi/ASFaO/zYzurT7YiqkVu5rLqhHiAt8+Kslx8
         dk712vA5ECBqYQNoVFzXZ06JQrOPZ6o0YvwDeY6Xl1Z//JYDAEGWasTBu9Ti2jgyIrqA
         tl3RwMKxO4/t2sy62CTtgtbQ0qt+vG1Xbkv1YBPoOMLtSrMaXmXVBg8OV17/F9RQIGZh
         0vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782061; x=1783386861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDoAFc8XKizPW/kSqNJO42Z0ejdb4d/GRE8OyCY0WHU=;
        b=UyApjbk/aq0ONNf/suEBACbTC5Dwb+ol85g13XVeiV4g/BeIW+XvKK65nPIXLJQry/
         c87jExuejU3uw6E/tSx0nMrRg/z4TUD+9OGJB+N99u0+FMqYoA8F/Tf3x5PySsu1Ipzd
         OWrtBx95i6+xkM3SsJkGN/N0KK1zbbxs82uQwK5oSx8qIoWxCMKjmr5odkh/yd+aswDb
         5pLh/b2RoQnUgr7gjS6tHLkj+13+nijdPnJwOmOvOSU5FKpbUk/aeDB+yJsEojOw8g2E
         S1n0VVvgG+ahfi2PnMhp+IJXztl6/SN1ytCm0kLS2aREFbEyKuDhVXDiB9lxPW5fa9LN
         qdLg==
X-Forwarded-Encrypted: i=1; AFNElJ+TEZCCWl6/IsBMeKAlU5GruRyZ2OWOsQePSRLB8N10kZ/uGC+rRsbDrnfMtk/qQzc2JcaEJUc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUGeEBuIpoBnu+gd1+zGnol4rajNovuIkfLDa652wLH7UqwIow
	xW6wLGnAqJBTP8IAi8w9PQ/bxWieqs3P8mNwTGiWTwEDgnxVTAHIkM/2imE2eLZd
X-Gm-Gg: AfdE7ckebje435kmlRYlkFsd//HCTmSg0vwno2M2HKzKEW30SKxJrVj69jrcrNpZ4p1
	+3qJpmxSRuEkpZnOSgr42DBfoza2uvGq5wHsI6yEam6g7Kk38+R+Ba8q9bGKISAvNybDb0lfHT9
	939G0Xsfy6oykpzy/UvfloD7rTGKOPZblbivWITcbS3hfiLZ6Q9tsubDc9uQ37VIlk1ij1bsKVx
	KY++HFP3x25L2voaUHhQy8O/kli/z0feBiJsT/ZorhdE0+pnF1trFgKL1RkrKyRxild9d9kY6SS
	qQ1UeGAnoe9SY7nW3+2TyTJ5pEwfAEuaeR8WlKqjWTJ6qhQyzJ1Vu0U2A4DQYV0xzU/z5J/7ljS
	O7ibWxghq+1upOq/GgQrcT801nzrIjKx0RnQNf9UBzMH2N9ET39UKPb0edY7RZIdYisOeZ0X99q
	9PDWkINvtbPkcf5ZpfHcoOFKyr53FQDsEIM+iaEsxRFYVnAw==
X-Received: by 2002:a05:622a:5d1:b0:50e:6313:6e13 with SMTP id d75a77b69052e-51c10751ccemr24874721cf.5.1782782061019;
        Mon, 29 Jun 2026 18:14:21 -0700 (PDT)
Received: from dev.lan (c-75-67-38-46.hsd1.ma.comcast.net. [75.67.38.46])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-51c1099aca4sm7719801cf.17.2026.06.29.18.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:14:20 -0700 (PDT)
From: Andrew LaMarche <andrewjlamarche@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew LaMarche <andrewjlamarche@gmail.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from device tree
Date: Tue, 30 Jun 2026 01:14:12 +0000
Message-ID: <20260630011413.1424654-1-andrewjlamarche@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_181422_865801_BE8B0BE3 
X-CRM114-Status: GOOD (  15.58  )
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


