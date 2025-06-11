Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C457C71134
	for <ath12k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=; b=4errPwN7FWmTQIC46Th6fxUZjA
	a02RADpmmUNUqJnejnKnShTP6ggTVUpypJjJd8eKT3IK5E2abMSSkaAdnaUaxI2KyLC4o9E+B19uu
	xe5PkZdt0cikJy1/toWVDixJUlAU1xN0K5x4KhXkQb8d7XU3wBxlqjiFRKYdh75AEtnQluNxrIsIH
	jPiA8HkBmQXU0A3skGTe00+yzNVzZV3TZ/Qbe939Yyqf31SeQRTI8S4nAdDfxTW/dfyzhE6A6WZmK
	6Bg+gDlPgVpglIxSH0zFw+b4HNE8efOCA63PyLZE+/yGwFwptgXe8TNJiHfxeHOu5BHwVS/kulCGs
	5u/HnsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYV-0000000B4MM-0NQP;
	Wed, 11 Jun 2025 19:56:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5W-0000000AZBE-3kAn
	for ath12k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9Do6K026638
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=; b=pRSNC7R6l5HnmRsq
	Scnjy8EdxHE1eJmHy9ZUbZAHkX8hC30QotCClFjZ3pNSON3KxyhSz6Oo0+F/24WE
	5r/hzrSpnTcFpocwRCW0w26zWx/n6q9ptqLi9ABqjXZ4R8i+rtzZu8uM9v13astM
	YIxexQdGRM7WMPScyf3oLUwix5uCDdN2pIhqfRtoUFk/i8yNBQuUnTUuvoGtC7rW
	H9sH8oS+0VDXP5mONn5IBw0Ng+gDpkJaX/9alty3gELd7c4145JggGTHAKMyTWXl
	BGqleD2qrXDTtFhVE8Nxi3Sva+otxjR8V2KcTQYF4tTWQUOjyfFN4DR9n6l3HkcN
	fRoN6A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y8edg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7377139d8b1so48917b3a.0
        for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658445; x=1750263245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=;
        b=E7Dp30e0Lc9chChT4J5T2HxCKA3zHOHaPbNIwqoMd3D1XiOWozit4PrGeISX4553En
         il8Oe3Np/WGW4zN0BaB4fbeVyUKwWRrSddvMN7VjCP49tbVC4PUULvIclOMZUZCrPLjh
         13fSHL+2yIegtuNoEsKELqN4gBgf2bGp54LwgQJb7AURt8xQmhlXfUk29LUgaf4WzXBI
         0B/TRsH21pgolGgqtik0eThn9VN81ufhMvkHU4zh1kb7EEUVuqglqJkc1VopzKBriaO3
         6Hxgu5yXyepq9OmC9z1z+OAYn/+m1LAhOmyV4yjfQq95b49VwsBUEYo5lmauU3Ue3Q0M
         auaw==
X-Forwarded-Encrypted: i=1; AJvYcCVKcWGo5a9e8LAcy8Y2XMFtx/EBAK1g/nEx1mhOby7wjkLKjmOjGzyU3HJGwizS7paQxjaI260=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2uOHz+EhHjUt1kN0qJoQQQD2WIc8mpLL8AppYWgWnfzbt0mw1
	b4nPsxnq35KIVJYxMqi/fs09Wqj0hKJ/lSsp/ThekirVtQ47BUjhRpLb+7l/55p+2QmbMGLmHSh
	wHSLNuaM5ssklFZp0EFLtM7Pe843K0XIAdSFyeUP9oVYhR100loSlV3E1B2LsoWfLxMekykly
X-Gm-Gg: ASbGncsSGS44ua+qxxmFeelY0RUAJjNwFGiZ4qzXT+F5cAxL+F8HpHXIG+HVgwFP5S0
	YmTKXn7l5NdnWq9qnhsUbB6cZ1C60FV0uV1ucvJTvsUEYTUWhFoNuiDFpKVzYkW7zY5wV8xczSS
	+zqaMqdO7JZAvBwamEtxjzbxA1DtP3Ham99O7v2T62yLhpmer4pTTq4wzBbOr/xzA4w7C4Z4pTe
	JQv7T0Lnb1phhcUjTKHu3l3EG48AQaYMR/J+qdXvx0galsMcJhy8D/3+wgV/NgDbsnD5K5rBSuz
	Boq/W2Bc3LYOm5yLj2UV+RTIYRnF+hb6pY3EKiFi/t/gx71xfZ8MPerFAVw=
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr6863597637.34.1749658445452;
        Wed, 11 Jun 2025 09:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhF50A00ZTd8vFQ+6dCgRXF844Xy0RmBjMaSc4ILELsZo+JvEhAIFYPQ0WDZr7mZZy0t8u+A==
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr6863542637.34.1749658444992;
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:58 -0700
Subject: [PATCH ath-next 5/5] wifi: ath12k: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX50ffRqvNjuC4
 UULF5MO6poV+GJqxxCGMFbWr85KgbvPDZYs1iw72Q7IkqOTZ94/9QKqJ/8A+xX1FyUg6roV+gKL
 FJGfVAtuTlwQcvv/dtGJRyTdW4UHVjbQb+M3cg54n/1CloHq1j2kvX5lWPI172zGbthMXwXZHuF
 Baz2z/tHq9aze/W3uut5ql9PxcDP4PMmmMP7I1NKP9+qyFRUzprJ/NQ0ljIKx8/ZDQxncdE/qSW
 f33EoAopPehboHKmu54bmQOXMtCl2AozkfR8+7o10rH6/Rc5eblFOMcuIhvcpF+mfX8yvLsIK8t
 a2j6ZJQGgCVoTWxacADFmTN34HZZ18WcWJB2UbJ9QAhM7/VWOLXHVP6dgEX9y/5t0+hL3/t932R
 eEUZEgfq6904MN/NN7lsRyalNZRm16gHjhVhKpMjPlktCQqg6MT7GcV1CJXkZN0OB7fJ5upW
X-Proofpoint-GUID: Dz-z5mVCCuVukM49SnKP8vWDEvivNj69
X-Proofpoint-ORIG-GUID: Dz-z5mVCCuVukM49SnKP8vWDEvivNj69
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6849ab4e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xduYLtDgZ1illbjtIHAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091406_930291_DD31A637 
X-CRM114-Status: GOOD (  13.26  )
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

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warning:

drivers/net/wireless/ath/ath12k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ebc0560d40e3419130e4caf01c9b91bd9affb3bd..ee0ac2e4e74b4b7a700b68a2077aa5b9938362c0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/remoteproc.h>

-- 
2.42.0


