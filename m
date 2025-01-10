Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BBAE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 06:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3iS9Iloeshpk4CAshP3Zw4m3Jk+Wr6pCfQ/7Wt9Lpng=; b=JlkzMKPltoGr9BLNTe/EKx97re
	MhrVAOtsr+dxw3ybAzWt/GZMnMeQigIVZsY6I7DSzk3kjNK3akqA1+2Kzfx0G2t4W+LJ7xldQbOgO
	qsniqNrHOW/qGveDZwlrB3O6/N1Oe97dv8PV3Sg9D7X2EVHl0X6ITfTqXXRl2P4XV03cRqkf+xPMc
	33nVt3ME+lxXjdNbNQoYxDMrg5R2X+Ec9+ykMjZFZUQPLlSzEy6rMvLyXpoYsfeSyt13VPYxOTrRy
	RB5r/bCYOtGx267WMrG64GOTx5dwBGyZCYLdPB1mTi4P5sxqdcy7vI1M7bA8s7J6mKMl0YUc4+9XA
	b2u5FB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8hR-0000000EHYt-2R6h
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 06:40:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8GD-0000000ED45-2iGa
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 06:12:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3bvRx002811;
	Fri, 10 Jan 2025 06:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3iS9Iloeshpk4CAshP3Zw4
	m3Jk+Wr6pCfQ/7Wt9Lpng=; b=LzTkECx/pcwPzj4ZrTx7XB6k6xOLtHzX7e0Jbt
	NjndJX3CCMKvIZRMHWIAplOMBEwrKPO324PJ8yzR+2ciT4743bnzFerz6tC/tSZU
	kYU2B91ZD+a1u1FLPDyoOzh3TZFkQLkzWdsgKPSGa+itpFjHtxMkVmNjnS+LD15J
	+CuEno699QqvI6KZRFOnSxvC7eYdhnxj3tD2i2JO7CXH8mKcJpN+PxC7ErD8/Yck
	dkT50A0xam9HSPkrvFD4tDxoy/XVdxcVIUyECsKqxzlQpYJTfbaGwucxOB0SM6Xn
	L8liHQLbrCXbxK+PTRrqJH3D0SDPSvxggROt6GEwkY/dS03w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442uteg9db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:12:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A6ChiM024425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:12:43 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 22:12:41 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v7 0/5] wifi: ath12k: Factory test mode support
Date: Fri, 10 Jan 2025 11:42:19 +0530
Message-ID: <20250110061224.1839547-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cDL4JuwF_vvcljkL__qAsssaOiGYvt4e
X-Proofpoint-ORIG-GUID: cDL4JuwF_vvcljkL__qAsssaOiGYvt4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_221245_803469_CE73210F 
X-CRM114-Status: GOOD (  10.97  )
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

Device is booted in factory test mode for calibration.
The commands are sent from userspace application, which
is sent to firmware using wmi commands. Firmware sends
the response to driver as wmi events and driver sends
these events to the application via netlink message.

Also added changes related to correct pdev id access for
fw test cmd.

Aaradhana Sahu (5):
  wifi: ath: create common testmode_i.h file for ath drivers
  wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
  wifi: ath12k: add factory test mode support
  wifi: ath12k: Fill pdev id for fw test cmd
  wifi: ath12k: Disable MLO in Factory Test Mode

---
v7:
  -Updated copyright
  -Moved ath12k_ftm_check in ath12k_core_hw_group_set_mlo_capable()
v6:
  -Rebased on ToT
  -Updated copyright
  -Added patch[5/5]
v5:
  -Updated copyright
  -Fixed line length within 90 char
v4:
  -Rebased on latest ToT
v3:
  -Rebased on latest ToT
  -Updated Tested-on Tag
  -Removed second parameter of ath12k_core_start()
  -Updated copyright
v2:
  -Rebased on latest ath ToT
---

 drivers/net/wireless/ath/ath11k/testmode.c    |  80 ++--
 drivers/net/wireless/ath/ath12k/Makefile      |   1 +
 drivers/net/wireless/ath/ath12k/core.c        |  30 +-
 drivers/net/wireless/ath/ath12k/core.h        |  13 +-
 drivers/net/wireless/ath/ath12k/debug.h       |   3 +-
 drivers/net/wireless/ath/ath12k/dp.c          |   5 +-
 drivers/net/wireless/ath/ath12k/mac.c         |  17 +-
 drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
 drivers/net/wireless/ath/ath12k/testmode.c    | 394 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
 drivers/net/wireless/ath/ath12k/wmi.c         |  41 +-
 drivers/net/wireless/ath/ath12k/wmi.h         |  23 +-
 drivers/net/wireless/ath/ath12k/wow.c         |   3 +-
 .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
 14 files changed, 622 insertions(+), 85 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
 create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
 rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)


base-commit: dbe50a7420e22954c747e79e72df2750d795ea77
-- 
2.34.1


