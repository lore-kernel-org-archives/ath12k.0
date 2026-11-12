Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5D606C838
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=14OMjuPs;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EBLvJdlc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hAJVKtiy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=14OMjuPsH/AoPl
	Qmcpat3YKDgAKnKeQKpnW7bbBnYQpImsLymIZwHdLvGR5bPwnjX9rlb1krpCxkc2fhoPEqS+riVxh
	LG45NfMdrLbTDTtwo6k4Odm4B71tfofxpUhCH50aNKjVvjR2Hcbtf2gb58R1ePX/Pb2ePwPnWST6f
	hGa/fCywiLhesgx80Mnn8HcC/Sh4dAZCpm73P/FL096W+w/gi47ssWMK9WVGqqiILDiUFSb/oub3H
	TpRNWI9M2nWXMnup7KgH6mbfB3G9nKDFYb5CHBVL0LojPuqC95jAzBhbei6VxtqKYFv0WgtLUCfbE
	Ix9kvEM0/Cpf39qZVvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQHg-000000099go-2rRi;
	Thu, 12 Nov 2026 08:35:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQEy-000000098M1-24ig
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:33:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVXH597319
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=EBLvJdlcif5PJ7S2
	HDNYvyDAzk78Q58mjRvxbW5EQunW5vGKQuWwjY0GN0ZpMWmz3U/OgvKSXkXa3+kw
	KLEjxSlK8Mu1cJHeF25V5+TIxgmpatU0gE2/0TXjzFlCfh8olqGu0gn6ldVA3DCE
	J7CSbEktQcP3ljEfpJxPJB26PQS5D5pL0q5w7a/s5zhSIGy690RhT/VKLW58kSLY
	BP3CtwkDhgWlItwlbLyb9fHM5yLL7ioemJGz1IVKqUJDMaqnZkynFB02UBw6JW1o
	a86Sn+f3iFDDz7HX5bZnIHZxnWhrEmSyecCtunWcNMmEprxKbUS6791rB2/DNekO
	fXLUjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt153urd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65070d3feso408780a12.0
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472382; x=1795077182; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=hAJVKtiyB+vWFCtIqOx7sUgYe3AfCgchuE3y33jq/5XfeRyR8sPtZMqT5pyO8rBkaa
         CsQVI/Xap8s5z7SBn4NragDApJZgOyX7Z8yD7vlNX9s4FuyPjsKIuGgywn1gojNNQcaI
         WM2BRMIGVwoO3w4uzE/V8yHOb+Nxn2WBJzuTtNss/v3ehnwzFgSdbvUoBMXIboZxAV9i
         7O+3Kxjj4XDEdT0m4/ND87zeAzLhpkXqKVVEkewZR2ek8bh0dT0qAbMTEQR1lq2/60RV
         b0PSA9wixkfjy/6MKOhTfefkvquLUPWCLA36k9HFjHYu2ff7lYKNqeXqVBCDMdlGpH5K
         1Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472382; x=1795077182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=ng2iJRg8AJEYHlWFernWWvLbbjDMKKex08BM9XkfXtFzo79tCAlFAbgwXdqm1KuMhu
         b90NCBZdvTCRKfPch7FMx35RnFw8YW5fhWHU9cxjmt/RXbKMKQr5WTctJG1ZTGmQ1/1Z
         14YB+bOQjWgKSmB8KEnVLtZnUjtC4m1b67f0P+V9v9VLkXzTDFhxgxf4O6QbLpI/ItiU
         tMAYTHT5yU5XBU28Apa5z8peIXOhFhU9bMjEvSksCr8O8lYZKSbVSYF8VJqVz1E6P4xO
         Z0LMyoHFyIxOOCvC1z3ErnzweequBgDdfjRODCAjPwBVg/IrsFQiYY1GGzfNfdl3L4n0
         dpQg==
X-Forwarded-Encrypted: i=1; AL+hErGqayVoCaGf8kN/ex6doTGcCdB6Y4/qjqeWVxjhdMaeWDLMD2WGJ+lgWGwU/Jd2qsaBBUgI6YA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9sPhA8HOFWEFy0RbZq0XkBWzYn1hhsjvgCogOYQ8T4Q/CVVErB
	c6epZzBGNP1kJ9XyF7MM/hziKqK8sZoftQxWKhF1fuUeZgE3KPNwaL4dUAxqLSxZ1fvvHOXKxza
	nGxhUez1af72Kd4i627DSjvCBVNoYOtD6ojbC8l4Re6nIWE1F0Yjh372XLAUOFIjgCgHSv5jS
X-Gm-Gg: AYBFou1KzQHel+HQDvmgj3WyVV9d+tzvqdsXO2Jerjq7+OYSpP8NZNzHlCE4M/wp5Zp
	7gb/r0XVK+noWdBdNRJefTBAGAiqj4GBKcGDYpFfL6ExzgNB7YV4FIjPub51JYzm4Krv6GflEEx
	mGeYf+s0KOMf8t/uXml3G5EzTsqI7F8dusPqxjnBgSlNSFOvFayS1szaWd2s6ZdV8QFQ7tka2iL
	LU+fFpyjsEHS1CgWcoxjjQaKUYaEG+Wyl5rBsgbE5lvN9ct3cTePSn2BCkeP1kw0MmvcTMNjEY5
	dd2ZROBmac6zzfBcedSXHAjrSzuvJqMW4vrZDl1yM4tRydOEH/AMQFpJBx6y7t9qVST36ax3lBU
	WL4xRfog+AsvUqyVsGiw8BYVcmJhFno86oxvorsvagIyNGrM0gGvrCH+0Sgt3hV0BqdZezHldko
	APIFfSqNGB4L/cDdE6/IV1Sbd+pCNoERvM7H3cfqUjaF9wjTYOrLAW2Y/Gg8NEjbfue2KPcnNKy
	g==
X-Received: by 2002:a17:90b:540f:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b197caa480mr1248046a91.21.1794472382266;
        Thu, 12 Nov 2026 00:33:02 -0800 (PST)
X-Received: by 2002:a17:90b:540f:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b197caa480mr1248026a91.21.1794472381784;
        Thu, 12 Nov 2026 00:33:01 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:01 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:21 +0530
Subject: [PATCH ath-next 07/15] wifi: ath12k: add Wi-Fi 8 HAL register
 table and hal init hook for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-7-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX2T4cQ10FwJ7P
 wQ4Pw1/QhFbQlzF4dGKmpLmSnZ4IavKyLlpY11LMsrglqhIa0NtxBwOCKmYDd2UmUKXdwO7mD0u
 8BsY0mJACo95vTdRYub9OvIlv/lZ8eA=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af579bf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ZtyApI9OWgWok6pv6Orf9VJEPgMigSE2
X-Proofpoint-ORIG-GUID: ZtyApI9OWgWok6pv6Orf9VJEPgMigSE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX0gJa7wD2JiQA
 TIXeovSDdxH2AH4jyfVAuFPWTyCwPGdmoPKQQqvL0/WqT86osTWMor09T7bpVBY+OOP+Q4YQTNN
 3RC9+um6kJqPJlvlUWsTHahkxYMpOOYh+w2aFxN2LbbnUH8OQIcoDQNyCSxsdIEl8eAqonPsHna
 JKOFRb03jrheE5Pwlhdc6UE+Rm4W5jy3HQk1OqM6KehMDx16UEpi7++mRd6p/DlW5a46eFLCoyr
 VzJ868+Pv1uldGIPnV0ufMnXrMRB0NZFBmDvpVvJi4cLKmc0qffOYKysl4iyUHO7uyLWfDS8BV/
 yU1C8dkdnatBeZv/Vvjm2dQ0Dwcz/FFJO2yuczgh7hV1maXoZ7RBb9FXvxlVUYYpESX2dMiznuq
 RKnpCk4/TuVDqRUEeGfxuZJ3+oUn7wRGmEhdmlzPHXp/aOLg5k2Kl7Eez60zJpG0hzJEzvZUJZn
 uEYADrZlpKHnVHSPPeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_003308_224724_411DFA23 
X-CRM114-Status: GOOD (  16.57  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN9575 uses a different HAL register layout from Wi-Fi 7 and requires a
dedicated register table and HAL init path. Add QCN9575-specific HAL
register definitions in wifi8/hal_qcn9575.c (qcn9575_regs) and its
header.  Add wifi8/hal.c with an ath12k_hw_version_map entry that points
ATH12K_HW_QCN9575_HW20 to qcn9575_regs, and introduce
ath12k_wifi8_hal_init(). Invoke ath12k_wifi8_hal_init() from
ath12k_wifi8_hw_init() so HAL setup is hooked into the Wi-Fi 8 hardware
init path. Keep HAL ops and params fields as NULL placeholders;
follow-up patches fill operation tables and remaining HAL parameters.
Update wifi8/Makefile to build hal.c and hal_qcn9575.c.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  2 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 23 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 13 +++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 42 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    | 13 +++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  3 ++
 6 files changed, 96 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 277b5f13754d..b1b90c109c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hal.o \
+		  hal_qcn9575.o \
 		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
new file mode 100644
index 000000000000..1afc6fc21d0f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "../hal.h"
+#include "../hif.h"
+#include "hal.h"
+#include "hal_qcn9575.h"
+
+static const struct ath12k_hw_version_map ath12k_wifi8_hw_ver_map[] = {
+	[ATH12K_HW_QCN9575_HW20] = {
+		.hw_regs = &qcn9575_regs,
+	},
+};
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab)
+{
+	struct ath12k_hal *hal = &ab->hal;
+
+	memset(hal, 0, sizeof(*hal));
+
+	hal->regs = ath12k_wifi8_hw_ver_map[ab->hw_rev].hw_regs;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
new file mode 100644
index 000000000000..311fc5b8015c
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_H
+#define ATH12K_WIFI8_HAL_H
+
+#include "../core.h"
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HAL_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
new file mode 100644
index 000000000000..56d45785ecd4
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "hal_qcn9575.h"
+
+const struct ath12k_hw_regs qcn9575_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00001604,
+	.tcl1_ring_misc = 0x0000160c,
+	.tcl1_ring_tp_addr_lsb = 0x00001618,
+	.tcl1_ring_tp_addr_msb = 0x0000161c,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x0000162c,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00001630,
+	.tcl1_ring_msi1_base_lsb = 0x00001644,
+	.tcl1_ring_msi1_base_msb = 0x00001648,
+	.tcl1_ring_msi1_data = 0x0000164c,
+	.tcl1_ring_base_lsb = 0x000015fc,
+	.tcl1_ring_base_msb = 0x00001600,
+
+	/* REO DEST ring address */
+	.reo1_ring_base_lsb = 0x00000848,
+	.reo1_ring_base_msb = 0x0000084c,
+	.reo1_ring_id = 0x00000850,
+	.reo1_ring_misc = 0x00000858,
+	.reo1_ring_hp_addr_lsb = 0x0000085c,
+	.reo1_ring_hp_addr_msb = 0x00000860,
+	.reo1_ring_producer_int_setup = 0x0000086c,
+	.reo1_ring_msi1_base_lsb = 0x00000890,
+	.reo1_ring_msi1_base_msb = 0x00000894,
+	.reo1_ring_msi1_data = 0x00000898,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+
+	.gcc_gcc_pcie_hot_rst = 0x1e38438,
+
+	.qrtr_node_id = 0x01e03300,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
new file mode 100644
index 000000000000..e2dd68ebd82f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_QCN9575_H
+#define ATH12K_WIFI8_HAL_QCN9575_H
+
+#include "../hal.h"
+
+extern const struct ath12k_hw_regs qcn9575_regs;
+
+#endif /* ATH12K_WIFI8_HAL_QCN9575_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 6e89a42111b6..91d8f762e642 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -11,6 +11,7 @@
 #include "../debug.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "hal.h"
 #include "hw.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
@@ -129,6 +130,8 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 
 	ab->hw_params = hw_params;
 
+	ath12k_wifi8_hal_init(ab);
+
 	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
 
 	return 0;

-- 
2.34.1


