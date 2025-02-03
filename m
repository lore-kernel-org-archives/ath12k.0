Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972CBC0218F
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 02:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Ym76d43NUrtoZHrSGCxkHbJFUzSiHaZaXiTy6AGUy0=; b=bfRzdqg2AUx1d10J4boAN52Cjv
	B82d6FiBH/YBOHLyCDBDiQbgnNgSawK5Hn+iOXiVaBH9lJ8lwPXAHQdwCFcI7hutnznOYvDfMR13V
	yPv/xDfKPdmTlp1K/nVQf/3NGq3hFzPDky0zqtoVifoYBoddrUXjfnbgAfTjLCAPYV/8CK9duSAGG
	IUpjvtS/uZVLF/aAY43WbRa0wP2mSNMaLEzDFy5rDx5ylrcjaJQ7ufGIvh6ZXyJPYnhqJZkZLI2sI
	mQcTkNPIcCyhNys3PSRTfItzp2e3ncozEIVFiAtaFfe2fK8Ygww9KaewPeUIryJp+cXFrTHblVCza
	1oQNcvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1temXs-0000000ESdF-1XTO
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 02:50:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1temXq-0000000EScI-0qAw
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 02:50:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512MW9qO025956;
	Mon, 3 Feb 2025 02:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9Ym76d43NUrtoZHrSGCxkH
	bJFUzSiHaZaXiTy6AGUy0=; b=dEApRWBDa+GRcdtyYYfVQlaGPeyQr1tx3aOhSX
	yl+oz8I3jhWGhLOk7KvBZSraObtoGZ2ocs0C6djGZ1vMT6TZ6Ejlkib1uvWwfsyM
	lYbP+pDkArwrkffMZ5CRaGaQ1ZyR3Hr1dPipf+9qzl9QlvW5+UIDKZROgZpdGX3/
	CDTS23xzg38osN0/S8GiXHq53BD/8VUmKme/qrDz9VGKIKWFn+BLpcAQVW5myABs
	fedR9x3+odU3Wr2P7hlcbe6kR1VejnTn2hW2YefjviIQUOA/sAPy0OiwQLiOuQbf
	WlB9hSshDZ2QYW20K6+55p9g6/GBKx8UqLtXM8yRPTnB2vJA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd8wb24m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 02:50:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5132ochF010555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 02:50:38 GMT
Received: from hu-bmahalin-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 18:50:38 -0800
From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bmahalin@quicinc.com>
Subject: [PATCH v2 0/2]  wifi: ath12k: Add support for MLO Multicast Handling
Date: Sun, 2 Feb 2025 18:50:14 -0800
Message-ID: <20250203025016.3851279-1-quic_bmahalin@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hnZR0n6OeeMohDiFvMCw6r0aZHi_FoaD
X-Proofpoint-ORIG-GUID: hnZR0n6OeeMohDiFvMCw6r0aZHi_FoaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-02_11,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=789
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_185042_358654_BDC53C83 
X-CRM114-Status: GOOD (  10.82  )
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

v2
	Optimized vdev id arithmetic for more readability based on feedback.
	Updated code documentation on intentional reset of meta_data_flag value.
	Rebased on top of master branch.

v1: https://patchwork.kernel.org/project/linux-wireless/patch/20250109184932.1593157-3-quic_bmahalin@quicinc.com/

Balamurugan Mahalingam (2):
  wifi: ath12k: Update HTT_TCL_METADATA version and bit mask definitions
  wifi: ath12k: Add support for MLO Multicast handling in driver

 drivers/net/wireless/ath/ath12k/core.h  |  1 +
 drivers/net/wireless/ath/ath12k/dp.h    | 27 +++++--
 drivers/net/wireless/ath/ath12k/dp_tx.c | 28 +++++++-
 drivers/net/wireless/ath/ath12k/dp_tx.h |  4 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 93 +++++++++++++++++++++++--
 5 files changed, 136 insertions(+), 17 deletions(-)


base-commit: a10b8b584b8bcb7559f068ce247fc27d0c4850ca
-- 
2.34.1


