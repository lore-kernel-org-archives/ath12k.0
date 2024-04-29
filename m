Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31D5C19F53
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 17:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDslRiKG30+N4HJXGjof7AUIBxgayl4YlcmyzHS+1YM=; b=N5pKWmyucjTyaVIx6n8vjqmyPG
	exyWnDYY4DcC7WbzK3Q/xse0BWoQqLQb1BHbavb9Mk/wQomBNOmlk5e7Ext9kDZtPiMbpS7tRUv5K
	a9Jww8X4UcwgeeX/HeCZoSHmmCQroyYnNRfSJRbarIloKOmB653huZB+3qLVljCkvj4WrZAAknslx
	lE+TD1uM5jCBM7/yT/ytR7mc1k3Em126xcnQMfYDX+jmJsiK7V4Xy9UfjUgTQ9vX/CFpWlvRg85z0
	7178kAfZ3oS9Mc9dVYxNCyaf6sre+AjoMJve3rXdDvM4uXRJeG8w7YsNbRDCRAOiEv5ePDLcbxy3g
	bwhSkXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Uxb-00000003kmI-1I8j
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 17:38:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1UxW-00000003kjg-2gJb
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 17:38:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43THOj4F009535;
	Mon, 29 Apr 2024 17:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=zDslRiKG30+N4HJXGjof
	7AUIBxgayl4YlcmyzHS+1YM=; b=nDOxaLnjrkGmlYT2aX+zSPvCUQ+clBre3Mk6
	cOLD5zHmLoD4qZbdBUOp/HA44fVmX4AeHISHCHl7XK0Ag8K5boCIRNr+1QTOLDsg
	CCFtpkU0jEk82GJWJAIJ5O7SANoJ6Y8Lq6+9V7ZD0fnx8GckcpbPplSpdUJjOd9h
	cdZZqtzTiTF6PxSA11OQvsGsd6JsX13JO/GI1cRUNT27EQo72/dn65aKF+euYem7
	r34Nc5/IfoBI/qZNse9Vpytuvq2kOMCiyz5wjkRp/hwGR0KjFQ3smfk/eqyDN3DX
	4JUiYOnEG8KfuaBTekXOGw7JQ/sYmx+sTu20zrlqVLYCui/gHQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xt5xkaym5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 17:38:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 43THcR8C032224;
	Mon, 29 Apr 2024 17:38:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3xrtekh4xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 17:38:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43THcRlu032195;
	Mon, 29 Apr 2024 17:38:27 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 43THcRTH032184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 17:38:27 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id 493874111F; Mon, 29 Apr 2024 23:08:26 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: Add support to enable debugfs_htt_stats
Date: Mon, 29 Apr 2024 23:08:21 +0530
Message-Id: <20240429173825.2369355-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GW0b4pYCtKr_bESMSqCl4dNJzRd_UlTu
X-Proofpoint-GUID: GW0b4pYCtKr_bESMSqCl4dNJzRd_UlTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_15,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=899
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_103834_885521_513C39DB 
X-CRM114-Status: GOOD (  10.25  )
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

Bring in the basic infrastructure necessary for enabling htt_stats via debugfs.
Patch series bring support to request stats type to firmware,
dump the stats and request to reset the stats from firmware.

Schema with one ath12k device:

ath12k
`-- pci-0000:06:00.0
    |-- mac0
        `-- htt_stats
        |-- htt_stats_type
        |-- htt_stats_reset

Dinesh Karthikeyan (3):
  wifi: ath12k: Add support to enable debugfs_htt_stats
  wifi: ath12k: Add htt_stats_dump file ops support
  wifi: ath12k: Add support to parse requested stats_type

Ramya Gnanasekar (1):
  wifi: ath12k: Dump additional Tx PDEV HTT stats

 drivers/net/wireless/ath/ath12k/Makefile      |   2 +-
 drivers/net/wireless/ath/ath12k/core.h        |  11 +
 drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 713 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 300 ++++++++
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h       |   4 +
 7 files changed, 1038 insertions(+), 5 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h


base-commit: 326f8f68f28b0b831233acfabffb486a5b0f4717
-- 
2.34.1

