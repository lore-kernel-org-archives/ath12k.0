Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF6DC369AB
	for <ath12k@archiver.kernel.org>; Fri, 25 Apr 2025 01:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RlA8tRbnOU7B9FL4oicCKzLnllOZdDGh7muFuKJaVEg=; b=IKH/6ycY6xp8X/UT8MTetCqQa1
	9PzGs1BtuwExMyQNEC3rRamxeolc16VAjLoP/5NmzMOxXwH6OIhZKL8sCiqfxMDpvBUhg66OmRmUr
	w/ZcbaBLgeA7E9ZgcEF6cJegCnyF6GxDZTm8IS4/dhnt08DtWHJsDGULqzGBIpmzBavBaf/g2smxN
	qaijQB2Dkuj3grr+eKmAkx3JpSctOL6PbDXdg/ON7Ko7NMW9UIXHqS+CGWO7idH+sHuh6JwkYaXLt
	w/8M+T+IbzGXEFGZ9H7hr8hbxR2GJmQkbearGhaIa6Dkwy0X2PsMiceBqUeBQFLIvAEl7Bom0/+xN
	F1qV6UaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87rX-0000000FhEB-07ss;
	Fri, 25 Apr 2025 01:28:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87rU-0000000FhDn-2tj5
	for ath12k@lists.infradead.org;
	Fri, 25 Apr 2025 01:28:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17NjD002301
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 01:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=RlA8tRbnOU7B
	9FL4oicCKzLnllOZdDGh7muFuKJaVEg=; b=g4gImfD8xYrtDlkA9P4mh7evffMb
	21Nr8VgIMzGP2U9y/PKRSFQXPt2hVt2IF2WMXgaJVVODOIb1d9J7LZ0j7u4sMGIP
	jZiSFpV+9ly0sGsE6SUO0sEmBA2vfVmDtl4NeO/HQM742JU+YDiEVdPA+y/5mPjB
	URAKDlvkMznSwLz8x7r4Fo/aoUVIWTNdEu9XevAuf6q1jGBVvuG3EmsK4wlKyITP
	gnbVpbVs7ZMV4pO73N+Jo6WXZRid1T7rYBjEn/R+gCDpaUxKuBuw1fHlQ1jnShpy
	vENKCdUrUY39YM73+wJwllN3sdM+RGsghfuaEtB8tCseY5eSCFUr94UVJA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy7acs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Apr 2025 01:28:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so2546166a91.3
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 18:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745544493; x=1746149293;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlA8tRbnOU7B9FL4oicCKzLnllOZdDGh7muFuKJaVEg=;
        b=SHQMSmx0fzDZZIZ0CZYkpaEWvSqHcrbYkbO5hErEZq7jio5+MZoSR73zQphgJ9ppp/
         91mWmYj+z/8PVaSmNIz88MqF4AY4z+bF955nMP22gXEOl5NhtOfNuBmrbYHiG4ODzh2n
         e0b9Svp74i/DXp35OVAzs2vHBu6JsUHQhbFIuhEmg5m+Zc8wBrbbdszkixUBlQuCZjMz
         Fu/QeHkTFLG+Dg8kujmA6qnO7L/hggHq9rlL6Ru/hrjM9SOQW5/8H+DaEFm8dAMAwOsB
         Jig6rWrOdTCpjUKmJawXu8eHaZjiRxRpmrHutzKNStyqSxnOl65YE+3nVgCwSaLAcn9o
         GQgw==
X-Gm-Message-State: AOJu0YxE/YGeggV2n3PJ3jrTwcOimHwq0K7YWyvNcwfEFhI0PnYpocLT
	ksQbmQauBqcPG6xXyM7hUac+vu0MRqalCLExR6dwN1nHYfQwX9S50yckJdf8OUUUW8kcMhm1Sem
	Am19oKTnFzU2WKEvDLzDI5ashnDZiD2Nlc/NDQ8A4SnwIXPkZRly3fKEig30BfQ+m0xHD
X-Gm-Gg: ASbGncvQaDymTZO361njOrhiVqcUf3pyTo/WbV7kWMgErlwoSpzANbvpWGo9EN9rj7z
	zHpRS2RX+i6JujPgDn3DggKT/PxbVAKyLB7cbCU7jHZ7gomMcLLUyxGwEFw3ls7btYcA4UF0fEy
	hZU28O3LVjkFqZPM1TjUo+FBzLC1vo0ge11ZO2p86dDQ7OZ+a3xS5R81GD6E20pDjqo8wve2944
	t/zsJZvzidh+uY15Iwe+c4RcTLBQG6AEKk0paWCSI1AEjHESf6fHDifsuvggor/BLm5xAivkgKj
	kIRqfTP+gFSeeKJZx48AzwheLnW4mEGOCF431apOAMpEbTdJ5oI1rDgR1EX4TNs2YgH+CKppeV5
	IuSyJoozrp0pEmVU2wOTJT4TVwg66+M3PZX7YGKPHWCnQxg==
X-Received: by 2002:a17:90b:2d48:b0:309:d115:b5f7 with SMTP id 98e67ed59e1d1-309f7e702b7mr983430a91.24.1745544493312;
        Thu, 24 Apr 2025 18:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDHdbOLbRUs7slkIl9ET+p5e8fC88JyP7k5nDxCQWDICNXG64PQVvmPjBEREcSUhFb4ydyrA==
X-Received: by 2002:a17:90b:2d48:b0:309:d115:b5f7 with SMTP id 98e67ed59e1d1-309f7e702b7mr983407a91.24.1745544492909;
        Thu, 24 Apr 2025 18:28:12 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb1asm2160107a91.7.2025.04.24.18.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 18:28:12 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: Add device dp stats support
Date: Fri, 25 Apr 2025 06:57:59 +0530
Message-Id: <20250425012802.698914-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAwOCBTYWx0ZWRfX61f4Mv/bSpea 8UUzPry3gidwYzIVox+kQSbeG1NkA0jAMOoh38bi8KoXMMYcX+FAQLA3wVWaRem8Y41LUOI1mxJ ejUJ9RCOGfIJFdnbaN91eRX69rA5sdf1w4zhlRxAN9a9whR2OhicSmLqX4XtbJAT0rwalgc/sC+
 gPCIYGmNPkLCHmI2a/0HLTSB5VD2I0xNKjnLD5vJLOxn6fUpHfhu8VYngPYvS8Z/iZYPvOMyfrq e6PmGtPGv761xm9ywG3S8+twAy63TmE5p7JQvcG6zzd/iwagldlGGC9/2poP+UG5DIwK0TMTBUZ QFSpFrCH6b9tpCFMDjVQ8bqzy8pRnQe56d7/BEjwYCzasNnRXjL6bLpcV0HuNdGfTS2tq43++Ss
 6dISmCBYF06r7btbIRiwX7aOFQQ0rUcXbANexZSILU0HyT+f4vMVXfbUgwyCLS9PLkFxG+j+
X-Proofpoint-GUID: 3_bv8O-uAGtRLcYHqt-_hwjayFIlSj3m
X-Proofpoint-ORIG-GUID: 3_bv8O-uAGtRLcYHqt-_hwjayFIlSj3m
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680ae52e cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t5_hsKz-ZbAw1yxjjTUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=985 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_182816_878984_B827805E 
X-CRM114-Status: UNSURE (   8.25  )
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

Add support for data path related device specific stats. This
information helps to debug connectivity and performance issues
in AP, STA, and Mesh modes.

Depends-on:https://lore.kernel.org/all/20250417065237.2507613-1-maharaja.kennadyrajan@oss.qualcomm.com/

Vinith Kumar R (3):
  wifi: ath12k: change soc name to device name
  wifi: ath12k: Add device dp stats support
  wifi: ath12k: print device dp stats in debugfs

 drivers/net/wireless/ath/ath12k/core.c     |   6 +-
 drivers/net/wireless/ath/ath12k/core.h     |  23 ++-
 drivers/net/wireless/ath/ath12k/debugfs.c  | 199 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp.h       |   3 +
 drivers/net/wireless/ath/ath12k/dp_rx.c    |  44 +++--
 drivers/net/wireless/ath/ath12k/dp_tx.c    |  28 ++-
 drivers/net/wireless/ath/ath12k/hal_desc.h |   5 +
 drivers/net/wireless/ath/ath12k/hal_rx.c   |   6 +-
 8 files changed, 272 insertions(+), 42 deletions(-)


base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
prerequisite-patch-id: 0962b21db0b615497d326193d1590f93621936c7
-- 
2.17.1


