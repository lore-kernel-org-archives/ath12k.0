Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC051C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x00RgwEIM9B0L+foEiTohE00SGuLhH++Md440wM3z3g=; b=3WjihJwuopzJ2MY7oQNrrLlxu2
	QiT6YIuzzG0HbkxCb2v+F6ibdq4/XazHPOBq61rpFEiaLoT1vJeRhqFp7Lc5u3Cf9ak+m1ZR3bM3v
	ZPBC/MV2Yqmm6FfdVasftvxBPGutwzLj+CnIJ8EolMx24YI/SXizOcACv8afkKoCb3/Wl20xYa3q1
	2J+G5p3Jj4f32adQEAg0Oh5K4DH919z/sNfuC/aKbTKQWpMwgs1SGMva3J4aoTDeVPQyphR4iHrly
	hvpNHW/vJAVwJCaDHAwq06geoYAj0hVeK7XjABKk3zBlj8x8RutMK69eEj5soeQ9SON4htq7Swv6r
	q9/FKCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATt-0000000HE1W-1qR8
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATr-0000000HE0I-0Ysg
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JlP4G028494
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x00RgwEIM9B0L+foEiTohE00SGuLhH++Md440wM3z3g=; b=LVfYyZu5HFLiu5Md
	r8TOLI+yqZhXRM658SPG76IELfKSm43/ULtNs4vyKsf+qxtBpJFbRNT1DJoj4fwN
	LwryJiZMUPpTo2FZFyNgdqt1Ax0pM2HX7y6qQIgj5LEBQ+rCozXPASQBxVhlCYRV
	Ldojp+Ofb4r9Z863FB+s/HZbCf2lqXIu2kXh4e6vUhed2tllpsvZgegshnOxg8y3
	Oxm2bsdcDI4ovVrrgW0FlZp+SG+6h2efiGAWUMqtdL20TlLkwlvVRODKHyDvHMFc
	nNsJGHwAWifLU7/uV3vJWnqj2wHlkVHa7G8/pQtvlkwIac8LyQC3X46bbM25jhoa
	VjX3jA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k492gvuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:24:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21effaf89d9so12976035ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643050; x=1739247850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x00RgwEIM9B0L+foEiTohE00SGuLhH++Md440wM3z3g=;
        b=ppOZGAZK4Iwy1Wm3VyRQyjwOoo0SE0RTzwoZwCfTSGkq7pTb/wKK/uBpqlqCvVpYk4
         dIirt+goQQFl6XuNc3TMeuKspHQtEcRo30VYmQmQ5mdtuRe+c95V/6RfCFiUeY60mjCq
         3owzBMnuUdL4Bixz4yYl0J+tzzXSUP9vF6cz++RWMqSZQJPS37z8jv2jC/tt3ZcUHHPe
         Z+kDnTh0MxCZHZFZdhKcTT56/ct8bWq34IBp5Z0jjrYH4UybhRypfzAU0/6U6Y4d07AA
         RE/kxuISAE76CpQ4QTmhrZ8GvKHn1L/2jykTMO5e2g8LiQnEGWArDtFjCiphr2qk4f7N
         Rw0g==
X-Forwarded-Encrypted: i=1; AJvYcCVSh2INvXudjQXhx8bIaa5KvZ7FkB1psPIlq7n+ijkWb+3puar48J7CUa9DTlkepD+pkGYqu4Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8by4DgY0MzKl5mhsGO2MVn8tX7ehxiT/EWoyT+/JWoNq3JBi7
	H/WC8B1OGSTMtILXNCS6z454OZAfHSWXDuzT4czg/wXPRviNvtlqpxTlvxcediyqnbt2U6DwEWn
	JQFAuQjoninBGRmQj4NnO+Z7EIgb+S9L2P7noJH67cJ+p9GCrKZbBTRq7M/bFvf9i13dM
X-Gm-Gg: ASbGnctS7jGd0nWp1bxTJcAVHaTGwf4YwyE4FWp44ZD3Y7SjZ8VUGk5AC6d7e0eK4Xf
	24W44mOdme125hC5O1PMjEj9ITNx818+2y69qyfJXVjqTn7BQMYNT1Jaa/cZT4DXkVzYVpckNw8
	b9fK98X0dDY4lXKAFkG8pPUhJfWHnktycJIJj9J81pRxuV6E5N46h4BcXx689wrQWRaWC+1oH9E
	qBKbF2GEmjwsJTvvB0iNN3dTZktdOwNY2VacxSpy3BCGliSmMt6LexJ/HJHVOZEPgu77LZTM1Ui
	HrUz7IG5gTzzgSCVqcO7xBa/OJH+Y/Qj4+oGOhSCb3IPfTZeiV/vLA1pQ9p2Yffx8uBgQeeKcSc
	kY5kLKcQEs65LQa3iwI+qsZmGdavREA==
X-Received: by 2002:a05:6a21:6da5:b0:1e1:dbfd:1fde with SMTP id adf61e73a8af0-1ed7a5e7e38mr38458889637.27.1738643049759;
        Mon, 03 Feb 2025 20:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBA73qDRykSxKVpm1Py5x1Wfon1kxEZVcDUKBFbVikl2vgIOYfg85rf8JTG2O8i3ygGa8zJQ==
X-Received: by 2002:a05:6a21:6da5:b0:1e1:dbfd:1fde with SMTP id adf61e73a8af0-1ed7a5e7e38mr38458862637.27.1738643049381;
        Mon, 03 Feb 2025 20:24:09 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:24:09 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:45 +0530
Subject: [PATCH 5/8] wifi: ath12k: use arvif instead of link_conf in
 ath12k_mac_set_key()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-5-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: z7JAGXHWyJ-nUJMKqSl76RcEouUlhdig
X-Proofpoint-ORIG-GUID: z7JAGXHWyJ-nUJMKqSl76RcEouUlhdig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202411_181888_8A84239D 
X-CRM114-Status: GOOD (  15.65  )
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

Currently, in ath12k_mac_set_key(), if sta is not present, the address is
retrieved from link_conf's bssid or addr member, depending on the interface
type.

When operating as an ML station and during shutdown, link_conf will not be
available. This can result in the following error:

ath12k_pci 0004:01:00.0: unable to access bss link conf in set key for vif AA:BB:CC:DD:EE:FF link 1

The primary purpose of accessing link_conf is to obtain the address for
finding the peer. However, since arvif is always valid in this call, it can
be used instead.

Add change to use arvif instead of link_conf.

A subsequent change will expose this issue but since tear down will give
error, this is included first.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 5f0388002e16c38a834d6c7c6c020b7afa7044f0..db866c1419a613103f119037b19e24b7edaa6c24 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4667,9 +4667,6 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 			      struct ath12k_link_sta *arsta,
 			      struct ieee80211_key_conf *key)
 {
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
-	struct ieee80211_bss_conf *link_conf;
 	struct ieee80211_sta *sta = NULL;
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_peer *peer;
@@ -4686,19 +4683,10 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags))
 		return 1;
 
-	link_conf = ath12k_mac_get_link_bss_conf(arvif);
-	if (!link_conf) {
-		ath12k_warn(ab, "unable to access bss link conf in set key for vif %pM link %u\n",
-			    vif->addr, arvif->link_id);
-		return -ENOLINK;
-	}
-
 	if (sta)
 		peer_addr = arsta->addr;
-	else if (ahvif->vdev_type == WMI_VDEV_TYPE_STA)
-		peer_addr = link_conf->bssid;
 	else
-		peer_addr = link_conf->addr;
+		peer_addr = arvif->bssid;
 
 	key->hw_key_idx = key->keyidx;
 

-- 
2.34.1


