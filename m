Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A68C021A8
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjDDomrKTge2AVPqW0ceB3uxXmfUbRcba5tEp9Sy2FA=; b=enBYP/hEc2EjGRzp1uPm9Dn6Py
	C/rSN2k/G6kzQbmptzvR1K26obGiV3pqQFwyEqT3yQn25UogyQv2Czb3premtxrUzkd5H9UbSXDvk
	qezdedR69iLzjTdSubPPpv+ogPriCQew681qkdwu9wLpASjG6FT0dHCnAtHANv0dZnHJ7tY+fxGHa
	Zv0w3BHHezUNPTxcMaHONTyEh46p/BRQIsb6xTdueJ020cnWEVhrAhA6cnFDAjUs+y2fSVuvZnsxl
	TGYlPK1EmNi3RT4dKEEt9K/VlJa7HY6+iCi0W4RAsLeaqXoBKJRhtSnBOp1vV3jFxPEU0g1uU0Le4
	yFsVZ95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidrq-0000000CDU7-00E8
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 18:23:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tid4o-0000000C1SU-3Lmu
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 17:32:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D9HtIe020984;
	Thu, 13 Feb 2025 17:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjDDomrKTge2AVPqW0ceB3uxXmfUbRcba5tEp9Sy2FA=; b=Ob9wPqspaPn5ScM1
	qAMuZXBAO3eCZ9K5efOuOoIDUzmaDzZfMuwSPpgzdrxt7/zXDwfjw9AnQEsjrWLw
	QbX6V/lCqzyH6K7y/EqADBrSShNfBRa7lInZwXiCyVVYROd4xEFyJ5UF3uE5AeFP
	ESwTgV/nFoKgoYl4lOl3sojGSUyWhWMEPaAXE3Ai/l8GGT2GhahAFPBQbS9RfZHc
	oFEkIzo+iXISmgUfm5FNazYGPf+2NgC6uIsyQmBRBt1qiY1efsNbGNrf+nDeBcBx
	N07ZpJePfSL3jRJ473Z8+4/4PLzSRENZwchTN/sbKzOpfwbvkmt3HYt2FKxb6eUs
	GvgAwg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sdyxsa1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:32:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DHWagg029579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:32:36 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 09:32:35 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH v2 4/5] wifi: ath12k: correctly update bw for ofdma packets
Date: Thu, 13 Feb 2025 23:02:05 +0530
Message-ID: <20250213173206.1665731-5-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213173206.1665731-1-quic_sarishar@quicinc.com>
References: <20250213173206.1665731-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kM2_gGbXzBVjj2s0WR-fRR9mp6y1zXnO
X-Proofpoint-GUID: kM2_gGbXzBVjj2s0WR-fRR9mp6y1zXnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_093238_952625_D4853346 
X-CRM114-Status: GOOD (  12.30  )
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

Currently, arsta->txrate.bw is filled from ath12k_mac_bw_to_mac80211_bw(bw)
during ath12k_update_per_peer_tx_stats(). But in tx_completion path bw
is filled differently if ppdu_type is ofdma for HE/EHT rates.

Hence, update arsta->txrate.bw correctly if packet is ofdma for HE
and EHT rate.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    |  2 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 75435a931548..3ddbf781c2b5 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1508,6 +1508,8 @@ enum HTT_PPDU_STATS_PPDU_TYPE {
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M		BIT(28)
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_LDPC_M		BIT(29)
 
+#define HTT_USR_RATE_PPDU_TYPE(_val) \
+		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_INFO1_PPDU_TYPE_M)
 #define HTT_USR_RATE_PREAMBLE(_val) \
 		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE_M)
 #define HTT_USR_RATE_BW(_val) \
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 5dab13b0787d..35b9aafca642 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1368,12 +1368,12 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	struct htt_ppdu_user_stats *usr_stats = &ppdu_stats->user_stats[user];
 	struct htt_ppdu_stats_common *common = &ppdu_stats->common;
 	int ret;
-	u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
+	u8 flags, mcs, nss, bw, sgi, dcm, ppdu_type, rate_idx = 0;
 	u32 v, succ_bytes = 0;
 	u16 tones, rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
-	bool is_ampdu = false;
+	bool is_ampdu = false, is_ofdma = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
 		return;
@@ -1402,6 +1402,10 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
 	dcm = HTT_USR_RATE_DCM(user_rate->rate_flags);
 
+	ppdu_type = HTT_USR_RATE_PPDU_TYPE(user_rate->info1);
+	is_ofdma = (ppdu_type == HTT_PPDU_STATS_PPDU_TYPE_MU_OFDMA) ||
+		   (ppdu_type == HTT_PPDU_STATS_PPDU_TYPE_MU_MIMO_OFDMA);
+
 	/* Note: If host configured fixed rates and in some other special
 	 * cases, the broadcast/management frames are sent in different rates.
 	 * Firmware rate's control to be skipped for this?
@@ -1452,6 +1456,8 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 
 	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
 
+	arsta->txrate.bw = ath12k_mac_bw_to_mac80211_bw(bw);
+
 	switch (flags) {
 	case WMI_RATE_PREAMBLE_OFDM:
 		arsta->txrate.legacy = rate;
@@ -1480,6 +1486,8 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 			le16_to_cpu(user_rate->ru_start) + 1;
 		v = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(tones);
 		arsta->txrate.he_ru_alloc = v;
+		if (is_ofdma)
+			arsta->txrate.bw = RATE_INFO_BW_HE_RU;
 		break;
 	case WMI_RATE_PREAMBLE_EHT:
 		arsta->txrate.mcs = mcs;
@@ -1490,11 +1498,12 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 			le16_to_cpu(user_rate->ru_start) + 1;
 		v = ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(tones);
 		arsta->txrate.eht_ru_alloc = v;
+		if (is_ofdma)
+			arsta->txrate.bw = RATE_INFO_BW_EHT_RU;
 		break;
 	}
 
 	arsta->txrate.nss = nss;
-	arsta->txrate.bw = ath12k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_duration += tx_duration;
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
 
-- 
2.34.1


