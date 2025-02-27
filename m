Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7F4C19F32
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1VrP7jmMMW60dreq3vYBwRfM7LdCPQK65BMku7L0gY=; b=cGV9LgwiVGImTTqs4dt/k4zojR
	5u1SToS2VAZr6jEU9YUMl1WgwUTv4aNEncjbZ8I7PqDTdEJgJBsfPjHhqi6zht6HlDqzIyVXf1o9K
	PJLCFb5yoo/Cq7Ya0gnnsAu73xKM5XczvVYK6ToGS4/asyZnGinzzGsgWQmVco/hJ8Tu+qxjpHKqZ
	PjxxXsMmHbAsuQYEc4RoieSmZS8P8bvM4jqL34mdWNAqz+2jbl3O+FlOpFJ98COLPDnxkY9ZvdobH
	a4TMBnAmCihyjM+yTD6QMMB5F4Q399o5XOHtyOnayQmpDHGuabMiakDy265sRQX7yEKx4Ol/1Wn2I
	wyRMRstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjnI-00000008f2r-1B8p
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 19:43:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjIY-00000008Ps3-1Rd0
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 19:11:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RHuaDk025832;
	Thu, 27 Feb 2025 19:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1VrP7jmMMW60dreq3vYBwRfM7LdCPQK65BMku7L0gY=; b=PmDyxx0cM4r0jjdP
	AM7JmsDM0k9KaBflnu5jK9Bn+dKIIb1ThQkfe1ZDz1nAy8YrYxGH4KDju76dqAK5
	iD/15ru2C0V8emPONaFZlNFRzS+X6GnYaLSLhC6BrgB2G/OqPrO5K5cHtKXa582Q
	6jHLsqcv4XE8ML8cWHV61LFIIGUz0eoQyWRiS3yx/2uqcwEfQePOj26+T/uPd1p+
	s4kz6qkbhZOSEynvnaWnySHiJLgzmfa+LxShViSTJ7CCMa0kwzQq8howAr2AXb6g
	29Q1gnH0nq1aoeZzRKhB3dDdY6/7fKRY/m/bACVXYQPrVvpkLD0u7crWVBHH85wf
	BIn0yA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmprus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 19:11:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RJBo1m025555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 19:11:50 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 11:11:46 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Balamurugan S
	<quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        "Raj
 Kumar Bhagat" <quic_rajkbhag@quicinc.com>
Subject: [PATCH v7 13/13] wifi: ath12k: enable ath12k AHB support
Date: Fri, 28 Feb 2025 00:40:34 +0530
Message-ID: <20250227191034.1949954-14-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227191034.1949954-1-quic_rajkbhag@quicinc.com>
References: <20250227191034.1949954-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sjho38X-IZDswiL-hFzjdvtDfWfrQxt6
X-Proofpoint-ORIG-GUID: sjho38X-IZDswiL-hFzjdvtDfWfrQxt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502270142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_111154_509740_FE742C51 
X-CRM114-Status: GOOD (  19.71  )
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

From: Balamurugan S <quic_bselvara@quicinc.com>

Currently only PCI devices are supported in Ath12k driver. Refactor
Ath12k module_init and module_exit to include Ath12k AHB support.

Add Ath12k AHB support in Kconfig with dependency on Remoteproc
driver. Ath12k AHB support relies on remoteproc driver for firmware
download, power up/down etc.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/Kconfig  |  6 ++++
 drivers/net/wireless/ath/ath12k/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/ahb.h    | 11 ++++++++
 drivers/net/wireless/ath/ath12k/core.c   | 35 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/pci.c    | 10 ++-----
 drivers/net/wireless/ath/ath12k/pci.h    |  4 ++-
 6 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 52a1bb19e3da..b2bfcaca00b3 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -15,6 +15,12 @@ config ATH12K
 
 	  If you choose to build a module, it'll be called ath12k.
 
+config ATH12K_AHB
+	bool "QTI ath12k AHB support"
+	depends on ATH12K && REMOTEPROC && QCOM_Q6V5_WCSS_SEC
+	help
+	  Enable support for Ath12k AHB bus chipsets, example IPQ5332.
+
 config ATH12K_DEBUG
 	bool "ath12k debugging"
 	depends on ATH12K
diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 60644cb42c76..d95ee525a6cd 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -23,6 +23,7 @@ ath12k-y += core.o \
 	    fw.o \
 	    p2p.o
 
+ath12k-$(CONFIG_ATH12K_AHB) += ahb.o
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
 ath12k-$(CONFIG_ATH12K_TRACING) += trace.o
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index f8a5c43075c1..d56244b20a6a 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -66,4 +66,15 @@ static inline struct ath12k_ahb *ath12k_ab_to_ahb(struct ath12k_base *ab)
 	return (struct ath12k_ahb *)ab->drv_priv;
 }
 
+#ifdef CONFIG_ATH12K_AHB
+int ath12k_ahb_init(void);
+void ath12k_ahb_exit(void);
+#else
+static inline int ath12k_ahb_init(void)
+{
+	return 0;
+}
+
+static inline void ath12k_ahb_exit(void) {};
+#endif
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 5bd852f9572b..e63ab7f77260 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -10,15 +10,18 @@
 #include <linux/firmware.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
+#include "ahb.h"
 #include "core.h"
 #include "dp_tx.h"
 #include "dp_rx.h"
 #include "debug.h"
-#include "hif.h"
-#include "fw.h"
 #include "debugfs.h"
+#include "fw.h"
+#include "hif.h"
+#include "pci.h"
 #include "wow.h"
 
+static int ahb_err, pci_err;
 unsigned int ath12k_debug_mask;
 module_param_named(debug_mask, ath12k_debug_mask, uint, 0644);
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
@@ -2020,5 +2023,31 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	return NULL;
 }
 
-MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11be wireless LAN cards.");
+static int ath12k_init(void)
+{
+	ahb_err = ath12k_ahb_init();
+	if (ahb_err)
+		pr_warn("Failed to initialize ath12k AHB device: %d\n", ahb_err);
+
+	pci_err = ath12k_pci_init();
+	if (pci_err)
+		pr_warn("Failed to initialize ath12k PCI device: %d\n", pci_err);
+
+	/* If both failed, return one of the failures (arbitrary) */
+	return ahb_err && pci_err ? ahb_err : 0;
+}
+
+static void ath12k_exit(void)
+{
+	if (!pci_err)
+		ath12k_pci_exit();
+
+	if (!ahb_err)
+		ath12k_ahb_exit();
+}
+
+module_init(ath12k_init)
+module_exit(ath12k_exit)
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11be WLAN devices");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index b474696ac6d8..e62b172c7f9f 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1831,7 +1831,7 @@ static struct pci_driver ath12k_pci_driver = {
 	.driver.pm = &ath12k_pci_pm_ops,
 };
 
-static int ath12k_pci_init(void)
+int ath12k_pci_init(void)
 {
 	int ret;
 
@@ -1844,14 +1844,8 @@ static int ath12k_pci_init(void)
 
 	return 0;
 }
-module_init(ath12k_pci_init);
 
-static void ath12k_pci_exit(void)
+void ath12k_pci_exit(void)
 {
 	pci_unregister_driver(&ath12k_pci_driver);
 }
-
-module_exit(ath12k_pci_exit);
-
-MODULE_DESCRIPTION("Driver support for Qualcomm Technologies PCIe 802.11be WLAN devices");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 31584a7ad80e..521fa72333bb 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #ifndef ATH12K_PCI_H
 #define ATH12K_PCI_H
@@ -145,4 +145,6 @@ void ath12k_pci_stop(struct ath12k_base *ab);
 int ath12k_pci_start(struct ath12k_base *ab);
 int ath12k_pci_power_up(struct ath12k_base *ab);
 void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend);
+int ath12k_pci_init(void);
+void ath12k_pci_exit(void);
 #endif /* ATH12K_PCI_H */
-- 
2.34.1


