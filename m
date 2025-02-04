Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10C7C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 06:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wvgUwBg2FrMRJ6J1XiTX5wDvBcwqTYr3F3sSGPYGWvc=; b=iGr4Ca2ZfzkoI1xw9mqdEm3EcJ
	mSVGH5hNMcY6K3i+ub0/72fWmNdH3dRTgJ3liELMUJPFDi2cFpHv7vpmNDshCHNVVJG1pJi48f9b7
	6MxqRoCx+dVy8YpiI2qD20XQ1Mn+xM21zWlXi6DmFoBqVmG/oN0b8UyJWPoTuyw4fwH/VsLGFl2Dn
	hOGmWXxXLsVzqw1/Ji5SiQtsop/RrcnNogq+5w5qzraHYq6G+DNSaY9SaJfhmcLlwTaB0Oin0bIoK
	OljhmTdMwzZ/RJ/K2QxtFUIvXem5ZYZ+aMSipKLMidxRpZ/oN7mmigbF8RFoTnOZQ5YyUrkTjz520
	lJgEZWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCfr-0000000HNt5-36ny
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 06:44:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCfo-0000000HNsk-3uVT
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 06:44:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514583NP008380;
	Tue, 4 Feb 2025 06:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wvgUwBg2FrMRJ6J1XiTX5w
	DvBcwqTYr3F3sSGPYGWvc=; b=nALUhlOeWp4wIvprWNURhSV/udL7qq6Il8FPlR
	MnC05kEmyJVVXJDHKGlgmQo11/Gmw46VU5m+qX+o1KQLAckK9wOY9Xp1je9RY8fD
	NS3i3TaUkzIqj34cO/VXjV5OEvsVpRWCW5DQUPfmjQhNRJgdGrBzf5dUfODEThBm
	vRrFnVhl4G4zgJKdpyfWZJ26CJl4HuwkRwZLGDx+KMWeUE2AcUx01UyFiP3WzjgO
	H/+BHj8E1jFQEA+bXXL6ZCMbVqVNw9dfLsakVUD27CPegs55CGAFYVuDAKfMEP7Q
	iPHwH+BVR9rZ1XGGgpOpD81xhT2WyEeW990ZSQiJGm/boisQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcfp0647-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:44:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5146icsG030717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 06:44:38 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Feb 2025 22:44:36 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v5 0/5] wifi: ath12k: Support Sounding, Latency, Trigger, FSE stats
Date: Tue, 4 Feb 2025 12:14:12 +0530
Message-ID: <20250204064417.3671928-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8jIBKWKfdA4HFs8YBObFZghq1hSeujks
X-Proofpoint-ORIG-GUID: 8jIBKWKfdA4HFs8YBObFZghq1hSeujks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxlogscore=858 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_224441_090671_B41E92FD 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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

Add support to request HTT stats type 22, 25, 26, 27 and 28 from
firmware. These stats give sounding stats, latency stats, trigger stats
for uplink OFDMA and MUMIMO and FSE stats, respectively.

v5:
 - Rebased on ToT. No code changes.
v4:
 - Squashed patches to avoid build warning.
v3:
 - Rebased on ToT.
 - Removed patch dependencies.
v2:
 - Added line breaks where necessary, as pointed out by Kalle.
 - Modified the use of pointer arithmetic print_array_to_buf_s8().
 - Modified commit logs, as suggested by Kalle.

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Sounding Stats
  wifi: ath12k: Support Latency Stats
  wifi: ath12k: Support Uplink OFDMA Trigger Stats
  wifi: ath12k: Support Received FSE Stats

Roopni Devanathan (1):
  wifi: ath12k: Support Uplink MUMIMO Trigger Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 736 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 275 ++++++-
 2 files changed, 973 insertions(+), 38 deletions(-)


base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
-- 
2.25.1


