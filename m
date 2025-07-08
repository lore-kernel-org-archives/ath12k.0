Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D58FC83F09
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXEZymgC1tOLAwxtUjPfaH4voEpd7fIZEJq0IS3VAAU=; b=VDRvOx994HOXHmRwSpd6ITJusb
	d9EalX4vehEW/JhrWLluNcoMl3nb8aDiws7KjdEAtXOdu/CdrdYO4jtY+Ge9vB3+1e4hWxMTn/bD4
	DU3X2x0ivkQ+3PT+FyigruVV+DuoKeSm7winlGPXnDMP/pkDktkrzgSqueY+MCk8eWhuodzPJjUQo
	zMDDPC7VOvqREYTDWevM7OibFoH+Us10ZioG+NUZgZ1lEbejqZDJqVKyng7MIamoBTbfAxkdRX97E
	7BETS9mDnA/pyzHkC73uV+fjnmIDZZ9wtGrf0Pu/yQg5TLMbVIlRA+oOw798e68qgWADpQdnKgSe9
	eg6sMeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAm-00000006Nqr-406o;
	Tue, 08 Jul 2025 19:40:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCmj-00000006DIk-3ogB
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 18:11:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAcC5031869
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 18:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EXEZymgC1tO
	LAwxtUjPfaH4voEpd7fIZEJq0IS3VAAU=; b=Mh5eHr0il2a9UfBBmywWsbH/R1f
	TOrMw3WsD/fiDT7vdRaRpycjG1YoSFd2uSiBXauPuBM7R3lDOHscM0OtwLM5dAMX
	KzGJMeqmV0w8Nuf5Qfy22yB0cMWyeNbhAy1OhfeUlUdTzQoj4j35Z7o+QB+3qXzn
	9zNktE/ScU0LKSqaZp6ZFP+JStt2JMIFMTr/9WpgjUA9M+3IEF57xXb+Ei3PaHYA
	l6eWeQ/hYMm7aImzGzqM+4tBs/WZXFGtZOyEeuhujMZ1p2JTggSe6Unr2K27Fn0V
	UQyiA1yQ2Xcthn8AoLIe5MfSjmLsHUVqjt9fmMy094coIi17xNP5rOurHTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qr8x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 18:11:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31cc625817so105622a12.0
        for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 11:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751998276; x=1752603076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXEZymgC1tOLAwxtUjPfaH4voEpd7fIZEJq0IS3VAAU=;
        b=Ue5gbFC+rH615IqdD5uJVxSpI12Yq3zXCUwa8CyBm+VO5N1Fr9v69GbFB2tpYcYZaC
         rLGF41N3DkRt5bg7Wm9yssCWWgOaxi7R/w2X/jZBVgFealwJh80bCIJRlY0EvdLMHRYH
         5XOiS8Eim8P4mr5n66tbh6lAVKGcGepmH5IetNrlIlzqjnGtY4/G9Mo3fols6lJ9N77p
         +Pm1vJO/VFW4gOv7pc1QzOjzOELTS5d2zV4XMZM6b3hSDPEkn4oZnTZr8wipS5Sk0bQy
         9oPfY4QaNcv27hpyyL/zZopikLznTfOZZA2Aw8sLE5wd+wEtN4LQt7EsqyIfkzo0MCMI
         cagw==
X-Gm-Message-State: AOJu0YxhbaM29Xy4bBjOvoPBhIT7wLBU8ElCjjDfyzmHLduX8T1ArC2W
	Gb4UvCPVf9J+EKkMX/bh+hZBNbDAWJss24QMd3joTNs2LErTUJO5Hfu+D4SL6Nzlr5IAmAjJiap
	/mHm5dUVg/e07dtXq7r/EtQB8FDURsUJYZNHqzRL1VPBs2qmR5/HQb0mSUcUTKcNKN4kp2/Ii
X-Gm-Gg: ASbGnctio0EOS2F9MvO9e8dYv90q5iOi6A3g6sVuoD2zaVbLUNFmStyhoopqSEhrFjt
	TJDmLOuhroAF+L4fCBUUIo+qm6b/ModBFUCykZiEqqH6GHf7i1iDNzaC5JfmPL66v96bR/k+iqD
	Iy4yQBhycyxPk0icCHEa6ZFQKaW5m0kOwvn5lomHLjgY0Sbq08mg5CNdK/2F8bRJwRzVAnv572F
	tAplMHOFZkuB/fZlpYKVqQMvX9XlPqBuXjUR8p1IiGq3wwhbN9BNjRMo+7ODeBw46PwCTUyYdgS
	N5KZsOHkO6StfxZBVuureg+5MCWXGtDqWI34iDHqo3LpUxqGWOXocmlpEeczej3HJiUrwQjw6aq
	KStZ6qXMTqndEMMDFSIkp1MfA3+OkgyTEwJBMeQH5kNCmUQ==
X-Received: by 2002:a17:902:c94a:b0:235:1b50:7245 with SMTP id d9443c01a7336-23dd1cdf6c9mr45375895ad.7.1751998275735;
        Tue, 08 Jul 2025 11:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJpLvI5B2SQP8a760knE5IWcBDQIJjqaS5FZXgEXfgrAcVrJsYbMg0DzIioH+V20yDtQAC0w==
X-Received: by 2002:a17:902:c94a:b0:235:1b50:7245 with SMTP id d9443c01a7336-23dd1cdf6c9mr45375445ad.7.1751998275125;
        Tue, 08 Jul 2025 11:11:15 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d0a9sm115980425ad.95.2025.07.08.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:11:14 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 3/4] wifi: ath12k: Refactor macros to use memory profile-based values
Date: Tue,  8 Jul 2025 23:41:01 +0530
Message-Id: <20250708181102.4111054-4-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MiBTYWx0ZWRfX9/mU6cnH2BMT
 F3+4X7Uk/DnhzHUQ3ZEkI9+3sJ7KRA+Q364aBENSUOtN+gJhpC6hSQNu+O9MYuPs9jBjA5Pj9tx
 fea8dfH7mnxJMqPMwe1a4QKkJS6ZkBBq++mPqXtXfKtZLfMUxATh6BI2dGNZGuAY3wuUQbQK915
 9LNMlh76BFqigilLpf0OJyTgQUxeIINOynL12ich1EyHyUtF3XRBeLmhOqNvFJ+J6hl1QTZo6Ls
 6UnlPPss3dkNUwiMzkqxEDzwRUkcujNTSlcOcp1rdU24oo+xtmd/FU5py11aib/0xGMhu6tpchg
 T+Bgv9zm/TXDugdBcM5Qp6YnoesYbrbgPnDjUzKJpVfF5hvBt5cs8whl70URBh8XAiiQKlmxjnO
 BQdOvtZLivhu/I7aP4ySS8kSx1UxPcVeKBCGnbjlOPGMtUJsenfwmfbj4yswdOkZEyLSEUgY
X-Proofpoint-GUID: -rbYhdrJRyt_TtPu0EtZERk5sL0NztPo
X-Proofpoint-ORIG-GUID: -rbYhdrJRyt_TtPu0EtZERk5sL0NztPo
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686d5f45 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ysYtliSER5wa82W-y6AA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_111117_958086_AE00CCDE 
X-CRM114-Status: GOOD (  20.84  )
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

Refactor macros to compute values dynamically at runtime based on the
ath12k_mem_profile_based_param structure.

Remove hardcoded logic to allow driver to operate more efficiently in
memory-constrained platforms without significant functional impact.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c  |  20 ++--
 drivers/net/wireless/ath/ath12k/dp.c    | 129 +++++++++++++++---------
 drivers/net/wireless/ath/ath12k/dp.h    |  37 ++++---
 drivers/net/wireless/ath/ath12k/dp_rx.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c |  13 ++-
 drivers/net/wireless/ath/ath12k/hw.h    |  28 ++---
 drivers/net/wireless/ath/ath12k/mac.c   |  11 +-
 drivers/net/wireless/ath/ath12k/wmi.c   |   2 +-
 8 files changed, 136 insertions(+), 108 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 037486553ba0..53e60dba3bf8 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -623,19 +623,15 @@ int ath12k_core_fetch_regdb(struct ath12k_base *ab, struct ath12k_board_data *bd
 u32 ath12k_core_get_max_station_per_radio(struct ath12k_base *ab)
 {
 	if (ab->num_radios == 2)
-		return TARGET_NUM_STATIONS_DBS;
-	else if (ab->num_radios == 3)
-		return TARGET_NUM_PEERS_PDEV_DBS_SBS;
-	return TARGET_NUM_STATIONS_SINGLE;
+		return TARGET_NUM_STATIONS(ab, DBS);
+	if (ab->num_radios == 3)
+		return TARGET_NUM_STATIONS(ab, DBS_SBS);
+	return TARGET_NUM_STATIONS(ab, SINGLE);
 }
 
 u32 ath12k_core_get_max_peers_per_radio(struct ath12k_base *ab)
 {
-	if (ab->num_radios == 2)
-		return TARGET_NUM_PEERS_PDEV_DBS;
-	else if (ab->num_radios == 3)
-		return TARGET_NUM_PEERS_PDEV_DBS_SBS;
-	return TARGET_NUM_PEERS_PDEV_SINGLE;
+	return ath12k_core_get_max_station_per_radio(ab) + TARGET_NUM_VDEVS(ab);
 }
 
 struct reserved_mem *ath12k_core_get_reserved_mem(struct ath12k_base *ab,
@@ -1353,7 +1349,7 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 
 static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
 {
-	int ret;
+	int ret, total_vdev;
 
 	mutex_lock(&ab->core_lock);
 	ath12k_dp_pdev_free(ab);
@@ -1364,8 +1360,8 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
 
 	ath12k_dp_free(ab);
 	ath12k_hal_srng_deinit(ab);
-
-	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
+	total_vdev = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	ab->free_vdev_map = (1LL << total_vdev) - 1;
 
 	ret = ath12k_hal_srng_init(ab);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index c6b10acb643e..d80af435959a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -521,7 +521,7 @@ static int ath12k_dp_srng_common_setup(struct ath12k_base *ab)
 
 		ret = ath12k_dp_srng_setup(ab, &dp->tx_ring[i].tcl_comp_ring,
 					   HAL_WBM2SW_RELEASE, tx_comp_ring_num, 0,
-					   DP_TX_COMP_RING_SIZE);
+					   DP_TX_COMP_RING_SIZE(ab));
 		if (ret) {
 			ath12k_warn(ab, "failed to set up tcl_comp ring (%d) :%d\n",
 				    tx_comp_ring_num, ret);
@@ -1164,31 +1164,36 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	/* RX Descriptor cleanup */
 	spin_lock_bh(&dp->rx_desc_lock);
 
-	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
-		desc_info = dp->rxbaddr[i];
-
-		for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
-			if (!desc_info[j].in_use) {
-				list_del(&desc_info[j].list);
+	if (dp->rxbaddr) {
+		for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES(ab); i++) {
+			if (!dp->rxbaddr[i])
 				continue;
-			}
 
-			skb = desc_info[j].skb;
-			if (!skb)
-				continue;
+			desc_info = dp->rxbaddr[i];
 
-			dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(skb)->paddr,
-					 skb->len + skb_tailroom(skb), DMA_FROM_DEVICE);
-			dev_kfree_skb_any(skb);
-		}
-	}
+			for (j = 0; j < ATH12K_MAX_SPT_ENTRIES; j++) {
+				if (!desc_info[j].in_use) {
+					list_del(&desc_info[j].list);
+					continue;
+				}
 
-	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
-		if (!dp->rxbaddr[i])
-			continue;
+				skb = desc_info[j].skb;
+				if (!skb)
+					continue;
+
+				dma_unmap_single(ab->dev,
+						 ATH12K_SKB_RXCB(skb)->paddr,
+						 skb->len + skb_tailroom(skb),
+						 DMA_FROM_DEVICE);
+				dev_kfree_skb_any(skb);
+			}
+
+			kfree(dp->rxbaddr[i]);
+			dp->rxbaddr[i] = NULL;
+		}
 
-		kfree(dp->rxbaddr[i]);
-		dp->rxbaddr[i] = NULL;
+		kfree(dp->rxbaddr);
+		dp->rxbaddr = NULL;
 	}
 
 	spin_unlock_bh(&dp->rx_desc_lock);
@@ -1197,8 +1202,8 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_HW_MAX_QUEUES; i++) {
 		spin_lock_bh(&dp->tx_desc_lock[i]);
 
-		list_for_each_entry_safe(tx_desc_info, tmp1, &dp->tx_desc_used_list[i],
-					 list) {
+		list_for_each_entry_safe(tx_desc_info, tmp1,
+					 &dp->tx_desc_used_list[i], list) {
 			list_del(&tx_desc_info->list);
 			skb = tx_desc_info->skb;
 
@@ -1232,19 +1237,25 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 		spin_unlock_bh(&dp->tx_desc_lock[i]);
 	}
 
-	for (pool_id = 0; pool_id < ATH12K_HW_MAX_QUEUES; pool_id++) {
-		spin_lock_bh(&dp->tx_desc_lock[pool_id]);
+	if (dp->txbaddr) {
+		for (pool_id = 0; pool_id < ATH12K_HW_MAX_QUEUES; pool_id++) {
+			spin_lock_bh(&dp->tx_desc_lock[pool_id]);
 
-		for (i = 0; i < ATH12K_TX_SPT_PAGES_PER_POOL; i++) {
-			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
-			if (!dp->txbaddr[tx_spt_page])
-				continue;
+			for (i = 0; i < ATH12K_TX_SPT_PAGES_PER_POOL(ab); i++) {
+				tx_spt_page = i + pool_id *
+					      ATH12K_TX_SPT_PAGES_PER_POOL(ab);
+				if (!dp->txbaddr[tx_spt_page])
+					continue;
+
+				kfree(dp->txbaddr[tx_spt_page]);
+				dp->txbaddr[tx_spt_page] = NULL;
+			}
 
-			kfree(dp->txbaddr[tx_spt_page]);
-			dp->txbaddr[tx_spt_page] = NULL;
+			spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
 		}
 
-		spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
+		kfree(dp->txbaddr);
+		dp->txbaddr = NULL;
 	}
 
 	/* unmap SPT pages */
@@ -1393,8 +1404,8 @@ struct ath12k_rx_desc_info *ath12k_dp_get_rx_desc(struct ath12k_base *ab,
 	ppt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_PPT);
 	spt_idx = u32_get_bits(cookie, ATH12K_DP_CC_COOKIE_SPT);
 
-	start_ppt_idx = dp->rx_ppt_base + ATH12K_RX_SPT_PAGE_OFFSET;
-	end_ppt_idx = start_ppt_idx + ATH12K_NUM_RX_SPT_PAGES;
+	start_ppt_idx = dp->rx_ppt_base + ATH12K_RX_SPT_PAGE_OFFSET(ab);
+	end_ppt_idx = start_ppt_idx + ATH12K_NUM_RX_SPT_PAGES(ab);
 
 	if (ppt_idx < start_ppt_idx ||
 	    ppt_idx >= end_ppt_idx ||
@@ -1418,7 +1429,7 @@ struct ath12k_tx_desc_info *ath12k_dp_get_tx_desc(struct ath12k_base *ab,
 
 	start_ppt_idx = ATH12K_TX_SPT_PAGE_OFFSET;
 	end_ppt_idx = start_ppt_idx +
-		      (ATH12K_TX_SPT_PAGES_PER_POOL * ATH12K_HW_MAX_QUEUES);
+		      (ATH12K_TX_SPT_PAGES_PER_POOL(ab) * ATH12K_HW_MAX_QUEUES);
 
 	if (ppt_idx < start_ppt_idx ||
 	    ppt_idx >= end_ppt_idx ||
@@ -1435,13 +1446,24 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 	struct ath12k_dp *dp = &ab->dp;
 	struct ath12k_rx_desc_info *rx_descs, **rx_desc_addr;
 	struct ath12k_tx_desc_info *tx_descs, **tx_desc_addr;
+	u32 num_rx_spt_pages = ATH12K_NUM_RX_SPT_PAGES(ab);
 	u32 i, j, pool_id, tx_spt_page;
 	u32 ppt_idx, cookie_ppt_idx;
 
 	spin_lock_bh(&dp->rx_desc_lock);
 
-	/* First ATH12K_NUM_RX_SPT_PAGES of allocated SPT pages are used for RX */
-	for (i = 0; i < ATH12K_NUM_RX_SPT_PAGES; i++) {
+	dp->rxbaddr = kcalloc(num_rx_spt_pages,
+			      sizeof(struct ath12k_rx_desc_info *), GFP_ATOMIC);
+
+	if (!dp->rxbaddr) {
+		spin_unlock_bh(&dp->rx_desc_lock);
+		return -ENOMEM;
+	}
+
+	/* First ATH12K_NUM_RX_SPT_PAGES(ab) of allocated SPT pages are used for
+	 * RX
+	 */
+	for (i = 0; i < num_rx_spt_pages; i++) {
 		rx_descs = kcalloc(ATH12K_MAX_SPT_ENTRIES, sizeof(*rx_descs),
 				   GFP_ATOMIC);
 
@@ -1450,7 +1472,7 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 			return -ENOMEM;
 		}
 
-		ppt_idx = ATH12K_RX_SPT_PAGE_OFFSET + i;
+		ppt_idx = ATH12K_RX_SPT_PAGE_OFFSET(ab) + i;
 		cookie_ppt_idx = dp->rx_ppt_base + ppt_idx;
 		dp->rxbaddr[i] = &rx_descs[0];
 
@@ -1468,9 +1490,15 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 
 	spin_unlock_bh(&dp->rx_desc_lock);
 
+	dp->txbaddr = kcalloc(ATH12K_NUM_TX_SPT_PAGES(ab),
+			      sizeof(struct ath12k_tx_desc_info *), GFP_ATOMIC);
+
+	if (!dp->txbaddr)
+		return -ENOMEM;
+
 	for (pool_id = 0; pool_id < ATH12K_HW_MAX_QUEUES; pool_id++) {
 		spin_lock_bh(&dp->tx_desc_lock[pool_id]);
-		for (i = 0; i < ATH12K_TX_SPT_PAGES_PER_POOL; i++) {
+		for (i = 0; i < ATH12K_TX_SPT_PAGES_PER_POOL(ab); i++) {
 			tx_descs = kcalloc(ATH12K_MAX_SPT_ENTRIES, sizeof(*tx_descs),
 					   GFP_ATOMIC);
 
@@ -1480,7 +1508,8 @@ static int ath12k_dp_cc_desc_init(struct ath12k_base *ab)
 				return -ENOMEM;
 			}
 
-			tx_spt_page = i + pool_id * ATH12K_TX_SPT_PAGES_PER_POOL;
+			tx_spt_page = i + pool_id *
+				      ATH12K_TX_SPT_PAGES_PER_POOL(ab);
 			ppt_idx = ATH12K_TX_SPT_PAGE_OFFSET + tx_spt_page;
 
 			dp->txbaddr[tx_spt_page] = &tx_descs[0];
@@ -1514,12 +1543,12 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	switch (type) {
 	case ATH12K_DP_TX_DESC:
 		start = ATH12K_TX_SPT_PAGE_OFFSET;
-		end = start + ATH12K_NUM_TX_SPT_PAGES;
+		end = start + ATH12K_NUM_TX_SPT_PAGES(ab);
 		break;
 	case ATH12K_DP_RX_DESC:
 		cmem_base += ATH12K_PPT_ADDR_OFFSET(dp->rx_ppt_base);
-		start = ATH12K_RX_SPT_PAGE_OFFSET;
-		end = start + ATH12K_NUM_RX_SPT_PAGES;
+		start = ATH12K_RX_SPT_PAGE_OFFSET(ab);
+		end = start + ATH12K_NUM_RX_SPT_PAGES(ab);
 		break;
 	default:
 		ath12k_err(ab, "invalid descriptor type %d in cmem init\n", type);
@@ -1547,6 +1576,11 @@ void ath12k_dp_partner_cc_init(struct ath12k_base *ab)
 	}
 }
 
+static u32 ath12k_dp_get_num_spt_pages(struct ath12k_base *ab)
+{
+	return ATH12K_NUM_RX_SPT_PAGES(ab) + ATH12K_NUM_TX_SPT_PAGES(ab);
+}
+
 static int ath12k_dp_cc_init(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = &ab->dp;
@@ -1561,7 +1595,7 @@ static int ath12k_dp_cc_init(struct ath12k_base *ab)
 		spin_lock_init(&dp->tx_desc_lock[i]);
 	}
 
-	dp->num_spt_pages = ATH12K_NUM_SPT_PAGES;
+	dp->num_spt_pages = ath12k_dp_get_num_spt_pages(ab);
 	if (dp->num_spt_pages > ATH12K_MAX_PPT_ENTRIES)
 		dp->num_spt_pages = ATH12K_MAX_PPT_ENTRIES;
 
@@ -1573,7 +1607,7 @@ static int ath12k_dp_cc_init(struct ath12k_base *ab)
 		return -ENOMEM;
 	}
 
-	dp->rx_ppt_base = ab->device_id * ATH12K_NUM_RX_SPT_PAGES;
+	dp->rx_ppt_base = ab->device_id * ATH12K_NUM_RX_SPT_PAGES(ab);
 
 	for (i = 0; i < dp->num_spt_pages; i++) {
 		dp->spt_info[i].vaddr = dma_alloc_coherent(ab->dev,
@@ -1748,7 +1782,8 @@ int ath12k_dp_alloc(struct ath12k_base *ab)
 	if (ret)
 		goto fail_dp_bank_profiles_cleanup;
 
-	size = sizeof(struct hal_wbm_release_ring_tx) * DP_TX_COMP_RING_SIZE;
+	size = sizeof(struct hal_wbm_release_ring_tx) *
+	       DP_TX_COMP_RING_SIZE(ab);
 
 	ret = ath12k_dp_reoq_lut_setup(ab);
 	if (ret) {
@@ -1760,7 +1795,7 @@ int ath12k_dp_alloc(struct ath12k_base *ab)
 		dp->tx_ring[i].tcl_data_ring_id = i;
 
 		dp->tx_ring[i].tx_status_head = 0;
-		dp->tx_ring[i].tx_status_tail = DP_TX_COMP_RING_SIZE - 1;
+		dp->tx_ring[i].tx_status_tail = DP_TX_COMP_RING_SIZE(ab) - 1;
 		dp->tx_ring[i].tx_status = kmalloc(size, GFP_KERNEL);
 		if (!dp->tx_ring[i].tx_status) {
 			ret = -ENOMEM;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 6df07b23b705..623facc2cce7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -46,7 +46,7 @@ struct dp_rxdma_ring {
 	int bufs_max;
 };
 
-#define ATH12K_TX_COMPL_NEXT(x)	(((x) + 1) % DP_TX_COMP_RING_SIZE)
+#define ATH12K_TX_COMPL_NEXT(ab, x)	(((x) + 1) % DP_TX_COMP_RING_SIZE(ab))
 
 struct dp_tx_ring {
 	u8 tcl_data_ring_id;
@@ -174,8 +174,9 @@ struct ath12k_pdev_dp {
 
 #define DP_WBM_RELEASE_RING_SIZE	64
 #define DP_TCL_DATA_RING_SIZE		512
-#define DP_TX_COMP_RING_SIZE		32768
-#define DP_TX_IDR_SIZE			DP_TX_COMP_RING_SIZE
+#define DP_TX_COMP_RING_SIZE(ab) \
+	((ab)->profile_param->dp_params.tx_comp_ring_size)
+#define DP_TX_IDR_SIZE(ab)		DP_TX_COMP_RING_SIZE(ab)
 #define DP_TCL_CMD_RING_SIZE		32
 #define DP_TCL_STATUS_RING_SIZE		32
 #define DP_REO_DST_RING_MAX		8
@@ -190,8 +191,10 @@ struct ath12k_pdev_dp {
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
 #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
-#define DP_RXDMA_MONITOR_BUF_RING_SIZE	4096
-#define DP_RXDMA_MONITOR_DST_RING_SIZE	8092
+#define DP_RXDMA_MONITOR_BUF_RING_SIZE(ab) \
+	((ab)->profile_param->dp_params.rxdma_monitor_buf_ring_size)
+#define DP_RXDMA_MONITOR_DST_RING_SIZE(ab) \
+	((ab)->profile_param->dp_params.rxdma_monitor_dst_ring_size)
 #define DP_RXDMA_MONITOR_DESC_RING_SIZE	4096
 #define DP_TX_MONITOR_BUF_RING_SIZE	4096
 #define DP_TX_MONITOR_DEST_RING_SIZE	2048
@@ -225,10 +228,11 @@ struct ath12k_pdev_dp {
 #define ATH12K_SHADOW_DP_TIMER_INTERVAL 20
 #define ATH12K_SHADOW_CTRL_TIMER_INTERVAL 10
 
-#define ATH12K_NUM_POOL_TX_DESC	32768
-
+#define ATH12K_NUM_POOL_TX_DESC(ab) \
+	((ab)->profile_param->dp_params.num_pool_tx_desc)
 /* TODO: revisit this count during testing */
-#define ATH12K_RX_DESC_COUNT	(12288)
+#define ATH12K_RX_DESC_COUNT(ab) \
+	((ab)->profile_param->dp_params.rx_desc_count)
 
 #define ATH12K_PAGE_SIZE	PAGE_SIZE
 
@@ -240,20 +244,21 @@ struct ath12k_pdev_dp {
 /* Total 512 entries in a SPT, i.e 4K Page/8 */
 #define ATH12K_MAX_SPT_ENTRIES	512
 
-#define ATH12K_NUM_RX_SPT_PAGES	((ATH12K_RX_DESC_COUNT) / ATH12K_MAX_SPT_ENTRIES)
+#define ATH12K_NUM_RX_SPT_PAGES(ab)	((ATH12K_RX_DESC_COUNT(ab)) / \
+					  ATH12K_MAX_SPT_ENTRIES)
 
-#define ATH12K_TX_SPT_PAGES_PER_POOL (ATH12K_NUM_POOL_TX_DESC / \
+#define ATH12K_TX_SPT_PAGES_PER_POOL(ab) (ATH12K_NUM_POOL_TX_DESC(ab) / \
 					  ATH12K_MAX_SPT_ENTRIES)
-#define ATH12K_NUM_TX_SPT_PAGES	(ATH12K_TX_SPT_PAGES_PER_POOL * ATH12K_HW_MAX_QUEUES)
-#define ATH12K_NUM_SPT_PAGES	(ATH12K_NUM_RX_SPT_PAGES + ATH12K_NUM_TX_SPT_PAGES)
+#define ATH12K_NUM_TX_SPT_PAGES(ab)	(ATH12K_TX_SPT_PAGES_PER_POOL(ab) * \
+					 ATH12K_HW_MAX_QUEUES)
 
 #define ATH12K_TX_SPT_PAGE_OFFSET 0
-#define ATH12K_RX_SPT_PAGE_OFFSET ATH12K_NUM_TX_SPT_PAGES
+#define ATH12K_RX_SPT_PAGE_OFFSET(ab) ATH12K_NUM_TX_SPT_PAGES(ab)
 
 /* The SPT pages are divided for RX and TX, first block for RX
  * and remaining for TX
  */
-#define ATH12K_NUM_TX_SPT_PAGE_START ATH12K_NUM_RX_SPT_PAGES
+#define ATH12K_NUM_TX_SPT_PAGE_START(ab) ATH12K_NUM_RX_SPT_PAGES(ab)
 
 #define ATH12K_DP_RX_DESC_MAGIC	0xBABABABA
 
@@ -399,8 +404,8 @@ struct ath12k_dp {
 	struct ath12k_spt_info *spt_info;
 	u32 num_spt_pages;
 	u32 rx_ppt_base;
-	struct ath12k_rx_desc_info *rxbaddr[ATH12K_NUM_RX_SPT_PAGES];
-	struct ath12k_tx_desc_info *txbaddr[ATH12K_NUM_TX_SPT_PAGES];
+	struct ath12k_rx_desc_info **rxbaddr;
+	struct ath12k_tx_desc_info **txbaddr;
 	struct list_head rx_desc_free_list;
 	/* protects the free desc list */
 	spinlock_t rx_desc_lock;
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index ed325aa6322d..72ad457b5106 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -570,7 +570,7 @@ static int ath12k_dp_rx_pdev_srng_alloc(struct ath12k *ar)
 					   &dp->rxdma_mon_dst_ring[i],
 					   HAL_RXDMA_MONITOR_DST,
 					   0, mac_id + i,
-					   DP_RXDMA_MONITOR_DST_RING_SIZE);
+					   DP_RXDMA_MONITOR_DST_RING_SIZE(ab));
 		if (ret) {
 			ath12k_warn(ar->ab,
 				    "failed to setup HAL_RXDMA_MONITOR_DST\n");
@@ -4541,7 +4541,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 		ret = ath12k_dp_srng_setup(ab,
 					   &dp->rxdma_mon_buf_ring.refill_buf_ring,
 					   HAL_RXDMA_MONITOR_BUF, 0, 0,
-					   DP_RXDMA_MONITOR_BUF_RING_SIZE);
+					   DP_RXDMA_MONITOR_BUF_RING_SIZE(ab));
 		if (ret) {
 			ath12k_warn(ab, "failed to setup HAL_RXDMA_MONITOR_BUF\n");
 			return ret;
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 1fa37cda1046..96d3ccb714df 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -931,7 +931,8 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 
 	ath12k_hal_srng_access_begin(ab, status_ring);
 
-	while (ATH12K_TX_COMPL_NEXT(tx_ring->tx_status_head) != tx_ring->tx_status_tail) {
+	while (ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_head) !=
+	       tx_ring->tx_status_tail) {
 		desc = ath12k_hal_srng_dst_get_next_entry(ab, status_ring);
 		if (!desc)
 			break;
@@ -939,11 +940,12 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 		memcpy(&tx_ring->tx_status[tx_ring->tx_status_head],
 		       desc, sizeof(*desc));
 		tx_ring->tx_status_head =
-			ATH12K_TX_COMPL_NEXT(tx_ring->tx_status_head);
+			ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_head);
 	}
 
 	if (ath12k_hal_srng_dst_peek(ab, status_ring) &&
-	    (ATH12K_TX_COMPL_NEXT(tx_ring->tx_status_head) == tx_ring->tx_status_tail)) {
+	    (ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_head) ==
+	     tx_ring->tx_status_tail)) {
 		/* TODO: Process pending tx_status messages when kfifo_is_full() */
 		ath12k_warn(ab, "Unable to process some of the tx_status ring desc because status_fifo is full\n");
 	}
@@ -952,12 +954,13 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 
 	spin_unlock_bh(&status_ring->lock);
 
-	while (ATH12K_TX_COMPL_NEXT(tx_ring->tx_status_tail) != tx_ring->tx_status_head) {
+	while (ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_tail) !=
+	       tx_ring->tx_status_head) {
 		struct hal_wbm_completion_ring_tx *tx_status;
 		u32 desc_id;
 
 		tx_ring->tx_status_tail =
-			ATH12K_TX_COMPL_NEXT(tx_ring->tx_status_tail);
+			ATH12K_TX_COMPL_NEXT(ab, tx_ring->tx_status_tail);
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
 		ath12k_dp_tx_status_parse(ab, tx_status, &ts);
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 4e10d5df2919..9f4ea5e96150 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -16,34 +16,20 @@
 /* Target configuration defines */
 
 /* Num VDEVS per radio */
-#define TARGET_NUM_VDEVS	(16 + 1)
-
-#define TARGET_NUM_PEERS_PDEV_SINGLE	(TARGET_NUM_STATIONS_SINGLE + \
-					 TARGET_NUM_VDEVS)
-#define TARGET_NUM_PEERS_PDEV_DBS	(TARGET_NUM_STATIONS_DBS + \
-					 TARGET_NUM_VDEVS)
-#define TARGET_NUM_PEERS_PDEV_DBS_SBS	(TARGET_NUM_STATIONS_DBS_SBS + \
-					 TARGET_NUM_VDEVS)
-
-/* Num of peers for Single Radio mode */
-#define TARGET_NUM_PEERS_SINGLE		(TARGET_NUM_PEERS_PDEV_SINGLE)
-
-/* Num of peers for DBS */
-#define TARGET_NUM_PEERS_DBS		(2 * TARGET_NUM_PEERS_PDEV_DBS)
-
-/* Num of peers for DBS_SBS */
-#define TARGET_NUM_PEERS_DBS_SBS	(3 * TARGET_NUM_PEERS_PDEV_DBS_SBS)
+#define TARGET_NUM_VDEVS(ab)    ((ab)->profile_param->num_vdevs)
 
 /* Max num of stations for Single Radio mode */
-#define TARGET_NUM_STATIONS_SINGLE	512
+#define TARGET_NUM_STATIONS_SINGLE(ab) ((ab)->profile_param->max_client_single)
 
 /* Max num of stations for DBS */
-#define TARGET_NUM_STATIONS_DBS		128
+#define TARGET_NUM_STATIONS_DBS(ab)    ((ab)->profile_param->max_client_dbs)
 
 /* Max num of stations for DBS_SBS */
-#define TARGET_NUM_STATIONS_DBS_SBS	128
+#define TARGET_NUM_STATIONS_DBS_SBS(ab) \
+	((ab)->profile_param->max_client_dbs_sbs)
+
+#define TARGET_NUM_STATIONS(ab, x)     TARGET_NUM_STATIONS_##x(ab)
 
-#define TARGET_NUM_PEERS(x)	TARGET_NUM_PEERS_##x
 #define TARGET_NUM_PEER_KEYS	2
 
 #define TARGET_AST_SKID_LIMIT	16
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 42eb9e8e14d1..9852cf4fe715 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10027,9 +10027,9 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
 	if (arvif->is_created)
 		goto flush;
 
-	if (ar->num_created_vdevs > (TARGET_NUM_VDEVS - 1)) {
+	if (ar->num_created_vdevs > (TARGET_NUM_VDEVS(ab) - 1)) {
 		ath12k_warn(ab, "failed to create vdev, reached max vdev limit %d\n",
-			    TARGET_NUM_VDEVS);
+			    TARGET_NUM_VDEVS(ab));
 		goto unlock;
 	}
 
@@ -13686,7 +13686,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		else
 			mac_addr = ab->mac_addr;
 
-		mbssid_max_interfaces += TARGET_NUM_VDEVS;
+		mbssid_max_interfaces += TARGET_NUM_VDEVS(ar->ab);
 	}
 
 	wiphy->available_antennas_rx = antennas_rx;
@@ -14240,9 +14240,12 @@ void ath12k_mac_destroy(struct ath12k_hw_group *ag)
 
 static void ath12k_mac_set_device_defaults(struct ath12k_base *ab)
 {
+	int total_vdev;
+
 	/* Initialize channel counters frequency value in hertz */
 	ab->cc_freq_hz = 320000;
-	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
+	total_vdev = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	ab->free_vdev_map = (1LL << total_vdev) - 1;
 }
 
 int ath12k_mac_allocate(struct ath12k_hw_group *ag)
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index facca29ee9e7..ed6013341c1d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -201,7 +201,7 @@ static __le32 ath12k_wmi_tlv_cmd_hdr(u32 cmd, u32 len)
 void ath12k_wmi_init_qcn9274(struct ath12k_base *ab,
 			     struct ath12k_wmi_resource_config_arg *config)
 {
-	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS;
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
 	config->num_peers = ab->num_radios *
 		ath12k_core_get_max_peers_per_radio(ab);
 	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
-- 
2.34.1


