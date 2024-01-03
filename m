Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E49C3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 06:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bTlnlk7P/RJFrzfh3ecH2z9RKBFwJwFi7etU3pSJkrQ=; b=BRj3jts0OaImb11TvSoXeyM8p6
	ZWsA0/w8IiFpB4SA7+1TzVzaypKrYX0myWL9135MDv7K30dkjgTfiTutsLGgwZm1RIbB25l1oR/uX
	I5RYS3RxTZ07/2wH+WIyFmbkMyxglKy39QS3fu0EiqSZrx9OEk6gsKHHF+68qCcsEEOMXmd6CZNa0
	AE+YgHujp0cbnfes0aKWyuwLVUz0lYUNNWGhyT0J2ALLAG/qvp1QAfstWtbFdwmuSpjh3kkFH9leT
	SCxTq6wtKq9RvY+SMLE+5SqeNhMKfjcI494Rt5wZMhMHgp55yLKqQGqk7toSHkwApEY+MN6nx4V8o
	Thc7EVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKusz-009uE7-2R
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 06:37:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKusx-009uDO-2N
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 06:37:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4034Zh1F026011;
	Wed, 3 Jan 2024 06:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=bTlnlk7
	P/RJFrzfh3ecH2z9RKBFwJwFi7etU3pSJkrQ=; b=CqeIrfgw1wdijy7ylbQ2sP2
	ClxCy7/9z5ahRPoN3rvK/gqEN+TAAB7DZ68Mp6lPghoQs4i6ZkueBrNr8SG08Xmw
	L6f05Uwj+2iBB7hnOb32TX4WY/y3f3y4zU1twcKyDg+ohsT2AUbf2sxh/OWyKobD
	vIP5UG9gtpSOpTREMlDnT5jQ3IKKe3qu9x5BKvoT4IL2ADY2sgCdBszog7Djz1Ie
	schrAMgwVzWS/uflBnPb7YphMSWy42bgcR/+mw3BD0FQbTvxYV6kruRn6hfKfT+X
	5qjc0bkXUtmZxDdul4TbCDm9J+oDzxOL0HlWQUjXRnp6IQ68gF2A6Qq2ioM6tCw=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vcgkuab2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 06:37:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4036bmFp023428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 06:37:48 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 22:37:47 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 00/10] wifi: ath12k: Refactor mac80211 callback operation functions
Date: Wed, 3 Jan 2024 12:07:21 +0530
Message-ID: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lMq3ws7MSesYh_pVqvM-vosEh9XdI2JO
X-Proofpoint-ORIG-GUID: lMq3ws7MSesYh_pVqvM-vosEh9XdI2JO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=418
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_223751_892566_AF830B96 
X-CRM114-Status: UNSURE (   7.90  )
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

Currently, the existing mac80211 callback functions are defined assuming
each link/radio is represented by a single mac80211 hw. In order to
support multi link operation (MLO), need to move from the multi wiphy
model to a single wiphy model. However, the single wiphy model allows
multiple link/radio to be exposed by the same mac80211 hw. Therefore, we
need to separate the link/radio specific handling within the mac80211
callback operations. This way, the callback can be extended to support
multiple link/radio in the future.

			Current Multi wiphy Model

+---------------+            +---------------+            +-------------+
|  Mac80211 hw  |            | Mac80211 hw   |            |Mac80211 hw  |
|  private data |            | private data  |            |private data |
|               |            |               |            |             |
|               |            |               |            |             |
|               |            |               |            |             |
|   ar (2GHz)   |            |   ar (5GHz)   |            |  ar (6GHz)  |
|               |            |               |            |             |
|               |            |               |            |             |
|               |            |               |            |             |
+---------------+            +---------------+            +-------------+




			  Single wiphy Model

                           +--------------+
                           | Mac80211 hw  |
                           | private data |
                           |              |
                           |ath12k hw (ah)|
                           | +----------+ |
                           | |ar (2GHz) | |
                           | +----------+ |
                           | |          | |
                           | |ar (5GHz) | |
                           | +----------+ |
                           | |          | |
                           | |ar (6GHz) | |
                           | |          | |
                           | +----------+ |
                           +--------------+


Karthikeyan Periyasamy (10):
  wifi: ath12k: Refactor mac callback of config
  wifi: ath12k: Refactor mac callback of bss info changed
  wifi: ath12k: Refactor mac callback of conf tx
  wifi: ath12k: Refactor mac callback of start
  wifi: ath12k: Refactor mac callback of stop
  wifi: ath12k: Refactor mac callback of update vif offload
  wifi: ath12k: Refactor mac callback of configure filter
  wifi: ath12k: Refactor mac callback of ampdu action
  wifi: ath12k: Refactor mac callback of flush
  wifi: ath12k: Refactor start vdev delay function

 drivers/net/wireless/ath/ath12k/mac.c | 250 ++++++++++++++++++--------
 1 file changed, 173 insertions(+), 77 deletions(-)


base-commit: 2cd4e3f91f264926a6b11df948417b74d52ca9b9
-- 
2.34.1


