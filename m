Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6028AC28B28
	for <ath12k@archiver.kernel.org>; Sat, 15 Mar 2025 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/D7Ywb35E297OmtqBzCrmu5RX7Xuv1Atj3Q0hOpfTj8=; b=XO2IUxqbmd3arQZfs9mmoqB6bt
	9SQ0zN0WvU8KwE8wZop8casS6H3PKEDiebO8XxFlfhSYaTKfisiQSne8PmWpkg5V2CZA5rllk0iiP
	TeluJt+eWXkiNEMBylstDGgcFSOOJH1P0hDrdNfy38m2KGUtSAlUcdr6x8OvsiH9ZSF2O416i8Ew5
	3o4Zv+NF9XZ/iXgkdoa2oYDQ0BFgG+T2ISpRkYyt3q3gzE1b9pOV0DLs//0BGW9GV1TFMDbPlDqvB
	svWq+e6d+JYK+zFyLFXZULgnY5TLWwinnYTXxIJTKOu/A3kxwsnhOuhTnmfdmffAsf2t0KXHor+Up
	wuBlLg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttU68-0000000Ga1Z-0f7k
	for ath12k@archiver.kernel.org;
	Sat, 15 Mar 2025 16:10:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttToD-0000000GYPt-0Gmb
	for ath12k@lists.infradead.org;
	Sat, 15 Mar 2025 15:52:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FDo2Rv014225;
	Sat, 15 Mar 2025 15:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=/D7Ywb35E297OmtqBzCrmu5RX7Xuv1Atj3Q0hOpfTj8=; b=UM
	02w05RAimKI2D7RannSulk2s6+VUSPXqesiZBW9+sY9tZNkyR9V1QcEyqTsBf5ol
	n7mPRR8uP8kZYGk6bHe6D1Xsmiei/yry9zPlOgxroG6z/O1l+IpmV0k2G/Tq3EGX
	+IuX9ibPFS55BZpVFNZaZHBVvHvH6JIv/e5K0BOIeonJ7C+eBCIfd/6k3wl5dvWJ
	Zt6Gpc+uhSWkmecR1VQpI1LWz1U+8ChoBVPqAdPtNA5zyV6F8HB98VwzWPmhpMYO
	ixR30Z+1grrMhOkSXubXxJWZZRMk+bc15sfmkCqIcJT/9ldNcR/CvF1IC2I7m2Zj
	OMZ3Cu+8/BKenXxjbCsw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r10wf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 15:52:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52FFqHqX016227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Mar 2025 15:52:17 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 15 Mar 2025 08:52:15 -0700
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
Subject: [PATCH ath-next v3 0/3] wifi: ath12k: Enable REO queue lookup table on QCN9274
Date: Sat, 15 Mar 2025 21:21:56 +0530
Message-ID: <20250315155159.2475885-1-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d5a232 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=tnCF6RmjttW7q9gwjsMA:9
X-Proofpoint-GUID: RQ6MMTIKFbRMcgjXzX0DXUe7V0G_m7Cc
X-Proofpoint-ORIG-GUID: RQ6MMTIKFbRMcgjXzX0DXUe7V0G_m7Cc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=464
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_085221_244349_5DE37FE8 
X-CRM114-Status: UNSURE (   9.19  )
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

Instead of storing the REO queue address inside peer entries, REO
hardware module prefers them to be stored in SRAM which could be
directly accessed by REO using peer_ID/TID based Lookup table(LUT)
mechanism. This feature is expected to improve stability by reduced
interaction between host and firmware during both MLO and non-MLO
operations.This feature is enabled only for the QCN9274, so it does
not impact the WCN7850.

v3:
- Rebased on TOT
- Fixed 32bit compilation warning

v2:
- Removed junk version histories in cover letter

Balamurugan S (1):
  wifi: ath12k: Add support to clear qdesc array in REO cache

Nithyanantham Paramasivam (1):
  wifi: ath12k: Enable REO queue lookup table feature on QCN9274

Sriram R (1):
  wifi: ath12k: Fix the enabling of REO queue lookup table feature

 drivers/net/wireless/ath/ath12k/dp.c     | 77 ++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h     |  5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 11 +++-
 drivers/net/wireless/ath/ath12k/hal.h    |  9 ++-
 drivers/net/wireless/ath/ath12k/hal_rx.c | 19 +++++-
 drivers/net/wireless/ath/ath12k/hw.c     |  6 +-
 drivers/net/wireless/ath/ath12k/hw.h     |  5 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  8 ++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  1 +
 9 files changed, 107 insertions(+), 34 deletions(-)


base-commit: a2ef9d802c470bc1cc8cb78391ac2e290422cee1
-- 
2.17.1


