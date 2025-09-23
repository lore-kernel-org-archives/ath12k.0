Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43EECAC5A7
	for <ath12k@archiver.kernel.org>; Tue, 23 Sep 2025 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vuvw0iOUlANAZu26Ljg0Mgq5ACzVJZBB3/eqc+0sboQ=; b=NM6KFj5rZoK+eS34vYKw3GpiRb
	a/+7QbDNRZPCio4bF1JWREfofKjiR1jcGc3pjK6oVCOvvT5JHkEHrlTYQS8jUBaNthj/fNnTAcWZj
	F/hkT2Onp/ADA/6shnsKwNveoGfEvfrAA59tnMyzeKMtOcVS1HmXqMQJAdyhVjXWfr7mPfUrvw4r3
	FqoSz9ghLngPuJVkPRoq3+pJYmKSGezcFoDZ/0uTa96+hJcenLhvIXqvPBY2ulgjrl5CMeRkswcf9
	taTYMxw1RiFqP/9AqGx0tELx58LL5UHUzuW4jVRV1HZLKsb1z6jadcVJZ5znU7jVhU2figtFAVoWy
	7YVziAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zlN-0000000Czsh-1g0z;
	Tue, 23 Sep 2025 09:56:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zlL-0000000Czs3-0L95
	for ath12k@lists.infradead.org;
	Tue, 23 Sep 2025 09:56:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H999020624;
	Tue, 23 Sep 2025 09:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vuvw0iOUlANAZu26Ljg0Mg
	q5ACzVJZBB3/eqc+0sboQ=; b=gYwamnwyhyMShGp0t94Ap675jSAeCKAmv95S+7
	5L1abo6+sKpt6FlvHXLQSbVgBlpVtYmL0yrkJm151SlV4fF5cfrn8qskVAj9fNMx
	3GPWeenF05Wp/UnU7LDtFN8d6uILzs+ZdFEeVKYEwsPbfQ52zCkmkEo83LdgfTtu
	IcY02jf+f4/aEdmJXpQ/TK3bTYE1qIcziUn8aHWLznjmOJfxVFBpcsfeptVNIOym
	dUg5tYlX9OgoIkZJMZZQ66Obhc/HhSTu3U9+GHPXkm0dqDUeZ+zggwBGk0wwqdDk
	vWCBYzdVBbhK/r0GjbN12cGByzxiuXuXWufZxiYjyYQdM2iA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjscj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 09:56:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58N9ufII026985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 09:56:41 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 23 Sep 2025 02:56:40 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 0/6] wifi: ath12k: Modularization of objects for Next Generation Driver
Date: Tue, 23 Sep 2025 15:26:22 +0530
Message-ID: <20250923095628.2438280-1-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 95Pjta5xVZi-4vPkNcvhz9lKp_xpsuD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX6/nYmvGuOFoN
 3S9FzkRdJNiybrkjDyznuLxnmq4L3LSm5azIwXocxSoyaRBPUo2xkAH0WX35ZdH9VbjvDIbEZui
 0v5eYuQlmACn6Mydq27qUh4xipSNA5MjwSkvWNxDBlqL7nO3CzuzN1kOxUwzpWHlp1Dx90lB7VW
 BvKnC6b+Bquujta/OO9gCaApXOjJU2+DGVT2Tl/gC4ZtWqmhuDqZJM1vT6Bv+nAvKD0shmx2a5U
 MlJpSuDhmKpgUoDHklnyEa6CckE0N+FjQQD6qjKeNElNjLaQOLMMawrYKiO7LQiGYIqDAV2Y6oG
 WYHaoQuc3Ze4FBan9IpvAvL/Gg2d0thIA6dOq9tfVhGpttHHKpcXAczRXoUJ13aogSy4J2Vx5Lm
 CvlhxySb
X-Proofpoint-GUID: 95Pjta5xVZi-4vPkNcvhz9lKp_xpsuD_
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d26eda cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=ZmDZ8v0v9Rlbw9gN6qoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_025643_309689_C46761F9 
X-CRM114-Status: GOOD (  12.39  )
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

The primary purpose of the patches in this series is modularization of
object structures along with their allocation and initialization APIs.

Patches in this series are made to achieve the following:
1. Modularization of device object to have a separate DP object in order
   to support chipsets of different hardware architectures
2. Refactor hardware group and vif structures to optimize data
   path operations for future extensions
3. Add framework to support architecture specific interrupt handling and
   ieee80211_ops registration

These changes are intended to provide a base framework for the data path,
allowing the data path to remain flexible for future extensions in Next
Generation driver development.
---

Harsh Kumar Bijlani (1):
  wifi: ath12k: Refactor ath12k_vif structure

Ripan Deuri (5):
  wifi: ath12k: Convert ath12k_dp member in ath12k_base to pointer
  wifi: ath12k: Support arch-specific DP device allocation
  wifi: ath12k: Rearrange DP fields in ath12k_hw_group struct
  wifi: ath12k: Add framework for hardware specific ieee80211_ops
    registration
  wifi: ath12k: Add framework for hardware specific DP interrupt
    registration

 drivers/net/wireless/ath/ath12k/ahb.c         |  35 +-
 drivers/net/wireless/ath/ath12k/ahb.h         |   4 +-
 drivers/net/wireless/ath/ath12k/cmn_defs.h    |  19 +
 drivers/net/wireless/ath/ath12k/core.c        |  19 +-
 drivers/net/wireless/ath/ath12k/core.h        |  43 ++-
 drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.c |   3 +-
 drivers/net/wireless/ath/ath12k/dp.c          | 148 +++++---
 drivers/net/wireless/ath/ath12k/dp.h          |  24 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h      |  50 +++
 drivers/net/wireless/ath/ath12k/dp_htt.c      |  22 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c      |  15 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  20 +-
 drivers/net/wireless/ath/ath12k/hif.h         |  30 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 339 +++++++++---------
 drivers/net/wireless/ath/ath12k/mac.h         | 131 ++++++-
 drivers/net/wireless/ath/ath12k/pci.c         |  40 ++-
 drivers/net/wireless/ath/ath12k/pci.h         |   4 +-
 drivers/net/wireless/ath/ath12k/peer.c        |   8 +-
 drivers/net/wireless/ath/ath12k/testmode.c    |   3 +-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c   |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/core.c  |  24 ++
 drivers/net/wireless/ath/ath12k/wifi7/core.h  |  11 +
 drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  56 ++-
 drivers/net/wireless/ath/ath12k/wifi7/dp.h    |   9 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  88 +++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  29 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  62 ++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c   |   4 +
 drivers/net/wireless/ath/ath12k/wmi.c         |   5 +-
 drivers/net/wireless/ath/ath12k/wmi.h         |   5 +-
 drivers/net/wireless/ath/ath12k/wow.c         |   5 +-
 32 files changed, 908 insertions(+), 354 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/cmn_defs.h
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_cmn.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/core.h


base-commit: 972f34d54015a4a16aa9e6a081bafabb6f9bf95c
-- 
2.34.1


