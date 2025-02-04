Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A015AC0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 03:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5QBix7AsQn2ULTrB/Y2F41o5gHnawPDWjrWrg7lu8g=; b=QU2ZBfLVIuUpPnDB9W/ZPEpVgP
	fPP1GIE6CuEc1FqPvWLOo+zE44bLjxq3CDzmSOsWqrUk840rm8WGKYcE1qFTfToOhBAYGLC1wSGFm
	cgd3q/Hz0F5h6UjpG200AMqKkygQRjJGa3TrSSKwTdY4M25578s7nFz7yuAhq5II+AbJsb951dy2o
	Ov76pCe0TeVg4ddmOJDEd4Wa0ukgNnmd/IWp9kWWXLg9K+EdY1b4d7irHaJYQro45hZKUe25nfL9x
	kk5VT2Qc5Viji7WTLFV2FpynAPzo3YCJZGyWwblZn/avdtAK6RW3HfNIBIf4hcZHPko6KvWn4QBDC
	/SZ2MGng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA4S-0000000HCiV-1bcP
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 03:57:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA4P-0000000HCgV-1a0s
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 03:57:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141afYR003947;
	Tue, 4 Feb 2025 03:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5QBix7AsQn2ULTrB/Y2F41o5gHnawPDWjrWrg7lu8g=; b=YJQ1DGDQU9Etekx6
	adJTyfcsBmcE/LhA2ydke+PRxr+VqwL5dBCh4rcXIaTGKKlV3Jm5MTktZOVj9LxV
	pC5DJkKGWRlDR9ls9a8Hzhqlv4J9tD7KZUVefmCygI5zjYNnTreyp7f20POtYVFX
	tWpDCmkZf+bMQvEpKN7in75PsmOWAwwB211u7GxKzaInTMZFk+HnXScxlt22Sl/H
	oIy7iwmaY6gP+riYiNXQU0J29+YJbQzNCodYebdvuzRdksGvWh+LZbwn390/8QtC
	yhFbI8eEAIwhps5Kif+vgSv9YPAYipzLN8YORy8Y2odEWHAiE7Eq7iB1MVQwMqO4
	2dssSQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k9cn07ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 03:57:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5143vqo9008480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 03:57:52 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Feb 2025 19:57:50 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Balamurugan Mahalingam
	<quic_bmahalin@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Vasanthakumar Thiagarajan
	<vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH v8 7/9] wifi: ath12k: Add EHT MCS support in Extended Rx statistics
Date: Tue, 4 Feb 2025 09:27:16 +0530
Message-ID: <20250204035718.3227726-8-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
References: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 604q6AWgdHGxPAS-LMub53wCbWNMk05-
X-Proofpoint-ORIG-GUID: 604q6AWgdHGxPAS-LMub53wCbWNMk05-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 mlxlogscore=831 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195753_414816_93D90662 
X-CRM114-Status: GOOD (  11.36  )
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

From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>

Currently, EHT MCS information is not populated. Therefore, add the EHT
MCS counter array to the peer rate statistics and update the EHT MCS
statistics from the status TLV data in the monitor Rx path. In the future,
this information will be used in the peer extended Rx statistics dump.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h   | 2 ++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 57e71ccbbb67..45bb243f2258 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -360,6 +360,7 @@ struct ath12k_vif_iter {
 #define HAL_RX_MAX_MCS_HT	31
 #define HAL_RX_MAX_MCS_VHT	9
 #define HAL_RX_MAX_MCS_HE	11
+#define HAL_RX_MAX_MCS_BE	15
 #define HAL_RX_MAX_NSS		8
 #define HAL_RX_MAX_NUM_LEGACY_RATES 12
 #define ATH12K_RX_RATE_TABLE_11AX_NUM	576
@@ -369,6 +370,7 @@ struct ath12k_rx_peer_rate_stats {
 	u64 ht_mcs_count[HAL_RX_MAX_MCS_HT + 1];
 	u64 vht_mcs_count[HAL_RX_MAX_MCS_VHT + 1];
 	u64 he_mcs_count[HAL_RX_MAX_MCS_HE + 1];
+	u64 be_mcs_count[HAL_RX_MAX_MCS_BE + 1];
 	u64 nss_count[HAL_RX_MAX_NSS];
 	u64 bw_count[HAL_RX_BW_MAX];
 	u64 gi_count[HAL_RX_GI_MAX];
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index a9a012b81bfc..cdc5e2c19f39 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -3028,6 +3028,12 @@ static void ath12k_dp_mon_rx_update_peer_su_stats(struct ath12k *ar,
 		rx_stats->byte_stats.he_mcs_count[ppdu_info->mcs] += ppdu_info->mpdu_len;
 	}
 
+	if (ppdu_info->preamble_type == HAL_RX_PREAMBLE_11BE &&
+	    ppdu_info->mcs <= HAL_RX_MAX_MCS_BE) {
+		rx_stats->pkt_stats.be_mcs_count[ppdu_info->mcs] += num_msdu;
+		rx_stats->byte_stats.be_mcs_count[ppdu_info->mcs] += ppdu_info->mpdu_len;
+	}
+
 	if ((ppdu_info->preamble_type == HAL_RX_PREAMBLE_11A ||
 	     ppdu_info->preamble_type == HAL_RX_PREAMBLE_11B) &&
 	     ppdu_info->rate < HAL_RX_LEGACY_RATE_INVALID) {
-- 
2.34.1


