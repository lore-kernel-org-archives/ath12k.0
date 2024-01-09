Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384E1C46CD2
	for <ath12k@archiver.kernel.org>; Tue,  9 Jan 2024 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8mI8xVxho6usfeyYDPHPyWvfEXa6ZMB/rRz6yGDxGo=; b=M80NnPY9L3pGJ1s2aJ13kx7QtK
	CBRIrHr9hIwVSNuz7ciPsiEMHlufrm+MgYnEV3xMMJC6B/qPrjVEhOzhMfl7eiJjtR0mW4inxK3ff
	EE3Rvw9YT0Zi8mj0Ziv4oZJ4anNr5tpYZKVuhV/+E8emYST94sQBVMr3m6OHrRN+Cnqn/Qq8XBW9C
	H9g32PkFc5mjfILVbe/Yi3v3Pz0lF5oVU5iMKuF7MJ+j8nCppRWO8N5IepQFlZ4coQ7oqpyGQFbEl
	G0heV650Fd8orghuIVnLlyDPUxlfneGlcNjN0DxLag1ythBGteVKBkYEO5kB2FkB429JAOBubr/iD
	O413SqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGFw-0092UE-2n
	for ath12k@archiver.kernel.org;
	Tue, 09 Jan 2024 17:51:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGFs-0092Ru-0u
	for ath12k@lists.infradead.org;
	Tue, 09 Jan 2024 17:51:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 409FwJm5001291;
	Tue, 9 Jan 2024 17:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=x8mI8xVxho6usfeyYDPHPyWvfEXa6ZMB/rRz6yGDxGo
	=; b=ANGw3fPwyVpXG/i6Q8p0HDgX3a6gLfLI2wqJsYaBlrdfJNSIZlQWQOI89rn
	oi1dn4BDCCzNid9VfkrNF9rKSl15YqAls28i05si/WLEASzqHblyiOJ9Q5CAf35P
	n4K/OSQ5+6TsYbuXBeKRsL97k+YwOUqCGLvTfuCniD4YPaJ0QxcXUoKYNGL2mzmv
	T+4ccjVr++1pb1RLGB/OFBROW9PL/ZsO24UhA9JNU6Nqthe4KiLanAvowT3YLUAD
	nRNaJ4w8ZCR1Hn+35boY3kA3GWYlCsoP3toW7VJWS09SnEtnqtKqDoQF9lDgQJUQ
	oA7t9dwrITAiqNa3Kw85eFGvgfg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vh98m89j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 17:51:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409Hp70N032037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 17:51:07 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 9 Jan
 2024 09:51:06 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 9 Jan 2024 09:51:03 -0800
Subject: [PATCH 1/3] wifi: ath12k: Remove unnecessary struct qmi_txn
 initializers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240109-qmi-cleanup-v1-1-607b10858566@quicinc.com>
References: <20240109-qmi-cleanup-v1-0-607b10858566@quicinc.com>
In-Reply-To: <20240109-qmi-cleanup-v1-0-607b10858566@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N2K5Q2q1DNfj2AmCnmjbHxgDb0IIDgL1
X-Proofpoint-GUID: N2K5Q2q1DNfj2AmCnmjbHxgDb0IIDgL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_095112_447939_A94D6147 
X-CRM114-Status: GOOD (  12.10  )
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

Currently most of the ath12k QMI messaging functions define their
struct qmi_txn variables with a {} initializer. However, all of these
functions subsequently call qmi_txn_init(), and the very first thing
that function does is zero the struct. Hence, the initializers are
unnecessary. Since these consume code space and cpu cycles, remove
them.

No functional changes, compile tested only.
---
 drivers/net/wireless/ath/ath12k/qmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 536856234f3b..180e86c2a10c 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/elf.h>
@@ -1921,7 +1921,7 @@ static int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_host_cap_req_msg_v01 req;
 	struct qmi_wlanfw_host_cap_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0;
 
 	memset(&req, 0, sizeof(req));
@@ -2069,7 +2069,7 @@ static int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_respond_mem_req_msg_v01 *req;
 	struct qmi_wlanfw_respond_mem_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0, i;
 	bool delayed;
 
@@ -2210,7 +2210,7 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_cap_req_msg_v01 req;
 	struct qmi_wlanfw_cap_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	unsigned int board_id = ATH12K_BOARD_ID_DEFAULT;
 	int ret = 0;
 	int r;
@@ -2311,7 +2311,7 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 {
 	struct qmi_wlanfw_bdf_download_req_msg_v01 *req;
 	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	const u8 *temp = data;
 	int ret;
 	u32 remaining = len;
@@ -2547,7 +2547,7 @@ static int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
 	struct qmi_wlanfw_m3_info_req_msg_v01 req;
 	struct qmi_wlanfw_m3_info_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0;
 
 	memset(&req, 0, sizeof(req));
@@ -2598,7 +2598,7 @@ static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
 {
 	struct qmi_wlanfw_wlan_mode_req_msg_v01 req;
 	struct qmi_wlanfw_wlan_mode_resp_msg_v01 resp;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0;
 
 	memset(&req, 0, sizeof(req));
@@ -2651,7 +2651,7 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp;
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
-	struct qmi_txn txn = {};
+	struct qmi_txn txn;
 	int ret = 0, pipe_num;
 
 	ce_cfg	= (struct ce_pipe_config *)ab->qmi.ce_cfg.tgt_ce;

-- 
2.42.0


