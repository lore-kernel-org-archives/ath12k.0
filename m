Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C2BCCD18A
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 21:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OyrjX9M+eaDDKGCBcaZ9qXgXVQoupo9+BYaim7sEa4=; b=H7JlcmAjccKg4tblStaphGEzid
	gjlvb44sozA9a79JRjAuh60UUGblaWVWZGsjTTDRahIRIqf/Vkfrh+xT6bOubcr2hb+F7nX32pv1i
	d91WzfO5wZxFkS0pieyft9gyVFeT07AKCdY1W83qETz6chQyHu1xE/DAy104kYZkeLl7a3S3ilC/x
	jxjhXHCR5wulUGaPtDLk3n2SIggpAqR6lT/KCU6xmoRnLXMHiYwWX6xSWh7bKfU0zhJg8Miuh2wLP
	57Ui/UaiEWixanh92mPwVm0NxDFBxqaXjbKQXWiOlEWbMNuJPPYmvzLYFWLFYef5ZmkWAnzFHbwae
	Y6z1GFzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y0j-000000078QR-1BU3;
	Thu, 09 Oct 2025 21:17:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y0f-000000078ON-0fmI
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 21:17:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599GZU9l031740;
	Thu, 9 Oct 2025 21:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OyrjX9M+eaDDKGCBcaZ9qXgXVQoupo9+BYaim7sEa4=; b=MKh5oHhEHV0gyjCI
	wdwTU0kf1U1NOiBJ7iHAHp1ODKl1aXgS/phHjGMYeKHhbLS9klFW0v/Z02IWJJex
	Ybi/JlePVGwBT6fEPnFDKfWd5BOyjUPdnitjZmoQV1gFy2Dh0lDm9K+mUmnn8rs3
	wKEdsBLF6y8UlauixejIZ7sdtl6pecdT3ZWfp1u1gpQgr/hpEY2PrfhvNzSg1fIc
	gO0+7hkHBtDjp4juSHygHIuXhAOcdxUu0rdEwssgxJ2yk0oELskOTSNDdaAZMRa5
	qaDYyDHJJ2PLHRe+URn0BFZoDbqhXmocQ47v/MQlm/vY+S/SwdxJfR3MxwbhhxBY
	3/aj3w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0t96b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 21:17:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599LHAh0021772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 21:17:10 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 9 Oct 2025 14:17:09 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [ath-next V17 1/2] wifi: ath12k: fix VHT MCS assignment
Date: Thu, 9 Oct 2025 14:16:55 -0700
Message-ID: <20251009211656.2386085-2-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
References: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e82657 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=6RPXMQUKQ7Vie2blHvEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Hj-y1GsTEkTAcJmveiwZGCnwvnwYk2K3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfXx+dd8nQa/Ej9
 5AENKTYoVEXHC6d54DZoaKb25iAgnVakhNuM+Dbqlx0zmZBN2OxefZpWLlqAa3faGlBkVDmJAkM
 +5/A7LqvJPWsli2MPLbULkBrxdCVXOW9QkrwlBapZpK7HYjOH/FKuVjOyBagh5ymPo3ONtIrv5S
 O4Iwd8K41KjclfVmTWouDpvVqbA5cwNbSwwNe93cJfq29SZk+fXwf0xiT3c4YUDwehC8Si5PeYr
 KxZD+ZGp8WQ5f2dd0QQBmqu4kqYCiD/rD+AWJyPFo44nhrOjjFPGhUJ2jGZHXbLlYyMgPZ7Jm1P
 FelWuD7N1Td4V9Ppl6Wo+Iei4JW34ts4WhMKKxVBJ/G+9K+tpE1A5maBoyvdMybx45a/cD8hQ/p
 oHXyq3JH4zo1u8/Vs4QvraQJVu5mQA==
X-Proofpoint-ORIG-GUID: Hj-y1GsTEkTAcJmveiwZGCnwvnwYk2K3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_141713_319963_49C9B00D 
X-CRM114-Status: GOOD (  15.36  )
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

From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

While associating, firmware needs the peer's receive capability
to calculate its own VHT transmit MCS. Currently, the host
sends this information via mcs->rx_mcs_set field, but firmware
actually reads it from mcs->tx_mcs_set field. This mismatch is
incorrect.

This issue has not caused failures so far because most peers
advertise identical TX and RX capabilities. Fix this by
assigning the value to tx_mcs_set as expected.

Additionally, the rate control mask is intended to limit our
transmit MCS, so it should also apply to the peer's receive
capability. Update the logic accordingly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c |  7 +++----
 drivers/net/wireless/ath/ath12k/wmi.c | 13 ++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.h |  4 +++-
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1d7b60aa5cb0..0d425a1bc0ab 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2249,7 +2249,6 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 	struct cfg80211_chan_def def;
 	enum nl80211_band band;
 	u16 *vht_mcs_mask;
-	u16 tx_mcs_map;
 	u8 ampdu_factor;
 	u8 max_nss, vht_mcs;
 	int i, vht_nss, nss_idx;
@@ -2340,10 +2339,10 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 	arg->peer_nss = min(link_sta->rx_nss, max_nss);
 	arg->rx_max_rate = __le16_to_cpu(vht_cap->vht_mcs.rx_highest);
 	arg->rx_mcs_set = __le16_to_cpu(vht_cap->vht_mcs.rx_mcs_map);
-	arg->tx_max_rate = __le16_to_cpu(vht_cap->vht_mcs.tx_highest);
+	arg->rx_mcs_set = ath12k_peer_assoc_h_vht_limit(arg->rx_mcs_set, vht_mcs_mask);
 
-	tx_mcs_map = __le16_to_cpu(vht_cap->vht_mcs.tx_mcs_map);
-	arg->tx_mcs_set = ath12k_peer_assoc_h_vht_limit(tx_mcs_map, vht_mcs_mask);
+	arg->tx_max_rate = __le16_to_cpu(vht_cap->vht_mcs.tx_highest);
+	arg->tx_mcs_set = __le16_to_cpu(vht_cap->vht_mcs.tx_mcs_map);
 
 	/* In QCN9274 platform, VHT MCS rate 10 and 11 is enabled by default.
 	 * VHT MCS rate 10 and 11 is not supported in 11ac standard.
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ff6b3d4ea820..e76275bd6916 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
@@ -2367,10 +2367,13 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	cmd->peer_bw_rxnss_override |= cpu_to_le32(arg->peer_bw_rxnss_override);
 
 	if (arg->vht_capable) {
-		mcs->rx_max_rate = cpu_to_le32(arg->rx_max_rate);
-		mcs->rx_mcs_set = cpu_to_le32(arg->rx_mcs_set);
-		mcs->tx_max_rate = cpu_to_le32(arg->tx_max_rate);
-		mcs->tx_mcs_set = cpu_to_le32(arg->tx_mcs_set);
+		/* Firmware interprets mcs->tx_mcs_set field as peer's
+		 * RX capability
+		 */
+		mcs->rx_max_rate = cpu_to_le32(arg->tx_max_rate);
+		mcs->rx_mcs_set = cpu_to_le32(arg->tx_mcs_set);
+		mcs->tx_max_rate = cpu_to_le32(arg->rx_max_rate);
+		mcs->tx_mcs_set = cpu_to_le32(arg->rx_mcs_set);
 	}
 
 	/* HE Rates */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index a8c3190e8ad9..4d620501179f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_WMI_H
@@ -4218,8 +4218,10 @@ struct wmi_unit_test_cmd {
 struct ath12k_wmi_vht_rate_set_params {
 	__le32 tlv_header;
 	__le32 rx_max_rate;
+	/* MCS at which the peer can transmit */
 	__le32 rx_mcs_set;
 	__le32 tx_max_rate;
+	/* MCS at which the peer can receive */
 	__le32 tx_mcs_set;
 	__le32 tx_max_mcs_nss;
 } __packed;

base-commit: 94aced6ed9e2630bae0b5631e384a5302c4b6783
-- 
2.43.0


