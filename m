Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D653E77199
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXAAJ3Q2KJefI38pytyD5c5fjyRALuNb86ZzFcAHctc=; b=Vebe/yhIn8lYtb+O1GdUQvDAMh
	Le5foUV/q6pgm29QKP7pjt5JERgJvRHKsiZ8cTbyXtyrs32BjhDpkKMdhL/z200MhliLQuFRQ+i3R
	a6pu97kD6DzM4CunPVDOzmo4+jx4lraYeRkGztBD6Hij2zFh86gjW8V1cb/Y/RgfUrhbwZwMNVitu
	ctgLLC+lPkvlh+zXZk/JSid2j1ocIgX+TIxjb7vOahx0Dk1kk4FAyUt+3qanZ2uqFGSD2kVOMw1r0
	bMIHYZ8xGezuZ216fKv9iMe6E2/4t6IfC0RiiIEAnBtwKvQbbPfkjA5f6p3iHjHSiGbHPwDwRzOsb
	jMjWc6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxOH-0000000CzBQ-0rvh
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 18:36:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxOF-0000000CzB3-3CPz
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 18:36:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509B3xLR025136;
	Thu, 9 Jan 2025 18:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXAAJ3Q2KJefI38pytyD5c5fjyRALuNb86ZzFcAHctc=; b=e46/evcz8HmeE7uU
	gAR1Jr6UMmrRrUIDi4VDOBdC4xG5ylOC/lAmVMRTjxc2nBV9S9/tThBLjwtk2srQ
	UpoJUtp+2owjTHL3xkcJFesbN2/FCCGmvPXnj9f+B3D7D8MYcIQr7kpP/WXlZPVV
	GJXDOZ5sz1Pz+86Omv556PNc+pK4UV+pcGtB0smiCN/mkfRaJKhCoORAefYmzVe0
	RsgYIf1zFaFpTdHp4y1zshLhlvWYAmPO7SSSZiBpSNjwQGzBsTcJgbsDOOInIdE0
	A7w3Cr2+Z1wSyOFurUHFJ4eObmBaOdja24p7E+pPHYFGeDrBxd8BW07vKKZx74qR
	SBAUog==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442d8hh3c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 18:36:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509IaHBX009263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 18:36:17 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 10:36:16 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v6 5/5] wifi: ath12k: Disable MLO in Factory Test Mode
Date: Fri, 10 Jan 2025 00:05:51 +0530
Message-ID: <20250109183551.1028791-6-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JNsn-5Mln42PPk4PPafH-95oo4posame
X-Proofpoint-ORIG-GUID: JNsn-5Mln42PPk4PPafH-95oo4posame
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=785
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_103619_924946_D2756BA8 
X-CRM114-Status: GOOD (  12.82  )
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

Factory test mode(FTM) is supported only non-mlo(multi-link operation)
mode. Therefore, disable MLO when driver boots in FTM mode.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 5 ++---
 drivers/net/wireless/ath/ath12k/qmi.c  | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index d0cf82ca6dae..6705e33074aa 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1630,10 +1630,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
 			return NULL;
 		}
 
-		if (ath12k_core_get_wsi_info(ag, ab) ||
+		if (ath12k_ftm_mode || ath12k_core_get_wsi_info(ag, ab) ||
 		    ath12k_core_get_wsi_index(ag, ab)) {
-			ath12k_dbg(ab, ATH12K_DBG_BOOT,
-				   "unable to get wsi info from dt, grouping single device");
+			ath12k_dbg(ab, ATH12K_DBG_BOOT, "grouping single device");
 			ag->id = ATH12K_INVALID_GROUP_ID;
 			ag->num_devices = 1;
 			memset(ag->wsi_node, 0, sizeof(ag->wsi_node));
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5c3563383fab..344c12b3b937 100644
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
@@ -2265,7 +2265,7 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 		goto out;
 	}
 
-	if (resp.single_chip_mlo_support_valid &&
+	if (!ath12k_ftm_mode && resp.single_chip_mlo_support_valid &&
 	    resp.single_chip_mlo_support)
 		ab->single_chip_mlo_supp = true;
 
-- 
2.34.1


