Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48888C021BE
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 04:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXZ0NsiadDmOG5WI+0fezL5M1EvF1417+60pnG6MXBg=; b=TmnY0J0Fyhc7gR7txdDtNNh9gy
	UsYa1Mbeefw/B3tvvyp+2V91ZswA6URKM1zTVp2S7dWuC0tmZhNBJRRk6c7Kiyz26f6dLLOnfFK4p
	Bho6/jNoatkvHKSRkuQMmzuwYtqjYQJmKzrG2i1fxpJ6I0zUN3Ybiyot3NIXbacnT/dpYSN30+6fk
	CvrWMMOyjk/JU5Y0GswbzTikuyJsn+WHS8l03gZIGylnn1ib/7mblGTqCcGd/ul1w+yW8gxp1q3cF
	7ZFqI5oehbgsTG0C1sdFO94sLWNFZypSrj6Ix9clNhtNVFbPaHqotiySUdNykLRXAK1ZEDO3T3dDg
	Shna8xRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVz5-00000006KgH-3q0J
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 04:58:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVz3-00000006Kej-2gPS
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 04:58:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R0pjYq000365;
	Thu, 27 Feb 2025 04:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zXZ0NsiadDmOG5WI+0fezL5M1EvF1417+60pnG6MXBg=; b=l9+rLzuV5msAuWbL
	Dhkh1f1GxVo5+UXfH5df40j/WaJ5pamLSATbd4UeJVeOsZMNrP/KZEQidcNx3368
	M/8XP3RHROXY0QEZbSVm14nUg0STz7ZlYM4u5YjekkZVmghd7tuY5BlTM3nJTCs1
	hDemIB8dmtqCgV/T7At6OxPAzhiTZv949HHoGSyYsrgLnhZfwBGQBR20lz6dBq3X
	Q2FligxI2ZVvxb5p5VpBZVbguah6gbxy749FMUI5MyHN7A7cl+3o5iMVD5Q2FqYw
	5INjyqcJKyU4fU6y/OubDehxaNp4GucEdEqIz4dvvWacML/iafaY3v4B8DRBEGVi
	4ilJNQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4522sktcht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:58:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R4wpVk010936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:58:51 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 20:58:49 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH v3 5/5] wifi: ath12k: fetch tx_retry and tx_failed from htt_ppdu_stats_user_cmpltn_common_tlv
Date: Thu, 27 Feb 2025 10:28:24 +0530
Message-ID: <20250227045824.91480-6-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227045824.91480-1-quic_sarishar@quicinc.com>
References: <20250227045824.91480-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cXYjl4IQ_IM8pKAhyrOp2KaC4gn3tMrY
X-Proofpoint-ORIG-GUID: cXYjl4IQ_IM8pKAhyrOp2KaC4gn3tMrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_205853_809270_2899C02E 
X-CRM114-Status: GOOD (  15.59  )
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

Currently, tx_retries and tx_failed are updated only in mac80211 during
tx_completion path for sta->deflink. This works fine for non-ML
station but for multi-link (ML) station, these values should be updated
for sta->link[link_id] as per tx link_id. However, in tx_completion path
there is no way to determine the link_id for which packet is retried or
failed.

Therefore, update the tx_retries and tx_failed in arsta structure from
htt_ppdu_stats_user_cmpltn_common_tlv during
ath12k_update_per_peer_tx_stats() call to utilize the values from arsta.
Also, during 'iw dev xxxx station dump' populate the tx_retries and
tx_failed in station_info structure to ensure values are correctly
reflected.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h  |  2 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c | 11 ++++++++++-
 drivers/net/wireless/ath/ath12k/mac.c   |  5 +++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3fac4f00d383..8050dd70f077 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -517,6 +517,8 @@ struct ath12k_link_sta {
 
 	 /* for firmware use only */
 	u8 link_idx;
+	u32 tx_retry_failed;
+	u32 tx_retry_count;
 };
 
 struct ath12k_sta {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index c3bd7a39150b..6fc1ab1faa4d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1374,13 +1374,20 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
 	bool is_ampdu = false, is_ofdma = false;
+	u16 tx_retry_failed = 0, tx_retry_count = 0;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
 		return;
 
-	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
+	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON)) {
 		is_ampdu =
 			HTT_USR_CMPLTN_IS_AMPDU(usr_stats->cmpltn_cmn.flags);
+		tx_retry_failed =
+			usr_stats->cmpltn_cmn.mpdu_tried - usr_stats->cmpltn_cmn.mpdu_success;
+		tx_retry_count =
+			HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
+			HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
+	}
 
 	if (usr_stats->tlv_flags &
 	    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS)) {
@@ -1503,6 +1510,8 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 		break;
 	}
 
+	arsta->tx_retry_failed += tx_retry_failed;
+	arsta->tx_retry_count += tx_retry_count;
 	arsta->txrate.nss = nss;
 	arsta->tx_duration += tx_duration;
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index accdf4b2241f..243bf2ac599f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10361,6 +10361,11 @@ static void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->signal_avg += ATH12K_DEFAULT_NOISE_FLOOR;
 
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
+
+	sinfo->tx_retries = arsta->tx_retry_count;
+	sinfo->tx_failed = arsta->tx_retry_failed;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
 }
 
 static int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
-- 
2.34.1


