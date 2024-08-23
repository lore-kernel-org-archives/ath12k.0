Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4D3C52D7C
	for <ath12k@archiver.kernel.org>; Fri, 23 Aug 2024 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxYL4taGoTZve5PyKphI9oILj7NZymoSkWXTcdSeKf8=; b=V8uq7Mxcinc914wqY9Rjfj2XJu
	xiEOTPbQMZAQTai2rNK2ixATanjTHE3aJncsGwWiiUyTNEhyyH10feH7UIqMtHJrnqPLECgYhlcaZ
	75JF3FGx+S8mfb01fbomogQfVaJ7OEPwS8tP3PhR4Es4mkB8JnKzMySHVAgcFPwaF8e2GleuP5ntd
	v3CoVbGJ/mgcCTPelq+pVujv0KDWiXT3ghL0lMtfIX1c/WNUhvnzMTOUZNjXWeNthiutL0+AY2zRp
	7T7/qtLtq5YU0J7EZ+DiduXGi24aiZM3f+47lyFRFRLPq/m7nEtw0DzDILQZ0Cq8Ni+x9K/PxptmS
	oXNljsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWdH-0000000HPwm-31da
	for ath12k@archiver.kernel.org;
	Fri, 23 Aug 2024 15:55:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWdE-0000000HPuT-3x55
	for ath12k@lists.infradead.org;
	Fri, 23 Aug 2024 15:55:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2020e83eca1so21458315ad.2
        for <ath12k@lists.infradead.org>; Fri, 23 Aug 2024 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428519; x=1725033319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxYL4taGoTZve5PyKphI9oILj7NZymoSkWXTcdSeKf8=;
        b=Fwqbd23kPhJjrnjb1vLeAl37hHy7MC5KJjboDT2Ek/1meCg1m0ZXAfvdkFXaUyjMef
         eQZ8R50tf/KdmlQKqnGjMfes5xtZQD2cK7rjslTuuKsAOGTbM8ytWGpvFWuKk+b5T6SD
         HXe8EYcUyClly8E/beQmxetMoG3rPcboaysCBE30g0/fdI0TFfDY/h+fUuPtZBk8Sj74
         PbMVTF6oaXKf/sxlXQ8qhmbzbdZp8G+FcxfIdkuzeCVLIYdyCo+/73VYJdP0psrxoaZs
         OHaGEB40HlG+GaNvKNqk2ZlEEnPBlngB0d/FW8AGf2l2csf7peQ7NUFAtUOxrtVFF/0Z
         icdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428519; x=1725033319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxYL4taGoTZve5PyKphI9oILj7NZymoSkWXTcdSeKf8=;
        b=K3E6fcVtNPWPjYW8483x2CuMu9WNcw/BBCBsykRZ7DopYVIb5Y+82AoGEkmcgzaLSu
         9UHimhVElJOHBl5K27AW6O0ePuV/hCylLMZCk1nbqRqjPLYKOvqThtDRh/bEqkpvRdpX
         qLCqkaPtj/alfNYxLtWzHCUUTDJdoAncyPrXZ7EC030ugC68TDjBHDRbi2VCBo5+8qme
         0FHeHAC0Um9DyVIVBBsqKE2+lZ7gfLLbtw1hISCJ/SoPr8jo+EiRP7es7yHrcpvtp/ZN
         N6PBDyPCQf2XNnr8UuIK0ZshEsvjliSB1aCBy0Sy0hf05sNW/YOoG7GTPSFZLsQtda9z
         1KSg==
X-Forwarded-Encrypted: i=1; AJvYcCWGs/rbr3Dy80jK7QiwYlHJJITJ+9Eh7njHhveydqCAdpIxdwNMIgAWEY+BeD5A4s/PHdqovKA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yymo3suHpExs3k4Ff+QhbOgvvSIck+X7MAaiAZQZwVj34LGqaE/
	ziRnZy0H3YyWNz91tA5Sy5cdNKWEXQJr0MvxYMbB8cvu88m44ho171YaDGhoqw==
X-Google-Smtp-Source: AGHT+IG0hQCLMJ/jPI8GZvyX9YfaXQ63wg4NOQ3fxNxn6CdaQOyARVZhocSoJ0b7r/Slu5xTXGW1Bw==
X-Received: by 2002:a17:903:40c6:b0:201:d659:4c29 with SMTP id d9443c01a7336-2039e46ce0emr26667785ad.21.1724428519003;
        Fri, 23 Aug 2024 08:55:19 -0700 (PDT)
Received: from localhost.localdomain ([120.60.50.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556649bsm29824005ad.49.2024.08.23.08.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:55:18 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kvalo@kernel.org,
	jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with irq_set_affinity_and_hint()
Date: Fri, 23 Aug 2024 21:25:02 +0530
Message-Id: <20240823155502.57333-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085521_009113_40C64B55 
X-CRM114-Status: UNSURE (   9.73  )
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

irq_set_affinity_hint() API is deprecated now, so let's use the recommended
equivalent irq_set_affinity_and_hint().

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 2 +-
 drivers/net/wireless/ath/ath12k/pci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 0c22e18e65c7..03aa371f0187 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -735,7 +735,7 @@ static int ath11k_pci_set_irq_affinity_hint(struct ath11k_pci *ab_pci,
 	if (test_bit(ATH11K_FLAG_MULTI_MSI_VECTORS, &ab_pci->ab->dev_flags))
 		return 0;
 
-	return irq_set_affinity_hint(ab_pci->pdev->irq, m);
+	return irq_set_affinity_and_hint(ab_pci->pdev->irq, m);
 }
 
 static int ath11k_pci_probe(struct pci_dev *pdev,
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index f265c1b8ce4e..c3fb2886f24b 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -644,7 +644,7 @@ static int ath12k_pci_set_irq_affinity_hint(struct ath12k_pci *ab_pci,
 	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
 		return 0;
 
-	return irq_set_affinity_hint(ab_pci->pdev->irq, m);
+	return irq_set_affinity_and_hint(ab_pci->pdev->irq, m);
 }
 
 static int ath12k_pci_config_irq(struct ath12k_base *ab)
-- 
2.25.1


