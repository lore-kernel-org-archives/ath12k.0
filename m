Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2436C197BF
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 04:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzDf3KOa5bW6zzNYV+sQTxb/LGZFhDNVVVgSlMS8ZR4=; b=u6YXuiuv9PW+ZbOWTyfT3sWFup
	j8dls9/Vy5XEE4miEogGpE+pM17A7vtorwD3FtMwhg5YHnSm+huSlXA2B8Q1J5/QwUM9baA7UW8Ym
	6PDNA16wxIaozTFGbrPDiFUX2CB3JlW9iU4b7guKpndmAYDVAe32/J3GkTmSR3Qw6rDqBTpkG3lqU
	o3quDz1lGY2G5cDWnNlv2oyiq20aP6E8G8F3/mmcIZP2APSqSe20EHXMDQ18SZIsH5wIDkuyNCaa9
	v7X3pcnv2FJVVSjRSxxN4RKV5MaBlBHDUsvo5jZEo+EwH8dzVs+cUdeHWn73GDm+il5qHaFeDQrP0
	eF7E/WJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVz0-00000006Kd8-1zlx
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 04:58:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVyx-00000006KbO-1eJV
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 04:58:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QKna2W012246;
	Thu, 27 Feb 2025 04:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nzDf3KOa5bW6zzNYV+sQTxb/LGZFhDNVVVgSlMS8ZR4=; b=UaW1t4UWwP3gDyCt
	GOy/sXZiFk10dMwJPxiuT+InkUD0BvekOopkRQkW/QdDErLZA++eMGDy/4m7XNq8
	SKCIKFYxUoA5mJPFIj4eWvmIxzQGlYQgqtHSO4pGfN5t/YFkaPcAP0RiYt+qTQlC
	f281AJPAA4pq/eX7J7cRAL/p2Be1ebpSwpbHab/HbQD4cMU+aS5NQK72lGeP3ccx
	TvzO5tWOBol1KPjM2nsRAbl115S7I/yzsCxb8CWZO+xJ9nDUf7JZOouyMZCFsbRa
	WPsxgw3Am7aI2wybD4fzaLZlcNU6eL4bUz9QE39l2/Kkn9PN1/zVZN6pKtGLR+aO
	xSa8/g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk4ahw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:58:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R4wiTV010805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:58:44 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 20:58:42 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH v3 1/5] wifi: mac80211: correct RX stats packet increment for multi-link
Date: Thu, 27 Feb 2025 10:28:20 +0530
Message-ID: <20250227045824.91480-2-quic_sarishar@quicinc.com>
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
X-Proofpoint-GUID: 8MkHOS5Jqt4-THzKQEcUxw2sLd4itjP7
X-Proofpoint-ORIG-GUID: 8MkHOS5Jqt4-THzKQEcUxw2sLd4itjP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=970 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_205847_552714_A4BE67B8 
X-CRM114-Status: GOOD (  13.74  )
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


