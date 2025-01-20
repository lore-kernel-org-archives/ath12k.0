Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C587EC02185
	for <ath12k@archiver.kernel.org>; Mon, 20 Jan 2025 09:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEvmFfkiwVitJkPjXQw+hEHrAmWDl/ngaYSf5dywjn8=; b=LvCZsYLIfLZaY4UiUwBytZSwte
	hK1uyu5RMy58vjQdLeDZKXnfWNKQyfa+V2cuNOzXp9VUlEC1p7bFCH2bYcqlaew+cR7mV0ir2mjB1
	rrm6ywWy+9qzk9Z3/QkmegkktqaUvBlTQoI1AfDCNGD4+fEmVrvSBvtw+98tHBy0ud14XOrbKw2Ws
	7Bz9ucXIM1W2JX3qa+jFuVWT9hevk+0+/s07DM/uhbuMX+h6eifDf0glyvyas0NXB8jLeHauqCme9
	Jcg7HOAdNBRmSR29szD/oh33hOzoweI/yJxZvhuB0QSKHQTnwt1gY9qDpgpYIq2RtFIACWMibA7ZH
	HuloNDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoYn-00000005GMq-2PxX
	for ath12k@archiver.kernel.org;
	Mon, 20 Jan 2025 09:59:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoOg-00000005EXh-3aHh
	for ath12k@lists.infradead.org;
	Mon, 20 Jan 2025 09:48:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K3gh20005146;
	Mon, 20 Jan 2025 09:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEvmFfkiwVitJkPjXQw+hEHrAmWDl/ngaYSf5dywjn8=; b=SCKVmlLHEuOsu3HA
	GGkdW1owyaOr3ZSQOfpHGKPxLYqHsEbbvC7brGpMpvCLmxFbVFIS75C8zQUo0gkA
	fByTtC7b4tKtqV8WeB3J23pG8kxROzRGzA7zUrR7PTLOQq720sqdbbtqXAYADLog
	vNkvVULOQIg2Ttq21JPydiI7RnxD0+QmfAVXdhUowN7QE07/WMxij5xdquGo17dv
	tNJ9VG7pb3vq5vh/pfv8GFujDbOiW1Smtb4f/mCPP7ImWkf9VgSa/TzG3MH0br6j
	cXic/2szRAFAsT8vbZHmHiCRkPANG13xhwpCQtOwNwhy95vBkWii/u1AkT6O7CYI
	z1phOA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449etegunq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:48:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K9mchV006262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:48:38 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 01:48:34 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Mon, 20 Jan 2025 15:18:21 +0530
Subject: [PATCH v2 01/10] wifi: ath12k: prevent race condition in
 ath12k_core_hw_group_destroy()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250120-fix_reboot_issues_with_hw_grouping-v2-1-b7d073bb2a22@quicinc.com>
References: <20250120-fix_reboot_issues_with_hw_grouping-v2-0-b7d073bb2a22@quicinc.com>
In-Reply-To: <20250120-fix_reboot_issues_with_hw_grouping-v2-0-b7d073bb2a22@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YSLGAWRJKYfuPUQifBjbn0_g79x3J6wM
X-Proofpoint-GUID: YSLGAWRJKYfuPUQifBjbn0_g79x3J6wM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 mlxlogscore=872 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_014843_031190_3900357A 
X-CRM114-Status: GOOD (  10.95  )
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
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0606116d6b9c491b6ede401b2e1aedfb619339a8..1959c59cb2bb18aeec215b9d309468b7c6716752 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1716,6 +1716,7 @@ static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 	if (WARN_ON(!ag))
 		return;
 
+	mutex_lock(&ag->mutex);
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
@@ -1723,6 +1724,7 @@ static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 
 		ath12k_core_soc_destroy(ab);
 	}
+	mutex_unlock(&ag->mutex);
 }
 
 static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)

-- 
2.34.1


