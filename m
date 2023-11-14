Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7958AC4167B
	for <ath12k@archiver.kernel.org>; Tue, 14 Nov 2023 18:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=diGqvzdMygs6od3i3vk/QkxjzGSgkn6eLwSeQf1JXSY=; b=zYcY8XLYds4anp
	KJLexnVrGFS0gh2+Feu8vs4ng0qOd8Z4uyRSqwlkv6xgPmt2qizI6NaihJOdDyJm/hGdTbKnPDSVk
	KxhT9Vo5wTHyW40vCRyRtK+xdNmMULxq3DAL7mlEmHfLTXja9c+pI1ynLPHiPCWuyAsdfSydkBKDX
	bYQe0IgB3IocZxm71xm1LoMJ5Q/jup4EvfCbDyYQ3hBNU3dpLd+dW3BFRbNiIMB0d6qTLKESN998R
	FK3CQVi3gB2li7VuAH30oHgsh0Z4ShppoxOK8O2ZNzoPNU7YDjwjn5QxfQxmD40sHNVeOBeyF73wf
	QUlnqbzdc+cVdDZ8wG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2yEA-00GaVi-15
	for ath12k@archiver.kernel.org;
	Tue, 14 Nov 2023 18:33:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2yE6-00GaV6-1f
	for ath12k@lists.infradead.org;
	Tue, 14 Nov 2023 18:33:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AEGhW9T023414;
	Tue, 14 Nov 2023 18:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=osVmKGRnNh43zkIJGmC/kSXirBKve7TmGi4lOgCpvGs=;
 b=FHnCCxoRwCyWpAIgl/dr7vHUEAKE0IBEVMyoxPIqfsWOrbluGX/rmkv0ehXhySAIDp11
 RR3lJBmA1l9WcQaBUe4Rd92NxwG8ZdTPZmWPB8mkVf6SOMrGOsMNNvtMXrnduSLRCoWY
 VZMMZTkP8luPTT23A2ScVHLZyqN4vw1geMC6Yc1rkeCmmgGvol1xoUfOw9DmcQvgoxsC
 ezcDc0RrobPNwpgyQ+tEyk1FtEJe1YmFi1v0Bfpmch84LTaqmoj7zdOzLDnDChjvFuxF
 o0Ueaw1rJV72UlX8IyfyNn3lThGO7KHQw3myyqYlQp4VLylH0jWvSSBYIIVkYhIuXWvx wA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ubge83s38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 18:33:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AEIXRwL030730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 18:33:27 GMT
Received: from msinada-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 14 Nov 2023 10:33:26 -0800
From: Muna Sinada <quic_msinada@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH] wifi: ath12k: add 320 MHz bandwidth enums
Date: Tue, 14 Nov 2023 10:33:14 -0800
Message-ID: <20231114183314.2846274-1-quic_msinada@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hKaJxhUHlNhvM2zO3O8LgjL2dzpVURUU
X-Proofpoint-GUID: hKaJxhUHlNhvM2zO3O8LgjL2dzpVURUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_18,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_103330_710587_561C8406 
X-CRM114-Status: GOOD (  15.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Add 320 MHz bandwidth as a new bandwidth enum for ATH12k driver. This
is extending existing bandwidth related enums to include 320 MHz. This
is a precursor to supporting 320 MHz in the future.

Sanity test performed to confirm that there was no impact in existing
bandwidths.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1

Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 3 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 3 ++-
 drivers/net/wireless/ath/ath12k/hal_rx.h | 1 +
 drivers/net/wireless/ath/ath12k/mac.c    | 8 ++++++++
 drivers/net/wireless/ath/ath12k/mac.h    | 1 +
 drivers/net/wireless/ath/ath12k/wmi.h    | 1 +
 6 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f44bc5494ce7..f8f66062ee1e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1091,7 +1091,7 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 	spin_unlock_bh(&ar->ab->base_lock);
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_DATA,
-		   "rx skb %pK len %u peer %pM %u %s %s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
+		   "rx skb %pK len %u peer %pM %u %s %s%s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
 		   peer ? peer->addr : NULL,
@@ -1104,6 +1104,7 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
 		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
 		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
+		   (status->bw == RATE_INFO_BW_320) ? "320" : "",
 		   status->enc_flags & RX_ENC_FLAG_SHORT_GI ? "sgi " : "",
 		   status->rate_idx,
 		   status->nss,
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 9f831e3971f9..c3e2146860f7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2435,7 +2435,7 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 	spin_unlock_bh(&ab->base_lock);
 
 	ath12k_dbg(ab, ATH12K_DBG_DATA,
-		   "rx skb %pK len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
+		   "rx skb %pK len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
 		   peer ? peer->addr : NULL,
@@ -2449,6 +2449,7 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
 		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
 		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
 		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
+		   (status->bw == RATE_INFO_BW_320) ? "320" : "",
 		   status->enc_flags & RX_ENC_FLAG_SHORT_GI ? "sgi " : "",
 		   status->rate_idx,
 		   status->nss,
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index fcfb6c819047..3bfff16d53a2 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -61,6 +61,7 @@ enum hal_rx_bw {
 	HAL_RX_BW_40MHZ,
 	HAL_RX_BW_80MHZ,
 	HAL_RX_BW_160MHZ,
+	HAL_RX_BW_320MHZ,
 	HAL_RX_BW_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fc0d14ea328e..abe2561238b3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -343,6 +343,9 @@ ath12k_mac_bw_to_mac80211_bw(enum ath12k_supported_bw bw)
 	case ATH12K_BW_160:
 		ret = RATE_INFO_BW_160;
 		break;
+	case ATH12K_BW_320:
+		ret = RATE_INFO_BW_320;
+		break;
 	}
 
 	return ret;
@@ -359,6 +362,8 @@ enum ath12k_supported_bw ath12k_mac_mac80211_bw_to_ath12k_bw(enum rate_info_bw b
 		return ATH12K_BW_80;
 	case RATE_INFO_BW_160:
 		return ATH12K_BW_160;
+	case RATE_INFO_BW_320:
+		return ATH12K_BW_320;
 	default:
 		return ATH12K_BW_20;
 	}
@@ -3726,6 +3731,9 @@ static u32 ath12k_mac_ieee80211_sta_bw_to_wmi(struct ath12k *ar,
 	case IEEE80211_STA_RX_BW_160:
 		bw = WMI_PEER_CHWIDTH_160MHZ;
 		break;
+	case IEEE80211_STA_RX_BW_320:
+		bw = WMI_PEER_CHWIDTH_320MHZ;
+		break;
 	default:
 		ath12k_warn(ar->ab, "Invalid bandwidth %d in rc update for %pM\n",
 			    sta->deflink.bandwidth, sta->addr);
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 59b4e8f5eee0..52a3b19a2270 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -43,6 +43,7 @@ enum ath12k_supported_bw {
 	ATH12K_BW_40    = 1,
 	ATH12K_BW_80    = 2,
 	ATH12K_BW_160   = 3,
+	ATH12K_BW_320   = 4,
 };
 
 extern const struct htt_rx_ring_tlv_filter ath12k_mac_mon_status_filter_default;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 629373d67421..760bfaf1a917 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2220,6 +2220,7 @@ enum wmi_peer_chwidth {
 	WMI_PEER_CHWIDTH_40MHZ = 1,
 	WMI_PEER_CHWIDTH_80MHZ = 2,
 	WMI_PEER_CHWIDTH_160MHZ = 3,
+	WMI_PEER_CHWIDTH_320MHZ = 4,
 };
 
 enum wmi_beacon_gen_mode {
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
