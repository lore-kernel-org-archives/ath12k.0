Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDE5C4345F
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTNe+FVQjOMyTUkjet102IyEgdKaxB/3ZRF28LVTWiE=; b=v1rJ/phygfoqPbmdG+SO+k8CJX
	TvX3R9Gvs+98EdMwNHasSrz8/NsMnIq/iNyS05ArShPTrPhu7pgoAMffPrB0rm/NdFzPkRbs2x3kG
	01Q7o7tryOm01qs3SVWs4m4iIvJ4dypPvwEjKd0yhibItHxAB1pR5kJQPzUfYBPDWm9nfVxsR0olC
	Y19vAPOs1EPVUWMzXVmy9Vh5JMvn+xybFGuZH6+DbBPgFVQm4+0b1S3MYHZqJC16bSIgSA2rt7K1q
	D/ia//cjnZ2SDMIPGi3UC4SKLVKkLxREMAEUTvq+WvmHfJcUeREd1fE3z54aJyjdic7Sj6IiXlGIZ
	15UtEOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRJc-00000002GV0-1PCc
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 12:56:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRJZ-00000002GTZ-2DwT
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 12:56:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43ICkuk4010626;
	Thu, 18 Apr 2024 12:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=HTNe+FVQjOMyTUkjet102IyEgdKaxB/3ZRF28LVTWiE=; b=gd
	sPfyG4gUTn5Uhb47QZ0FpVBHkRE2YjKjColXPGbsUAkHK4iD7Hx7UfcrVFTDujGg
	upbQOqdzbV2uCxYrESNr1/x8VZxIZKYPfDbiAStyOCYuMKvHPi1U58Sa4HBx5miu
	WS740OSv/Zd7RxIGPlB1yJR+gxaY5dx0ExhrFzuNhUA5cUaEd58h0tuJFzs3NWQi
	vxqilu2zny9gnqrl6k+QODLpBj2znSUFlyenGr71EXa30VfhJVkjdwsX8uEAEz7L
	5t00mPLeWaYicQw9F/THcfBDgT5RYXvzx9Wv9GaTPVWV+h6MrgpjrJjy9Gwl2R8c
	U+WSrm1xmP/xTSmXfW5g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xk3tx80m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 12:56:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43ICuUA6025104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 12:56:30 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 18 Apr 2024 05:56:28 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH 1/2] wifi: ath12k: read single_chip_mlo_support parameter from QMI PHY capability
Date: Thu, 18 Apr 2024 18:26:08 +0530
Message-ID: <20240418125609.3867730-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418125609.3867730-1-quic_rajkbhag@quicinc.com>
References: <20240418125609.3867730-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WWOvBe2xdGqkRJQ7N34JExCKfl6rPTc2
X-Proofpoint-ORIG-GUID: WWOvBe2xdGqkRJQ7N34JExCKfl6rPTc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_11,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_055633_597499_76638BF8 
X-CRM114-Status: GOOD (  14.16  )
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

New parameter 'single_chip_mlo_support' was added in QMI PHY
capability response message. This is an optional parameter added
in QCN9274 firmware. This parameter states if the firmware
supports Single-Link Operation (SLO) and Multi-Link Operation (MLO)
within the same device.

If single_chip_mlo_support = 1, then intra device SLO/MLO is supported
in the firmware.
If single_chip_mlo_support = 0, then intra device SLO/MLO is not
supported in the firmware.

Hence, add support to read 'single_chip_mlo_support' parameter from
the QMI PHY capability response message.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 24 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h |  2 ++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index db8ba5fec2ae..a555839dae8e 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -582,6 +582,24 @@ static const struct qmi_elem_info qmi_wlanfw_phy_cap_resp_msg_v01_ei[] = {
 		.offset		= offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
 					   board_id),
 	},
+	{
+		.data_type      = QMI_OPT_FLAG,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = 0x13,
+		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   single_chip_mlo_support_valid),
+	},
+	{
+		.data_type      = QMI_UNSIGNED_1_BYTE,
+		.elem_len       = 1,
+		.elem_size      = sizeof(u8),
+		.array_type     = NO_ARRAY,
+		.tlv_type       = 0x13,
+		.offset         = offsetof(struct qmi_wlanfw_phy_cap_resp_msg_v01,
+					   single_chip_mlo_support),
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -2160,9 +2178,11 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 
 	ab->qmi.num_radios = resp.num_phy;
 
-	ath12k_dbg(ab, ATH12K_DBG_QMI, "phy capability resp valid %d num_phy %d valid %d board_id %d\n",
+	ath12k_dbg(ab, ATH12K_DBG_QMI,
+		   "phy capability resp valid %d num_phy %d valid %d board_id %d valid %d single_chip_mlo_support %d\n",
 		   resp.num_phy_valid, resp.num_phy,
-		   resp.board_id_valid, resp.board_id);
+		   resp.board_id_valid, resp.board_id,
+		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support);
 
 	return;
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 6ee33c9851c6..f7a5eb11ce44 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -265,6 +265,8 @@ struct qmi_wlanfw_phy_cap_resp_msg_v01 {
 	u8 num_phy;
 	u8 board_id_valid;
 	u32 board_id;
+	u8 single_chip_mlo_support_valid;
+	u8 single_chip_mlo_support;
 };
 
 #define QMI_WLANFW_IND_REGISTER_REQ_MSG_V01_MAX_LEN		54
-- 
2.34.1


