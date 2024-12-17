Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8796BE77188
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAut43IuP/A7AVHj0rE4T9lsDbBgl+BoYq0hKnTTbAE=; b=uMXGdwfEALRUBzNBIZlYgmrGhI
	ppGsovfAymn2SDxcyTewdAjz+Td58zzZBudqZ+8PHThe6uw99tpbqOrhRc1qCWPEe0KMuDt/edSKz
	hxpAsO7kbrh15EY8c7HBRtSLVAnhCmbTS54g1FCOvSIrveaR50Toh+WofJzGkU35tYr6tvh+1J1R0
	dBLwlDtiP2HuqITHdHGRQ3ly7FGFiYzX2p9sbISVd6fRCfhh0r0yW4jU7BkOhsWmFHgNpUvVHZBR6
	TSPbIDUN5EmHdP2CCtM/KglX+RU+E8ji3ewcFshYsgzehbBh1YFxT1Cv32eLg3zkfc4k6JVEuZVRG
	XBAK9fpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTJ8-0000000CmJM-12Wl
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 08:51:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTD0-0000000Ckkm-2abS
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 08:45:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMBguO019255;
	Tue, 17 Dec 2024 08:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAut43IuP/A7AVHj0rE4T9lsDbBgl+BoYq0hKnTTbAE=; b=Amrzpx2fiBJTrhyO
	+dlKkEjOQAJA1jon1FxwMRyGzqiQZ1tKzoIIXnOUyADmoIUEP/GF7yTgxHuChuWu
	fMsrRizynFAJz6JBZoDr6K6osqpUPRL3894a3Vpp5o6HyrzQKlqtgjTsJqLxiP9j
	1IE4buvQD43l7sJHwppSovF2LthNdL1azUqsctyVbk6AXKgQHZIWpz3pQDK4iKb3
	QXtbOP4cNsXcaRsntMiVMheWnP8mOmiH5XlpyttcjnLd0SbuCf3RAl70y+p9eWiY
	Ct5MBW/t5VaH/rEYmtJgT+QBoiqPleY2ZzPCa67L1YFGKfOLsGrrP1BwVCQTB0ep
	gx6p5g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jvs819hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH8jaek031348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 08:45:36 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 00:45:34 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 5/8] wifi: ath12k: fix incorrect TID updation in DP monitor status path
Date: Tue, 17 Dec 2024 14:15:08 +0530
Message-ID: <20241217084511.2981515-6-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BJKRAAVANEQ_HKiL1qt_QEEjQ2-QJTV3
X-Proofpoint-ORIG-GUID: BJKRAAVANEQ_HKiL1qt_QEEjQ2-QJTV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=623 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004538_767226_04FD2A9B 
X-CRM114-Status: GOOD (  11.12  )
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

Currently, an incorrect TID value gets populated in the monitor status Rx
path due to an incorrect bitmap value given to the ffs() built-in helper
function. Therefore, avoid the decrement and directly provide the TID
bitmap to the ffs() built-in helper function for the correct TID update
in the monitor status Rx path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 2d53404095d6..25486917d6b5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -617,6 +617,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 	case HAL_RX_PPDU_END_USER_STATS: {
 		struct hal_rx_ppdu_end_user_stats *eu_stats =
 			(struct hal_rx_ppdu_end_user_stats *)tlv_data;
+		u32 tid_bitmap;
 
 		info[0] = __le32_to_cpu(eu_stats->info0);
 		info[1] = __le32_to_cpu(eu_stats->info1);
@@ -629,10 +630,9 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 			u32_get_bits(info[2], HAL_RX_PPDU_END_USER_STATS_INFO2_AST_INDEX);
 		ppdu_info->fc_valid =
 			u32_get_bits(info[1], HAL_RX_PPDU_END_USER_STATS_INFO1_FC_VALID);
-		ppdu_info->tid =
-			ffs(u32_get_bits(info[6],
-					 HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP)
-					 - 1);
+		tid_bitmap = u32_get_bits(info[6],
+					  HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP);
+		ppdu_info->tid = ffs(tid_bitmap) - 1;
 		ppdu_info->tcp_msdu_count =
 			u32_get_bits(info[4],
 				     HAL_RX_PPDU_END_USER_STATS_INFO4_TCP_MSDU_CNT);
-- 
2.34.1


