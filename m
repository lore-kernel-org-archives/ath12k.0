Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73408C25B10
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 05:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2fat+875p+NuWF5RGzn9KXsQDTQfzrqKvqBLgWJ8FE=; b=DhgytWxxVM80TDFlw9Au310vRs
	qTuQvhap01NRpiM4pj7MhKgt6vR/k5ufgf/0JRaNwkGcjfHeQxROp6V3CxRWGnqOY0IBKIO8BT23g
	SUgHdPz2EXPj42QBhP11Z+NrSftcbosu95H4MjeUaNN2yYUR3EZbVn5//y4aGqpLKngc+7unyXqEw
	TSprFJyVKHBE51mjgYbfxTmLnWe0hJlOH14PkA27BscczsGW1hdFPcSVwLnL+hKYJhZQvzEzCSqj3
	aC4a2ZJwyiwAq1EKNEukbh8palzIeCPm91prP1/x60GpNLyIUcPXi/g7LmZmU+wsaTvUKYs0rw8Aj
	qpwrbYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1gLm-00000005BRd-0Xj2
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 05:48:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1gLi-00000005BPh-0zUc
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 05:48:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U4043v029533;
	Tue, 30 Apr 2024 05:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=I2fat+875p+NuWF5RGzn9KXsQDTQfzrqKvqBLgWJ8FE=; b=YI
	d8Wkzd30UKY7WPS4gOV8bqZzlIjJbohBQrHqJAV2W6jMo9uvcVNtDPcMgDdS/k3j
	dIlINF1aHUktJjG0GKCg/B6kwXsNoo1/j3xEohYGabWRbGOURqgiHgTiWUNIGv8p
	rG/bnB3TamPgr4am36/HwE0MpeJanWX3GIo6+bq01VKnEbNIATKCVSj8qvaMWFlm
	duH6klvGIUJaahFut6XGhJ5zqs2e49Gz9YwJ+kdtYO4RlQXpWQkNHMnZ6zpBNZ+y
	7jeI5y69gVhNQsTyeRwhFh4nhDko3ixNVBYBwIb0YTp9Ni9QOCBMrED7oxeMm+l0
	pVqqiad+6VaGmkQLMKgw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtg51tdj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 05:48:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U5mGPu011714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 05:48:17 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 22:48:15 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 1/4] wifi: ath12k: Replace "chip" with "device" in hal Rx return buffer manager
Date: Tue, 30 Apr 2024 11:17:56 +0530
Message-ID: <20240430054759.722620-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430054759.722620-1-quic_periyasa@quicinc.com>
References: <20240430054759.722620-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rN4ex8c0xSWg6irKFOrI2vrwZPiuLlYg
X-Proofpoint-ORIG-GUID: rN4ex8c0xSWg6irKFOrI2vrwZPiuLlYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_02,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 mlxlogscore=719 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_224818_335737_249A0F30 
X-CRM114-Status: GOOD (  13.03  )
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

Prefer the term "device" over "chip". Therefore, modify the relavant terms
in hal Rx return buffer manager to use "device" instead.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c |  4 ++--
 drivers/net/wireless/ath/ath12k/hal.h   | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 75df622f25d8..fc4b95324955 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3071,7 +3071,7 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
 
 	ath12k_hal_rx_buf_addr_info_set(&reo_ent_ring->buf_addr_info, link_paddr,
 					cookie,
-					HAL_RX_BUF_RBM_WBM_CHIP0_IDLE_DESC_LIST);
+					HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST);
 
 	mpdu_info = u32_encode_bits(1, RX_MPDU_DESC_INFO0_MSDU_COUNT) |
 		    u32_encode_bits(0, RX_MPDU_DESC_INFO0_FRAG_FLAG) |
@@ -3451,7 +3451,7 @@ int ath12k_dp_rx_process_err(struct ath12k_base *ab, struct napi_struct *napi,
 			       (paddr - link_desc_banks[desc_bank].paddr);
 		ath12k_hal_rx_msdu_link_info_get(link_desc_va, &num_msdus, msdu_cookies,
 						 &rbm);
-		if (rbm != HAL_RX_BUF_RBM_WBM_CHIP0_IDLE_DESC_LIST &&
+		if (rbm != HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST &&
 		    rbm != HAL_RX_BUF_RBM_SW3_BM &&
 		    rbm != ab->hw_params->hal_params->rx_buf_rbm) {
 			ab->soc_stats.invalid_rbm++;
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index dbb9205bfa10..f364b2938ef8 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -770,12 +770,12 @@ struct hal_srng_config {
  * enum hal_rx_buf_return_buf_manager - manager for returned rx buffers
  *
  * @HAL_RX_BUF_RBM_WBM_IDLE_BUF_LIST: Buffer returned to WBM idle buffer list
- * @HAL_RX_BUF_RBM_WBM_CHIP0_IDLE_DESC_LIST: Descriptor returned to WBM idle
- *	descriptor list, where the chip 0 WBM is chosen in case of a multi-chip config
- * @HAL_RX_BUF_RBM_WBM_CHIP1_IDLE_DESC_LIST: Descriptor returned to WBM idle
- *	descriptor list, where the chip 1 WBM is chosen in case of a multi-chip config
- * @HAL_RX_BUF_RBM_WBM_CHIP2_IDLE_DESC_LIST: Descriptor returned to WBM idle
- *	descriptor list, where the chip 2 WBM is chosen in case of a multi-chip config
+ * @HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST: Descriptor returned to WBM idle
+ *	descriptor list, where the device 0 WBM is chosen in case of a multi-device config
+ * @HAL_RX_BUF_RBM_WBM_DEV1_IDLE_DESC_LIST: Descriptor returned to WBM idle
+ *	descriptor list, where the device 1 WBM is chosen in case of a multi-device config
+ * @HAL_RX_BUF_RBM_WBM_DEV2_IDLE_DESC_LIST: Descriptor returned to WBM idle
+ *	descriptor list, where the device 2 WBM is chosen in case of a multi-device config
  * @HAL_RX_BUF_RBM_FW_BM: Buffer returned to FW
  * @HAL_RX_BUF_RBM_SW0_BM: For ring 0 -- returned to host
  * @HAL_RX_BUF_RBM_SW1_BM: For ring 1 -- returned to host
@@ -788,9 +788,9 @@ struct hal_srng_config {
 
 enum hal_rx_buf_return_buf_manager {
 	HAL_RX_BUF_RBM_WBM_IDLE_BUF_LIST,
-	HAL_RX_BUF_RBM_WBM_CHIP0_IDLE_DESC_LIST,
-	HAL_RX_BUF_RBM_WBM_CHIP1_IDLE_DESC_LIST,
-	HAL_RX_BUF_RBM_WBM_CHIP2_IDLE_DESC_LIST,
+	HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST,
+	HAL_RX_BUF_RBM_WBM_DEV1_IDLE_DESC_LIST,
+	HAL_RX_BUF_RBM_WBM_DEV2_IDLE_DESC_LIST,
 	HAL_RX_BUF_RBM_FW_BM,
 	HAL_RX_BUF_RBM_SW0_BM,
 	HAL_RX_BUF_RBM_SW1_BM,
-- 
2.34.1


