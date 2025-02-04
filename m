Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FCFC0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpQ1wqnVdVlF+fVFCGFn5AWkm1b36ebsa+hYlEcKIWc=; b=Dhpn7FRxeV6pxtEW/jVDwZUxbE
	Az7OiZ/BFsV1C0lNBvzHe1mYi+ZM5ia95DSfhMHKD6sxY4VNH3q+L4PAfA/7Gug5Bfln43lP3yCPB
	yH4P/JtiwT3X9txF4w+y6S6vO2PlrAiTgUlwOJJ9XV9Vbex3DfXgxJM+rNcARtPZJIYI+pVKVmMZ+
	ah/nX0O0+aVIu2PhXiygWjc4lEvKjyCuRiKjFhJpfkcscvTsi9eT/kIa0rsV2jOAGKM0El7cY0Ts8
	oS5qCGj8tKKbVeIG71KoEc7aN8DaOKBKXxvPVJ3sk00pqiFasDdZVMi/ZtgOAtrZqQV/59sE0t0RW
	6q9KEHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATl-0000000HDxC-2sRY
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATj-0000000HDvs-0IMu
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IaUXS008512
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpQ1wqnVdVlF+fVFCGFn5AWkm1b36ebsa+hYlEcKIWc=; b=cJJeoPzBNjKrftGH
	e77cEcWJlKbXseJM0rsexHWHmuVrGijHC69cI5zgeldWhok9wneSqYmFr8aBCTg9
	WNekBcAs3kIzFks+yNQiK7NZPZ7H5IFPdOY2YCVF7T+x5q6s1KTbDyaERN6JI7og
	jr8ZK4FrSE1PIQnuSxaVQQLOC+gXCk88qNQMk7Q9Qnhw46RVq4kMfPH/E0nRl+pH
	gjlTjJVBGvORNpy4Vcj144hsKdQhAPxyKzJ+68vQqJYmDL8nfQw9RzGBVZK3WilI
	1IfJAMsZVHVlCK+m8wDpTvvBhAAZVjygfYjxzwO3gl4YBKNiX0Ov3qvvH+9vrvBd
	0z5R1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k37u11ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:24:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so14579619a91.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643040; x=1739247840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpQ1wqnVdVlF+fVFCGFn5AWkm1b36ebsa+hYlEcKIWc=;
        b=W7diZvMkBQ3XMpuSn/07knFwRsQwbfL5vwB7pYB/2jdEYrT4ZIoLfHd6dF34eA/mwy
         T1LjH8JQ2LndwgAztjsTtz7XE1YJ2kluSq+JMpSWlj+DQx6akZ/IvXcbkOjKkKgdbGJk
         +8Q/4lppR9L/zSJ8MR3OPwZl4WCGeWWNsVbtcJRGPPf6aW1b1g1S+y0/zvcT3UgFkZGt
         Hkr8qZSPug7PGA5XCyiePcZBxBWrDdlybEmmAVk5GOD+jUg5lk8RszECieXM07RHoogc
         O6dIKofrXM/5IGKGMD7nQmuebmPBkvbY7yP7x+aXCYIVKVOgrSVLjx5FvRJLNgqDZy0N
         C0hA==
X-Forwarded-Encrypted: i=1; AJvYcCX40LeuBkAC9oz76G+cJIeNzQGWiZlb8V6BstieNaWp22ONAfH1rwWVT9PP4lNKtUYxh4jR/tc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmP1aaJpTjVcF0xXA8RQqQBAU+8R01oOZyYiOctvAJEm6PYM/v
	UEhFpTlMhCokMSzeSb3EOvY9uAyJYO5xhizEQIVnhzhmiGQPmmmiO8gNR8jeo321XttWjbxFgei
	LjvlFUtwvJIXw6sg3klkhWS/G3L8nl5nXpRpHIjyNShU6QcyT/F6sXxzjZi4Zk9jxHj8C
X-Gm-Gg: ASbGncsKkJD+sck7QIFIjb6rGKtxDVIDfjBrJbC0g+E6jAlDxVA7dki+/9KktO/H+We
	n0krA+cknCdqO5g40VZ1sGO/k7Wr51TK+1XIki2NAwj258JBXbnUKuJGNJqZg1D3v8Jo+CBOF3I
	UU2+caz6xBkWGe2U19KEdw62m7re+ilEjtLmU5+CHmwEu87F8C3kZ0zP4wv0I/tLz1hkywjZV13
	BF5kzy/5w7Wx/OjpqkZVYVwioK2QHgtDqmPaS+p1i8rg99hUnNsSbcYNA5jlZ4dVx1N69McYFTg
	nuxPl+m2oDt+fENXl0i6ksA0wskrdVCQtpAKJj/OHDUr4Lk2C/WlxWxVBJEpNjoA5AGLbsF2RuJ
	NmGv4uzGqRHZb52Gi8lb8x5njyRRcxw==
X-Received: by 2002:a05:6a21:498:b0:1e1:a647:8a54 with SMTP id adf61e73a8af0-1ed7a640d32mr38481744637.20.1738643040158;
        Mon, 03 Feb 2025 20:24:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOQ7Av7ChIT5Sfd9Y3FCRFBK0BvMkRxWFgYagW1fOXHmqJfop4BkVtnVNZpzYrIs3wnrErtA==
X-Received: by 2002:a05:6a21:498:b0:1e1:a647:8a54 with SMTP id adf61e73a8af0-1ed7a640d32mr38481712637.20.1738643039750;
        Mon, 03 Feb 2025 20:23:59 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:23:59 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:41 +0530
Subject: [PATCH 1/8] wifi: ath12k: eliminate redundant debug mask check in
 ath12k_dbg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-1-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: J3rZMTcoHWgwDUZbmdBdEqmgubw8Tybp
X-Proofpoint-GUID: J3rZMTcoHWgwDUZbmdBdEqmgubw8Tybp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202403_238212_AF70274B 
X-CRM114-Status: GOOD (  16.92  )
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


