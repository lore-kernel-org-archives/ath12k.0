Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786F9E7719A
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 18:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuL47M1for2c/QOKdekNeBafxNagdLpOIgONFtsDLZ8=; b=o/X7VrbMxOl5Hz5n5FxdtnKODa
	ZsfOGCKXwOWLfpzXp/jV0x/R5UWs3LBFjSihTRV1Y83mpRYqjSbgGdLwc7Zq6NwejH8C4XFpXL1Kx
	Z1Yms9IhMA6yQV+EkpDCN4/PT+Nio08vHL3a/RAPrtYycxdVzqinyXVHk4xO0iLGiDEr03qiR83Ps
	oe5jhG6nhYSIqOxZOVChFnlnscc1mu2PJVM0fJ0Gwn1uwHY8eIYAYOl4F8YS5Opc+wldXh4Wfs0fk
	ivyMw9a+Nvxk4cfBcI+VCI24dq4bzQw770kbEZDoDmZNDsXQEB025ndduKU2O6M8EenufF0gQJEon
	wuD2gA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxYZ-0000000D1Lw-11tG
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 18:46:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxVB-0000000D0rs-3O2A
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 18:43:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509Bd5KR001556;
	Thu, 9 Jan 2025 18:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VuL47M1for2c/QOKdekNeBafxNagdLpOIgONFtsDLZ8=; b=MvDEniMXlHxtdLDF
	zK5JIGngiL7smk/QXmQi5iCO4cYZTZeM2UkvFQAWrq4/X4/fKEzGyfipdHbPy4ox
	5UsSl9KusHJe68dOvykXruEpr+VNJwtVexj4/9pxys/EdrAtzge4P0C6lq8B+Xsb
	er750bKJmbteLszl72RIg4A5uJwUUthikBhBNLDSwbO45y+YgBN80vB/3H690Bq1
	H8yvMJk9niPLC13yMO5tyz55ZQ2ggveaYpzTT6l4o17Fl0xE82LOxtECrqFg64Yg
	mz8TM5DXD/9zFMrEwtXPBONAdCKpT2EWao7yy0r4jyX1aLPW08geUU+riOKHHXg2
	6FZhbQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442drws1ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 18:43:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509IhNw4018529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 18:43:23 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 10:43:21 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Fri, 10 Jan 2025 00:13:12 +0530
Subject: [PATCH 1/2] wifi: ath12k: relocate
 ath12k_mac_ieee80211_sta_bw_to_wmi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250110-fix_link_sta_bandwidth_update-v1-1-61b6f3ef2ea3@quicinc.com>
References: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
In-Reply-To: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LBh6YBUakcd7Ivn_PzD9-b0y9J72nCu1
X-Proofpoint-GUID: LBh6YBUakcd7Ivn_PzD9-b0y9J72nCu1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_104329_976374_164819C1 
X-CRM114-Status: GOOD (  13.12  )
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

An upcoming change will invoke ath12k_mac_ieee80211_sta_bw_to_wmi() from a
line located above its current definition. Hence, relocate it to above
so that it can be invoked later on.

No functionality changes. Compile tested only.

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 64 +++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 48d110e2a7ded61c4094b0ce7e5bbb50b94d5cd4..750b41ec29e2c329fe98b7b717ec183fd6807eb0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -3138,6 +3138,37 @@ static int ath12k_setup_peer_smps(struct ath12k *ar, struct ath12k_link_vif *arv
 					 ath12k_smps_map[smps]);
 }
 
+static u32 ath12k_mac_ieee80211_sta_bw_to_wmi(struct ath12k *ar,
+					      struct ieee80211_sta *sta)
+{
+	u32 bw = WMI_PEER_CHWIDTH_20MHZ;
+
+	switch (sta->deflink.bandwidth) {
+	case IEEE80211_STA_RX_BW_20:
+		bw = WMI_PEER_CHWIDTH_20MHZ;
+		break;
+	case IEEE80211_STA_RX_BW_40:
+		bw = WMI_PEER_CHWIDTH_40MHZ;
+		break;
+	case IEEE80211_STA_RX_BW_80:
+		bw = WMI_PEER_CHWIDTH_80MHZ;
+		break;
+	case IEEE80211_STA_RX_BW_160:
+		bw = WMI_PEER_CHWIDTH_160MHZ;
+		break;
+	case IEEE80211_STA_RX_BW_320:
+		bw = WMI_PEER_CHWIDTH_320MHZ;
+		break;
+	default:
+		ath12k_warn(ar->ab, "Invalid bandwidth %d in rc update for %pM\n",
+			    sta->deflink.bandwidth, sta->addr);
+		bw = WMI_PEER_CHWIDTH_20MHZ;
+		break;
+	}
+
+	return bw;
+}
+
 static void ath12k_bss_assoc(struct ath12k *ar,
 			     struct ath12k_link_vif *arvif,
 			     struct ieee80211_bss_conf *bss_conf)
@@ -5409,37 +5440,6 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 	return ret;
 }
 
-static u32 ath12k_mac_ieee80211_sta_bw_to_wmi(struct ath12k *ar,
-					      struct ieee80211_sta *sta)
-{
-	u32 bw = WMI_PEER_CHWIDTH_20MHZ;
-
-	switch (sta->deflink.bandwidth) {
-	case IEEE80211_STA_RX_BW_20:
-		bw = WMI_PEER_CHWIDTH_20MHZ;
-		break;
-	case IEEE80211_STA_RX_BW_40:
-		bw = WMI_PEER_CHWIDTH_40MHZ;
-		break;
-	case IEEE80211_STA_RX_BW_80:
-		bw = WMI_PEER_CHWIDTH_80MHZ;
-		break;
-	case IEEE80211_STA_RX_BW_160:
-		bw = WMI_PEER_CHWIDTH_160MHZ;
-		break;
-	case IEEE80211_STA_RX_BW_320:
-		bw = WMI_PEER_CHWIDTH_320MHZ;
-		break;
-	default:
-		ath12k_warn(ar->ab, "Invalid bandwidth %d in rc update for %pM\n",
-			    sta->deflink.bandwidth, sta->addr);
-		bw = WMI_PEER_CHWIDTH_20MHZ;
-		break;
-	}
-
-	return bw;
-}
-
 static int ath12k_mac_assign_link_sta(struct ath12k_hw *ah,
 				      struct ath12k_sta *ahsta,
 				      struct ath12k_link_sta *arsta,

-- 
2.34.1


