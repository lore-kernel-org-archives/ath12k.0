Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD65C04FFF
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JXAacMTMQaCuQzTPyfwtP75RKbMKWC6TA3Y06Alg20=; b=z8v9scyLB0rdCwam7IV+qH2KVM
	HMlmYq5lvhkI+3ODSXxBk9nGCnfY3k69bn6TtLRD687m/lAw+eR5PtZURUf+VORiR8hg9zbRZyibi
	Yn1MJIsu4GMNxj3nUfCkJBthzG0Imv5ZXM3ijNQ0wMFueqAJD3o54a2WF6gaSsdE52owH+rdBZ+/C
	zHpziFivn1MYG5oLso/NvpjIK5h0MwknjH8vM4CxNb9fMZQhV8cowu2El/FwQE8ybEPanK42asoW2
	CM0BoQQyA/JOYuHdoGfSK4qjSVa9mTvE1jLVGWjFu1hdXljaXkFyLRVtX1CyHNCPrnkpueAaSe57S
	XyYz67Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRJe-00000002GVq-0xv4
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 12:56:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRJa-00000002GU4-178W
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 12:56:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43ICGNeJ017589;
	Thu, 18 Apr 2024 12:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=+JXAacMTMQaCuQzTPyfwtP75RKbMKWC6TA3Y06Alg20=; b=Hn
	VaEOiCQXj2GKUu/nleFB9Ib8v2+CCfJdDAiJi6xMBkHN0x/+r/98QrjnXMcKyQHC
	gu1xTflmI+2fKfTH4Um7+h/cE70Jmdl/EYsKkTmIc5OFdm4NILvVjkr3i/2fdL1n
	3AcdE82G9P+hBBuHOMiSSxmMTaKMeHrRXjEhIo6GVHe5mj4//hvbkp26BHEjarLK
	BA6bPT+6UqF53OMTPts3FVxZLvXRpIDbGYyMPLvaF2z9GZU299xUIA3RhVABARDp
	6+Aih+wUtgesDZsTQRfqNSgCYjKloGRxpslip/NaBISeXCxIEkr69KSmtxebG29+
	PKkPHqBDpbyCJkldt11w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xk3chg2k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 12:56:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43ICuW8s019442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 12:56:32 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 18 Apr 2024 05:56:30 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: set mlo_capable_flags based on QMI PHY capability
Date: Thu, 18 Apr 2024 18:26:09 +0530
Message-ID: <20240418125609.3867730-3-quic_rajkbhag@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 4coWxWJUt3_4Fzyx4KVrP5_lCJYtWPvQ
X-Proofpoint-GUID: 4coWxWJUt3_4Fzyx4KVrP5_lCJYtWPvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_11,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404180091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_055634_584445_1501DD6B 
X-CRM114-Status: GOOD (  15.12  )
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

Currently, mlo_capable_flags is set to zero if dualmac device is
detected based on One Time Programmable (OTP) register value.
This is not generic and in future dualmac devices may support
Single Link Operation (SLO) and Multi Link Operation (MLO).

Thus, set mlo_capable_flags based on 'single_chip_mlo_support'
parameter from QMI PHY capability response message from the firmware.
Also, add check on mlo_capable_flags to disable MLO parameter in the
host capability QMI request message.

If the firmware does not respond with this optional parameter
'single_chip_mlo_support' in QMI PHY capability response, default
ab->mlo_capable_flags is used.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c |  1 -
 drivers/net/wireless/ath/ath12k/qmi.c | 16 +++++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index fd519c87ae24..50b9e44504f7 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -385,7 +385,6 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 				   "failed to read board id\n");
 		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
 			dualmac = true;
-			ab->mlo_capable_flags = 0;
 			ath12k_dbg(ab, ATH12K_DBG_BOOT,
 				   "dualmac fw selected for board id: %x\n", board_id);
 		}
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index a555839dae8e..a286715f98fb 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2023,6 +2023,12 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	u8 hw_link_id = 0;
 	int i;
 
+	if (!(ab->mlo_capable_flags & ATH12K_INTRA_DEVICE_MLO_SUPPORT)) {
+		ath12k_dbg(ab, ATH12K_DBG_QMI,
+			   "intra device MLO is disabled hence skip QMI MLO cap");
+		return;
+	}
+
 	if (!ab->qmi.num_radios || ab->qmi.num_radios == U8_MAX) {
 		ab->mlo_capable_flags = 0;
 
@@ -2144,9 +2150,6 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 	struct qmi_txn txn;
 	int ret;
 
-	if (!ab->mlo_capable_flags)
-		goto out;
-
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_phy_cap_resp_msg_v01_ei, &resp);
 	if (ret < 0)
@@ -2171,6 +2174,13 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 		goto out;
 	}
 
+	if (resp.single_chip_mlo_support_valid) {
+		if (resp.single_chip_mlo_support)
+			ab->mlo_capable_flags |= ATH12K_INTRA_DEVICE_MLO_SUPPORT;
+		else
+			ab->mlo_capable_flags &= ~ATH12K_INTRA_DEVICE_MLO_SUPPORT;
+	}
+
 	if (!resp.num_phy_valid) {
 		ret = -ENODATA;
 		goto out;
-- 
2.34.1


