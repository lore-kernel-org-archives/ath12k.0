Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11C8C369A1
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 11:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WexvrN0iRH6s5lqXIKOGOc76DID+kB8LkmF1Khh6aFg=; b=eqrfbu0+Dh/frFi7UqEcqQMVph
	kgHeyXeDPaWMXWPTPqux0T0Bl2VwWCnwCeeCty641c5KbUoSp2OAB58vkz+wPgANsgpqIUASRHQcQ
	SKRyw+sCrt60Q1wDRpVuotLwRduH44mkJdExBS1TALr/543phQqs+J9a+2KzT00jG8np6Mos3Mdri
	z59YqvLvqwq9Aqt6sS0W0uozxyFbflXngVZNvf+F/QmkAE79Xrvq48cSWc8tfroAMfIIM160mEgKh
	1+T8qdL4RBniRvYjghJuSX0pkzHlXUB1AYOy7SkK8ftndoTfUXbqDm0N8CrzKjByNP5NvA/OUMt4Z
	TglIhtWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TFA-00000006wAU-1JQ6
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 11:05:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TBS-00000006vZA-36hK
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 11:01:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39c2688619bso4090032f8f.1
        for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196488; x=1744801288; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WexvrN0iRH6s5lqXIKOGOc76DID+kB8LkmF1Khh6aFg=;
        b=gL5aCSk7heGTS2NKEcOMiKrtVZ/d8o0cZLJ89B3xDvYrN7BmqNjzMrnaw5ec0KuJPo
         8YZy7Viys9grkCZoe6rwVa/f0CZvpa45tWovgmYj2UuE4+aGTYwQCZaPJfn6Yd54w6b9
         xQj8ZmecoD/fUaLJObpWArqF/RCUVKcU2uN+dVzUD7wYH7ZLMWwSfAnLa590Du7LcUxy
         D9dQ98HZ2w0CBzee1z+D7advucYTogtfazjIwxBcZHd4YkEIzdjmPoZy4JR61gEaPYPh
         zCXLgfzlRjHpCFas/5p202IMxj+EyUnPhGxNz7Z+Pr9nkpoLMrfOsKZKgNgZaQ+yO3LD
         KnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196488; x=1744801288;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WexvrN0iRH6s5lqXIKOGOc76DID+kB8LkmF1Khh6aFg=;
        b=NkM4ap8iTIjfKx/YoYJIgxRigDwyoWPXc9/sDApmJFO97j5k36hv7g3qW6F8o1bd/z
         q8MAffU27QRDYg4pjX84EFdAvPjxC3PB1knvVfNJgVQXHfek6rR9uIH9lUgqoTcnPEt4
         FfGzjirkfFNV/qxSL7LqcfvKyWTWf7nwv4M5C5W6SFWnpZRTHNoOA/G3yHuDXqEPOR+k
         ulfdtSc+dgPuN3JRWbcct8BpIqJ9uRrbEe+bUoMg8PMLdIVR7mW1Cpgp2oSrbxTcOyxQ
         W5CczI5NN200vLFDNX5jQrBrpDLNmLbfLCGjoEVeANisbXLNH1+EQROZ4X/VydEJWIef
         a6zA==
X-Forwarded-Encrypted: i=1; AJvYcCX2undN0MVkFEjWXWQT+KElx2/C+uNJuQezdRkW36VQznI6WKL7QNJz97tdUwIAOxrK1WGqYag=@lists.infradead.org
X-Gm-Message-State: AOJu0YxM3x1nBQQqnb59A4g2XnpRXSBJ9x2aGBKzdu7cgzii+FN8+RIJ
	WMMCqBypgZdBpyeuOQZ4o/kBjPA9zj37i5fmTPdUk6kLwSgrqpCorBasLz5FKVwY9xShJ6i2pa+
	z
X-Gm-Gg: ASbGnct+6RuDOyfiremdtDE749aGtlSXyHCzbonOtOHUqm10VjmAI0nj+XGSkQlKgOn
	MFQ/3mi0rWRwqDHjjwMGcoR4EN9vvsqAs9dgfX3AkvMs/fb7L8zl1ltxNxOsqGuFKmnqNaUdG9f
	gAqNopKkROJQ5twTAU5gUmsXH2A7VUWs6F9nSslTfS3kr5kmeYS84xRuOo9hAKSjnaB0Lfc4TkF
	jFyfVrx9LBDzR+WjUzQqLQ8Fo30IqvsWIvO1XyiTLmG4nuXtIIpRppg3vWRgSsfAZa/A1qaAUFN
	C0Ayd5sIJMZox6FAQWVpXDjotDTL9tCDWG/zS8ydWAceUw==
X-Google-Smtp-Source: AGHT+IF2Njmy6uDcmNjK/vqJ2HttsKJfbdo9EDMtXLQyenYtyEJxAD4fQ/53R944kzDkaZ5HLwroFA==
X-Received: by 2002:a5d:59a8:0:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-39d87aa8ae0mr2409272f8f.5.1744196488617;
        Wed, 09 Apr 2025 04:01:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d8938aac2sm1307492f8f.52.2025.04.09.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:01:28 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:01:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
Message-ID: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_040130_807968_D5C0836C 
X-CRM114-Status: GOOD (  10.11  )
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

If the user tries to write more than 32 bytes then it results in memory
corruption.  Fortunately, this is debugfs so it's limitted to root users.

Fixes: 3f73c24f28b3 ("wifi: ath12k: Add support to enable debugfs_htt_stats")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 1c0d5fa39a8d..aeaf970339d4 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -5377,6 +5377,9 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
 	const int size = 32;
 	int num_args;
 
+	if (count > size)
+		return -EINVAL;
+
 	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.47.2


