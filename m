Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72668C02197
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBnMagGnfmOlAsemSbgdCgpnsrubY8Yw3Y2FnZmojeU=; b=Bbu9FJ2lGbgi/Y1oerlJHxseGl
	Br5YGwkQ+G7jTvfOjnZH/NlQQguOy29hSBJgpkyJ1GCgKs8U9GgHkvKh3ljTKs6MSxuqoeneuM4Rj
	9gpVOoEJQbDrZ6dUP6yFqfP/eOc43apHpeH4wl3GC83UTsUMYyWGWFVeqrq62zToAAxFk4DUwPkk5
	SoadqVgl8orPOAfsrUUWLYaS7d9DT9uvglybcQaEOxujzeBUgNi6fePIsZt+y/8mMfIs/ybqgzt/D
	T9VnqNcAu/2RHKHu04n8dGSTNDW5uBb1z1HtIpqy7RbLV2NEXFHSpj2ryEkLVLBzJQNSzQr3iPpFU
	KDExQFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMc-000000012EE-0Pcl
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMX-000000012CV-1bTC
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5148WO7M010095
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBnMagGnfmOlAsemSbgdCgpnsrubY8Yw3Y2FnZmojeU=; b=molv57UDlDd9WkLo
	8+qC7qFNNgf0wJw6FWgrscoHiGd7NMQM0zYffu+zBU91gM+o+FKpl1/rgRTQkG7J
	7dN5ghgdKcp90NFnsx/LjT/xigoGt2nY8isNfzEcLdg4nnx++RpNLzMnCINKOI6O
	rOPxij9vONyloAgdaT8CtwKmyt1rt2U0RLdEDsYhZaWMcV5kifbpTPYB4wiprEEn
	CiMPfSHJTTgvbcbz7q2iUH9LDkHbsTUVnuTkvv8TadS5s+XT+AN7HfRoYbkajz1q
	vUbr+9Hy1+4/I9hHLvzvSK3/AS9WZDgslcDtFjSFepQy8TAQ1G2YrRugJpYslZsU
	tlf/LQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kffnh8k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f780a3d6e5so11293612a91.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688724; x=1739293524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBnMagGnfmOlAsemSbgdCgpnsrubY8Yw3Y2FnZmojeU=;
        b=PjVE6ANiH2NNeG4OoowbWwhl1BKs9S9+4fFztBDa/u9mfEtAam8fu/VIoJd43oHNwH
         8Ww9FtHzQiLd8c9bb08BdXeqP2YDLeo3SdNdeAYLacihXA6w57Gol5X5oaVhNvXBtc2F
         qcRpsJpZgOA5M+lZbCglP58LuA/HvCS9a3ItXzHz7K2VTk+1Cv37RFqZj6QDuL9tWWRI
         FuEY5DgYdfWMMZOOX/wu0xdQbG3JE4M4mdHise90CMJ9rXT6WQls79ha2xRx8+xgHOZv
         a1TdV6WHuxfPQKP65Rd6augymT63QD80UA3jtCn+2JLPHJTJ7onb+NkGlcLT84yqqDeS
         T8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnyjXdRW65ktaDMSVJJxH5WSCqU4XcpwHd5VOTU6xUXQeYS0GUJV0zeXbPoieSm4lfzmsyof4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxirWPFF3Ls83PYqX5wPpjaBQmgBj6l0SbETKzahr3ALKlwPmen
	nlEK6ZYukItuYVaFdH9wUouVSmrViOzv7DPeXbesEbKQfrYC66FeHituU6O31rPZY7EuG0xbzQh
	DUlF9KU9Re+A3OG03zcbZ/Y4hruVVYzjOdvVZVFPQNC1SOgJV3s59S1QOEN0AxVYUm5CV
X-Gm-Gg: ASbGncuhFRFevstVQadGuqP2itglo5Whb+WWowuOII3x3JlC7I1OtVMs9irdaFertjJ
	FEcdnTSFb39vuCD5QTcPuKVphP8gM28n1BXxFnASn0tdx5QFXTQBIW5eb/7uVkDgxTobGamnW12
	Hy06p0YU78zYO2Ce1N76uRd9fbCbcsN7+QekyxC6lwxkAEc6JTxe4mquxnyugBNAP1l4OISwXbH
	OPPjLma6+Ev6ya6MzVJHRQtBQKjrsUjA42+GcgMtHReXopCxPuhWx0SnCMllXOB3JCZco5gPntn
	A0JYCfaaLO/ccLdKlpdFNd1V9LeigldOmbOFbToT5dn15skkNZq7DnBNusBIxIUl2oNLjRVXkIU
	XLgaL31Ihk5A0WuHg62atiyhKvuZn/Q==
X-Received: by 2002:a05:6a00:b4b:b0:729:1b8f:9645 with SMTP id d2e1a72fcca58-72fd0c7f7camr40884090b3a.24.1738688722382;
        Tue, 04 Feb 2025 09:05:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/o0PDFYKduJ/WFg5MTpCskunjYwzsD7hxpDVDXG2wzp3GnoR6788Fy5nXVsJL9b4i/RBxvg==
X-Received: by 2002:a05:6a00:b4b:b0:729:1b8f:9645 with SMTP id d2e1a72fcca58-72fd0c7f7camr40883896b3a.24.1738688720498;
        Tue, 04 Feb 2025 09:05:20 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:20 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:07 +0530
Subject: [PATCH v2 1/8] wifi: ath12k: eliminate redundant debug mask check
 in ath12k_dbg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-1-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Oc9kGnpJeCJzPagVM1f7cWehUjwO69RK
X-Proofpoint-ORIG-GUID: Oc9kGnpJeCJzPagVM1f7cWehUjwO69RK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090525_435293_D129FFE3 
X-CRM114-Status: GOOD (  17.09  )
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

The current implementation includes a debug mask check both in the macro
expansion and in the function __ath12k_dbg(), which is unnecessary.

Simplify the code by removing the redundant check from the helper function
__ath12k_dbg().

While at this, rename the first argument in macro from ar to ab since the
first argument name in the function __ath12k_dbg() is ab.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debug.c | 5 ++---
 drivers/net/wireless/ath/ath12k/debug.h | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debug.c b/drivers/net/wireless/ath/ath12k/debug.c
index ff6eaeafa092cd12e572430ed0f1c7aa21b78377..fd9796b5ad3b9feea5c7e78e8a88d361049e08df 100644
--- a/drivers/net/wireless/ath/ath12k/debug.c
+++ b/drivers/net/wireless/ath/ath12k/debug.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/vmalloc.h>
@@ -63,8 +63,7 @@ void __ath12k_dbg(struct ath12k_base *ab, enum ath12k_debug_mask mask,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	if (ath12k_debug_mask & mask)
-		dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
+	dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
 
 	/* TODO: trace log */
 
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index 0aa7c8ccb14ccb9de28a78ca3d2b2a7bf6e481c1..ba0e4da3bb761a49fb81e3efcb61557df8ad1942 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -62,11 +62,11 @@ static inline void ath12k_dbg_dump(struct ath12k_base *ab,
 }
 #endif /* CONFIG_ATH12K_DEBUG */
 
-#define ath12k_dbg(ar, dbg_mask, fmt, ...)			\
+#define ath12k_dbg(ab, dbg_mask, fmt, ...)			\
 do {								\
 	typeof(dbg_mask) mask = (dbg_mask);			\
 	if (ath12k_debug_mask & mask)				\
-		__ath12k_dbg(ar, mask, fmt, ##__VA_ARGS__);	\
+		__ath12k_dbg(ab, mask, fmt, ##__VA_ARGS__);	\
 } while (0)
 
 #endif /* _ATH12K_DEBUG_H_ */

-- 
2.34.1


