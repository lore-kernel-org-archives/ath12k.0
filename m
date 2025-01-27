Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67ADC0218C
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wZe/7faidhjsa+VnguZTBUsy04yYzm1aXITM1915jg=; b=BXja8XltMSHyqaqLZm3y2sjL15
	kdw16E4dETT6bAI8K0fSBvVSj46kjixVOcATJWMov4K5He14HT7texY7QdBb7Krc/KF/c6lbp3gTo
	iPkiZ/YIUTZvtyqrN9jtonivo+HVz587/p0N27cYxuAItAC6aVWApkDHIAywg/Loqm3u8uEZX1sUJ
	nD+o4OcuJd22aGm6VoxvsrQR61toZE3s6XNLBhB7R5gUT6awoDetw8GTzOZIuwfqWH/Qj215O9DQI
	zPrCohQuFUTPQ8XZ7UsdE9ScmnV9DoBuj0M2+XrH0OHYZVPezcUoeF1R9ExYyeEeR8FghlwVH26rz
	M4zVnNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcJcT-00000001ox7-2a9W
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 07:33:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcJcR-00000001ovl-1z2z
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 07:33:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R4s2R7023504;
	Mon, 27 Jan 2025 07:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1wZe/7faidhjsa+VnguZTB
	Usy04yYzm1aXITM1915jg=; b=Zv5jE/aubokitDWxIG3qdO9+ymOwHaJJjoMvzI
	6S42LmuSN6Oof+zkoNzX4MrCMOUV9w8v8uRctua3T7+C0+/5buNtyZasOiwWO2oq
	dEjc9c1cStiVHiudkB9Qi3tIT9zzrHvjUTTUyihX8ZAP+B3bliGFDaJ1mJHAPc5h
	pdME0oCIZT1dLxZr2V5dvq7dZ9XNedAkvDSBm6c9VpvFQq4138wFxmoNDUCcpBA9
	z55mlB5+aPgcWtfTrWN+P7hUr8Mvc90yzyrVLxvDRLOOlViQquQvIC/dlhrcxKER
	mAgAfExUPn2mjgOO5d5Q2XWGt/KViYE0YU4Lj9YBwh54/SXg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e3h2r9v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 07:33:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R7XD8o006916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 07:33:13 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 Jan 2025 23:33:11 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v4 0/2] wifi: ath12k: Support Transmit Power Control Stats
Date: Mon, 27 Jan 2025 13:02:53 +0530
Message-ID: <20250127073255.3374341-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gSNgnaAwFVOCuX4mFp1aQ2ml5j4ALXQA
X-Proofpoint-ORIG-GUID: gSNgnaAwFVOCuX4mFp1aQ2ml5j4ALXQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_233315_513280_C2A25FBA 
X-CRM114-Status: GOOD (  10.56  )
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
 drivers/net/wireless/ath/ath12k/debugfs.c | 715 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/debugfs.h |  86 +++
 drivers/net/wireless/ath/ath12k/wmi.c     | 458 ++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     | 140 ++++-
 5 files changed, 1402 insertions(+), 1 deletion(-)


base-commit: 5e40b6ac64339a78a5fbf1009581aa43eb46c352
-- 
2.25.1


