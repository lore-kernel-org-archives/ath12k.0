Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEA606A32F
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LfrAOBUo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UKdBPY8/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rk4W7TRI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=LfrAOBUo1BRY5J
	eS88N0Y061dUhDjWbZBIHVPu+jzKlpOkdWh9vp3hdbQWO69U00InU+nQI6u4lVkuizXHkGWBg+jmC
	W40uxVl4uGKlUFMG1QgF6XRxGb2ih7prBosXv9I2IFYszDYnIxB047y4xdbDyP9wQRZ4eUv3vj0Z4
	IzpbROgAP3XK/Mx6Bm9oDCwjx6S4OfY8Iaa2RbRIDR3i7AvlDb6mZaRJsO8dk7i/n4YlO1Bss8/JT
	EB6sPJ6FI4DltixOwwNidpFK9ajUFK/qP8ihDh9As97e3/xDGT6GFGNnNB9Rj9G3w82YbYbWa0NhY
	jxgixyEXKG7fAKHz23xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1E-00000007rQ1-3bjW;
	Wed, 18 Nov 2026 06:19:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ19-00000007rKU-0Yj4
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:19:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwAQ472554
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UKdBPY8/WEkzKPHd
	VZXuIJDlXiO6GvbW/ddla52LU4seCudxBkX1qAFPQfpC/Smh5yDMrIfZM65rwTlq
	AyDvfaxkSfWoZjChhOEFr6unurC1lbk8Xc1Wic58kJIhQthAIgVEGzOV9XUdDoHO
	ejOdNStfYWcZIqgQr4p8SWADrh2DYU7PNGA+8O8rBZfXEoQjtX4tVhmGYL0B62f1
	UNHwipGJ4Y4qXzkPvfDfSpatwR8EM0gPNutzlxaqZEjo5Wu+5PAUZeNHfQT2eMuZ
	0+p+3Im8s3+pr1cOeipPYVFw2E5c6ShkHfSsxzDe+GZRh2ZXoPLWs1RGJXUlpkkN
	fV7dWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89gd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso377351a91.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982777; x=1795587577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=Rk4W7TRIYIEsu1E8lsQYP39FNTu+TptRms5sONtZxzYGgYhKKKitYF4prXegeYaGtF
         Gf1ap7RcwES3brkZrSt1YuwuEbFXCDkGc8FlMITh8gJMTE57AYLvTCLSIDR7Urza43tz
         yGKuTgvqVvekYqpt9KnsDiKxC60rdcqi4f/0tNRtXKhvmZe+TSnqd0DUssMYwgY2smBD
         JO7xSHx4wS3B+IPw/bReQQb6vi6GFdWwiYU131WOZ9LPo+fNrhBn/e0ugoF8Nv02SXrm
         cvSsH3uzIsdACQDzh3Hvapp/kp3BajGPINs4PkqF82b4NCx9r9exDNT8D9L5QGFu16Qb
         VimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982777; x=1795587577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=LU0sRVts8P8koyA5oGcYNN8eoNBIFUzkNF8CzoDBjc6CCEPWoG/QgGj8LWPwbCBDOy
         NJSeelwkWehMKvUq8PpeNfsxspaPVugeBHrYVkrRaPQVPXT0KnyGi8HaFPVZul+k/8vQ
         9jXfh16+KnDZGPpQcIaC267uKFrrsSYZD3tODbin97fymDO+j8w0KmaMg4/udp8GeKb0
         qF7Xcq5FmbFpbahihLRoUVv3Tl9WlQWbU1Hgks1MPFkuwbdWdzDo7WiXqreiUcT8pYEH
         64oyhTkyJkVw6oxb3EAL5S/FmHOIVcqkbiXshK4ef5JqpGNBlkf5UF5eiX/NCRoKayiY
         TofA==
X-Forwarded-Encrypted: i=1; AL+hErEJSFlL4rmHL9YAwwrrw0WSJ9wUdq17lN+c7gn5ungs6yBHXFOicQ8LVLQUh9jOaLUf8GtB7qU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+ER+cEX1Yhm5GsEtT8tLmQHQoJRc6imP57ATtBRiW0wDKKicM+
	MC8YZkp2XCawQ0Y8OeEk2LS3iU5YTpF/G1+39C9qbbP3Jm3RldkylvRUQQkWRFDhWhi/rY52uHz
	kTvOBTAztidviyJuV6gNU4TNKASliSVLIa4cwB0ILA9yaRBZtaKjrUlWeX8NrrV25
X-Gm-Gg: AZFdTZcgyF0NQIRnY68JVchMd8xHxwNjQMLvuI5UxGRS7AaBL2QZ+344fEjHyTPP6C8
	4Zv6fjDG1F/kRjr/t8G2/L5Xg5tqCtGGrqk16kpwEAEXATqrLjBLHKZFcVJ/uOfrStJI4PdzmQm
	5qiBc/iE2d1V+slRZO6JnJu4kNlRzOMB4Jivdz3TIFEaPj5hCwZ3i9gpCD7oBVafTCnh0gvWUWq
	KKCAsKSyA2rRujkzCO89ke9m7uq890P5Vmr5CITADn17Te8PhEPqmBe7F980wghhLYVTgupBrZo
	s2uq2P+qcj0xy3S/iV6o2IWpcm2sAf8K5B+PYcydLObgRtqtlb6zP0kfXiyZpuO5kO+NXtzzjI8
	feEwFGXm+fIQRTKlY2b6vRJpdWu/xipeYrptM3I3BAGLqtXYcLbpxt3b8eHxa7x82nj6DMvdvX2
	Vi33aMKLM0r930t8nxIJ6sE1CWiPMDyI25F5X6JXrsusTYTXbwjpjJTTZUcn+/St5LG5jq0E8sz
	5A=
X-Received: by 2002:a17:90b:3c89:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b3d076895fmr1493794a91.36.1794982776949;
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
X-Received: by 2002:a17:90b:3c89:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b3d076895fmr1493753a91.36.1794982776388;
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:08 +0530
Subject: [PATCH ath-next v2 05/15] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-5-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: MRl6IYamLxF0sdf73ujnODADFD4JQWFj
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd437a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxzJQg9JkDNLH
 KVzjurKgpmrZ9ChvYkIkWbHT2hixBPE93USlJuaARxPTHLC6+BsO6j3r/LFgmez4gxCZUTOF01h
 fp3qZYhjqwmXiet4sV7iFGPFIRZNmMNDKM89VFSx5/rfidDPFWVng6gr3cgppp3oGGZFPWnYs1+
 5HqJXApiGDEvgdvsK/hzvgsPDaZ5+7rfH/CMa6dZR0NW5r58rD+z/sXxWtlVot+rRUlw+lW2HIo
 zmUw0VM4KHor0Ull6s5hJu5UJjCr2+udVxeklcIbr2p4uofqkRRQC8v5crXetQGsI4a795Rh1Wf
 FMr4rWe7mJ29VAFkAyN52IQDO/eN3DQYENnXaHhYdN/tiKZ3VvOEhiu1M3W9jOyULzL7DLJLDJQ
 M4j0LGxT1Sr3hlQEyB3x5kOMW91ZPjMaBPSV4RjaiHn4xS3DGlHauU84mBfLh8XeMjj0Q8Y9Yb2
 dI9HuxjCZthdFIyZe8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX4JIk45m8vYj2
 jrRn87rlQhvw8mJ2qb2Rtk/VC0JTAQML7/CwPknKM88BIGW9LhYFKW6AgrgsF+uL/eoqXy3WqQa
 f08rr/k/lr24wDP8dsqnkTmo2Ns8DBs=
X-Proofpoint-GUID: MRl6IYamLxF0sdf73ujnODADFD4JQWFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_221939_322897_6EAC392B 
X-CRM114-Status: GOOD (  17.76  )
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


