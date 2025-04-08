Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FE9C3600C
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 04:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRVuJZCq4B6HKCSspyhJNNgrIC7t2BSotBHjmxVv3iE=; b=qqqzxO9uEo4wxf5l6FFi1/UNPy
	BNOFUiD9W0nP7ZSyhyIHSQtbXTY+lA1hzIFmx2RF6U3XYcReF/GA0tiX6ypZF3fccq95Elfh85tdO
	aiJp/IdMk8UhWB73X/c1VHqUmDvsKnf88gIhGkLOW2lSoqJULqkft0xA9S713GqC7pMELnxF1gzjJ
	aIzT4MCOJxOOnRxhfv4jqQkfhuv97fZn3BR5Gna72x/6uKWUHfQz8LC+iskbKNJxWdaERNp1Zq3V4
	FdLH12dw/PlM1Rx3h7c2gqatnVCGbDD7kiYeBdvwzvjVMYQr37SWs5BXp72DRvag26LY0aL8ZF3/h
	eqCjU/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20T8-00000002gbl-0EgO
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 04:21:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20T6-00000002gay-0ZQi
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 04:21:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382Gd3w015100;
	Tue, 8 Apr 2025 04:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IRVuJZCq4B6HKCSspyhJNN
	grIC7t2BSotBHjmxVv3iE=; b=HRr8jDl3CRw7FxQanFVYApxN+zV4rsIMKLhPdg
	fMPBfm73rVcRG9HlyjDyoZzQcc6CAleaBbpMv4cGYGa7JDDGUgzh5CtYJqCDvOef
	2YhGrO2P07XVMaQwJ61ochA/6VTnGRhMdswbJ5ULBh4neWtIe4/Kmp7vYvEdJebX
	G59ie8ExUoLvxSNtC3ya1oZRebJIa8XldkGFNPjRabWlNErMoVnD4a9AQP2dRwkO
	xZ1KsYMJMND/8Yfp0tN2Z4LYeMqYuhhxMGF2HXtAvzsjN42aQUUYLHQvA97f8VQ7
	mNlhPv02xTgBO0Nmswlq8qAbUhFKrofE0Sm/zOOV6tjrosOw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbueeyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 04:21:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5384LjPN020841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 04:21:45 GMT
Received: from hu-rajson-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Apr 2025 21:21:44 -0700
From: Rajat Soni <quic_rajson@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: Properly update frequency range
Date: Tue, 8 Apr 2025 09:51:25 +0530
Message-ID: <20250408042128.720263-1-quic_rajson@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lz2h3imQYVH11nt-C5xbVpmGMvoo3sCF
X-Proofpoint-ORIG-GUID: lz2h3imQYVH11nt-C5xbVpmGMvoo3sCF
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f4a45a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=zLfMTeblcGlTlpjJDDwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=743 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_212148_189309_350998E5 
X-CRM114-Status: UNSURE (   6.44  )
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

This patch series ensures that frequency range is correctly updated
compliance with regulatory rules.

Aditya Kumar Singh (2):
  wifi: ath12k: Fix frequency range in driver
  wifi: ath12k: Update frequency range if reg rules changes

Rajat Soni (1):
  wifi: ath12k: Add helper function ath12k_mac_update_freq_range()

 drivers/net/wireless/ath/ath12k/core.h |  9 ++++
 drivers/net/wireless/ath/ath12k/mac.c  | 49 +++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.h  |  2 +
 drivers/net/wireless/ath/ath12k/reg.c  | 67 ++++++++++++++++++++++++++
 4 files changed, 118 insertions(+), 9 deletions(-)


base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
-- 
2.34.1


