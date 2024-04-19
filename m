Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A869DC4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 03:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FYaOh48oR5kqiUPQd4BbDGl1jnGc8PZPh4gbFVRm+8=; b=BPRtmxNJb6pSYv8I582r9Cvg7l
	Q+ZiA3BBlVSNesrju1TXVy9IK5PXMhby1b0Y4y1sMowBU3VWv43geu+kT9uP+luq7HcKJ3wFD4xBT
	tDt9UVSFqKZrS3lC69L6xo3ZqbWa/wHfrYtZ+VXrMyx9yI+8Vd42xwwIKvULuGYedc7n8Nyg6rLdJ
	U7j0czyP0LvAAXwkswgtKr/wGsARqDbIVQOVEqS4i7xAolHVCtRCww6BvtpU5nIJQc9b4puJVzn06
	iN2seKVgyr9vwALw6k24IANx29Z4ObvWqUAAesFBhP9FczM2w2AWm2I2np2v+t3uEppWxB0B7QDoS
	67K+Zh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxer5-00000004DMr-18xR
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 03:24:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxer2-00000004DLd-449J
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 03:24:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J3HZRs007049;
	Fri, 19 Apr 2024 03:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=2FYaOh48oR5kqiUPQd4BbDGl1jnGc8PZPh4gbFVRm+8=; b=a0
	qzLpQU1a3ThBPnLoa6CDliDO402m66KJ9fZS0Dpy7/RYrmfMFYWi6WXa9CQZ0ZV1
	u/0EZHDuv/+OBYRuJEw3qEt5ovyeWlS7askijH83OCx6rkVeCm6DCUkHBX04fCTG
	1zTyFUrZLJAyKEMooc48U0MsqzIwlcDHy/rtDmGmSZzRwzDEuV1uaVCU7bd5vfYy
	mKJBVV832qPIX4/hSAeDuGDLmyP7yFks+wSLMFJuZMrQGtFy0yR6/+Qf9KqaaFh+
	I40y8H+HkxMnFkJbyFsyYEsd8ZoHSL6oBo8/YWVbpp3ShvDUCzjI0Dq+55tvNIM+
	sQAIrsxQ9TQndpAquwMQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkgd700xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 03:24:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43J3Nx47006778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 03:23:59 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 18 Apr 2024 20:23:58 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v4 2/3] wifi: ath12k: report station mode receive rate for IEEE 802.11be
Date: Fri, 19 Apr 2024 11:21:21 +0800
Message-ID: <20240419032122.7009-3-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419032122.7009-1-quic_lingbok@quicinc.com>
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9aBjiDefcvgy6OPTRsS9qs5llkqSnbiu
X-Proofpoint-ORIG-GUID: 9aBjiDefcvgy6OPTRsS9qs5llkqSnbiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_22,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404190024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_202401_083920_B16DF838 
X-CRM114-Status: GOOD (  12.25  )
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
index 75df622f25d8..e89bf08a1f2f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2359,6 +2359,23 @@ static void ath12k_dp_rx_h_rate(struct ath12k *ar, struct hal_rx_desc *rx_desc,
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
 
@@ -2445,7 +2462,7 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 	spin_unlock_bh(&ab->base_lock);
 
 	ath12k_dbg(ab, ATH12K_DBG_DATA,
-		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
+		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
 		   peer ? peer->addr : NULL,
@@ -2456,6 +2473,7 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 		   (status->encoding == RX_ENC_HT) ? "ht" : "",
 		   (status->encoding == RX_ENC_VHT) ? "vht" : "",
 		   (status->encoding == RX_ENC_HE) ? "he" : "",
+		   (status->encoding == RX_ENC_EHT) ? "eht" : "",
 		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
 		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
 		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
diff --git a/drivers/net/wireless/ath/ath12k/rx_desc.h b/drivers/net/wireless/ath/ath12k/rx_desc.h
index a0db6702a189..e620f4794286 100644
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


