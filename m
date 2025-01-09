Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718C0E77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 04:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE5Yf90CPVn5nK08vp4XdKHzLUVd3um9BOGs3Ucg5Vs=; b=4ZgC2i01cxnN/WegVoliuUZ8bt
	kNon7Kei0+1GNTPYeeoWgMU+1b8N62KWSyYC8UzkYSyJs4qMPCIQUI8CyB0VspnFmg76oZceGZotN
	BqYNTOxm0k5mhp6VA4Z/EkrVMNRuYbH2EhoixHuwIDlM8aEgv0PoqDKpKW+tZLGY+GYUQVT8EYw+o
	oY+nz1GRRdvlQ+P0zcVS+D57+pK2M+qKzJLgqJoV14cMhP1g7TRCKI19VcFtpxKcy6fhNppXiWHnB
	b2/0yDYSm1cHSSNfvJMJi885XdDxbDisTObalMTboYv0+HcbmNlExqXdj7sHbybG4UYUhrFDKyx39
	Tzgl+ngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7D-0000000Ahf7-0paa
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 04:25:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7A-0000000Ahdk-1h4t
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 04:25:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Jt2lV018339;
	Thu, 9 Jan 2025 04:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wE5Yf90CPVn5nK08vp4XdKHzLUVd3um9BOGs3Ucg5Vs=; b=YPypgctkxiCsPNk1
	wDpsN+oICtJlSwg6rpdNTgz7AZS9yueeclCh/JcrvnKJU7FscKB4quftnrahYaxr
	n4WOz85l+CoWVsSBXfgbTNjlsLjZG95cwtFXpzrJhkV4AHa5jikoe2BCR8vaChXo
	9F5jp3befc7/20WSIX25qfioARVSfYhrJIkYpJhKMwuZX/wiW6kKYlA+r4wMkYbn
	QhdOYOHhPX7ThFNF+c3Wwn35KshCe0KDeQCDobxaNzgCCl9gBJhk1uaz/NWJx+hx
	95lH9B9DlnRKrzmb1LxHKqz4ScunPVPn/PcvV81D7Nm/GP9OdsBadB5dwYzqG9TR
	SAiyjA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441yxfgybh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:25:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5094PhFO010279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 04:25:43 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 20:25:40 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Thu, 9 Jan 2025 09:55:29 +0530
Subject: [PATCH 01/10] wifi: ath12k: prevent race condition in
 ath12k_core_hw_group_destroy()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-fix_reboot_issues_with_hw_grouping-v1-1-fb39ec03451e@quicinc.com>
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
X-Proofpoint-ORIG-GUID: F_0y_Vc6ds11U5_UtS3R0IdkZ_reLg57
X-Proofpoint-GUID: F_0y_Vc6ds11U5_UtS3R0IdkZ_reLg57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=779
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_202548_617552_6BA64E71 
X-CRM114-Status: GOOD (  12.27  )
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

Currently, ath12k_core_hw_group_destroy() accesses its members without any
locking mechanism. This could lead to potential issues if these members are
modified by another thread concurrently.

Hence to mitigate this, use the available mutex lock.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c6b35aac96eb8d6660cbf30f807a04619feebda..514494dd56ad206a72c52492774d3387dae82f70 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -1712,6 +1712,7 @@ static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 	if (WARN_ON(!ag))
 		return;
 
+	mutex_lock(&ag->mutex);
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
@@ -1719,6 +1720,7 @@ static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 
 		ath12k_core_soc_destroy(ab);
 	}
+	mutex_unlock(&ag->mutex);
 }
 
 static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)

-- 
2.34.1


