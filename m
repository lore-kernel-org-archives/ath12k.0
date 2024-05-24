Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA75C25B75
	for <ath12k@archiver.kernel.org>; Fri, 24 May 2024 02:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qDlJYwfIg/Kk48xgynR5GC9PNh+x6U4PobtPtpcFaVg=; b=oXac8BueyKswaam7KM5xcF8uLV
	JHLxRT67lk4mcLS4CtMlLDqRa8T7Qfp0rVxiHJrwG9bgt/66i4E+/FIhwbXgzuUSWn3oDFlboVVRf
	wrSdUCvTDA91YHlIgPsQgJ2Hp/CH6sQWLFsiur/NKkZdKj2LXBaQQKtGEG/wiXbs+y1hq52gZPq9j
	avrTWT/88qhfp+CYfQO4PaDiFcAucUTfKlYzdQ6hwdsLXKU6eBiGSTdymq12m52KGgs3AXqJFhVqh
	zO669nwjUZrKEokHWM6R9xnB5kp6FGeiLjSpVSVmgddj1tjUPSVOh1C5gl1ZkOszF7ocagEAqsdDf
	7vcXQn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAKrE-00000007rtz-3I3F
	for ath12k@archiver.kernel.org;
	Fri, 24 May 2024 02:40:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAKrB-00000007rtc-1Bdt
	for ath12k@lists.infradead.org;
	Fri, 24 May 2024 02:40:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNOuec015823;
	Fri, 24 May 2024 02:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qDlJYwfIg/Kk48xgynR5GC
	9PNh+x6U4PobtPtpcFaVg=; b=Dl3ifOcdRfBOyVNoRR6iImc9q8IDEUW8Vo2yll
	R+Lqc6PkzRE8sgtnWJz8pmk/JepWzaxL7HcBpO3uqQxquxGysy/k9a0xZ2Bsqxs7
	XxLpb/+VqI7OuX6mINbpNoTfbtrWzcwYjfV53QfeQcLj5/S+CiOPIpIler3FzZDG
	JF6MRx8By8KgOiGDqLDBN27esdlYZJbSHfY4TlsuyQruK7aFa3L2+N9PqI1maxrt
	cI/6skeCspQ4GEivEOTPcnZTbi134FY4+FFaSlroYFma6XlPOjIp6KoyRjVIKAWT
	1O0YCbyXO2EE+/QF/3XW6tPTyODGHDRQp9vO0fuHVDMlSABg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8hryyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 02:40:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O2eW8v022544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 02:40:32 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 19:40:30 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix wrong definition of CE ring's base address
Date: Fri, 24 May 2024 10:40:21 +0800
Message-ID: <20240524024021.37711-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QoxylfbHf1OeWEc70r20_5RRKOjuFlVt
X-Proofpoint-ORIG-GUID: QoxylfbHf1OeWEc70r20_5RRKOjuFlVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_194033_383865_11B6D9F9 
X-CRM114-Status: GOOD (  13.81  )
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

Base address of CE ring is defined as u32, currently this works
because DMA mask configured as 32 bit:

	#define ATH12K_PCI_DMA_MASK	32

However this mask could be changed once firmware bugs are fixed
to fully support 36 bit DMA addressing. So to protect against any
future changes to the DMA mask, change the type of the fields that
are dependent upon it.

This is found during code review. Compile tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ce.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index 79af3b6159f1..857bc5f9e946 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_CE_H
@@ -119,7 +119,7 @@ struct ath12k_ce_ring {
 	/* Host address space */
 	void *base_addr_owner_space_unaligned;
 	/* CE address space */
-	u32 base_addr_ce_space_unaligned;
+	dma_addr_t base_addr_ce_space_unaligned;
 
 	/* Actual start of descriptors.
 	 * Aligned to descriptor-size boundary.
@@ -129,7 +129,7 @@ struct ath12k_ce_ring {
 	void *base_addr_owner_space;
 
 	/* CE address space */
-	u32 base_addr_ce_space;
+	dma_addr_t base_addr_ce_space;
 
 	/* HAL ring id */
 	u32 hal_ring_id;

base-commit: fae0804439b5833308ab7d8563c643edb0fa174c
-- 
2.25.1


