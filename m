Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CAAC43458
	for <ath12k@archiver.kernel.org>; Wed,  8 Jul 2026 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pOJ3Pf0iHZgowhFyY91dPG9CWszSETz0W72ezmzqxqc=; b=CRaiWS+tas+9yzu/ICOsufJstf
	r8YBrrqIhDAJY68+DlHExeSxCjwrrBBm8TFw3WmbicCXWq4yXP/9C/opnaf2AJJ4XJl6n7pSSg6Z1
	Yo/brxnM2dDVDvuCG9qrXfiL19R9KI5hE/eEorPNTNuQMytFO0TlUN/4kLNkbNE67exkMt2z1n89M
	6GpvESeo0fvKz9eDoZbwqcX283IATa2qCEwhivwCfUkHcP1xvcVYlCkdO4I4awlEiAcgdFo1bVZ6X
	/xpC06LdlSNiSStezTO5egIH/TuS/p7PsSKPQ5RnnFciNeOjVh94YmJMEkXNXehLXu9OEZkdWakED
	eM1Pqwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPFi-0000000Gp6k-1NOE;
	Wed, 08 Jul 2026 10:11:38 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPFf-0000000Gp62-2Kip
	for ath12k@lists.infradead.org;
	Wed, 08 Jul 2026 10:11:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so512885a91.0
        for <ath12k@lists.infradead.org>; Wed, 08 Jul 2026 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783505494; x=1784110294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOJ3Pf0iHZgowhFyY91dPG9CWszSETz0W72ezmzqxqc=;
        b=YIJCngQG38UKOgfL+z2wtFc0IUrUeBcb7BSCs3gFEEI9ujbdAx/8Jtt4pFJdCHVZt3
         SYWYY/iviaREH8AyT33IUdJpbZUL0mO2On3puz5Td4OUortYWi++yo/Rz9Ju3DZ4m4Lm
         1RIXXQjmkrtzYay/oW9KczZGQGLXsR12D8jb5sQ8JTd1NgwRWvC2h9hyzLI8GhkI7Bmz
         OF9LYppU8WolMQqL1mX3trZb7rHM4PFAJCEWhStWheMRgYrGBUdA8CjOC8lLNaPo8bSU
         cFTjEg8gxw/nlMyQTpGA8/TLaV5X/hbivfuZ1gw768Ly5hJfCa879OCoylXbSKTp4zMZ
         UqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783505494; x=1784110294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOJ3Pf0iHZgowhFyY91dPG9CWszSETz0W72ezmzqxqc=;
        b=faDp09QnLBTFzSmAqnNM5v7+oFAvAv6eoty7WjuZVAYcmCD5gAQWW2Vt/HkgDGr8Uh
         kMy6vdWOXQ1XekR4bZBcEwsoKeMO1zI38ULyXnVFdDcn5MHH0mUBPx8w+T4qJ8fN0wja
         CtJRS9DeZHaZUbQLbYphVudmP60lfX/E/UdX7VLR7GWMmqUGt3bZKJO2ivIVW/eifFfY
         lB6PkWhyuQVl9AfMypmcBa6urJhKCiSKndXbANTYUGCkFAf6LGKI9ckyHw1qn7IZ70UI
         7WW950VD12QCJkn7GUBK9/6taXPbecY2SykEWu5BuLA7sfM6yX3GHBT3hQeyUSkCoQhJ
         mZ3w==
X-Forwarded-Encrypted: i=1; AHgh+RoPCktPWYTeSjI78FQbfEtuFGoNRNywVl6Stq/d6CnKOrhC33gYPDqGsaJ8E+sqD/skUCao7DU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8RtlZUakupr1ItWgYO33pfUjoFCm3QhWmJ21K4H+v39WaQGeb
	MWurkRolJ4nvheOkvf9rS/5ci5WM9c8F2vHTq5NwAlVrg6g672uACDUN
X-Gm-Gg: AfdE7clvPKACwKRH4wcuwUMU29hzc9tjWNyxQKT8GzVGCETwU9q0VS5TLPe95n7VJkK
	5hWcabsDo+WgAJqkfodYySXklwQz0U3zQMx5lG+kHV9jyw6ByA7KMMy5v8hxYVEDgRJm7lOxy8a
	epcZvYCP9A+drHlo3wniDFJft7wY37cdXO6vOGjAb7+kOA1bmv8JlrPoLUO1YtiQah3AVGMmluY
	mLN7hL40zQBpsjY3raIT1Mk8ONGFdMYN49CzcdjCmqXTHnGPpxJR7MDUmltMw79LfwijqSA3bsv
	iRNbjjZl3eeeH3n9LVo5B+QwtKUCLJUuT/uVXojVR08Ts318Q/RD1x+MZjFPtuN8GMRYZtP3Wuw
	b9TF1AlcsQe59QdwUgyWdanjGoISzgVXcECtxVAoIqd/auLwT94xaJCVcPmaLFodQIbEuR0I=
X-Received: by 2002:a17:90b:3c4a:b0:381:21ea:912b with SMTP id 98e67ed59e1d1-3893f693923mr1756304a91.1.1783505494416;
        Wed, 08 Jul 2026 03:11:34 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d17ed52bsm2438172a91.11.2026.07.08.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:11:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] wifi: ath12k: release QMI handle on late init failures
Date: Wed,  8 Jul 2026 18:09:24 +0800
Message-ID: <20260708100924.744386-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031135_598491_92FBBF85 
X-CRM114-Status: GOOD (  12.36  )
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

The change referenced by the Fixes tag makes hardware group creation
skip the device whose ath12k_core_soc_create() failed, and only destroys
devices that were created successfully before it.

That avoids releasing an uninitialized QMI handle when qmi_handle_init()
fails, but it also means that ath12k_qmi_init_service() must clean up any
resources it has already acquired before returning an error.

qmi_handle_init() can succeed before later initialization steps fail. If
the QMI event workqueue allocation fails, or qmi_add_lookup() fails, the
function returns an error without releasing the already initialized QMI
handle. Since the failed device is now skipped by the hardware group
rollback path, that handle is leaked.

Release the QMI handle on those late failure paths and clear ab->qmi.ab
so the failed device is left in the same state as the qmi_handle_init()
failure path.

Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..31e9fa9a62be 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4054,7 +4054,8 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath12k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath12k_err(ab, "failed to allocate workqueue\n");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_release_qmi_handle;
 	}
 
 	INIT_LIST_HEAD(&ab->qmi.event_list);
@@ -4067,9 +4068,15 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	if (ret < 0) {
 		ath12k_warn(ab, "failed to add qmi lookup\n");
 		destroy_workqueue(ab->qmi.event_wq);
-		return ret;
+		goto err_release_qmi_handle;
 	}
 
+	return ret;
+
+err_release_qmi_handle:
+	qmi_handle_release(&ab->qmi.handle);
+	ab->qmi.ab = NULL;
+
 	return ret;
 }
 
-- 
2.43.0


