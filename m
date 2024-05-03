Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ED5C4345F
	for <ath12k@archiver.kernel.org>; Fri,  3 May 2024 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e8adb3W1BmkNUKKb1fEwqwjiASLtL+TBOu09daXzuP4=; b=L5gk6OnU/FeOr41vkqPsyPY1Rs
	TRLXelcHJKJKY3tFKF9MZ3ABMmSOPFgv8y3/ZYOMhApXsei21LYZCeneoddq1FYOJn0cMvXHIABBG
	4ol3klwxr90/6WQtgl0veXn/s2FD1eNnETQAkHfIj+ltF0IN8wVgcU8MZyItPaPqPymqTgymeagQ5
	WOrr+MAyd9se9RkEveTbgRt1qmrMU4819QyhUa70m3f5d3BfAXRC48T/EJKevcA42XHO7PFK75t7n
	3Jtc/POyTfLqbAucxwdqALyn+feNA+sCeETpLj0D58iY/WUM/UV/7qKn35pqxw9i0WUYU11W5QXAl
	CYYySU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2pmh-0000000Fyce-0uWp
	for ath12k@archiver.kernel.org;
	Fri, 03 May 2024 10:04:55 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2pme-0000000Fybk-2WSF
	for ath12k@lists.infradead.org;
	Fri, 03 May 2024 10:04:54 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a4702457ccbso1332591366b.3
        for <ath12k@lists.infradead.org>; Fri, 03 May 2024 03:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714730690; x=1715335490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8adb3W1BmkNUKKb1fEwqwjiASLtL+TBOu09daXzuP4=;
        b=aCx4KKAZPXtcZ2kZHk5+nYJ4ISXEOspWDU5zNwIoARkCT6sDbptikS9beTATUQSqgX
         Wbl0rNZJClNo+kCt3tH5Z2w+WsT+dkeh/Z501PaFVNwI/gVLzoyTjE+aBFzx8z3Hy8mz
         zneg7P7MBfrmxtlnB5uzTCySImb/BJUzEfQO2mVhvvYwkWc5jMQFypOC5tIkEHEr2jLJ
         IqGRjfMQcCf/4yvQRUXrPg0yRAq2JQNX6aEd4/Im48wLD0+EBgreVYvBdSLjv4vKaRie
         m6SxJ8JlYg3EcW4kZqjV6Rm1QGLW2vcffNctdi/J+dIWVC4h7ycXUZNI/DYd/QwKkiAC
         4EXg==
X-Forwarded-Encrypted: i=1; AJvYcCWL3FljrRG0B2pxoS7cLcRZ0x5UraPX7vKAwnWmJyYRXjB2ih7HHJxgPwZDSq0atHFkz2RIZb/E5DbEhnp5HATjXAGKm+AV1x2SkQ==
X-Gm-Message-State: AOJu0YxZn5/ul7g1Ej3BrJvec78zuYw712ykRyFvT/i2U+A6BVZVLdvx
	SPlHXzJZg38Jxtpe9hsOYxFX/lC+IKLtbE/1jcmdbdqetrBGCWTp
X-Google-Smtp-Source: AGHT+IFPf0CsqCaKdeCEgTGaKjbBlZc73fEjsXVrU0FhdVphBZ6Wbe4pceZhVttNvEkA48TuIAipCg==
X-Received: by 2002:a50:9fa8:0:b0:56e:60d:9b16 with SMTP id c37-20020a509fa8000000b0056e060d9b16mr1350536edf.6.1714730689864;
        Fri, 03 May 2024 03:04:49 -0700 (PDT)
Received: from localhost (fwdproxy-lla-008.fbsv.net. [2a03:2880:30ff:8::face:b00c])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b00572469a7948sm1559882edc.45.2024.05.03.03.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 03:04:49 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
	ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless-next] wifi: ath12k: allocate dummy net_device dynamically
Date: Fri,  3 May 2024 03:04:39 -0700
Message-ID: <20240503100440.6066-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_030452_662314_CBF21953 
X-CRM114-Status: GOOD (  13.55  )
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

Embedding net_device into structures prohibits the usage of flexible
arrays in the net_device structure. For more details, see the discussion
at [1].

Un-embed the net_device from struct ath12k_ext_irq_grp by converting it
into a pointer. Then use the leverage alloc_netdev_dummy() to allocate
the net_device object at ath12k_pci_ext_irq_config().

The free of the device occurs at ath12k_pci_free_ext_irq().

[1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/

This is *very* similar to the same changes in ath11k commit
bca592ead82528b ("wifi: ath11k: allocate dummy net_device dynamically")

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/pci.c  | 14 +++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 97e5a0ccd233..71c67f47d0ad 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -144,7 +144,7 @@ struct ath12k_ext_irq_grp {
 	u32 grp_id;
 	u64 timestamp;
 	struct napi_struct napi;
-	struct net_device napi_ndev;
+	struct net_device *napi_ndev;
 };
 
 struct ath12k_smbios_bdf {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 14954bc05144..322f0ad1b12d 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -350,6 +350,7 @@ static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
 		netif_napi_del(&irq_grp->napi);
+		free_netdev(irq_grp->napi_ndev);
 	}
 }
 
@@ -560,7 +561,7 @@ static irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg)
 static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 {
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
-	int i, j, ret, num_vectors = 0;
+	int i, j, n, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0, base_idx;
 
 	base_idx = ATH12K_PCI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
@@ -577,8 +578,11 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 
 		irq_grp->ab = ab;
 		irq_grp->grp_id = i;
-		init_dummy_netdev(&irq_grp->napi_ndev);
-		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
+		irq_grp->napi_ndev = alloc_netdev_dummy(0);
+		if (!irq_grp->napi_ndev)
+			return -ENOMEM;
+
+		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath12k_pci_ext_grp_napi_poll);
 
 		if (ab->hw_params->ring_mask->tx[i] ||
@@ -611,6 +615,10 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 			if (ret) {
 				ath12k_err(ab, "failed request irq %d: %d\n",
 					   vector, ret);
+				for (n = 0; n <= i; n++) {
+					irq_grp = &ab->ext_irq_grp[n];
+					free_netdev(irq_grp->napi_ndev);
+				}
 				return ret;
 			}
 		}
-- 
2.43.0


