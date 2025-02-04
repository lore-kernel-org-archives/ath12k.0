Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809ABC02194
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VDH708nq/0zC/3U8ctx5sids7bJpkR6KcCz5QV8TIik=; b=RhI61XvQJhYCQDN5Zfd95mnvwy
	87lERbD7gcpcMhRhwvEq1wPlTBJ981LH2Jcis/JGNDjIm8X6G3E30kYMDAzsr5al25Srl4DdsCaMw
	OSnyRcsxBjyLx/b+fSAhtq5Xb0iCg5npSJzoMtC7UOl+r6LMi9dGCzdS2dUpN9lcg2/oWg/VMUzri
	vyx+L7nul2pQffZoPOVle23ZJOYxc7EUmceGxEVsCSpFvhXR4aGBP7DxFmSqus/VGwmNUcRv2Fh1Y
	xzWT6g5BI8ulzYZRB+OLAz+LlcAO9IpuLsf3yhUwH2CMTaHNYQM07wr33hWwtKj+QgUDCsT5Y0g6S
	jnKlU/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFOe-000000004Bd-126N
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 09:39:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFOb-000000004B6-0GK9
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 09:39:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141Blxe021352;
	Tue, 4 Feb 2025 09:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VDH708nq/0zC/3U8ctx5si
	ds7bJpkR6KcCz5QV8TIik=; b=Nk0fdvVYAcUU4qBP31bhp5MY9X/sERNFJxzBNL
	PWFW6UZf9ktSOom8mUvYck0zSgt7YLkkqQUpReRW/EhWrTYh04UvLvIYr5YId6dO
	Eri2Z0Ozl57EvaZ6sGpJtGTQWFXv9cwr5REo8BE/9ZXYd7zyE53D1AV32a20EdZF
	xKBdz7TCTmqDeldfqh7eaLe4cCHlKqR/WVn7iyByFS3AKZ/4XO+pAnm9id+1QTcs
	3vFCP1t44WD/mdhUax2QDLAJAI0cvfx12CmYliwEfrbYqmDEhiIoSdquqAPStu2G
	Ny4muNmP29CO7xWxByKiyY0qHivvMKiI783V+uxAYq0AmPFg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k911gypr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 09:39:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5149d2fc018238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 09:39:02 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Feb 2025 01:39:01 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v4 0/7] wifi: ath12k: Add monitor interface support on QCN9274
Date: Tue, 4 Feb 2025 15:06:49 +0530
Message-ID: <20250204093656.3682278-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UyrGVbo8lqrnvu1rPJcnkPUsmXai586I
X-Proofpoint-ORIG-GUID: UyrGVbo8lqrnvu1rPJcnkPUsmXai586I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=982
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_013905_216116_4F7ED10C 
X-CRM114-Status: UNSURE (   9.30  )
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
	[PATCH v8 0/9] wifi: ath12k: Add peer extended Rx statistics debugfs support
	https://lore.kernel.org/all/20250204035718.3227726-1-quic_periyasa@quicinc.com/

v4:
 - Rebased on ToT
 wifi: ath12k: Replace band define G with GHZ where appropriate
  - Dropped the tags due to rebase changes
v3:
 - rebased to ToT
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

 drivers/net/wireless/ath/ath12k/core.c    |   5 +
 drivers/net/wireless/ath/ath12k/core.h    |  18 +-
 drivers/net/wireless/ath/ath12k/debugfs.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp.h      |   4 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c  | 362 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_mon.h  |   5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c   |   5 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c   |   8 +-
 drivers/net/wireless/ath/ath12k/hal_rx.h  |  15 +-
 drivers/net/wireless/ath/ath12k/hw.c      |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c     |  74 +++--
 drivers/net/wireless/ath/ath12k/wmi.c     |  36 +--
 drivers/net/wireless/ath/ath12k/wmi.h     |  16 +-
 13 files changed, 435 insertions(+), 121 deletions(-)


base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
prerequisite-patch-id: e5e05751e1a2a54b5c705222ef05a5f76cbd6858
prerequisite-patch-id: f503436fb6fa4e65cbbb0b52dcb1ab41b65d6e2b
prerequisite-patch-id: 5651ab3bfa84c40524c70a55f821b6a884908de7
prerequisite-patch-id: 4b6f75cfa4d25f974f8fa61adbc85fff35a187fa
prerequisite-patch-id: 6a015b7d89f3d61adb5d60eff2d63fea10d9c3b0
prerequisite-patch-id: afba80a88de0869ade8954c32ebbec407608a1c0
prerequisite-patch-id: 12367e8ecdccf254c41bd0518cea6877e4673bb3
prerequisite-patch-id: d94f4a9c9b0b3bdc9e709efcae0cba4983bf440f
prerequisite-patch-id: d777e315103b196f906c853881ca666a0423c8f6
-- 
2.34.1


