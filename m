Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193CCCF8878
	for <ath12k@archiver.kernel.org>; Sat,  5 Oct 2024 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YzlJ2EaVnqtnOHyG2PD7KnWWoZS/TX1ctzTn0ibzukc=; b=qNDDoLPRfDe/udgJdNbaOSXXEL
	DJrwpUxcfIUvUhciPuekHfxaE+N9PlaP8wUjswjTjPqAGiZwjKNU5TMa9eeW/FlyLju/UBULfo8t3
	pgNKd/UJs4npANTRcQ0+jhdcqkcttKMPJD0JjD+wAHdvxm9fRk2GwE6fbecbwFhpmCNYB6BEVZwmT
	k6547Btzl5F+K6gpFAQrRr6ACGn2YGoghGszPQsHa2vVjmV/JOFuxntiJOnLc0LMx82uy7nOmdxeg
	6MhsGmknPI8Ga3Jo8AeJVPkYgJy5RX9MSVPHkI/fxA7oZS1Q0AXNXdBAwtL3G2f6a5eOyzq8rkPO3
	dEiT7Qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx1s2-0000000FBGM-2O2V
	for ath12k@archiver.kernel.org;
	Sat, 05 Oct 2024 10:18:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx1rz-0000000FBFR-26Iu
	for ath12k@lists.infradead.org;
	Sat, 05 Oct 2024 10:18:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4959nESH020625;
	Sat, 5 Oct 2024 10:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YzlJ2EaVnqtnOHyG2PD7Kn
	WWoZS/TX1ctzTn0ibzukc=; b=gsyMOOf/ccr5tnSmp8X5kjaZ0uIcfP1JCl/xZV
	GpV3CJ6jBUfIY7TGkRiDoUOPHJy1XkukrjbQExN2RaoZxoeUBtGzDVckEGg3lzIz
	VW0vZ62QGF6deOQmvnPk8PPnJiHPO4Myn9RY/4Id2egB/DPEcNnsSHkpqzMwRO6a
	DA4IxXWijaxfN2COWElQ6+q71SDGOH6OrTETko3bVbW8BBmO9YulHZCIJK88dIoQ
	6jG5L0KjCF6ZlBlWrwB7DIES1bxmww1PPhig8oJlPi4hm7kGTlHq0Sl/Xn0eqCZP
	CEeFMHdc5WE4c+7PD16rpGc2id+QD/KykC/BnBl+RVY6YQvw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv88bxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 10:18:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495AIZB7022347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 10:18:35 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 5 Oct 2024 03:18:34 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath12k: Support Ring, SFM, Transmit MU, SelfGen stats, CCA stats
Date: Sat, 5 Oct 2024 15:48:12 +0530
Message-ID: <20241005101816.3314728-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DkbC4oVDfr5pllO0a65BLyzhakz-WAqB
X-Proofpoint-GUID: DkbC4oVDfr5pllO0a65BLyzhakz-WAqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=583 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410050076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_031839_597947_2DC4EDA4 
X-CRM114-Status: UNSURE (   6.92  )
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

Add support to request HTT stats type 12, 15, 16, 17 and 19 from
firmware. These stats give self-generated transmit stats, ring stats,
SFM stats, transmit multi-user stats and CCA stats, respectively.

v2:
 - Modified the API print_array_to_buf_v2() to print_array_to_buf_index().

Depends-on:
[PATCH v2] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
Link: https://lore.kernel.org/all/20241004085915.1788951-1-quic_rdevanat@quicinc.com/

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Self-Generated Transmit stats
  wifi: ath12k: Support Ring and SFM stats
  wifi: ath12k: Support pdev Transmit Multi-user stats
  wifi: ath12k: Support pdev CCA Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 1047 +++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  346 +++++-
 2 files changed, 1387 insertions(+), 6 deletions(-)


base-commit: 8ed36fe71fd60c851540839b105fd1fddc870c61
prerequisite-patch-id: faf46024c8b5c094e201d392109e7f94dcecdd49
-- 
2.25.1


