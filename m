Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8279CC2BD09
	for <ath12k@archiver.kernel.org>; Mon, 24 Jun 2024 04:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7/1gp5A9ZTqxnEr/Mc8oSl4ymogVpMZl/Va/RyOLKxI=; b=t8Zx+zQn3PhHnzwzQZlbOWEz4o
	dQ6+M/xZxeMyTmrGhrwuNYrhzk3/PwjcRYaejNjVKoOvy1nzH5wqOkXwj29i+p+6aMVePBWEzACMJ
	oVZnFbKuBRURN1dec2bXXF+jKonFYsTC5EpJjDIE/g89vQODQp9/S2WwmSrsB2XIaHzoQuy0oD5yd
	HP5edvGnuEbv3gfd8frc/Jj/t/kWpQ/QN+j9+trbOFlF8EmSxMxMmBwKMwZ10/8InI5lKL6HsuYhP
	pTNGQIOwyfvvcWcs6L3f1fkhTeKH84lD/Y7QYrq+eySWw1lWFFriuWXQDJq6GGih9boo6mSkPCHZa
	4PDhgRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLbTm-0000000FW5S-0RBY
	for ath12k@archiver.kernel.org;
	Mon, 24 Jun 2024 04:38:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLbTj-0000000FW3F-02cK
	for ath12k@lists.infradead.org;
	Mon, 24 Jun 2024 04:38:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NNDDip008065;
	Mon, 24 Jun 2024 04:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7/1gp5A9ZTqxnEr/Mc8oSl4ymogVpMZl/Va
	/RyOLKxI=; b=DGGmlM3mjvt58QJj8FSBAfQCj5fFSakzw1j2TGDlNw+nuju0yna
	PZAPzFnTw+aTE9RGvhT5B22yeSqx4UUAT17MRUs0rwNfxYRdn/CJQZxe+mb/gFbg
	8Pq/t4Eoj4P2oC0T4s6JlU9oTp4ZATOc234ec9fa+vN5f3vuegp3gIHDypnlkbev
	8JpyQBsfiRYqPpj8fQGTBFM3QtUz+WqmgCZ90tiTaectm5Cdr3phzNIdzrGDjy4L
	990SvNpfjNkhhT3O/56ypXbzNIj7t3ylCiu69KDmBEBQlbVUhqT/3PdtVwLnJcHx
	coEiwAXm4QTPQL7Ov37RVAoNelMYBHP60ww==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjrts77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:38:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45O4cnVw000400;
	Mon, 24 Jun 2024 04:38:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpkq171-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:38:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45O4cn82000345;
	Mon, 24 Jun 2024 04:38:49 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45O4cmNB000344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:38:49 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id 2DD8241112; Mon, 24 Jun 2024 10:08:48 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH v6 0/4] wifi: ath12k: Add support to enable debugfs_htt_stats
Date: Mon, 24 Jun 2024 10:08:41 +0530
Message-Id: <20240624043845.3502520-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pl_rs6_ytSOaNwdsm1rCJTvrfdJ2wvOc
X-Proofpoint-ORIG-GUID: Pl_rs6_ytSOaNwdsm1rCJTvrfdJ2wvOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_213855_123591_4409BCCF 
X-CRM114-Status: GOOD (  12.99  )
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
Depends-On: [PATCH v2] wifi: ath12k: Fix pdev id sent to firmware for single phy devices
Link: https://lore.kernel.org/linux-wireless/20240621102809.3984004-1-quic_rgnanase@quicinc.com/T

v6:
 - Error code changes while writing type to htt_stats_type debugfs
 - Added new line as an argument to print_array_to_buf()
 - Rebased on ToT

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
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 752 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 300 +++++++
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h       |   4 +
 drivers/net/wireless/ath/ath12k/dp_tx.c       |   4 +-
 8 files changed, 1078 insertions(+), 6 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h


base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37
prerequisite-patch-id: b3fff34c0192e5d1f5b242eca8aa10fd0d715b50
-- 
2.34.1


