Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BED1C021BC
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 05:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6Il8METpmlUQkRbSAgjzH18Gr01cpODvArSkIp0bgs=; b=bfOl30+TaKLz8kwQSeCgmKNyV5
	zqy9MuIG646y4MEcQ42l20c1IV8oOtMtBg5YSAWCc3Y6KFRbE/3QCF786N75YkHncEJVQapaiuBKX
	yNayPIH8Y3nEzKGsSf1OJS71hjzwdaxMYs0p5DYQlQUlZiQXK7fl+g6eKl/HOh/5EYR+EWNCDo9zX
	09uGU44FiaNK5DDBFMcpMH3OHTXrqPMwiLbJX6PnBOT9otIicLvemStkU4xmhA2Ysr4pLunAkPVN3
	NiXLhzRqMUWpI2MQ9yvBWg3QLRhPCsPyC3LsWfNZZORpMT4HOcOAfo31CUiGSax7Mcm7LZvS229J5
	X6vatANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnax-0000000G0vM-3vJh
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 05:35:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnau-0000000G0rm-3VVr
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 05:35:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220f4dd756eso107622005ad.3
        for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 21:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740461700; x=1741066500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6Il8METpmlUQkRbSAgjzH18Gr01cpODvArSkIp0bgs=;
        b=sd6IyXwX85APqWIKIZ42GfoSlx+gI/JuudvOXYXJaZuO8YrAW4hF03m9i59W01gnLh
         UfYzOwl1+kd19oDb72rP8CA6CMqQcASxchfRbxxGe65HjXrvgiIg54/A71YD3bkLj4Au
         UUOrIfOmXdVUG4N1RseOeGowDOsIINFbrCG/u03Xwffha3S5Le+MDXforTddtdXkB0TW
         MYQ1yXTetXJ9c7jX5/cwGb4QQ66RwtcP4hQnR9jyi5oaGIJgotL/C6DCNe15b1SelNeN
         1RQYCJHU+jZXLJ5Q5gRUimJLbmkANDXVJXekPrSia0071CvUKfgm9tuguyfJZRpJOQfm
         bN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740461700; x=1741066500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6Il8METpmlUQkRbSAgjzH18Gr01cpODvArSkIp0bgs=;
        b=E/A0/uNG8+AABxB4D8GZ9M5ZwgSH//nzFHn/Pa+CVvJIxxrG/eCRzGWxrl6KMOgVU4
         LksoqFV9aA3kvYx6KwhXMk9dJ2Us/M3UcOKRhbTNUgOu2ygDGH6NSXyVMwncuw5PNnWf
         4MKyNALjJulndk1DvovXKPNsZqUogYWw1aFkaWr8IT99Lb3AZfpR+ktgD5MhXoJONy5F
         HfUyHXRXYD6kNpPyBnr5umRX+e45KtTd3OBbXHlxX54BzgF6WSEMxyqnt4iDiAdp2tCY
         GRPMA7FnTgaAAEfAkMM+nTuzD4YoyRr/1UofjU31JblQeihbQhxLbXyMfFkEwZb7+Ja8
         jGkw==
X-Forwarded-Encrypted: i=1; AJvYcCXGiQ6YxyO/N/ycNvOHXSDlqzDkx7S7BeU1FUxgJpXyroQzN8x2fLHVYqyIa4D3qPDNsN4DOTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJR7oouO0/tTzB4vBucCiWq4Bfk2mp9XDncoYvtoFIevUE8nRD
	v4HOBOCNXpR/AQPitNiRDYeksyEYjHUpkkXSPp+2/hK6Llm+04Onuu9ag/mRcw==
X-Gm-Gg: ASbGncvxrewKkipa+BdMOvKnSW0KBLTyY+fjVI4JmhyOZFxh7oELXZDzW9qOFGiRQjd
	ABbk4zFzdozjTcyS/gNjci0haD9H+WnIlkyPmTJkYwGK0RCpN+//o6NTlma9Jw4Ra640SnhDVzG
	iM2cxVyQle4XYBzDjmY50eGI+Kwp1OsA5SK2Y15DZCmK4+Rtj/0zQmu0oR8cPAsZK/n6JWXrPx1
	BRDD0/4zee8Cq4f4er7euAMXeVo7A4ktoaXJbbV7ktD/GRdt28Xh0znMoWFCxf9bUR5xdqFSSoy
	/7eQN2HQtq4OoUeBdOXYkPnrfkb4rSe/G9EfN0NmZKnBVxRRx+hW7A==
X-Google-Smtp-Source: AGHT+IGOuK5WVs/FNS54x208S7fpWZaQq234w5cakUj39RKsU7tmbyu7PT7tpCGWSjC4Q4d8G+DFOQ==
X-Received: by 2002:a05:6a20:a103:b0:1ee:de1d:5abc with SMTP id adf61e73a8af0-1f0fc78bfe1mr2892953637.33.1740461700018;
        Mon, 24 Feb 2025 21:35:00 -0800 (PST)
Received: from localhost.localdomain ([36.255.17.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9af3sm582101b3a.110.2025.02.24.21.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 21:34:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/3] wifi: ath12k: Clear affinity hint before calling ath12k_pci_free_irq() in error path
Date: Tue, 25 Feb 2025 11:04:46 +0530
Message-Id: <20250225053447.16824-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
References: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_213500_874855_3362D41E 
X-CRM114-Status: GOOD (  12.58  )
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

If a shared IRQ is used by the driver due to platform limitation, then the
IRQ affinity hint is set right after the allocation of IRQ vectors in
ath12k_pci_msi_alloc(). This does no harm unless one of the functions
requesting the IRQ fails and attempt to free the IRQ.

This may end up with a warning from the IRQ core that is expecting the
affinity hint to be cleared before freeing the IRQ:

kernel/irq/manage.c:

	/* make sure affinity_hint is cleaned up */
	if (WARN_ON_ONCE(desc->affinity_hint))
		desc->affinity_hint = NULL;

So to fix this issue, clear the IRQ affinity hint before calling
ath12k_pci_free_irq() in the error path. The affinity will be cleared once
again further down the error path due to code organization, but that does
no harm.

Fixes: a3012f206d07 ("wifi: ath12k: set IRQ affinity to CPU0 in case of one MSI vector")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath12k/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 06cff3849ab8..2851f6944b86 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1689,6 +1689,8 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 	return 0;
 
 err_free_irq:
+	/* __free_irq() expects the caller to have cleared the affinity hint */
+	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
 	ath12k_pci_free_irq(ab);
 
 err_ce_free:
-- 
2.25.1


