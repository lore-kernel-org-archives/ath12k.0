Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9B7EED60E
	for <ath12k@archiver.kernel.org>; Thu, 12 Sep 2024 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8DvJH9T+GARTJc/xZ32XfwCd/eQ9HgrjmZYLyaD3YQ0=; b=wu1dzepjTC0sO7B7wnxVIFLq6q
	L7iD/GP2TjvSQh8ypoYf8kG1VOJ0xIwzq3EqMRvEvkzQuafcxFmTnJuBFQis5o95gkq3yQwJYXjzq
	2sYcrgQRQdl5dXFlHbqOxn0CwlUJr37zswasMZ+820GEoOqzqLURmp1KZkIs1FcpMTDM53DYreNb0
	EGXekrMmyzybMrXA8HEFZQ9Ry2blPgxie1cjcNAkcaZOGnnl0UjpHjQbO/KDyxRGyR08Txqgcc4PW
	DPCwHGjavzlOn60fTLaT4sIsU7M4iz324gw3uJipdDv6bR2ek6yOrM7ZNYqo1XT0jLT654GO9FKjH
	R7vQ2KJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sol70-0000000DQDR-1To9
	for ath12k@archiver.kernel.org;
	Thu, 12 Sep 2024 14:47:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sol49-0000000DPK9-0VQQ
	for ath12k@lists.infradead.org;
	Thu, 12 Sep 2024 14:45:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso11926545e9.1
        for <ath12k@lists.infradead.org>; Thu, 12 Sep 2024 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726152299; x=1726757099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DvJH9T+GARTJc/xZ32XfwCd/eQ9HgrjmZYLyaD3YQ0=;
        b=kM7+wrHiA4msRp3NxYEg++Fbj0iWIkKln8k4wG1e0sSjxrDXD4XarRgRaQ/F2fggN6
         FGgzEe8yY0DdF8P+s98Oaps3KC084STNF6YeGcxco3GzIOsbKTkE7FY8HL1azLWzSQ3C
         VoyB23NGxj0O6ycBlQjVAC0tBivFZ5I1KL6ktzFtQOef6SFclKYOpoCB5VGa/p405aWx
         CFNWZrDcHpUzq+18pUWkhZt+DKRl/7Gin2zYXJNgjwBsjvjMQEU15e8EIJk2c06KmfBJ
         Qsm85FMLit+J8NpcP/g0eChI0Yd2O4eNasqVSa2xb4hosc4Fu9IKDYMNvfJqetusMFnA
         IQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152299; x=1726757099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DvJH9T+GARTJc/xZ32XfwCd/eQ9HgrjmZYLyaD3YQ0=;
        b=KAVxcHiopyo6C7Jhraa7a6SkUbaQ7of70r66KuehheArhQOGK1i3EEgsPMnGisKUYv
         Z8Nsqf0RWPWYhAQuN/niUzj6wwfkH8U33P/Svb0ft8o08iyQAkyp6bY3i/BePSdAgbcy
         Y5Wyrjkv1ZjhysT3a3iVqnzkGdkWCqLMb32LgxrQP1WuNYeNfBJfuOHkMV4up6GejrBO
         HK8wxbFHetRp7e7HPCDWS6gL8l74xkI3r6PrjOgCs/tOGBEtQcO8W7NEx8czRYn+MjIU
         vo6EIkZF1dTNQqPuqTTmG1TbSU2tqKHSoq5rAUxKW+S5gcSiRxBKHskIR8+VZ4cxtNeH
         jHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk9CBqyybSO3Nst/2SkVcEp0OEk0aZ4pyBDodgRbAI7MJrDmwtnE3XzJgCW1kOLTK6pYgRoVI=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu8ddZS86Md4ROrq9cN2fIQIV6UV+8bF5EtkjEpvSHjFiadktc
	k94bW0qAv3nFzl54Iipu0sR+KrYf6udKSBjsZyyKqdB4Vo0GqJYk
X-Google-Smtp-Source: AGHT+IE7/+KbvjyDtDww2TnU/fgs3cYgIf8LCVqZiRkkY4lpwUWmwI+I9g8/8f4mhbJiYx97aotJCw==
X-Received: by 2002:a05:600c:6b15:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-42cdb673849mr31883895e9.26.1726152298494;
        Thu, 12 Sep 2024 07:44:58 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b7fcsm176962995e9.47.2024.09.12.07.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:44:57 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mac80211: make read-only array svc_id static const
Date: Thu, 12 Sep 2024 15:44:56 +0100
Message-Id: <20240912144456.591494-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_074501_327428_9F894C29 
X-CRM114-Status: GOOD (  10.21  )
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

Don't populate the read-only array svc_id on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 2cd3ff9b0164..190439ad7f23 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7284,9 +7284,11 @@ static int ath12k_connect_pdev_htc_service(struct ath12k_base *ab,
 					   u32 pdev_idx)
 {
 	int status;
-	u32 svc_id[] = { ATH12K_HTC_SVC_ID_WMI_CONTROL,
-			 ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1,
-			 ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC2 };
+	static const u32 svc_id[] = {
+		ATH12K_HTC_SVC_ID_WMI_CONTROL,
+		ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1,
+		ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC2
+	};
 	struct ath12k_htc_svc_conn_req conn_req = {};
 	struct ath12k_htc_svc_conn_resp conn_resp = {};
 
-- 
2.39.2


