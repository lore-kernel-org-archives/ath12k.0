Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CD0C47DDF
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 06:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrScs2RbdafVSLlMHk+yxNPPxf2zTQJl7K6yElPPvu4=; b=MiqCtGVmURiFu0F/Vd/fWWyzGd
	QJSsXq829Rqv8WbV+kVi8yHzdABesMhaHWIMhrSl8kPbagPCkrOQuaj/H2kckpuhqbwoPANqyzmLY
	5ODzCoukqAsGppcpkO7dH5aFLLVYwYiRP1poaT1i4ai1vjd0d9ixmAEhoDrf0j4N6cYSKWeVgvn7t
	DuKr+ZSKp1JnlgWO+DSccNMD1MGH1hELdYYZQPquIgqe3X86nxl8kZVRS7O4shI1fni5SEe0zfg3c
	EuSzeavkrOpaB77pMv9Zg9Qq7ZsLL596VVNhQDr7jrsWILn+Eju8IxkmjAroSG5GpR3zUI5i/KlS/
	r8tupL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULae-0000000BYx5-3kn2
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 06:57:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULaZ-0000000BYvM-3ilq
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 06:57:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T3sXO5005136;
	Mon, 29 Jan 2024 06:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=mrScs2RbdafVSLlMHk+yxNPPxf2zTQJl7K6yElPPvu4=; b=TX
	MIneqM1oqU+A2b+M0YbRRzMYFY1ocPRFnRcEbJ68wwjOH6hjNaJw7YlGVkrHpwIm
	riyowvI7SltQU4DuvHVs8Yi02a52TjmeJR4IItFB6M5nDZrITEGT5MJjeKxoajlq
	RAu1C/7Gqoxnb9A9um2yFhPxRXOVCFFoX4J8unprW1Cea8sb89ULQhOwsOyKSJ13
	8V8zX392W7uDkDOoOEia+4RlqYMuFAon3tgOuoEm+/Tm+SQmYyEd+mjKDgLY0BA0
	hoxKNFTFl6MBnlcsrLkzABuKnBm/foDELW5h3kWkFnRBBkP4hT2/jY8Iemlsub4K
	cDiLbCKcOMALukU0opig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx3rqgb9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:57:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T6vmWB006260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:57:48 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 28 Jan 2024 22:57:46 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 01/13] wifi: ath12k: indicate NON MBSSID vdev by default during vdev start
Date: Mon, 29 Jan 2024 12:27:12 +0530
Message-ID: <20240129065724.2310207-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SNvpmacX0mkAHJqOOHj1xvti8xHpSvkC
X-Proofpoint-ORIG-GUID: SNvpmacX0mkAHJqOOHj1xvti8xHpSvkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_03,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=762 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401290049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_225752_093437_372B7478 
X-CRM114-Status: GOOD (  17.26  )
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

From: Sriram R <quic_srirrama@quicinc.com>

When any VDEV is started, MBSSID flags are passed to firmware to
indicate if its a MBSSID/EMA AP vdev. If the interface is not an AP
or if the AP doesn't support MBSSID, the vdev needs to be brought up
as a non MBSSID vdev. Set these flags as a non MBSSID AP by default
which can be updated as and when MBSSID support is added in ath12k.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 drivers/net/wireless/ath/ath12k/wmi.h | 8 ++++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a27480a69b27..672c9d347097 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6153,6 +6153,11 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
 	arg.pref_tx_streams = ar->num_tx_chains;
 	arg.pref_rx_streams = ar->num_rx_chains;
 
+	/* Fill the MBSSID flags to indicate AP is non MBSSID by default
+	 * Corresponding flags would be updated with MBSSID support.
+	 */
+	arg.mbssid_flags = WMI_VDEV_MBSSID_FLAGS_NON_MBSSID_AP;
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		arg.ssid = arvif->u.ap.ssid;
 		arg.ssid_len = arvif->u.ap.ssid_len;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 2fa724e5851a..5f1cce16589f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1024,6 +1024,7 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, struct wmi_vdev_start_req_arg *arg,
 	cmd->regdomain = cpu_to_le32(arg->regdomain);
 	cmd->he_ops = cpu_to_le32(arg->he_ops);
 	cmd->punct_bitmap = cpu_to_le32(arg->punct_bitmap);
+	cmd->mbssid_flags = cpu_to_le32(arg->mbssid_flags);
 
 	if (!restart) {
 		if (arg->ssid) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 06e5b9b4049b..d8481c710021 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_WMI_H
@@ -2764,6 +2764,10 @@ struct ath12k_wmi_ssid_params {
 
 #define ATH12K_VDEV_SETUP_TIMEOUT_HZ (5 * HZ)
 
+enum wmi_vdev_mbssid_flags {
+	WMI_VDEV_MBSSID_FLAGS_NON_MBSSID_AP	= BIT(0),
+};
+
 struct wmi_vdev_start_request_cmd {
 	__le32 tlv_header;
 	__le32 vdev_id;
@@ -2782,7 +2786,7 @@ struct wmi_vdev_start_request_cmd {
 	__le32 cac_duration_ms;
 	__le32 regdomain;
 	__le32 min_data_rate;
-	__le32 mbssid_flags;
+	__le32 mbssid_flags; /* uses enum wmi_vdev_mbssid_flags */
 	__le32 mbssid_tx_vdev_id;
 	__le32 eht_ops;
 	__le32 punct_bitmap;
-- 
2.34.1


