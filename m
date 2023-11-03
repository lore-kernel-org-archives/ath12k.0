Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF96C4332F
	for <ath12k@archiver.kernel.org>; Fri,  3 Nov 2023 09:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ETfNiGcVCpHooT21t9UI9MzBckAIpB1gTrh5JEuB51A=; b=bt6NahqTbmsnsB
	t1id1fotXOboC+SjRnXgZ6NWecGNpt6GQmhqJ749cJ4FRTZXgUe2tQEYsyufy/3ELUlsJk8bgviU3
	OgwQL7r8VzfCy0tC8aJQ4eNeTpp6YYyBzbGBgdLFbVxDOH/TuPrh+K8kzmqTjHWmN3nnh0DkDSyi+
	Lr4putXasXkH+s7/ZTQ9AZdr+SROcgVAFVU6gKeolJ6ZDzb4FGLpG+YmBBUa7ntXsAMTWqQ+DVvG7
	JAYb9mmIKs0NdGD3c6x4vsG0o9iVB8PePdM7KukfFOkpaRdHRQ39+iWv9JJ+T+jvworDjog7s8a9v
	vxyW0N+qC5xBgrCtxBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyqd5-00B45A-0u
	for ath12k@archiver.kernel.org;
	Fri, 03 Nov 2023 09:38:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyqd0-00B449-23
	for ath12k@lists.infradead.org;
	Fri, 03 Nov 2023 09:38:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A38NQki017328;
	Fri, 3 Nov 2023 09:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=XD7wYxSQGIaI779dMXMYdFSKxOvx5+jeBJadQOVESFU=;
 b=jJpS0gjxrr7BsV/YyeukCNVWKTbAEGrwHyWmX52bMvLmdPvevYv7tfriFlc7pyvgaqHR
 VQDkcHH/7Tc4YBG6tGSPKiCSegUeXVmfnTLFcIOs9L1EWSSwkRBnxU9GpKmNuAp4ZZSJ
 EkSJ8l73usM0k/St6roumXCZwmmK/TuDBGaKnwkICaiUdWr8tQutKq6xc7mKweDhsSWD
 86mdD4BG/R6BaU7KPMJgdoPMr7faDChZz/+xeXoy0JDkpbDV0rGoYB0gq7k/E5UZxivj
 lcYy6ahJb2SAfr4IDx0J2f1MZOT0MujU7w87dqe2AidRSI3c7AWqAJKfvCSkHsrbqM8R 9g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4sft8jec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 09:38:07 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A39c6mb026207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 09:38:06 GMT
Received: from aarasahu-linux.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 3 Nov 2023 02:38:05 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v2 0/4] ath12k: Factory test mode support
Date: Fri, 3 Nov 2023 15:07:42 +0530
Message-ID: <20231103093746.24146-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PH2yO117DVMCJy7D1cQffoP8daUMfO-4
X-Proofpoint-ORIG-GUID: PH2yO117DVMCJy7D1cQffoP8daUMfO-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_09,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=947 suspectscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_023810_716700_53D566F0 
X-CRM114-Status: GOOD (  14.27  )
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

Device is booted in factory test mode for calibration.
The commands are sent from userspace application, which
is sent to firmware using wmi commands. Firmware sends
the response to driver as wmi events and driver sends
these events to the application via netlink message.

Also added changes related to correct pdev id access for
fw test cmd.

Aaradhana Sahu (3):
  wifi: ath: create common testmode_i.h file for ath drivers
  wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
  wifi: ath12k: add factory test mode support

Rajat Soni (1):
  wifi: ath12k: Fill pdev id for fw test cmd

---
v2:
  -Rebased on latest ath ToT
---

 drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
 drivers/net/wireless/ath/ath12k/Makefile      |   1 +
 drivers/net/wireless/ath/ath12k/core.c        |  19 +-
 drivers/net/wireless/ath/ath12k/core.h        |  13 +
 drivers/net/wireless/ath/ath12k/debug.h       |   1 +
 drivers/net/wireless/ath/ath12k/dp.c          |   3 +
 drivers/net/wireless/ath/ath12k/mac.c         |  13 +-
 drivers/net/wireless/ath/ath12k/pci.c         |   1 +
 drivers/net/wireless/ath/ath12k/testmode.c    | 413 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/testmode.h    |  42 ++
 drivers/net/wireless/ath/ath12k/wmi.c         |  38 +-
 drivers/net/wireless/ath/ath12k/wmi.h         |  23 +-
 .../wireless/ath/{ath11k => }/testmode_i.h    |  52 +--
 13 files changed, 625 insertions(+), 72 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
 create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
 rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (53%)


base-commit: f24dee89bb8a7ef33c28e31632b1f3dd4e196413
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
