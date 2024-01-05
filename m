Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5936BC4707C
	for <ath12k@archiver.kernel.org>; Fri,  5 Jan 2024 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOfXOm6ZBzRyz5WTXxNAkXxuBJLY2aBq8yiJwQhO2rg=; b=1SWjfTVzkBNhrzcpABA2OPFnVP
	HzXk8X/P6ZQMazqXhpFyt/ITKIFacgsYR6HryWfgT+xsGPXX7ie3kpx1rdpBmxyrZnOt0j746zlAj
	G9zcDzEKfZZJdT7QWho/4kpTtQOp7AiqhxzCoqi8RXDgKdvRE9kLYO4H8zLs8Lhb3AK4acQGGcpKQ
	v6aYxU+c4MHop6UOaDpUaStM6S0VHFtQ2miapX8yECCOoGXCeKhwSFH/+migZRQWqgGtfRHCep5qF
	IxopWtSjmWF8qwsNzxB5o1nUYFC2BExPm3IJW2SgrtQcDFdyxFr4hgS4Z60AYpGF7DJaOwkGcifj7
	vYbpkOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLqJg-0008dp-0E
	for ath12k@archiver.kernel.org;
	Fri, 05 Jan 2024 19:57:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLqJa-0008d0-2C
	for ath12k@lists.infradead.org;
	Fri, 05 Jan 2024 19:57:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 405Jv8Pb005424;
	Fri, 5 Jan 2024 19:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=OOfXOm6ZBzRyz5WTXxNAkXxuBJLY2aBq8yiJwQhO2rg=; b=al
	aaykvKz/FX72v5AkJxkXtMPHhk2SXUtxWNCyU2eafFQaTMZW1QZDaIVOfkL/8sGr
	Myv7kD3GE9Y5/mlkV3ReH7iurkQhR03ji8gFbvRGTQN9kJIhitH+ntNwUr4slb/C
	lEVurmUfcDZLq8eQ06p45kIa/h5byfBdD74tOS4EYeRCfswehz/Vvx1v2wd2SCJn
	alEQOeAspePU/p+nj2wtHAMkV9y0YsrRkFkU7BiqnU4lMDrTAT+y7Ph0bfNs9s39
	WxUpFPPoV/c8jINTjczidOLVdp1PHpe+961+pafGu4UFnKKPiUZA6p2kcpLP3eqf
	H8utH4J3nYbhl33NUzDA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve96qt423-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 19:57:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405Jv686031905
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jan 2024 19:57:06 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 5 Jan 2024 11:57:05 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 04/12] wifi: ath12k: fix fetching MCBC flag for QCN9274
Date: Sat, 6 Jan 2024 01:26:31 +0530
Message-ID: <20240105195639.3217739-5-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com>
References: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jIPru5vas5kOgxXurZuBuPo3dG1k1zNr
X-Proofpoint-GUID: jIPru5vas5kOgxXurZuBuPo3dG1k1zNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401050160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_115710_955367_80B87F46 
X-CRM114-Status: GOOD (  13.94  )
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

In QCN9274, RX packet's multicast and broadcast(MCBC) flag is fetched
from RX descriptor's msdu_end info5 member but it is not correct
for QCN9274. Due to this with encryption, ARP request packet is wrongly
marked as MCBC packet and it is sent to mac80211 without setting
RX_FLAG_PN_VALIDATED & RX_FLAG_DECRYPTED flag. This results in packet
getting dropped in mac80211. Hence ping initiated from station to AP
fails.

Fix this by fetching correct MCBC flag in case of QCN9274.
For QC9274 MCBC flag should be fetched from RX descriptor's mpdu_start
info6 member.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: 8f04852e90cb ("wifi: ath12k: Use msdu_end to check MCBC")
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index a489369d8068..1bdab8604db9 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/dma-mapping.h>
 #include "hal_tx.h"
@@ -449,8 +449,8 @@ static u8 *ath12k_hw_qcn9274_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
 
 static bool ath12k_hw_qcn9274_rx_desc_is_da_mcbc(struct hal_rx_desc *desc)
 {
-	return __le16_to_cpu(desc->u.qcn9274.msdu_end.info5) &
-	       RX_MSDU_END_INFO5_DA_IS_MCBC;
+	return __le32_to_cpu(desc->u.qcn9274.mpdu_start.info6) &
+	       RX_MPDU_START_INFO6_MCAST_BCAST;
 }
 
 static void ath12k_hw_qcn9274_rx_desc_get_dot11_hdr(struct hal_rx_desc *desc,
-- 
2.34.1


