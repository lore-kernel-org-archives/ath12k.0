Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A60C02180
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 04:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WBUgZdkKaBMW2fpdvNTz8gg0qsYKDcgDY3nUbFDtC1A=; b=bF2rb2M2nX2qob/cefrRpUOL/h
	PVCxztKawbv44UMipBe1LlvXWuqtk0ymd+b/tyx3TupaB5yPcy5ZEbafdjlcpOKWMga0Wna5zCfZW
	aCM3U5mCNMDfITUFkV6fYOBEfMMwINc9d4iD5gSjyGRum8eHV/820WeLi5ljGWoST7FNUf2wJo1Eg
	xHCBY1ZgV9UPLOWxFLAL1swm08e08E4wtS0QA4mBziTuS8ZPs7PbKasN3c+0SzrSpkKpwkVwVkmva
	A6v0AWVxTrl9Cyx/sK4QuK9sBvO2ACJvB7L0uoyBEGWrBcIvXkd+otP/rq6i0g9yaXZqT1pJuVqHT
	RGcCd/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuyY-0000000AbSf-1IxO
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 04:25:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuyV-0000000AbRq-0G5n
	for ath12k@lists.infradead.org;
	Wed, 15 Jan 2025 04:25:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EGjocb024794;
	Wed, 15 Jan 2025 04:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WBUgZdkKaBMW2fpdvNTz8g
	g0qsYKDcgDY3nUbFDtC1A=; b=YzbrScIoSsdYHuqz+C3XjCbZ7FHLiy2ssCMZF6
	oqUljXiP9HS68vi4D5StI9k754AE1epeahZocax8ziSzJBdJY810Xg5Gqf7FGmHf
	r2NXnt23Gws+XWVPuCRg6lK0SsuKxzqTmyaJZkFPscbUR9KhW94z8ZL0efC78Wdp
	Y/uLcGCeBwHMZTXn0msPGkZZltfMug07rNPep2bDw0IGKbXYiJB36Ro+4VxTdwY7
	sIpFCYNeQFpz0K7SldtJuNEqBCihDrLK/pkR614br8vgRdYuXMj1Us3rfXBRoY91
	7gnboU+/biJ/xqme9BywLW/fnejjNb0Vn/ovC4zv9NGbhZEA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445uqs1cqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 04:25:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F4PnnN019993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 04:25:49 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 Jan 2025 20:25:48 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v9 0/5] wifi: ath12k: Factory test mode support
Date: Wed, 15 Jan 2025 09:55:27 +0530
Message-ID: <20250115042532.1509956-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FFGhuPsY1Q-rcCgpZ9bX37-p6aVR01vq
X-Proofpoint-ORIG-GUID: FFGhuPsY1Q-rcCgpZ9bX37-p6aVR01vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_01,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_202551_115085_1127AE0F 
X-CRM114-Status: GOOD (  10.90  )
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
v9:
  -Rebased on master-pending
v8:
  -Included change for assigning seg_hdr.pdev_id.
  -Moved if block to start of ath12k_core_hw_group_set_mlo_capable()
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
 drivers/net/wireless/ath/ath12k/core.c        |  28 +-
 drivers/net/wireless/ath/ath12k/core.h        |  11 +
 drivers/net/wireless/ath/ath12k/debug.h       |   3 +-
 drivers/net/wireless/ath/ath12k/dp.c          |   5 +-
 drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
 drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
 drivers/net/wireless/ath/ath12k/testmode.c    | 395 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
 drivers/net/wireless/ath/ath12k/wmi.c         |  41 +-
 drivers/net/wireless/ath/ath12k/wmi.h         |  23 +-
 drivers/net/wireless/ath/ath12k/wow.c         |   3 +-
 .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
 14 files changed, 620 insertions(+), 82 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
 create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
 rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)


base-commit: 2d17dd7f1c17c36e0354a7e14c00875424506be6
-- 
2.34.1


