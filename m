Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F5AC27C53
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 02:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r8njuQzuaw+5+HQcC33A4VDNXTJUrFMBsi8C0gnsJlM=; b=EfLfBQUMHNLeulU6TTorgW4fOC
	hootWGNnbCUYOxlgF4+HAe6SH5U8Vk5ujGXy4CI4/wIeMSzMJtmAN2lwxhfV1nfN19s1fc/NBvYwI
	s8iar4gWAemSMN1ycuGJtPKt7oKBVVccp2LpY+8u0CJsJnx6gu43R5s1AI8kVg8xWNZQRSH82XLHr
	HaMBmIbIicSuucEpvV91IPwNgPvbLcuzgv0o05IM3xSwbizFZpFfeDiBy1btEHylwKq4S59gKT16W
	czA3RJiv6Y4EacXjGeZBA1KL6joR4mwbeMff0Ge64nicYkL9XoL/MEmbqrhDFvtF6dpJIKwb4KbNy
	jeiGyf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF2X3-000000086gk-1uwC
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 02:07:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF2Wz-000000086eI-3GYc
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 02:07:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455LVaom031023;
	Thu, 6 Jun 2024 02:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r8njuQzuaw+5+HQcC33A4V
	DNXTJUrFMBsi8C0gnsJlM=; b=LhIeqkCBMqOpMxHCKG6lZ7IsVQuGxpTky9VHbM
	9+bGfhAlfQKcYEqdiYXnBbWrTL4DMpcQ0+TvWW0hqTeCqiR8OWT6iCKvsAwGbJuw
	so+YK5NK/TQ86xgYkS+V4ScfLDzmNAtPQuYAjjjihH+GtDHY3WuHDyTCEM1D2owX
	LAO+6PhX04vvwTagc0ACg8CutSkBPkhgZgvULmAZDMcABZy/A35pPOeQtEMiRvm1
	/dEBBHRyXnHN0FJJ9bervZx18EgiWWx9A7PvKfB8HHG4pQO4deWkXW5EBRSozece
	t+fB5nsROvresnXvl3ZzzwQNRbBdDInW/yBUCtN9CHD1oTfg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rkktd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 02:07:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456274bq025307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 02:07:04 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 19:07:03 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <quic_bqiang@quicinc.com>
Subject: [PATCH 0/2] wifi: cfg80211: handle 2x996 RU allocation in cfg80211_calculate_bitrate_he()
Date: Thu, 6 Jun 2024 10:06:51 +0800
Message-ID: <20240606020653.33205-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JAMCmeMwzNHWOTPsDjn9QCISX_nsONjF
X-Proofpoint-ORIG-GUID: JAMCmeMwzNHWOTPsDjn9QCISX_nsONjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_08,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=691 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_190709_958744_DF29AB47 
X-CRM114-Status: UNSURE (   7.42  )
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

Handling of 2x996 RU allocation is missing in cfg80211_calculate_bitrate_he(), so add it.
Also fix a typo while at it.

Baochen Qiang (2):
  wifi: cfg80211: fix typo in cfg80211_calculate_bitrate_he()
  wifi: cfg80211: handle 2x996 RU allocation in
    cfg80211_calculate_bitrate_he()

 net/wireless/util.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)


base-commit: a116bf2be795eb1db75fa6a48aa85c397be001a6
-- 
2.25.1


