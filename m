Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A5FCE7AFB
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 05:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jN00DCcLABTB6032In5p9UTlX72QAEL+SMr8SBX2a4s=; b=KX8zh5VvRCbREk
	cpPGjojhbPMGo4d9AOPRZbafz47c6akVD07TR8OkuN/odfA23E3rkC57RmlJc2ttobLKSv8pYIs+r
	8BKAhE7zVfUuHr9Wajvokw990J1PuK5zLrs181nTs+My/efMX4TF/JGsvMXk02hKQBwQxX2hzkPsz
	RFf56FSXUkDRdtiYjclsMeXtHoXPaLYzHg7IOk51D5fH9XLNRbBZZ6s6tKOVfmTKa8x1OovWnE9Ru
	uFmWQMKdT27f2ITS4NDZtkQshqT4pVXNgsgJDMDjriucLMokvrtxP6qB6l0uoTkpGWAtscaQLiEvT
	Muvs4HfYt0y2/+WY6Eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qljvI-002KLy-1K
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 05:50:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qljvF-002KKZ-0s
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 05:50:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38S5PfA9020430;
	Thu, 28 Sep 2023 05:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=h93u0m4Baq1x/Lrg5OXE2hHmB1BPlotWgBEozBxJ6dA=;
 b=fIWaJrEuuXepcZXx8bYMnz/RAa7uI8EW7nnsvj91qU5V4o8TLvGb71hEmHOI7XqPO4as
 ZXJv2dlx2Ru1XdlN8vLfaE2D374gNoZvL9tiTaV4DyMu03iPGs+LglGxizs7ECwQWxKw
 gjWbwMeDZMVcBNMmqpWAgOPC6QzMQAfubP6KpbKkCqqegp5Uxhk78dR39JmJAoDkETcJ
 lYOqlzgw9/6dVxVBZGWyLlj+z0xRo86qzGA16Vunebl6te7v/gtSleLoDGX7HZ8YfY9C
 yDp3YqC+CsJdp+x/biSUqLp5nWlxV35gGzg3JGmXJyq0ZF0RYCJiNUhePa9x6MO4sbIM JA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tc8v4b525-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 05:50:46 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38S5ojeP005045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 05:50:45 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 27 Sep 2023 22:50:44 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 2/4] wifi: mac80211: mlme: correct the verification of extracted bitmap
Date: Thu, 28 Sep 2023 13:50:20 +0800
Message-ID: <20230928055022.9670-3-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928055022.9670-1-quic_kangyang@quicinc.com>
References: <20230928055022.9670-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wE_R_Wn8rbvglOW510Jpq7-CQCZisleq
X-Proofpoint-ORIG-GUID: wE_R_Wn8rbvglOW510Jpq7-CQCZisleq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_03,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=732 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_225049_465783_7977CAF7 
X-CRM114-Status: GOOD (  15.41  )
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

Mac80211 will extract puncturing bitmap according to the negotiated
bandwidth. After extraction, should check the new puncturing bitmap
according to the negotiated bandwidth, but here input the original bitmap.

When bandwidth downgrade occurs, this function may return an error even
though negotiated bandwidth and puncturing bitmap match correctly.

So correct it.

Fixes: aa87cd8b3573 ("wifi: mac80211: mlme: handle EHT channel puncturing")
Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 net/mac80211/mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 16e15ced28a5..13fba1f1cd89 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -145,7 +145,7 @@ ieee80211_handle_puncturing_bitmap(struct ieee80211_link_data *link,
 			ieee80211_extract_dis_subch_bmap(eht_oper, chandef,
 							 bitmap);
 
-		if (cfg80211_valid_disable_subchannel_bitmap(&bitmap,
+		if (cfg80211_valid_disable_subchannel_bitmap(&extracted,
 							     chandef))
 			break;
 		link->u.mgd.conn_flags |=
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
