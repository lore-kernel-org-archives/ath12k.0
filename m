Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323EBC7EE2A
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndbPXCo0Ela4eVyJk+ymEQ7fheGgd/+SK8wFB09F/C4=; b=APPZS3oeOq+BSJjYfFfdYaqTXr
	B6lvRUzMGJQAHM1lwWbihMiw/vJCqhzbW0Q1n9451r4x+G6GigZBk3XqTP0SAjnT7NbxmeoKGOlH1
	VGVG9ywZUssFfy7kolLJjI8GHVfRy3Um3BFQRDiyo1Pck86KkGaBLzvSUnUuycLbogV2AZ71xZrSU
	5pwxJ/lliq8sLzTglOUDCmkBvnF9jliS0XNcmErypJwp7ul/HxfN03abnkAH/owj+FSmB4zSMoH3i
	LzOPcTydkhzaEnB7fR4pceD4E6Ba0Olkzj2REfeDThpifsakGa5YBRQSJBk3YQXOkn1WrLZ7AsC/5
	LF1mVF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEMz-0000000FY9Z-3ydB;
	Fri, 27 Jun 2025 19:04:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCPy-0000000FLUt-2WsX
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 16:59:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCDewW009564;
	Fri, 27 Jun 2025 16:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndbPXCo0Ela4eVyJk+ymEQ7fheGgd/+SK8wFB09F/C4=; b=BTlTkb4IxpvrIpBn
	OFGUo5i72mXyEck4YG3WzvLFbOjhQBM/HZAv10us3y/1+eBGwLG8CblUEVrFaWRK
	h6tFVTc7ZsyJeKBsPs0FObh59onJhRxS74XxhCYHMDTWdXXL5lV1kFDU6qk5seT4
	DgQ+ouaCRq+6uumftqEZdLM9MnqK7paSo7yHPLdFCaTokaVOStiUnUQDXJsBdTtq
	2S0Gh38ofCLhHDdW//CNkZ3PdpVXViNgVdr84sVSvukUdMzVgwqrGQLdO1vSufk7
	w9hKA07701hImuRfyqggrK4+bSzaQEBuuXA06G7se3OKO/iZ8TmFTfkZkORrAyyi
	8ZT2aQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b47efx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 16:59:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RGxD5v012641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 16:59:13 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 09:59:12 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v6 4/5] wifi: ath12k: correctly update bw for ofdma packets
Date: Fri, 27 Jun 2025 22:28:47 +0530
Message-ID: <20250627165848.3178339-5-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627165848.3178339-1-quic_sarishar@quicinc.com>
References: <20250627165848.3178339-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzNyBTYWx0ZWRfX1nL/tg0r1TPD
 uyLaCpUx1CnleImcZ2HeGoCaywZpz5k5fhCmpfoR41jtIU7vL4nrA94y4KVyecf2hxLqOpS5LZF
 Kmct0wZUi1HOpoxuvwteQPQe+bikmJ++0wvKLN4pJKReRT2haSwDT5HHpSSrKOmop+jQ9Gx2Y4c
 aj1MFLUXoIVxV6tIpCnsgjIKHr1WThnEmUxLiTnSKndHt4jubfynPKQxcItGrhw4CIYYPyjw+jS
 QuexHAJcnn/4bIzyd7m8311tFAWOZG4UdpGBVo+L9ePs86zhO5OgEMnYD/pk+NF8PPSxAQGKKMH
 qVWfrJXSQsBhGo6ReaiyMsVpNEgoEqZhin2o1jjLPAeCQfQE5ik/zjdWw3rcFJWhU20Bz8WOCq0
 1KhM4xRhjPZKHqqZp14aaItnObSjpFS1MD/d07lbFEzvvxU5Y8pDIVztem33WWjDucKMGAkI
X-Proofpoint-ORIG-GUID: _4N-CfOKQ1o-NuSDPoytQdBIHS__SE-O
X-Proofpoint-GUID: _4N-CfOKQ1o-NuSDPoytQdBIHS__SE-O
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685ecde2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=WP206t09-qgxmGJDAAsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_095914_643717_7B589BE3 
X-CRM114-Status: GOOD (  12.80  )
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

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    |  2 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c | 15 ++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index a353333f83b6..0c1fece27264 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -1559,6 +1559,8 @@ enum HTT_PPDU_STATS_PPDU_TYPE {
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M		BIT(28)
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_LDPC_M		BIT(29)
 
+#define HTT_USR_RATE_PPDU_TYPE(_val) \
+		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_INFO1_PPDU_TYPE_M)
 #define HTT_USR_RATE_PREAMBLE(_val) \
 		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE_M)
 #define HTT_USR_RATE_BW(_val) \
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 0f5edc81fc5d..ff92ec764ae5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1423,12 +1423,12 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
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
@@ -1457,6 +1457,10 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
 	dcm = HTT_USR_RATE_DCM(user_rate->rate_flags);
 
+	ppdu_type = HTT_USR_RATE_PPDU_TYPE(user_rate->info1);
+	is_ofdma = (ppdu_type == HTT_PPDU_STATS_PPDU_TYPE_MU_OFDMA) ||
+		   (ppdu_type == HTT_PPDU_STATS_PPDU_TYPE_MU_MIMO_OFDMA);
+
 	/* Note: If host configured fixed rates and in some other special
 	 * cases, the broadcast/management frames are sent in different rates.
 	 * Firmware rate's control to be skipped for this?
@@ -1506,6 +1510,8 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 
 	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
 
+	arsta->txrate.bw = ath12k_mac_bw_to_mac80211_bw(bw);
+
 	switch (flags) {
 	case WMI_RATE_PREAMBLE_OFDM:
 		arsta->txrate.legacy = rate;
@@ -1534,6 +1540,8 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 			le16_to_cpu(user_rate->ru_start) + 1;
 		v = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(tones);
 		arsta->txrate.he_ru_alloc = v;
+		if (is_ofdma)
+			arsta->txrate.bw = RATE_INFO_BW_HE_RU;
 		break;
 	case WMI_RATE_PREAMBLE_EHT:
 		arsta->txrate.mcs = mcs;
@@ -1544,11 +1552,12 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
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


