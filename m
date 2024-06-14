Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E78C27C77
	for <ath12k@archiver.kernel.org>; Fri, 14 Jun 2024 06:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MieBab9KPLRmGPerEbO+te9E9MQWOAixT8qR/wFgPOY=; b=WGcLoeQWo6W7jfLHALZ1ddotiD
	oyUbU86ZTto/8IUFXS0Gsuo8hNy50lUbhpeJfnaTcQq5/eAkf1F7o8+tJaVwiJp/qupCB/Q+/c70P
	eWNZFRk3klyzakUPzpC2R8stWxLmNc6S515yF+YdciWIzGVaDVfKt1LMCGvePRdB/WSl9Lm986Itn
	3ZMQuQTT7ZA7U3xPThtJ+PqlRGH5K3J5aBD/xaPP8AebUvg1WJ6ljsw8rhT3AtYQ0dk3BZ7sO8enL
	AfI0l8sy1jZ1AbRDaZAXn/yWmyJWy61qb+sxpNXs1AeaQ29A9L2q/qh/lJkKs94ZNszgpojPygCJb
	XVrG3asg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI0Vw-00000001dvl-3nU0
	for ath12k@archiver.kernel.org;
	Fri, 14 Jun 2024 06:34:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI0Vt-00000001dtR-0zCb
	for ath12k@lists.infradead.org;
	Fri, 14 Jun 2024 06:34:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJH3gY002336;
	Fri, 14 Jun 2024 06:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MieBab9KPLRmGPerEbO+te9E9MQWOAixT8q
	R/wFgPOY=; b=JN2ZHJSxcqn7N+5EIyxeUYA7g74NZzAP5vHKboOnp8UWqYEt2jK
	e+yGL87klkkAlzfQTGXjUPg9GMvVPJ+f11Hn6UERikcJTPmHtSrBurlPFhZkjCM2
	PY0NhD+ZqujMg19x+zWA7AcEHrupfnLFLBIHDJKEIzIgG30YRB989WF9Encez3F8
	Iae/7wpeQoRMZHo83uBlIpM2r1ApMZeBzDFDFgrmx94OL6z2V7IGGMugi/3ie9q/
	Hr9gGL5j9Z518UuEBa1hIa+12QWknZF4FcIe59LSAJbeFeSQiCzsg1Vy7jfrMm5W
	eL1MnTTcBaudhQf645aRko8uOVIG1GIP2rA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q2s721-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 06:34:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45E6YAs8026756;
	Fri, 14 Jun 2024 06:34:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3yn1s6n076-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 06:34:10 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45E6YA8X026749;
	Fri, 14 Jun 2024 06:34:10 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45E6YAWs026746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 06:34:10 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id 712744112C; Fri, 14 Jun 2024 12:04:09 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH v5 0/4] wifi: ath12k: Add support to enable debugfs_htt_stats
Date: Fri, 14 Jun 2024 12:04:00 +0530
Message-Id: <20240614063404.2659089-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3HhfEEBcZwtqOpfGGAfYgLPFLK2W7Bqu
X-Proofpoint-GUID: 3HhfEEBcZwtqOpfGGAfYgLPFLK2W7Bqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406140043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_233417_421150_E6CC8125 
X-CRM114-Status: GOOD (  12.37  )
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
Patch series bring support to request stats type to firmware, dump the stats
and request to reset the stats from firmware.

Schema with one ath12k device:

ath12k
`-- pci-0000:06:00.0
    |-- mac0
        `-- htt_stats
        |-- htt_stats_type
        |-- htt_stats_reset

---
Depends-On: [PATCH] wifi: ath12k: Fix pdev id sent to firmware for single phy devices
Link: https://lore.kernel.org/linux-wireless/20240611043342.2672998-1-quic_rgnanase@quicinc.com/

v5:
 - Addressed Jeff comments
   - Changed sizeof type with data structure pointer.
 - Pulled out patch #3 from series.
 - Rebased on ToT

v4:
 - No changes. Re-sending due to mail issue.

v3:
 - Addressed Kalle's comments
   - Locking is taken care. ar::data_lock is used to protect stats
     request completion and other HTT debug entities protected using
     ar::conf_mutex.
   - Fixed KASAN warning from WCN7580 during stats type write.
   - Changed header style for MU PPDU stats printing routine
   - Renamed function ath12k_debugfs_htt_stats_init() to
     ath12k_debugfs_htt_stats_register()

 - Added expected length check while parsing each tag to prevent
   buffer overread.

v2:
 - Handled pdev id sent in HTT stats request command for WCN7850
   Added changes as a separate patch #3
 - Tested in WCN7850 and added Tested-on tag
 - Rebased on ToT
---

Dinesh Karthikeyan (3):
  wifi: ath12k: Add support to enable debugfs_htt_stats
  wifi: ath12k: Add htt_stats_dump file ops support
  wifi: ath12k: Add support to parse requested stats_type

Ramya Gnanasekar (1):
  wifi: ath12k: Dump additional Tx PDEV HTT stats

 drivers/net/wireless/ath/ath12k/Makefile      |   2 +-
 drivers/net/wireless/ath/ath12k/core.h        |   9 +
 drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 754 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 300 +++++++
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h       |   4 +
 drivers/net/wireless/ath/ath12k/dp_tx.c       |   4 +-
 8 files changed, 1080 insertions(+), 6 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h


base-commit: e72048809ec7355a947415ae6836d2eb7fdcda39
prerequisite-patch-id: d2a9e43548368a409107e185dc8755fdb30507fb
-- 
2.34.1


