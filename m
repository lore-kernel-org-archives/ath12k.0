Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369AFCD8CA4
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCvliVYqqAOKUycyeMO2VE20wOw1noVMe15EZ3nYEdM=; b=ntg2wmjmt2blczep6nLmDlB3vj
	l0vGTcPQkwWqwbAq85GLMGoksEg8267MWyZ+ysGkWfp56bzJAACd+0abutvZxBcbNy3DOzqUiw9+W
	msOTI8EoQ8NYk6f/Uzmiryf3PuxsvVvtAGhXMucPd0fASoJZaR9t4bwLJ3fLI3RIbM4j/g2USK9S8
	+MbYAfPrM7qiVN8epxICBOlioGVu2RTnlNHD5zWNQkIf5t0mHV42TNPpEOJVLKwds7df1RG8LPZxT
	peWNBlkZTRj6ab4GBHL6fPWX5AMI6nQFhdMNLJH6SRScvs+JUvZDzQN4fnx2nIQGKQE9CrU5DKiva
	sMDyhe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgH-00000003ZUx-3Qfe;
	Mon, 08 Jun 2026 13:06:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgE-00000003ZRQ-3gOo
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 13:06:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9YdA3038281
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 13:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCvliVYqqAOKUycyeMO2VE20wOw1noVMe15EZ3nYEdM=; b=nkPpj9elpQDZfDCc
	7vSLpk735Gx3of5MxuyIepN3pL1sBPu5C3EulPxFbeuhBkXlLI1A41rtd3NmF61p
	3iKfxbbUTNJgWqgrKGCn3Frl4xBNa9JT0tnpwPY7CTDVV/Uk8GuPAt6AHXG2Ku/v
	51d2PNg2uIHeyor8t3fYygDhvtc/rLs3mC7+nsh40glTkcxXC/pZr6A5ubYTVz5a
	Pr1xHLV1Kx5RYCezQKJz88S7bU7TkCYURrKTwFVVB0pyjFixuIPHbwZAv9dt+0Sf
	ozeBKqZnBaJPmIIcfQ1HI83kLizdEqSO2AWDBlTI0u2OEiBnJ6Y/TMPM2O+26vv9
	PmUXag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8hwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 13:06:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30762d67a64so6017793eec.0
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923973; x=1781528773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCvliVYqqAOKUycyeMO2VE20wOw1noVMe15EZ3nYEdM=;
        b=f7Lfv4NjwoRBVa8alb3aNK/bFNpk47WGQFwG+i55IrwEV992BPfuxtL4kehCyb5KOa
         47CIOGD4DKPPNZgNmaNp0Gd/qySIiSi4FyzZBQXPyJ60OdEoiEbQhPOMvHBXbjTZIJcS
         YGL2SbXK8xVN3p4rqo8i/RsCxkBEs4EwLqEF9VB9YBeIMYqwLJiW2BPWWWzx8uDriLpz
         xnKRxrm2hpEMDsnxvAjRAb30NJkokna4gqJ3QMvyDwenfSICmJGvRk0Qi0waADpeOqwr
         f6ucAe5z6LViRv/CXZCpDUXGp3AQsixrpTBtpJqsixjwSxzJo54gL33CG7l2iL2nIYST
         PGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923973; x=1781528773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LCvliVYqqAOKUycyeMO2VE20wOw1noVMe15EZ3nYEdM=;
        b=h615Tk8tzVvZ/v2PBb4tQpH5cNW/wnql+gQUg3/bf6MpHwforsR+xFjRih3YPzGGR0
         eojf1m8PPw5yLWN/08oOR31jPpJzRoj0ciHn3AjvfM4cJbZpDkzDL4KnKBeykzi6ZKnX
         LGrDpEafMoSZng0S6kKIzBUGS53jlhyUtm8QACV63iqHgEwEKSS9O9/xN97qFremxks8
         K8Zpuzfj2dn52rShh/kaAmwU5xlS/6NlIyQ8cUP/hJOIr1fa7hYNlt07AorkosAKj7Me
         tk1JvCxyfQ5syRyqp5s5nG0thhdQmvhKWB0E3ku9qXOKaElwT8g/0y5QgUsVphS3kUpU
         1YRA==
X-Forwarded-Encrypted: i=1; AFNElJ+c937UCFY6tprYBMGuFPGWQWTzgcTbX5cDpkb9d4TAMNMa3pmQMppMEpW0hMU3R09KWpcyG0s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy6WU4f8jyWVpr1s4U3VeTe7K2OZRL5W0tldVwfICQDqmdhmKf
	UMWdWpKfm75RvBU3wRo8Xp/wFZqywJbOYLGLBrGhO0IfxMFjlwbDfRZAkeGmYZeu7G6Ui/8pjP6
	JpawZDFJ8DcKVACkadpFJvztU4l+m4uP1zClGFBDgYyRExvlnYlUF/0bnab4fLshr
X-Gm-Gg: Acq92OF1D2vn0DHIekS+49Qv3wVrRH3E+J3tXd+VDGAVQ7AIcjMedHd80QNUGqgok0k
	bZAPFhrNoAiqM01nr8CeOvKomNdDBKDsaQQJ8ye53yLrMG1/X164pAIMsARjji1IQHjfILLNwXn
	U7VAScZyMdsJUplIm3KXF1aFj45Td5n45SvOg5PHOBHSMdTMrT1MmkZ3Cf+F1sD3k9baI8e0Wbq
	k2IiuMi6P5bTLGIxZRqUjqlTr8+z+Th5hIalXV4y7dahuikm/1EoRmCID+7F9mkKCTGcqNBQILi
	EwNjb9k4Z9toVVV4BE0LJkHEFusRsY+BfRCpOLlwbVwPMhVJG9+fCQwI0FXtA/z8Lz/B/LRORC/
	p7q9gLGVOohiUnxDZJjyNFjlONfwcyhCrHNxQgJxfT4MiMqvQ9XGnAUvo7z/R4sbxp8KNQur6h6
	GNuxinBBCSHjM=
X-Received: by 2002:a05:693c:69d9:b0:304:dfb2:2274 with SMTP id 5a478bee46e88-3077b782a7dmr5000660eec.28.1780923973132;
        Mon, 08 Jun 2026 06:06:13 -0700 (PDT)
X-Received: by 2002:a05:693c:69d9:b0:304:dfb2:2274 with SMTP id 5a478bee46e88-3077b782a7dmr5000629eec.28.1780923972432;
        Mon, 08 Jun 2026 06:06:12 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm15666701eec.10.2026.06.08.06.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:06:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:06:06 -0700
Subject: [PATCH ath-next 1/3] wifi: ath12k: Update Qualcomm copyrights
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v1-1-e1a71f92d447@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: H2VBbcld2y2D84cez6WdciCbOJPbv5_q
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26be46 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vZAPiv9bP6El6ppP23sA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: H2VBbcld2y2D84cez6WdciCbOJPbv5_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX+r63usp0EtMT
 r9e99HHiUuTHqctAv0EoSfuGtmORebsaZgDaX5JCW4DzYJBXXNxGetWcpINhI5NyjOdjwNQamSP
 pw4HtaP17zLW8bPhcmHD7CR0tEbafZUuKFUIrAP+RRYZJo7oMPj/I4+L2/5yXDtyTIwPnDXJd6u
 RD4tHcQivORvYTV5OAZ3g9ZXE0D0wgUSnkB0TcRnffFc04mutXj+p5TLH11F4QOC70wIrUt1PD1
 SM+EM5sDg4j5S7e553mKjMu+tkW36q5S6FujbAjMG9/3LxkSnHX7ulQI+H1rRepgKpMI1MuhtIR
 Ui82N5NCWY2iykJnEfqfGWDCbtsuQtalGKTmOEd6qiSC9s79Q/PRgrlod1Iy45FXODMfaURsvs9
 XYR0mVQrVqrAHpRVRXul4oKiilAbbTJLutXhX4XUBkpk6nT/X3mQihH9++DpVjXuOmNhXmMM7IS
 qdX8wyRT8hgWxKp4wjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_060614_929764_D78451F7 
X-CRM114-Status: GOOD (  12.19  )
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

Update Qualcomm copyrights per current legal guidance.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/acpi.c        | 2 +-
 drivers/net/wireless/ath/ath12k/acpi.h        | 2 +-
 drivers/net/wireless/ath/ath12k/coredump.c    | 2 +-
 drivers/net/wireless/ath/ath12k/coredump.h    | 2 +-
 drivers/net/wireless/ath/ath12k/dbring.h      | 2 +-
 drivers/net/wireless/ath/ath12k/debug.h       | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs.h     | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.h | 2 +-
 drivers/net/wireless/ath/ath12k/hif.h         | 2 +-
 drivers/net/wireless/ath/ath12k/p2p.c         | 1 -
 drivers/net/wireless/ath/ath12k/p2p.h         | 2 +-
 drivers/net/wireless/ath/ath12k/reg.c         | 2 +-
 drivers/net/wireless/ath/ath12k/reg.h         | 2 +-
 drivers/net/wireless/ath/ath12k/testmode.h    | 2 +-
 drivers/net/wireless/ath/ath12k/trace.c       | 2 +-
 drivers/net/wireless/ath/ath12k/trace.h       | 2 +-
 drivers/net/wireless/ath/ath12k/wow.h         | 2 +-
 17 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index d81367ce6929..c1b9be3e03ac 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 3a26fea6af1a..dd80eebff96a 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef ATH12K_ACPI_H
 #define ATH12K_ACPI_H
diff --git a/drivers/net/wireless/ath/ath12k/coredump.c b/drivers/net/wireless/ath/ath12k/coredump.c
index ce1beeb54836..070512338f13 100644
--- a/drivers/net/wireless/ath/ath12k/coredump.c
+++ b/drivers/net/wireless/ath/ath12k/coredump.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/devcoredump.h>
 #include "hif.h"
diff --git a/drivers/net/wireless/ath/ath12k/coredump.h b/drivers/net/wireless/ath/ath12k/coredump.h
index 13f46a605113..584ce0a085a7 100644
--- a/drivers/net/wireless/ath/ath12k/coredump.h
+++ b/drivers/net/wireless/ath/ath12k/coredump.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _ATH12K_COREDUMP_H_
 #define _ATH12K_COREDUMP_H_
diff --git a/drivers/net/wireless/ath/ath12k/dbring.h b/drivers/net/wireless/ath/ath12k/dbring.h
index e1c0eba774ec..780c27c570e5 100644
--- a/drivers/net/wireless/ath/ath12k/dbring.h
+++ b/drivers/net/wireless/ath/ath12k/dbring.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_DBRING_H
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index bf254e43a68d..658b8083c9c3 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH12K_DEBUG_H_
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
index 21641a8a0346..f5dbca1b8d75 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH12K_DEBUGFS_H_
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_sta.h b/drivers/net/wireless/ath/ath12k/debugfs_sta.h
index 8de924f4d7d5..44c78f3ab904 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_sta.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_sta.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH12K_DEBUGFS_STA_H_
diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index e8840fab6061..4de8667690e9 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_HIF_H
diff --git a/drivers/net/wireless/ath/ath12k/p2p.c b/drivers/net/wireless/ath/ath12k/p2p.c
index 19ebcd1d8eb2..ae9a8be17be4 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.c
+++ b/drivers/net/wireless/ath/ath12k/p2p.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath12k/p2p.h b/drivers/net/wireless/ath/ath12k/p2p.h
index 03ee877e6d6b..3041f88508db 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.h
+++ b/drivers/net/wireless/ath/ath12k/p2p.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved..
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_P2P_H
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index d784d9ec5061..89abf2e87ad1 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/rtnetlink.h>
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath12k/reg.h b/drivers/net/wireless/ath/ath12k/reg.h
index da5128b8c97f..7c37c0d2a6f9 100644
--- a/drivers/net/wireless/ath/ath12k/reg.h
+++ b/drivers/net/wireless/ath/ath12k/reg.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_REG_H
diff --git a/drivers/net/wireless/ath/ath12k/testmode.h b/drivers/net/wireless/ath/ath12k/testmode.h
index ef6ab21d19b8..342ed0a7fa98 100644
--- a/drivers/net/wireless/ath/ath12k/testmode.h
+++ b/drivers/net/wireless/ath/ath12k/testmode.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath12k/trace.c b/drivers/net/wireless/ath/ath12k/trace.c
index 0d0edf4204b7..772a5a7db98b 100644
--- a/drivers/net/wireless/ath/ath12k/trace.c
+++ b/drivers/net/wireless/ath/ath12k/trace.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/wireless/ath/ath12k/trace.h b/drivers/net/wireless/ath/ath12k/trace.h
index 253c67accb0e..053d681302f0 100644
--- a/drivers/net/wireless/ath/ath12k/trace.h
+++ b/drivers/net/wireless/ath/ath12k/trace.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #if !defined(_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
diff --git a/drivers/net/wireless/ath/ath12k/wow.h b/drivers/net/wireless/ath/ath12k/wow.h
index af9be5fadcc3..273705956815 100644
--- a/drivers/net/wireless/ath/ath12k/wow.h
+++ b/drivers/net/wireless/ath/ath12k/wow.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_WOW_H

-- 
2.43.0


