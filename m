Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F7FC3DA63
	for <ath12k@archiver.kernel.org>; Thu, 18 Jul 2024 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nf/XzpQQ9TJZQd98GVl3lfALYRavsfjQ5ZqVMGyHCfM=; b=vyexWiBCZ3gCeN0n9gfsMizigB
	16e6caLRulQlPJRpqSPtCQf4uXXsJ03t6zngFvG9XmuG9TvBY36j5m9kR2x66Dh7g4dQDZJ4528gj
	vZ6MiZrB6aZG21OyRJIV727UDzVsh/9c9KMsCWixSUHBDAHAzEtUfqCEXLEUvJZYpz0lIdWoLuJPs
	8SmNVCwDTLI26vS8qOduTKkmd0HygPqmgVpYg1meJ8jXnpCRt1IN0iUpo3PqfkJhwhEwEO1YXCs1x
	oQaSSCpSfvCiO1FTJA6umkH1BhNC5JxMH1jd+e3YuQAgDvmTSI0mqD7vSSWuBr+6gNrb2DNjCrscQ
	7nG/A7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPvF-0000000Gv7l-2P27
	for ath12k@archiver.kernel.org;
	Thu, 18 Jul 2024 12:07:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPvB-0000000Gv4U-27Tl
	for ath12k@lists.infradead.org;
	Thu, 18 Jul 2024 12:07:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IBfNO6023188;
	Thu, 18 Jul 2024 12:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nf/XzpQQ9TJZQd98GVl3lfALYRavsfjQ5ZqVMGyHCfM=; b=U06HSGvtdn2SVLEI
	mbWRxSD/8/4whiIgTugI9ZRWixQYBodKtsPkPM1NwL/jN6hFn4thpT1o/7pjKlgO
	X25mQ90jAVJY04uNAnUc5c9xLq7f+TZsHuwQU6wzvMftHZfhwbcG0YCAMBgVwAZy
	VCSPG8G1sp1Svgae+dyN9h/Z2XNJQwHk/WCHhcFkA2jmnkOhXneDTROelF345BQP
	Yh116Bf7c9Ylnxxv0O6E8BawOUpXeT5nUNx4s3wtewurWbJ9cVOjgxijebZVZyME
	VOh+2TB4+c3EHHZk761IfMDiLT09bVENGH9hKZDhUZz6NFkm5VkPgDyDQ6uI7dzg
	STNQ0A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfnnehc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 12:07:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IC7dhW011956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 12:07:39 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 18 Jul 2024 05:07:38 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v5 2/3] wifi: ath12k: report station mode receive rate for IEEE 802.11be
Date: Thu, 18 Jul 2024 20:07:24 +0800
Message-ID: <20240718120725.130265-3-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718120725.130265-1-quic_lingbok@quicinc.com>
References: <20240718120725.130265-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ipqxYRWy-LjOyfKBREJD2aVHCyNOs-Ww
X-Proofpoint-ORIG-GUID: ipqxYRWy-LjOyfKBREJD2aVHCyNOs-Ww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_07,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407180081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_050741_708409_3115E2D1 
X-CRM114-Status: GOOD (  12.71  )
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

Currently, the receive rate of EHT of "iw dev xxx station dump" command
always show an invalid value.

This is because ath12k does not pass information about the rx_status of EHT
to mac80211. So, mac80211 not calculate the receive rate.

To address this issue, add logic for handling rx_status of EHT to the
ath12k_dp_rx_h_rate() function.

After that, "iw dev xxx station dump" show the correct receive rate.
Such as:

Station 00:03:7f:12:03:03 (on wlo1)
        inactive time:  48 ms
        rx bytes:       59226
        rx packets:     320
        tx bytes:       26556
        tx packets:     191
        tx retries:     99
        tx failed:      0
        beacon loss:    0
        beacon rx:      79
        rx drop misc:   68
        signal:         -95 dBm
        beacon signal avg:      -20 dBm
        tx bitrate:     688.2 MBit/s 40MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
        tx duration:    0 us
        rx bitrate:     619.5 MBit/s 40MHz EHT-MCS 8 EHT-NSS 3 EHT-GI 0

This patch affects the station mode of WCN7850 and QCN9274.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v5:
no change

v4:
no change

v3:
no change

v2:
no change

 drivers/net/wireless/ath/ath12k/dp_rx.c   | 20 +++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/rx_desc.h |  2 ++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 91e3393f7b5f..6f7e736d0604 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2337,6 +2337,23 @@ static void ath12k_dp_rx_h_rate(struct ath12k *ar, struct hal_rx_desc *rx_desc,
 		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
 		rx_status->bw = ath12k_mac_bw_to_mac80211_bw(bw);
 		break;
+	case RX_MSDU_START_PKT_TYPE_11BE:
+		rx_status->rate_idx = rate_mcs;
+
+		if (rate_mcs > ATH12K_EHT_MCS_MAX) {
+			ath12k_warn(ar->ab,
+				    "Received with invalid mcs in EHT mode %d\n",
+				    rate_mcs);
+			break;
+		}
+
+		rx_status->encoding = RX_ENC_EHT;
+		rx_status->nss = nss;
+		rx_status->eht.gi = ath12k_mac_eht_gi_to_nl80211_eht_gi(sgi);
+		rx_status->bw = ath12k_mac_bw_to_mac80211_bw(bw);
+		break;
+	default:
+		break;
 	}
 }
 
@@ -2426,7 +2443,7 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 	spin_unlock_bh(&ab->base_lock);
 
 	ath12k_dbg(ab, ATH12K_DBG_DATA,
-		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
+		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
 		   peer ? peer->addr : NULL,
@@ -2437,6 +2454,7 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 		   (status->encoding == RX_ENC_HT) ? "ht" : "",
 		   (status->encoding == RX_ENC_VHT) ? "vht" : "",
 		   (status->encoding == RX_ENC_HE) ? "he" : "",
+		   (status->encoding == RX_ENC_EHT) ? "eht" : "",
 		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
 		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
 		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
diff --git a/drivers/net/wireless/ath/ath12k/rx_desc.h b/drivers/net/wireless/ath/ath12k/rx_desc.h
index 9d9d7e936cbc..9d1f85956454 100644
--- a/drivers/net/wireless/ath/ath12k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath12k/rx_desc.h
@@ -637,6 +637,8 @@ enum rx_msdu_start_pkt_type {
 	RX_MSDU_START_PKT_TYPE_11N,
 	RX_MSDU_START_PKT_TYPE_11AC,
 	RX_MSDU_START_PKT_TYPE_11AX,
+	RX_MSDU_START_PKT_TYPE_11BA,
+	RX_MSDU_START_PKT_TYPE_11BE,
 };
 
 enum rx_msdu_start_sgi {
-- 
2.34.1


