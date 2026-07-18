Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3990C44521
	for <ath12k@archiver.kernel.org>; Sat, 18 Jul 2026 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6FMRb6Ton81+XDkPtgEkIQhf4bCKKZGg7F18DbjTnE=; b=Z7K/f4Ft7rF7vuY72JEqx7R9Ii
	IRl2dGYvt9PKzjCRzkzWf107cRPB5sGiIRVEideA8CvJykJiey2H98sI0WeBUUgiEVrNsnUKC4WV8
	LbdN/CGJYjNAa5IWBaWyq8VW5zsaj4qo1UBwMMvuXDP6Xmd4zw5zqqFaJ+t/PwmcQvrXUgTrMkQuT
	21jcHJyUqF135863jF4/aCyeWD1jtgF03p6x/mKx7bOa/xoO4mthZs/Hhl8UVxbY2c9JkJ+lm72mr
	kv3iWyGsNS0FC8u4Qd4LP1PFQyaCNKE7/TkDLvbWTpy/+vdzkaZGLgYnZQoolpGu0GrdDKDRNqDAg
	NPo+3Juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzjt-00000003qzM-2UGD;
	Sat, 18 Jul 2026 07:45:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzjr-00000003qxt-2Bt1
	for ath12k@lists.infradead.org;
	Sat, 18 Jul 2026 07:45:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ceae1ed204so63045075ad.0
        for <ath12k@lists.infradead.org>; Sat, 18 Jul 2026 00:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784360735; x=1784965535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6FMRb6Ton81+XDkPtgEkIQhf4bCKKZGg7F18DbjTnE=;
        b=sncX0IYPiVw5NR5SWWGN8UqLjon3PexStWieBTYOE8uDX9U3FpBUMOqh6mrS2BPOuW
         MsBt9D7QjnibcyAYvfNouyq9SU8LGRV4z6eQKAgJGSRf39X1blMqQiJg927tkryZV9+d
         7B/1c7K4DsJCL271VC/qHPbR6z7eulzdAmC6J6PTZEeKVI8llTX6pixGBXAQdN7+56At
         vTllykmXdvIHGhIVOXz3R0xqDYCzH7QDuhRSiiaURgvm04zgzxJx2jCGjGp4m3FxkHpL
         QvTcHqVHFG1bJo+ZduD3UsXkwlypvLlBREve6x2CS68ZrOKL2q08mDFukaY/AihCTBWJ
         lsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784360735; x=1784965535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6FMRb6Ton81+XDkPtgEkIQhf4bCKKZGg7F18DbjTnE=;
        b=PP3wNmP+1xqPkTaDZyW98T0/E+F1m8hyEnUK2gjME4DnJHi4mAnArJl6JsEfpX0+vc
         q++DnApb1ELJLh+OPoKymsToRiTki7M6tX+wtYDexqQ0BY+BsSsXnB8POYLdV0K1rI9P
         HWOhRSUV+PDN3766m0BfjUuOSyr2hvqUEdeinKNXS5CAU42CbqGh738kBh8L5PARi6Xz
         v40HqLVUpeu6Qh4nxynngRfzHrrFIcvXvy3Wzg9PxSR+X25mzzJhvohP0EcPSp6Nub4B
         kpJBtdKiSVgwEX5J134PJT154ZK+dBhm7aN93kgnBUPvPbgO8vtOG62GzvwBh7kX12Ma
         C13g==
X-Forwarded-Encrypted: i=1; AHgh+RpZJoduwioAkg4FVBv4HHD6G15UA3QEyuN4LRB3bxwA+HjfofnVV5ktabBfIK31fWX6HBDXG/U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRx9UZ7CBEjSehSqpXFjL8y3B+Ob6oDJI84GxqNytz+AUl9+zd
	1y3GOK2qzO3rVWa3VT75A1lk3iN7eYjP5KEyfUvWznItlU11Q6tIpuYyi62ldnvY371q3Q==
X-Gm-Gg: AfdE7clUAQjsQgAnvI1vM2twP8P2FHr+UdmGjgiHfrFTHvxSFBa5zQhkaV4AU+2aRIn
	iRknRh6/E31KqHSKhyUXxzfc1Xymx6Ph/5iCe87jAu+y/Vhx+iAmAnV0nG2kKROCqqKUAxff3eH
	/DRcZl55+zL4/+kAHSt8Fg9HSyKzrpivmX/mdstaAw15cOw04R53hIkys//DiPPvUftuUt5cx7W
	t6YPZhmEqjH2PUU5x4SPZ1LMB8m/rJYl/ZSZxNRNxgBu1f8wzuSYvw5IqJxZlzceXe/w2JOwra1
	tVRGcMRR5y+aHYdRFzg/dhmisjw8jrt0mVVy6A93372nkIN6ot/b1dJxsAZWjDs90A4DfUy8GRx
	Bs3ktKdWkwGTskHuTWmTF/ck4N5bLQSuI0/WW6hqmHInahcfRrslbhuHW25WIzEC6TPU=
X-Received: by 2002:a17:903:234d:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2cf3499781cmr65687175ad.24.1784360734636;
        Sat, 18 Jul 2026 00:45:34 -0700 (PDT)
Received: from lgs.. ([152.32.188.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm23399685ad.52.2026.07.18.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 00:45:34 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v3 2/2] wifi: ath12k: release QMI handle on late init failures
Date: Sat, 18 Jul 2026 15:40:26 +0800
Message-ID: <20260718074026.3085688-3-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718074026.3085688-1-lgs201920130244@gmail.com>
References: <20260718074026.3085688-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_004535_566938_17669D66 
X-CRM114-Status: GOOD (  10.36  )
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

ath12k_qmi_init_service() initializes the QMI handle before allocating
the QMI event workqueue and registering the service lookup.

If either of these later initialization steps fails, the function
returns without releasing the initialized QMI handle. Since the failed
device is skipped by the hardware group rollback path, the handle is
leaked.

Release the QMI handle on the late failure paths.

ath12k_qmi_deinit_service() uses ab->qmi.ab to determine whether QMI
service initialization completed successfully. Set it only after all
initialization steps succeed.

Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

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


