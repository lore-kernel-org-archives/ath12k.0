Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14ADD25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWrmA6fW3PhjppUon/QPWjAWhbRLPQ3SUpfNWS5hDIU=; b=tDujnp0F5llGmMOHETUHa0VxJ3
	UJsn7RL+AWf0tDyDAYtSDOyHmESGfvlk+l8/Ia5KFyGeCRbnoSUpJrBat6a5N60Dtmz2bsH98QgbI
	Na0XrmwW3w+683XRmvGST7psy7YUfEzB8Rgt6QcIE8ud9sXHEY6NDjG6NFYDqSZ3z9mF/BudbisFQ
	AHDef3z1fYp4pfLWSfizzlcdkJt0DnFsuQZIPOkWxOGW/2D7dMcnMwZW8seWT0Eik5Ti2PoR8zUeX
	++ZoDdCjoIrI3582GUeLXj8GK8CZZwU3sOAGfQVGVBQGzPqdltXod1dQcWfkYfZeSs7wIs/5r54YE
	VWeTCgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUC-00000004tRv-1TR1;
	Mon, 12 Jan 2026 07:37:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU9-00000004tPW-2QCo
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNouci3310523
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWrmA6fW3PhjppUon/QPWjAWhbRLPQ3SUpfNWS5hDIU=; b=gIQUK4PiItY765db
	RDOmRFLIbWadCSGR32MiMkhuq+SpikS7mnVkSzPP/gbtNonQ5UbryqS2ZCr811V2
	evYg2WboqeK8cej8sdK/smqvqwaR152kk7KR7RxMyMT1a+RhSe01Ilg3JsFTAA6F
	0MLzgYsXGXsmbY6x7N2yAvhADG5D+ZW2MP0lhdEhmuOsSZLAjdABPz43nWDlUx7y
	ZMFtHaMkt2punvtjvaALQC6tdWXB4eMJXQvdHTqdr6yPFRNAJzX3/qS5V1RgabFL
	WcWLUnNIb42iYdnPZ+BS5KOyQzYh9ygHzWP7KeZ0g3F54nEZUcK7xyxQp+mPq3JU
	qViHDg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukdd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c552bbd1b03so681440a12.0
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203427; x=1768808227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWrmA6fW3PhjppUon/QPWjAWhbRLPQ3SUpfNWS5hDIU=;
        b=VyPJpXOFz5s1qdLubFwdVBilgEYTQO1n02vnNRSmt5NGvjW/R6JSzoAmckVUcY6E6M
         NB7LItx3GXCkye3HpuMPIq2bnXhE2WFf5XFiff+SVZXG8N8eQpTqngFGmZIc0FrOYGni
         xoeG8HT2g4J36uj//xNB3sG4wNlp/n/m+2ue/NJQ6u51G5FZjacByHU3i1UbpVBFOjcS
         XNIVMeAsEnVYvOY53gHbIyOSqSfVKU0ld+d85063KvRf6QEALQdiB8Hgdt/WfIPm9+bl
         +MmnRFUPV7OpxKr7ylVE6fMZucvAYOTg+9gjCH0h4m2L/b5jVlqP29VIkJpOfFaGVmzA
         GqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203427; x=1768808227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWrmA6fW3PhjppUon/QPWjAWhbRLPQ3SUpfNWS5hDIU=;
        b=ZjCCo4GwiTpLFcjrViMEHMUSOa+/hKYF31Culs6hzyHyTIGRsIZESp9/rpVQFhuPJX
         VGYzNEOxYKZm17uub8ZDCh06RdcejR85R6inIgwj+ZRJ1sysZ2WEhHeRM2DrUwpH/oUQ
         DpvRHapp6sVGlCbTpjlgtSq+xE56eA1UunVe9gTJ2H2cSKL5aQ4vLcxRvan81jomZ8gP
         uquLX8AlVspgc3BhdrMstxqjPDO5uOUGU/6CepQdz7alNVoZ9JOkLdH8MmAqqPHRLZvO
         FlqvNCGTLk5XUUzVAH2pzjxjZk1MZvqpQ7G/OIOVF9IXjV6Yyon22OvoFVMLKdOX5fUh
         Wbvw==
X-Forwarded-Encrypted: i=1; AJvYcCVHGVxjxDUpQPZFXJHkwpnqhMGmMlGc7IQ0VUut63o8rD5Pquu6f/M5ZL/hSbDA1wMer5OkWQw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbZ/jPsYtOLK7FwqMhYdHUOqY9JjlnKz1IO/73GhjH7RsiGhiY
	egKk4B/CGPHIRioKO2DAAyBWqhFZ0272153IASvavFq5tXR/MaCq7Oj8uYElrgf+EEC5nLVWCo9
	ZLRo44j9UPXW64ypPVIRn7XKehAc5OMlSz3ZZ3MrD5a4FQKc208flHO9q4vXe4hUuT9ngm3Y4Q1
	k=
X-Gm-Gg: AY/fxX4mE+qIHuEM7Jiq/UaNOtyteapghpziQw54q0c7KKEjZSCGz8Hc1UFAyQATUJi
	+Dgn4mN+kVqS1qj7lH/VFgagk9756GOfvOjlVnNllBF2ap69xmrYNe7+2YlogD7msPi34M7OSFx
	MUHQ+M0m0QS4i/RVvyhjYJjpZaweP20sIPfJNQWcToboY51L78GxIwm3fKwC2ovS06k3nnvHNVB
	gAZG3u/SY5xA2/1Z4IrsW/Wft0Qj6yCGzhpnqvJTQiOhc+ubKrlhJeqEFsMfp3giBZ4AXCPBsQS
	eYoCKLoOe1k0vOmAfke+DQhvoEcLzqnZcigTCVjZcPde2sMZ1tD2475ShSOA3LqoYuHNxYBbGY0
	uPBEJRMxDsgT+iwGSUp3X/Oe31V/tzQ3BX+kBKfhmqxD9+5uFRUdbo6KpkWJgNPk=
X-Received: by 2002:a05:6a21:3282:b0:366:14ac:e1f8 with SMTP id adf61e73a8af0-3898f9efa89mr16701611637.74.1768203426648;
        Sun, 11 Jan 2026 23:37:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH70hs6oIvASiNkU0ke4bcuU3PWbmO18Qip9niFVnjZw8dT2DIdRkoUMNEjTi1EuDZtoYGWcA==
X-Received: by 2002:a05:6a21:3282:b0:366:14ac:e1f8 with SMTP id adf61e73a8af0-3898f9efa89mr16701603637.74.1768203426166;
        Sun, 11 Jan 2026 23:37:06 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:05 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:27 +0800
Subject: [PATCH ath-next v2 07/18] wifi: ath12k: add hardware registers for
 QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-7-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX+8vnf5dk0/3Y
 b1xL68A95U6A+fW9LjxQfsZNodF6BFOd36ir3vkw/ycMLAQ2lWdwv4QkKkDnqE3kSe0E5n/Xjqa
 rCeHCZrwpQrTbJIdP+CSRC6VpWM/xm/nlBXoiIz8lNnJxknBk0cWHNCQ2ViW4gUPEbN7SHhJeyT
 rYqo9hqEt/wnMMqx0HNnBZsYSA7MyXG0o7DTc8P18pf4Z8vhj4TRHgB3uSYlmfMcWT6bfgl7XpO
 umsndG3JZgxjPb086nazV7Yj6TLOykEIsctYycwNthEmhsNUt4Tis+P/MX5mxGc2kMwJPhntmvz
 J6v4kz0nEMk/M4gexqEG9TgQ/3RdPuMHTJxzKSpj5L89ptMy/x487UdWPoIFUs6xzg90pfMcE3k
 bmwU5IpVrzEQQEjC+UJbP6HG+k0o1Urbsd5w3ThMq4scaZxNEaabUT1cVSTrLHPSM80YMHEfDFH
 l1ZOLpKC7GYqB32MbHA==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964a4a4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fIzkMDVc4DzzmXS1f8kA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: NxfnSdP6e_15-6PqVxRvMAT1HVJdH_N9
X-Proofpoint-GUID: NxfnSdP6e_15-6PqVxRvMAT1HVJdH_N9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233709_628259_44E1BB5C 
X-CRM114-Status: GOOD (  19.05  )
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


