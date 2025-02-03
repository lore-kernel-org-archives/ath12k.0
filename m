Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4ADC02198
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 07:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rIKVqs6srmjXj89c0Lhu5HKpeL5yplUu6T2wV1qKBHw=; b=MAU2Ay3StKDBbNN1hH3eIL3pkD
	7tOl9WJQi1xS8fXS2hi3/UvEX7lOpfDS8QAqdDLEsIPBcQYEmiZO/MimB7rlmK2c/znF09pkbs4ru
	sLqbZIZLeL9tPYuW+PlgThKgKDVrflhsM8F1KZUzFtbQfUzltUjapqx5TZG+dBAMbQ0VdDywsnITA
	rJ9EK78pDoLpEo6H/zMXdEeLqoxfYck6uHVDDyRFvNsdRwMwDboaX6gB0JTKlBPWmLXT3grnfTlGB
	RheyD0H7DOPv0OzGuhXxYwDxvYcVLWepn+5EdpSnSHIMDyOnNOVrzzslYXhExKDJP3O+5u0HhRvYq
	M4lfE11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terKT-0000000EkkI-2BMQ
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 07:57:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terJJ-0000000EkbZ-1EU5
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 07:56:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513673iq009303;
	Mon, 3 Feb 2025 07:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rIKVqs6srmjXj89c0Lhu5H
	KpeL5yplUu6T2wV1qKBHw=; b=GiCsftvMEP0laGtEuIBKW0usJe9RXl7KWVxpbl
	rPuNhODRT5ydxX5O9BdSGzWEcRHqYWdd/Yd9gfjZjFtER7vFpojHKDXaIauYFHwh
	7VBd2jiXCINkXDjTiE/PWUN6WVhimGGDA0qCqf0jgqmoV2o2hB0TTYoLFJ1DnZ38
	H05GhceZtA1OdfjKT0JqSGv5Z2dYNudNKbHCmo6bP9VKPMzDcH56jNvP7PYAiOws
	31aiH7Zcb7LMkWB5tvnEAs/9OZkboXm1a8Dakon5xLuGBFBFFTv2a6CzMIBgDn1+
	8aIUAKXBlmLJHO49+mbHt4nk0Q3i7YDXxmWK15TEfCdqjxjA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jr888776-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 07:56:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5137u0tD009516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 07:56:00 GMT
Received: from hu-bmahalin-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 23:55:59 -0800
From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bmahalin@quicinc.com>
Subject: [PATCH v3 0/2]  wifi: ath12k: Add support for MLO Multicast Handling
Date: Sun, 2 Feb 2025 23:55:36 -0800
Message-ID: <20250203075538.3982875-1-quic_bmahalin@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H4GippJyAqvAt-xMMC-IxE-H94yFG-rd
X-Proofpoint-GUID: H4GippJyAqvAt-xMMC-IxE-H94yFG-rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=749 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_235601_355415_E0A70445 
X-CRM114-Status: GOOD (  10.53  )
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

Patch 1 updates the HTT TCL metadata version to use the new bit definitions
	of the field to pass additional information from Host to Firmware.

Patch 2 moves the MLO Multicast frame duplication logic to the driver to
	have more flexibility to update the HTT TCL metadata with the global
	sequence and with a special vdev id to indicate Multicast handling

v3:
	Updated the code to handle the ARP transmit failure from AP side during secure mode.

v2: https://patchwork.kernel.org/project/linux-wireless/patch/20250203025016.3851279-3-quic_bmahalin@quicinc.com/
	Optimized vdev id arithmetic for more readability based on feedback.
	Updated code documentation on intentional reset of meta_data_flag value.
	Rebased on top of master branch.

v1: https://patchwork.kernel.org/project/linux-wireless/patch/20250109184932.1593157-3-quic_bmahalin@quicinc.com/

Balamurugan Mahalingam (2):
  wifi: ath12k: Update HTT_TCL_METADATA version and bit mask definitions
  wifi: ath12k: Add support for MLO Multicast handling in driver

 drivers/net/wireless/ath/ath12k/core.h  |   1 +
 drivers/net/wireless/ath/ath12k/dp.h    |  27 ++++--
 drivers/net/wireless/ath/ath12k/dp_tx.c |  28 +++++-
 drivers/net/wireless/ath/ath12k/dp_tx.h |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 124 +++++++++++++++++++++++-
 5 files changed, 167 insertions(+), 17 deletions(-)


base-commit: a10b8b584b8bcb7559f068ce247fc27d0c4850ca
-- 
2.34.1


