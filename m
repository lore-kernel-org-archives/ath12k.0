Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABD0C02187
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 15:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eG5QH9yGPTX98iRAGgjbG7esMMFlsbLgulNsfSc9oiY=; b=n8FkAgpuU+zC/PxCESZce2ddOe
	eRQQgUFwY8dMpCer2jpLhVOR8WWL+AsSPzTi6G/TOeNA6x1Tr/NGiNouSr82YN9bpVKziy/EEvb8r
	cx4EKi/b+TK3n9YCXpis0HHVQHp4ZtVN9GJFUSn/S3nazQA+phLouClN8YSk8LAJjU1yvydvi17eS
	ua6wQlu2t4BR90dOGyzT2d82AVuOJCrFxOUMJgTl0l6bgk11e+Xsp3EATV7Eb9tFzASoMaLZRzeWp
	jv2Cv7zXP0oMhZ++o6D7S2QP6rSE+SPeIPdIkNMYSWW0/wYPDg4P6NSft6OtzoPtEk9aMBUZl1IAk
	NLxXCrtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZXF6-000000043KT-1GVR
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 15:29:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZXF3-000000043Jj-03h3
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 15:29:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JE2sKQ027395;
	Sun, 19 Jan 2025 15:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eG5QH9yGPTX98iRAGgjbG7
	esMMFlsbLgulNsfSc9oiY=; b=R3SK0rv98/Jas9Mtbp2IFs9dADJVDUoCN98jun
	SiF10DXSJcxjhhkvohGi6erCRh993stXZ/373bkhkdkrxsIc7NOwmKB5pmdKM57/
	KKsZGfibD99Rfgu8SBvlPOLKzTxyvR3ACkhNovgqIsyuo6/ZkPyF1mKaQSdmjmIr
	RbaihIVTieZ20aZh9cRsR2OjYs3FTxdcpNR/20JJOV4CvnVXwca6gMfpVwDLL1Yi
	kn7Vzw0Jq3c3ow3OcAwdFUmq5M095Wb0e0hXZ0GjCuGABCt/0cuSepEFN8nioZq8
	SiSL1lLdH7KVZqqSlWquFcsnNRN590Vzk336+IlzShQIoldw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4492tg82ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 15:29:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JFTYrp006873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 15:29:34 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 07:29:32 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/7] wifi: ath12k: Add monitor interface support on QCN9274
Date: Sun, 19 Jan 2025 20:59:10 +0530
Message-ID: <20250119152917.2316514-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZGBjg76FCzUJ4BFAKINYXFh23KoR79WG
X-Proofpoint-ORIG-GUID: ZGBjg76FCzUJ4BFAKINYXFh23KoR79WG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_02,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_072937_218682_25599C8E 
X-CRM114-Status: GOOD (  10.28  )
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

Currently, monitor interface not supported. Therefore, add the missed TLV
tags parsing in the monitor parser, configure the monitor vdev state
identifier with HTT filter setup.

Depends-On:
	[PATCH v2 00/14] wifi: ath12k: Enable monitor ring for updating station dump in QCN9274
	https://lore.kernel.org/all/20241223060132.3506372-1-quic_ppranees@quicinc.com/

	[PATCH v3 00/10] wifi: ath12k: Add peer extended Rx statistics debugfs support
	https://lore.kernel.org/all/20250119135751.2221902-1-quic_periyasa@quicinc.com/

v2:
 wifi: ath12k: add monitor interface support on QCN9274
  - remove redundant filter setting in ath12k_mac_monitor_start()
  - set the default filter when the htt monitor configuration get disable

Hari Chandrakanthan (1):
  wifi: ath12k: fix link valid field initialization in the monitor Rx

Karthikeyan Periyasamy (1):
  wifi: ath12k: Replace band define G with GHZ where appropriate

P Praneesh (5):
  wifi: ath12k: Add extra TLV tag parsing support in monitor Rx path
  wifi: ath12k: Avoid fetch Error bitmap and decap format from Rx TLV
  wifi: ath12k: change the status update in the monitor Rx
  wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
  wifi: ath12k: add monitor interface support on QCN9274

 drivers/net/wireless/ath/ath12k/core.c   |   5 +
 drivers/net/wireless/ath/ath12k/core.h   |  18 +-
 drivers/net/wireless/ath/ath12k/dp.h     |   4 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c | 362 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_mon.h |   5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |   7 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   8 +-
 drivers/net/wireless/ath/ath12k/hal_rx.h |  17 +-
 drivers/net/wireless/ath/ath12k/hw.c     |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c    |  74 +++--
 drivers/net/wireless/ath/ath12k/wmi.c    |  38 +--
 drivers/net/wireless/ath/ath12k/wmi.h    |  20 +-
 12 files changed, 438 insertions(+), 124 deletions(-)


base-commit: e7ef944b3e2c31b608800925e784f67596375770
prerequisite-patch-id: afb04ab90da26435239077de723d1276946a194a
prerequisite-patch-id: 1b12bea72973c14f461b8202eed9432f27932876
prerequisite-patch-id: a6719494f46b8568504be8c64255676e67b4deda
prerequisite-patch-id: 054756eb1705babff324a743e62685bb78035198
prerequisite-patch-id: 889c4a0174fac23261705a42b46e923d7e7a0a18
prerequisite-patch-id: ea0321fbd8a59c09191873f59b6aea8225f4b8e5
prerequisite-patch-id: 3c8ccb635d319f8755649e445b68feb615fd82c4
prerequisite-patch-id: d516b2a3196218f42fdf4567516a1fd2c8b4c40f
prerequisite-patch-id: a2c59b4e468384e27d934a986e5fe9a951685fd9
prerequisite-patch-id: 359fecf93ef53f39243cc1b3466ab06fbd33cc71
prerequisite-patch-id: bf0b6542c65299c0bfa7fef2da6f09dd8453c39f
prerequisite-patch-id: 1dc79cafb399be590d1e418afcc5a719ae35834f
prerequisite-patch-id: fb1e39f2dce024ff692b0e6b112dc90c6a43ad00
prerequisite-patch-id: 9ea3943ae0b6e6a5a09cb648eaa35f8087967ac3
prerequisite-patch-id: 35da9ccb2466675b50e819029c13cbda70702fc2
prerequisite-patch-id: 282cdacca7b9bbef5a94b1a78457304d38362af2
prerequisite-patch-id: 5bdb2bd29cd4c92d23708432f451e92951c23f0e
prerequisite-patch-id: 4b6f75cfa4d25f974f8fa61adbc85fff35a187fa
prerequisite-patch-id: 6a015b7d89f3d61adb5d60eff2d63fea10d9c3b0
prerequisite-patch-id: afba80a88de0869ade8954c32ebbec407608a1c0
prerequisite-patch-id: 12367e8ecdccf254c41bd0518cea6877e4673bb3
prerequisite-patch-id: d94f4a9c9b0b3bdc9e709efcae0cba4983bf440f
prerequisite-patch-id: 8c9df1e16a25c3b9a3fb709ba9bc8d37e6f14a5e
prerequisite-patch-id: 8db0be3595dc82725d9a195f3239402b9062d9f3
-- 
2.34.1


