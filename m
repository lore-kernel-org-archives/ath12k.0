Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85F6D1F9C5
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lN1bH/cSXd06vWBgv09b0nbi6rv9Bqx5gJyYzJHnxSE=; b=SIt6T5FvnYc95ljJ+S6ZreOPGN
	g/+z0SwB3UywqXfkYxxlIUUs+zRcOO3TIOI8yaBkmIZyqVu3GQjX8QraHxx/ipAEsFo7qY5yAItuW
	9Whf8UqU/vHoi2UgtxzLiqUrAskpuIeB4rJVMR2dV/UC/kaPtYRHHQQxpe1jvt9v5a+mea1l3M9iW
	qrXPeBN3KNh3lT8UGRlnw6MBixZfey6OtYCU9B9wCVxknBT1IgdmAr+gym09H44xnonda0Hm1kNjJ
	StEfEJ9OrVIuglaD6nAZM8uQEl7arkNpSdGr6u5LpK+vfBms6cmkadukNY/RjmnU0tEuGiRbI2vp7
	rHL6Fcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0nKf-00000009PRE-24m9
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 19:35:49 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0n7g-00000009NVE-1ysm
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 19:22:25 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso3310489e87.2
        for <ath12k@lists.infradead.org>; Tue, 15 Oct 2024 12:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729020141; x=1729624941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lN1bH/cSXd06vWBgv09b0nbi6rv9Bqx5gJyYzJHnxSE=;
        b=M/ephdMtlyIcyLAnokxsRb3gDkZFXaFUgVTCWJfM+F7EZzkUur9+t/UPX+vlgmPvMM
         8hM0U/G+PoXYkCzb9Q973Iiy+QkGTsQwP+88Sfr2UwwJGX7sGzUKk+uz/nSyw8WKZhXD
         tjKGQ034pyc04PRwXcfBKBJY6cr5qJskMl2JcCqLxguTfHvvX2Ptq4nNy1cf8+aIBF/u
         Cd19mNCskpcq9Coc1GGxRyWi3ykh08HprxH28RlfK2Hi64EJy8TqS7Uo/elZPi2CnFuT
         gINdJpfr9RTbUyHmAFEWEeFrxwuxzBPW47nqZQXH0o8bw485Zw/d+F1Rst/FI92QIAPi
         IlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729020141; x=1729624941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN1bH/cSXd06vWBgv09b0nbi6rv9Bqx5gJyYzJHnxSE=;
        b=jhNEqKvo/9PpBqmLEOGQyVtO53Q66o7DcE2leSyXtgzGN3BAj3Mzj/gdNalQGvCxDQ
         kr/2xG/gc1Rs09p6YNq9DpcKmnX6eIMljlulKivG87dXSye1DH+4fyofee7S8U1DlrXk
         mC/O6R+vqw8xo3k9+pysEvy48TAaAPihGw9GxV1IPpcDnH+XQSevCR/n7DHnsl7uJHHX
         DNkVmOy1sXKzGLpAlG5ZmqCVuJxvAaHSyAcR51FP6tBLadbyLO3IuGweXpJUYKLAJNeq
         jdl9Ni+eUA4Z21XPxIHOtntoGREfBXOjvCSD8YMUqotukrIB2LQMzt3qYcig9WozkaIG
         fn/g==
X-Forwarded-Encrypted: i=1; AJvYcCWdRItFDjV6GhtSXtf8hjepyeImbK+EchacowF287Vg7nuS2z3/SCOUtz0gz0jVsk9KT/sZDCs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmdvL3x+/hzwfQh+43c1kanYZ4GVBcRJ/TNSAU7r71Bucx5WGN
	P8bndlgIjrsatsxsLOVpfGrR6GMXPKpUaa92tT/v2xlYHoxI77BX
X-Google-Smtp-Source: AGHT+IFq/iItMESBszKIBLEXDdkFl2SMGGkViVgXD51kYJiMz3z6FTkaSXkqQp9KqMhRnsQCsahyNg==
X-Received: by 2002:a05:6512:280c:b0:52e:7448:e137 with SMTP id 2adb3069b0e04-539e54d77a1mr6547243e87.6.1729020140985;
        Tue, 15 Oct 2024 12:22:20 -0700 (PDT)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4f7f19sm982334a12.23.2024.10.15.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 12:22:19 -0700 (PDT)
From: Karol Przybylski <karprzy7@gmail.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org
Cc: Karol Przybylski <karprzy7@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: Fix for out-of bound access error
Date: Tue, 15 Oct 2024 21:21:55 +0200
Message-Id: <20241015192155.3643363-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_122224_529453_F38F8B64 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Size of array passed to print_array_to_buf_index is decremented by 1

Discovered in coverity scan, CID 1600742

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index b2be7dade79f..74767ba9ec2b 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -1550,7 +1550,7 @@ ath12k_htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, u16 tag_len,
 			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp));
 	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
 					htt_stats_buf->ax_mu_mimo_brpoll,
-					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
+					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS-1, "\n");
 	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger = %u\n",
 			 le32_to_cpu(htt_stats_buf->ax_basic_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_total_trigger = %u\n",
-- 
2.34.1


