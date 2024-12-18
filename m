Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE61E77183
	for <ath12k@archiver.kernel.org>; Wed, 18 Dec 2024 03:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0YEgSlwMNnP7jmEBlmVwtU2ARROQV13scoJq2pDSJU=; b=XHB75IxZTyJQGR
	qmIwqpl3v454mXPQdJRFve4qev9mS9ojUpBlHVNM2HQ/3iPu0LeABnQEHHyIrBlBJGqHtp4Gli6hR
	pW3fXL5Fb9DDnJD8ULro3OHCcf2PgVJsSWg6/W+FUrCD8KlPCTq1epnrducWJltMl5cF8BZjrUtas
	hMlredRCO4Oo/UsDX0nqAWuAMFXgpCwVllMtSkCvhvvrxrzg0oMoFLyiegXESEGuBjTt2I7Bg0tmS
	MjVfCrkc8YjmFeIa2PdOlPElAwU0Jnnbrs+AfZ5pPJ2DHz5Nmm9/tZGTpngFqmkeZ3AF/GjdtsoIp
	fAi7xPRieOsCKqkLYxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNkwc-0000000FUyX-2IOT
	for ath12k@archiver.kernel.org;
	Wed, 18 Dec 2024 03:41:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNkwZ-0000000FUxA-3s53
	for ath12k@lists.infradead.org;
	Wed, 18 Dec 2024 03:41:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHKre27013674;
	Wed, 18 Dec 2024 03:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E0YEgSlwMNnP7jmEBlmVwt
	U2ARROQV13scoJq2pDSJU=; b=hcSkhDaV/bMiq+0PC+5fagBPYvDda/Gl+YRaHj
	eIQRAKB2Fl6XMWGKGn7Z6rFxyl0W0sOccrS65uTnP4MqE4kXX/azN7FZdq3tZC50
	KC450uPcXvTG3nYFpY4UmTBKq+mgJNCmBEacGJCQq0A3Tjo1r0wlhcoOoFOF/kZ1
	9mtM13MaS10yDbr5Dju9ZVz7gU+deIQ60JNQ82OcrG4TBAUUQAoNWLknAcnfomYz
	COX8gp04xRfIkcys/CE4sojYNo1Jb/VYJMlij4IZFlybcnMRqDUMrEbl9p62oCbW
	PvmTZamI+xXx6WNYrHAcRz5g9EKYW3pUnkBAyZ7iGIPJHfHw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kgr10qk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:41:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI3fj3g031530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:41:45 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 19:41:42 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: add MLO DFS support
Date: Wed, 18 Dec 2024 09:11:31 +0530
Message-ID: <20241218-ath12k_mlo_dfs-v1-0-058e783bcfc7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGtEYmcC/x3MQQqDMBBA0avIrA04aazQq4gEiZNmaGskI1KR3
 N3o8i3+P0AoMQm8qgMSbSwc5wKsK3BhnN+keCoG3WiDGjs1rgH1x/6+0U5eVOu8wa55ONM+oUR
 LIs//e9gPxYFljWm//jnnE5tUwPpvAAAA
X-Change-ID: 20241217-ath12k_mlo_dfs-5cf41703c456
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sHg1Zx0BRCtkg_RXs6F9Wv5ZzAC2-ZKS
X-Proofpoint-ORIG-GUID: sHg1Zx0BRCtkg_RXs6F9Wv5ZzAC2-ZKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=819 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412180026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_194151_965490_404CD6D1 
X-CRM114-Status: UNSURE (   6.81  )
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

Patch 1 is fixing naming inconsistency in CAC_RUNNING flag.

Patch 2 is not directly related to MLO but fixing the CAC handling in
non-MLO cases as well.

Patch 3 is adding the MLO DFS support in ath12k.

---
Aditya Kumar Singh (3):
      wifi: ath12k: rename CAC_RUNNING flag
      wifi: ath12k: fix CAC running state during virtual interface start
      wifi: ath12k: handle radar detection with MLO

 drivers/net/wireless/ath/ath12k/core.h  |  2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c |  6 ++---
 drivers/net/wireless/ath/ath12k/mac.c   | 42 ++++++++++++++++++++++-----------
 drivers/net/wireless/ath/ath12k/mac.h   |  8 +++++++
 drivers/net/wireless/ath/ath12k/wmi.c   | 14 +++++++++--
 5 files changed, 52 insertions(+), 20 deletions(-)
---
base-commit: 9a448415ed0c46edeb9170091a03b620986ca0b2
change-id: 20241217-ath12k_mlo_dfs-5cf41703c456


