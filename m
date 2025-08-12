Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59A6CA0EE0
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xY5IPFnWIXP7eI6RM3DMx+ivoo6bApufFVFadbz0dL4=; b=3d8bcrfBcsftrH24cySULI7QiN
	xNZOC79rAdW395HnfBRQYZYVvDG3HQShMhhVLlpsGUmwKyzuAAH6ly2pWG54qHtg3+R5skj/g9k/5
	Qn1haKIqktNgkxLcZ1D22bJyLOqbdTPJ8PhRKDIlGJp59sAoV6tUmB5SQaI1PGadygPHXQbC7y/j2
	E1eBmabZzEl6s7BrBnvRLx+UhWQoipttG4PLooGOdw/Lm52OlqMroHOUxFLnrzx9PvhThrthI5P+W
	r+/qssqqNWA0ris4E6P2b3474AIxdBevEvJ9yrdab+9KTvOC20tkR3XjjZZDXC3wDUc7zR/M+81he
	NMB9NOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulufs-0000000Bqaq-24Jv;
	Tue, 12 Aug 2025 19:28:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsYC-0000000BWTE-2ywm
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 17:12:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvh7w021060;
	Tue, 12 Aug 2025 17:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xY5IPFnWIXP7eI6RM3DMx+ivoo6bApufFVFadbz0dL4=; b=bqIBfBwRbdxZcZRz
	JVN9B4BTNx3mGFI1UTdVuKzZBsnFzXB9HzeUtavZ3HS1EdcNPvIZf/g36J0KECMY
	bqlXT+ubNWJwgpTdm25rLgBcnU10q05snBeD9rDtpoTd0yR1+QWtnSdUcu2lZPpt
	hHySStFruThBBtbvh8SRz8GqjQj+qEg4pEE6MgqYv7+sYvJJm2l+mJgWLlTEA6Lt
	SKS5IlzFeL8KnnhXYDrjNouTqb+xeXfULzdzNymK7p6ESRVUV6+4LgzWNoZRR3Ns
	C2Jjj4lHaG8Q5B/cLmMaR6vWDr7kzX6H/do07toOQhpNyTmX3fIdND8FcPlFqK2E
	hT5DZw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6mtv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CHCdIS010536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:39 GMT
Received: from hu-kiranv-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 10:12:38 -0700
From: Kiran Venkatappa <quic_kiranv@quicinc.com>
Date: Tue, 12 Aug 2025 22:39:30 +0530
Subject: [PATCH ath12k-ng 04/13] wifi: ath12k: Move Wi-Fi 7 MHI
 configuration to dedicated file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-ath12k-mod-v1-4-8c9b0eb9335d@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX0II1NfqLaDVU
 P8+1vzg1UsNY0jGsjmmTgKjP8lPpwlQLNRaj0pNrnL09dlDIgtwYT0YyopEMk/h6FUi2oD1ZTV+
 RkphNZk1BpvOsgxP18XjVVJSqONwDme9/Lkf7iEMO9XelNCLttlcG4+y4gR//kfJUDXg5DduSbn
 Mo6k5/82IXawcCNp5my4zHv/MkVFpujXVtQicc6bvbS4ZK4JbN1gqRY8ayboyCqnC7ormexcOXy
 oBnCbN7zWkhWG5aHyHTaDUh91SQfO8OG8hWLBfu1Uybhv4hPRmma9yF6304hPfDxjd1pIXEkxe9
 n3HkSPs5MsENl4EF+SqlpT2+FbIhRDfsIQaxxX8zuAvZR9D8M+9IZQNDgtDAU6Swy+0+N6wJHgP
 Nn6rBhhL
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689b7608 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=wRfEwKhB0IFq5YI-txcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ck-olH98IdcJBK68SR1OKaVL6Y4gYLLq
X-Proofpoint-ORIG-GUID: Ck-olH98IdcJBK68SR1OKaVL6Y4gYLLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_101240_763529_B4D661BD 
X-CRM114-Status: GOOD (  19.30  )
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

Relocate target-specific MHI configuration to a new mhi_wifi7.c file to
isolate Wi-Fi 7 related logic from the common codebase.
Improve modularity by separating hardware-dependent code from shared
components.
Enhance maintainability and prepare the driver for clean integration of
additional device families.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kiran Venkatappa <quic_kiranv@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/Makefile    |   1 +
 drivers/net/wireless/ath/ath12k/hw.c        |   1 +
 drivers/net/wireless/ath/ath12k/mhi.c       | 130 --------------------------
 drivers/net/wireless/ath/ath12k/mhi.h       |   4 +-
 drivers/net/wireless/ath/ath12k/mhi_wifi7.c | 138 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mhi_wifi7.h |  11 +++
 6 files changed, 152 insertions(+), 133 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index ee075ee68bb834e3f3605b13a5fee6afff0ba763..fb968884f6560ed8dfeabba0e0a1562a98576313 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -20,6 +20,7 @@ ath12k-y += core.o \
 	    dbring.o \
 	    hw.o \
 	    mhi.o \
+	    mhi_wifi7.o \
 	    pci.o \
 	    pci_wifi7.o \
 	    dp_mon.o \
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index df1b4439adc798dc0dfb7d8604874a4fcb77663b..ad372feaef28be9149f86008453409dad5c5d4f7 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -17,6 +17,7 @@
 #include "dp_rx.h"
 #include "peer.h"
 #include "wmi_wifi7.h"
+#include "mhi_wifi7.h"
 
 static const guid_t wcn7850_uuid = GUID_INIT(0xf634f534, 0x6147, 0x11ec,
 					     0x90, 0xd6, 0x02, 0x42,
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 08f44baf182a5e34651e8c117fe279942f8ad8f4..1f680f6e65d30ac5fd98ad59df90eb9e629746dd 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -18,136 +18,6 @@
 #define OTP_VALID_DUALMAC_BOARD_ID_MASK		0x1000
 #define MHI_CB_INVALID	0xff
 
-static const struct mhi_channel_config ath12k_mhi_channels_qcn9274[] = {
-	{
-		.num = 20,
-		.name = "IPCR",
-		.num_elements = 32,
-		.event_ring = 1,
-		.dir = DMA_TO_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
-	{
-		.num = 21,
-		.name = "IPCR",
-		.num_elements = 32,
-		.event_ring = 1,
-		.dir = DMA_FROM_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = true,
-	},
-};
-
-static struct mhi_event_config ath12k_mhi_events_qcn9274[] = {
-	{
-		.num_elements = 32,
-		.irq_moderation_ms = 0,
-		.irq = 1,
-		.data_type = MHI_ER_CTRL,
-		.mode = MHI_DB_BRST_DISABLE,
-		.hardware_event = false,
-		.client_managed = false,
-		.offload_channel = false,
-	},
-	{
-		.num_elements = 256,
-		.irq_moderation_ms = 1,
-		.irq = 2,
-		.mode = MHI_DB_BRST_DISABLE,
-		.priority = 1,
-		.hardware_event = false,
-		.client_managed = false,
-		.offload_channel = false,
-	},
-};
-
-const struct mhi_controller_config ath12k_mhi_config_qcn9274 = {
-	.max_channels = 30,
-	.timeout_ms = 10000,
-	.use_bounce_buf = false,
-	.buf_len = 0,
-	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_qcn9274),
-	.ch_cfg = ath12k_mhi_channels_qcn9274,
-	.num_events = ARRAY_SIZE(ath12k_mhi_events_qcn9274),
-	.event_cfg = ath12k_mhi_events_qcn9274,
-};
-
-static const struct mhi_channel_config ath12k_mhi_channels_wcn7850[] = {
-	{
-		.num = 20,
-		.name = "IPCR",
-		.num_elements = 64,
-		.event_ring = 1,
-		.dir = DMA_TO_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = false,
-	},
-	{
-		.num = 21,
-		.name = "IPCR",
-		.num_elements = 64,
-		.event_ring = 1,
-		.dir = DMA_FROM_DEVICE,
-		.ee_mask = 0x4,
-		.pollcfg = 0,
-		.doorbell = MHI_DB_BRST_DISABLE,
-		.lpm_notify = false,
-		.offload_channel = false,
-		.doorbell_mode_switch = false,
-		.auto_queue = true,
-	},
-};
-
-static struct mhi_event_config ath12k_mhi_events_wcn7850[] = {
-	{
-		.num_elements = 32,
-		.irq_moderation_ms = 0,
-		.irq = 1,
-		.mode = MHI_DB_BRST_DISABLE,
-		.data_type = MHI_ER_CTRL,
-		.hardware_event = false,
-		.client_managed = false,
-		.offload_channel = false,
-	},
-	{
-		.num_elements = 256,
-		.irq_moderation_ms = 1,
-		.irq = 2,
-		.mode = MHI_DB_BRST_DISABLE,
-		.priority = 1,
-		.hardware_event = false,
-		.client_managed = false,
-		.offload_channel = false,
-	},
-};
-
-const struct mhi_controller_config ath12k_mhi_config_wcn7850 = {
-	.max_channels = 128,
-	.timeout_ms = 2000,
-	.use_bounce_buf = false,
-	.buf_len = 8192,
-	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_wcn7850),
-	.ch_cfg = ath12k_mhi_channels_wcn7850,
-	.num_events = ARRAY_SIZE(ath12k_mhi_events_wcn7850),
-	.event_cfg = ath12k_mhi_events_wcn7850,
-};
-
 void ath12k_mhi_set_mhictrl_reset(struct ath12k_base *ab)
 {
 	u32 val;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.h b/drivers/net/wireless/ath/ath12k/mhi.h
index 7358b8477536a636743f4fd16d37500a8d458ab1..5e1363650a9a75ff4770e0cb64b6986ca2c5e8a7 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.h
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _ATH12K_MHI_H
 #define _ATH12K_MHI_H
@@ -31,9 +32,6 @@ enum ath12k_mhi_state {
 	ATH12K_MHI_RDDM_DONE,
 };
 
-extern const struct mhi_controller_config ath12k_mhi_config_qcn9274;
-extern const struct mhi_controller_config ath12k_mhi_config_wcn7850;
-
 int ath12k_mhi_start(struct ath12k_pci *ar_pci);
 void ath12k_mhi_stop(struct ath12k_pci *ar_pci, bool is_suspend);
 int ath12k_mhi_register(struct ath12k_pci *ar_pci);
diff --git a/drivers/net/wireless/ath/ath12k/mhi_wifi7.c b/drivers/net/wireless/ath/ath12k/mhi_wifi7.c
new file mode 100644
index 0000000000000000000000000000000000000000..be74df152f6f88c1c723459a1cdea21f45b0d15b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/mhi_wifi7.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "mhi.h"
+#include "mhi_wifi7.h"
+
+static const struct mhi_channel_config ath12k_mhi_channels_qcn9274[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = true,
+	},
+};
+
+static struct mhi_event_config ath12k_mhi_events_qcn9274[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_mhi_config_qcn9274 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_qcn9274),
+	.ch_cfg = ath12k_mhi_channels_qcn9274,
+	.num_events = ARRAY_SIZE(ath12k_mhi_events_qcn9274),
+	.event_cfg = ath12k_mhi_events_qcn9274,
+};
+
+static const struct mhi_channel_config ath12k_mhi_channels_wcn7850[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 64,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 64,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = true,
+	},
+};
+
+static struct mhi_event_config ath12k_mhi_events_wcn7850[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_CTRL,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_mhi_config_wcn7850 = {
+	.max_channels = 128,
+	.timeout_ms = 2000,
+	.use_bounce_buf = false,
+	.buf_len = 8192,
+	.num_channels = ARRAY_SIZE(ath12k_mhi_channels_wcn7850),
+	.ch_cfg = ath12k_mhi_channels_wcn7850,
+	.num_events = ARRAY_SIZE(ath12k_mhi_events_wcn7850),
+	.event_cfg = ath12k_mhi_events_wcn7850,
+};
diff --git a/drivers/net/wireless/ath/ath12k/mhi_wifi7.h b/drivers/net/wireless/ath/ath12k/mhi_wifi7.h
new file mode 100644
index 0000000000000000000000000000000000000000..8417a2bde0877d9a377c8dd4befc24a042f3b629
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/mhi_wifi7.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI7_MHI_H
+#define _ATH12K_WIFI7_MHI_H
+extern const struct mhi_controller_config ath12k_mhi_config_qcn9274;
+extern const struct mhi_controller_config ath12k_mhi_config_wcn7850;
+#endif /* _ATH12K_WIFI7_MHI_H */

-- 
2.34.1


