Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C544DE77188
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 02:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8otaTl0U/ZIKMasoSrJbVSbaf8HrDo52XmKdvbIdWGQ=; b=KLELPWdbCosXYEFMt8Wf9FRIjG
	8Cy9tOG7vFDjynfQgbAjPiioO8cOwHbRUP4s2AV+fk7mhhbIa6lZW8QbRJLqtBapRbxpeDQnYBMqn
	a6ZSeRUtpO2Jpe/fU4HyF1gmoi77o6iSLtsQe/H8x+e5L53Ac3yWF3VXLzIQ7C7QqTtZHVURG5vep
	OyzCJ6BY6KnUl+JYP9/taQ1xPyYAPY+CFyvGhrRJnfGt3sDET2UUmB7qmgRubdS52MYRHGfYsocZm
	Sd/9KWG96QtAzIfVoECdMrZf4IHHr7gk558B5b1rrNF5LTe1S+6EDlsb3Gd5K+4LiXTkr4KZM+Axh
	fLkjgmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUz3K-00000003B8V-2May
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 02:10:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUz3F-00000003B7O-0bdd
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 02:10:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506HwVWF005569;
	Tue, 7 Jan 2025 02:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8otaTl0U/ZIKMasoSrJbVS
	baf8HrDo52XmKdvbIdWGQ=; b=k7Nbfjs9jbu0yo9Vp9muvk8+vTeqRwt1RADLfu
	CwDHVeqm8GKP5ORQ2YxPdRVzaE2yYRwLpePjhj9ML+plqY+OngrwCBz3sNBKMWRT
	vexXFI8wVck6D4Ly2nvK2PLoTsQcjAS85GX/KaSl0f0I9oCnRUF5JYKMZWaQVkVq
	bcV8UOxJs8HQy1rmQ4HiaIiaAltFWsLtPFLhhFU4OgOD/ydRDNoxSVxqmu7cUBJi
	XVpxH1PTYek9VBWXGpCVIUjAdBxvXpG/bfew9wurMWbSLL4gw9rmNLcrz+82S6ZR
	Y9gnTMtRP9vCscDb0cHpal7dGNBK0C4p2isUOZaM7nuAIdXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440m20rvyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 02:10:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5072AXoC024017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 02:10:33 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 6 Jan 2025 18:10:31 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/7] wifi: ath12k: Add monitor interface support on QCN9274
Date: Tue, 7 Jan 2025 07:40:10 +0530
Message-ID: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DwNLvapm8x9wsLUHHwCf9LyPCpJqWdEf
X-Proofpoint-GUID: DwNLvapm8x9wsLUHHwCf9LyPCpJqWdEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=783 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501070013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_181037_302270_97CE689A 
X-CRM114-Status: UNSURE (   9.47  )
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

Currently, monitor interface not supported. Therefore, add the missed TLV
tags parsing in the monitor parser, configure the monitor vdev state
identifier with HTT filter setup.

Depends-On:
	[PATCH v3 0/3] wifi: ath12k: Refactor monitor Rx handler
	https://lore.kernel.org/all/20241224143613.164921-1-quic_periyasa@quicinc.com/

	[PATCH v2 00/14] wifi: ath12k: Enable monitor ring for updating station dump in QCN9274
	https://lore.kernel.org/all/20241223060132.3506372-1-quic_ppranees@quicinc.com/

	[PATCH v2 00/10] wifi: ath12k: Add peer extended Rx statistics debugfs support
	https://lore.kernel.org/all/20241224161442.263729-1-quic_periyasa@quicinc.com/

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

 drivers/net/wireless/ath/ath12k/core.c   |   7 +-
 drivers/net/wireless/ath/ath12k/core.h   |  20 +-
 drivers/net/wireless/ath/ath12k/dp.h     |   4 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c | 364 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_mon.h |   5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |   7 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   4 +-
 drivers/net/wireless/ath/ath12k/hal_rx.h |  17 +-
 drivers/net/wireless/ath/ath12k/hw.c     |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c    |  76 +++--
 drivers/net/wireless/ath/ath12k/wmi.c    |  38 +--
 drivers/net/wireless/ath/ath12k/wmi.h    |  20 +-
 12 files changed, 439 insertions(+), 127 deletions(-)


base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
prerequisite-patch-id: 5f5721a4c9f1c26659fd8f09a8eda648d8ecccf5
prerequisite-patch-id: 59cc2121e734e4e1e7e461a3ae24f3f1f9d0fa02
prerequisite-patch-id: fdc512e43ea7cb6c097ba4c0d9c661a74c0c2a6f
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
prerequisite-patch-id: eab7d17c9891dd9a1c6152d8e180b72a08980956
prerequisite-patch-id: 12367e8ecdccf254c41bd0518cea6877e4673bb3
prerequisite-patch-id: d94f4a9c9b0b3bdc9e709efcae0cba4983bf440f
prerequisite-patch-id: 8c9df1e16a25c3b9a3fb709ba9bc8d37e6f14a5e
prerequisite-patch-id: 35a364a01fcf09cff2d3c7a7630465e4977b5c06
-- 
2.34.1


