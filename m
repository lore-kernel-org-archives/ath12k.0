Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691AFC02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dy1qfD5UTtYECRWWfOe+C5t/d7dowdD7s3GDIHnLHoQ=; b=zJOPVv/ndr2yuKJnKkRWAcBUbA
	YH8r6aZuKpjnstgTVUaJEWb5BY0+N6jCStr5XBq3azayueGXSWY91L6bn9RaKveVg2Taq9Eg4TX3f
	JQFZffzoEvZIFsM4xgexuu7GVZiuLjEEOaUAZxgptwDuNUedsEoCZGA3MmBvx62eJeZKH03Kp84sX
	gR+eil817WY1G/DXQ+FmFTA9MYKwE5sgQb1KJp9zNUobjVqzMNMT/YRc6PPISvFM3CUUdqI5y+7Cj
	jQSUHXBOrSwa6r+1Ak/L5OSNLMHjORFEgNVtc9+OuvUtGAcIbrDcISvvxtVltiv/Ropxi13VtDzws
	YEMCeMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMi-000000012Ix-0I4L
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMe-000000012Gs-2jTT
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5148WtKE011051
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dy1qfD5UTtYECRWWfOe+C5t/d7dowdD7s3GDIHnLHoQ=; b=U1Rkyp/qYcYNhlZp
	61yYNEsgKgyZNJlBZKkc7bLr15tOwtsLk8mrsb9AfaK8u6IzJvGZYYygcJFW+Gtg
	GD3Ffj386mswCWWyqD71fw0rvXmIb+6YdNNhoREaDgNN1RcwneZlcQ52IW4szNxI
	SfcZLGKY5Fv3AaNg6N+0jOr9mkkmAp973+rjqsb+xALTLF5K9/CoV745KckUxXJN
	EE1BxpPy8qN3153u5+3V3DTkqyJBbMC362V8fZdf84RCb0zkRRlmpFygRJNc2re/
	AJcrh2Bx1izphcGBtKOd9m9UBHgyidR96/qayblSsuu5avEsNxxQsBRVyYCO6guU
	MekNKA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kffnh8ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f09fa389fso11697635ad.1
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688731; x=1739293531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dy1qfD5UTtYECRWWfOe+C5t/d7dowdD7s3GDIHnLHoQ=;
        b=lFzBaRIXPKAKSBLAM2S0Tcj4MDAPv735gKMx6mD+5e0BzPvz2gsWgxJlQOtT/DBUtX
         0ZpLsFspTlyN8YXXkzYXj5oDvYwi8iiAMG1Jl/Cfm3CpWViQH71v93+5PSB96jZ8As6M
         ybEFrWTaSZ9Llo38QUF4Oo2WzZ54L6pX2ERFAHhIL7AFLKkjmPaGRJ6rhSrT5SxEibHV
         t60iRI8Ii9b2gyI5tD5JWMf+9+b+JQZWfx8SoG2FWFaTwrU2Q4l9L0taUs2JBCp5IL2h
         7KphDj/nTaYXRxD0HUw8fl2ylVsS7E39TXkJJoaMzCq+t3EYBI+97OJPX/PVA5b18rvt
         PpFA==
X-Forwarded-Encrypted: i=1; AJvYcCW46BkSu5CAEaziW/pBVhxrusbSmhzPY67SecKPgrcXonKb60ALMX5c1szIwPaY0arNfF/sCgw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDXrWSD2xCuchLctj3eNuSnN1gzT6g+QUsH4c7EWy6LfexlWDr
	2Du973qVQESWdzgVroyMVziebEF9ElXuTyIsAvDkOIDiALiNrNu7TL/Bs/YMTJVCzTNc53WwUW9
	7tXCZPldWoarowPr/khhdogtWaF7ilrbi0KvZyrNBdwFKWt+gvMa6mBQL2s5kT1XToRjK
X-Gm-Gg: ASbGnctNQ6fi/NhDUIPsqgycxsOhJ3ydLsQp8gkQy3Umw8ZpXLDSV7vYNpdqUywTeTa
	jhfKt56rgULzsf8TWi/CK38lAAHDd3EXUhq/WMfimCVJKtrYxd0hery4YWo1/i3XnjNWPD24Xx8
	n4q+2LlBYyOOjj46z4LZPxDXXPf4Hx4d669DKpgfIYGoyW9ou12JVyjeFp08Lq3e/MjJm0iIBWz
	Vi4KqSIT1qjOpTO4KT59KElf7WpUczWEgy/ETq6GUhgo9khraqhzE+CBbFznUEZvTxeTwfA6Dnz
	SzlNk358csuOq75/H88J6fNmfn1hD5r0w5KOKK6EIF+CpA1P9EQ/evnYuLCFpXEDLlyDSe9M35k
	4DgVQofyerRfVp8X0qRq42AdynNB9Mg==
X-Received: by 2002:a05:6a20:c70e:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1edd76c2660mr6105388637.7.1738688730927;
        Tue, 04 Feb 2025 09:05:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVBF367qbEcWZt63Cm8v6f2EmzewOOW3h6qyAO9Qg7zw6MWUQtPT7SGCjw9ouetmj4kRDb1g==
X-Received: by 2002:a05:6a20:c70e:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1edd76c2660mr6105350637.7.1738688730541;
        Tue, 04 Feb 2025 09:05:30 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:30 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:11 +0530
Subject: [PATCH v2 5/8] wifi: ath12k: use arvif instead of link_conf in
 ath12k_mac_set_key()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-5-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 5U4NifDhHW-bCy-GPE2qr5896kWdeLmw
X-Proofpoint-ORIG-GUID: 5U4NifDhHW-bCy-GPE2qr5896kWdeLmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090532_699532_628D4615 
X-CRM114-Status: GOOD (  16.25  )
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

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
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


