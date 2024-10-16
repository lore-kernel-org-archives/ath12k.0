Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B04D206A5
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 07:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCzamOmM54smxihbV3UXPmSDdgC8JIUJYRBoNKSP21U=; b=Rz3/iTVfggj1rKegfyKAgWs0iE
	/AvEvbmQuYUL8kDQPt+xdUwKMWbuGNbqxay2GWRWrzLc/taCWV0bAlO7+mrBjbna0amUno0Hi2KsK
	lCL303e1EIEbSFXtNc+BFY5idIZ8EEas5bYveDrygJCSG5t1Elr0nwpP31pz+lsaZOxBnG0kSzBwr
	UuHfYEW0D4R0h6Vv0s10GY2zalS9EiHKa+cC3/Mtsoqzsh0c5UUMAFguUPqzxjgRf4VpeG4K+1RDb
	0fM/cXt9djvj3BPxIBhYGkescMF17AYcDJ2CylmwZZD9nguC5m+L/bsFstiRMVgoX2zGiqfu5qM4V
	K6mzEf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y1q-0000000AlfY-1adk
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 07:01:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xyN-0000000Akh0-3rT3
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 06:57:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G2Lpvm029360;
	Wed, 16 Oct 2024 06:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hCzamOmM54smxihbV3UXPmSDdgC8JIUJYRBoNKSP21U=; b=o4uviXJufSy/pOkB
	wiBuEjkJp7o/Oqfw1dFDE4IsD4W9YMFfO5RTA+ZLhgO0d2oBh5Z/FoE4o/y3/W3B
	Fb54XKL9atJUbiIcODFpXDBViFx0kdjZhukOC1w+yetQSOFlZih/pGYdHbJ7bRPm
	uw/xAKMG+dEt2Kn287jbgqYGnaW1X0Y48g+4cb/SIkwgBha8nkHk0IgC8bAcWZTg
	XicZXb5LMektVVtGmI0ynrP4/FXJYDsKdiS9twbvxmngB5G2DlvT2d3jnSkqWces
	Xxtq4WpGiadkZ8vdXdkHfenstHxwxKP0FWDsOFHMP798/47uCyzDPBjcz6DS2Uuz
	FjpIkg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429k7w3sah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 06:57:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G6vURQ028877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 06:57:30 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 23:57:29 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v3 04/11] wifi: ath12k: fix struct hal_rx_ppdu_start
Date: Wed, 16 Oct 2024 14:56:53 +0800
Message-ID: <20241016065700.1090-5-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241016065700.1090-1-quic_kangyang@quicinc.com>
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fP5Ovz0nQ_i9xibiApz-wjuafP0nf3-W
X-Proofpoint-ORIG-GUID: fP5Ovz0nQ_i9xibiApz-wjuafP0nf3-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=1
 lowpriorityscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=543 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410160044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235731_985321_22A9D9B0 
X-CRM114-Status: GOOD (  10.78  )
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
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 16 ++++++++++++----
 drivers/net/wireless/ath/ath12k/hal_rx.h | 11 ++++++++---
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 8d0d3c849c90..d40da3a059c6 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -593,12 +593,20 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
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


