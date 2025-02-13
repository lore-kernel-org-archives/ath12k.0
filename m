Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D0DC021A0
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 18:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzDf3KOa5bW6zzNYV+sQTxb/LGZFhDNVVVgSlMS8ZR4=; b=uDKgONVsb+hFc5fcpqFJW5IljD
	DuGZrOgH9Kc3WThGtjkn18oh4TBjAPp3SzZeQs2LesQHQOPVWHP3er/GixmnxqdS8AxoY5eXexl6Y
	HSQ3IcdFAj71Sb9B58Jc6XTlQYe3q9KEtKwiFKKvQWKbVaDzWsfr7sLF8VPHQi0UfxvK2d3JVmsIO
	YHTqCEDoqrxH4z6Ip/ozjPBRaWNXXxyIUnIOptCTWtt0IHKnI5Wdn7MfqX4K994GYywUhKVrfu5am
	oyXUxsr8lCQASnwIT/eZmfYhBd3/pBgvqXOGvTIW8EUEKwSaJC4Md6xPDMnFuXhfRKxowGVLFd8Qc
	jIJZZLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidro-0000000CDSj-1Rb8
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 18:23:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tid4i-0000000C1Po-0bI0
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 17:32:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA2Gtl001950;
	Thu, 13 Feb 2025 17:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nzDf3KOa5bW6zzNYV+sQTxb/LGZFhDNVVVgSlMS8ZR4=; b=aIvKqwj0Gld6Yixe
	DPIkgaIFkIWsU2uS6PtwLyvMoWLAZ76TrBd95UqP4kqV/InGZm2phfJmn7VItW6a
	X6o9lNMhD/lK7MGDOZhd3z5qnz/6Px+I2DLLoLQP26Kuv7XybqJHXJLXkv8aNrzP
	FBJu/eSu8eJtcJ7TXD6T8mFrMszTZn/n/yixfbdzXv6OHFsLBeTu4CsUL3qMJPeP
	9YR1/zGmLm/sesP90mvSy8phRszPuuxqMhmTPhyAbPo5mySJcpdoMkxqsZy2z90I
	QTx/V6iPViYRte6A5ErnSi2qtCs0BIjQb2nIUw11khKh7Lu5uT6pU2QFYe50br4Y
	3rlGgA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44semp95et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:32:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DHWVbH029486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:32:31 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 09:32:29 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH v2 1/5] wifi: mac80211: correct RX stats packet increment for multi-link
Date: Thu, 13 Feb 2025 23:02:02 +0530
Message-ID: <20250213173206.1665731-2-quic_sarishar@quicinc.com>
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
X-Proofpoint-ORIG-GUID: K6X5VkmHieRPMbJeQS7I0t7JK7AEhgq-
X-Proofpoint-GUID: K6X5VkmHieRPMbJeQS7I0t7JK7AEhgq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=964 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_093232_185037_78764631 
X-CRM114-Status: GOOD (  13.12  )
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


