Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311C8CA0EE5
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 19:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihDbRso+D9xJdpYFloZT6qY/1D6WdETuvkB3AWM3Crk=; b=clJ/GovacMTd1b7VIIfK87Rk4H
	4L3Y9YaCWQ3DvV5La2R7buoOt5S35jLqmWy9p9iQ9qJP/ktummZyJrurcYkBKCSkr5Y4W7as8ZLsu
	Vo/OF4JDIcArvqlj2wQDSWNVWCvaC2C1m0XmqxZkW5xhRTKvJG1XWCotvB53x63IZyXaqUVHECpsC
	Hot8XJsIklJiCHGU0ZPdTeuQQ0y+N4z5+Ks7mdEsbBwBMiKocN5mrCiIihytWLCkp/P1y7xZW14tw
	j6dirDlfyvecqvn80FBhwAFmYiXoKgUdLZ3vUD6cDrD8D5aFH0YOL3xZipj9sxOU3ozRFkCzN/yhp
	cPuQobGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulufu-0000000Bqdi-3zki;
	Tue, 12 Aug 2025 19:28:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsYI-0000000BWVu-3WXg
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 17:12:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvbcI002391;
	Tue, 12 Aug 2025 17:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihDbRso+D9xJdpYFloZT6qY/1D6WdETuvkB3AWM3Crk=; b=buImKT5yTLCR4Rln
	6smJNasv//YYFnf4CYSt3ewzJe4O8jgfFyc9/VO9eZeHrAZ4NbI1Q//rIRI1zckm
	sdPfNQQE51LNJpH2uJ6QuqjerrApyoQ9MIJESu5BWoPPGTVU7Ba/J41rq/gfEcdj
	aDvpXx98yWK6+PROnukXG/21VA5y/bsqq6Tg/a1nZT0/Vy5gpFQMo1j8cs9952dG
	KelbamtsxM5egKUCfP+QavInweyP+DwL29Kt6Z4o+wGMURfumpnt5Uo1vYxeVLik
	L74vMjp+DF9dxFl4258At8XwdfQaHwbKbsH55ciQzTokvfKmNToVA33lUO8HzLBT
	Z5X23Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj48y6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CHCkGZ010577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:46 GMT
Received: from hu-kiranv-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 10:12:45 -0700
From: Kiran Venkatappa <quic_kiranv@quicinc.com>
Date: Tue, 12 Aug 2025 22:39:35 +0530
Subject: [PATCH ath12k-ng 09/13] wifi: ath12k: Move hw_init invocation to
 target-specific probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-ath12k-mod-v1-9-8c9b0eb9335d@quicinc.com>
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
In-Reply-To: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXzgxrmwSTGk3e
 GNHT5i8VEc1h4Dplo8OvKFr+O+UO8YHYnLTO+boefIUODXl8JpO4ra4pJ3nbpaB3iHtLaGprXDr
 Psr18pW91nzzZUvVleuaAWcpvsYK7795IL3NjcI2rN3UIpFmPnxL8ZhKMaW/L1vZKMbZRKIRGDe
 g28zPbbX5mQ1ougNJUNS1JVZX7WVGt5hYtKmztynoQfXCgu+D1QlwJmGZtALKgq/XDXhw9w+0WE
 LpZhEpXg27Kt2Ttvd+1ZSmz0znef0AWBG5amkZcSJM5Beux07OM0RRmyr7vGlXF18gL9qfhakLb
 HJMSbjiJ6U8+M8qL3nPktdpPUZ5JbkRBAw6wJ2LvMKSk2v8am5ZZhnwBGq8PVF7agBEuz+PKD0Q
 Q242QlVw
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689b760e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=TeOxguPX650c4vheapQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qc1_f6WLq4w7pBCUGU2Be3pH7mgNZ2nS
X-Proofpoint-GUID: qc1_f6WLq4w7pBCUGU2Be3pH7mgNZ2nS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_101246_890850_08DCF14E 
X-CRM114-Status: GOOD (  19.20  )
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

Relocate hw_init call from the shared probe path to target-specific
probe implementations. Handle Wi-Fi 7 initialization entirely within
its corresponding target-specific file.
Improve modularity by decoupling hardware-dependent initialization from
common probe logic. Support broader effort to separate shared and
target-specific code paths.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kiran Venkatappa <quic_kiranv@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ahb_wifi7.c |  8 ++++++++
 drivers/net/wireless/ath/ath12k/core.c      |  7 -------
 drivers/net/wireless/ath/ath12k/hw.h        |  2 --
 drivers/net/wireless/ath/ath12k/hw_wifi7.c  |  3 ++-
 drivers/net/wireless/ath/ath12k/hw_wifi7.h  | 13 +++++++++++++
 drivers/net/wireless/ath/ath12k/pci_wifi7.c |  8 ++++++++
 6 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb_wifi7.c b/drivers/net/wireless/ath/ath12k/ahb_wifi7.c
index 7a869722b77e639781fed45835872c38a50b8cfc..ff4f041bafbc452ec9c70c3d9f1ce648b43a26c7 100644
--- a/drivers/net/wireless/ath/ath12k/ahb_wifi7.c
+++ b/drivers/net/wireless/ath/ath12k/ahb_wifi7.c
@@ -11,6 +11,7 @@
 #include "ahb_wifi7.h"
 #include "debug.h"
 #include "hif.h"
+#include "hw_wifi7.h"
 
 static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5332-wifi",
@@ -26,6 +27,7 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	struct ath12k_ahb *ab_ahb;
 	enum ath12k_hw_rev hw_rev;
 	struct ath12k_base *ab;
+	int ret;
 
 	ab = platform_get_drvdata(pdev);
 	ab_ahb = ath12k_ab_to_ahb(ab);
@@ -42,6 +44,12 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
 	ab->hw_rev = hw_rev;
 
+	ret = ath12k_wifi7_hw_init(ab);
+	if (ret) {
+		ath12k_err(ab, "WiFi-7 hw_init for AHB failed: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b1a26027de3f8d83a7823fba94cc0ef1df38c7b7..8b6fb6a1593a322ceee86ecbd23c87ab9b72394b 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1744,13 +1744,6 @@ enum ath12k_qmi_mem_mode ath12k_core_get_memory_mode(struct ath12k_base *ab)
 int ath12k_core_pre_init(struct ath12k_base *ab)
 {
 	const struct ath12k_mem_profile_based_param *param;
-	int ret;
-
-	ret = ath12k_hw_init(ab);
-	if (ret) {
-		ath12k_err(ab, "failed to init hw params: %d\n", ret);
-		return ret;
-	}
 
 	param = &ath12k_mem_profile_based_param[ab->target_mem_mode];
 	ab->profile_param = param;
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 8ce11c3e6d5c21b2affef8cbe4b0b867e678faae..35d6900720feeef6d736df38dcc17402db6d5f8b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -377,6 +377,4 @@ static inline const char *ath12k_bd_ie_type_str(enum ath12k_bd_ie_type type)
 	return "unknown";
 }
 
-int ath12k_hw_init(struct ath12k_base *ab);
-
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/hw_wifi7.c b/drivers/net/wireless/ath/ath12k/hw_wifi7.c
index f6177f8e032d98774b4a041ecfe97187b55ed259..5f5d3c57b288c1ce9023a14e40cd2f12c9adc13f 100644
--- a/drivers/net/wireless/ath/ath12k/hw_wifi7.c
+++ b/drivers/net/wireless/ath/ath12k/hw_wifi7.c
@@ -13,6 +13,7 @@
 #include "ce.h"
 #include "ce_wifi7.h"
 #include "hw.h"
+#include "hw_wifi7.h"
 #include "mhi.h"
 #include "dp_rx.h"
 #include "peer.h"
@@ -1030,7 +1031,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 	},
 };
 
-int ath12k_hw_init(struct ath12k_base *ab)
+int ath12k_wifi7_hw_init(struct ath12k_base *ab)
 {
 	const struct ath12k_hw_params *hw_params = NULL;
 	int i;
diff --git a/drivers/net/wireless/ath/ath12k/hw_wifi7.h b/drivers/net/wireless/ath/ath12k/hw_wifi7.h
new file mode 100644
index 0000000000000000000000000000000000000000..643b6fdfdb66f0a854b305f72b0e124910067eb8
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/hw_wifi7.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI7_HW_H
+#define ATH12K_WIFI7_HW_H
+
+struct ath12k_base;
+int ath12k_wifi7_hw_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI7_HW_H */
diff --git a/drivers/net/wireless/ath/ath12k/pci_wifi7.c b/drivers/net/wireless/ath/ath12k/pci_wifi7.c
index 8c7718153534ca0f30d33ef954d6c542ae70154a..a680cd9a04e33af1340393429773aea497461412 100644
--- a/drivers/net/wireless/ath/ath12k/pci_wifi7.c
+++ b/drivers/net/wireless/ath/ath12k/pci_wifi7.c
@@ -11,6 +11,7 @@
 #include "core.h"
 #include "hif.h"
 #include "mhi.h"
+#include "hw_wifi7.h"
 
 #define QCN9274_DEVICE_ID		0x1109
 #define WCN7850_DEVICE_ID		0x1107
@@ -84,6 +85,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 	u32 soc_hw_version_major, soc_hw_version_minor;
 	struct ath12k_pci *ab_pci;
 	struct ath12k_base *ab;
+	int ret;
 
 	ab = pci_get_drvdata(pdev);
 	if (!ab)
@@ -143,6 +145,12 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		return -EOPNOTSUPP;
 	}
 
+	ret = ath12k_wifi7_hw_init(ab);
+	if (ret) {
+		dev_err(&pdev->dev, "WiFi-7 hw_init for PCI failed: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 

-- 
2.34.1


