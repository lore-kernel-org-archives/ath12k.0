Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D482BE7718B
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 06:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jXxJKeikwHLj1FY4QuWLSavKVaOc1OT4uYYLVlaOffw=; b=lDrllsIjOI8L/AmlCnB8sPFBjL
	pkF14qXtZh0gi7PK0y2CtGNR4bmjsCU14aN8R9u6pHsHZkD8GDSXpZlQq61m6sysF+T3xdrkRmidF
	NCUD2gjTRSCKPCHZWxG3PrRuid7BzytqOwEEqzryu+NlmIXy07yp3TPANFZxClZohPFOznLXN/i2l
	LJjCfNSdkR4jjgY06p/ZMEDCSQuEOvUqoCOflK1q2ZkvydigaQzkDFrRPoucMrZc+DPNGbYCIicK5
	p8JnVaCdvtg6mKXwaihpZEjqOhiMSzg79mh2FGt1twDoTaVmZ/Na7oL2TZfAip+mfGdfGbIZNo8Y+
	2nRe7YAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbW3-00000009NMB-2czr
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 06:02:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbVm-00000009NHo-02wE
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 06:01:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN2riUK024819;
	Mon, 23 Dec 2024 06:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jXxJKeikwHLj1FY4QuWLSa
	vKVaOc1OT4uYYLVlaOffw=; b=er0kDIdFwBnfswml2sSOOTA4HNcZL0keyVqKpD
	KAgYVuiSPr+JuPCcuePafm8oPR/36Y2nVYAse+GSzR879RfUhzMocoeTbs7jOL3u
	tTZNFGEFwLBCWjN0ij1Dl7z+3gbCi9uCzKjkXMpT8UGDKMPxq8HdqpYMINAsxmqg
	1D9cCgo+FxHZamzfCz9KVKj/hL3U5rC5Zyvoxk/yLXO+p7JgvEP3o01uXoIoiZ0X
	CywM7YzDeu3oi7PfuKgy+i76DYbPQ534JZlPpbQmBTXnAxm2WN8sABOdcMkCYM7s
	36GN0VU2Ub4wltVunLRmztDO4ePHWPEB35tgzplKIfWhXpHQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43pyft0jy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:01:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN61mws030066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:01:48 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Dec 2024 22:01:47 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2 00/14] wifi: ath12k: Enable monitor ring for updating station dump in QCN9274
Date: Mon, 23 Dec 2024 11:31:18 +0530
Message-ID: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nNRrdA-7n2cIOBE1Ou31MTkHR_HsW-8E
X-Proofpoint-GUID: nNRrdA-7n2cIOBE1Ou31MTkHR_HsW-8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=639
 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_220150_140467_680DB09B 
X-CRM114-Status: GOOD (  10.52  )
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

This series enables the monitor related rings for the QCN9274 and
configures filters to collect statistics such as RSSI, which are
required for updating the station dump. Also, this series does
not impact WCN7850.

Depends-On:
	[PATCH 0/3] wifi: ath12k: Refactor monitor Rx handler
	https://lore.kernel.org/all/20241219001006.1036495-1-quic_periyasa@quicinc.com/

v2:
	- set rxmon_disable flag to true to disable monitor destination
	  ring in patch 3/14.

P Praneesh (14):
  wifi: ath12k: Add HTT source ring ID for monitor rings
  wifi: ath12k: Enable filter config for monitor destination ring
  wifi: ath12k: Avoid multiple times configuring monitor filter
  wifi: ath12k: Avoid code duplication in monitor ring processing
  wifi: ath12k: Restructure the code for monitor ring processing
  wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process
  wifi: ath12k: Fix end offset bit definition in monitor ring descriptor
  wifi: ath12k: Add drop descriptor handling for monitor ring
  wifi: ath12k: Handle end reason for the monitor destination ring
  wifi: ath12k: Optimize NAPI budget by adjusting PPDU processing
  wifi: ath12k: Handle PPDU spread across multiple buffers
  wifi: ath12k: Avoid memory leak while enabling statistics
  wifi: ath12k: Handle monitor drop TLVs scenario
  wifi: ath12k: Enable monitor ring mask for QCN9274

 drivers/net/wireless/ath/ath12k/core.h     |   1 +
 drivers/net/wireless/ath/ath12k/dp.h       |  55 +++-
 drivers/net/wireless/ath/ath12k/dp_mon.c   | 348 ++++++++-------------
 drivers/net/wireless/ath/ath12k/dp_mon.h   |   6 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c    |  79 ++++-
 drivers/net/wireless/ath/ath12k/hal_desc.h |   5 +-
 drivers/net/wireless/ath/ath12k/hal_rx.h   |   4 +
 drivers/net/wireless/ath/ath12k/hw.c       |   8 +-
 drivers/net/wireless/ath/ath12k/mac.c      |  57 ++--
 9 files changed, 284 insertions(+), 279 deletions(-)


base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
prerequisite-patch-id: 5f5721a4c9f1c26659fd8f09a8eda648d8ecccf5
prerequisite-patch-id: 59cc2121e734e4e1e7e461a3ae24f3f1f9d0fa02
prerequisite-patch-id: fdc512e43ea7cb6c097ba4c0d9c661a74c0c2a6f
-- 
2.34.1


