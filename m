Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54573C02181
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SqiTWOskZbsEZ8QHQTA1VE9PhEQn4j1Muoz+orz0waY=; b=cx181BOw0mN6DhGQCd8HpyOwHA
	S+acqrqyZSctbHTIdz1iSJZN631TmWdFxLCph02SL45Lk81tqq5mhj4YBP5RM3C/uu9PSpJPRKNzQ
	Oz0GmKLwMmGPCRTiLI5fNa5qIirk+2u528fjMKt8MyU3qkwTa5ji0Hv9PfcSDv6LUyc3KBwk675dC
	AosKO1Mft8qcVIZqEgLLeKczD7WeSEiPojmGKbRmfRYKMi73/qkrHmCdOcdVrrqrAvhALVMTavow6
	bepzaFgWD9WSu3ZC3YCzatet9+86aoAQOBKdx1agTqpXhm3vijQMOBNygPIgpRG+t8LsY3UR+barR
	X6AQcrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taau2-0000000AIm3-0PFb
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 13:36:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taasz-0000000AIeR-1lUV
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 13:35:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MB7xZb001072;
	Wed, 22 Jan 2025 13:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SqiTWOskZbsEZ8QHQTA1VE
	9PhEQn4j1Muoz+orz0waY=; b=Rw1MsWcQ+vQZXp8tJenWA/zLLxbLX1yoCuSlbv
	ZYqwDnNIWQEan9TCSC34QTe1zwllz3vF0RwTfQ+oztVFQreFj9ijyaAK0sSut2wJ
	kj6JasyzPlNRkkSsCnitXLq9433venw2ATSwbXWzB3wQ9aX0HypLfjqemd2Hzcd4
	UNjSvn7VglPAqBM0BcizitBRCwy5yYog/GrGaum05FddoUhrYDJ/dM8rgm8kKFfL
	GmVHzE+kGnTP9Pa699FiuzS3fdHdTsurpiY4ZDDPOv9BFfEBQBw27gyR76Uq/UMK
	xEfbSAlN0aDZBRluAXKDsirKEh18zl3Yg9vhz4mcjTkY5XNw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ayhcra9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 13:35:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MDZBn5012180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 13:35:11 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 05:35:09 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH RFC 0/3] wifi: mac80211/ath12k: add support to fill link statistics of multi-link station
Date: Wed, 22 Jan 2025 19:04:21 +0530
Message-ID: <20250122133424.1226555-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ae8d90gSuJMGu4dDpkc0KIdxUfsd1DCm
X-Proofpoint-ORIG-GUID: Ae8d90gSuJMGu4dDpkc0KIdxUfsd1DCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=626 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_053513_483690_5E623459 
X-CRM114-Status: UNSURE (   7.80  )
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

Currently, station statistics are filled at deflink for both non-ML and
multi-link(ML) station.

Hence, add support to fill station statistics for the corresponding
link of station.

Depends-On: [RFC,v2,00/12] wifi: cfg80211/mac80211: add support to
            handle per link statistics of multi-link station
Link: https://patchwork.kernel.org/project/linux-wireless/cover/20250117124554.3719808-1-quic_sarishar@quicinc.com/

Depends-On: [v10,0/3] wifi: ath12k: report station mode stats
Link: https://patchwork.kernel.org/project/linux-wireless/cover/20250115063537.35797-1-quic_lingbok@quicinc.com/

Sarika Sharma (3):
  wifi: mac80211: correct RX stats packet increment for multi-link
  wifi: ath12k: add link support for multi-link in arsta
  wifi: ath12k: add EHT support for TX rate

 drivers/net/wireless/ath/ath12k/dp_mon.c | 25 +++++++++++++++-------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 21 ++++++++++++++----
 drivers/net/wireless/ath/ath12k/peer.h   | 27 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  3 ++-
 net/mac80211/rx.c                        | 15 +++++++++++--
 5 files changed, 75 insertions(+), 16 deletions(-)


base-commit: e7ef944b3e2c31b608800925e784f67596375770
-- 
2.34.1


