Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0FECA0FED
	for <ath12k@archiver.kernel.org>; Wed, 10 Sep 2025 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJVMXluzV5jrKEAvFYeLHKtyJf0CmW5bI4+IXkxNtdQ=; b=nRGZO3usXKvWvW1AoUmhohiEul
	xbTSanxkb02tn+Pm7j8O8InQv/rvepdl7pPeLn49qNwatImUu5ft+VvGOVJxwKApF/QC3jNE1YbXw
	XdqAFiGTkfj/Hn1EzbOZsiUytXlbRU9Zo3o9pqX73OAVLykYUYjVAhc95cg/eMXBuhs87COswt8Zu
	qrMq81JwF5USmgwgn7V2ugMQ6pDLSdLOV8l0g+RJXy8qSTgY6lzx8cDiknmlqspE8x2pnhT0ICsAz
	B6LqeRjrN+bzWCYZ7T3xRrOwLjlLXNlmhC71KPbFcAlZnE5YRAiIo2wyWU3HXrUXNb/rRdx79q9QF
	AETuFhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwPL1-0000000FzSE-3EnS;
	Wed, 10 Sep 2025 18:14:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwPKz-0000000FzPq-2iHs
	for ath12k@lists.infradead.org;
	Wed, 10 Sep 2025 18:14:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AGEo6g017247;
	Wed, 10 Sep 2025 18:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hJVMXluzV5jrKEAvFYeLHK
	tyJf0CmW5bI4+IXkxNtdQ=; b=TxVM9FM2ECN4NrzaLXnCFut4SCUPCZUOd3Qft1
	3/iONrp5wMZO5UUuBgVWt5eOnlv9k4mpRpkF2ucanXN6VTWxswm52INJiuDal1Hz
	2NVoC749MuT8SSC8L1Urz+vt+s0L/M5Jm9UZKifIttzsby1Jv34n7H848+DUXHHO
	XrxOPSd1wG1YpfPA5f6QPuOrRp2iuJomk1px4DI5DfIzBP3lVLrPjK8bpKOZ291+
	O9IDWbJnbzGsnaNviaKyfcmDH8nl2Ayv7XGunevZGxyKhwwnNj8bGiQCRsOAG99C
	aVnjVacpK23X0atb/KE03lZeJERESfse0zfhOh3vj5BklplQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb0cbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 18:14:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58AIEUSj032703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 18:14:30 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 10 Sep 2025 11:14:29 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng v2 0/8] wifi: ath12k: Improve hal APIs usage in rx path
Date: Wed, 10 Sep 2025 23:44:06 +0530
Message-ID: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfX/NqEzjZcu4gK
 i5chEmB7BpNXhx09dc/ezFT1LVOHSWHs8uJnLITRzHmPpTyvu8ZP0ZQYBMhXHtmOzAW0hq5qk8l
 qI8pmWQowITxuHxTAY67/qzj4FaApOxp8wNGhke6h5CJuXW5yOn2wxgsqADNmUc8AzBlVnuTv96
 HNnnfjYfSeXUAy6caCsPCPAW5Pavia47gJRYvLUGtmdxxAf1l5H+nlf+dB53zmau/S6Mbc/VhNc
 TXI2ADZjHqqjxjXznFuKN+xNRFmLXsC8P+qzTVaubdxUSQmzn+rI6xluq/Og7I3oooqMzteghF8
 rZpecR9t9TIjRkuQaHNFDWkc8xcAhxor+yYj4bgs6eHylrGD5y+T71eabHtNnG5iKTve03+jOfO
 bqJUaM3A
X-Proofpoint-ORIG-GUID: CIf0pcdqt6O6Zra6xk4TfvvqZKASYkVW
X-Proofpoint-GUID: CIf0pcdqt6O6Zra6xk4TfvvqZKASYkVW
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c1c007 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=rgJ7dQ7m1Pf861PDhsMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_111433_804664_9050CDB4 
X-CRM114-Status: GOOD (  12.82  )
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

The existing usage of rx_ops to reach the hal_apis at multiple places uses
function pointer indirections. In order to avoid such multiple function
pointer indirection, extract the required hal parameters in the rx path
right at the beginning and store them in a structure which is then
leveraged by the rest of the rx path.

Move remaining rx_ops APIs to hal_ops to simplify hal API usage.

Also, make compact tlvs as default mode and remove the non-compact tlvs
as they are unused. Since there is no need to maintain multiple versions
of tlv extraction APIs, move the rx_ops callbacks to hal_ops.

----
Changes in v2:
     - Update commit messages in patch 1/8 and 7/8
----

Pavankumar Nandeshwar (5):
  wifi: ath12k: Remove non-compact TLV support from QCN
  wifi: ath12k: Replace ops with direct calls for rxdma ring mask
  wifi: ath12k: Move hal_rx_ops callbacks to hal_ops
  wifi: ath12k: Add new infra for the rx path
  wifi: ath12k: Change the API prefixes to ath12k_wifi7 in tx/rx

Ripan Deuri (3):
  wifi: ath12k: Move the hal APIs to hardware specific files
  wifi: ath12k: unify HAL ops naming across chips
  wifi: ath12k: Remove hal_rx_ops and merge into hal_ops

 drivers/net/wireless/ath/ath12k/Makefile      |    4 +-
 drivers/net/wireless/ath/ath12k/ahb.c         |    2 +-
 drivers/net/wireless/ath/ath12k/core.c        |    2 +-
 drivers/net/wireless/ath/ath12k/core.h        |    2 -
 drivers/net/wireless/ath/ath12k/dbring.c      |    5 +-
 drivers/net/wireless/ath/ath12k/dp.c          |   31 +-
 drivers/net/wireless/ath/ath12k/dp.h          |    1 -
 drivers/net/wireless/ath/ath12k/dp_mon.c      |   36 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  128 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  204 +---
 drivers/net/wireless/ath/ath12k/hal.c         | 1048 +----------------
 drivers/net/wireless/ath/ath12k/hal.h         |  106 +-
 drivers/net/wireless/ath/ath12k/mac.c         |    6 +-
 drivers/net/wireless/ath/ath12k/pci.c         |    2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp.c    |   19 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp.h    |    5 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  501 ++++----
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   74 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |   49 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |    8 +-
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  369 ++++++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.h   |   35 +
 .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |  161 +--
 .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   82 +-
 .../wireless/ath/ath12k/wifi7/hal_rx_desc.h   |    7 -
 .../net/wireless/ath/ath12k/wifi7/hal_tx.c    |   13 +-
 .../net/wireless/ath/ath12k/wifi7/hal_tx.h    |   18 +-
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  364 ++++++
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.h   |   32 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.c   |    2 -
 30 files changed, 1452 insertions(+), 1864 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h


base-commit: d637c58a29475d646f8decfbbc1d27fae999a449
-- 
2.34.1


