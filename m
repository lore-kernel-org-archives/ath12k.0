Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD81C021B8
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 05:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYmnWqCfl4BTw5dpDwtuCHljGqr5uXG7tQyflbiZ1TI=; b=o8PeBnoKL8TJE3Ev89AGY/6BmB
	PQqzI7Y80AEexkW3plJitARJm1kJO+7ZdvwLjQhj6nhmtxzTYcysUzRydeiiAjCTLT5zdokWptjkx
	DKj3V0ve37ARJtr3+HkrzVvZy+3Qqm6bVGRenn3/T7egnB0Fj+jRhaB5x7+hX1K+btxd18AlfAuq/
	dxTNTKfMmIeG7G1UE76Q6PJ8HzfW3FXEeNeksbrmRQ/D3mG5fAbZV3TP1UHx03NR5IeDVgxIv6Vd2
	OzRr9NXM9RcChWD2udWetMUvLjkzoCnG7bT2B+qNQysuyhecyCaN1HmOdZDAbiH+u5YBu4UkNpcTZ
	WneXmTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnaz-0000000G0xB-467v
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 05:35:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnax-0000000G0uI-1uSb
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 05:35:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-220f4dd756eso107622505ad.3
        for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 21:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740461702; x=1741066502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYmnWqCfl4BTw5dpDwtuCHljGqr5uXG7tQyflbiZ1TI=;
        b=b14wgRUN5fjZBH7AzcNpO2TL+assjFzdRiIoFUGRjVRnewwmIzqodtMsv8zP7BeCDq
         YwtzXxOzpqYmLYslygukDS0/OeVCtt/732ghnklzCIcELyXUAg57wpDYFwEd7ZVfR1Nm
         7q/1J3q3WGIoFqA43nrjWuKZK6r1GmX1ZjxAr+7bancsXvZ0yer2i+4xCPvU5mY72h9m
         Luv6xymEEu0giNqbzvuKBYQCu1+Yw7GViferKmcqJtvbpf6EondXHs7RBLd1IX0xF8l1
         Zf0TCSbr0pvSATtEKjCU8jmkkaIibT1V85Edef1dtjiiaEzBdYVxGYpYUqZkD5wX3BVM
         oMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740461702; x=1741066502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYmnWqCfl4BTw5dpDwtuCHljGqr5uXG7tQyflbiZ1TI=;
        b=tEyCssEwqXPgwghIFhN0BFVlBF8fGWdX2m+aDe6a7l3eOskfQQ5BT30VRBqM9GnAXq
         W0Zw8NU9FyE8FGwcSkh9C9Wg0VgYjEOgXqNpcSgzw7xZ2F68Wx02nF1htX3fdfdaf+Hi
         vRJiVkAWDY3BJLAHQEVe7CzJeHvSe0LxXBmfwJ42mTR4dSDfy/X7oDPE2+ynKGIIlMjf
         s7LN84DT8yc8+8/Pf+aAhmvGm/rnbcYW/B2MdmQUzsnQgao3+495Silm0nsXd/1upwry
         c6zMKq6MW6/U5vOEyFFGtYUqRyPnhVJlSUQM6jhmZXoO37fqtY4Qyu23/nAC4887IRSh
         3CQw==
X-Forwarded-Encrypted: i=1; AJvYcCUcURbohmHd3nfePf9GeC+uer7EPa1Szfjl1QZilZhEg3o9flSwgw3SfyGFPSykCtJuVWn+XkQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMfTVcvE+kG3AuWBYi9/IQAEg/djQcDOCWmH0hDS+wJd0ZK9CM
	rhrNeeMpTiiCQZzjghK/oO82NE+ugtH3Z7Ne2ZieZh6Uh2a20stHhgC1yxM3gG1KN5678JnBQms
	=
X-Gm-Gg: ASbGnct5T8+nK3pznLonzFziBsRfJDB54474ie9FMcqvFB4qnOHFT9ab7X2P4JGT4Qi
	mcnVo6dodlTaLTxMNA71oVnO33nkSr0VRngVsPu0dq7287lou3Iqw+teEAfeTnQUZsfCbeqaasA
	FjYQW52pr8w7bs7iZ6KlXTcMwFlcJHl2SO2OkBJ3/4mjKu8ukhkik6VRDsuYAo+/LKUpnuQOQWj
	zzA2++3iuRD2Bsas8o/aBIKzdfAHbV3dG1G4BX0KvdCD/q3XpUibroLpnCdGsJyJziQIiyPEA22
	aNCU14uAR4Rz6FRJN9bxS3YeNaxI7bZKc9wJWfYpXCi+zbz4mZECiQ==
X-Google-Smtp-Source: AGHT+IEHljzwJD36eza1aeKcaU2dWlFSTtvnEQrg+fmzOtR5w21SUg7QvbAbtZaZAXH1YQPPhdGwlg==
X-Received: by 2002:a05:6a00:2e9c:b0:730:8526:5db4 with SMTP id d2e1a72fcca58-734790f8cfemr3218117b3a.13.1740461702511;
        Mon, 24 Feb 2025 21:35:02 -0800 (PST)
Received: from localhost.localdomain ([36.255.17.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9af3sm582101b3a.110.2025.02.24.21.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 21:35:02 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/3] wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with irq_set_affinity_and_hint()
Date: Tue, 25 Feb 2025 11:04:47 +0530
Message-Id: <20250225053447.16824-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
References: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_213503_516160_7E6D0970 
X-CRM114-Status: GOOD (  10.13  )
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
index eaac9eabcc70..be2791cd79d5 100644
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
index 2851f6944b86..9883cb2de548 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -646,7 +646,7 @@ static int ath12k_pci_set_irq_affinity_hint(struct ath12k_pci *ab_pci,
 	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
 		return 0;
 
-	return irq_set_affinity_hint(ab_pci->pdev->irq, m);
+	return irq_set_affinity_and_hint(ab_pci->pdev->irq, m);
 }
 
 static int ath12k_pci_config_irq(struct ath12k_base *ab)
-- 
2.25.1


