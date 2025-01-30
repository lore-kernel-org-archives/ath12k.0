Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4D9C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 06:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/S5b5p3AsfddZWildN4u3sxH0+4l2R6Oonh4mBG04qM=; b=LlJBfggBE4DND24KV69m0UKQyq
	+qGVBvfugRNUd+0KeMxJu5bL5KgWSlWqPhYUC/AK5AkSHJFiY4XjueYa0dAC93fY7Toshqv+TbbHT
	C0SQWSJKp2qzLVOl9bECDEAsmbdiccBPs4qUV3CyPF2kW2wAk2UGuHX14roPW48/WlyN4uqP3mm8W
	gVcWoSYmpoHqNrx/R2scBA5Y1qSuAijMLxtkbBVzzxcDKxEUN1r27iBy3qW9bqJoxO72IzBW8D7Rt
	ohxazG40f5Ve+dbF1aM1W5XaML5rFW8h5UwgP+MMod3dRW3rufRKC1O/gk06aD7+b4VPZ1/u/WUHX
	5ht/Qazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNmA-00000008IQx-3HZa
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 06:11:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNm8-00000008IQI-0una
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 06:11:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TJmSMG022844;
	Thu, 30 Jan 2025 06:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/S5b5p3AsfddZWildN4u3s
	xH0+4l2R6Oonh4mBG04qM=; b=Ruh1J/vY63svu3SE+q8qjav8afd3vH5sWVcZXa
	lJzJgg2IBON/DhXDsuMfpoliGiu5xt+DsErLyRJqeK8uL3tAoq8HJLS6moGAIIUF
	4644x6ZTxXlnk/zbr9xMIhWRYvoHOQ28v/iGBq9pWG+Qj/yX5gccErYr5jZHhXHs
	ynOgWtVtwwwxLYwf/wv4jvXIR9mJE8l7vrQ6sMEZcBJDhEyUqFzma+uPSt8dUQ7K
	fGZx5IKyCP59nD+Fu0RsPjlc08dO1gDGbGQXbDRPosv1cp1fTvj2R2EHluNS9VLH
	uR7+raJXdtpjhf9CGnldBb9wyNiWw9K6+5+blZnJqsfTkyVw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fttj10t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 06:11:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50U6BbhV005020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 06:11:37 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 Jan 2025 22:11:36 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v6 0/2] wifi: ath12k: Support Transmit Power Control Stats
Date: Thu, 30 Jan 2025 11:41:02 +0530
Message-ID: <20250130061104.962124-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DBleNlVs2A5wuX3f9zPjLe4YvGSfpKSZ
X-Proofpoint-GUID: DBleNlVs2A5wuX3f9zPjLe4YvGSfpKSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501300046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_221140_267750_0C110AB7 
X-CRM114-Status: GOOD (  10.98  )
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

Add support to print Transmit Power Control Stats. Add support for basic
infrastructure necessary for enabling TPC stats via debugfs. This patch
series brings support to request stats type from firmware and dump the
corresponding stats.

Schema for an ath12k device:
ath12k
-- pci-0000:06:00.0
    -- mac0
        -- tpc_stats
        -- tpc_stats_type

Sample TPC logs:
*************** TPC config **************
* powers are in 0.25 dBm steps
reg domain-22           chan freq-5955
power limit-126         max reg-domain Power-252
No.of tx chain-4        No.of rates-1164
**************** SU WITH TXBF ****************
                                TPC values for Active chains
Rate idx Preamble Rate code     1-Chain 2-Chain 3-Chain 4-Chain
4        OFDM    0x000          39      15      1       -9
5        OFDM    0x001          39      15      1       -9
.....
12       HT20    0x200          40      16      2       -8
13       HT20    0x201          40      16      2       -8
.....
44       HT40    0x200          88      88      88      88
45       HT40    0x201          88      88      88      88
.....
76       VHT20   0x300          40      16      2       -8
77       VHT20   0x301          40      16      2       -8
.....
172      VHT40   0x300          88      88      88      88
173      VHT40   0x301          88      88      88      88
.....

Note:
MCC firmware version -
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 does not print stats
because MCC firmware will not respond to the event passed from host,
resulting in timeout.

v6:
 - Fixed review comments about naming conventions for structures.
v5:
 - Fixed cosmetic comments about line breaks, function naming and
   paranthesis alignment.
v4:
 - Rebased on ToT. No change in code.
v3:
 - Fixed datatype conversion warnings in v2.
v2:
 - Fixed compilation issues in v1.


Sowmiya Sree Elavalagan (2):
  wifi: ath12k: Add Support to Parse TPC Event from Firmware
  wifi: ath12k: Add Support to Calculate and Display TPC  Values

 drivers/net/wireless/ath/ath12k/core.h    |   4 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 714 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/debugfs.h |  83 +++
 drivers/net/wireless/ath/ath12k/reg.h     |   5 +-
 drivers/net/wireless/ath/ath12k/wmi.c     | 451 ++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     | 140 +++++
 6 files changed, 1396 insertions(+), 1 deletion(-)


base-commit: a10b8b584b8bcb7559f068ce247fc27d0c4850ca
-- 
2.25.1


