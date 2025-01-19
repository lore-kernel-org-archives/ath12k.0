Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E5EC02187
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltpJZZurH7KTgNx0F3qlOJplKf6UXVKn1xU40bGGmzs=; b=MzuBJ1+bTfJlGbX7Yn/AAp2JVc
	nApBIyA+4tvnIXccyHSSSYvjpWJ7x6TDC7aHKCzHJzoYbwsjor3GjNAYpXUOXYSZHsXBzM8SOuoC1
	332UDyRjiz/YU5ZZZWXDG+y8OrZR8jcueoRnW+g35avk1Kj/HScog5XWiR8jxdALG0P3tuQRAbWRc
	a1EiZMwPKFPmp7nVuJ9j7ckOo1UyxxzAqyV6WNZeA8Kid1qf3DITdtRFj0l0sFckfEDJhUnSM6p45
	GCfafAIqmSMDeGxxDY4mtYbQ5pQUJcNZn77S8MNo1edTOE7i2F85h52qu6iIzqr791HeFgn3Idsgs
	8HycTo9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZVor-00000003y56-2eu7
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 13:58:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZVoo-00000003y2m-12CK
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 13:58:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JDK2o8013335;
	Sun, 19 Jan 2025 13:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ltpJZZurH7KTgNx0F3qlOJplKf6UXVKn1xU40bGGmzs=; b=I4IgRw+/AVHLykfC
	K9zmBk3mKlOBNpEqygMe3BUEr6pzUTSqa4T0iCRA8sJOxgRRRQLhBcIimBHuFKmD
	B49XCBTTWJrBHze/xHv5vR/A8eN8u5A5TLWBXMGvCztO0O8DlPBW7XRmG1gTvp3B
	a/6yDKjn7SbgsK2S2VkeqTVwze1K6rS0tt8AAmKR14QDo6JO2Pqf3gVx93KE46d9
	cccFV9CBnhRJs880kygWdGeVGXEhPjQqhVl8aL3LSRBCSRvGzaIrBBz1arww4Bxw
	F5o5coBwN657FHXjnsKwgQabYzxeEpbPvlc7LdGhkpJObxRSEDqF6hmwg/nIFcas
	dOe0nA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448wnf0axp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 13:58:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JDwOwM025648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 13:58:24 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 05:58:22 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: [PATCH v3 06/10] wifi: ath12k: fix the ampdu id fetch in the HAL_RX_MPDU_START TLV
Date: Sun, 19 Jan 2025 19:27:47 +0530
Message-ID: <20250119135751.2221902-7-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119135751.2221902-1-quic_periyasa@quicinc.com>
References: <20250119135751.2221902-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H25O8d4H-71VkCXFDiTttXV7yEh95BTj
X-Proofpoint-ORIG-GUID: H25O8d4H-71VkCXFDiTttXV7yEh95BTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=914
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_055826_421561_FD392F87 
X-CRM114-Status: GOOD (  16.03  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

Currently, ampdu id is update with peer id mask which is incorrect.
Therefore, update the ampdu id with PPDU id mask value. Also move
the ampdu_id field inside the user stats since it is a user id based
statistics.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 16 ++++++++++------
 drivers/net/wireless/ath/ath12k/hal_rx.h |  3 ++-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 8c283e7c7dde..6ba2f0fa39c1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "dp_mon.h"
@@ -1558,6 +1558,11 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 		if (userid < HAL_MAX_UL_MU_USERS) {
 			struct hal_rx_user_status *rxuser_stats =
 				&ppdu_info->userstats[userid];
+
+			if (ppdu_info->num_mpdu_fcs_ok > 1 ||
+			    ppdu_info->num_mpdu_fcs_err > 1)
+				ppdu_info->userstats[userid].ampdu_present = true;
+
 			ppdu_info->num_users += 1;
 
 			ath12k_dp_mon_rx_handle_ofdma_info(eu_stats, rxuser_stats);
@@ -1669,8 +1674,8 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 		if (userid < HAL_MAX_UL_MU_USERS) {
 			info[0] = __le32_to_cpu(mpdu_start->info0);
 			ppdu_info->userid = userid;
-			ppdu_info->ampdu_id[userid] =
-				u32_get_bits(info[0], HAL_RX_MPDU_START_INFO1_PEERID);
+			ppdu_info->userstats[userid].ampdu_id =
+				u32_get_bits(info[0], HAL_RX_MPDU_START_INFO0_PPDU_ID);
 		}
 
 		break;
@@ -1888,15 +1893,14 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 {
 	struct ieee80211_supported_band *sband;
 	u8 *ptr = NULL;
-	u16 ampdu_id = ppduinfo->ampdu_id[ppduinfo->userid];
 
 	rxs->flag |= RX_FLAG_MACTIME_START;
 	rxs->signal = ppduinfo->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
 	rxs->nss = ppduinfo->nss + 1;
 
-	if (ampdu_id) {
+	if (ppduinfo->userstats[ppduinfo->userid].ampdu_present) {
 		rxs->flag |= RX_FLAG_AMPDU_DETAILS;
-		rxs->ampdu_reference = ampdu_id;
+		rxs->ampdu_reference = ppduinfo->userstats[ppduinfo->userid].ampdu_id;
 	}
 
 	if (ppduinfo->is_eht || ppduinfo->eht_usig) {
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 5099399a047c..764730c447de 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -148,6 +148,8 @@ struct hal_rx_user_status {
 	u32 mpdu_fcs_ok_bitmap[HAL_RX_NUM_WORDS_PER_PPDU_BITMAP];
 	u32 mpdu_ok_byte_count;
 	u32 mpdu_err_byte_count;
+	bool ampdu_present;
+	u16 ampdu_id;
 };
 
 #define HAL_MAX_UL_MU_USERS	37
@@ -263,7 +265,6 @@ struct hal_rx_mon_ppdu_info {
 	u8 addr4[ETH_ALEN];
 	struct hal_rx_user_status userstats[HAL_MAX_UL_MU_USERS];
 	u8 userid;
-	u16 ampdu_id[HAL_MAX_UL_MU_USERS];
 	bool first_msdu_in_mpdu;
 	bool is_ampdu;
 	u8 medium_prot_type;
-- 
2.34.1


