Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027FBC46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 04:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXahEYF6LWZRIvmoGt5ZgUHokkGBgoI68HUqngEQgtc=; b=NeTC2PYvpZ94romJ0s1qM2uxpp
	az7zf9K57US+RgkN91zIvRmQjVI3rRAK2KhJ400SOal+UXQknxI8xIDS0nAkRK9HLFCxH0SQKNd09
	OvjxkcpRWx2tHBZxJvVm3Lvg5Ml6eHB77CU2LiU5KwAmCJPgcxcljUIsj3/Ohi73JkIRJqR0GvoxN
	nbj/weAJOAgay+X/Csv4VgOImvg0LeBZLtc+y7BMEmzXBpWWm5YlzNQAPYAxuyioGQ0GLWjqE41VH
	Uk+XHRRDqe9zlPCAJg1Zt9VaOb29AAbOT4ikh7LdJ5pVlRK1YIvBUkTvtVoy1PCoS3iKCu6iWgSnh
	hRdV5CqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfLS-0000000FCIg-2O6M
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 04:03:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfLO-0000000FCGu-3u9m
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 04:03:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U3Fiqr006379;
	Tue, 30 Jan 2024 04:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=mXahEYF6LWZRIvmoGt5ZgUHokkGBgoI68HUqngEQgtc=; b=SZ
	tiwORPr1j5V6jmQQmZaR2mRo+nAFI5HxGZ6sQxk5TUOWmsrciLECW/57WE07jqiB
	cYPx2/Kznd3oSMziAX3llE3vzm5MuSx6WfT38kzYU7SwfRevgLEDJcEKgoAKNJG3
	tz/6BHnlZKSNaVGLX+N2SlmeVs3iRnGJ5yBMfRMCN7QIx4WAI34TNggZBuTJzyqW
	Gsdx9KxaTGTh0fDuGE93On34vMFc7xuuvbmMTaL32gDi90KE9URKbtQD7aPahOXZ
	etcshKwyEBo1gU+SvtBap+ryK8A+x7nV5pkLI2m1VnL375dBANs7wyEVUDA2NHQ9
	P+Lm2ryHWTJXCoiOFLaQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx9ya2cak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:03:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U43TwV026864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:03:29 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 20:03:27 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 02/11] wifi: ath12k: fix incorrect logic of calculating vdev_stats_id
Date: Tue, 30 Jan 2024 12:02:54 +0800
Message-ID: <20240130040303.370590-3-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130040303.370590-1-quic_kangyang@quicinc.com>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 91J7QY-qfgjys1vR_xD2ZPAdbkuqZhAX
X-Proofpoint-ORIG-GUID: 91J7QY-qfgjys1vR_xD2ZPAdbkuqZhAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=904 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_200331_114486_EB16E422 
X-CRM114-Status: GOOD (  12.95  )
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

During calculate vdev_stats_id, will compare vdev_stats_id with
ATH12K_INVAL_VDEV_STATS_ID by '<='. If vdev_stats_id is relatively
small, then assign ATH12K_INVAL_VDEV_STATS_ID to vdev_stats_id.

This logic is incorrect. Firstly, should use '>=' instead of '<=' to
check if this u8 variable exceeds the max valid range.

Secondly, should use the maximum value as comparison value.

Correct comparison symbols and use the maximum value
ATH12K_MAX_VDEV_STATS_ID for comparison.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v6: position adjustment.
v5: no change.
v4: no change.
v3: no change.
v2:
    1. add Tested-on tag of QCN9274.
    2. update copyright.

---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a27480a69b27..6d9660f68074 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5366,7 +5366,7 @@ ath12k_mac_get_vdev_stats_id(struct ath12k_vif *arvif)
 	do {
 		if (ab->free_vdev_stats_id_map & (1LL << vdev_stats_id)) {
 			vdev_stats_id++;
-			if (vdev_stats_id <= ATH12K_INVAL_VDEV_STATS_ID) {
+			if (vdev_stats_id >= ATH12K_MAX_VDEV_STATS_ID) {
 				vdev_stats_id = ATH12K_INVAL_VDEV_STATS_ID;
 				break;
 			}
-- 
2.34.1


