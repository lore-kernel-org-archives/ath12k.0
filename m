Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ECFE7718D
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 05:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFrVouoZJE5sNGsqx7EQ/XEuKq3ILIQQSORZqrL3xGg=; b=XeMtjm+g+D5MFrvmGu3xidCO8u
	nSBhaW6BKoowYHmQpfB8a2XQKIi6VlnkmRAGIZC48bAoUvsW+ja9K595X8wPyoJ2u1UMKFt6lKce/
	uK/EvAoPQfiO3pEoKKOCRaH+mzFlU/kn7gMDoIw2+vhN+NRIh4L/pVcjmqfGjlEjLfhE0MzjUPz/d
	x21BTbXwz/hKQyWQ++QyVwJyTEa9+1GX7pyxp6T/efiPl95pdAOzkStO7kUDjg0Z9Tqipn5F2sYCl
	Pg4R1vmOPMSDz9lDOrVQMKCvgM5xd7p7eskk64vN5yQGBxbulls2cdGg8BRZT4rn98T05xX4lCYW+
	diIpvqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOrxD-00000006aLr-0tsK
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 05:23:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOrxA-00000006aJu-2yis
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 05:23:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL4BsP5009153;
	Sat, 21 Dec 2024 05:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFrVouoZJE5sNGsqx7EQ/XEuKq3ILIQQSORZqrL3xGg=; b=X1DZUaiMcYUj8xwr
	mGjCMVnJ5k60JZO5yeMKXg6VYzCNIkax3/700Ls29cy5AEWnw9UrdNJDa2R2mbWn
	X4xAjAsrZdakSNYv5fxJEKZXGu/1qLMlss6ARF7aCNPr0ylQ28BbqVPHH5sX4YcY
	XZ3yn6LMn3HfcwA1Glfckur1BtcXPqx8umUXMZXHym+mlfRpmWxS2zZqbdunDFrp
	y3r+419j/pYtWK9ZdGLKNrs+pV23Jz8SgkPh5gltzcK6Rqh+zC9DB8FtEBdNde0L
	PGM82uZdWhBkz8TYYKTFGFkdcpoYAf6MGeklokiRRobs46r48CYajbNnhwgVOKb3
	oi5v6A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43npeh86fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 05:23:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL5N37V004386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 05:23:03 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 21:23:01 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 04/10] wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support
Date: Sat, 21 Dec 2024 10:49:13 +0530
Message-ID: <20241221051919.686500-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221051919.686500-1-quic_periyasa@quicinc.com>
References: <20241221051919.686500-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E4vHxR02GzAh4NIhNxJxRRDoe0ebiBVh
X-Proofpoint-ORIG-GUID: E4vHxR02GzAh4NIhNxJxRRDoe0ebiBVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412210043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_212304_765490_81DE9EC5 
X-CRM114-Status: GOOD (  11.47  )
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
index b29ba554508f..a024a07bd704 100644
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


