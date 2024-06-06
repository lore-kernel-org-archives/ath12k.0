Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A08C25B76
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 02:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xo+dRSSiGx6tb5CUOHQoXBNXcFbOU3SmB+4PVbM3LxM=; b=PRV16AGUPCEgxx1sH4tORJudyt
	d+c/6ShEQKH7hXwRTe95gwreS/gTsRl5yCBhHFD2er0aJrjoa8mmrz8qFtRQ263dsFkpzLa7BmP6p
	2+TSKED3h5ER1lit1S13BKcNW+DUUUE7fEUAbqL6zHsGYgctRvr2lKKu2XXpS0DoBERckXmYG4r1V
	WVJQgGE1MVKpibTCeMIseRH5JxkU7OMj8Y2dV+tla2WM1BLjN3jqUgl9JSEWqeLtE/AR41Oe+/KMA
	c3Z1Ik98onCr4E7fm3mv7zGW5aPwq0lsE0K8j0QcoqJuyBrcarduAjQjgRK6BNWcvifycVITThNCZ
	KeBiqYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF2X4-000000086h8-0SSL
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 02:07:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF2X0-000000086eJ-1OCr
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 02:07:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455KxBkw007623;
	Thu, 6 Jun 2024 02:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xo+dRSSiGx6tb5CUOHQoXBNXcFbOU3SmB+4PVbM3LxM=; b=OVmlhUwr1uGnt+Zc
	G8xjaoEboOVNqm/rRoc42NgR0JvBCltuIHcxmnNyxmSM+3/q8fqh6J7Ex6yOERhC
	/rcykBgp3zav6SOgckd7T+mffg/4v9xgYnmddrgbZgadRcSEbvBUNMd9/HMLwGj5
	mZpvCVlyEshvwynHm3RH6JSLMP0gMlMyngJiONDCoVjtUn4qGkzeNJ5fTtBH/HV5
	RjY+LLMQSbdwPfsyRddce6sBi3dKHRvJwVo/+XE82qdZtNymtQs+k5ZAXDzuKC3s
	c/0LvrdNHmiLFVA8709oJ4umkqDkotfPnqX/3GG7DeDOfFA+To4PfxOjFW+au4+7
	uEt6rg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj7urbqyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 02:07:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456276El021585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 02:07:06 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 19:07:05 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <quic_bqiang@quicinc.com>
Subject: [PATCH 1/2] wifi: cfg80211: fix typo in cfg80211_calculate_bitrate_he()
Date: Thu, 6 Jun 2024 10:06:52 +0800
Message-ID: <20240606020653.33205-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606020653.33205-1-quic_bqiang@quicinc.com>
References: <20240606020653.33205-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8HLEKbboUkjMg-WfA2Wv0ZCOFRRUR7q0
X-Proofpoint-GUID: 8HLEKbboUkjMg-WfA2Wv0ZCOFRRUR7q0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_08,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=959
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406060014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_190710_530456_37468907 
X-CRM114-Status: GOOD (  12.03  )
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

rates_996 is mistakenly written as rates_969, fix it.

Fixes: c4cbaf7973a7 ("cfg80211: Add support for HE")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 net/wireless/util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/wireless/util.c b/net/wireless/util.c
index 2bde8a354631..39e19e2386b7 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -1504,7 +1504,7 @@ static u32 cfg80211_calculate_bitrate_he(struct rate_info *rate)
 		  5120, /*  0.833333... */
 	};
 	u32 rates_160M[3] = { 960777777, 907400000, 816666666 };
-	u32 rates_969[3] =  { 480388888, 453700000, 408333333 };
+	u32 rates_996[3] =  { 480388888, 453700000, 408333333 };
 	u32 rates_484[3] =  { 229411111, 216666666, 195000000 };
 	u32 rates_242[3] =  { 114711111, 108333333,  97500000 };
 	u32 rates_106[3] =  {  40000000,  37777777,  34000000 };
@@ -1529,7 +1529,7 @@ static u32 cfg80211_calculate_bitrate_he(struct rate_info *rate)
 	else if (rate->bw == RATE_INFO_BW_80 ||
 		 (rate->bw == RATE_INFO_BW_HE_RU &&
 		  rate->he_ru_alloc == NL80211_RATE_INFO_HE_RU_ALLOC_996))
-		result = rates_969[rate->he_gi];
+		result = rates_996[rate->he_gi];
 	else if (rate->bw == RATE_INFO_BW_40 ||
 		 (rate->bw == RATE_INFO_BW_HE_RU &&
 		  rate->he_ru_alloc == NL80211_RATE_INFO_HE_RU_ALLOC_484))
-- 
2.25.1


