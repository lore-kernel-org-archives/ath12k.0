Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3209CC282D1
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 06:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XMJN+LxCQBPdoSbc8uMdhX4SF0lcfi7KfNT4z8CnZm0=; b=SZgcqd8Guju8ewwg4nUws4jrNq
	yxeC5R9CZ6XP0pIAoVkQh4wRWJ//3eBpl+Jt2HXu+3kh05lEBx7WfBpFM3wkWX6mADk9rsLjAmg5M
	Hy0jdaKFXDEXMOVEGOEI2MGRA3BHDmQwEQ1CBj4q3ZD6RVnc1cQ3WQGC6hiqnNOYKRCIUha/SUiNK
	jaG1AdNzng9owRpwcMl3R2PIt1cL9iM0p2nSeCQAQFknlpKcW01yJ2c11y2/KKQKfV4dm3wOLRDjs
	+6B/R3N2lA9Du9k/jL8NEiGttO8a4oPcWS1xRy8xBLH6oO17sDk8wCYoutuY39LCz11t1MXpoeGal
	iOfOwbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4cf-0000000A6uR-3F9z
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 06:22:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4cd-0000000A6u6-0PTH
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 06:22:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525IUZkq030957;
	Thu, 6 Mar 2025 06:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XMJN+LxCQBPdoSbc8uMdhX
	4SF0lcfi7KfNT4z8CnZm0=; b=WrbrWZ7De0eLRWfsqyWvcSH3mVYZlaIB7w9E9L
	JBaU8esec/ze6ybVdGp2B6Jo6XjYPignwjx3pQZCqqFzUNBlde/cCqju/WjGoQ2K
	JeNRJ2EzV62vLE7Iq/upJRU9nGii/q8bHI04gwfHheOW1xr9Di2vzkT4peP7fkj4
	2YXz/EG0NnglhKkJH9nOTGV1qfw+QpLN4iut9Tj1noZ/f0490CtYJ39/mStFyC7/
	/WdOwG4FAGniscnSEbQK2fP79ahT1ZAQyUp9g0Vdz8XsRoSHCrr9JLSiELyecOP4
	RbDGgInWrPTzK+5+YOuzqrgfHn/8pjaIDSMS9vKOwduJXnqg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456uy09jd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 06:22:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5266MHhc028488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 06:22:17 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 22:22:16 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH wireless-next v4 0/4] wifi: cfg80211: update EML capabilities of an ML Station
Date: Thu, 6 Mar 2025 11:51:53 +0530
Message-ID: <20250306062157.1185769-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Pq5pbxM3 c=1 sm=1 tr=0 ts=67c93f1a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=hCxGI5hFRZFY7DLbiS4A:9
X-Proofpoint-ORIG-GUID: oAr9v8_2vu-XJhsFgITcfhXEOo_QQtrf
X-Proofpoint-GUID: oAr9v8_2vu-XJhsFgITcfhXEOo_QQtrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=877 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_222219_240710_159CB1E6 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

When EMLSR is enabled for an ML association, the EML capabilities
advertised by the ML Station needs to be updated to drivers in order to
trigger EMLSR operation.
Add support to fetch EML capabilities advertised by ML station and
cache it in ieee80211_sta data structure so that drivers can use them
whenever required.

*v4:
  - Fixed checkpatch warnings for line length exceeding 80 coloumns
  - Used unconverted values in PATCH 4/4 in print statement.

*v3:
   - Restricted eml_capability change, if STA is already in
     ASSOCIATED state
   - Added new PATCH (3/4) and defined helper functions to get
     EML delay and timeout values from eml capability
   - Used the helpers defined in PATCH 3/4 to fetch values in
     PATCH 4/4

*v2:
   - Added new flag eml_cap_present to indicate if EML attribute is
     present as part of new/set station command.

Ramasamy Kaliappan (3):
  wifi: cfg80211: Add support to get EMLSR capabilities of non-AP MLD
  wifi: mac80211: update ML STA with EML capabilities
  wifi: ath12k: update EMLSR capabilities of ML Station

Rameshkumar Sundaram (1):
  wifi: mac80211: Add helpers to fetch EMLSR delay and timeout values

 drivers/net/wireless/ath/ath12k/mac.c |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 23 ++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 include/linux/ieee80211.h             | 74 +++++++++++++++++++++++++++
 include/net/cfg80211.h                |  5 ++
 include/net/mac80211.h                |  2 +
 net/mac80211/cfg.c                    |  3 ++
 net/wireless/nl80211.c                | 16 +++++-
 8 files changed, 122 insertions(+), 3 deletions(-)


base-commit: 71f8992e34a9f358a53da6bfcd8b00226df177a2
-- 
2.34.1


