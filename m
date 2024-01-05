Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEF2C3DA6E
	for <ath12k@archiver.kernel.org>; Fri,  5 Jan 2024 19:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2baOOMEcCNuxdPIZgrBHsy+xXy4qJwoQPTheR2NM/j4=; b=FQTHAQKyyizaw6//tGprxMtTU5
	Nni94RtnIaHoCIDRyT5mWr9uxWtF/Y68qa82VyM/Ilw3ye1pcHwhRCYT2z9g7/dhKRaE95oEDnXPI
	7VC6B84CP4KzQZc7aJnkXcI7lEM2Ab/t2HQ3ilfMATmHnI6Z7RC2dDvUiqUlZ4VH0iOxY5D40YqOY
	Dncu8tlUPgBc7SYmrofIEKadXdgoke8HZkyxTwa6EoV/1pica1Zb32nOafqm/dPQCOdeBay58TVAC
	iwPIOtvwyf4OMpehx31rrkMY1T5fDytmGz5SMFb/iDSSYvi3DRkqifvB7hkyCpfwOMgm2X9Mx3KYQ
	hUn8vDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLqJp-0008hg-2D
	for ath12k@archiver.kernel.org;
	Fri, 05 Jan 2024 19:57:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLqJm-0008dk-1K
	for ath12k@lists.infradead.org;
	Fri, 05 Jan 2024 19:57:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 405FQne9026443;
	Fri, 5 Jan 2024 19:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=2baOOMEcCNuxdPIZgrBHsy+xXy4qJwoQPTheR2NM/j4=; b=HV
	+q+9U3XyrGSpN9ri0Pxh5QHoBVOiqd9s5SX5BanoKwcGXKsAvBztit3fVIdV8bqm
	3lNU1x6GAENGzcYLiP8qd8f+UJDQTMeqA20UMq7g+3mr47prPWo8712zh6sTKEiC
	fvK6t2LLjfg627CSoRSaxcE0yoWy0FNhQNep8RXEZi7eE3v6RuTWDN7Ua8pQ2tGP
	q5LML5QpxFG5xauOOjwPEm9X+xmIo/qqmBRUE7UVJs4PVk2ilj2pbbOWvwzt8f9W
	YpLWuntBuoglz5AluGLf67lhATzeIOfvtLyJUZmkr1hwBhLYFVt+ZBZ+EV+UoNte
	7fEalQG8xffGl+78B3pA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve9a3t5mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 19:57:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405Jv0vE031788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jan 2024 19:57:00 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 5 Jan 2024 11:56:58 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 01/12] wifi: ath12k: indicate NON MBSSID vdev by default during vdev start
Date: Sat, 6 Jan 2024 01:26:28 +0530
Message-ID: <20240105195639.3217739-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com>
References: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l70wOiC0Y6l3snyFR-z4idL03tQoYYPW
X-Proofpoint-ORIG-GUID: l70wOiC0Y6l3snyFR-z4idL03tQoYYPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=775 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401050161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_115722_484931_29E92E44 
X-CRM114-Status: GOOD (  16.84  )
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

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 ++++++-
 drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
 drivers/net/wireless/ath/ath12k/wmi.h | 8 ++++++--
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88cec54c6c2e..71e4fc3cbba3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -5995,6 +5995,11 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
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
index 11cc3005c0f9..fd5b0a7b00e8 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
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


