Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C3BC04FFE
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sD2/6sPlr7JEw5uhBN364YYJFLTnmVMqOaL4BzfWeD8=; b=KJoE+JeoaI7WiG7r6kHid7bZHo
	5PJGOkmIj7g9e/2ismWD3ndFNJQ+tmzvS0BhpdrVvIVClrmIKa4+9OkGTZDR0DkmckwybSrJXfe0Y
	joB98AhKeIsq3ctZBGKRhrTil1ALhYRPukFvk0rE33Vy+x8zpZVZw2GXAyqi/zBJljBtCKwMj12U0
	dgEcsf6wvSd/NengFJLebNWzH74AVPflvbWLbQHR1yLKoSdMJB5T7X3fiLwuGkx+FkovNp4L/q9Fd
	rIMtz4JVYdBEN0smc5SKk99719Wgy7AICzmgwGX3w0kKkiB0pE0PmYNwkxnpXTdOVjDeOl+ksspZk
	oguWmgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4e0U-0000000EqTj-35gZ
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 09:54:38 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4e0R-0000000EqSY-1xc3
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 09:54:37 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso4404180e87.1
        for <ath12k@lists.infradead.org>; Wed, 08 May 2024 02:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715162073; x=1715766873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD2/6sPlr7JEw5uhBN364YYJFLTnmVMqOaL4BzfWeD8=;
        b=YXF2txIQqFupXX4bDRW4yWDsrOlDNXJSF67g2zv52pB8k0o7Kk1apNV4iXHSH815JG
         1qoYmRo5Thrb/OXfScls02544hu4W/nT+bUix1mmdcQ+N1DmQM9fsrRJjO7SseJOUoXx
         fKicwFRkPM3FDW9VVol/9HoC4dP7Q250WU+XaAQLRbsKeUds0gH4N/odPuWBiX1qL+hu
         ZQ1Ef14q1pYXYTO7t5pQt2xi69HtwO5CwmVlDF+ePZYZlQeT5RLGY1FCovgTd0w2NMWG
         F5YWiI2hk8iJgXmu6Glf5DwF0EemjXsmuzM+uxVt343kzjBbj7hz3zay8vXnFDizDMem
         3BNg==
X-Forwarded-Encrypted: i=1; AJvYcCUhBdjnpQ4GJYKTcUE3crXY++vvBszw8ZGrDRABFZ92xLmnMkVnKUJm/0ASk2YtIWGIiKJoPaIsS5pqyVD+IP4Glpa+7l0a5KqeNQ==
X-Gm-Message-State: AOJu0YzdagpTtRxTj7B1gxXsAJ3L2I/Nyg7eHBF7O4fPukCxxIheyKJu
	rG9IkTuhbcDyLG6EOO4iAOBsMMbKulCMcG9iBjM8mC7wXiucbL7A
X-Google-Smtp-Source: AGHT+IHmCf5LAkl84GP171Zeb9C+hU+YlcxP1NLnZdtmzr65qLJvoOCAVJfs5QJwFe5Cm/IGPVi37w==
X-Received: by 2002:ac2:5929:0:b0:51d:a1ab:98bc with SMTP id 2adb3069b0e04-5217c3733cfmr1876163e87.2.1715162072909;
        Wed, 08 May 2024 02:54:32 -0700 (PDT)
Received: from localhost (fwdproxy-lla-119.fbsv.net. [2a03:2880:30ff:77::face:b00c])
        by smtp.gmail.com with ESMTPSA id d19-20020a17090648d300b00a5a06effd3fsm379569ejt.221.2024.05.08.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 02:54:32 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: horms@kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
	ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless-next v2] wifi: ath12k: allocate dummy net_device dynamically
Date: Wed,  8 May 2024 02:54:09 -0700
Message-ID: <20240508095410.1923198-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_025435_534069_7B9F2A09 
X-CRM114-Status: GOOD (  15.79  )
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

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changelog:
 v2:
	* Free all the allocated dummy devices if one of them fails to
	  be allocated (in ath12k_pci_ext_irq_config()), as
	  pointed by by Simon Horman.
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +-
 drivers/net/wireless/ath/ath12k/pci.c  | 27 +++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 47dde4401210..6671219c3567 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -146,7 +146,7 @@ struct ath12k_ext_irq_grp {
 	u32 grp_id;
 	u64 timestamp;
 	struct napi_struct napi;
-	struct net_device napi_ndev;
+	struct net_device *napi_ndev;
 };
 
 struct ath12k_smbios_bdf {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 16af046c33d9..ac75e8e3916b 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -350,6 +350,7 @@ static void ath12k_pci_free_ext_irq(struct ath12k_base *ab)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
 		netif_napi_del(&irq_grp->napi);
+		free_netdev(irq_grp->napi_ndev);
 	}
 }
 
@@ -560,8 +561,9 @@ static irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg)
 static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 {
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
-	int i, j, ret, num_vectors = 0;
+	int i, j, n, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0, base_idx;
+	struct ath12k_ext_irq_grp *irq_grp;
 
 	base_idx = ATH12K_PCI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
 	ret = ath12k_pci_get_user_msi_assignment(ab, "DP",
@@ -572,13 +574,18 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 		return ret;
 
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
+		irq_grp = &ab->ext_irq_grp[i];
 		u32 num_irq = 0;
 
 		irq_grp->ab = ab;
 		irq_grp->grp_id = i;
-		init_dummy_netdev(&irq_grp->napi_ndev);
-		netif_napi_add(&irq_grp->napi_ndev, &irq_grp->napi,
+		irq_grp->napi_ndev = alloc_netdev_dummy(0);
+		if (!irq_grp->napi_ndev) {
+			ret = -ENOMEM;
+			goto fail_allocate;
+		}
+
+		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath12k_pci_ext_grp_napi_poll);
 
 		if (ab->hw_params->ring_mask->tx[i] ||
@@ -611,13 +618,23 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 			if (ret) {
 				ath12k_err(ab, "failed request irq %d: %d\n",
 					   vector, ret);
-				return ret;
+				goto fail_request;
 			}
 		}
 		ath12k_pci_ext_grp_disable(irq_grp);
 	}
 
 	return 0;
+
+fail_request:
+	/* i ->napi_ndev was properly allocated. Free it also */
+	i += 1;
+fail_allocate:
+	for (n = 0; n < i; n++) {
+		irq_grp = &ab->ext_irq_grp[n];
+		free_netdev(irq_grp->napi_ndev);
+	}
+	return ret;
 }
 
 static int ath12k_pci_set_irq_affinity_hint(struct ath12k_pci *ab_pci,
-- 
2.43.0


