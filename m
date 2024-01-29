Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517AEC47422
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vs0eZlldsOW6GO89KmiRSQUxPj3n/kM9Y24RP8nN2u4=; b=lV8QA3px4khSFXNCR5tdrfaGwF
	Ezjjtu55dXVRI3MvnZWmtcN7szhLJYY593Y9Wbpq9WcvrCIftB8igsJTJLEl2jvK4RKTsS6Mv45WP
	RXvkpgQbteOsLDkzMEzt7ZY6NPZ4G6jF+9TCGNNuOrte9PujfOunN6QEZeS/LQQXaJo0K14rzcqSO
	ZXL9Vjrw6lRlgrirGzfluD3n8+58t8alSGYEQyOxOvFo5X+4Mf6hrB6jpS5ayNoqcxO1lHuaJnmaK
	tXBOnb26FfRG3v6mxkiT1HX4uSorA5IRFBGJfySLjYvntZ1rLb12f9Fh5Wm+4TydJ3kZhy/Lneqzo
	Wn+ZlA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOft-0000000CBei-42bo
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 10:15:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOfq-0000000CBar-1r2N
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 10:15:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T56D0g023912;
	Mon, 29 Jan 2024 10:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=vs0eZlldsOW6GO89KmiRSQUxPj3n/kM9Y24RP8nN2u4=; b=io
	79VaUPFeU5EzaGFsY3gMFpIJLy/e0funrNcrrD4oXVF0hmsjOfD+QrdGjR5F9wNc
	4mIWzYC8Lk8Av3nQSOCaI2t3MxD99zxOWIYgTHpQAWQQvUgmUCnBiQ4WnN2x33ce
	k/YH6NkDFK8QKXRFfQYrkB09f2fB4AUb+oi51AJVK2WGSttP+FqTsyXL6vmm1mOU
	bWMUlMyMS52f1hpWHDERgAD1gjZOb8m8cTqBw3c3KvjKr66hOfW4d1eeGOXtm45n
	LpuOh4qm2NYsJ0SXkVaMulelN60ZayVY9q31T7ci0AbhVb1R3l9vqUd1W5kH7nMC
	HQLj/rxnbr6+iVxK7i9A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvqhmuj2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:15:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40TAFTCl020510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:15:29 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 02:15:27 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 11/11] wifi: ath12k: advertise P2P dev support for WCN7850
Date: Mon, 29 Jan 2024 18:14:53 +0800
Message-ID: <20240129101453.368494-12-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129101453.368494-1-quic_kangyang@quicinc.com>
References: <20240129101453.368494-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wtX_236sYhXmsNSoHWlf1Qgfr8lW_fwr
X-Proofpoint-ORIG-GUID: wtX_236sYhXmsNSoHWlf1Qgfr8lW_fwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_06,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=605
 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_021530_513394_3791DFE2 
X-CRM114-Status: GOOD (  14.22  )
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

Now that all the necessary pieces are implemented we can enable P2P
support for WCN7850.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v5: no change.
v4: no change.
v3: no change.
v2:
    1. add Tested-on tag of QCN9274.
    2. update copyright.

---
 drivers/net/wireless/ath/ath12k/hw.c  | 7 +++++--
 drivers/net/wireless/ath/ath12k/mac.c | 8 ++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index cbb6e2b6d826..b804d9f88a1b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/types.h>
@@ -953,7 +953,10 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.vdev_start_delay = true,
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
-				   BIT(NL80211_IFTYPE_AP),
+				   BIT(NL80211_IFTYPE_AP) |
+				   BIT(NL80211_IFTYPE_P2P_DEVICE) |
+				   BIT(NL80211_IFTYPE_P2P_CLIENT) |
+				   BIT(NL80211_IFTYPE_P2P_GO),
 		.supports_monitor = false,
 
 		.idle_ps = true,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6b8b92d22553..1632cd3322fa 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5745,17 +5745,25 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 	case NL80211_IFTYPE_UNSPECIFIED:
 	case NL80211_IFTYPE_STATION:
 		arvif->vdev_type = WMI_VDEV_TYPE_STA;
+		if (vif->p2p)
+			arvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_CLIENT;
 		break;
 	case NL80211_IFTYPE_MESH_POINT:
 		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH_11S;
 		fallthrough;
 	case NL80211_IFTYPE_AP:
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
+		if (vif->p2p)
+			arvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_GO;
 		break;
 	case NL80211_IFTYPE_MONITOR:
 		arvif->vdev_type = WMI_VDEV_TYPE_MONITOR;
 		ar->monitor_vdev_id = bit;
 		break;
+	case NL80211_IFTYPE_P2P_DEVICE:
+		arvif->vdev_type = WMI_VDEV_TYPE_STA;
+		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_DEVICE;
+		break;
 	default:
 		WARN_ON(1);
 		break;
-- 
2.34.1


