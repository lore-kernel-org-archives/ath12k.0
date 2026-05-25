Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE0ACD5BD0
	for <ath12k@archiver.kernel.org>; Mon, 25 May 2026 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F4PjlBgTJ4J8WS/jI+iugHRwYZi7DDg+KmKYY0s7w9k=; b=1iZHBN7Xjeqf4sS48oPsfJ0p+G
	CG1ZXefHgZ2C2sSb5YlGHkKrJzqHUwbKDRsz2YimhjpBRBN1hxYWaTeWtJr9VwHUJtHryKig0r9gZ
	Xf3zLn3gNXrz0TNlCPHpymvwVBdD9rtJIc1eA0nf4ye3G+9fQ1yazBD1RkFcXboYZVWVe0Hc411wV
	ta8x4RxUoUCNK9+CZs8Ss2fQE1/G+SYhAO7J2M9XLkEkgJ4m9yZM9Afs7qLzXN9gkMw/k3Uh1k/3J
	fYgJeM+tZvbOL1aNtKJIaMh14uxXbBWEPy9eo1jSdYIcmwtPX74cZiCHItTZGW1b0vuabQIzbO5RR
	pZ0r+0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTC9-0000000H1y7-3Tne;
	Mon, 25 May 2026 11:10:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTC7-0000000H1x4-0mu8
	for ath12k@lists.infradead.org;
	Mon, 25 May 2026 11:10:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6pw13388786;
	Mon, 25 May 2026 11:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F4PjlBgTJ4J8WS/jI+iugHRwYZi7DDg+KmK
	YY0s7w9k=; b=jVftKGaCdmDjokJeSJW4WGiYVmL/QQ784dEIcrZJPzWDaUsA0Af
	ZCqLybXFHxALR2z7iViOVrlzDPE8H4z7C2+MD9TpvmBh4UJ+VbiWVXfkNQxBehzk
	TvUIvijWzppOmoMOPUKk9nASCDYq1kZXJRADcBYe7LYZAgI1a8F5wQrOVz3pQbyD
	pW39YJn/YGw9oB3kK+khETXN9vac42fdnfLXmq079xDeukqs6LxoStvML75VkhND
	Qaol2IZUOTIaWWH84AlhyMCisvshmuxMuEWsf8WkKUsWa9FwuUCegv1lLSr0JGzG
	jLB+vam4zMbbv5G0JE77VvcdDct4vbEIjqw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3eb6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:10:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64PB9vCO025757;
	Mon, 25 May 2026 11:09:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4eb5ajfbx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:09:57 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64PB9vaD025752;
	Mon, 25 May 2026 11:09:57 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-tamizhr-blr.qualcomm.com [10.190.110.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64PB9v81025751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 11:09:57 +0000 (GMT)
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 380741)
	id A81EF4195D; Mon, 25 May 2026 16:39:56 +0530 (+0530)
From: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Subject: [PATCH ath-next 0/6] wifi: ath12k: Add driver support for WDS mode
Date: Mon, 25 May 2026 16:39:36 +0530
Message-Id: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: rC1xd4wveoyZXwIz6NMKUf1Av2ldIlnk
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a142e09 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=gUSijwvDI9inCNw2KXAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNCBTYWx0ZWRfX/JzvOJ1xyUBL
 6DYG8kHXP508/q4z3kB6QmvzowKUH4M9iDDd0JJW4LqESsvf4oYzQQlZrn7u47zmVgEbyWL8v1E
 Ihw3YkLOTUeHBOeeks+YWQ1bXsri4JDMJ4YdZzGh8jCPiV6n3gnG1R4HLZJlczRfVJNGmDSHxoW
 QO+olY2XJvSGwXqcMotz9zVB4GsFXxAHC7MZOOmuENwdGhkcY7yODvvXMB3dIT0KW6rOC3WIExF
 Q1ECcU9m+kP/ImKRghBerqCz4YT8UeD8vt5aL7MIQZEMnnL3LsQIS67USVSTapKg56JnkApR1sa
 2HlF4Y6hUri6NuQdfgBySmfjFr+D8g/WtgZpZsdaFu+BjiEwytzxmZVxE034iE602e9QIiDMRmu
 TGA+bH0n64ZUnCmK4jZyYk4do60LVLf0TBm/4UZTKWQHx5V1M8ZYztTMW88oswueCDojaLDYpOt
 p2xjURaIuyfv0glAYjA==
X-Proofpoint-GUID: rC1xd4wveoyZXwIz6NMKUf1Av2ldIlnk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041003_233315_D421977B 
X-CRM114-Status: GOOD (  11.08  )
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

This patch series introduces support for WDS in the driver by adding
below changes

Handling of 4-address frame formats required for WDS operation.
Proper setting of peer 4-address WMI param to ensure correct transmission
and reception of multicast and unicast frames in WDS mode.
Conversion of eth offload Rx frame to 802.11 frame for mac80211 to
detect 4address frame and initiate AP_VLAN creation.

Tamizh Chelvam Raja (6):
  wifi: ath12k: Set WDS vdev parameter for 4-address station interface
  wifi: ath12k: Add support for 4-address mode
  wifi: ath12k: Add 4-address mode support for eth offload
  wifi: ath12k: Add support for 4-address NULL frame handling
  wifi: ath12k: Add support for 4-address frame notification
  wifi: ath12k: Handle 4-address EAPOL frames from WBM error path

 drivers/net/wireless/ath/ath12k/core.h        |   9 ++
 drivers/net/wireless/ath/ath12k/dp_peer.h     |   2 +
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h       |   3 +-
 drivers/net/wireless/ath/ath12k/hal.h         |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 124 +++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h         |   3 +
 drivers/net/wireless/ath/ath12k/peer.c        |  11 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  91 +++++++++++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  41 +++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   4 +-
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  16 +++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  16 +++
 .../net/wireless/ath/ath12k/wifi7/hal_tx.c    |   4 +-
 .../net/wireless/ath/ath12k/wifi7/hal_tx.h    |   1 +
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  16 +++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  18 ++-
 drivers/net/wireless/ath/ath12k/wmi.c         |  47 ++++++-
 drivers/net/wireless/ath/ath12k/wmi.h         |  17 +++
 19 files changed, 409 insertions(+), 28 deletions(-)


base-commit: 30d516006fa1f72f957c18c6171f5680dcdebfb0
-- 
2.34.1


