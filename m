Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5FECA0EED
	for <ath12k@archiver.kernel.org>; Thu, 28 Aug 2025 21:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxZQL8egaO+cIlc8kUFJopTiPy8eppVHu75dQyHfOq8=; b=X+ng/0HpCvCNk6kp1JEHsdCT7A
	DsJMDmPxdjKtBHpGPpBkCqp8tTxe6MW09XUB0yKMMdI41p7bP4Dqj5asJQKnVuGinxgxSoaG4TcPi
	XH8zrYJDX8HTyN0iSPgdH/KHmbSU8lHtQFMl7W8yzkf2QZyMpdi490+eUSQDXBAnWq2g/GYXNbJxE
	Spa56FseC439cPKCAiDQ7lPiOoHYeH1/LtwuDfERkWRTiS3WQSWkMlq53105NNHAy1rDx/3xLu8aG
	UwL8U9XN7S1egITVnqJ6Bkn3cUlMf40frhaSdeNuZCWyU6HURHGq6sreFDLflPtIv7OJcU7svFKln
	F/t6nryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urk7U-00000003LJc-0fng;
	Thu, 28 Aug 2025 21:25:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgXk-00000002Yb1-3Whj
	for ath12k@lists.infradead.org;
	Thu, 28 Aug 2025 17:36:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SERbBm027503;
	Thu, 28 Aug 2025 17:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxZQL8egaO+cIlc8kUFJopTiPy8eppVHu75dQyHfOq8=; b=jMrUhu+lqM7ui8DY
	K0xuJEYuZzJ0AvFWcVFP1YhAGKGQNBteVUBk4f2NA3KsJFQ4vIXZ5wsPjLTYy1J5
	z+8yRisib7q/l+QYTedgPCu/lvXDE5uum9SBGh9ichO57xwIr9zLidbDYJNqy+//
	Hz3sjGBYy52+WoUPrc4mxjc3+VV9fZDObVwRDjGgnQTa9Jblt/g0bbmVv7bLYRkE
	o/KLlMblHekCs+ZCND6al1EOLKKVS3Lc009IoKEywmKMNeIWaWGnpiQWkTdzE6GT
	iDqh61Xp5kTbLGtnA9ucqyYUpqRhDJDYpuI864Y2hdCkNfhCaDtBveln0RHklCUh
	mO4BpQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se17050k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SHaBS3003501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:11 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 10:36:10 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 01/20] wifi: ath12k: Move hal_tx and hal_rx to wifi7 directory
Date: Thu, 28 Aug 2025 23:05:34 +0530
Message-ID: <20250828173553.3341351-2-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
References: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SD7LXPj9becZvN7F0Y6RnYLIO3AFMQx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfXzE1sdDagwJ9c
 RfXHDNIpTnodCQ8j+hIZ5x2mrsMNk+6Xt+iefCn4AUCLO9elTEJvz4T4+EZR/97s00Baz126K+2
 cN3M5/O6Dl2ssJ/I8rNN4qGOK5RV2gvgmUqvARIPI6EGLIRh8bl7NlZx9Vk23AmudiyNIYxT9DX
 AwyZ21B8IhlgJho6OVIQvN65nZpclJ2orA0GAkxIfuKYTRTZi4oQbi49T6ZRwd9CpP5DFYc+db+
 OQ9xdal98TCKEFooOAv3kjw+VrXqSTPtPnGV5Lyer8KhZIpIgnJntl6z1F7WeyQmRymnasL2jmJ
 gd6xUOPNd8nhr+b5drxlY6oqJKsZnq4JK6x1EP6mz0LjSSaZVEQzzpgm2BMah3k6craPHsoBVEI
 TnGph02u
X-Proofpoint-ORIG-GUID: SD7LXPj9becZvN7F0Y6RnYLIO3AFMQx9
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b0938c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=88aliKi4RoGy_8v3A6YA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_103612_887061_7D5059CF 
X-CRM114-Status: GOOD (  12.18  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Move architecture-specific files hal_rx.c and hal_tx.c into the wifi7
directory as part of a broader effort to separate common and hardware
-specific code into distinct modules. This modularization enables reuse
of the common driver components across multiple hardware architectures.

The relocated files remain part of ath12k.ko temporarily, until the
corresponding infra for movement to the ath12k_wifi7.ko arrives in
upcoming patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/Makefile           |  5 +++--
 .../net/wireless/ath/ath12k/{ => wifi7}/hal_rx.c   | 14 +++++++-------
 .../net/wireless/ath/ath12k/{ => wifi7}/hal_tx.c   | 10 +++++-----
 3 files changed, 15 insertions(+), 14 deletions(-)
 rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_rx.c (99%)
 rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_tx.c (96%)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 8dd77729f52f..b34cf83a24eb 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -2,8 +2,6 @@
 obj-$(CONFIG_ATH12K) += ath12k.o
 ath12k-y += core.o \
 	    hal.o \
-	    hal_tx.o \
-	    hal_rx.o \
 	    wmi.o \
 	    mac.o \
 	    reg.o \
@@ -24,6 +22,9 @@ ath12k-y += core.o \
 
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o
 
+ath12k-y += wifi7/hal_tx.o \
+	    wifi7/hal_rx.o \
+
 obj-$(CONFIG_ATH12K) += wifi7/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
similarity index 99%
rename from drivers/net/wireless/ath/ath12k/hal_rx.c
rename to drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
index 48aa48c48606..a25b21740e08 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c
@@ -1,15 +1,15 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include "debug.h"
-#include "hal.h"
-#include "hal_tx.h"
-#include "hal_rx.h"
-#include "hal_desc.h"
-#include "hif.h"
+#include "../debug.h"
+#include "../hal.h"
+#include "../hif.h"
+#include "../hal_tx.h"
+#include "../hal_rx.h"
+#include "../hal_desc.h"
 
 static void ath12k_hal_reo_set_desc_hdr(struct hal_desc_header *hdr,
 					u8 owner, u8 buffer_type, u32 magic)
diff --git a/drivers/net/wireless/ath/ath12k/hal_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c
similarity index 96%
rename from drivers/net/wireless/ath/ath12k/hal_tx.c
rename to drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c
index 869e07e406fe..f58da63a1b02 100644
--- a/drivers/net/wireless/ath/ath12k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c
@@ -1,13 +1,13 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include "hal_desc.h"
-#include "hal.h"
-#include "hal_tx.h"
-#include "hif.h"
+#include "../hal_desc.h"
+#include "../hal.h"
+#include "../hal_tx.h"
+#include "../hif.h"
 
 #define DSCP_TID_MAP_TBL_ENTRY_SIZE 64
 
-- 
2.34.1


