Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5452C0218C
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 04:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBGtLWeBoyyHnv34aoMKtjC0WpCD8op6z4g8KC7EYLE=; b=fr9s+Gr1m/FHPRO74dWh26DiV8
	M9w7EXni7kiOeZ52NqCZ444F6+q6KsLC2fHYAl8glQOC2RTsbuIZT/HPDSqMhHXwvFU6GKG8x9VeZ
	qdtWFvPP6chECv8Ss65slyNXA0F+cbIHYBV2cnpjjKHHAv3/FMys7kShX5xwnsgiPFiRK1Ccoa7ZH
	wn7KIwMGN2+UZzrtuCLf2NW1KRmHj9OE5V+N2OeTREixQptzU4AZWNJD14SH+Fjk1v08LPdP4fPf2
	dG7VphVI/xVFbJj5Ct4YqydEzrf9tuV4Dvn09piq4LuPva9bqOiAejMtqexLLHz7tr0KFY1RG0Yrb
	VAcPoUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBVy-0000000DteM-2GZW
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 04:41:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBVx-0000000Dtdq-0VfQ
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 04:41:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NNwssK027968;
	Fri, 24 Jan 2025 04:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBGtLWeBoyyHnv34aoMKtjC0WpCD8op6z4g8KC7EYLE=; b=IGTYkfk2Mc0tZ+hy
	gIld+XuUZNzPWTgEuhcPgzC6bpLd7pDNLPMXJSl+GPTlGASDXVbGSwmDdgb1Ywd9
	5pgbNR3Lc+zGpjXPlZYQvF91EzDXDozRzUcvEXnsBoWqXZH17yXZO6FqGilhvUqI
	K6p+gLJHkXeQD0uN43Lqz064A6dV/DdjtNIkvrtJl9qw0xAL7IU8CJWA1qrllwWJ
	q8Prp0dopha8kWC83LhH3GzrsSpNF4HMpO7k7k9/EJbMvbTyhedrdUaTpmdtT66H
	o2sCJM/b7VROeHiC1Yr7FDvU8pEGnxihdXJX6ruYfaNcVhptN2+hvIGBIRvTkhbr
	0XGrqw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bywc0fe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 04:41:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O4fmwk023489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 04:41:48 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 20:41:45 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Fri, 24 Jan 2025 10:11:24 +0530
Subject: [PATCH v3 01/10] wifi: ath12k: prevent race condition in
 ath12k_core_hw_group_destroy()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250124-fix_reboot_issues_with_hw_grouping-v3-1-329030b18d9e@quicinc.com>
References: <20250124-fix_reboot_issues_with_hw_grouping-v3-0-329030b18d9e@quicinc.com>
In-Reply-To: <20250124-fix_reboot_issues_with_hw_grouping-v3-0-329030b18d9e@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Zx37_k9pgWK65MTliWH2xUjTIOUPIWGI
X-Proofpoint-GUID: Zx37_k9pgWK65MTliWH2xUjTIOUPIWGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=870 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_204153_280405_C61508CF 
X-CRM114-Status: GOOD (  10.55  )
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
index 2dd0666959cd4fbdfc17a36b4029fe06fc575d3f..c392f94584ff21051fb05d7843d0d500b1712d69 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1731,6 +1731,7 @@ static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 	if (WARN_ON(!ag))
 		return;
 
+	mutex_lock(&ag->mutex);
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
@@ -1738,6 +1739,7 @@ static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
 
 		ath12k_core_soc_destroy(ab);
 	}
+	mutex_unlock(&ag->mutex);
 }
 
 static void ath12k_core_hw_group_cleanup(struct ath12k_hw_group *ag)

-- 
2.34.1


