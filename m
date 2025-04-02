Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1456C36018
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 18:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kH4mg/2LiLW0Qi7Za2o6tSno8k8nCOBPtgA07zpuTE=; b=IxWrZ5WBnrOGMwEvC6pidfaaJX
	snrO702talfdyD6GnrwuKTH/2Hq0KlfIwYe7tfNjDNd3iVQKcc0FHXDXYJX/t17/hOXU2W1XwHlu0
	N51F/U7osWUHj34iwQz9t9MP+DhUJvK/LwXkWerGaH2O3klyorH0sYKXBniElp7CuJLcYLGr7IhzX
	Mr0r0Tczp648D/wSUKugvjawPV0J/avmzPAV0SDsqYS00NXdI/3OLXzl/jYFxWlqCsBbcKRzBkmsY
	Ah1oaDBUaCbN5M3zMpl2eGo/axilE64CV5ZFvYxrP7iRiawPnaDLbLq/JzUwztzbFAh4mmKMA2Umm
	eXlgzong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02cG-00000006tIb-371S
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 18:15:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02cF-00000006tI9-0yOv
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 18:15:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DS429007554
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 18:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3kH4mg/2LiL
	W0Qi7Za2o6tSno8k8nCOBPtgA07zpuTE=; b=cEFyo/jMAF1AYgiJZHmy3uenX+7
	Ig8WKhd+cDg47p0YrSNieJGBScqiHhgDPuz0CVYIoJAlgwpj8ipVXhXQcagmQRGo
	advDb2IzIlWcD0U2GJMISjEzSFUrncM6j2RKA3lY1ZIiqtc8zWCj3sVhmd0KihdR
	V20K0P9aWY1MrhakRdCxqztybpFXrvlPrPU+b6UR1e8SJ9zIWO0yo0iFNqE4Yow4
	PA+5tbzQrvU8VlnKVRHxXAAGaBXUeyYkCMcCuISfFJ6H08+02SeeJoVgoyPbtR5W
	GrGP+07zen6MolMe0WTacPdk8qxISfUhA2CPIdE1REJws+g77m9sQZ/X2Iw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxb02a2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 18:15:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af972dd0cd6so78509a12.1
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 11:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617706; x=1744222506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kH4mg/2LiLW0Qi7Za2o6tSno8k8nCOBPtgA07zpuTE=;
        b=PPfsW99f+hCxsUUgwVVxJUMdMMqOk9N5Y+WPDKdOh/6zECN26SyULefbSqMwCMGb7I
         F0fIxt15tlL3zoYreMWk7xtThRw1BdpoCi6ZzqNntZXkL53/Lcwso2AjB91uEBhNKHKK
         bzajxGtd5aCp6qty8TnfzzPTneioWUrIUqz8tzQBQqk2kxEbUrW4fdAIiqvkIyAg0y/b
         Zj820wuSuLtB0A9VL0T2B4PQwkpNxuGlpOhHtuWdc7gHfg4a41qwDTpAkfo7GBgiwUFY
         t0WWUjxal4Z/F/GNrnF9aY+fm10p3Fn6wax5oRSVaFAtbY2Q92phzUPCzSRUPw3oC0ef
         yrpA==
X-Gm-Message-State: AOJu0YxREFlUmi1R5yldZlit1v+BNucENGNW+smlkxisldBkbg7C31xN
	1ZVLR++998JwMHlr9ONJVQFHybp7qEdZc2Z7G5DjJlByyD8q8iESDrvGKoiNx5/ies0juH9Q0l+
	jo7kH3j0yn8Grl44x58edqclZhp6ywmH+x4asr+kCXM4tlwMGjVUnhGQh2Rm3bhFGfuB8
X-Gm-Gg: ASbGncsP0T0FRGiem/AvE+IOaKL4Izjc+Oquc8y8+nj6Q9ryLed30f/a9TFloo2nnCk
	hc+mdg4uUsPfdW/KCUW22x4Ly65q3lZN2acaCmuyNvw2bWMYtCpvCa3AM+sx5at5DM4oHJ1u7SC
	tZBozBSDQpP3VV+BX/BQU3pmJ+iuvSsR66NQ9xNZzpIj2psCprkSun/4u1enCCskcZzeInUSI9v
	yDMF2mZxehnk2GOJxux/a+iV6Knm5pr7uISiUyyn2BvbzZl1bwaXd4yBCq/V2akAIcIl/UoLx2T
	YnH+g0zOTxUovD9wEgGCHYlnp3Bq3BhNgrPtFbpotQKhrhP58aPnRmjQrrUt//XQLOpdimGVgb5
	hnd5QOpZ8cbuixMts+G8IIOiNWb1f8sT/Mw==
X-Received: by 2002:a17:902:d551:b0:220:d439:2485 with SMTP id d9443c01a7336-2292f97a6a2mr308344455ad.29.1743617705635;
        Wed, 02 Apr 2025 11:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU6kLX6RDMozTZywWQC1yVew2IPm1v0hcV2dhZz6bqZOPGfrrv3sEM4qDnD6A9CgD+xdoKpQ==
X-Received: by 2002:a17:902:d551:b0:220:d439:2485 with SMTP id d9443c01a7336-2292f97a6a2mr308344145ad.29.1743617705198;
        Wed, 02 Apr 2025 11:15:05 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf14csm111689675ad.137.2025.04.02.11.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:15:04 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 1/4] wifi: ath12k: Handle error cases during extended skb allocation
Date: Wed,  2 Apr 2025 23:44:51 +0530
Message-Id: <20250402181454.2699777-2-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
References: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZuaaCbpdFYZhnHQ6nVn8nn4edVR1Og2x
X-Proofpoint-GUID: ZuaaCbpdFYZhnHQ6nVn8nn4edVR1Og2x
X-Authority-Analysis: v=2.4 cv=BavY0qt2 c=1 sm=1 tr=0 ts=67ed7eaa cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Qd23BeFobrpH1aaNZ9kA:9 a=bFCP_H2QrGi7Okbo017w:22
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
X-CRM114-CacheID: sfid-20250402_111507_274657_192A6903 
X-CRM114-Status: GOOD (  17.48  )
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

Currently, in the case of extended skb allocation, the buffer is freed
before the DMA unmap operation. This premature deletion can result in
skb->data corruption, as the memory region could be re-allocated for other
purposes. Fix this issue by reordering the failure cases by calling
dma_unmap_single() first, then followed by the corresponding kfree_skb().
This helps avoid data corruption in case of failures in dp_tx().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 29e2715024ce..03c79becd59a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -230,7 +230,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
 	struct hal_tcl_data_cmd *hal_tcl_desc;
 	struct hal_tx_msdu_ext_desc *msg;
-	struct sk_buff *skb_ext_desc;
+	struct sk_buff *skb_ext_desc = NULL;
 	struct hal_srng *tcl_ring;
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	struct ath12k_vif *ahvif = arvif->ahvif;
@@ -416,18 +416,15 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 			if (ret < 0) {
 				ath12k_dbg(ab, ATH12K_DBG_DP_TX,
 					   "Failed to add HTT meta data, dropping packet\n");
-				kfree_skb(skb_ext_desc);
-				goto fail_unmap_dma;
+				goto fail_free_ext_skb;
 			}
 		}
 
 		ti.paddr = dma_map_single(ab->dev, skb_ext_desc->data,
 					  skb_ext_desc->len, DMA_TO_DEVICE);
 		ret = dma_mapping_error(ab->dev, ti.paddr);
-		if (ret) {
-			kfree_skb(skb_ext_desc);
-			goto fail_unmap_dma;
-		}
+		if (ret)
+			goto fail_free_ext_skb;
 
 		ti.data_len = skb_ext_desc->len;
 		ti.type = HAL_TCL_DESC_TYPE_EXT_DESC;
@@ -463,7 +460,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 			ring_selector++;
 		}
 
-		goto fail_unmap_dma;
+		goto fail_unmap_dma_ext;
 	}
 
 	ath12k_hal_tx_cmd_desc_setup(ab, hal_tcl_desc, &ti);
@@ -479,13 +476,16 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 
 	return 0;
 
-fail_unmap_dma:
-	dma_unmap_single(ab->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
-
+fail_unmap_dma_ext:
 	if (skb_cb->paddr_ext_desc)
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
 				 sizeof(struct hal_tx_msdu_ext_desc),
 				 DMA_TO_DEVICE);
+fail_free_ext_skb:
+	kfree_skb(skb_ext_desc);
+
+fail_unmap_dma:
+	dma_unmap_single(ab->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
 
 fail_remove_tx_buf:
 	ath12k_dp_tx_release_txbuf(dp, tx_desc, pool_id);
-- 
2.34.1


