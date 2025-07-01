Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DA2C7EE30
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bCPk6nI8sSurd5oKtH4fP2vBFBMabZennQXng5THoo=; b=KXin84FXmAZnmVpCF78fHI2Bp7
	5/CM3qdd19+BPAd9r4jiJ/O/Kp2ou96kqeqJKjZpzWOyjRS8ue5UOjBSlHmpOTH0MUiWjQ3MhKTvn
	hipIP692wyXYsTuCb35YxD6bfD+Mhq1aMQa20XOO/Zjsx/URmxMQxaq89MIVeQctk5rCMGmuinp5J
	zmewKIU0bHkorehc/OcvExCmQPo4H8JoqTEnyDE3lnM8+zwAos79p94GsDNh7gkyElBfZevKS1bvq
	c7Paou4y6NvtywMfslDBXzSi1IebgHnUSQe2gD7TeAeYgGxg3qqeMNPyPWJAXHn5bgn11dvVaNmGs
	GY6EwlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYmk-00000004pFE-3RLM;
	Tue, 01 Jul 2025 11:04:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYiQ-00000004oga-2S9r
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 10:59:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619tMvJ029344;
	Tue, 1 Jul 2025 10:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bCPk6nI8sSurd5oKtH4fP2vBFBMabZennQXng5THoo=; b=kjpv+G6WTNgju/QR
	yLv87S8x8MalVNLogMMDX4eec+NLusrG3KGsxUBWFF+N7CPHtBKCt/BK1O+OzFys
	Z+JGd4D3Mrh9ncqGBoG/zylurdSpNSNBVKIKrhjSHsr8incO0GLHCCNVX1Y7s4JC
	uYKGFs+9xTXj3iymVd1+9EZrQuiQbAamtOUbKhmK0mCAH4oU5Jh0y2gfP6FQyYtO
	bBq2I+E5HmPoM+wIzVwd21aQkatN5whlCBmZ9JmAkGamYws9qbobWlIvZXPZzmc1
	XOb2c9f/LIkNeDFBvqXHcOFerrEdI1rh2MEuYVN2ncq/DIvxoNeadnZlvunYEL3Q
	1PFflw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95j0d0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:59:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561Axr40002592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 10:59:53 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 03:59:52 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v8 5/5] wifi: ath12k: fetch tx_retry and tx_failed from htt_ppdu_stats_user_cmpltn_common_tlv
Date: Tue, 1 Jul 2025 16:29:27 +0530
Message-ID: <20250701105927.803342-6-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701105927.803342-1-quic_sarishar@quicinc.com>
References: <20250701105927.803342-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NiBTYWx0ZWRfX+3gW9Okwwyjo
 EN/gA2vqtAF+/PBiYtbWbdgx8ngxpPBIeCVp4abU4w5mdmFFhW0uGIQ2hONI7KEScM445eZNgfB
 h2h4xJX00Cro4v+4096vp6LerU4irdppR3K80uL9a2mtsybqnExHQlDR3/vRhIg7/CU6+CQB/gj
 /zGak5ExTCHprvCJyxESyNXwnyye760f0RjsYL6EiMPYJf9X/t6UJ1TwH522mk8Vwi7bdWUMbTs
 Hfizyjq3NANl2r//cquzkNvCz/0gLFzR+fMv9Q/1yJ75KJriioqnKFjaCju33D/Phwejq00AN/O
 krgK4nfmxKaNdfnLlykyMZK2SR/e22Eylci/ngRo1rWqy205lyhi/uJvvpJIiH1f7/O8tG5OUaR
 mEaP5MA/RsABJtDoZ02IGLk7jyXxDTmAPDHfBfmP5tLYQywBr8whYJaKeCZiuHxatAWCzCIf
X-Proofpoint-ORIG-GUID: QJtrA9Qpa0MgaqIg5IMrCyFMds0TE8r1
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6863bfaa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=oAq0YBx28stV0eL2X4IA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QJtrA9Qpa0MgaqIg5IMrCyFMds0TE8r1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_035954_625728_7F61DFEC 
X-CRM114-Status: GOOD (  16.07  )
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

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h  |  2 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c | 12 +++++++++++-
 drivers/net/wireless/ath/ath12k/mac.c   | 10 ++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3c10d7eb9669..c57e3313065e 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -563,6 +563,8 @@ struct ath12k_link_sta {
 
 	 /* for firmware use only */
 	u8 link_idx;
+	u32 tx_retry_failed;
+	u32 tx_retry_count;
 };
 
 struct ath12k_reoq_buf {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 7be9f8c02c67..ed325aa6322d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1428,14 +1428,22 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 	u16 tones, rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u16 tx_retry_failed = 0, tx_retry_count = 0;
 	bool is_ampdu = false, is_ofdma;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
 		return;
 
-	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
+	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON)) {
 		is_ampdu =
 			HTT_USR_CMPLTN_IS_AMPDU(usr_stats->cmpltn_cmn.flags);
+		tx_retry_failed =
+			__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_tried) -
+			__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_success);
+		tx_retry_count =
+			HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
+			HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
+	}
 
 	if (usr_stats->tlv_flags &
 	    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS)) {
@@ -1557,6 +1565,8 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 		break;
 	}
 
+	arsta->tx_retry_failed += tx_retry_failed;
+	arsta->tx_retry_count += tx_retry_count;
 	arsta->txrate.nss = nss;
 	arsta->tx_duration += tx_duration;
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8aa74c9171f8..5a1726a145f5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11684,6 +11684,11 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->signal_avg += noise_floor;
 
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
+
+	sinfo->tx_retries = arsta->tx_retry_count;
+	sinfo->tx_failed = arsta->tx_retry_failed;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
 }
 
 static void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
@@ -11761,6 +11766,11 @@ static void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 		link_sinfo->signal_avg += ATH12K_DEFAULT_NOISE_FLOOR;
 
 	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
+
+	link_sinfo->tx_retries = arsta->tx_retry_count;
+	link_sinfo->tx_failed = arsta->tx_retry_failed;
+	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
 }
 
 static int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
-- 
2.34.1


