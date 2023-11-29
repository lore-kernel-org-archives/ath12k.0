Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6C6C4167B
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 02:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sR26c5iyikVvM5X38dv6F60PrpVDzkgfdqHkcng1z+o=; b=4nSABCtsgpAyf66vZQ8PC+LVJy
	CF7rfOSAiRiJaKBVfNK40x3CGKsBGNex3LYX6PkRQSBBLBWyXTl0DR5BrCZu7Z6VeRvbkf1Njlkvu
	RknK8d3XWclA6QIoGVfoGZuhBmyycnBagSPRNYFmxPpsB+uYiwVVcEvXrvF6Cf28r3S2dwRDmotEi
	O/qCzC/1Bb5gLQ2s1oQpFWYSRtxvx1dURAIgE/s5osQxdGmT3hLrXBnamwzeu/Cntru/yp5BzrS7y
	2GLDOjFf3xY5J4JaBSO6Q3AiYB2im1uI5A8YGjeitRXm3IvPEoIbzVIJAUeYwu2PmBRmKJcBEpTDM
	7qQVTK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r89wP-006oY7-0v
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 02:04:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r89wM-006oWz-35
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 02:04:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT1XEXj001147;
	Wed, 29 Nov 2023 02:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=sR26c5iyikVvM5X38dv6F60PrpVDzkgfdqHkcng1z+o=;
 b=LQnyUKjTyydEp+E5/qWdygUlAu3/cfhFBHdLZBu8Yt35Ve9Q3SxKCF3G2acfT8pXypu0
 RnXofW3cGew5MVJ3/CfKxue71a6GH3Fr+F7iaBT0hu90hLoe/Zdut8s5/dyJPJZiUxvB
 Xumi38I/jpEGlcLialnrzBU69GXNNMcYcZKnZT/hIYPgeYC+DpNKaS/PwJGXSUcTpRyp
 Nr4CxLrNlxXHq2D8F27tVr0OoxXK5oomUs2syeUBypO3pywLRLrlffWnNy+ytr/MARLP
 XYdbdWLZmPFMP+q9jsVkHSbKGZVost4Jtw4JRw7QCzMeGREfONa2+x3g+EXG1bj5S8pe KA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unkens93v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 02:04:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT24ZBN008793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 02:04:35 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 18:04:34 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 1/3] wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
Date: Wed, 29 Nov 2023 10:04:12 +0800
Message-ID: <20231129020414.56425-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231129020414.56425-1-quic_bqiang@quicinc.com>
References: <20231129020414.56425-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PkFKYIVDAQqNxipkPCJEFR9baCLt3cq1
X-Proofpoint-ORIG-GUID: PkFKYIVDAQqNxipkPCJEFR9baCLt3cq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=748 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_180439_052906_99678245 
X-CRM114-Status: GOOD (  12.91  )
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

Some fields of hal_reo_update_rx_queue structure are wrongly
defined, so fix it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v2:
 no change.

 drivers/net/wireless/ath/ath12k/hal_desc.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 6c17adc6d60b..ec204939e50c 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -2500,13 +2500,13 @@ struct hal_rx_reo_queue {
 #define HAL_REO_UPD_RX_QUEUE_INFO1_PN_HANDLE_ENABLE		BIT(30)
 #define HAL_REO_UPD_RX_QUEUE_INFO1_IGNORE_AMPDU_FLG		BIT(31)
 
-#define HAL_REO_UPD_RX_QUEUE_INFO2_BA_WINDOW_SIZE		GENMASK(7, 0)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_SIZE			GENMASK(9, 8)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_SVLD				BIT(10)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_SSN				GENMASK(22, 11)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_SEQ_2K_ERR			BIT(23)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_ERR			BIT(24)
-#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_VALID			BIT(25)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_BA_WINDOW_SIZE		GENMASK(9, 0)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_SIZE			GENMASK(11, 10)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_SVLD				BIT(12)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_SSN				GENMASK(24, 13)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_SEQ_2K_ERR			BIT(25)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_ERR			BIT(26)
+#define HAL_REO_UPD_RX_QUEUE_INFO2_PN_VALID			BIT(27)
 
 struct hal_reo_update_rx_queue {
 	struct hal_reo_cmd_hdr cmd;
-- 
2.25.1


