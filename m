Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B88D68BEA
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 07:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hmBu8zFR/klecwYr2D2QZWbIrMNrDUPX/mNk79sUoPA=; b=H6ZRXZYhrdXyW8WDui7J4oqSCF
	wYBO2Yd1L114DXsF6JJjc6eBbPbjdILu2xDpHEMLQXuB3OG/mrHwA0wm5hB2z0z7/2mFqsiNKIth8
	l+1BhHOzKVHDDPnleFn0EQUF8qkNI9lzPdcsLmayeIKIuKgCXu1IURaDIXrax6TwjNyeRXfB5BtCX
	c0jF8sAjGwH/o7AbXNsimXTQdTbDOAGTDm8H3AjGl/Xv9Xu0AEXCU1ciIBDOHkaHXsbPhVQ/GUiFk
	X6ENdLBNIvJmH/QaE81n/kcuH/yFQiozudjqICGijaUcmDwWCwKIY7vyvJiWtml9K4ZWWWsHygXgr
	/EiFhgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8gX-00000007yXz-2mIE;
	Thu, 18 Dec 2025 07:44:29 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8gV-00000007yXW-1vb9
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 07:44:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-477632d9326so1815465e9.1
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 23:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766043865; x=1766648665; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmBu8zFR/klecwYr2D2QZWbIrMNrDUPX/mNk79sUoPA=;
        b=cQkmZrq8xy+5LMtesdrkIQ+JCnKaJzFGzei+/Wd+LBv+31gwyRKI/XZa8uM7YV25KS
         z8I4gKE2axZtN1J6rJ1nxxKHOVA0JanCirMxzOGXehJWI+8QJtewBDnwL0CiwWQBeMxE
         RiS7P+8TY+H4+eimnZTTqupGVAHDwPn4M8g1UW0gwRGpXwPOXbfwrBW4LxP8PGrZw3eH
         aAXofAB5Fzon737Iu5vVqvdt9dV7ypIgaMZea7zRyqqByPmq0cPWmYFj81d3T90nx908
         VdLAHR4bU0cuctQSzrGYPQBrl2CW0LR+AbHwu3SLfaQxq3fd9cZ56LiBBSvOhMaJWK94
         Snhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766043865; x=1766648665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmBu8zFR/klecwYr2D2QZWbIrMNrDUPX/mNk79sUoPA=;
        b=sgz8LoXb0bOYF0D0GAAMAoPfk+z2haPHllbvhlcmcl7qCLZw2juSJso0/hPfvMorfJ
         i82dQj8fRl/n9xngkXhasXTHK/k6G20uVQHwlEwqCiCrKZk+Fu7znHj13mMi9BPqMMtJ
         3QcFwGBnIc24wh6oDY6eJG25MGfM82RtUOfYYMJbj+s69vkKAtZlBs3xCoybJVyNRIBp
         ygUQZF72fLExSTG5MX3u++ls+c6O6MS0n88Hc0ByKvKFsbyAqhUOELXjL3Gur5woew8j
         KtpL8yaMrpgmPpdI9+DnsvJOT5T1KBJB5zxshoJ5e/gMVZc1oVTsFj1g++65kc24+b2y
         AKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTTCChy9K3Xd6MgDKrgXe2Ro8rodiNF94lCjFDDH5IFIbx2Qlf8IuNvc3MLWeBPWRMcfTD184=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5/GqPlvzO+r7zOtXk0NLwj24g+LYB4jxovWQkLq0uxGKDm2Dg
	kc/43hotRM9lgnc3avIJAWuILRLR/loIPDD9Cg1g1Hvvc8ml0KBdepXng5UPEg9IJoY=
X-Gm-Gg: AY/fxX7o6syXRbYZupZxdPVkX7p5t5UFHaQhSYW9GEHsYqbLfZkr9AD2CEGZEMFCFvA
	L5e2llWKaV/4mg8H1NBFEeu52RnDISnSvNpJiV0gCnlZ/8EqWpGbbjhLBZY/jcUJU6nbDnJ40zB
	cYvRuDkLoSG8J39sDm0f7EBtPUg92Gq0M8oz8quc10cfLTPB9pKdBQVwRqOa/W+eH2UF3bIuoU+
	UYOFegR8HMftSUrbFTM+3MGO4+9l4cgiUgE2OeCAyQdBzreGCNlLruieqXI7bEqQSgWrRECEkV6
	X7U1rXOCXbyjiy8vt2495ouBQBcVI3QWgUZ2LOtlQr4RIX4pOcDmdhCDPKsv2Nx/8iJHcF1yEtY
	5UZ84V+wRz/VRu7IMy9GVUW9xUUHXejS8mSo9BUASe0gdc+TgH2pBH16IlRzdACTIQKMsRmv3RD
	43HftTwmxvaHNpxi9X
X-Google-Smtp-Source: AGHT+IHeT5UtBHWPRMxU9FR3aTP1+g1lAhxDtBjVewu9mYYmBR2tXxoSh9w6+3wkstsmfDdqt5pgvg==
X-Received: by 2002:a05:600d:14:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-47a8f9a825amr168231755e9.1.1766043864798;
        Wed, 17 Dec 2025 23:44:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm29116925e9.12.2025.12.17.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:44:24 -0800 (PST)
Date: Thu, 18 Dec 2025 10:44:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Ripan Deuri <quic_rdeuri@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Message-ID: <aUOw1J0TU4VgeXj6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_234427_513975_DCD57AA7 
X-CRM114-Status: GOOD (  10.62  )
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

Destroy the rhash_tbl before returning the error code.

Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 9f05eea6695a..ab54c8a84d3e 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1513,7 +1513,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 					HAL_WBM_IDLE_LINK, srng, n_link_desc);
 	if (ret) {
 		ath12k_warn(ab, "failed to setup link desc: %d\n", ret);
-		return ret;
+		goto rhash_destroy;
 	}
 
 	ret = ath12k_dp_cc_init(ab);
-- 
2.51.0


