Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A95C4167B
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 02:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLYNQkj8FvlppKlPPuRRVPtLHORqbWX61BhzXxljw/o=; b=il+kCxS0VkDvYUpqIB4kwMxXKY
	+FTBQRZF+McQfRaXCGHTWngaIzEvEk9mOnubfmCa1ziZtpUuWPcAoqvAmXriIuirP99sX7YoKKZsM
	5z8K9JKCA2wIefrQY8p01dHrVoSzWYskXniGhN5AI5b53n89a/+t5+ZeqwJnNSxc2kvKx3d7/3ATv
	vAl0KrPb3BuI462Ct2ypQzriM5vhr77GfARM4cZzzNx2noBhhSdqhBMyd7okdT3QBAVUjwoI9mWRw
	7oQ7jerlmgkQhYFrl8KYqeSkdYHceZzQyFHdd02iLJ72WErTOSR66ncVRwW+6gW+OXg2VPY7+2+Bb
	sNbH//Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r89wS-006oYp-09
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 02:04:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r89wM-006oX3-35
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 02:04:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT1u8oc012440;
	Wed, 29 Nov 2023 02:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=FLYNQkj8FvlppKlPPuRRVPtLHORqbWX61BhzXxljw/o=;
 b=YYwr8XvZqym/G3v3/Z4tR9PgU51PQD1yTfgu8KObIoyQ8d3tn2EvkqwlDtCWEq+o435/
 6Hn9WagCxhNXGnN4OoOAF8b3P8Ng/WBZ1eK4+f5/diZJptu3MgqEnAiNdofHAQyQlKWv
 672OyuQIcm6v+RGSFdleXcjq//hm4InebTlkKM8ugEldMth92OeJ0O+TAgdCAEzHDEHX
 myb7U31CYKobBTgAY+yPeb747aVbtAYfTFN3+hfzLLjJy11h2QwPhwEGoLV45C/Q6Fhm
 Sip4PhNbEfZs+GlM03z7398wVLYoQ5WmK7hYRAuyNuiM/axmFpyk/FpioIoArMbHqzo7 Ow== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unmra8y8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 02:04:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT24bS0025271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 02:04:37 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 18:04:35 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 2/3] wifi: ath12k: add support for BA1024
Date: Wed, 29 Nov 2023 10:04:13 +0800
Message-ID: <20231129020414.56425-3-quic_bqiang@quicinc.com>
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
X-Proofpoint-GUID: V983sTfUXftAxv-2l8e7odOWVWp1cR_j
X-Proofpoint-ORIG-GUID: V983sTfUXftAxv-2l8e7odOWVWp1cR_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_27,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=923 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_180439_053250_BF1219C8 
X-CRM114-Status: GOOD (  20.04  )
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

Currently the maximum block ACK window size supported is 256.
This results in that, when connected to an AP which supports
larger BA sizes like BA512 or BA1024, only BA256 is
established, leading to a lower peak throughput.

So add support for BA1024, this is done by allocating a larger
REO queue and advertising IEEE80211_MAX_AMPDU_BUF_EHT support
to MAC80211.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v2:
 1. s/doen/done/
 2. update struct hal_rx_reo_queue_1k.

 drivers/net/wireless/ath/ath12k/dp.h       |  2 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h |  6 ++++++
 drivers/net/wireless/ath/ath12k/hal_rx.c   | 11 ++++++++---
 drivers/net/wireless/ath/ath12k/mac.c      |  2 +-
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 61f765432516..50db1403ebce 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -145,7 +145,7 @@ struct ath12k_pdev_dp {
 
 #define DP_RX_HASH_ENABLE	1 /* Enable hash based Rx steering */
 
-#define DP_BA_WIN_SZ_MAX	256
+#define DP_BA_WIN_SZ_MAX	1024
 
 #define DP_TCL_NUM_RING_MAX	4
 
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index ec204939e50c..63340256d3f6 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -2517,6 +2517,12 @@ struct hal_reo_update_rx_queue {
 	__le32 pn[4];
 } __packed;
 
+struct hal_rx_reo_queue_1k {
+	struct hal_desc_header desc_hdr;
+	__le32 rx_bitmap_1023_288[23];
+	__le32 reserved[8];
+} __packed;
+
 #define HAL_REO_UNBLOCK_CACHE_INFO0_UNBLK_CACHE		BIT(0)
 #define HAL_REO_UNBLOCK_CACHE_INFO0_RESOURCE_IDX	GENMASK(2, 1)
 
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index f6afbd8196bf..6fa874a93d3a 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -688,23 +688,28 @@ void ath12k_hal_reo_update_rx_reo_queue_status(struct ath12k_base *ab,
 
 u32 ath12k_hal_reo_qdesc_size(u32 ba_window_size, u8 tid)
 {
-	u32 num_ext_desc;
+	u32 num_ext_desc, num_1k_desc = 0;
 
 	if (ba_window_size <= 1) {
 		if (tid != HAL_DESC_REO_NON_QOS_TID)
 			num_ext_desc = 1;
 		else
 			num_ext_desc = 0;
+
 	} else if (ba_window_size <= 105) {
 		num_ext_desc = 1;
 	} else if (ba_window_size <= 210) {
 		num_ext_desc = 2;
-	} else {
+	} else if (ba_window_size <= 256) {
 		num_ext_desc = 3;
+	} else {
+		num_ext_desc = 10;
+		num_1k_desc = 1;
 	}
 
 	return sizeof(struct hal_rx_reo_queue) +
-		(num_ext_desc * sizeof(struct hal_rx_reo_queue_ext));
+		(num_ext_desc * sizeof(struct hal_rx_reo_queue_ext)) +
+		(num_1k_desc * sizeof(struct hal_rx_reo_queue_1k));
 }
 
 void ath12k_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fc0d14ea328e..3cfb17f71aa6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7474,7 +7474,7 @@ static int __ath12k_mac_register(struct ath12k *ar)
 	ar->hw->queues = ATH12K_HW_MAX_QUEUES;
 	ar->hw->wiphy->tx_queue_len = ATH12K_QUEUE_LEN;
 	ar->hw->offchannel_tx_hw_queue = ATH12K_HW_MAX_QUEUES - 1;
-	ar->hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
+	ar->hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_EHT;
 
 	ar->hw->vif_data_size = sizeof(struct ath12k_vif);
 	ar->hw->sta_data_size = sizeof(struct ath12k_sta);
-- 
2.25.1


