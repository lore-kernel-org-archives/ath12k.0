Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3900AC36002
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 05:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QutkmXyXq5eFcTbka2zGCG4N7MhPJeanGDVN3nOrxjU=; b=DC3clywOOI933jtwyIdeINq9w7
	78BS2Vu7St/zZLFwjBIbdeUs5z6+8UF/07d3r9YN2PkCzlXZasW7WskJox63Fcy+PpX1JMWtgJOeJ
	b/VFf9CDXjHJ3IVyAwmRhXj8WxQw1oGwVmOIREF6yLWWTbRUERQdBOqC2xI4OcPeaZXfHLYESChJQ
	xpT6q3sDrRdbBg4umrsIpyGZpxDSc3eGrDaKtUmSt0AbVqVesLGIUYLPYqIkCfcehffc+sjuqloXR
	YSv432eoRCB1lW5YoEG4v54akAhOaC2g1FK2uQIEwPybdF9IxxPHuBJ+nv9cXjluymInTl4DmxKcI
	nxdn14Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Nxo-000000069OG-3St8
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 05:27:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Nxm-000000069No-25ao
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 05:27:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZ8w4006958
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 05:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QutkmXyXq5eFcTbka2zGCG4N7MhPJeanGDV
	N3nOrxjU=; b=oRDIs2yjaaJ/WQhqS55adZWdKXHNpGsN3KMZ1/QcjuZTw6LYSF1
	VveqhmwZOVvwO/a9b0XHKKsQclkcwjpXOavNdHqyDH2F5Fx14nW/sSpXAYGSWJPP
	D/0mbekBL/G2g/1YmlMnLCbfZ6bL6KrCCNIxMWXqo/AYP+UhFevm6JDWT8eYt1Qi
	oTUo87UviU/GgQK+r1xqpL3tAD+mmsJWVFf9JnIw37VpqnzYkjpLYVGcDwCSV6k1
	U3XtnlB34j9tGFSh5DBCzpOy7LNDWRfLmnPr7VGQRJSUIxSPyB3hvTyRTs8wisbX
	QSGptSxJuhhO+9Aot1hOI0/UzDvs1eP3HTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3j43m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 05:27:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-229170fbe74so51869065ad.2
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 22:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744176419; x=1744781219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QutkmXyXq5eFcTbka2zGCG4N7MhPJeanGDVN3nOrxjU=;
        b=ZlhMAZJeVSiMtkdEGft1x0EKNfRHWxcrbfHrBd9PzckrRubNmiv7ZUnWwORJ47HDgH
         aGMEOqQ5L58Xvns+drOqU79//Ruc0LU0MPg2PNX9i4mrbacsk4Ncg0iZ294LWNvFd9wn
         xn9C9iw4tpXZOn2030X9QExHs/0XQaT2C1XMStGCu3wtHozeXKHX+ua54mo19wz4K405
         TSDUXvtl6EGqrk1DI+I8wi4QmZWbskPN9Z2voxaetiMxp5TNRfpIHGvyhT5dIMqzwzhe
         qWDF733L7t1t+2l+WmnhduLlw+jIFFqcL988rtIEAmf12fQtF4ab5j3i8xZeHMUZS8rE
         zeDg==
X-Gm-Message-State: AOJu0YzYi0mMRvCk0mnt2gJD2DROHsc+SP9S5E/VcEnWXRsP5cH3zrMW
	yCxrK/C4bkxGHKBoWMNUUGJE+EoSTBDGNyphwTrySSLB/ve2OLIujsMQihm5tZXoSptXYNF51Pk
	7xyatl5hFbthv8+tqiOyA6iVG4g1lfvgSEjhtIlgNRne4HONwmP6JGrMw4AiisRnmZHV0
X-Gm-Gg: ASbGncvGUnuev7NpsWiY0LG9TyZ5lw/u5S6wJnAoaEhBNpNzQyLw8sHNgmaPz4aJqS3
	XhAH0ihWMJQXHsJCUHCXDDf5N9iMqEfxfP3TiqTERhDfS9Y4lh7relsTUHUThm0cQHNDcbEultk
	wgsW96U67mdY0Y9k1jU3EmV247j3ZdGtG6v/6Pr8QOoQQuyMUWzMF02xcv8oIKnCtivpfTticm9
	HwlKZxXi3hl5drk3YLiQoIzPU5D2GcYW1AyKslBcnoLtgLV/WP1v5CdN1hT8GjFNHtmKWKsDMPd
	msXixWft9dbtFUUB1y1QsrBpwd1vqOHwZZ9LhkbEGnv8WZoLw0xqhTVV4CPAhD6UH+q4b4bC0JQ
	9GuHuMhhC9zqHwHejr9y9QpCxj9q2uNSKmA==
X-Received: by 2002:a17:903:3ba7:b0:224:78e:4eb4 with SMTP id d9443c01a7336-22ac2a276a1mr24096025ad.39.1744176419240;
        Tue, 08 Apr 2025 22:26:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGlZMelEQYaQzA5DSX62Jx9/7i7zdHhbRxpE9Zxkg24Qg0ZkCrf+7+8QdPACyRYGqWc19g2A==
X-Received: by 2002:a17:903:3ba7:b0:224:78e:4eb4 with SMTP id d9443c01a7336-22ac2a276a1mr24095815ad.39.1744176418847;
        Tue, 08 Apr 2025 22:26:58 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011e6sm424862a91.44.2025.04.08.22.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:26:58 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: Avoid allocating rx_stats when ext_rx_stats is disabled
Date: Wed,  9 Apr 2025 10:56:47 +0530
Message-Id: <20250409052647.81955-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cXQf9VczjmCNpbor_yjN1zldeXaY7Q10
X-Proofpoint-ORIG-GUID: cXQf9VczjmCNpbor_yjN1zldeXaY7Q10
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f60525 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=hGnVruaWzbSFpmBbWLkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=888 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_222702_735607_CF6CA0E1 
X-CRM114-Status: GOOD (  16.07  )
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

Currently, driver allocates the struct ath12k_rx_peer_stats for each
station regardless of whether ext_rx_stats is enabled. This structure
is populated by the monitor destination ring for both single-user and
multi-user scenarios when ext_rx_stats is enabled. However, when
ext_rx_stats is disabled, this allocation is unnecessary and results in
additional memory consumption.

To address this issue, allocate the struct ath12k_rx_peer_stats only when
ext_rx_stats is enabled through debugfs. This change prevents unnecessary
memory allocation. Additionally, ensure that the station dump RSSI is
updated irrespective of the ext_rx_stats enablement.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 11 ++++-------
 drivers/net/wireless/ath/ath12k/mac.c    |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 6df04920a0c6..64647136620d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -3203,11 +3203,10 @@ static void ath12k_dp_mon_rx_update_peer_su_stats(struct ath12k *ar,
 	struct ath12k_rx_peer_stats *rx_stats = arsta->rx_stats;
 	u32 num_msdu;
 
-	if (!rx_stats)
-		return;
-
 	arsta->rssi_comb = ppdu_info->rssi_comb;
 	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
+	if (!rx_stats)
+		return;
 
 	num_msdu = ppdu_info->tcp_msdu_count + ppdu_info->tcp_ack_msdu_count +
 		   ppdu_info->udp_msdu_count + ppdu_info->other_msdu_count;
@@ -3380,14 +3379,12 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k *ar,
 
 	ahsta = ath12k_sta_to_ahsta(peer->sta);
 	arsta = &ahsta->deflink;
+	arsta->rssi_comb = ppdu_info->rssi_comb;
+	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
 	rx_stats = arsta->rx_stats;
-
 	if (!rx_stats)
 		return;
 
-	arsta->rssi_comb = ppdu_info->rssi_comb;
-	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
-
 	num_msdu = user_stats->tcp_msdu_count + user_stats->tcp_ack_msdu_count +
 		   user_stats->udp_msdu_count + user_stats->other_msdu_count;
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b19e30d95560..9a8f3f3cc19d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5578,7 +5578,7 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 		goto exit;
 	}
 
-	if (!arsta->rx_stats) {
+	if (ath12k_debugfs_is_extd_rx_stats_enabled(ar) && !arsta->rx_stats) {
 		arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
 		if (!arsta->rx_stats) {
 			ret = -ENOMEM;

base-commit: 12b93f7c6d101d22e0ea3bf4a240699746c79117
-- 
2.34.1


