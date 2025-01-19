Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7062CC0218A
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 05:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8C0b7AYRgqcY96BugJgxG5W46OpAEDFb3MbuCSajnwM=; b=nsNZybu+72YB6BDjg6n7beQAgJ
	1HVlTR+bT97eOIH0u/NysmtoCzU6iAKR6qO7DnVsvWeoF1Vw+9vsZ4I19J3iNFPJu38j3jt6ckPRv
	iKEExn9cp6Ujv7SdgU143/mzWVMvEy4dHpmCugZPYwphJsEO+iy44uQb4e8Sn0SPXYm7ige1wZIlP
	nhaJn+KMCf3eHBhSgSdajEyBTzioNmg57MzyIfMWKiN4yBB1laRQTvlM54WL3lyUiJEgOTrh9TOiF
	MNK7yCceLMh5ehbafxXYb+HD8/sCALQssOG47Oib+hIgcJK71b6A2qmANkVhougBcxw0B3s6Ui6dQ
	zQf6IM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNmf-00000003QSM-05r4
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 05:23:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNm1-00000003QKj-1LR3
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 05:23:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J5Fh6m009368
	for <ath12k@lists.infradead.org>; Sun, 19 Jan 2025 05:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8C0b7AYRgqc
	Y96BugJgxG5W46OpAEDFb3MbuCSajnwM=; b=EI6FwcuIjMhG8eWZ+ALgxOOKK0I
	tdSpDWmnVGhIxFm18D5sAZY5qYa0JgIPSXuauYlfrIuCVbUZJlw2n7vfNg+sEFSV
	+ncKcEWKD9brIkhJhUblSxWbSve27TFRVezU4egAUmY6kplkmSWfPPikB8/a6uKO
	olcslWz+glHsgvi5xVPGd6cx55oZP0QaVgS23kHpXIkoF/uMSFaWSr7v/0uaZqwx
	lu0gVyXCXbAmZ++0e2hcy9mj6GhM2dB9K+y51ilSNEacAC9MU47fI3KWINFKJsbH
	Z5GoQoMqw9KcgSx0oKLEYKhiuqdKwv4T8DmFKKh1MFv7U/QEA2HD+fLqYFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44852d1gv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 19 Jan 2025 05:23:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so9534887a91.3
        for <ath12k@lists.infradead.org>; Sat, 18 Jan 2025 21:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264180; x=1737868980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C0b7AYRgqcY96BugJgxG5W46OpAEDFb3MbuCSajnwM=;
        b=okQAFi+pwiG64rLNRoKhWbls20ovZi4Ias8hltSqoC2kcZ4OfN7ip9qpC80OklRbGN
         xJ9FYKgHp8WD7jquJmdCkaSBjc3P/ri4oeqkfckbayGg84RoRt/WvKhZ9yTJddz00Jsb
         9n3tk/Mlk69aw1U6/QvOkqRmYEmdc2sBvuN1G5wRGRrLyNfnjsDfCoeX0RvmCCciYqex
         EHhMohVmMJBulhG8ZiIm7KLtApJ0HkaXFTzRIA1wqQzVuuS0Jvw32+Ayq5+TdWgwLEWp
         cH2n3c6HG5xO6CVgeSiVBjC47BNPHidgAUHV8naDkf6RqUSTTZW0yJlt/C6S3WlDLREj
         7uqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk714jdYOqHHOm+pevsbrM0UWerkGJ/B9ZJspo6Eb8NS2PBNnIZIV0q3jSvgNOswezUL+aq9g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxU1QrnPqpEkWHP4r6JRL3cp5O60BfxA3s1Cg1CrWzWIgRzTfNY
	x73xxM5sjdZgxl8aROsits6qBCXhXt3rhuP+Usyj2eeKXvJeVSjshrXocLIGyEyXODMkutIxG5r
	0CtvYbUQjgIreUVLHWiO/kptiiKYTsjpzpkA+p81aR2PTa04Z2E1XdveAoZXo
X-Gm-Gg: ASbGncukxtN9zgyMommfv9qkwVB2xPo8Xg4xz4DkWhqjB17sAt3oMPAiPqayiv6lGvV
	bpumy/SuHvaCBz7bi7SQyAtQi5gKeuWIqb+XZiC8W+8miGymRxitwVr0t+XYtFUTe3Zd3lRICs5
	1OciNmEoOOpTXCwVhQl2/2eGFWWQMsm9vJZopNiKMIOyRPTo4/SCdjPlzScBA5IJCYtWpMBb9EX
	FYetwpvhKzXup2Sg4u5NmM/45n5hs6lWVZxod45PGa90+f5eQs5h0KuBWTN46iGJmsTB9dNHlDy
	zugdmh6UyLjeMSeV/aAovEUfc0cNGn5Yuu0vb1XFyZl6zS/3kg==
X-Received: by 2002:a17:90b:4c06:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2f782d4ed29mr11908732a91.27.1737264179964;
        Sat, 18 Jan 2025 21:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENc7B+HoPGEEKk4Pd69z1iWgwP551nWnln3SXSfO2+MqehG3HMf2oVBJ1VJ8o/QYexWRI+pA==
X-Received: by 2002:a17:90b:4c06:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2f782d4ed29mr11908713a91.27.1737264179645;
        Sat, 18 Jan 2025 21:22:59 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a295sm5062553a91.7.2025.01.18.21.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:22:58 -0800 (PST)
From: aloka.dixit@oss.qualcomm.com
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v2 4/5] wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
Date: Sat, 18 Jan 2025 21:22:49 -0800
Message-Id: <20250119052250.3488343-5-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zPeENzXswe3md6X7kuXBA-9DUFr5yR3f
X-Proofpoint-GUID: zPeENzXswe3md6X7kuXBA-9DUFr5yR3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_212302_561224_E7495DF3 
X-CRM114-Status: GOOD (  13.43  )
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

From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Add new input parameter to ath12k_mac_setup_bcn_tmpl_ema() for
'tx_arvif' as the caller ath12k_mac_setup_bcn_tmpl() already
stores it locally. Avoid duplicate retrieval.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f189ee008226..8a856cc1d801 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1562,13 +1562,13 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 	}
 }
 
-static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
+static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
+					 struct ath12k_link_vif *tx_arvif)
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_wmi_bcn_tmpl_ema_arg ema_args;
 	struct ieee80211_ema_beacons *beacons;
-	struct ath12k_link_vif *tx_arvif;
 	bool nontx_profile_found = false;
 	int ret = 0;
 	u8 i;
@@ -1581,7 +1581,6 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
 							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
@@ -1651,7 +1650,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 			return 0;
 
 		if (link_conf->ema_ap)
-			return ath12k_mac_setup_bcn_tmpl_ema(arvif);
+			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
 	} else {
 		tx_arvif = arvif;
 	}
-- 
2.34.1


