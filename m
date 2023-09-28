Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B8CE7AF8
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 05:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCNGzlCJswEUfbWkocbyihQtoG+aWwyW7ZLKZ4HBQ5Y=; b=LS6ujm848qgseT
	uiiAJu6O+fmUHH7TiyS9DRQA9HgIxnE8kNlNeZ5y7pUJUb2DliQASV8Xm21ffigEuRI/ezbSlQ6aI
	rpQZHtTLr31utd2McKDBoVaauSgNAHtefT9okxqDN/jmBFCDy16e8ZKLvTOTgJCLOS1s2GLECfMU8
	f3cI7YRDXwM0CxgBSg0yZY0IWezLtWKlobu9ftlb2E6ytCHkU6nKRtuTWIFM6gJgaqS2eVcM+VOoC
	aZR4v8WJsIl/l2iwcp5QCMuwEB8eqd/YVMQfQmf3Iy7WbIeWU7/iUZ/HeIDrbHPg9doBe0Ywg6X/j
	MqZI9CyDJZLzwtIiAVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qljvL-002KMl-0j
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 05:50:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qljvF-002KKY-0z
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 05:50:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38S5bJKY024399;
	Thu, 28 Sep 2023 05:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=8NufhEFwfy5Wf8YL0D5qvqvQsli/DzRMizuNzlsv/ik=;
 b=kBl5v5dh169FwvK5gxuz6l15nt0lAVjbf8bXtKTFLRIrX3zLWzOI02qDQzsfLyCXf9ol
 DAidetlgkodm8xE57HE89arUFlHaJmMd7Ny1iRI/vL/0zIQfO8nA60QNAs1Ef4Pjwptp
 Fprb4uLTXJr2mcPZ6C8JVDXzuVShc+5Ku8SpJfzB2CGHE6BcgInStlWrf3IUb58H/o2K
 wZCMtJo8ObcZs33ZhNy3DGrJ0VJbuzj1DNPBxG8tru7W/GkC2pb+7xCPBZQhWNyA28b8
 1eSyaz7s/8AKpMlQMUA3JeS1TIcj6WR9kQmBLrpIpB7+pyEIm5uf0r7yJWpeglRZh6Zo 9A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tcfp6jgtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 05:50:46 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38S5oix0005029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 05:50:44 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 27 Sep 2023 22:50:42 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 1/4] wifi: mac80211: mlme: fix verification of puncturing bitmap obtained from AP
Date: Thu, 28 Sep 2023 13:50:19 +0800
Message-ID: <20230928055022.9670-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928055022.9670-1-quic_kangyang@quicinc.com>
References: <20230928055022.9670-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fOL117nT5iUiBAdXCtcsv0j2SfH5KlP0
X-Proofpoint-GUID: fOL117nT5iUiBAdXCtcsv0j2SfH5KlP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_03,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_225049_465794_0046F6B4 
X-CRM114-Status: GOOD (  17.66  )
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

Puncturing bitmap and bandwidth is included in beacon's EHT Operation
element. After receiving beacon, mac80211 will verify if they are match.
But the bandwidth used for verification is incorrect. Because bandwidth
in link->conf->chandef is a negotiated bandwidth, it may be downgraded.
Should use bandwidth included in beacon. Otherwise when bandwidth
downgrade occurs, even if the received values match, an error may be
returned.

Also, checking if bitmap and bandwidth match should be done before
extraction. But here extract first and then check.

So fix these two issues.

Fixes: aa87cd8b3573 ("wifi: mac80211: mlme: handle EHT channel puncturing")
Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 net/mac80211/mlme.c | 54 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index f93eb38ae0b8..16e15ced28a5 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -5670,11 +5670,33 @@ static bool ieee80211_rx_our_beacon(const u8 *tx_bssid,
 	return ether_addr_equal(tx_bssid, bss->transmitted_bss->bssid);
 }
 
+static enum nl80211_chan_width
+ieee80211_rx_bw_to_nlwidth(enum ieee80211_sta_rx_bandwidth bw)
+{
+	switch (bw) {
+	case IEEE80211_STA_RX_BW_20:
+		return NL80211_CHAN_WIDTH_20;
+	case IEEE80211_STA_RX_BW_40:
+		return NL80211_CHAN_WIDTH_40;
+	case IEEE80211_STA_RX_BW_80:
+		return NL80211_CHAN_WIDTH_80;
+	case IEEE80211_STA_RX_BW_160:
+		return NL80211_CHAN_WIDTH_160;
+	case IEEE80211_STA_RX_BW_320:
+		return NL80211_CHAN_WIDTH_320;
+	default:
+		WARN_ON(1);
+		return NL80211_CHAN_WIDTH_20;
+	}
+}
+
 static bool ieee80211_config_puncturing(struct ieee80211_link_data *link,
 					const struct ieee80211_eht_operation *eht_oper,
 					u64 *changed)
 {
+	struct cfg80211_chan_def rx_chandef = link->conf->chandef;
 	u16 bitmap = 0, extracted;
+	u8 bw = 0;
 
 	if ((eht_oper->params & IEEE80211_EHT_OPER_INFO_PRESENT) &&
 	    (eht_oper->params &
@@ -5684,6 +5706,28 @@ static bool ieee80211_config_puncturing(struct ieee80211_link_data *link,
 		const u8 *disable_subchannel_bitmap = info->optional;
 
 		bitmap = get_unaligned_le16(disable_subchannel_bitmap);
+		bw = u8_get_bits(info->control, IEEE80211_EHT_OPER_CHAN_WIDTH);
+		rx_chandef.width = ieee80211_rx_bw_to_nlwidth(bw);
+
+		if (rx_chandef.width == NL80211_CHAN_WIDTH_80)
+			rx_chandef.center_freq1 =
+				ieee80211_channel_to_frequency(info->ccfs0,
+							       rx_chandef.chan->band);
+		else if (rx_chandef.width == NL80211_CHAN_WIDTH_160 ||
+			 rx_chandef.width == NL80211_CHAN_WIDTH_320)
+			rx_chandef.center_freq1 =
+				ieee80211_channel_to_frequency(info->ccfs1,
+							       rx_chandef.chan->band);
+	}
+
+	if (!cfg80211_valid_disable_subchannel_bitmap(&bitmap,
+						      &rx_chandef)) {
+		link_info(link,
+			  "Got an invalid disable subchannel bitmap from AP %pM: bitmap = 0x%x, bw = 0x%x. disconnect\n",
+			  link->u.mgd.bssid,
+			  bitmap,
+			  rx_chandef.width);
+		return false;
 	}
 
 	extracted = ieee80211_extract_dis_subch_bmap(eht_oper,
@@ -5695,16 +5739,6 @@ static bool ieee80211_config_puncturing(struct ieee80211_link_data *link,
 	    extracted == link->conf->eht_puncturing)
 		return true;
 
-	if (!cfg80211_valid_disable_subchannel_bitmap(&bitmap,
-						      &link->conf->chandef)) {
-		link_info(link,
-			  "Got an invalid disable subchannel bitmap from AP %pM: bitmap = 0x%x, bw = 0x%x. disconnect\n",
-			  link->u.mgd.bssid,
-			  bitmap,
-			  link->conf->chandef.width);
-		return false;
-	}
-
 	ieee80211_handle_puncturing_bitmap(link, eht_oper, bitmap, changed);
 	return true;
 }
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
