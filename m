Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D3CE77199
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 04:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jFRmwk4D9j0p1TCQt2qUonJkKjFvjF83i2hjQFPJUk=; b=OOmuc2gjF+20JnwyC/Zwtm2rnr
	ScBavgmQcVCZlIAPawd25JOg1l+TTdDx9vMpzl/4jmlbdzr2gDjSFRIyItcGBN6lFmhJHXzFUdOUQ
	zvmDRlMwXXTlIGhNX21Eqtw/Ty5nSNabsXHhtWPlxPecIGqsVjigGbhSWO2/dENgP2LUmK5WAe1kJ
	d90SgOChP0RpJauJnckL4lLnAweo8+ohoXZDBMu7VWv3tBp5avfIjXMBqHOPV+utIWxVSS1lEBgun
	k7hl/mhwQ9VBTT8RFcCfkskEqrHJEc/pw9G3AWH5Xoxgs8OFzTXgJrA5bWVi1eBzOzki7jjIae6Bj
	T7sp9o5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7H-0000000Ahgv-1t7E
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 04:25:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7E-0000000Ahfz-458o
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 04:25:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094EttO009534;
	Thu, 9 Jan 2025 04:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jFRmwk4D9j0p1TCQt2qUonJkKjFvjF83i2hjQFPJUk=; b=K7YH20dnEKSjp112
	3SP1kzSTY/8AuQ4yKKqVl4gStF96rA3sVlGDnKZMn3wUVGzaqPrYrGz+uOstTJme
	VLJ7UzlGi03L0i53Fu4neKOHBkPEMYayLo3FiYHalG3Nd63jjetH/gjIN4sOd7sX
	03F5RqAz7Q0iFrdvCEHdUarGLcPB7HpYlChjVmVSXpP9sCywjXZsy9AIY5sCesTN
	KFdAGUPyD+fXqf7+ypnhX0cIwK0LJigozU5ddMNkBY59IX8/LWwQDS/PWmTjd37N
	ro5dPPCxT+axMQExACIO+DmbezHyikY6J/mESqr0zJ2Qa2zw5tI33DpXEBEQS9xk
	LXNzRQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44278t80ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:25:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5094PoBp010331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 04:25:50 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 20:25:47 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Thu, 9 Jan 2025 09:55:31 +0530
Subject: [PATCH 03/10] wifi: ath12k: fix failed to set mhi state error
 during reboot with hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-fix_reboot_issues_with_hw_grouping-v1-3-fb39ec03451e@quicinc.com>
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
X-Proofpoint-GUID: moN7WoDuvrwluHOUDNTR-cZCT5F6CMMd
X-Proofpoint-ORIG-GUID: moN7WoDuvrwluHOUDNTR-cZCT5F6CMMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=928 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_202553_021254_B12BB623 
X-CRM114-Status: GOOD (  13.55  )
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

With hardware grouping, during reboot, whenever a device is removed, it
powers down itself and all its partner devices in the same group. Now this
is done by all devices and hence there is multiple power down for devices
and hence the following error messages can be seen:

ath12k_pci 0002:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0002:01:00.0: failed to set mhi state: POWER_OFF(3)
ath12k_pci 0002:01:00.0: failed to set mhi state DEINIT(1) in current mhi state (0x0)
ath12k_pci 0002:01:00.0: failed to set mhi state: DEINIT(1)
ath12k_pci 0003:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0003:01:00.0: failed to set mhi state: POWER_OFF(3)
ath12k_pci 0003:01:00.0: failed to set mhi state DEINIT(1) in current mhi state (0x0)
ath12k_pci 0003:01:00.0: failed to set mhi state: DEINIT(1)
ath12k_pci 0004:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
ath12k_pci 0004:01:00.0: failed to set mhi state: POWER_OFF(3)

To prevent this, check if the ATH12K_PCI_FLAG_INIT_DONE flag is already
set before powering down. If it is set, it indicates that another partner
device has already performed the power down, and this device can skip this
step.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 06cff3849ab8da3b39677bed3d6ee60af2c814d1..837be309cd45a2d037ee8c3bba8f7be0f457d6b2 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -1484,6 +1484,9 @@ void ath12k_pci_power_down(struct ath12k_base *ab, bool is_suspend)
 {
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 
+	if (!test_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags))
+		return;
+
 	/* restore aspm in case firmware bootup fails */
 	ath12k_pci_aspm_restore(ab_pci);
 

-- 
2.34.1


