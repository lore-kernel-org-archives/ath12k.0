Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3E8C3600B
	for <ath12k@archiver.kernel.org>; Thu, 27 Mar 2025 05:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QUhOskaIDEpl/zvby6m6AWuEZxqSqFGZdP9G1J0Rm1s=; b=LIjnJ5ie5A2VubmMs8UqBiCcqE
	QZkP9bYi0DaJmf//I+PJNIs4vzmSZC3wkyJhKQsKHVcpDQ6YTrWTPJPPQmZFZt1+ZPKqUxFDlFGGB
	UBioJ+QwSdUs+dXE+K7726QEF+yC36dYaPqDGleIU58fjp/tTUXgp+K/FV4t3rzAPpJPM8sW/ZbdG
	u2dIYO5G4m2dPh1BRipO0GsAK7h6aw09YkFzPaZFU94liBzuSOhwJtS4yIIsOgGcInSnFfcE33/GX
	4j8tRUB5joYrdzVWhjR9DG2QSjc6IW/enHM4MrtKmHaSJLVb1SDEvLE8Ly8fehUq/dGIHv7g9E4bx
	VWQ9GiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZX-0000000ACkH-3mvU
	for ath12k@archiver.kernel.org;
	Thu, 27 Mar 2025 05:14:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZW-0000000ACjS-1feJ
	for ath12k@bombadil.infradead.org;
	Thu, 27 Mar 2025 05:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QUhOskaIDEpl/zvby6m6AWuEZxqSqFGZdP9G1J0Rm1s=; b=DMDkcwZmEjLzt0bcBreIUHlbU3
	+9AqTs3CPufZ0JwZSCWCo0N0TD6DtmIsWhjnuRNQNkc1bv6r+YZvMxF3IvloxdezlgO/zvcynG6Xn
	U84a+NmnjpSMHpKY8AqG1bawzxYf/5NUd5QM/iW4NNiyb2NJhpAxS5hRlc3ee1/lIx9pS4md0wY9m
	7x652qYFGFfUoNX2aFj4sKzsLKXgd+frtQ1KcaMV94N+J5Kwf1rX1y4LP2RwYrQZOppoIYehCSdcO
	GxguhsfPwFN+rPQ0bXdMpA6XvZypf+F10wMNc+0CXd+RSbWGteB5ic1EHmCMcozaINe8cn1zoKDEv
	Eh2NCgDA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZS-00000005uxF-36Rn
	for ath12k@lists.infradead.org;
	Thu, 27 Mar 2025 05:14:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R4VUV9026118;
	Thu, 27 Mar 2025 05:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QUhOskaIDEpl/zvby6m6AW
	uEZxqSqFGZdP9G1J0Rm1s=; b=bzSswRd5Z6ncGLcN5MTs0dYJsiHGe9xof6Zo3m
	DEaoc1G25irXtqgUmcaJNVlsA3R/pFul6tyTaoUXWSKFBQ7y+ng5VC/MERnh+XGC
	UynHREEy8Si/n009xi3folhgnBMX7zR8opyCIKcrtyk9+8NdyBd/feMQHaxSWXTK
	s4pqMzosMDekuy3Ohsdjw3gkHNF4nDpo4ObSXbfDGR9pYgEPZT4NoC317+LbIrvT
	JA2BZmAg9FTTMzn99dNXenM4ygDyebipYq/v3S4hmb8u4fndTmxxKfijuE1ASsv6
	yjRz3W/e1hNjP6OROQLR1A+Db/+DuEfzuR3BGPp3TqkpzpCA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdvyue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:14:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R5EKgv024338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:14:20 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Mar 2025 22:13:50 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH wireless-next v5 0/4] wifi: cfg80211: update EML capabilities of an ML Station
Date: Thu, 27 Mar 2025 10:43:16 +0530
Message-ID: <20250327051320.3253783-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oCkAVn-efcgrr9SFrKXZIplwMTnUlbYK
X-Proofpoint-GUID: oCkAVn-efcgrr9SFrKXZIplwMTnUlbYK
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e4dead cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=8LewXQ0cgpWvfN4UeSQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=996 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_051427_187022_9DEE8279 
X-CRM114-Status: GOOD (  10.38  )
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

When EMLSR is enabled for an ML association, the EML capabilities
advertised by the ML Station needs to be updated to drivers in order to
trigger EMLSR operation.
Add support to fetch EML capabilities advertised by ML station and
cache it in ieee80211_sta data structure so that drivers can use them
whenever required.

*v5:
  - Restricted eml_capability change, if STA is already in
    ASSOCIATED state only for ML STA associated to AP interface.
*v4:
  - Fixed checkpatch warnings for line length exceeding 80 columns
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
 net/wireless/nl80211.c                | 17 ++++++
 8 files changed, 124 insertions(+), 2 deletions(-)


base-commit: 1794d7ab34d2221ac7eb921b171e75b856e10561
-- 
2.34.1


