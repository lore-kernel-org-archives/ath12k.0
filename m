Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CACC44508
	for <ath12k@archiver.kernel.org>; Wed, 15 Jul 2026 06:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oeq61mqCq1QhzXC9+NpA6dqzmbivhALns06QC0nTUSk=; b=e+bEIPFC1+ae19rwD0AlL6Bfxk
	08hBfvt9WnjFkLEY7D3XzvdpXBS4/jhsfCyCC1ejBDxRv9cW2ZlhEfHp0qlYL5m8QxPnzmvU6+Xrb
	RZhaNfg9dw3taMbju2zsCD058/3vwpbmiO1XjVixzGAwnTmCJ3Q3ta49B1sUllm3GnIyIqXJBtQHc
	0I3Mekrswz6eqeHG6OkAfVh/K345XkfGrSGYtvCE+sy6+3z+lc2hwmVSCQDpuj7VJU8MpXdq12jh8
	oYvJaHGg5cPcuQ7RpmJm1hLwy4zVCxEg7MZ8/5GGU10yS+5MY8aBK0HFQXjU44syBmWwH9BBGXi0v
	Il+xfLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtIl-0000000DvP4-0bbm;
	Wed, 15 Jul 2026 06:41:03 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtIj-0000000DvNl-0Ef0
	for ath12k@lists.infradead.org;
	Wed, 15 Jul 2026 06:41:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3758887a91.0
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784097660; x=1784702460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeq61mqCq1QhzXC9+NpA6dqzmbivhALns06QC0nTUSk=;
        b=OZAggJa7mwRu0ty26ZTf3UbiAbqgqY1xlogHiMQub3q1Qdi0fzBMNCL+NPamS102Ra
         YhrIwsn81C1IjAD4SbAOroYp/t6CR62DoGz0YNHOpWGU33OlF728A4bX9GOJDMNMuvZH
         dJMbyMjjy9Oj7vsb3cNp2w2py2nZ7DrrvmroK/IocId6FWutm8SktZ6M9yJd/2Q+2H5M
         IjTeJZkYKj4U9DUclkx/YipWv9ePqUT/FMH3Rp7RWhDVLBUeN1GPeEjUyUQ4WYB/WN++
         vho1kghRf+WrL3Qj2Da2BDA7Y9nNjn5Nx2VRXqy6URysuwDVlr5vsq1tvjOdrF4RhoZM
         WMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784097660; x=1784702460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeq61mqCq1QhzXC9+NpA6dqzmbivhALns06QC0nTUSk=;
        b=D0v3TK5xQbZxUjR9L+ybFdoDbv1MmGG1ty5x6DnKK7qdyZ+1OynYnheGL5FMyaPXvO
         CI4b+XaknLw8ZabWALD2p6br+f2per4t09grDBpG+1DvxQ92Cxg9racJWN6DokBoTrzO
         ahWIjBwF+AyA4eHtO+c4nDbdp3L1FvjlTLx3C+DuJ3a6mfXCiApQLLLILQCxiM85uKke
         ZsrVmIW+0AgfyMmAq1tpvkJ9KlYba58tbBgytCSDvmhRnyR9Tmndx8c4mzXh/Un3yhm1
         w5DuGF/8EmWIbOAxZREH8i3NHUHsoWPBVxrQxEidfmPYhZEOtmCFSrPoRxrsxm/8vZ3n
         /z3A==
X-Forwarded-Encrypted: i=1; AHgh+Rpd7NhZHHO+6RUnrfd7jIdE3fwRow3/NxswDWk81IbKxEimSVVXOQ3PCWRPAuqfmiViUwqbLTM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeYAuGcP+qxHhYsBuyELtxiXKLBHY8dWiHkddWoQIMYhFv/E9w
	mTGDdD8LjB0M+MWK8AvflFSRv+z8bEykzWKngut7+AVPra2P+U34vQjf
X-Gm-Gg: AfdE7cmWISR2I8htKipWoVMeTQABzQEJB9cBP01lE8O/dSRZ7/wTanfk1ClXDfgLUeC
	SLyrnX2KDcVbXcQSVR6A1ILy1wy2mTT/Xa6TgyaYciN6x9sfjquZ47JiREmqs4QyuIEM1bCDEx9
	nsMowppkQ0dT+6W8OoFLZE8TYDKRu5g4ujKVnXOwJbDtTejxYkOpVU4qaVQbd8Yvhg41iIZcB/E
	B461EoC8g4WzOEjKraIoT6ls30B13HUi3FckucRAHdfJFBfMfstEWL6vCdnAKzmqNGYW+ZRLozU
	oJXJeyHR9wlqHl64v5Pcl7zBCss2RFRVqmDdWXvM+CQ/KVhJ9GP4uGGou/97L128dHu6PPi5iXR
	v11U4SC7KiIuGEytzbbQxjBkPsXiZJScGxlyS/qEEE5OnZo742vlTWnwIaKzR4iotDxW56qYYg3
	D5zb2wj6s4xw==
X-Received: by 2002:a05:6a21:329d:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3c3573b6069mr5927585637.28.1784097660214;
        Tue, 14 Jul 2026 23:41:00 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm9138269a12.6.2026.07.14.23.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:40:59 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Sriram R <quic_srirrama@quicinc.com>,
	Shashidhar Lakkavalli <slakkavalli@datto.com>,
	Kalle Valo <kvalo@kernel.org>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2] wifi: ath11k/ath12k: release QMI handles on late init failures
Date: Wed, 15 Jul 2026 14:40:42 +0800
Message-ID: <20260715064042.1988288-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_234101_163294_C009FAA5 
X-CRM114-Status: GOOD (  10.33  )
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

ath11k and ath12k initialize their QMI handles before allocating the QMI
event workqueues and registering the service lookups.

If either of these later initialization steps fails, the functions
return without releasing the initialized QMI handles, leaking their
resources.

Release the QMI handles on the late failure paths in both drivers.

ath12k_qmi_deinit_service() uses ab->qmi.ab to determine whether QMI
service initialization completed successfully. Set it only after all
initialization steps succeed. Keep the ath11k assignment unchanged
because ath11k does not use it as an initialization-success guard.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
    as suggested by Baochen Qiang.
  - Fix the same late initialization QMI handle leak in ath11k, as
    suggested by Vasanthakumar Thiagarajan.
  - Drop the Reviewed-by tag due to the code changes.

 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
 drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 410a7ee076a0..6e3f82169d24 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3329,7 +3329,8 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath11k_err(ab, "failed to allocate workqueue\n");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_release_qmi_handle;
 	}
 
 	INIT_LIST_HEAD(&ab->qmi.event_list);
@@ -3342,9 +3343,14 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
 		destroy_workqueue(ab->qmi.event_wq);
-		return ret;
+		goto err_release_qmi_handle;
 	}
 
+	return ret;
+
+err_release_qmi_handle:
+	qmi_handle_release(&ab->qmi.handle);
+
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..692f1b2c2031 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4041,7 +4041,6 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 
 	memset(&ab->qmi.target, 0, sizeof(struct target_info));
 	memset(&ab->qmi.target_mem, 0, sizeof(struct target_mem_chunk));
-	ab->qmi.ab = ab;
 
 	ab->qmi.target_mem_mode = ab->target_mem_mode;
 	ret = qmi_handle_init(&ab->qmi.handle, ATH12K_QMI_RESP_LEN_MAX,
@@ -4054,7 +4053,8 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath12k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath12k_err(ab, "failed to allocate workqueue\n");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_release_qmi_handle;
 	}
 
 	INIT_LIST_HEAD(&ab->qmi.event_list);
@@ -4067,9 +4067,16 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	if (ret < 0) {
 		ath12k_warn(ab, "failed to add qmi lookup\n");
 		destroy_workqueue(ab->qmi.event_wq);
-		return ret;
+		goto err_release_qmi_handle;
 	}
 
+	ab->qmi.ab = ab;
+
+	return ret;
+
+err_release_qmi_handle:
+	qmi_handle_release(&ab->qmi.handle);
+
 	return ret;
 }
 
-- 
2.43.0


