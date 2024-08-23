Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727C0C531DC
	for <ath12k@archiver.kernel.org>; Fri, 23 Aug 2024 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6OlRtyM144d7+hDbDg/Ar+tRLxHvv6vXiCYuDqqU2U=; b=3SuybO5un5P6iSllU6pgdVFBy4
	8Tzo54glUWw7QO3oG3guEmIP4WuTFTPeUAUZhs6XgzBbyP3orNFHgcJ8SMLaDO5kskXADxcJvUyaE
	rGHhJ05Hav7gs8aqgLuwzIYyeVLjjXlqYo/PDlG1MBnsMEVnlcmuQBboW4YtQbyNm0XdqrM4iV+Ir
	M6z32nfEarPHCnvl57mwInuXo4c1MVEQvipj56EatX+Kn2Q/OYlU6u1NGiLgpmS+HcY76PqZTEUXJ
	3ZBmGZlQw8AV3nDtVLga19Q2YKD8oTceuHYZtzhl8kER1w/O4CskhptqGeQ8yw9JkmcTHamZpuIW5
	rZwUoL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWdG-0000000HPvl-0amW
	for ath12k@archiver.kernel.org;
	Fri, 23 Aug 2024 15:55:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWdC-0000000HPsh-1GDw
	for ath12k@lists.infradead.org;
	Fri, 23 Aug 2024 15:55:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-201ed196debso19731935ad.1
        for <ath12k@lists.infradead.org>; Fri, 23 Aug 2024 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428516; x=1725033316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6OlRtyM144d7+hDbDg/Ar+tRLxHvv6vXiCYuDqqU2U=;
        b=DxATwzf53YfKqIUjI70I3sOPiInidZRK71CLPUnq6/2e1jhLTzLQ6jaTRcNzQPo3PT
         W09AhOQlflMrXACRAARF/34TLhim2Xb23ileAfGHRGmTAW4BeFTVROfTwaGM2OyCkGi4
         GdwpMKCPuLn/7MZ8SFrdV7l9tRsaw5Kri68VJEX3LAYkSqs2H3DNr4s8Z9Qy+NWt63mf
         C0z9S/oKf+zXfd5adTsKsLvyzwDE8sCeT1A2WWYxxO0LCX+8g27TrgPTBVoGJ8WJYIrW
         QVH6XA5KFmzp9oFPnnSzVJkXFYmw3sAXyOXiqzmmg6uHvXbz98dCo07stTHypqNN4UXR
         F02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428516; x=1725033316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6OlRtyM144d7+hDbDg/Ar+tRLxHvv6vXiCYuDqqU2U=;
        b=Ni6lK5hylcYvZxiBWhmiwTja1HGAKIB8W3PiBvnT8YYNM8hDaG5dHMD4VLc4qjoH/Z
         A4xPjsM5zWOTv56ZOEWaBVahf7knsk7Ysj1XpoZIS8ZEx89n5+MCqQPApDWcHD0OP1rE
         a+xbZ0yDE3wUqPKJpBiH9qJpq6c+uAQSoq5h0rABL20GC8NMQn9H7II1sN11yGGk0zTV
         gi/MhnUQxE1FdqDEnpdPaMsPqfZu7AWDFL5IqsOFpEbuoH8JaM/tDL8hLo2XZlR5TDSg
         aDa5BHfPHZhgZGQ9IyAzrALDWN9advjE5HeQQqhFDj+z8gaOpNevLh+BvIJjtOewGb38
         k/2g==
X-Forwarded-Encrypted: i=1; AJvYcCXcD2ylkahzCxW8mg/GytUwyc19iPR0qe3T717mple73cbDUhUraAcJsx+23+x+npDJeqoA1iY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuH9qX1nmP3faj45mDPVXOyGBW9Y4FjFYL3Eto5/0WzkOT3r8n
	AWStwHAZABJmGIz5Q5hu8HbovDxFyvs9OBxXl50wad46ocuOgicZH79w8D7W0A==
X-Google-Smtp-Source: AGHT+IHU9XYQVlwdi75xAtVt2K4NPPU34/rpoSBNw0HOQIYbBIP/tEV3woHJzuCA/9MOnobrbzXezA==
X-Received: by 2002:a17:903:244b:b0:203:a0c6:91e5 with SMTP id d9443c01a7336-203a0c691femr20981215ad.51.1724428516533;
        Fri, 23 Aug 2024 08:55:16 -0700 (PDT)
Received: from localhost.localdomain ([120.60.50.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556649bsm29824005ad.49.2024.08.23.08.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:55:16 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kvalo@kernel.org,
	jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] wifi: ath12k: Set IRQ affinity hint after requesting all shared IRQs
Date: Fri, 23 Aug 2024 21:25:01 +0530
Message-Id: <20240823155502.57333-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085518_522803_0518EE6C 
X-CRM114-Status: GOOD (  15.33  )
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
ath11k_pci_alloc_msi(). This does no harm unless one of the functions
requesting the IRQ fails and attempt to free the IRQ.

This may end up with a warning from the IRQ core that is expecting the
affinity hint to be cleared before freeing the IRQ:

kernel/irq/manage.c:

	/* make sure affinity_hint is cleaned up */
	if (WARN_ON_ONCE(desc->affinity_hint))
		desc->affinity_hint = NULL;

So to fix this, let's set the IRQ affinity hint after requesting all the
shared IRQ. This will make sure that the affinity hint gets cleared in the
error path before freeing the IRQ.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath12k/pci.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 9e0b9e329bda..f265c1b8ce4e 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1446,16 +1446,10 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_pci_msi_free;
 
-	ret = ath12k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
-	if (ret) {
-		ath12k_err(ab, "failed to set irq affinity %d\n", ret);
-		goto err_pci_msi_free;
-	}
-
 	ret = ath12k_mhi_register(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to register mhi: %d\n", ret);
-		goto err_irq_affinity_cleanup;
+		goto err_pci_msi_free;
 	}
 
 	ret = ath12k_hal_srng_init(ab);
@@ -1476,6 +1470,12 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 		goto err_ce_free;
 	}
 
+	ret = ath12k_pci_set_irq_affinity_hint(ab_pci, cpumask_of(0));
+	if (ret) {
+		ath12k_err(ab, "failed to set irq affinity %d\n", ret);
+		goto err_free_irq;
+	}
+
 	/* kernel may allocate a dummy vector before request_irq and
 	 * then allocate a real vector when request_irq is called.
 	 * So get msi_data here again to avoid spurious interrupt
@@ -1484,16 +1484,19 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 	ret = ath12k_pci_config_msi_data(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to config msi_data: %d\n", ret);
-		goto err_free_irq;
+		goto err_irq_affinity_cleanup;
 	}
 
 	ret = ath12k_core_init(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to init core: %d\n", ret);
-		goto err_free_irq;
+		goto err_irq_affinity_cleanup;
 	}
 	return 0;
 
+err_irq_affinity_cleanup:
+	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
+
 err_free_irq:
 	ath12k_pci_free_irq(ab);
 
@@ -1509,9 +1512,6 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 err_pci_msi_free:
 	ath12k_pci_msi_free(ab_pci);
 
-err_irq_affinity_cleanup:
-	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
-
 err_pci_free_region:
 	ath12k_pci_free_region(ab_pci);
 
-- 
2.25.1


