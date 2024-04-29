Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321F5C4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzTLQKnYkw+ANPl8FCd5UeC1peBNswiKPMrja0yUnsQ=; b=xyclpmWdVmikZFOcBilJvwcTHj
	7UzFYfDuQDzTaRjbaq/WMO/6yjwUaLA828glxKZ2HhssEAr3dWk0qfBcEXz2pXE6RcCB0jnE/eyaD
	dK51C9L00GlwWm/4l6/LtCI3RYgimP50NOujBVmY+1n4/8aB3efileYYSTcIPEYrV7DOIKOA7Mwlj
	jpgycUwNp8adDBevc5qzwc9Clxd3GMA24YcJRwHw5bCr/04MNl4cHaGIe4aoBxnbfLg8yq/p/KBrl
	h842f1lXpZN9feN5lp2tJvpKDeqXvJmLnM5A2R7i94ZyLLEyF5cw071a+XTpfFfR74ePToMaXaD/g
	ZUobavZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PWV-00000002WoT-3JgV
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 11:50:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PWP-00000002Wjm-20Ya
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 11:50:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T5qL6R024699;
	Mon, 29 Apr 2024 11:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=kzTLQKnYkw+ANPl8FCd5UeC1peBNswiKPMrja0yUnsQ=; b=Vc
	i1H4dwuNT5GoOlGJ1LKTQAkUcefjpPHJu90O0YW/9VgKHqV8+hupYlL46wsi9RoS
	3Q42KGUnwOqjXGm/M6FSDwJX8xFUaMGTk+t70v60jLpe5tKAqT0T1OlMEcTZjnLg
	KfWW2wfMH58lUmcBEaBBrlNCgFgL9ME6UTh9spzwXJEUitwcgZsoX+xRu6eEA59e
	ctU+KUH37172hmIfkweX/Yd00uGbPRY8lqDWPVkn6mqMYwUtsBEqido74IPX6iCU
	BZ4OqtG0yzohpgRTkiGDAfXZ/jC2ex5whRWM94JqvCnL3w7ZrQpy9VRlAMNY/XjC
	o+CCqh+l71TFPGp6QFpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrt4kujh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 11:50:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TBncTl010404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 11:49:38 GMT
Received: from hu-kathirve-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 04:49:35 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sven Eckelmann <sven@narfation.org>,
        Sarika Sharma <quic_sarishar@quicinc.com>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
Subject: [PATCH v3 1/2] wifi: ath12k: Don't drop tx_status when peer cannot be found
Date: Mon, 29 Apr 2024 17:18:40 +0530
Message-ID: <20240429114841.413901-3-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429114841.413901-1-quic_kathirve@quicinc.com>
References: <20240429114841.413901-1-quic_kathirve@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HWAZwapiYJ4HHE4n90Ar-BJeKOweWkb0
X-Proofpoint-ORIG-GUID: HWAZwapiYJ4HHE4n90Ar-BJeKOweWkb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_08,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_045013_684637_997899BD 
X-CRM114-Status: GOOD (  16.11  )
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

From: Sven Eckelmann <sven@narfation.org>

When a station idles for a long time, hostapd will try to send a QoS Null
frame to the station as "poll". NL80211_CMD_PROBE_CLIENT is used for this
purpose. And the skb will be added to ack_status_frame - waiting for a
completion via ieee80211_report_ack_skb().

But when the peer was already removed before the tx_complete arrives, the
peer will be missing. And when using dev_kfree_skb_any (instead of going
through mac80211), the entry will stay inside ack_status_frames. This IDR
will therefore run full after 8K request were generated for such clients.
At this point, the access point will then just stall and not allow any new
clients because idr_alloc() for ack_status_frame will fail.

ieee80211_free_txskb() on the other hand will (when required) call
ieee80211_report_ack_skb() and make sure that (when required) remove the
entry from the ack_status_frame.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Link: https://lore.kernel.org/r/20230802-ath11k-ack_status_leak-v2-1-c0af729d6229@narfation.org
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 9b6d7d72f57c..6a387f1f9567 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -448,6 +448,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 				       struct hal_tx_status *ts)
 {
 	struct ath12k_base *ab = ar->ab;
+	struct ath12k_hw *ah = ar->ah;
 	struct ieee80211_tx_info *info;
 	struct ath12k_skb_cb *skb_cb;
 
@@ -466,12 +467,12 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	rcu_read_lock();
 
 	if (!rcu_dereference(ab->pdevs_active[ar->pdev_idx])) {
-		dev_kfree_skb_any(msdu);
+		ieee80211_free_txskb(ah->hw, msdu);
 		goto exit;
 	}
 
 	if (!skb_cb->vif) {
-		dev_kfree_skb_any(msdu);
+		ieee80211_free_txskb(ah->hw, msdu);
 		goto exit;
 	}
 
-- 
2.34.1


