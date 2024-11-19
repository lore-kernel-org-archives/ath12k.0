Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8164D62068
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vlJvG730gygx5McVjoi1/88ZhVN8drGvUk3A94EcRyk=; b=OBWqbe5GpU/3+enxy7GNyQNd5o
	efdpx6mN1WIUM8K3zCDeeox86eO7ZPrt3IysStk9gjofBuHRY22Zc31gd20pp9GvrnhQk+AIM4ia0
	DlJItPfNtBkC5gf8YAyrT7aKxGI3Pt/SHux06frzyn7yQn4kZ/1OSPbpqwVlsCA9appCx1u59RIpb
	gbXfJv+qnZOknM6WxnPVGkIFP2i/3pMw/2FfKGyP7ASmKX3hHGe6nSe1Vn/yBAPokz2Ke+/mwaEF1
	x4gvM0Q2S1fadCSZ/wl8N9q1IXqydHT6pJ1r9dlPD9rCmGmQO1JJ7jnxJ7V/Yx+UkOjwCEqBfDPvs
	GqdsCrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRcS-0000000D95E-2NFh
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 17:02:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRMa-0000000D5Cr-1kRb
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 16:46:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7XbKG010489;
	Tue, 19 Nov 2024 16:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vlJvG730gygx5McVjoi1/8
	8ZhVN8drGvUk3A94EcRyk=; b=J+Qrgqm7tSZz374CPbYcg9UoXQn7SzsUpv1nqy
	v13krBioxEp/qSjlvxn8p+lu45r46ujrJWIiasYoP1PhzZoOHfXJk7VnL5c65eKt
	SY0ct530tBAJUKEZzbtOKigttouJPC6Bc15ThmNR0XrVgK/uMxjE6+zVGdKWBA7k
	FP5SO/m4EF5DBgW7BnP15CGlhqtMcMFsQGgb4PtRuT/y1Nz+0h1bZFn/M0W/wNSG
	fgeSsmIwUTV/nNX35CmhZnWs+SaTq4oMI0f66Xa+cMtNb+ScHUaBw5VdRUk5FyYF
	LhdwlwnP0qjyxI2lFqFwCcrvGnNIIxoEHzW2eEOCS5XNOAHQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y9353e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 16:46:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJGk190004361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 16:46:01 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 08:45:59 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH] wifi: ath12k: Fix endianness issue in struct hal_tlv_64_hdr
Date: Tue, 19 Nov 2024 22:15:16 +0530
Message-ID: <20241119164516.756478-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: onQRulFWjw1UA2zrSnREwye8T-fNFPYe
X-Proofpoint-GUID: onQRulFWjw1UA2zrSnREwye8T-fNFPYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 suspectscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084604_570824_0FD2CDD3 
X-CRM114-Status: GOOD (  14.29  )
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

struct hal_tlv_64_hdr has a 64-bit member that should be in little-endian
format, but the current definition uses host byte order. Fix this by
changing the definition and updating the corresponding helper functions
used for the byte order conversion.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c    |  2 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h |  2 +-
 drivers/net/wireless/ath/ath12k/hal_rx.c   | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 9ae579e50557..0fb39c174475 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3912,7 +3912,7 @@ void ath12k_dp_rx_process_reo_status(struct ath12k_base *ab)
 	ath12k_hal_srng_access_begin(ab, srng);
 
 	while ((hdr = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
-		tag = u64_get_bits(hdr->tl, HAL_SRNG_TLV_HDR_TAG);
+		tag = le64_get_bits(hdr->tl, HAL_SRNG_TLV_HDR_TAG);
 
 		switch (tag) {
 		case HAL_REO_GET_QUEUE_STATS_STATUS:
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 739f73370015..a460d432288f 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -581,7 +581,7 @@ struct hal_tlv_hdr {
 #define HAL_TLV_64_HDR_LEN		GENMASK(21, 10)
 
 struct hal_tlv_64_hdr {
-	u64 tl;
+	__le64 tl;
 	u8 value[];
 } __packed;
 
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index f7c1aaa3b5d4..ac17d6223fa7 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -26,8 +26,8 @@ static int ath12k_hal_reo_cmd_queue_stats(struct hal_tlv_64_hdr *tlv,
 {
 	struct hal_reo_get_queue_stats *desc;
 
-	tlv->tl = u32_encode_bits(HAL_REO_GET_QUEUE_STATS, HAL_TLV_HDR_TAG) |
-		  u32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
+	tlv->tl = le64_encode_bits(HAL_REO_GET_QUEUE_STATS, HAL_TLV_HDR_TAG) |
+		  le64_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_get_queue_stats *)tlv->value;
 	memset_startat(desc, 0, queue_addr_lo);
@@ -59,8 +59,8 @@ static int ath12k_hal_reo_cmd_flush_cache(struct ath12k_hal *hal,
 		hal->current_blk_index = avail_slot;
 	}
 
-	tlv->tl = u32_encode_bits(HAL_REO_FLUSH_CACHE, HAL_TLV_HDR_TAG) |
-		  u32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
+	tlv->tl = le64_encode_bits(HAL_REO_FLUSH_CACHE, HAL_TLV_HDR_TAG) |
+		  le64_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_flush_cache *)tlv->value;
 	memset_startat(desc, 0, cache_addr_lo);
@@ -97,8 +97,8 @@ static int ath12k_hal_reo_cmd_update_rx_queue(struct hal_tlv_64_hdr *tlv,
 {
 	struct hal_reo_update_rx_queue *desc;
 
-	tlv->tl = u32_encode_bits(HAL_REO_UPDATE_RX_REO_QUEUE, HAL_TLV_HDR_TAG) |
-		  u32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
+	tlv->tl = le64_encode_bits(HAL_REO_UPDATE_RX_REO_QUEUE, HAL_TLV_HDR_TAG) |
+		  le64_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_update_rx_queue *)tlv->value;
 	memset_startat(desc, 0, queue_addr_lo);

base-commit: 0ea161de5e5afa1323e982adc8f59bf4af99a84b
-- 
2.34.1


