Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70367D66B87
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWrmA6fW3PhjppUon/QPWjAWhbRLPQ3SUpfNWS5hDIU=; b=DkcOLNIXqWMULR6148h3/ilqcG
	B5Ltu9eQRxZLQGZTzTwn6Er4tNQG3JC9X/woFT1iNnl1mc/eMGXng8kIrsHK5yHFiydLrML6CrmXF
	PWIMRVVa60CNWF09RsTlJJ8d5rZRisjrt+mlxFIrxCzYO5NlHUpVSFakZzACR/760Z79rgCoF4ORM
	kHRPJlzg71KoHVq9U2QVR47JSFq5JgIWLzq8woC0A2c8pi2IrUff5VGOKVmu03Wuxitjda2GJhVGd
	WrbTv1DJQ/OwULkBJ5/QE9QJvRbhFxB0R1tXwk1vBfGgQynXfyGfMPebuLSwbyjnpA/BzZzFMnbD4
	XIVZIZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Eh-00000007ftR-0WP0;
	Thu, 18 Dec 2025 01:55:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ee-00000007frB-1hAc
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YqdI174588
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWrmA6fW3PhjppUon/QPWjAWhbRLPQ3SUpfNWS5hDIU=; b=pmcJrTxX3tHaNE1h
	cg0LcSbjXQ7tmxA3Q5+CFUVDhEcK0UavVSlwveflcwwsau+HTga6mPghsiQ+SKop
	5N2QDdAWVcv9VpUhRPcC1uP9sHp3I5D96/jG4xVv9dPuQCvcT5xeo4IK0YVnAFbH
	ZKOhwfhUB8E0Yclvva4GE1khKgqGZDlNhfchpbXjY/TFdeqEo0ODgc4nid0UPZzO
	SpUh3Ordgw+bvtvUQNC9e8NqUnCG4VvfOfnOTDRtUfNIjQurtI8ZfNZUbBhC6iaI
	uqThL/wGT/W9oL5IXhG3TmVtLe8D4t57/P/kxyV6l4emzoiWjmKKVl5xL95MuOiB
	qdx+mA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmrqqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d59f0198so1935395ad.1
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022919; x=1766627719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWrmA6fW3PhjppUon/QPWjAWhbRLPQ3SUpfNWS5hDIU=;
        b=U99JmVB7RTX1Dr6KaPIYJXxn4Nw+pTnIHB5RZJxwe9gBhnEhaDLojtZqe39GJhr8kY
         gTzQ3aJ+4caHgBz8t4J8KQmgVf9ZNtIEdXQfMIsyz/luMXIZpnuR3QWBMdNosPc/QbiY
         +9WVLuewnbrlN0CqwIHlzop+mWobc9SZSoly7P3lQEGuzkPeDtqn7r7C9swlWTM4F3ez
         /TpLj+JcTpKXPgnY1mbtDHDorF/cWFklkFiq+FMJWfH2G/5SLHrh8jYKqopkDu+OQB/F
         EkXB2jjF8WLh6BmPnTmJa7ppYuhoVY0ZM7IJTOUli00QZEuee+jxvdVUGV89Q93+SowL
         ZL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022919; x=1766627719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWrmA6fW3PhjppUon/QPWjAWhbRLPQ3SUpfNWS5hDIU=;
        b=PrtY/XlXlEqwol+AbHZUXVmQlLx+LfsdAtojTcRbG7XkTUmYPD1St5owwqc1XqYcvY
         KeZhYd9E9escffdlL4DK7UuAxcL+XdVNaatoDajyibLbxnpz8yX+KnVrCmWxwS0gvcXU
         t6X2i9oaKM4HBSmN+0MAF0YUzTYMiB0BpTNkcGzC1b3GACpeu+Hvue+/K56A6Q474bq6
         cbXoNifspv01xHV4Y/IzEdnDk3sD2y2DsUbTvtPDeWCy1pZ83eFp21ELMmXJmzPQ4ueY
         6lot49c0RjcFU19/sw3O5CC51LSonUROzws8wG+K50G1yCmU1ElgFpIP8t5DrM+0/pg+
         t1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq11opiEVNY6lxJC0svJ1ZOkdao916ps3gsSCFgjmCOjoDxONaUo0KzqGy0McLlnz+cmTbejk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtLr8mNXQW/KxNbis6aNbuPiMxOErW2dCxPrKcMd/s65J/MaLV
	LabY1UQJ1tHft9IcZN9/tqPgyj/X0+r1Skt5qh7N91UcB+xZJrYqVyCod3WvHbr4j0J47x5eqEl
	P601m6NZP7P9lYNKwuTwKaODG/Blfm7+qIDzK4eqtlg1KMLauWfEqIeXaOvJJWwF7fO+LgLkK3B
	4=
X-Gm-Gg: AY/fxX6NtCa4mU1zpe565Itv7AWE26dCg7sFgUVqLHTVNz8+QrREB+zEbZ/WV8MBePC
	JPPDfCbhsYfh9idnpxqabhMXh/1r8oawl+kzRPqd5j4CNfNxQBi1AF8hWPi18v6TYkRZ45FcfKb
	focPqcYRvMgpnEbaXCDejNMZe8ReZ0kdq4zBboM09UtPQyD6K7k+eLXguEEhToPXARNV+u7UYv2
	RjnkGcUwLk2En7WdNwyC1M7Km+s17vQbYykudEjQPA3y4NiBM2/KBq88ccd9eW/3PJ9v84XxI2+
	bYiTz234EI9cAEF/ZE2HnFQEzgPPGnggartWzkpzINSzTL5Epx7ozp1Mo8lSxvL89erZWkf7wlx
	YDnA8pwcC2LpVRFPykpZ2qwntfv7brzI9OZ9IRk2gusg0omdh7M2/lbHRwErnA7M=
X-Received: by 2002:a17:902:cf09:b0:2a0:8859:3722 with SMTP id d9443c01a7336-2a0885945d5mr188743155ad.25.1766022918724;
        Wed, 17 Dec 2025 17:55:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0mtxlDACbgXnpME8yw76QwYPJ9TxytEBPvEO++DM1XlroiwrjaueJldnvtvv5hPWUdu79zA==
X-Received: by 2002:a17:902:cf09:b0:2a0:8859:3722 with SMTP id d9443c01a7336-2a0885945d5mr188742955ad.25.1766022918182;
        Wed, 17 Dec 2025 17:55:18 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:17 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:21 +0800
Subject: [PATCH ath-next 07/19] wifi: ath12k: add hardware registers for
 QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-7-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: mvKX5BXQ6YWWtEzJbLtVgZjkrmsgAJlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXxM2Aa5U4zRhv
 ACSFPE5+4XX2jAQ4Tyw+0TIU5Ba9q6uW2JZ5Wm3uN44r7UG++u9YNWPzQGyVgdjdwX4hzs4mYOp
 vqJe9XTZwnptU6gyT3m8qohJOF/aR8xdbzQc2sduqiIOWOtx9vlh6MzgztWG8YD2Zo9OLvVXv4q
 GNTO0bbi2tWks6lP78XT8eY1C9/ObIqTOnafotzL1ck+prCkJjZT1vWxJ0b78y62CeF/iTM9mp0
 PF0/7Euj4tDT1jTeDXPO3CYZSS1yORV+nh6x4dCVxRf5fZVSxEMu+zaDnmRT828ndnNqHsPKZq7
 AYs+QLdUpUK8jh4YRr56+0C03mYBsGTD54op0NPDMHbI1VVQ0HsF5iMqIGkDEpGbmZNYYyfr8VP
 VUHIKM//UqeQ6GAQkR7Ox7grIsEsKg==
X-Proofpoint-ORIG-GUID: mvKX5BXQ6YWWtEzJbLtVgZjkrmsgAJlE
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=69435f07 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fIzkMDVc4DzzmXS1f8kA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175520_468501_83EC6B42 
X-CRM114-Status: GOOD (  18.04  )
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

Add hardware registers and populate hw_regs field in
ath12k_wifi7_hw_ver_map for QCC2072. Note for some registers not
defined and not used by QCC2072, a magic value is assigned.

Also populate other fields to be the same with WCN7850. Among them,
however, QCC2072 requires different HAL ops and descriptor size, both
will be updated in upcoming patches.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h             |  1 +
 drivers/net/wireless/ath/ath12k/hal.h              |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/Makefile     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  8 ++
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    | 94 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.h    |  8 ++
 6 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 31d5d10beb85..667cf5993cf1 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -155,6 +155,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_QCN9274_HW20,
 	ATH12K_HW_WCN7850_HW20,
 	ATH12K_HW_IPQ5332_HW10,
+	ATH12K_HW_QCC2072_HW10,
 };
 
 enum ath12k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 81b0cb002b38..94ecc035fc49 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1121,6 +1121,8 @@ struct ath12k_hw_hal_params {
 	u32 wbm2sw_cc_enable;
 };
 
+#define ATH12K_HW_REG_UNDEFINED	0xdeadbeaf
+
 struct ath12k_hw_regs {
 	u32 tcl1_ring_id;
 	u32 tcl1_ring_misc;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/Makefile b/drivers/net/wireless/ath/ath12k/wifi7/Makefile
index dcfa732bb95b..45b561cdba4b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi7/Makefile
@@ -14,6 +14,7 @@ ath12k_wifi7-y += core.o \
 		  dp_mon.o \
 		  hal.o \
 		  hal_qcn9274.o \
-		  hal_wcn7850.o
+		  hal_wcn7850.o \
+		  hal_qcc2072.o
 
 ath12k_wifi7-$(CONFIG_ATH12K_AHB) += ahb.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index 03a007dd6857..b957ebc9b7c5 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -12,6 +12,7 @@
 #include "../hif.h"
 #include "hal_qcn9274.h"
 #include "hal_wcn7850.h"
+#include "hal_qcc2072.h"
 
 static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 	[ATH12K_HW_QCN9274_HW10] = {
@@ -42,6 +43,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_ipq5332,
 		.hw_regs = &ipq5332_regs,
 	},
+	[ATH12K_HW_QCC2072_HW10] = {
+		.hal_ops = &hal_wcn7850_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn7850),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_wcn7850,
+		.hal_params = &ath12k_hw_hal_params_wcn7850,
+		.hw_regs = &qcc2072_regs,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
new file mode 100644
index 000000000000..6c4986050bc6
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "hal_qcc2072.h"
+
+const struct ath12k_hw_regs qcc2072_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00000920,
+	.tcl1_ring_misc = 0x00000928,
+	.tcl1_ring_tp_addr_lsb = 0x00000934,
+	.tcl1_ring_tp_addr_msb = 0x00000938,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x00000948,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x0000094c,
+	.tcl1_ring_msi1_base_lsb = 0x00000960,
+	.tcl1_ring_msi1_base_msb = 0x00000964,
+	.tcl1_ring_msi1_data = 0x00000968,
+	.tcl_ring_base_lsb = 0x00000b70,
+	.tcl1_ring_base_lsb = 0x00000918,
+	.tcl1_ring_base_msb = 0x0000091c,
+	.tcl2_ring_base_lsb = 0x00000990,
+
+	/* TCL STATUS ring address */
+	.tcl_status_ring_base_lsb = 0x00000d50,
+
+	.wbm_idle_ring_base_lsb = 0x00000d3c,
+	.wbm_idle_ring_misc_addr = 0x00000d4c,
+	.wbm_r0_idle_list_cntl_addr = 0x00000240,
+	.wbm_r0_idle_list_size_addr = 0x00000244,
+	.wbm_scattered_ring_base_lsb = 0x00000250,
+	.wbm_scattered_ring_base_msb = 0x00000254,
+	.wbm_scattered_desc_head_info_ix0 = 0x00000260,
+	.wbm_scattered_desc_head_info_ix1 = 0x00000264,
+	.wbm_scattered_desc_tail_info_ix0 = 0x00000270,
+	.wbm_scattered_desc_tail_info_ix1 = 0x00000274,
+	.wbm_scattered_desc_ptr_hp_addr = 0x00000027c,
+
+	.wbm_sw_release_ring_base_lsb = 0x0000037c,
+	.wbm_sw1_release_ring_base_lsb = ATH12K_HW_REG_UNDEFINED,
+	.wbm0_release_ring_base_lsb = 0x00000e08,
+	.wbm1_release_ring_base_lsb = 0x00000e80,
+
+	/* PCIe base address */
+	.pcie_qserdes_sysclk_en_sel = 0x01e0c0ac,
+	.pcie_pcs_osc_dtct_config_base = 0x01e0cc58,
+
+	/* PPE release ring address */
+	.ppe_rel_ring_base = 0x0000046c,
+
+	/* REO DEST ring address */
+	.reo2_ring_base = 0x00000578,
+	.reo1_misc_ctrl_addr = 0x00000ba0,
+	.reo1_sw_cookie_cfg0 = 0x0000006c,
+	.reo1_sw_cookie_cfg1 = 0x00000070,
+	.reo1_qdesc_lut_base0 = ATH12K_HW_REG_UNDEFINED,
+	.reo1_qdesc_lut_base1 = ATH12K_HW_REG_UNDEFINED,
+
+	.reo1_ring_base_lsb = 0x00000500,
+	.reo1_ring_base_msb = 0x00000504,
+	.reo1_ring_id = 0x00000508,
+	.reo1_ring_misc = 0x00000510,
+	.reo1_ring_hp_addr_lsb = 0x00000514,
+	.reo1_ring_hp_addr_msb = 0x00000518,
+	.reo1_ring_producer_int_setup = 0x00000524,
+	.reo1_ring_msi1_base_lsb = 0x00000548,
+	.reo1_ring_msi1_base_msb = 0x0000054c,
+	.reo1_ring_msi1_data = 0x00000550,
+	.reo1_aging_thres_ix0 = 0x00000b2c,
+	.reo1_aging_thres_ix1 = 0x00000b30,
+	.reo1_aging_thres_ix2 = 0x00000b34,
+	.reo1_aging_thres_ix3 = 0x00000b38,
+
+	/* REO Exception ring address */
+	.reo2_sw0_ring_base = 0x000008c0,
+
+	/* REO Reinject ring address */
+	.sw2reo_ring_base = 0x00000320,
+	.sw2reo1_ring_base = 0x00000398,
+
+	/* REO cmd ring address */
+	.reo_cmd_ring_base = 0x000002a8,
+
+	/* REO status ring address */
+	.reo_status_ring_base = 0x00000aa0,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+
+	.gcc_gcc_pcie_hot_rst = 0x1e65304,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.h
new file mode 100644
index 000000000000..744d7e02b46e
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../hal.h"
+
+extern const struct ath12k_hw_regs qcc2072_regs;

-- 
2.25.1


