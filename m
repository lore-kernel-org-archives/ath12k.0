Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9B0C52D7C
	for <ath12k@archiver.kernel.org>; Fri, 23 Aug 2024 15:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yoQlQBMoaeviEeMYROWWIq7igQUTvyq0IdAXsNASGJk=; b=nmIjFvEa8PxXJTcmOG5c/USJ9o
	GvjQtdr0LmBEOESebj+FHrb7hADg6/O+ytP0mu54NUlQ9pjoUY0cJJSQAVwsRcwr7HNd8JzdDhH3p
	0OedBlCsqaxpBC5GXiLyJVHjV7MemVhC6/az3VXsOURvc1GBdQA1+X3ULxc5/VzUkX3Q1CqLPMNvG
	jEAdie/zZV/uWOCNtmUj1G5Xl5vhaSXRAvP1O5i/Z4tDelog/jfJlEvjDB2u+xd0tsNetBTtL/wR3
	JmknxoiFHvEzomfmzpZ/iv8/gW+lrCZr8EGnnvraPOh48O7ZXjhcFukX5VqOYk0TiY1t/awcoONKT
	qPBOh/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWdA-0000000HPs1-1k4y
	for ath12k@archiver.kernel.org;
	Fri, 23 Aug 2024 15:55:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWd7-0000000HPpj-2rVn
	for ath12k@lists.infradead.org;
	Fri, 23 Aug 2024 15:55:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-201e64607a5so15761895ad.2
        for <ath12k@lists.infradead.org>; Fri, 23 Aug 2024 08:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428511; x=1725033311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yoQlQBMoaeviEeMYROWWIq7igQUTvyq0IdAXsNASGJk=;
        b=eh77C6qNSrf9Yl481hNwkYHj7Ksul9PE31cWKNKRWjh6wv8VXgYzVIWRUr4FjLV0ai
         wyPBJt5KxG6795Ch5DX9vUOYKqgTLBoxOHW3KVG9m0+R2aFTQtmWeEasgM6OwfomRFfi
         9Xc468UkXTrxTh3Uc8+UhW1Sx8IiN2YypRG31/Qlh829djCfC4G3r7lluemP9brL50zd
         DCM6+NpJIP1n72Yjr8hgWmCS9DXPrOzfTMAT5HGaTWd8rwgtmxEpaeFgNa/LJRKLdvb9
         VbM/EMlBxwHVa8CXlmYiO1x2mxIpCSpZWPLoY1q3oebQgJzNXzem28mJBwrWH9zWd0Ng
         H9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428511; x=1725033311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoQlQBMoaeviEeMYROWWIq7igQUTvyq0IdAXsNASGJk=;
        b=o0vS2B/xHkkRj6AYHzFwGF+YoN3JBADuWlSVKQsOOCTVmyHF0YeckCktJUtK1gJPhQ
         jl0xvVe6z3ixQjAOTPEUQE9xX4T4znTeC+KOZkusYN2gUedXs2jHPWkgeoLMXv9WqHCW
         nCKt96z7W30FFb4MlWmyHmWYJ5h0UMD6N1SaiTI1fHBokk7iR6tzorvExdTOj164XONA
         8amA88ZXQbGeXyg1x2UKyPuubhU4y4fBBq7CmemDXWwmTCaqTAi66999iHVLVRidUEXc
         rP+w0elDuyccIHtvHMP6xioxZWjR9Y/RyXCrgNXuCDs4n0xJKW4gG8AoXfslB7udpPmv
         Vyug==
X-Forwarded-Encrypted: i=1; AJvYcCWwfYErjP9EB9bIVIvRVHNUEtBJydgzi/2jJy0/Ov4wHbRXazLSlGeozPL81cSm0W8vyArr2h8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxF365CxODCxZxm/aR1LafXRFNTTJwbpe/J9EQyY6mKHbFeEjEs
	gJTStEkBByHE7I2LXSsDvA/TzbXNagnDrfKYirsopp/3+pI7nqB8hAekOeExGA==
X-Google-Smtp-Source: AGHT+IGPvpbEUE4s6S0SbLzYR3UkuZy6wS2mnTCLAnr60KIk0mleIYxhMcsNyazUGiMqKU064D+TrQ==
X-Received: by 2002:a17:902:e741:b0:201:f2bc:7789 with SMTP id d9443c01a7336-2039e52c2aamr32196235ad.60.1724428511406;
        Fri, 23 Aug 2024 08:55:11 -0700 (PDT)
Received: from localhost.localdomain ([120.60.50.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556649bsm29824005ad.49.2024.08.23.08.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:55:11 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kvalo@kernel.org,
	jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] wifi: ath11k/ath12k: Set IRQ affinity hint after requesting all shared IRQs
Date: Fri, 23 Aug 2024 21:24:59 +0530
Message-Id: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085513_753774_53E4987D 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi,

This series fixes a warning from kernel IRQ core that gets triggered in the
error path of QCA6390 probe. While fixing that I also noticed the same issue in
the ath12k driver, so added an untested patch for the same.

Finally, I updated the irq_set_affinity_hint() API in both drivers as it was
depercated.

- Mani

Manivannan Sadhasivam (3):
  wifi: ath11k: Set IRQ affinity hint after requesting all shared IRQs
  wifi: ath12k: Set IRQ affinity hint after requesting all shared IRQs
  wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with
    irq_set_affinity_and_hint()

 drivers/net/wireless/ath/ath11k/pci.c | 26 +++++++++++++-------------
 drivers/net/wireless/ath/ath12k/pci.c | 26 +++++++++++++-------------
 2 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.25.1


