Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A66E7718A
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 00:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mQSRfnWmcbm954WJglRcWKAdR0wI1ssuOnoCXGUcN8=; b=k9In7naq+gYtZrGXTgQDTrT979
	d4zG5Ql4CQsVl/gx3P6g8EDCAnDcC1kRwQkEflHgyXxYj437i7joalCEpG2XQzaqFggS9oe6N7Xg+
	29u2U1tyEpgUH7CEDOQZG1+J9FV1UH5qBHZyhHVxno346xSrbWRsJrjGK4m2sOY90y9h1RE4bv/w1
	OxkHUUwNmZqzLDm2l5s7daNbZHr7WAYOOUCVXxzbSx0QojgIgxEHbsbQ/ti8psrytm2/tA2B+H9C6
	aBAJvG5BSgChxMdB4da/N/MFOqtzs5ZhnzcmCQ3YKFaqF38FJz//xC6yDtyu8AXCxpmbVcJZIO9AV
	EOW5Ayzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO47g-00000000P7Y-3hSe
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 00:10:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO47d-00000000P5Q-1mbg
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 00:10:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGQvmq013076;
	Thu, 19 Dec 2024 00:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mQSRfnWmcbm954WJglRcWKAdR0wI1ssuOnoCXGUcN8=; b=j4qUoTdIY2jeHwQ/
	+AcY3DA8unjWUUxlSU3bANtWHNzF8hzix7TsnZcXD49ZkFr6mTJ/LUd0V+LhA+hS
	dwm4WccYr1dKmJhigLzL7POx87cVa0ezO6tX0SFQVASYtnxB6S7l1MmWr5vIIK+P
	tJjihD8WFwQQpBSJiNGvdyjmAsyrHSfgtY2Rzn9vhr9f74WvPWBba06RyIXN6VWx
	uWs9ck4MDaSMn7Uw3lb+Lwscx+HKE7jiffONny1iTpmLeF2DSG5j23FHlaRlMVb1
	97lYVQxTuJYYVDrVakbULH3lAv5b+Cknq9qqz/+dj8YbHsOB5AQKSxalnRMGi6Jm
	NLttLg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kyjx9cfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 00:10:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ0AWht016823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 00:10:32 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 16:10:30 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 3/3] wifi: ath12k: Refactor Rx status TLV parsing procedure argument
Date: Thu, 19 Dec 2024 05:40:06 +0530
Message-ID: <20241219001006.1036495-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
References: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TjRHxDoDC6fbfxTVadc8nOT4NO85JC2l
X-Proofpoint-GUID: TjRHxDoDC6fbfxTVadc8nOT4NO85JC2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_161033_749846_610F1546 
X-CRM114-Status: GOOD (  14.10  )
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

Currently, ath12k_dp_mon_rx_parse_status_tlv() takes the TLV tag, TLV data
and TLV userid as separate arguments from the caller. These argument can
be fetched from the TLV header itself. Therefore, pass the TLV header and
retrieve the necessary fields from the header instead of passing them from
the caller.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index ae2f6847bc88..53f8e8f8959a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -565,12 +565,16 @@ static void ath12k_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *
 static enum hal_rx_mon_status
 ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 				  struct ath12k_mon_data *pmon,
-				  u32 tlv_tag, const void *tlv_data,
-				  u32 userid)
+				  const struct hal_tlv_64_hdr *tlv)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
-	u32 info[7];
+	const void *tlv_data = tlv->value;
+	u32 info[7], userid;
+	u16 tlv_tag;
+
+	tlv_tag = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_TAG);
+	userid = le64_get_bits(tlv->tl, HAL_TLV_64_USR_ID);
 
 	switch (tlv_tag) {
 	case HAL_RX_PPDU_START: {
@@ -1187,7 +1191,6 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k *ar, struct ath12k_mon_data *pmon,
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
 	struct hal_tlv_64_hdr *tlv;
 	enum hal_rx_mon_status hal_status;
-	u32 tlv_userid;
 	u16 tlv_tag, tlv_len;
 	u8 *ptr = skb->data;
 
@@ -1196,9 +1199,6 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k *ar, struct ath12k_mon_data *pmon,
 	do {
 		tlv = (struct hal_tlv_64_hdr *)ptr;
 		tlv_tag = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_TAG);
-		tlv_len = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_LEN);
-		tlv_userid = le64_get_bits(tlv->tl, HAL_TLV_64_USR_ID);
-		ptr += sizeof(*tlv);
 
 		/* The actual length of PPDU_END is the combined length of many PHY
 		 * TLVs that follow. Skip the TLV header and
@@ -1208,10 +1208,11 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k *ar, struct ath12k_mon_data *pmon,
 
 		if (tlv_tag == HAL_RX_PPDU_END)
 			tlv_len = sizeof(struct hal_rx_rxpcu_classification_overview);
+		else
+			tlv_len = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_LEN);
 
-		hal_status = ath12k_dp_mon_rx_parse_status_tlv(ar, pmon,
-							       tlv_tag, ptr, tlv_userid);
-		ptr += tlv_len;
+		hal_status = ath12k_dp_mon_rx_parse_status_tlv(ar, pmon, tlv);
+		ptr += sizeof(*tlv) + tlv_len;
 		ptr = PTR_ALIGN(ptr, HAL_TLV_64_ALIGN);
 
 		if ((ptr - skb->data) >= DP_RX_BUFFER_SIZE)
-- 
2.34.1


