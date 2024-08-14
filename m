Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E148C3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsQmLkCCJ7EGh1Yc1vgDhvoJKL1nGzJzdm896rIsz1s=; b=dkU4tv6GfvD1dy48f9Zw9YDZtH
	Yx/Vun/DeO1RE/MUC/6jJBELrr51G8pwkqkMDssLgWG6yCQPfMhcz7olkgOSRmRacL4jzV8XTTYxJ
	iwdlGZygOsE76lK3I7HZzixr75CH/JWauXI5O6DTmzP/rIIOP1Ky1UyipewpM8XB6AeCsj8w0UAxH
	x+379iGUEzp/aCUKms2j1fbLy3pcc9MMWBg/PeDkYA3w+Lg3o7OV/KtQa3yHiMvUWtFLtMbJ2iwIn
	0fM37i8UTvCWDeKMnEgKl3fKwpa36qb11o7kibJRALpBiaYByfsfOiG56Dfkp6Qgyt9FheDC78e7a
	YaxnbAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAYr-00000006Rkq-00Bd
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 09:44:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAYo-00000006Ril-3fZo
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 09:44:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNFd8w021210;
	Wed, 14 Aug 2024 09:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsQmLkCCJ7EGh1Yc1vgDhvoJKL1nGzJzdm896rIsz1s=; b=oWudwYOCfrbB5sVq
	85Yg7oH9XlXTkDONpfhxe3hAP8p0y3C1L5bvcba8XkVnHIRy6FPuy6FLsWNmWz37
	CNp+kjyBaV2PLcUdm5R54vvGKQ1B3ZIeZNvF0azsPVQnTb6CwNZ0xTVCEyHzz1Jg
	+SIt95F4XJyKz23PoF3UdvMfkDCJE4o6fM/3JFpaUXYZs2EN5WzXI8WjkjPyrnCy
	rT9h+916ORPi843pO29j20uJJgSaeXGsAhcgHi3tdY4RwhW1JEuDTIcB+Faf+wiM
	ITlaUOZLSImX/NmSfAqrtkuwG1AP53FVO6heE011wskK6yPMoAzZBkIm1vKVkl1m
	rnMGHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4jpk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 09:44:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E9iq7Z017494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 09:44:52 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 02:44:50 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [RFC PATCH 15/18] wifi: ath12k: add support to read board_id from device-tree
Date: Wed, 14 Aug 2024 15:13:20 +0530
Message-ID: <20240814094323.3927603-16-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
References: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SAsRXV78RIfxn9y2nu01ClWwHTtLG_30
X-Proofpoint-GUID: SAsRXV78RIfxn9y2nu01ClWwHTtLG_30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_024455_116515_F5F28171 
X-CRM114-Status: GOOD (  14.21  )
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

Currently, QMI target board_id is read from firmware during QMI
target capability request. If the board_id is not fused in WiFi
device, firmware responds with the default board id (0xFF). Due to
this, "board-2.bin" board data download fails if "board-2.bin" does
not have board data for the default board id (0xFF).

Hence, add support to read board_id from device-tree. If the board_id
is not fused in WiFi device, use device-tree to read board_id.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 7a039659dbec..428d081f722f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2566,7 +2566,8 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 	struct qmi_wlanfw_cap_req_msg_v01 req = {};
 	struct qmi_wlanfw_cap_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
-	unsigned int board_id = ATH12K_BOARD_ID_DEFAULT;
+	struct device *dev = ab->dev;
+	u32 board_id = ATH12K_BOARD_ID_DEFAULT;
 	int ret = 0;
 	int r;
 	int i;
@@ -2606,9 +2607,13 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 	}
 
 	if (resp.board_info_valid)
-		ab->qmi.target.board_id = resp.board_info.board_id;
-	else
-		ab->qmi.target.board_id = board_id;
+		board_id = resp.board_info.board_id;
+	if (board_id == ATH12K_BOARD_ID_DEFAULT || ~board_id == 0)
+		of_property_read_u32(dev->of_node, "qcom,board_id", &board_id);
+	if (board_id == ATH12K_BOARD_ID_DEFAULT || ~board_id == 0)
+		ath12k_warn(ab, "unable to read board_id, using default board_id: 0x%x\n",
+			    board_id);
+	ab->qmi.target.board_id = board_id;
 
 	if (resp.soc_info_valid)
 		ab->qmi.target.soc_id = resp.soc_info.soc_id;
-- 
2.34.1


