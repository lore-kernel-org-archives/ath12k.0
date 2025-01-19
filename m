Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F065C02183
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myZvWjl/7vDXay/+Hv53bv1NPiOpNFQQeYViAK8TOZI=; b=RH4ZEf6c3R5UFNE5EyHUBDaaoO
	zyNVBl2QMmqEntdksVnDuKj5asyxkGggpfHz/n6MN/OK52jHaLRjEuHefwiDAEH2JhJ2URbTbkmd8
	yf+k3Adj6t9hdcAtcOnwh9BziM6eIfu/ST2AlHWKRoEGeb4wUCzGb2NeZ6HIcuXNSsOwMtgk10w6G
	6btZlNJs4eGWCbf6SZW4XOC0J604HK4V+vkMctNxptNGGvp2dkyGfmfyoz/uk4WWpebewuAXdUnos
	GsndVIzkN4dDAQ8GRXQFJH2UpIgMDOjBBI3WVUE46ypxPCnl94wVOAxpsqrtR1p6hhj6cARz8rc2T
	f9o/RXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZVom-00000003y26-3MlE
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 13:58:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZVoj-00000003xzL-3cZx
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 13:58:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JCv5k9007532;
	Sun, 19 Jan 2025 13:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myZvWjl/7vDXay/+Hv53bv1NPiOpNFQQeYViAK8TOZI=; b=IdZBGU3y1N6FjhM1
	B/o8aMXh2Fzfs1yU1pA1iWshyWsxI19HUIiPDyy3ygOOkwDcUNtJ6B6BYi8FhrNU
	B5IzQL7A7jbHmBfvIyw1/vtOUYKSpmz+qmutMc3JaCnOwUBcftTBBJsxzXq3nQww
	lU4c+OVL7VnXsrp1FMcb2/Zyc/PAZOc0Qc1Pbzyq4+yHw1WoBN8Q0tS1u7b7Rj58
	3jFUD22wCLVEp+X1ZiV7QHh3VHKSGgvDo7jVSsdL171sQXYb1wZvDlh+80h4+NZT
	BX67ZIMz5XyWZoCSvSsHmUnnQh0lO56CQBp9S5FIbA4UHrY66bdN6vzcxsZ/0nvY
	J4UYAQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448wnf0axg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 13:58:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JDwKYu028754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 13:58:20 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 05:58:18 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v3 04/10] wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support
Date: Sun, 19 Jan 2025 19:27:45 +0530
Message-ID: <20250119135751.2221902-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119135751.2221902-1-quic_periyasa@quicinc.com>
References: <20250119135751.2221902-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iQqaBqffJx2wpeB38_3_psIkeUlbK9uJ
X-Proofpoint-ORIG-GUID: iQqaBqffJx2wpeB38_3_psIkeUlbK9uJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_055822_051271_53305099 
X-CRM114-Status: GOOD (  11.80  )
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

Currently, monitor is not enabled. However, in the future, the monitor
will be enabled. Therefore, add the necessary HAL_PHYRX_OTHER_RECEIVE_INFO
TLV parsing support in the monitor Rx path, which helps to populate the
extended Rx statistics.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 7 +++++++
 drivers/net/wireless/ath/ath12k/hal_rx.h | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f9de8c509061..8ded73d87c73 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1630,6 +1630,13 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 					     HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RX_BW);
 		break;
 	}
+	case HAL_PHYRX_OTHER_RECEIVE_INFO: {
+		const struct hal_phyrx_common_user_info *cmn_usr_info = tlv_data;
+
+		ppdu_info->gi = le32_get_bits(cmn_usr_info->info0,
+					      HAL_RX_PHY_CMN_USER_INFO0_GI);
+		break;
+	}
 	case HAL_RX_PPDU_START_USER_INFO:
 		ath12k_dp_mon_hal_rx_parse_user_info(tlv_data, userid, ppdu_info);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 9411b2f1caed..5099399a047c 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -683,6 +683,14 @@ struct hal_rx_resp_req_info {
 #define HAL_RX_MPDU_ERR_MPDU_LEN		BIT(6)
 #define HAL_RX_MPDU_ERR_UNENCRYPTED_FRAME	BIT(7)
 
+#define HAL_RX_PHY_CMN_USER_INFO0_GI		GENMASK(17, 16)
+
+struct hal_phyrx_common_user_info {
+	__le32 rsvd[2];
+	__le32 info0;
+	__le32 rsvd1;
+} __packed;
+
 #define HAL_RX_EHT_SIG_NDP_CMN_INFO0_SPATIAL_REUSE	GENMASK(3, 0)
 #define HAL_RX_EHT_SIG_NDP_CMN_INFO0_GI_LTF		GENMASK(5, 4)
 #define HAL_RX_EHT_SIG_NDP_CMN_INFO0_NUM_LTF_SYM	GENMASK(8, 6)
-- 
2.34.1


