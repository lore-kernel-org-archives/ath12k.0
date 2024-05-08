Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3BEC25B5F
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 17:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tlHSrKHW/bkhBx4e3jrASEpXIdGjrGwuavKa/JJWfVU=; b=DuI9h3zeRrjgEtpHycAUl4hYVL
	oTYkJQ3Vn5M3XP8AgbBtChFkwu794DNcQxuVlbKSv0QWhZWcRIYZCX8YPuR7RoyyZdTh1pKG+9FRz
	mjYnv9wFNW12eNcmD66LYTH4MaL5kzNz+DEd4E/QbmkK5YxDy/OXDDT5sWZQcwVHrVSJ56AyphDmq
	0YqaMjk3gwqvlElcLOGMWR+1UY8kaTF5xou+GGXD6a3i8hkL3bTXhIhR5dleOVZTkEOeE0T2DOic2
	cEGReh8k1MvtqxFrAfueCONuJ8vh5dUPbseN7lsjD3sv64FdKaA+FnIb5F3UAwCvsNChdRnhCy/0I
	+SiJnppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lEF-0000000GOPD-1gIQ
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 17:37:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lE7-0000000GOML-1aQ1
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 17:37:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448AiLEI006645;
	Wed, 8 May 2024 17:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=tlHSrKHW/bkhBx4e3jrASEpXIdGjrGwuavKa/JJWfVU=; b=Ab
	2EFthF4IGVAhes3dhGyv74i2It7d/kJhdlB8beq34TX/I6JA22Y/sdZWFLdRG88v
	wQK5syp2NWYlKPl+2mh2ovwTnvyjxL1Clrp23tB42CrucCh0xm8MAwGegG8WBPYm
	isnAwh4k3BaicERPb2ceI7LG3qIFV34dPjshA0LCoe7GKt+s2tkapx5Tpq/RvAS0
	EKh5yyGlzJinesYyATkWGh39FllCiGk7RvqTI9UIUQM84ZpZtBwlFVus4mGDoawL
	knZkUeVE4qf/Dt0rkASfoP4y5M8iUol5cl56NA1SWtocZpTZIbZiKdoO9CWvKuML
	ObZRb9tbNgTuQkb5/OEg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wfryuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 17:37:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448Hb66r009051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 17:37:06 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 May 2024 10:37:06 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V5 0/6] bug fixes and enhancements to 6 GHz band support
Date: Wed, 8 May 2024 10:36:49 -0700
Message-ID: <20240508173655.22191-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JlN_jJU3zWklfUd22Uv0z6FCGn22KauT
X-Proofpoint-ORIG-GUID: JlN_jJU3zWklfUd22Uv0z6FCGn22KauT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_103712_014899_6102A215 
X-CRM114-Status: GOOD (  10.36  )
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

In 6 GHz band, add support for
1. channel 2.
2. Fix packet drop issues.
3. AMPDU aggregation
4. SMPS configuration

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

changes in v5:
 - update commit desscription in patch 5/6
 - rebase

changes in V4:
 - add back missed changes between V2 and V3 - details below
 - add acked-by tag for patches 1/6, 2/6, 3/6, 4/6
 - add back missed tested-by tags per patch in V3
 - Add back missed patch portion to handle disabling SMPS
   configuration in 6GHz for WCN7850 in 6 GHz band in 6/6.
 - capitilize smps to SMPS in patch 5/6

changes in v3:
 - address review comments for fixing ath12k-check issues.

changes in v2:
 - Disable smps for WCN7850 after review comment from Boachen
 - Added Tested-on tag for WCN7850

Pradeep Kumar Chitrapu (6):
  wifi: ath12k: add channel 2 into 6 GHz channel list
  wifi: ath12k: Correct 6 GHz frequency value in rx status
  wifi: ath12k: fix survey dump collection in 6 GHz
  wifi: ath12k: add 6 GHz params in peer assoc command
  wifi: ath12k: refactor SMPS configuration
  wifi: ath12k: support SMPS configuration for 6 GHz

 drivers/net/wireless/ath/ath12k/core.h  |   2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c |   9 +-
 drivers/net/wireless/ath/ath12k/hw.c    |   3 +
 drivers/net/wireless/ath/ath12k/hw.h    |   1 +
 drivers/net/wireless/ath/ath12k/mac.c   | 122 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.c   |  10 +-
 6 files changed, 122 insertions(+), 25 deletions(-)


base-commit: 69b8a1a48efe2f1d921336cf00dc70db68873550
-- 
2.17.1


