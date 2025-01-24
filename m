Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033E8C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 06:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TjLpMS6x+RwtvlryzfD4wA6UUGx2cYpikbG/Si4Xym4=; b=SzxpNB9Aw9jUXj
	dzx5MyiKZKrstB3Av8RI4Fs6Jq4mYGks5UGY+5Co382Z5fJchmZg/w83PRE22ygsnyIQ1J+L3HMQt
	QicwWvjSXReHxItUJlN6zt4aohfr6dKTcbl4PQXyypP8U9ccuMto0OQrBmz57E7nTMqag2yT7l9c7
	Wf+o0F99LRZNiimkuW53qHgUb+fcE5lRqO8lnPxT4Uf8jrpeKpSwI7IxLIrHZ2H90m8lqalQZE4Zc
	yReeW/iCCdS/DkAv0pbL5coqb2llF7P+qn7U7R9+1ShVriwmubsGBptJvXDjVZ7swOUu0LE6la/z7
	GxhpVq8Yqo4TfDOU1G5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbCzx-0000000DzgC-29oD
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 06:16:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbCzv-0000000Dzfr-0Tju
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 06:16:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O3GTpe006824;
	Fri, 24 Jan 2025 06:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TjLpMS6x+RwtvlryzfD4wA
	6UUGx2cYpikbG/Si4Xym4=; b=CHi2K63bJm1S449o3pCdJMwv7V/1EQ/V38ay33
	EsqSemPCumeE1fxK+d/BC2A6iMtRyy05K5ew2z/B87CTrvud2eeQanbYqFjr2BZM
	sROwRr/GIJKYpBflFI/XnvsFEHST3fr1ERFN5xekPbgLg6IZTdKJSG48vnr5HsDI
	cspg6N/DShqXZdezTEG3joBjDbKkCA1HqwD2WN2eQS6R68NmGtp/cPP35s9NmQbc
	8l2EjiGR3T3XLcggUa2/YHM8sTO6H3pmH2+0hjV4ZfJKt+MYn4nXAHxnirv2lD8f
	skBhQ/UDa5oyZwLMN+Uc/edQhqbBCm9t+di7eaVS5mdUzPqg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c2t48ah8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 06:16:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O6GpcW031630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 06:16:51 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 22:16:49 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath12k: add MLO CSA support
Date: Fri, 24 Jan 2025 11:46:34 +0530
Message-ID: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIwk2cC/13MQQ6CMBCF4auQWVvDDJYSV9zDEFLaKhOFaotEQ
 7i7lbhy+b/kfQtEF9hFOGYLBDdzZD+moF0GptfjxQm2qYFyOiChEnrqka7tcPOtiVoUsrMSSed
 SO0ine3Bnfm3gqUndc5x8eG/+jN/1R1HxT80ocqGqrrRKopRlVT+ebHg0e+MHaNZ1/QA0yCvFr
 gAAAA==
X-Change-ID: 20241217-ath12k_mlo_csa-35bd512a05ae
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yvb8rKINXhbvn_vZz2QtCn9Gn7baKTqf
X-Proofpoint-GUID: yvb8rKINXhbvn_vZz2QtCn9Gn7baKTqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=768
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_221655_160915_5560BC18 
X-CRM114-Status: GOOD (  10.34  )
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

Patch 1 and 2 are pre-req fixes (applies to non-MLO as well)

Patch 3 basically uses arvif->link_id to enable MLO for CSA while adding
support to update counters throughout the CSA time.

Patch 4 fixes a potential problem seen when medium is busy. Again this
applies to both MLO and non-MLO. But this is exposed only when Patch 3 is
there.

---
Changes in v2:
- Rebased on ToT.
- Link to v1: https://lore.kernel.org/r/20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com

---
Aditya Kumar Singh (4):
      wifi: ath12k: update beacon template function to use arvif structure
      wifi: ath12k: fix handling of CSA offsets in beacon template command
      wifi: ath12k: update the latest CSA counter
      wifi: ath12k: prevent CSA counter to reach 0 and hit WARN_ON_ONCE

 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c  |  7 ++--
 drivers/net/wireless/ath/ath12k/mac.h  |  3 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 61 +++++++++++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/wmi.h  |  2 +-
 5 files changed, 57 insertions(+), 18 deletions(-)
---
base-commit: 376673aa393c1c232299be3e910d7f2e6d974b2f
change-id: 20241217-ath12k_mlo_csa-35bd512a05ae


