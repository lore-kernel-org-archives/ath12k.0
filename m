Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A485E7718B
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 04:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F39O8F92ntSie69On9uSD64p7sJx8tGcVZSzfZXV104=; b=2OOITlugsA4moQfEpZ/RfHEw1M
	8cOTZimxZjreiAZAkRiSpG+HhKd7nQ9DiCJuXJIFr2nrorwuwzdxM2B2HzCdg5rnAljg4vYXzxWhK
	8hPN7f0N/wN+y8jCXr17tKdj93BdEjAH63brJRC9K0HZPjmtifGdFV0l+693S9qrzGakfmWrItTaX
	TL1oYvyeMXtq+AYBIkwyJXRjYpCT4KLVYeH/0JRV/YDn//p9QLauOFv4Jv+4lxDo31Wu1IpZvfzku
	YOHw0wuF15D0ejHWifVIWM6c+DOj+nM/O5LIaJH+4QN1hhXhqYDEUCSYTJC/4HpvP8CzIXh71S1fe
	DUWNRylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr8r-00000006XO6-3dHw
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 04:31:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr8p-00000006XNa-2WnC
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 04:31:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL3YYqr001046;
	Sat, 21 Dec 2024 04:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F39O8F92ntSie69On9uSD64p7sJx8tGcVZSzfZXV104=; b=RPlz4IugMboCDknd
	X2W4zXXixAbJZp/DDyPBnA/nzlND4KrOpqLDRQyVS0rGkr5FnKELNc/7DvML5Tmj
	B0L7B/GU9wkw5rrFPi45Wui2fgsyULNFV/WLDmn2J3nGDm6IgVMHUe4LoNZrc33U
	aL0Jx23+dCRWLOX919dasKW1tpeaYIkMYpaP92zdRL9WyUDugAF74S3kVdaKITlS
	BIxjjk1rNS+BZ4KBPj6CyHzrEg9zTCnc8Y64uKLY9G6rCE4s2X6qmp2AtNEnFoav
	9YSV5te51ouOChflmaZaI3DBX7cq1AvNIeNdN+H5tSrVgiTWKVMOYMXolwms0/Ns
	Ey8R5g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nnw1g3f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL4V2FA008106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:31:02 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 20:31:00 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 01/14] wifi: ath12k: Add HTT source ring ID for monitor rings
Date: Sat, 21 Dec 2024 10:00:01 +0530
Message-ID: <20241221043014.1252841-2-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
References: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nUfYYEMBoYtUfFOzR5To_qshz1DFEtkm
X-Proofpoint-ORIG-GUID: nUfYYEMBoYtUfFOzR5To_qshz1DFEtkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412210035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_203103_657047_066E7B21 
X-CRM114-Status: GOOD (  14.37  )
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

Add source buffer ring and destination buffer ring ID for monitor rings.
These IDs are used for ring configuration during initial ring setup.

Since monitor rings are enabled based on the rxdma1_enable flag, enable it
in the hardware param for the QCN9274 version 2 hardware and increase the
destination ring size to handle MSDU data buffers.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    | 5 ++++-
 drivers/net/wireless/ath/ath12k/dp_tx.c | 4 ++--
 drivers/net/wireless/ath/ath12k/hw.c    | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index b178921aaf1d..475c053faaa1 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -176,7 +176,7 @@ struct ath12k_pdev_dp {
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
 #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
 #define DP_RXDMA_MONITOR_BUF_RING_SIZE	4096
-#define DP_RXDMA_MONITOR_DST_RING_SIZE	2048
+#define DP_RXDMA_MONITOR_DST_RING_SIZE	8092
 #define DP_RXDMA_MONITOR_DESC_RING_SIZE	4096
 #define DP_TX_MONITOR_BUF_RING_SIZE	4096
 #define DP_TX_MONITOR_DEST_RING_SIZE	2048
@@ -434,8 +434,11 @@ enum htt_srng_ring_id {
 	HTT_HOST1_TO_FW_RXBUF_RING,
 	HTT_HOST2_TO_FW_RXBUF_RING,
 	HTT_RXDMA_NON_MONITOR_DEST_RING,
+	HTT_RXDMA_HOST_BUF_RING2,
 	HTT_TX_MON_HOST2MON_BUF_RING,
 	HTT_TX_MON_MON2HOST_DEST_RING,
+	HTT_RX_MON_HOST2MON_BUF_RING,
+	HTT_RX_MON_MON2HOST_DEST_RING,
 };
 
 /* host -> target  HTT_SRING_SETUP message
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index a8d341a6df01..13bc2d92e09c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -814,7 +814,7 @@ ath12k_dp_tx_get_ring_id_type(struct ath12k_base *ab,
 		*htt_ring_type = HTT_HW_TO_SW_RING;
 		break;
 	case HAL_RXDMA_MONITOR_BUF:
-		*htt_ring_id = HTT_RXDMA_MONITOR_BUF_RING;
+		*htt_ring_id = HTT_RX_MON_HOST2MON_BUF_RING;
 		*htt_ring_type = HTT_SW_TO_HW_RING;
 		break;
 	case HAL_RXDMA_MONITOR_STATUS:
@@ -822,7 +822,7 @@ ath12k_dp_tx_get_ring_id_type(struct ath12k_base *ab,
 		*htt_ring_type = HTT_SW_TO_HW_RING;
 		break;
 	case HAL_RXDMA_MONITOR_DST:
-		*htt_ring_id = HTT_RXDMA_MONITOR_DEST_RING;
+		*htt_ring_id = HTT_RX_MON_MON2HOST_DEST_RING;
 		*htt_ring_type = HTT_HW_TO_SW_RING;
 		break;
 	case HAL_RXDMA_MONITOR_DESC:
diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index b7b583fadb5a..14bbd446ad37 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1035,7 +1035,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.hal_params = &ath12k_hw_hal_params_qcn9274,
 
-		.rxdma1_enable = false,
+		.rxdma1_enable = true,
 		.num_rxdma_per_pdev = 1,
 		.num_rxdma_dst_ring = 0,
 		.rx_mac_buf_ring = false,
-- 
2.34.1


