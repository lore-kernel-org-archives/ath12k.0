Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0453606A31C
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 11:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fvmj/ldH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zCMlejc1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=; b=Fvmj/ldHTNgG7a
	0R5/DNfNo+GpJ2LiAbj3M75eKquVHhScmwgqRGdkONnNHOJS6iShLTAUKeNJ+CBzUpsy+WAEzmcxT
	LMiMvBpOHNe3ObhEnj2hlfb2MQ2yaht7GZ3qmZMUXeB0CYCmdbCU1eKpKPtlCOg6e/QfSYbzOPO4e
	2gLkEcekNp4tDGQTALWSsc4CYrKp8WImv3xJuGrMEJLlWWxfeFQ2McbWZBW2s6kkee/SN1BR5/xrN
	hpZINRkVZEMV9VC72fnX/y6r4FcHuAyjS1UGnjlZvNPNjxQlF/pY+yplSVQ8FgJYSqSsSbSV/azbt
	/SpyiJCQrUDtf4/bR5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSZF-00000009bhn-1mta;
	Thu, 12 Nov 2026 11:02:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSZ5-00000009bdL-3Cvk
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 11:02:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so36147145e9.2
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 03:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481318; x=1795086118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=;
        b=zCMlejc1Hv+hBCZ29mE4/n4AclyLRpzgULcP4zzrAwMqdJ4+PzSfZzI+gYcV+L/Xw4
         z49tGB0z9lPnYlsKMM82ps+ou4DhA6At82KVPP7lMyJHBoyv83VNdzJwonw+QaVAs7SQ
         RCHNGMn682YmyHUIZiw4pZda7KkF6nl8+KuWQFh9phshwlwdUbjq5Okx9U5Qa9DgQ4Zz
         9foyjuRJOqezVhRcviR23fXV/nELSI385dnw6XpepABFYxtuEZM46e5yF5uvTxQgW3tN
         pa5Kvzc9kymzGsRkctJlzxM20e1ttt98n85SZ9TuHiZ8vpbCl/0JlY/8ijn1G+0F/1lc
         ENMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481318; x=1795086118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=;
        b=jN6/LoALqomfr4UVMcYZL3naIjNTCvaTCcYlfJgcS5LnYNeM461kVKqzJYmBn+DhWJ
         jHqt7yYoGqUya1CWuMi5mZ3OQaQGJo0R6jB4OfZpK1NQcveGGa0wgDppQOHrhIfF2Hum
         Wj55GSOk77Wcc1e1U1Sl+xIEg4xhpR/zU0GAukFUIFcnFc3rIeVRsrH0kf/aUDaIuYH4
         3WU4t3SP03zp+5QXC6LFbFu/sZbg8ZaJIXUtFuvk6WYZURWPVaLPBo0XcRFE5IIj+Lwt
         N2Vo7c8yj0zEvJlspCD0XPxxC167tLhLl0mq+jQ8JiZDziXGV4gYb8q3W65CDjiK3jW3
         qL5A==
X-Forwarded-Encrypted: i=1; AL+hErFriRoRWeRbKNGvKDerP5ltVYAmCR/6qyApy8cUfpUyowl8VaIzRfnPBdR6gLt973Gv0uJ9Mgo=@lists.infradead.org
X-Gm-Message-State: APuU4Z/opxpnCfxskjUvEffskfBMhrzdN2Of58+zIviooX4l5sxp2MtM
	irIQj5FuTkrFek3r7F9Ywym2LiKNYmtpjnrblNCl8u28llxG7pke1+pE
X-Gm-Gg: AYBFou0i4x6amUWEBEfFOoK3rd9wmy26S7sIoKY+jPHm/y3nTgebHwF8sleLIIN9k6J
	UmfEH3icBqH4RHqEm0WiZ4hZu7c2i9jpB4IZpHY7pahehwtrmwhuqVmN8O8SUp87JeljwwEWXVz
	cGElir5R4tT15dvtYJzl1HBMh/qMkqECa5Y0JrJw+xwZ4CphKwgpH4sJQNmTM0fEOqoEXYG8kpi
	CK5KJSPSJRH3tmMw3sQgu3yhSc6HYYadAoWfCjKzPcC+8wYPEZnoBTNJtwPTmoA6u/zzGRNxqO6
	kH1P2yxvVYxT/Y3OOEGuZgkIlEfcMWI+vlx95AhzrKrj5JQ4Sdh2ZJNeXKEJUmBJyj6n3bY1DpP
	e7ioU55yPlI977IIaDKQljuPRWe2Pe3TefmCMMw13gYnj2isRNVbW45j5VYNCZHRkHV1KgC8h6e
	atlE+3LQh9twf98CQUTCMerkyUjO88sruQEWMjiVtsY6FSdFdZy20Wfv+LIA6i/nmWsADiWxJcA
	1O2umQ0stGpalY5DpYosgSRgiPMHlXLNCGC2BKZDf2QsfVKOPEr5ZUEXQdwDpiCkqHbUS+Adp2o
	QO7WjZrvS7yYY72XsvLR5QM0p27Z6+naZyLoeVkdeFVOVsPpHAi4uxOa
X-Received: by 2002:a05:600c:e554:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb534badf0mr5110835e9.33.1794481317703;
        Thu, 12 Nov 2026 03:01:57 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm58579815e9.14.2026.11.12.03.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:01:57 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] wifi: ath12k: unregister the thermal devices of a radio only once
Date: Thu, 12 Nov 2026 13:00:07 +0200
Message-ID: <20261112110008.1229-4-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_030159_903249_70157BFA 
X-CRM114-Status: GOOD (  12.63  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_core_reconfigure_on_crash() calls ath12k_thermal_unregister(),
and the devices are registered again only when the start that follows
reaches ath12k_core_pdev_create(). If it does not, because the firmware
crashes again or the start fails earlier, the next restart unregisters
the devices a second time:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000050
  Workqueue: ath12k_wq ath12k_core_restart [ath12k]
  pc : hwmon_device_unregister+0x24/0x90
  lr : ath12k_thermal_unregister+0x7c/0xf4 [ath12k]
  Call trace:
   hwmon_device_unregister+0x24/0x90 (P)
   ath12k_thermal_unregister+0x7c/0xf4 [ath12k]
   ath12k_core_restart+0x3c/0x210 [ath12k]

Skip the radios that have nothing registered.

Fixes: 151322bccdbd ("wifi: ath12k: add basic hwmon temperature reporting")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
index 97fc49c40ac1..7707ae4eb683 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.c
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -257,7 +257,7 @@ static void ath12k_thermal_cleanup_radio(struct ath12k_base *ab, int i)
 	struct ath12k *ar;
 
 	ar = ab->pdevs[i].ar;
-	if (!ar)
+	if (!ar || !ar->thermal.cdev)
 		return;
 
 	hwmon_device_unregister(ar->thermal.hwmon_dev);
-- 
2.43.0


