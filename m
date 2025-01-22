Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5FBC0218C
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzDf3KOa5bW6zzNYV+sQTxb/LGZFhDNVVVgSlMS8ZR4=; b=00VxzK1hlAaKWZZvGw7CSbaPhO
	w2e978p/EDCtWfTSL5SxlOMhsIRvKBlLsTpkbnc9zxiJHtWjFIDKnpOLjnTf9Tv6MZe2xbhvYvPSO
	ou2loIGFbQj7fdJThavr7zOAfXZlhwNaOSs1UK29ItMes+5vWRCW+CUJy5ffaA1lxVWr2hFTCIb5r
	7z3Zw4EUfxMdDINjUCJmcGCfNrYcZkIhdBhbBC6VdHYvxxIOcvSDLIvJVCSUfOZ9XpnmAor5bp01q
	4ZFv6U8BYgzMNK4+P2VgczqJL4lSVxNhvbBmoJUOkaKGKRBQoB4vqPJpiD8MEBD/6PZGFCvXG2vvm
	W/RAXi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taau2-0000000AImR-1v1N
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 13:36:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taat0-0000000AIf1-2VMU
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 13:35:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MB1Z33003826;
	Wed, 22 Jan 2025 13:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nzDf3KOa5bW6zzNYV+sQTxb/LGZFhDNVVVgSlMS8ZR4=; b=m0e9nsHi9rG8wzhq
	IuizmMUHCW27iRx+b4Yq79PAHPeFcu6V3svqTYTsiczLEuddbldV0OOyueXNcL0e
	6uA453z3Ipl2XYpMhpwn+CqmLuFGcNCTA1DHWmsrYj8yZUCQff8Un6OXwsKkTYjZ
	RDETxDU4fluJ6+L0mXRJcmSa0q23UNLuPg5+t2znDMrDE8qftJK9LNHh1t4K3G2C
	pzZwTWNInUHNkgZYEc2O9iy8OkgR56A1p8gR1Bqdta0Hy87nhZI3TllNTPEd+dBp
	E9nqVzP++2m4YGYFPnQvyAbLZWh74DEsUd4YnM2mfbwk1qO5TecKY9iUSU7BbZHG
	AELofA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ayehgbn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 13:35:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MDZDSd011342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 13:35:13 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 Jan 2025 05:35:11 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH RFC 1/3] wifi: mac80211: correct RX stats packet increment for multi-link
Date: Wed, 22 Jan 2025 19:04:22 +0530
Message-ID: <20250122133424.1226555-2-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122133424.1226555-1-quic_sarishar@quicinc.com>
References: <20250122133424.1226555-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y2FX0gf8ObuD53VR1mPhRLVWN_flgSoS
X-Proofpoint-ORIG-GUID: Y2FX0gf8ObuD53VR1mPhRLVWN_flgSoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=971 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_053514_638754_009F07A6 
X-CRM114-Status: GOOD (  14.13  )
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

Currently, RX stats packets are incremented for deflink member for
non-ML and multi-link(ML) station case. However, for ML station,
packets should be incremented based on the specific link.

Therefore, if a valid link_id is present, fetch the corresponding
link station information and increment the RX packets for that link.
For non-MLO stations, the deflink will still be used.

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 net/mac80211/rx.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 1e28efe4203c..eb3e2d550c8f 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -231,8 +231,19 @@ static void __ieee80211_queue_skb_to_iface(struct ieee80211_sub_if_data *sdata,
 
 	skb_queue_tail(&sdata->skb_queue, skb);
 	wiphy_work_queue(sdata->local->hw.wiphy, &sdata->work);
-	if (sta)
-		sta->deflink.rx_stats.packets++;
+	if (sta) {
+		struct link_sta_info *link_sta_info;
+
+		if (link_id >= 0) {
+			link_sta_info = rcu_dereference(sta->link[link_id]);
+			if (!link_sta_info)
+				return;
+		} else {
+			link_sta_info = &sta->deflink;
+		}
+
+		link_sta_info->rx_stats.packets++;
+	}
 }
 
 static void ieee80211_queue_skb_to_iface(struct ieee80211_sub_if_data *sdata,
-- 
2.34.1


