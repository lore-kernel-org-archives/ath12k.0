Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4205606A881
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qpQr5Qif;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdDHqycK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cddQrvr5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=qpQr5QifZINbN7
	UoAoX1PFkZRFvJlXYx/4wqimgE8fG3n7xu+VlGxwsA/RIwsZslwwbH4vKni23eCMMK8a5v8aiQcK1
	cCSBMYKGpPK5aoTqKOE80n7Q3a6v+l642ASdTBFw+GSxJ/hYV/7KmHGQ0bu6CZU0crVLShxmqfa/8
	p58eVjWqJh/OA8uKzBrxMx2wooJGBEFb6gboBeZgMtatPVUU5kU+UtW6W31GedjqrbTVU7xAVK9G8
	hVdwmxptDTtguvCkhI81100Um2Ro6/Feaa/4eKUzWkh0lak8zGeqsB5GSHpbl1ySkFYuklldDlLY7
	pDsVd+nmb4bkhkqHIdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1j-00000007rr9-2AwZ;
	Wed, 18 Nov 2026 06:20:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1Y-00000007rhY-3VUK
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:20:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VBMA2106531
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=bdDHqycKeNp830rw
	4GqOPocZ7c1YohlPh9QZTQDWVtfTfNcZVlFLEDdZPfr5wAW9vIcLDjUJsA83SOut
	wBF9VRaPmnf3a0kpy+6S/N2sgjuy2IDb81BzOzhE05Nyz+nqAStVZZjGkv5u7O7x
	uBJFrVNnSkSk7vZlMOl7U7GThTaT3q9GD2YR5lOMMHW3MJ0XE/uQJNIL1FtlKRDv
	qLG6nn3j0JQ3q5uggqGsNMnQhMWNW/Ma2waVInwLlqIdA6JCNrgtm+wW65tC2oVM
	KteKAsQRU1+fAcrBvYVZVd3NM0NQ/vP5YaK6t5Zg9K71NKo8BQYexnBKB52eNRHT
	f33i7Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sg57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so477626a12.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982803; x=1795587603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=cddQrvr5hsexlXzi+4IkA9fxHtGXX+6Ws8PDpmUbND9brGH4G3DH6MVWkxjh28lVJ4
         FGx5UK6Dc9i+rJkUYqOkFtpmQfS7bGX3A7DKKusrHUP99/QZVRT6Id72ZLGn1XI7/6h5
         vLcThr+oPO6htYJCLvwddinpba7VvzEFjo1iPSDqJabGv9AFBXVshXPWLEr1rhyY+gCa
         ArN5U1znncc/wf1TjKHBjk7erx5GcJFg2vfYQbSFQCbwa6MAyjL3nlIiFFzbxg+eHhjZ
         VoggmnjfJPICar+4RanCYclrLkjUS+bJjfpJ5PXl+MAEuSR38lUQya6r8u6RkOGzgTG3
         DcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982803; x=1795587603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=vTv1mVfHpRMV3BlsyofUM3/fZqtZc/rWjYGUmgrqkBHPq2TVuHCDGCQqTC5RFd6fuP
         CNboudUi4jgvAMew7Xx0GREPccCyAyFo/Xt2KLi0HRAqhMnPJqo/ZNdRXNf7G3nr7rHm
         hkoPE0hUHJx9aW8XDSWf+uG51YquieweaAJ4aqLY8nr5oIYvSiiYW3sttADJfahb+nak
         0SXcD1Z7JTN9UQH0+qXve4amNd4u9fVo1x2neeRc7rNMVnioeAQxFcqUTQkVXt0wcelK
         jVzPVP4bBEKSsbEUan1mW1EyPccqJ7Bv/CXG7jKAzUuTndT+z1qnGcArM1mWsHgl954e
         rWCQ==
X-Forwarded-Encrypted: i=1; AL+hErH/1Z00COMLrjOY3paVlMbg3kjOEj5r8+ONK1nkEgNzLtMH0tPluatjBb+q4alzspN/CNfbmcI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/HvaSo5iJJW8t6xa1fk9bNZ7oXeVCsjYKwhMhyFjEMQl+Gr89q
	t1qlwuEWbkNii7jShM7xhFFx5gxLooiAqVIe2PgPOk/9DuRonQRnwIxJm2CrtlLGOz1eBiazeag
	GVt5ziow9FFixzumyeUjX0TL+mQlDDSLTVvYYAes2kqDjrmG4d+mmW34+FJV20eswiAkofwqY
X-Gm-Gg: AZFdTZfsjj/Gu/9/ioNdTc/VYwWWNqGhC3OX3pFda1PLVls/92f/cX+cQXDVUUkhNXS
	nXrMI061mhxUd62uPwNJkFi4rkUyXHo74kp9elNhfFV3zNwSDhOU/p2xpAGOOZk3h7dvsVmFCsJ
	wlyiy5Y4egLI4ECGrpMzxWS9ynXkwSxh5A0KeKIH+96mxHcf7vegTTDhbOA3/2LWlOcS//OwGT1
	ruR7tXrhWliFWQVtaZM6XNNsQlc7hKSuP1m85UrE/fO2Yfc+mQZ2ErHrdBYyj9X0LRQxSSIEtG1
	aH8DLIkCZ72kFBe2lT7E9tCkMRXpQnFUEEW44e1pKAHbv2WkGEOgD3bblTlc8ZZcJNZVchP45qs
	2HrSkcfHforxuj52ABwNcInl+BH61AetQfD8AjL/Y3g/dxGWDFftDUAtYpEQMlD9AXkyIY0Pl+2
	POsjLB8aeqfV0NS7D+GrFbe7BPx/9QgXziHp8nW3SR4YJy2wax6rZ1bPSRc5qPTmQwSgL3M3Hb2
	4c=
X-Received: by 2002:a17:90b:4d82:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b3d07c9e1bmr1762542a91.52.1794982802651;
        Tue, 17 Nov 2026 22:20:02 -0800 (PST)
X-Received: by 2002:a17:90b:4d82:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b3d07c9e1bmr1762502a91.52.1794982802139;
        Tue, 17 Nov 2026 22:20:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:01 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:13 +0530
Subject: [PATCH ath-next v2 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-10-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: s7RMVgSyV0mDbYC4wZu3OlELDUcX1kkw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXznA4qm2GoM2Y
 91+7uJ7awVkyKWoE5o3mSAbYcddI3hMJhAIWN3EINVanbTIViCt11naIHvcC4eOEc68+gL5dOrj
 7phaXZnwoCyiwbLQy1AMVYTXqxUi6Es=
X-Proofpoint-GUID: s7RMVgSyV0mDbYC4wZu3OlELDUcX1kkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX9udSJvELPGPV
 1HfUkEWhYW/y9iTUc1bUXm6cf6VVlkNeZFpy617DcubClXNfTbAxH//fGlF5qp8l2qq8RQd1Uh4
 Y7EIyx3WH0akkTTZ910t0JdrkYssaX1Sz+stuJ6Ss51opsSaoHYkVhWh0ElmypH0y0ya7LqTxBi
 TtFwUrUs3xr4yizm3zMoy5hb4Kw7LNlXN8fotntu1uKAr/96A7g+ihJ8wyV23uQocIqRSRx+iF4
 XOA1jFNPdkB+upcXiC/AxevXHeSSVE9KUnW77YKIpgPwIaLA33ezJna8h5Co88Dga7+jom8jM5m
 48DaAp0tmxbmDB73pQm2WIx0al6tiAdeQLhSL/euuelWL4dWgu68uAVDWs9SfWA8PYyqMP8+Qnf
 G7Xm4ftm0nov1DwrlvWqFgfDCkGNqoFp/Hmduyc5eVTBtSa/KPQuV35035toAIhNZv5uuUAunlC
 1pA28mCpOL7IrjRQQ5A==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd4393 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_222005_108959_DE94A46A 
X-CRM114-Status: GOOD (  18.97  )
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

Implement the MHI controller configuration for QCN9575.

Add ath12k_wifi8_mhi_config_qcn9575 with IPCR channels 20 and 21 and
control and data event rings in wifi8/mhi.c, and export it through
wifi8/mhi.h. Update the QCN9575 hw params entry to use
ath12k_wifi8_mhi_config_qcn9575. Build wifi8/mhi.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c    | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h    | 10 ++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b1b90c109c76..051c6447d35c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -4,4 +4,5 @@ ath12k_wifi8-y += core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
+		  mhi.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index bffd1081fd2f..428d6b2b4418 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -13,6 +13,7 @@
 #include "../mhi.h"
 #include "hal.h"
 #include "hw.h"
+#include "mhi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -64,7 +65,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.num_tcl_banks = 0,
 		.max_tx_ring = 0,
 
-		.mhi_config = NULL,
+		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
 		.wmi_init = NULL,
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.c b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
new file mode 100644
index 000000000000..04eb1f1650c3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../mhi.h"
+#include "mhi.h"
+
+static const struct mhi_channel_config ath12k_wifi8_mhi_channels_qcn9575[] = {
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
+	},
+};
+
+static struct mhi_event_config ath12k_wifi8_mhi_events_qcn9575[] = {
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
+const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_wifi8_mhi_channels_qcn9575),
+	.ch_cfg = ath12k_wifi8_mhi_channels_qcn9575,
+	.num_events = ARRAY_SIZE(ath12k_wifi8_mhi_events_qcn9575),
+	.event_cfg = ath12k_wifi8_mhi_events_qcn9575,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.h b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
new file mode 100644
index 000000000000..7a229ea378d2
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI8_MHI_H
+#define _ATH12K_WIFI8_MHI_H
+
+extern const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575;
+#endif /* _ATH12K_WIFI8_MHI_H */

-- 
2.34.1


