Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9100C4332F
	for <ath12k@archiver.kernel.org>; Sat, 11 Nov 2023 04:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D2wZ7ugpuO45DLnOMhxvi7HzfxfKQrpNycnnd8fbCMU=; b=zBud8u07iVkHU3
	k2CBpSPN9cN8NorQjDVrzVrB83aqtcR56zP8T8BMZa2VmAxHeLvp7UEBEd4+cDNpGyf2AzIA4VmJK
	I5QEWEFqQTHJVlbYHOEwN2bBOMGfawofMsiQcBx3ay2Wa545Px+v12nDiApKcH3mQ6vy/kl+OD7M3
	g6W+dzKc9JhxckXoPRuTc6slH7e0mryexIQ4HJRY6vwE4XfPB+ORESzGfWoraTrXIW+Ay5terBthn
	MMnYt+FUnrJ0EGglo1Jfm8sVF1hKwSQygzvpN/dLAbL9zXXhTzIrKLu6ssIQO9JM4sdDpIORyWKSp
	Fx/Oiw291xt+/X0IrAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1fC9-009yQ7-0v
	for ath12k@archiver.kernel.org;
	Sat, 11 Nov 2023 04:02:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1fC5-009yPZ-2V
	for ath12k@lists.infradead.org;
	Sat, 11 Nov 2023 04:02:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AB3hQvw007196;
	Sat, 11 Nov 2023 04:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=0ShenSEDZTptJ33kTOgofmsx502ftZSKDsBpsm35Wxo=;
 b=AGa8JXecINboR3YCUgJZv+kDfLdxlPRn7DgMOwdmj7UPZnM8zP8ThGpxOFZqQmPWm4oV
 0xa9ut+ltHf1a3ZTz+KvHOAQTdAN+sC1fAr6vay+Epa1dBtJLoEMgwOnC70YyFMaLahx
 12+y/pcUWS66uE33dNNJwHBQWqQ8PPJFkGIasT2WxyC7f3i0MaJnN5DHu/h1vr8tFxqs
 ZVtwB8e4OxQSpQdK8nq0JLfDEaXARxHJWwdoQBEVRg/dtKhiFrLTB1LnkwKBizUHHLIO
 Psh01LK0eTU3nWSI6G3B6XnpOwuAt2rBBXtaxDTB2oDKpvTcTf9FC062BEGTNaRRTBsv rA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua0mdg47t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Nov 2023 04:01:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AB41NON026721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Nov 2023 04:01:23 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 10 Nov 2023 20:01:21 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: fix the error handler of rfkill config
Date: Sat, 11 Nov 2023 09:31:07 +0530
Message-ID: <20231111040107.18708-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I6b_bwVEa27QfgD-r4gi7ShNIyikDldD
X-Proofpoint-GUID: I6b_bwVEa27QfgD-r4gi7ShNIyikDldD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_21,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 mlxlogscore=712 spamscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311110031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_200201_954215_E376F103 
X-CRM114-Status: GOOD (  16.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

When the core rfkill config throws error, it should free the
allocated resources. Currently it is not freeing the core pdev
create resources. Avoid this issue by calling the core pdev
destroy in the error handler of core rfkill config.

Found this issue in the code review and it is compile tested only.

Fixes: 004ccbc0dd49 ("wifi: ath12k: add support for hardware rfkill for WCN7850")
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 v2:
  - Changed the copyright year

 drivers/net/wireless/ath/ath12k/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b936760b5140..6c01b282fcd3 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -698,13 +698,15 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 	ret = ath12k_core_rfkill_config(ab);
 	if (ret && ret != -EOPNOTSUPP) {
 		ath12k_err(ab, "failed to config rfkill: %d\n", ret);
-		goto err_core_stop;
+		goto err_core_pdev_destroy;
 	}
 
 	mutex_unlock(&ab->core_lock);
 
 	return 0;
 
+err_core_pdev_destroy:
+	ath12k_core_pdev_destroy(ab);
 err_core_stop:
 	ath12k_core_stop(ab);
 	ath12k_mac_destroy(ab);

base-commit: 553d0057523dc1d6935160613f1fbf9bb8db88f6
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
