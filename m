Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E0DC47422
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 06:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Z6BHs4NytYKgx1IVPLbLC5OOXQrQHuaTfLIwvygqzs=; b=XE0wp5EwnMgwBEec/35vaCN3fk
	+0/OdBZnV2zIe/OJk48fryCH0qHtN8GZo0pr5w2syi7YouSd+BX0N7hs1RdkBleouq4cY/xhz+DBy
	ZMweNIRiAv/tJ8PqZaUvAYWjw0e8jjTMxgZRM5a/qrXCJKtOancwYiBKmQE2iMPCiNbBZfcLW+XnY
	ea28pVD3U58/SSufXRf1BcRYfGEGaw0e40pwhmj9zg0btC8sqiG18w+Z9360vvs70InlEIwhYwuz6
	3A97CtpOSDt79jb7FF1kWNYmCTcl/UP2sNY2N944Osb1hguwDbBUGAc3LYFsCBeEsiQ4Togh2ygxT
	OfJG4vAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULai-0000000BYzA-2UOw
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 06:58:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULae-0000000BYww-31gP
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 06:57:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T3mSC5032511;
	Mon, 29 Jan 2024 06:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=+Z6BHs4NytYKgx1IVPLbLC5OOXQrQHuaTfLIwvygqzs=; b=It
	gVL67MgMoT80NWr605cduKrZ8VABOctxYp+p6E2ymxCYSx1vaVRYaQ8wUTSVxPPH
	2feOqUvQnwz6gLOgQ3mM6qWzrMBALCSB0Ba9UR4/ZiO2VJ1bBr9UoXiUu9n0/u5z
	gsYalugRQ8/jqHSf6QvytohIJFNBnX2QxDcRR/L4YFaUA9Oqb0K3RDvx3or63mhm
	SRovZpHL7m5Bn+NP7P0VCnfnfcNSPj+FZplq1/M96UfkDdH8NCIPhCgTsGP1difX
	A7MlWNi1T98SfPsxpE+uwq1nh1yGv/5qsEMTKfH8rRUzsyX3v2IXgF/Yyt9cji5Z
	uyC647Ioq0AF8sQj26Zg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx275gf6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:57:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T6vsTo008794
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:57:54 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 28 Jan 2024 22:57:53 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 04/13] wifi: ath12k: fix fetching MCBC flag for QCN9274
Date: Mon, 29 Jan 2024 12:27:15 +0530
Message-ID: <20240129065724.2310207-5-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N1_4dzkQXDNCOmzpQL25mhx7mfaD184a
X-Proofpoint-GUID: N1_4dzkQXDNCOmzpQL25mhx7mfaD184a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_03,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_225756_924383_96701905 
X-CRM114-Status: GOOD (  13.60  )
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
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

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


