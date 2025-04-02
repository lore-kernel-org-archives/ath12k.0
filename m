Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ADBC28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m03BhA+Eey2Yr/TfX0IC374Y+t6keO9nkzVIy0TvCT4=; b=np4iUSUHcr3sB+5t4twt5/SHgb
	Q9KjorKMyoF8ulGsRi4k5oVaw6ozF5q/eY8RBfzIJIgFOc5sPsMxrBEFpkwYHhEnm8yxyOKoK0fe0
	ekOmaPF+d9u/jmc7Sb/5XoLUDGO2z/x2bl0LnNQkXEkvu+47ELAjH89QNuCtnPKRVmDXxsTC3GN+c
	0VgK9haoDlqdqJdoq+aQy7lWAK8kU0LVu/xGAQHrrZJMlXdcI/2JlMZQMfZT7TqLtwk2jWkz0KLsu
	0Ug5eOLQw1ety57G9MBxBliRyUDe32ntdNH2mZAuzdbES9GLSXX6MFz2a6yYOPa1zA8RS2JLBQgYk
	0yNS9BPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02cK-00000006tLC-3NtV
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 18:15:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02cI-00000006tJW-42K7
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 18:15:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532E39R8009193
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 18:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m03BhA+Eey2
	Yr/TfX0IC374Y+t6keO9nkzVIy0TvCT4=; b=UCRmKddXynx9DvMBn0aTozq/4UR
	LKjOO5bGKd2LhpJ0YmQqzj0D/3qcUmqJzMdIz0lEMejijSOGvh4FFaZxmcD+7qoG
	bJwW1E4QbgJjAZexF5TX+WW/8Ty8DL+scyoKjWlTxiD+gwA9YBeqga1Vwgq+PN4s
	pHect1ye0Wp8zqqELA0dWrRhnu0+QuNq3SGEIdUoqKgnTscyx2I5/qRUSTjppknE
	817E6BNys6JKIevR02QYZCEKlZ5R92Iwo/7G/l+54O4jkbv1ADjq3BXwThIBfiQi
	GFiH9t7yjEo0n0Bv/dmCPHK3kB+dwnq8/6YMAYbRHnkv8GRosFuTBxgFeSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxb02a2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 18:15:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242ce15cc3so1131305ad.1
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 11:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617709; x=1744222509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m03BhA+Eey2Yr/TfX0IC374Y+t6keO9nkzVIy0TvCT4=;
        b=nPnSrVtPKnp1yllhO1/LrQ4oBd0/N/Qo9HNGrr/9vOHT9+aUJqhFNAPquovEoRsgHi
         4+eeGLG0sGqMjewx7gynFezqyFB4VRI7kelZPBGfBfHCDJZd6tXDwu01XtKD4sKEYhxY
         hvsd7NC6Z7iyW/4LPGCwNMQ10ojtwpf/0UMzbTa3HG/hifvaCFHqbAymb1rND7wpha2b
         kI8kLs/XmAEwQVbdRhwNBQzSIMkor2Giw59OTKK49UhR/Gh47WPhEC63WUsvuvm3hnZq
         DFrIDD8pxklu4OEYdmKn1Q5miIfmJ+CmDOIWblX2EcbmHmvXtNzJIoBVUe2c9rbMOfpQ
         putA==
X-Gm-Message-State: AOJu0YwVH1dYVsSbJN/8++PVxGDbtPdC0DQUcJPEaJrAM2zQ+IllW6I1
	zjzsvgXgi2uB5KYDE0KS9AOltNyYEQwAjaApLoPARKCkjGiYwVogA6H1eIZoVz/1RXCIVFD1Y3h
	g+JGcuZF89j3dSnyxpu/2bblxiYCEeimPRehm43tM0y6+NsfPiC4jpWjU7eSjTZ53aMH+
X-Gm-Gg: ASbGncsKsmqgrviusezT1bp5wDkn+HIIONRPgoa3aaoSjDSvhQkx+3ZrivCqUwb+70z
	yxZLSmSDM0M0oUw3ty4D7ESWryZXpqgSNkZikN3JsNTA/VSrs62w4BY4JvZ0FzNRxsk3e87XEnK
	AqZ3HPE/rJQhiIEx9pxAIBef7GMRDFoGW09ZIvKPB9MAXhUkVhqZvq+fC+n9/9zerXseFQKJsqT
	YvxLehKOuFbgVF55h2P+J7BYt3+TH7w2ECbYS4Ay/Nj/TxIntsmBuAyPLBRSSxwijft6f6adJpO
	lg9F8MF3yOmjCrjVuKfVsNVQVxdC4YVQngh+hagJY8Jki8oS4ksObusAUTIGlm7CoDs3NmhniD4
	GAOYID6TCwwdDZTpH5QZnTF27Bsf9hnWh0g==
X-Received: by 2002:a17:903:2a8e:b0:223:4816:3e9e with SMTP id d9443c01a7336-2292f96119cmr238413895ad.13.1743617709229;
        Wed, 02 Apr 2025 11:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE+bCar7mS11SpplOV1+I1khRJyowGdhKycatdsXZAcukRn1PzceNnpaVBBIfUKPBvLyIuxQ==
X-Received: by 2002:a17:903:2a8e:b0:223:4816:3e9e with SMTP id d9443c01a7336-2292f96119cmr238413475ad.13.1743617708422;
        Wed, 02 Apr 2025 11:15:08 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf14csm111689675ad.137.2025.04.02.11.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:15:08 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 3/4] wifi: ath12k: Fix memory leak during extended skb allocation
Date: Wed,  2 Apr 2025 23:44:53 +0530
Message-Id: <20250402181454.2699777-4-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
References: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HTA_oX1rO3yarZbhyn_e4yqyeWRZ2iZm
X-Proofpoint-GUID: HTA_oX1rO3yarZbhyn_e4yqyeWRZ2iZm
X-Authority-Analysis: v=2.4 cv=BavY0qt2 c=1 sm=1 tr=0 ts=67ed7eae cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=iFgiq4A1vBvqtHBMXJkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_08,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_111511_004890_76385A5E 
X-CRM114-Status: GOOD (  17.46  )
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

In ath12k_dp_tx(), memory allocated for extended skb is not freed
properly, causing a memory leak even when the host receives tx
completion for those skbs. Fix this issue by storing skb_ext_desc
in the host tx descriptor and using this skb_ext_desc field during
completion or during ath12k_dp_cc_cleanup().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c    | 10 +++++++++-
 drivers/net/wireless/ath/ath12k/dp.h    |  2 ++
 drivers/net/wireless/ath/ath12k/dp_tx.c | 15 ++++++++++++---
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index b1f27c3ac723..34c72a1b5ae1 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1206,11 +1206,19 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 			if (!skb)
 				continue;
 
+			skb_cb = ATH12K_SKB_CB(skb);
+			if (skb_cb->paddr_ext_desc) {
+				dma_unmap_single(ab->dev,
+						 skb_cb->paddr_ext_desc,
+						 tx_desc_info->skb_ext_desc->len,
+						 DMA_TO_DEVICE);
+				dev_kfree_skb_any(tx_desc_info->skb_ext_desc);
+			}
+
 			/* if we are unregistering, hw would've been destroyed and
 			 * ar is no longer valid.
 			 */
 			if (!(test_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags))) {
-				skb_cb = ATH12K_SKB_CB(skb);
 				ar = skb_cb->ar;
 
 				if (atomic_dec_and_test(&ar->dp.num_tx_pending))
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index e26a9c3477d9..c8e0c70a4d26 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -295,6 +295,7 @@ struct ath12k_rx_desc_info {
 struct ath12k_tx_desc_info {
 	struct list_head list;
 	struct sk_buff *skb;
+	struct sk_buff *skb_ext_desc;
 	u32 desc_id; /* Cookie */
 	u8 mac_id;
 	u8 pool_id;
@@ -302,6 +303,7 @@ struct ath12k_tx_desc_info {
 
 struct ath12k_tx_desc_params {
 	struct sk_buff *skb;
+	struct sk_buff *skb_ext_desc;
 	u8 mac_id;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 45f4c8bd78e6..ab359483472f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -84,6 +84,7 @@ static void ath12k_dp_tx_release_txbuf(struct ath12k_dp *dp,
 				       u8 pool_id)
 {
 	spin_lock_bh(&dp->tx_desc_lock[pool_id]);
+	tx_desc->skb_ext_desc = NULL;
 	list_move_tail(&tx_desc->list, &dp->tx_desc_free_list[pool_id]);
 	spin_unlock_bh(&dp->tx_desc_lock[pool_id]);
 }
@@ -430,6 +431,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		ti.type = HAL_TCL_DESC_TYPE_EXT_DESC;
 
 		skb_cb->paddr_ext_desc = ti.paddr;
+		tx_desc->skb_ext_desc = skb_ext_desc;
 	}
 
 	hal_ring_id = tx_ring->tcl_data_ring.ring_id;
@@ -508,9 +510,11 @@ static void ath12k_dp_tx_free_txbuf(struct ath12k_base *ab,
 	ar = ab->pdevs[pdev_id].ar;
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	if (skb_cb->paddr_ext_desc)
+	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
 				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+		dev_kfree_skb_any(desc_params->skb_ext_desc);
+	}
 
 	ieee80211_free_txskb(ar->ah->hw, msdu);
 
@@ -538,9 +542,11 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 		wake_up(&ar->dp.tx_empty_waitq);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	if (skb_cb->paddr_ext_desc)
+	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
 				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+		dev_kfree_skb_any(desc_params->skb_ext_desc);
+	}
 
 	memset(&info->status, 0, sizeof(info->status));
 
@@ -736,9 +742,11 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	skb_cb = ATH12K_SKB_CB(msdu);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	if (skb_cb->paddr_ext_desc)
+	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
 				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+		dev_kfree_skb_any(desc_params->skb_ext_desc);
+	}
 
 	rcu_read_lock();
 
@@ -905,6 +913,7 @@ void ath12k_dp_tx_completion_handler(struct ath12k_base *ab, int ring_id)
 
 		desc_params.mac_id = tx_desc->mac_id;
 		desc_params.skb = tx_desc->skb;
+		desc_params.skb_ext_desc = tx_desc->skb_ext_desc;
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
-- 
2.34.1


