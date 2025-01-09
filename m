Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78110E77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B/LCTg3XJh0Wcb9c4/1xP86SlFilcykgLLR/kf90Psw=; b=3yVbfHeq8BO7EYBa3ZB/x9seik
	q2K0W+USbhmqeyL70DglrXRl+UaVbshrbkfEvsDeLcs3rajyQ1o2dK50qpVMlwxOnE5+24D3gOTrs
	thGVrayjEgJx4fnk20jbad07ZhtUzcCRPKVMQf5I9wXVzRCE1CQ/uzHUPwssKWNK+gP2xVLTtE/yw
	OARgDKl6eDzPOqRM083zh4ty8peuXNX2o/H3yauoA/krwx6FvoJ1IUdt6QgaP3/qFsSJq/PnPXXwK
	iDyJIbeUhSMJw0JWRuy7h9ywikCGS/44rcrZ8sztrtAxTZtZO9rKC8tShn4Zd/R93ygdy9bcW+uXb
	x+Fp2Q+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxbK-0000000D1rn-12mz
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 18:49:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxbH-0000000D1qb-1dw2
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 18:49:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D7h4r009940;
	Thu, 9 Jan 2025 18:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B/LCTg3XJh0Wcb9c4/1xP8
	6SlFilcykgLLR/kf90Psw=; b=jo1uDb2BxpmD/SfNUMUL6uRJPfx2OpMEScrzn4
	8w1tnti37VVf7iRkJ7yk2On24DO0Zph+094yF1qwJegiNxLn2D9jEj3T8EKRSVFr
	R98Vg7IruoNDI/+/Goj5TAoUOYjztaBzMuhecdp/MT//SPvKIO87rsy2KRaHtZ6k
	PoQnn5ghP+vD2kMUeGVPhuQKbbP41g9qqrshpF4AxazaqOHFFxygUwffqg4zW00j
	UwDQWAabHaSTHM0Hayi4wtVrpwIKGiM5fQw/0dRlacz/pvqg6jpR2ZPGVdfnt9CI
	BDUL1+8mDvc3oRx6ITE9xCuRj7wm10MLqXYwCyXGc+ux4lkg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2krtkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 18:49:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509Ini5C025318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 18:49:45 GMT
Received: from hu-bmahalin-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 10:49:44 -0800
From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bmahalin@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Add support for MLO Multicast Handling
Date: Thu, 9 Jan 2025 10:49:30 -0800
Message-ID: <20250109184932.1593157-1-quic_bmahalin@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2EzUZTYD1qhgcpm_OZj6S1rfQp4oKk0I
X-Proofpoint-ORIG-GUID: 2EzUZTYD1qhgcpm_OZj6S1rfQp4oKk0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=774 clxscore=1011 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_104947_440567_1AB25005 
X-CRM114-Status: UNSURE (   8.81  )
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

Patch 1 updates the HTT TCL metadata version to use the new bit definitions
	of the field to pass additional information from Host to Firmware.

Patch 2 moves the MLO Multicast frame duplication logic to the driver to
	have more flexibility to update the HTT TCL metadata with the global
	sequence and with a special vdev id to indicate Multicast handling

Note: ath12k-check verified and it lists one exception for length.
      Exception has been fixed separately.

Balamurugan Mahalingam (2):
  wifi: ath12k: Update HTT_TCL_METADATA version and bit mask definitions
  wifi: ath12k: Add support for MLO Multicast handling in driver

 drivers/net/wireless/ath/ath12k/core.h  |  3 +-
 drivers/net/wireless/ath/ath12k/dp.h    | 27 +++++--
 drivers/net/wireless/ath/ath12k/dp_tx.c | 27 +++++--
 drivers/net/wireless/ath/ath12k/dp_tx.h |  4 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 94 +++++++++++++++++++++++--
 5 files changed, 135 insertions(+), 20 deletions(-)


base-commit: dbe50a7420e22954c747e79e72df2750d795ea77
-- 
2.34.1


