Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45A8E77184
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1P1TqEyoALESItQY8HZIv0AXy8Gz40dHfSRpRIHYdo=; b=0/Tm31Ad3WQnVbLjQYiWm9Bv3P
	b1DZwO/mHNZ2UsKZexZSdFxicRL/tZHg5SbmpE8apHxRsHZqSAijikjehiS1mCM9FjE+wShbiutee
	shGW1BOXVW8+daQOByQFb9LvbjGUdZKHZH8gzZnHzUPAxwu7QTwosfyVAsEagzaRlRqU7A7KP6pRc
	A2TTOCaM48hvO/9WMXfsOZXk9PikDnIQ1LMBHXo+pfmyTQ8IgJX+Xljs9DjCitVjGuHJa164jWmIp
	Nu4+JojQ1h2BtOf1FbNyM7XBUutsHjtv8qEC+8is/Aoq26DZ0pDY8et7Oc4nfTDOcXv3kXYX4efEU
	5CAgK4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVEN-0000000DBYv-2Ncg
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 10:55:11 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVEK-0000000DBY3-3bO8
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 10:55:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso4380646f8f.0
        for <ath12k@lists.infradead.org>; Tue, 17 Dec 2024 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734432907; x=1735037707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t1P1TqEyoALESItQY8HZIv0AXy8Gz40dHfSRpRIHYdo=;
        b=dk9MBG9yzJ0hd0F5JhQWaHVXlKPNtL4RbTNkVugXgKxStS+9rqc9A2IXQluZgFu44L
         AchFF09YBY+n8B1F9Y/nJm0mdKTM91Fxvw6GWXZZtkA6RB3qSKrPh8NwmXjxub4qUbdx
         oOotktjz3ypvaskbHpuKUYg1BVgQJJeVJx9WC948zenphWYRcVlL6uiGsVhXJdhC0/Cr
         sbCcSRpfeqvhbBqcOI5SJMp/ZWpyookzOeOBLi88Nbw78eP5IHw0oHUe7aE1cR68hgfD
         8v48Fxfc9KQEROborn8n4wegDLINFlAmHFlnkzDUXmqR+t1S+Z2IsscHmi/Kp+nILrWP
         8mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432907; x=1735037707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1P1TqEyoALESItQY8HZIv0AXy8Gz40dHfSRpRIHYdo=;
        b=KLr6vL3vr3/Fr7iqeekh860l7loyIEEJdI/ElLcCQo9ylYp9dTw8Ir4nubklfJhfCz
         u4Ho3l+B5M3ZCRzs2yUOmsTWf4SmPSbsqZmw6aQ3yo7GvBJvGDiYHFTLMfaX59aLqqv0
         OANos5Gu1s2BlxY7pyTHv0/n/lxN0P71liV4R7GixQLz9gBp8zPfcCl1nBopW6GzVEnV
         1+gMzwhyvDbPJCKDgnep4IqxElvQtEre5NNUAPb15e+ekzWK3gPVur9DUqP/Kt+G7Rty
         nR4BEgIkHfET4jsD/94C2h5D4hWk3tyDsgkqb7MByzsiKm1R61angjHmx2/rDnARB6pc
         oaeg==
X-Forwarded-Encrypted: i=1; AJvYcCVQzR8TQJqpAht1OKtDEXHgTSWjvx9IsYlJR/LkHG1gQqo0f3fMiOSJSsCadXLhy2B02FoDN3I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxN/bKofMeECx5Qz3zmUcF2+NuEHlQNex6IDydcA0zhoQoUctTB
	0h4sOXQPAKOb9BwT6uHGgh8eedfK3exQ1X1zC+nedhs0HnUsi7P/
X-Gm-Gg: ASbGncsDVgxL9WCUu6agAXrKX+CSE2u88IdYPVV2jeCUD8phqniTPa7OSlDrkSSFuX1
	dBzz4cfwVHxC8AKoSpeHyCYBfMHGyWC3VRAWguv8Vy/72gs4sKeJopCavPx55QoupsTGyFayj1S
	2YqJ+zopjbAsd1TpH+1e0ubLALXe8BeEefUYXY3VgLRsnAUNpN2b8umtmaUJDvr/1TKugZJDggJ
	OTE4YfvMaSO4MXYp1BdBFKsZxE3jdWjN1DfA8kdvYl1vORUxpZuRYCr6w==
X-Google-Smtp-Source: AGHT+IEh1D+hUTDqtsK6Q6FnMsXdjFA7vFWK+1wQfH24VH3oPJK5ij9/iIMEiO2NSFyK3gqfjQY0oA==
X-Received: by 2002:a5d:59a6:0:b0:386:381b:6690 with SMTP id ffacd0b85a97d-38880ae152fmr13393915f8f.31.1734432906277;
        Tue, 17 Dec 2024 02:55:06 -0800 (PST)
Received: from localhost ([194.120.133.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c66sm10704706f8f.69.2024.12.17.02.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:55:05 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: ath12k: Fix spelling mistake "requestted" -> "requested"
Date: Tue, 17 Dec 2024 10:55:05 +0000
Message-ID: <20241217105505.306047-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_025508_896633_84B0D914 
X-CRM114-Status: GOOD (  10.45  )
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

There is a spelling mistake in an ath12k_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index a8ed86a294c3..5c3563383fab 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2618,7 +2618,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 	if (!ag->mlo_mem.mlo_mem_size) {
 		ag->mlo_mem.mlo_mem_size = mlo_size;
 	} else if (ag->mlo_mem.mlo_mem_size != mlo_size) {
-		ath12k_err(ab, "QMI MLO memory size error, expected size is %d but requestted size is %d",
+		ath12k_err(ab, "QMI MLO memory size error, expected size is %d but requested size is %d",
 			   ag->mlo_mem.mlo_mem_size, mlo_size);
 		ret = -EINVAL;
 		goto err;
-- 
2.45.2


