Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784C0E77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 04:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+r8h6YnfO38rNKLVAVSy9puDqOZP3uBwpBqXiMPKCpo=; b=o66jRe/6zciirwF2XBuASJY7I6
	lWF7yAphxOSlsmWiHkW2ZWtIteL0RJQTzbxNRlZ3WTI0Wi5t3ikI9ihgWPP8Xh3bH77xyZV96m+iN
	f9CxtNvyHb51gwB1pHPhDK979HyCTTgiMLytCQ2DyrbsmKPG2segL4JZyERYKiHF7T5C5BiQgutYo
	cd8lxsVLD/lsulwwU14OGHssRoMsjhR7Yf/swjwDwQnplB+8r0X3boYL6a3bw6a/I8te+rwk/Ud3N
	IySI1Jft4mPvqeoaQb59pLpFJq5jaGlsb/38mh3sAQucBNl2YKW16LQHLxPQ6YT3djVpL1g6TzYvI
	uKloXhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7h-0000000Ahx0-172E
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 04:26:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7e-0000000AhvM-1F1y
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 04:26:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508EmVv0028267;
	Thu, 9 Jan 2025 04:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+r8h6YnfO38rNKLVAVSy9puDqOZP3uBwpBqXiMPKCpo=; b=ZZqtpMikkLg7VJ60
	yolyOCt74JRd2rXU/vqpYf+p5HWcL7kDNBBAdCl1rByjEXW117ngC5vgSVVaFsDd
	dz+/oIYIxyX8xZp1R6Pwhmb62uPfFXBCXGQncsAYi6OQOLbIrTm51g0BVEgE8YtC
	s9sUmeYV6A9IzBrE1TEu59dDBWz7KYOdyPmo/3ur0jnKtwGpy58Iqs0pNI8CkMz2
	SZm2hs4nXB70wo+CrJ+uCUeWHaARPDeHzqNAYROO3YW3xurzKff7UBPU9+V9zdoO
	3YKwIDVx1BkTK1jltHGp+3IQ7Y9sEfaWXROX4md1XWkPK6DVi+CM2TymeYzVBi5P
	aghKKA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441uefsr6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:26:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5094QETP019867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 04:26:14 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 20:26:10 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Thu, 9 Jan 2025 09:55:38 +0530
Subject: [PATCH 10/10] wifi: ath12k: reset MLO global memory during
 recovery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-fix_reboot_issues_with_hw_grouping-v1-10-fb39ec03451e@quicinc.com>
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem
	<quic_hprem@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kalle Valo
	<quic_kvalo@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Aditya Kumar
 Singh" <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N8pk6ljTPogJenWdQ7bqRRQ1UMxh9jis
X-Proofpoint-GUID: N8pk6ljTPogJenWdQ7bqRRQ1UMxh9jis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_202618_725694_0B9BE928 
X-CRM114-Status: GOOD (  20.19  )
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

When operating with multiple devices grouped together, the firmware stores
data related to the state machine of each partner device in the MLO global
memory region. If the firmware crashes, it updates the state to 'crashed'.
During recovery, this memory is shared with the firmware again, and upon
detecting the 'crashed' state, it reasserts. This leads to a loop of
firmware asserts and it never recovers.

Hence to fix this issue,  once all devices in the group have been asserted
and powered down, reset the MLO global memory region.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  3 +++
 drivers/net/wireless/ath/ath12k/qmi.c  | 24 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/qmi.h  |  4 +++-
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ce261151f5b887656f9582e3337a2d5e5236bbc1..0475c80befc82f59b2384d68b382b38d06a83bfe 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1492,6 +1492,9 @@ static void ath12k_core_reset(struct work_struct *work)
 		return;
 	}
 
+	/* Prepare MLO global memory region for power up */
+	ath12k_qmi_reset_mlo_mem(ag);
+
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5c3563383fabba779b0afd885802637fd5c53656..bc14fa106b27015b35641caac51fcb4b808e094d 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/elf.h>
@@ -2440,6 +2440,28 @@ int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 	return ret;
 }
 
+void ath12k_qmi_reset_mlo_mem(struct ath12k_hw_group *ag)
+{
+	struct target_mem_chunk *mlo_chunk;
+	int i;
+
+	lockdep_assert_held(&ag->mutex);
+
+	if (!ag->mlo_mem.init_done || ag->num_started)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(ag->mlo_mem.chunk); i++) {
+		mlo_chunk = &ag->mlo_mem.chunk[i];
+
+		if (mlo_chunk->v.addr)
+			/* TODO: Mode 0 recovery is the default mode hence resetting the
+			 * whole memory region for now. Once Mode 1 support is added, this
+			 * needs to be handled properly
+			 */
+			memset(mlo_chunk->v.addr, 0, mlo_chunk->size);
+	}
+}
+
 static void ath12k_qmi_free_mlo_mem_chunk(struct ath12k_base *ab,
 					  struct target_mem_chunk *chunk,
 					  int idx)
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 45d7c3fcafdd7a0afa3d193cf612d255ca5a5e2e..1406ec372592b076dd0a5caef32044db238e352e 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_QMI_H
@@ -41,6 +41,7 @@
 #define ATH12K_BOARD_ID_DEFAULT	0xFF
 
 struct ath12k_base;
+struct ath12k_hw_group;
 
 enum ath12k_qmi_file_type {
 	ATH12K_QMI_FILE_TYPE_BDF_GOLDEN	= 0,
@@ -621,5 +622,6 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab);
 int ath12k_qmi_init_service(struct ath12k_base *ab);
 void ath12k_qmi_free_resource(struct ath12k_base *ab);
 void ath12k_qmi_trigger_host_cap(struct ath12k_base *ab);
+void ath12k_qmi_reset_mlo_mem(struct ath12k_hw_group *ag);
 
 #endif

-- 
2.34.1


