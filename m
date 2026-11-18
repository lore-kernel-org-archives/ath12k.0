Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3E606A325
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qe2YozOQ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdvNyEWi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WfJpg6CP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=qe2YozOQhywWIp
	7gHZCCpUqW5H9hw2SqbMrKvtXrBf7kWvejigFSBhm/f/QD9eX43HbWoZaHrJ0l/WFUdm39efJtRlO
	fTB6Czi37YJb0pSoIaDywyvdfQeaYmsewSDJvJFxr9rCK4kE+AokAYpk2OE9BCgECpjQD+DZIuFHO
	oRLBQVnAppODOLoWk8gEie8/Pi1eoJzUo+hXrzXvgOtCQwEHX7T0URDzsD16F0fdN5WQWUQYZB8Y/
	laMQv6TSDEFzxdDLETU5U4v41/56DViw+5bhC2BU4LkUudbJcOPkhEr7EWvM2u9qCC33FwKgIhWUA
	9QIwjwHvP2Wb3U0Zolyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapo-0000000889d-1TjB;
	Wed, 18 Nov 2026 08:16:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapj-0000000884f-2m6G
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:16:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8FKFr1430569
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=kdvNyEWi/U/p+6+M
	V6KYr8FfRVflyAMRZndqMoFsRh9Jb8IFHGO59POUAAQ+AQwXw0v27Y6M/BPxQciv
	kHEFNWT6V0FJAS0w7vrHuwjU22dwrmR5A+08r+ajss/Uisw3zqqm1/DaqdoeXraX
	67fpFcYFyIHz4wu3H2SZ0rJgybsXhIHbDDBfEMrAy+Bc1mbWmr9gS9FhuEGY2kA/
	p1hjkNdRCVmxHXztf672tTfCt4c5Yf/1NeJzGtQIbqcrBAtyJ8upjxzn1vB4bUfk
	jOSvqAbWINAvTR3xXdw7EgS7VW4Wb5j27Ve+9pMAdgVt+1Ga5hm6mToY0gDn0kxy
	ihwaLg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91yux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:15:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso949035a91.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989758; x=1795594558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=WfJpg6CPOL/wuwpj1PGL2BG8mcLXaODiZg6GuSD/WfTd561muRp8coK5tWAUb9WYsk
         KpN+cCnwPNzci72TEjZzOTT4E77hlhiH/uK9xINCoY0hx2NDbvC9wSfA8bAQuuEZTt5C
         gfbhDZoJJ2Cvxk5bySqv01WC37rj7ThJdS0BceVU6RzlBrDXsNdYNx/JUfrgb0gwVrib
         LEOPg4aP3VEM9QiKzo1O+Bsht/7QrdvDPVTCECAnE603p7xX8hCOPekg0DLaux3HChDt
         DjUSVEdFrbeaS575dmTNQVZxNoxTHCmuraiVW3Z3OD8S9HgBqAee+a6vRrsRs37EEpSR
         DxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989758; x=1795594558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=qFI/xAY27H7UXCJYFtrBCddoDRYqFDr8lSWZXifFSMQg2vAk4hGDpMvKvJM1XD7h8B
         6XIQBvu0a0LFaqf1vPNgivK4XwEo4D8aynQd6g6eSTIa7Yub9IRqP3DvLYx8kc+6Nb5H
         Q0NiTu2msBBQtd+vd43FbiKfvZ3WHD/tlaIiMfF0lLAxv9yCKOsky25LivM0YEPOHj6W
         4JS69qgWE2eruGzogwAdDnn7Nr9X9iA1bvWFtWYNwTepXAVvHWmcfknXVEZ+fLzqc9s8
         Dti015dTsLWra+9k5OSb5fI2JdeMXOl98hpkX9bZEHnd4y3eln4W5V2aYkKr7TRTQQHe
         Mc4Q==
X-Forwarded-Encrypted: i=1; AL+hErG5caSgPjFxb/udLs+QHjjIlYrUhwtx6obN4FTjnVY2ZUFra1UFLbMTx7JRT27qnVvYP6Tty3A=@lists.infradead.org
X-Gm-Message-State: APuU4Z+NVlfXoXvmdwMooA0U1rYIsJVO8x4vBdXP8/tnixN3nUYJH05v
	zEqAwsHeq+rYEKQTHd6wNe01VEu0sVJ0Mtd/shWlzhFpeXSuldKQEZayXcVOucVL4LYXjKon712
	8XoC5a1fre9RIveY8DlaOB6bK4hCjn46MdN4+3Yn68YO+tRS5kXxJ6GB2afElTXah0o1uje/R
X-Gm-Gg: AZFdTZfoBCPvN6+zCMgFShG0abVXrOBgFudQqCnOuEMGdeZBanZp4+zVq/3UT8yFihw
	HHPw4SRh5n9RXj3efurDJE/CTCBTKK6zZKVKlsDxxvveT+TSniqlMUhhWgYK997OWTVmRC6/Dhh
	1EFnGiwSUqnGZGyQEBB9yculMcB00MXXtVtGfGdGwRUvvHio9LYILB86CkbbJ9kSDgD++7DonXO
	ZhR741q9Q3sisE0IasTHuvKcG53A95yyggXVzTd2ynHCxhxHRtg7CsrqMcbelF0VW7yWHDzGFnN
	Ckorouxi5wf/ZK9rPJEOkiVcyzc727wlVLdf0zE2T0fUXN2PC3MHsEALubCGalKg/yUsPBlcf9a
	SUnclEs+S69c6TCHzmNia6AhC6ppRkAjvkBLnNHJz7TMuLcddR+V9RUetlHLwnPziEZS5jzGrlq
	gl9v1lDHwJSld8gsnesVpUGkrs4hpul6zAL9+6wNNKJGjgT5jywQsa64ti2R09b20kJrTRAbPAs
	g==
X-Received: by 2002:a17:90b:518c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b3d07a24f6mr2014452a91.21.1794989758308;
        Wed, 18 Nov 2026 00:15:58 -0800 (PST)
X-Received: by 2002:a17:90b:518c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b3d07a24f6mr2014405a91.21.1794989757579;
        Wed, 18 Nov 2026 00:15:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:28 +0530
Subject: [PATCH ath-next v3 05/15] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-5-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX/BdIKDm5Mdgi
 rif2H7Gj+23ApJbHtDau2INyoNG/7C1sJx7wwoHRvGyHgUeHHH5KuhX3QTNXFqC3jnFgDhZmhnz
 lYj8cmidXl4c7W68CL62Rsice7omv5OV6DrhWR/L4cykk60d/o9oabL+AvE1bvEUddpNjdoRel4
 yAyUoshchvcnLcoOVWYJ318js1DURu4abQWa+Qk6VKdDpkGt64QtxLK2AGyASMjfgf7x/1PVmCE
 Qk1MAuqemYnY2NZZJb3Zsu1+Aj+t/ACF5v5ZBnEYJpPAfHcUrYjQd+Zg1vbQK4d1t9VhMP4GJOP
 D6a2c7dc6W/98lsoptnE9wQlf0C90AkJTzTMok/UTn7hXSNm6lUah4OaEeMbUhVPlZK5p1KEpUi
 fzAfury4hTGfzCT28dkIc1B0KbZ5ZvOdiA+Q0Q9nb797p0HXpDasjjA3DQ5llXBs7/VSZylL5kx
 CAtijqS8uNRDiQWNlYA==
X-Proofpoint-GUID: 0o6fsPWCKjVWr8zyIFeHz0ibJwX0gmKS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX6qPXq0BNsfz4
 uNU3UGcU1A43A8Xmlx7OREkr8/G3mQvhtWhJlQEczehjBMFmMT7m5WNiccsygl5qXLtap6B2kGk
 1ewYBA2y2A0BuXX0OStVSJwRGkyDFnw=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd5ebf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 0o6fsPWCKjVWr8zyIFeHz0ibJwX0gmKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001559_718329_6A795583 
X-CRM114-Status: GOOD (  16.99  )
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

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1


