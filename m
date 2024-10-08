Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45751CED279
	for <ath12k@archiver.kernel.org>; Tue,  8 Oct 2024 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ckqb/NAI8TIZI38O82g/lLOXipO79LZ85NWqQ+Cclw=; b=Gjz4EJjhkK2MoCETVtlmIBr9TD
	bT6Y/Rl0Q+CQFon/uMoSIZ0kchLpU/J2SAgvovlCbgK/uQYvryaNFe2PxRudjNHabZ6nfq66u+rGe
	HHGB87osooMJv80zFkeIvEwluQgroGBHWXxO7ddFVpXxjfXLrgYf8dZSm5sixZx01gSvX3f3zliqf
	0h5uBynqgPXp7tcazA7dv3SF9BaXbnu0LMyBnZI1ik9yXTavPVKnn6KoAcIgq7xZXsfHyThFK3FTx
	rk8jnaJsTBupsc5ny5P/PCRcNjziCWFBgl0uRiw8+UgYlnUtG0v+sUd7R6GTUFJNb4v734fOALceS
	ZnmJVI5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4yN-00000004rz7-479S
	for ath12k@archiver.kernel.org;
	Tue, 08 Oct 2024 07:49:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4lK-00000004ogq-4A6a
	for ath12k@lists.infradead.org;
	Tue, 08 Oct 2024 07:36:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984Sd6O008709;
	Tue, 8 Oct 2024 07:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Ckqb/NAI8TIZI38O82g/lLOXipO79LZ85NWqQ+Cclw=; b=DAnzgR8iJECvo5tP
	rc/0r1PYCO5eAeqAiFdMQw1z80Va5skbnZ/4tP1/VkEQZIB7ycZqSEH9qwVylR/X
	bz92diWZxmNPgqpyqFiuCCk7Nt3eo7SugQ9EE7DmKAS33gSDD1ufymFafRRPTel4
	ekr7ZtXWvSj1GsnWfvVcbIQxqVl1lwRv4iZjN+/+Gq9J6mNE5VOaYG+EFpXrGsk7
	HIykPVA9DZDoXHr8WOO8UkzniuQfhlndCNSVVvG88zJjOfYhxN+2Ao9WhQOWHfhW
	M9ETiD3b3TkjSTS3s6no1QI319Dw7s1PR2I0BtEYkWJvrNdli3yhv7bq6IZwSiwC
	/qLZLw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc0cg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 07:36:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4987a5Dl028027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 07:36:06 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 00:36:04 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 04/11] wifi: ath12k: fix struct hal_rx_ppdu_start
Date: Tue, 8 Oct 2024 15:35:27 +0800
Message-ID: <20241008073534.1195-5-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241008073534.1195-1-quic_kangyang@quicinc.com>
References: <20241008073534.1195-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rY6YIx7k5hO7BDCs3Lx03a8NIx4RLsPz
X-Proofpoint-ORIG-GUID: rY6YIx7k5hO7BDCs3Lx03a8NIx4RLsPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=557 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003607_060980_B375FC88 
X-CRM114-Status: GOOD (  10.13  )
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

Current struct hal_rx_ppdu_start in hal_rx.h is not matched with
hardware descriptor definition.

So update this structure and related code.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 16 ++++++++++++----
 drivers/net/wireless/ath/ath12k/hal_rx.h | 11 ++++++++---
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 516089bd3562..95f4507179c4 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -590,12 +590,20 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		struct hal_rx_ppdu_start *ppdu_start =
 			(struct hal_rx_ppdu_start *)tlv_data;
 
+		u64 ppdu_ts = __le32_to_cpu(ppdu_start->ppdu_start_ts_31_0) |
+			(u64)(__le32_to_cpu(ppdu_start->ppdu_start_ts_63_32)) << 32;
+
 		info[0] = __le32_to_cpu(ppdu_start->info0);
 
-		ppdu_info->ppdu_id =
-			u32_get_bits(info[0], HAL_RX_PPDU_START_INFO0_PPDU_ID);
-		ppdu_info->chan_num = __le32_to_cpu(ppdu_start->chan_num);
-		ppdu_info->ppdu_ts = __le32_to_cpu(ppdu_start->ppdu_start_ts);
+		ppdu_info->ppdu_id = u32_get_bits(info[0],
+						  HAL_RX_PPDU_START_INFO0_PPDU_ID);
+
+		info[1] = __le32_to_cpu(ppdu_start->info1);
+		ppdu_info->chan_num = u32_get_bits(info[1],
+						   HAL_RX_PPDU_START_INFO1_CHAN_NUM);
+		ppdu_info->freq = u32_get_bits(info[1],
+					       HAL_RX_PPDU_START_INFO1_CHAN_FREQ);
+		ppdu_info->ppdu_ts = ppdu_ts;
 
 		if (ppdu_info->ppdu_id != ppdu_info->last_ppdu_id) {
 			ppdu_info->last_ppdu_id = ppdu_info->ppdu_id;
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 837ba4adba88..6ab33d5f1b2a 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -156,6 +156,7 @@ struct hal_rx_mon_ppdu_info {
 	u32 preamble_type;
 	u32 mpdu_len;
 	u16 chan_num;
+	u16 freq;
 	u16 tcp_msdu_count;
 	u16 tcp_ack_msdu_count;
 	u16 udp_msdu_count;
@@ -232,12 +233,16 @@ struct hal_rx_mon_ppdu_info {
 	u8 medium_prot_type;
 };
 
-#define HAL_RX_PPDU_START_INFO0_PPDU_ID		GENMASK(15, 0)
+#define HAL_RX_PPDU_START_INFO0_PPDU_ID			GENMASK(15, 0)
+#define HAL_RX_PPDU_START_INFO1_CHAN_NUM		GENMASK(15, 0)
+#define HAL_RX_PPDU_START_INFO1_CHAN_FREQ		GENMASK(31, 16)
 
 struct hal_rx_ppdu_start {
 	__le32 info0;
-	__le32 chan_num;
-	__le32 ppdu_start_ts;
+	__le32 info1;
+	__le32 ppdu_start_ts_31_0;
+	__le32 ppdu_start_ts_63_32;
+	__le32 rsvd[2];
 } __packed;
 
 #define HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR	GENMASK(26, 16)
-- 
2.34.1


