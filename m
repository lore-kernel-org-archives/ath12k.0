Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388C9C47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 08:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yp1GrzFAhJmTEfF0DH8+vf/AoRSU8H2Ic5Gx8W+xIB0=; b=cL09GjMeWRgW1pMwluVyvC2vF1
	rJ7FVzzOoKrgUrkP6icjcbn9e3aeo32MLoLM1OnQxD2BEwIn1UEjeRU2xH2cgV1ehsHwx8wTqNRby
	DMm0IGl3M8/1R66IfOmLUy1wWbqijdNSQZffBdXa4CsWaRp54k+7HJO2IUe+0AeRhBZ8YpEodtwKo
	vp4DERq9USbduOWA6nLvBZ55+pHE8hTFuS6yXzFGdcSR8KpG8q1cyGn9gDbJFS/Q5GmyM9buVEx67
	1g56/QwxsGXMr0mWtWmS7dl9+Aj44ddKJ+rX18WNDrW/Z6kqiP7VpjrIVJOriHrHEe80O3x0s4O6S
	8IjU33vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0ut-00Enfn-2o
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 08:04:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ0uq-00EneM-0i;
	Wed, 17 Jan 2024 08:04:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40H4dQc6014350;
	Wed, 17 Jan 2024 08:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=yp1GrzFAhJmTEfF0DH8+vf/AoRSU8H2Ic5Gx8W+xIB0=; b=EK
	gse0hNXzBMv6eyFwCNVVIoemrcYIO0vTHnyFeIJr/FlC5PDBwQaSxdFMisZXl36R
	d7l2izsefrspcnf24CIKLKg7qlvGnqGU78daZCjHZ6BP4z/xh22wCD4VrpV2kXzQ
	b2PLm6zAwitZNmNnY9g9XG8PuK+zZpU/+ZPg1AyJDKYptlwmxbZ9Z9ilDyd8qx3n
	ojQDYt0oWtQkgltTfFEj6Ro8WZS1iLXmZOjeMFZy0JaYAS4qDQGx71KAK8MvxSKy
	gU3qDn/a7Z2E8Ahb1coCuKJ32D4JXWbHfJgPDt+RpXGFwOYDE/2P9PGfsMggpR0R
	0RC97AL5OO8guJaPzaew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnrndaq3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 08:04:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40H84p6t009700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 08:04:51 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 17 Jan 2024 00:04:48 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v3 1/3] wifi: ath12k: replace ENOTSUPP with EOPNOTSUPP
Date: Wed, 17 Jan 2024 13:34:29 +0530
Message-ID: <20240117080431.2907471-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117080431.2907471-1-quic_periyasa@quicinc.com>
References: <20240117080431.2907471-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PX4OCgmr2p07Rvn7yK2RoGjsOdpgSssh
X-Proofpoint-ORIG-GUID: PX4OCgmr2p07Rvn7yK2RoGjsOdpgSssh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_04,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_000452_266755_DA1A719D 
X-CRM114-Status: GOOD (  16.61  )
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

ENOTSUPP is not a standard error code, don't use it. Replace with
EOPNOTSUPP instead.

No functional changes, compile tested only.

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c  | 6 +++---
 drivers/net/wireless/ath/ath12k/hal_rx.c | 4 ++--
 drivers/net/wireless/ath/ath12k/mac.c    | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 62f9cdbb811c..05d5f14cdfa1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
@@ -151,7 +151,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 
 	if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
 	    !ieee80211_is_data(hdr->frame_control))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	pool_id = skb_get_queue_mapping(skb) & (ATH12K_HW_MAX_QUEUES - 1);
 
@@ -837,7 +837,7 @@ int ath12k_dp_tx_htt_h2t_ver_req_msg(struct ath12k_base *ab)
 	if (dp->htt_tgt_ver_major != HTT_TARGET_VERSION_MAJOR) {
 		ath12k_err(ab, "unsupported htt major version %d supported version is %d\n",
 			   dp->htt_tgt_ver_major, HTT_TARGET_VERSION_MAJOR);
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index 4f25eb9f7745..4fc08d4f85b5 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "debug.h"
@@ -247,7 +247,7 @@ int ath12k_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
 	case HAL_REO_CMD_UNBLOCK_CACHE:
 	case HAL_REO_CMD_FLUSH_TIMEOUT_LIST:
 		ath12k_warn(ab, "Unsupported reo command %d\n", type);
-		ret = -ENOTSUPP;
+		ret = -EOPNOTSUPP;
 		break;
 	default:
 		ath12k_warn(ab, "Unknown reo command %d\n", type);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a90c0309230a..d453e4165228 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5055,7 +5055,7 @@ void ath12k_mac_drain_tx(struct ath12k *ar)
 
 static int ath12k_mac_config_mon_status_default(struct ath12k *ar, bool enable)
 {
-	return -ENOTSUPP;
+	return -EOPNOTSUPP;
 	/* TODO: Need to support new monitor mode */
 }
 
@@ -5165,13 +5165,13 @@ static int ath12k_mac_start(struct ath12k *ar)
 	 * such as rssi, rx_duration.
 	 */
 	ret = ath12k_mac_config_mon_status_default(ar, true);
-	if (ret && (ret != -ENOTSUPP)) {
+	if (ret && (ret != -EOPNOTSUPP)) {
 		ath12k_err(ab, "failed to configure monitor status ring with default rx_filter: (%d)\n",
 			   ret);
 		goto err;
 	}
 
-	if (ret == -ENOTSUPP)
+	if (ret == -EOPNOTSUPP)
 		ath12k_dbg(ab, ATH12K_DBG_MAC,
 			   "monitor status config is not yet supported");
 
@@ -5283,7 +5283,7 @@ static void ath12k_mac_stop(struct ath12k *ar)
 
 	mutex_lock(&ar->conf_mutex);
 	ret = ath12k_mac_config_mon_status_default(ar, false);
-	if (ret && (ret != -ENOTSUPP))
+	if (ret && (ret != -EOPNOTSUPP))
 		ath12k_err(ar->ab, "failed to clear rx_filter for monitor status ring: (%d)\n",
 			   ret);
 
-- 
2.34.1


