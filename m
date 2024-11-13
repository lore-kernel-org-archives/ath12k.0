Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE86D41C0C
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 07:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZAyG11EdJUGSuhGLQvC3o1xwxtgEsFxh4H3x1gsxlM=; b=Kh465IU3LYK3OKBFcLMLmmMlMO
	OieASHK1MsH3rdPGTcGwyqT1Resib4CcFHwhl3ydel8mQHnR2aEOt48rBK6WFMISkUSIg7fhV+hV2
	YuVU0rsLwYDP4abm/pzeeLV0qz02CX4RYesCWBIOC0LHeEFzWH5eBldpkwwg9pg11yWM1VzlRgAzl
	Dqn5tZchpRh07aGYlKrr371bAz+1vVSJvclGpJS7e0sjlQ6+JElv6DK+gxruPzWlWcekmDb7sUBuk
	CsqaHpK7YOQGLAHaGNZRXgJmbUs6yaLgXeS/UW/mLA8GJ7jbJeVS3YYznCUNrsosvZfwLfxeL132/
	7fmj9QdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7mj-00000005zcx-2Zfr
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 07:27:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7mh-00000005zcQ-0m7K
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 07:27:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD70hPr019458;
	Wed, 13 Nov 2024 07:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KZAyG11EdJUGSuhGLQvC3o
	1xwxtgEsFxh4H3x1gsxlM=; b=EYfQhEdUl1NQEUHG6elzbcMVpldsEX1nFOFe8Q
	T8o7zE/XgUw33JKliILrKQiU8gPXZoSU2IQYKmIIAtFsuIK+NXzwFNJizu+yJoaV
	/fwWJlW7rzJE7ukhBLEaruiO8O6sxTbLzZyVkTNnUXsddqwqRzymKCx8jZsfB9D9
	jBlBrCqD8ok+DzcHr3voWtNqWEb2rEoFzdQYllNHNzcdfdQVGEqXjcksCAjoz/wM
	Ax7+GiZBHHPjTi7B583PuiBAXsj2R4E4DIAptEv+Fpl//Be+PD5LEHbc1VfYuDow
	vzT5r9aoBnpUGqrqz3z7YS+2Xk+YweFp5NVAvh4G45PSaBEQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vqbm027k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:27:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD7ROXc018012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:27:24 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 23:27:22 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v5 0/4] wifi: ath12k: Support Pager, Counter, SoC, Transmit Rate Stats
Date: Wed, 13 Nov 2024 12:57:03 +0530
Message-ID: <20241113072707.3377341-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4knHXkPX3By8L99I0G1D_L6r-mLPNelZ
X-Proofpoint-GUID: 4knHXkPX3By8L99I0G1D_L6r-mLPNelZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=995
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_232727_359697_B39858CB 
X-CRM114-Status: UNSURE (   6.32  )
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

Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
These stat types give downlink pager stats, counter and TPC stats, SoC
common stats and Transmit PER rate stats, respectively.

v5:
 - Addressed Kalle's comments pertaining to variable declaration order.
v4:
 - Addressed Jeff's comments pertaining to data type conversions.
v3:
 - Added macros to fix compilation issues.
v2:
 - Removed dependencies. No change in code.

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Downlink Pager Stats
  wifi: ath12k: Support phy counter and TPC stats
  wifi: ath12k: Support SoC Common Stats
  wifi: ath12k: Support Transmit PER Rate Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 629 +++++++++++++++++-
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 204 +++++-
 2 files changed, 830 insertions(+), 3 deletions(-)


base-commit: fc6f018eda7f9054e427f731db1e8b200f22873c
-- 
2.25.1


