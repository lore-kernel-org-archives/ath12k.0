Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28864E7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8F6IIIUDruDCqpHYbeb8jF26ziBHJJCbUJR/ebXKLX8=; b=KL0VBUNfsEBQEQgo8LVYUUaxkr
	vX/Dy0IjstG4dxOZ7fhhI67TkKZIEjdzdOe+K+Hmz7DAaTWH8ktiF02INr/Vn6bWilSX4DJ4hJ0jA
	sY9ehzchVgMMddwLh7pXb94pCFZ4A3Lf+i0tr5890ya0u4G6na/sWlpifAiWj2rZEAteDSghm4zbA
	pBhVqy+4ZIAwtgzGKpHhxJBKBJJTwTEQdCUfQeL/AoFJU/GlIbNrGsyR5iUySQ6Xl0dLoUfN1/PH7
	VuSyIvvS7fH1CXOW69vDTv36NLz1gnzsT4OdwlwyhbfiqE7LrIJSOB9tmsTJ8FP54vbO1rV8fnFhD
	fO9hrsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh56-00000008d13-3tkA
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 16:58:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh53-00000008czS-2cP7
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 16:57:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9Gnpff001738;
	Mon, 9 Dec 2024 16:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8F6IIIUDruDCqpHYbeb8jF26ziBHJJCbUJR/ebXKLX8=; b=IXhqE4edXpWyQzvH
	93YA6h0T/O+F7b9belOgvFbR9sC1VyJ1yGalEwgs5WXQeakLxjd4K9KvcilyqLnU
	czoVGIpJ+lyDhs42emcJiBOQpB6usAZLXyqYchGyq0T4kqqIgwRCEqAR2rcsURPg
	l7yKMYAQjVg8gIARIUUV3ZbfiTRn84sjQAokqOyJnI+QkoxUoT8GFeofZIUCfXLf
	aQp7fExj5dThO+OyNRHzL86s00Ga65F3kONlbdDa+II+UiW+h9GO0bmjcSga5sJV
	pJTNibJy3rqwk3xeDO0fM6ppvBahHIUagd7qXEkqhCGSB9yqgKc01qjeH8A7bFWp
	aMh44w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdc6dnuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 16:57:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9GvrRJ019445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 16:57:53 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 08:57:49 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-kernel@vger.kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        "P
 Praneesh" <quic_ppranees@quicinc.com>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 13/13] wifi: ath12k: enable ath12k AHB support
Date: Mon, 9 Dec 2024 22:26:44 +0530
Message-ID: <20241209165644.1680167-14-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209165644.1680167-1-quic_rajkbhag@quicinc.com>
References: <20241209165644.1680167-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CSsKsfVAGmJqoy_5ZHE7N9rjovRlb9IY
X-Proofpoint-GUID: CSsKsfVAGmJqoy_5ZHE7N9rjovRlb9IY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_085757_788278_B6893930 
X-CRM114-Status: GOOD (  17.74  )
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
 drivers/net/wireless/ath/ath12k/ahb.h    | 12 ++++++++
 drivers/net/wireless/ath/ath12k/core.c   | 35 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/pci.c    | 12 ++------
 drivers/net/wireless/ath/ath12k/pci.h    |  2 ++
 6 files changed, 56 insertions(+), 12 deletions(-)

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
index b5bb3e2599cd..4aeb6b95baa4 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -23,6 +23,7 @@ ath12k-y += core.o \
 	    fw.o \
 	    p2p.o
 
+ath12k-$(CONFIG_ATH12K_AHB) += ahb.o
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o
 ath12k-$(CONFIG_ACPI) += acpi.o
 ath12k-$(CONFIG_ATH12K_TRACING) += trace.o
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index 0dbbbfd45eab..fc21211c01dd 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -65,4 +65,16 @@ static inline struct ath12k_ahb *ath12k_ab_to_ahb(struct ath12k_base *ab)
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
+
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 49d1ac15cb7a..941924630bcb 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -9,15 +9,18 @@
 #include <linux/remoteproc.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
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
@@ -1685,5 +1688,31 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
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
index 06cff3849ab8..a5ae66f0ee1f 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1821,7 +1821,7 @@ static struct pci_driver ath12k_pci_driver = {
 	.driver.pm = &ath12k_pci_pm_ops,
 };
 
-static int ath12k_pci_init(void)
+int ath12k_pci_init(void)
 {
 	int ret;
 
@@ -1832,16 +1832,10 @@ static int ath12k_pci_init(void)
 		return ret;
 	}
 
-	return 0;
+	return ret;
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
index 31584a7ad80e..18648ca11dfc 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -145,4 +145,6 @@ void ath12k_pci_stop(struct ath12k_base *ab);
 int ath12k_pci_start(struct ath12k_base *ab);
 int ath12k_pci_power_up(struct ath12k_base *ab);
 void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend);
+int ath12k_pci_init(void);
+void ath12k_pci_exit(void);
 #endif /* ATH12K_PCI_H */
-- 
2.34.1


