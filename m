Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B363C36010
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 02:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7V4DAPO81kQa2KrxRoWP3Byu/nrWhYhVsqeLtvyh9SY=; b=txjQ7d0XOrjCbc
	IIjpUGaTrHrdgR1SpuwfmB+r6/DATJ3HC5vAyoieO0jKjBpE1als5jpjCr9DYuD99Ydv6PmyC+J5v
	UK/8KoGdhYmH0kU9dZN90Np6QUWD5bxasvl3aTHYD1kWaNOxtHMzN765HG1JcVUayETnb3OkKe3FG
	F1Ia/igf9tIpSZJ2EbKfBqxlpKB/FgoIjAsuZ4f3kGu5nl0wTAFvtQDTaMZtWnhEQE74L64z1LjDw
	oqtjU3f2+rxWvVzgNvuEkUxqsfl7BsYMYiXYFeEZJD6uDyhw1yJ31d/JEGWeN4C+27QIFaC40oKny
	HvWpMRFpnUIr/Zc+tGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2L9q-00000005vMF-14aQ
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 02:27:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2L9m-00000005vL5-321X
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 02:27:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYwbf015755;
	Wed, 9 Apr 2025 02:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7V4DAPO81kQa2KrxRoWP3B
	yu/nrWhYhVsqeLtvyh9SY=; b=JtWFgiU1yH1velhJQsOc2phK/hrMj2mWCopPMT
	XtY5MXWJdO0QZ6NVyBAaWuHiPUcvQSs9DVqyvPXXZ9oTRSXQhj1XuKMRb7FEsIf9
	kqe9F3vrxLOGyXJ+RVb5Sr9aOckYeksNoAETWOP+0u8/JBQhRVTd6O1U8Qw1vGIz
	ELII7eYgKydCi6vZJJ2RR5stXLX4C9F/kfKcIvPK4Xt2tYLaPxWPhXEWz3IMbtrt
	WUDHO/vJNkkbXLMncZnnGGXzDtT5eA5JdOWz3WRAh79wKspwed1ZLSlhdvqmdSFi
	yefvwSsO5qWN7/0DYt7aAJoc2E16kqs8NZ2pDCadJ+twsKDw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2ssma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 02:27:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5392RB8u000881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 02:27:11 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 19:27:08 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [PATCH ath-next v2 0/9] wifi: ath12k: support MLO for WCN7850
Date: Wed, 9 Apr 2025 10:26:33 +0800
Message-ID: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANra9WcC/43NzWrDMBAE4FcJOnfLSrKzdk55j9KDfta1aCM5k
 uOmBL97hS8hFEqOwzDf3EThHLiIw+4mMi+hhBRrUC874UYTPxiCr1koVC1qRWDmUapP+HaRuhb
 h9JWgXKYp5RnswL7tlZe6t6ICU+YhXDf8TdQdRL7O4r02Yyhzyj/b60Jb/8zBQoCA+0GbHpnI2
 +P5ElyI7tWl0wYv3fNYVzHTW91oYiv37V9M3rEG1b+YrJg1viE3IBI2j9i6rr+ObOTWagEAAA=
 =
X-Change-ID: 20250327-ath12k-wcn7850-mlo-support-bfed592d139b
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XuOXCbZeLa9vstrAXzMSmcihv9AaQI4d
X-Proofpoint-GUID: XuOXCbZeLa9vstrAXzMSmcihv9AaQI4d
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f5daff cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=S8qQzX23J8qjeTGorjwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=891 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_192714_811988_D519572C 
X-CRM114-Status: GOOD (  10.63  )
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

WCN7850 firmware uses API-1 so it can not advertise MLO support via
firmware IE, but instead it uses single_chip_mlo_support flag in QMI
message, the first three patches serve for this purpose.

Currently ml_arg->assoc_link flag is not set in
WMI_VDEV_START_REQUEST_CMDID, this result in WCN7850 firmware crash
in MLO case, so patch [04/9] sets it for assoc link.

Patch [05/9] makes sure we do assoc for assoc link before any other
links, as requested by WCN7850 firmware.

Patch [08/9] change to send REO queue configuration to firmware
for all links including non-primary link. For that purpose, preparation
is done in patch [06,07/9].

The last patch increases number of different channels to 2 for single
pdev device, to avoid failing in bringup the second link.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
Changes in v2:
- rebase on ToT
- Link to v1: https://lore.kernel.org/r/20250402-ath12k-wcn7850-mlo-support-v1-0-bad47cf00704@quicinc.com

---
Baochen Qiang (9):
      wifi: ath12k: introduce ath12k_fw_feature_supported()
      wifi: ath12k: use fw_features only when it is valid
      wifi: ath12k: support MLO as well if single_chip_mlo_support flag is set
      wifi: ath12k: identify assoc link vif in station mode
      wifi: ath12k: make assoc link associate first
      wifi: ath12k: group REO queue buffer parameters together
      wifi: ath12k: alloc REO queue per station
      wifi: ath12k: don't skip non-primary links for WCN7850
      wifi: ath12k: support 2 channels for single pdev device

 drivers/net/wireless/ath/ath12k/core.c  |  23 ++---
 drivers/net/wireless/ath/ath12k/core.h  |  15 +++
 drivers/net/wireless/ath/ath12k/dp_rx.c | 178 ++++++++++++++++++--------------
 drivers/net/wireless/ath/ath12k/dp_rx.h |   4 +-
 drivers/net/wireless/ath/ath12k/fw.c    |   9 +-
 drivers/net/wireless/ath/ath12k/fw.h    |   3 +-
 drivers/net/wireless/ath/ath12k/hw.c    |   8 ++
 drivers/net/wireless/ath/ath12k/hw.h    |   3 +
 drivers/net/wireless/ath/ath12k/mac.c   |  62 ++++++++++-
 drivers/net/wireless/ath/ath12k/pci.c   |   4 +-
 drivers/net/wireless/ath/ath12k/qmi.c   |   6 +-
 11 files changed, 213 insertions(+), 102 deletions(-)
---
base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
change-id: 20250327-ath12k-wcn7850-mlo-support-bfed592d139b

Best regards,
-- 
Baochen Qiang <quic_bqiang@quicinc.com>


