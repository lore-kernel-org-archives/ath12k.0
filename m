Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D636CC5AE5A
	for <ath12k@archiver.kernel.org>; Wed, 28 Aug 2024 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Cc:
	Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lQM9MIZLBikEi8rsEgQZhLNDSikGXn5E7ngG5ZQC2gk=; b=aMgt5LtEj/rrhE2HXM7JPTcHJy
	qzhsuvL3In8oZCbc40ce65MNOtbfRQphVHrp6adAnTTglSDNVZdByydiF+WC0xv6GjnWTqOFBKquM
	AQlKSqYb20R9wXcT3fhUuGhZHflWlLxRUxNWFIJv8tHVyEGwZ32CzLoOceoZ68zcFespxQa25UPVA
	jkOwCIMQ+IwGBmruv4c3zYJGvP6tcoeZbdECf0oGMe5Szv2PW8KUwUODBYv9LviXq4dEi9yfu1MIm
	lAZ7FZ1PxDe2p1+BKxkmaGLlI11QMWnD/6wgsc3hYtlfrnEeVMCXn8OtYtaywKfEDFQ/oNvZEXb2i
	7NadhPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJHP-0000000Fej4-2Pf8
	for ath12k@archiver.kernel.org;
	Wed, 28 Aug 2024 14:04:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJHM-0000000Feh9-3Eiv
	for ath12k@lists.infradead.org;
	Wed, 28 Aug 2024 14:04:10 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5334c018913so6531131e87.0
        for <ath12k@lists.infradead.org>; Wed, 28 Aug 2024 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724853846; x=1725458646; darn=lists.infradead.org;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQM9MIZLBikEi8rsEgQZhLNDSikGXn5E7ngG5ZQC2gk=;
        b=gyzB5GO3LXCEAsY+/D1TxHCUFfnCFCkXTzoozWCf6NPR8J9IhSTXgkHX+aw8HD6KM0
         KPDognlqHIzMROZP/QFD1eLXxESisFta7HOH5zfGpcY2DzmkWv7lJ3WGyGyjQ9S9SFk1
         WDqZ7U6EGnVQgupFAQ0h/cxjEzoCxsiq1loQHH7A1W/FOAdq7o9M/PGP0/CBJOZ9tu3V
         5kSu8hWLN+Ec/4Tw/pDE8KEJ0VZvkZcxZWJfl50LqHw2h6zZJQbQAHdLDmmCrAbVUcWN
         IgbVmAJ7qC5iPZJ++TzJjdIl1H8QOv43iQv3iw74n7PaBCKsIhZUKo77IEL3sQPhtpku
         yZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853846; x=1725458646;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQM9MIZLBikEi8rsEgQZhLNDSikGXn5E7ngG5ZQC2gk=;
        b=scOCjj99zWcCBKvP/Cc7dVgTvJs3P/OviSAzLOmBpSyMx67ZlCZ4PVLDDpQkUwll4U
         otg8bJ8dtoovNbEH1bOz2zBtpkpRpjS9iNa2gCWHSsKjsWpOS9lqLPSght7+gAj/hRON
         quzFRzgGE1tmn68yzwjUwspsZqUCCjOdug5WFv2gzh7ILQlQiw7xsl5qD2zHudptThIy
         reYLQHPYulYg1yzNb+TWCsIM0HXOV/VtxM/g0EGf1erp2ewtTU4fIBOxYGy/Xu6qIksE
         yIOMBVpyA5kXrkSGN4vjBdb7hgQMuJ+04ZAPQXuOgFj4LJ48yoyKid37nwGTdMV61zuf
         zMxg==
X-Gm-Message-State: AOJu0YyPELd2QcV9gYLhCPsJ3HwTMwi9JM0Sw9UUKYq6ApNvrPVC8CFL
	8FOcf7A9RAoy8o5Q7MppvyQd6BC/3j1aT2hjnPODQ/iuTd5OVuEa6vCMSQ==
X-Google-Smtp-Source: AGHT+IG1zIY2W0UY//oOX6N8Y8EePo8XFBLow6H+HH79MACjTiplR027L2DVYkBgh3texGrLCyVEzA==
X-Received: by 2002:a05:6512:ad2:b0:52c:e3bd:c70b with SMTP id 2adb3069b0e04-5343882e2ecmr10004181e87.1.1724853845264;
        Wed, 28 Aug 2024 07:04:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:0:2100:21ef:6d50:511c:bd79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abea3sm23047875e9.28.2024.08.28.07.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 07:04:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Aug 2024 16:04:04 +0200
Message-Id: <D3RLNOZ847AF.2I0ITYUMJNK52@gmail.com>
Cc: <repk@triplefau.lt>
Subject: Wrong place for rxbaddr/txbaddr to be in struct ath12k_spt_info
From: "Nicolas Escande" <nico.escande@gmail.com>
To: <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_070408_833802_5D82D4CB 
X-CRM114-Status: GOOD (  13.50  )
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

Hi there,

Looking into a problem we have on an ath12k platform at work with a colleag=
ue,
I stumbled upon something that seems weird.

The interresting parts of dh.h:

struct ath12k_spt_info {
	dma_addr_t paddr;
	u64 *vaddr;
	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
};

...

struct ath12k_dp {
	struct ath12k_base *ab;
	...
	struct ath12k_spt_info *spt_info;
	u32 num_spt_pages;
	u32 rx_ppt_base;
	...
};

In dp.c we have ath12k_dp_cc_desc_init that allocs arrays of ath12k_rx_desc=
_info
stores the addresses of the individual desc in each of the spt entries usin=
g
ath12k_dp_cc_get_desc_addr_ptr(), but we also save the address of the whole
array for later cleanup by dp->spt_info->rxbaddr[i] =3D &rx_descs[0];

Surely this is wrong, with the current code we always use the first element=
 of
dp->spt_info to store all the descriptors arrays. And the same goes for txb=
addr.
I mean it works, but we loose memory for no purpose & make this part of the
driver harder to understand.

It should be something like:

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/at=
h/ath12k/dp.c
index 61aa78d8bd8c..ecd3b5c76d26 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1162,7 +1162,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *=
ab)
 	spin_lock_bh(&dp->rx_desc_lock);
=20
 	for (i =3D 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
-		desc_info =3D dp->spt_info->rxbaddr[i];
+		desc_info =3D dp->rxbaddr[i];
=20
 		for (j =3D 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
 			if (!desc_info[j].in_use) {
@@ -1181,11 +1181,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base=
 *ab)
 	}
=20
 	for (i =3D 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
-		if (!dp->spt_info->rxbaddr[i])
+		if (!dp->rxbaddr[i])
 			continue;
=20
-		kfree(dp->spt_info->rxbaddr[i]);
-		dp->spt_info->rxbaddr[i] =3D NULL;
+		kfree(dp->rxbaddr[i]);
+		dp->rxbaddr[i] =3D NULL;
 	}
=20
 	spin_unlock_bh(&dp->rx_desc_lock);
@@ -1220,11 +1220,11 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base=
 *ab)
=20
 		for (i =3D 0; i < ATH12K_TX_SPT_PAGES_PER_POOL; i++) {
 			tx_spt_page =3D i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
-			if (!dp->spt_info->txbaddr[tx_spt_page])
+			if (!dp->txbaddr[tx_spt_page])
 				continue;
=20
-			kfree(dp->spt_info->txbaddr[tx_spt_page]);
-			dp->spt_info->txbaddr[tx_spt_page] =3D NULL;
+			kfree(dp->txbaddr[tx_spt_page]);
+			dp->txbaddr[tx_spt_page] =3D NULL;
 		}
=20
 		spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
@@ -1415,7 +1415,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base =
*ab)
=20
 		ppt_idx =3D ATH12K_RX_SPT_PAGE_OFFSET + i;
 		cookie_ppt_idx =3D dp->rx_ppt_base + ppt_idx;
-		dp->spt_info->rxbaddr[i] =3D &rx_descs[0];
+		dp->rxbaddr[i] =3D &rx_descs[0];
=20
 		for (j =3D 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
 			rx_descs[j].cookie =3D ath12k_dp_cc_cookie_gen(cookie_ppt_idx, j);
@@ -1445,7 +1445,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base =
*ab)
 			tx_spt_page =3D i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
 			ppt_idx =3D ATH12K_TX_SPT_PAGE_OFFSET + tx_spt_page;
=20
-			dp->spt_info->txbaddr[tx_spt_page] =3D &tx_descs[0];
+			dp->txbaddr[tx_spt_page] =3D &tx_descs[0];
=20
 			for (j =3D 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
 				tx_descs[j].desc_id =3D ath12k_dp_cc_cookie_gen(ppt_idx, j);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/at=
h/ath12k/dp.h
index b77497c14ac4..28c8bf22810c 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -300,8 +300,6 @@ struct ath12k_tx_desc_info {
 struct ath12k_spt_info {
 	dma_addr_t paddr;
 	u64 *vaddr;
-	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
-	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
 };
=20
 struct ath12k_reo_queue_ref {
@@ -352,6 +350,8 @@ struct ath12k_dp {
 	struct ath12k_spt_info *spt_info;
 	u32 num_spt_pages;
 	u32 rx_ppt_base;
+	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
+	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
 	struct list_head rx_desc_free_list;
 	/* protects the free desc list */
 	spinlock_t rx_desc_lock;

Right ?

