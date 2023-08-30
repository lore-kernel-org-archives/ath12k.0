Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9B9C6FA8F
	for <ath12k@archiver.kernel.org>; Wed, 30 Aug 2023 02:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6dMZ3uVdzIg/FhFO9nHujLZw2S/g6dRjjd4cHsloM48=; b=hJeXk2dtNT+lNj
	0QFU9vY+wlADGQmMADz1S1s0hCvP0NwSbAyzTcLnOUGRVgYD0v8Zgivf6Z+awk3ZKFMwSnIrvHfN1
	hwYYq5zNdDkRdTaepwxqai7dVM1Orx0HxjJiIXBhgmSv65vnOand7ZDnUo5HH2fN4kNMccbr/1YQW
	g38NBxkikemdd0z6z0LJLc6gs4d0XHONfibtdpxeoy54bozkL4FJTHHJ5nSK6deq5dvTJvEwPnw/R
	C1em4Q1ruAtr5uZo18go2mhvkPtjK/V7QeOfDSaRwR3Y2tNUGohBPg9MLG7kJr+OZQxHb52WRpv//
	fPBY6xo98mORO643cvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbAgQ-00CbvT-2R
	for ath12k@archiver.kernel.org;
	Wed, 30 Aug 2023 02:11:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbAgN-00Cbv5-0W
	for ath12k@lists.infradead.org;
	Wed, 30 Aug 2023 02:11:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37U1Ubmu015968;
	Wed, 30 Aug 2023 02:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Duu9okkbYfP9xoqLhr72dovNWVSGEARPq0KAlwVjnu0=;
 b=Abqv0Rm+B9u1Nz7GgVAcV1i5AbvqsA4SDlQAlA/7uAjceQSJdmyf2S3R4MtvCHtf5SQo
 ww2LHOQ0CkE5LN6LGN0SteNedBOY6wb049VlvJ/Dhp8oCVNdZ6FH0QEZV71LzT/LODrO
 cEeIch4OwpdUUsDrjS6FqKTas/3GbmlrNVZLJ6UhroS/2WA0trB+T2NSMJxdfkBLWTj3
 DO4x95ZH3SmSAiLuH9m7eXQ1AEgJC66PVQfy+RNXqNgswmXuucXWPGsnkYwx3MqjZVPz
 AYE9do+nXYU6yLsTRBmZRs/RPZgG/TZ2U2ZeHxEZp9g/Aq26Ho3xMcUjq41YbAOoAVWN 5Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssv0y02ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 02:11:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37U2BkhP030533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 02:11:46 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 29 Aug 2023 19:11:44 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath12k: fix DMA unmap warning on NULL DMA address
Date: Wed, 30 Aug 2023 10:11:31 +0800
Message-ID: <20230830021131.5610-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aqECxv9xe0WoVowN3lVlxuWlFknInZkW
X-Proofpoint-ORIG-GUID: aqECxv9xe0WoVowN3lVlxuWlFknInZkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=650 suspectscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_191147_226398_48E0C374 
X-CRM114-Status: GOOD (  13.53  )
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

In ath12k_dp_tx(), if we reach fail_dma_unmap due to some errors,
current code does DMA unmap unconditionally on skb_cb->paddr_ext_desc.
However, skb_cb->paddr_ext_desc may be NULL and thus we get below
warning:

kernel: [ 8887.076212] WARNING: CPU: 3 PID: 0 at drivers/iommu/dma-iommu.c:1077 iommu_dma_unmap_page+0x79/0x90

Fix it by checking skb_cb->paddr_ext_desc before unmap it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 8874c815d7fa..c0ae2fd443cc 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -330,8 +330,10 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
 
 fail_unmap_dma:
 	dma_unmap_single(ab->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
-	dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-			 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+	if (skb_cb->paddr_ext_desc)
+		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
+				 sizeof(struct hal_tx_msdu_ext_desc),
+				 DMA_TO_DEVICE);
 
 fail_remove_tx_buf:
 	ath12k_dp_tx_release_txbuf(dp, tx_desc, pool_id);

base-commit: a62b0aeb556839fb6abb9835874443b08fe95598
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
