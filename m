Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7640C369A9
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LI+y2nA3KGcyfqaaKLuNSW0EzMKBoBYWbhA47+9hn8=; b=H/ofQMu82B14PjMot/C2KLvtNv
	X9NVSBy/i+HpEduRIYfWwGYpHO1KMY1Mev8aN7szClBCNUGMxbrbbUpbcfadKf3M2TVWb8BvSccA9
	P9H7zLWBcuz5lqQbdbi6UCMNIC1curtl4R13732yk5p6bl+sX3aJgTn9sWVcjQ+gSDXOYuml8+9dm
	06DW8fYbIlTsQ6Vqfnvyvcr+FDMcJ/M0leOgxeWaIuyWyzrEUWfQ/DVzUOJZwM3YaQtvAswNFOIaU
	h+FsEJA6GKrwORBJ0L+Enl5ZJEYkDz7BzLaGdE7ystZXbzOYHMJZ9bekyUyAwWmgJb8Jqxdg2VqU/
	vjYuaWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ADG-0000000D6bO-2vXh
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 08:58:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37T3-0000000Cehq-18f4
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:02:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5WMlE032011
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3LI+y2nA3KG
	cyfqaaKLuNSW0EzMKBoBYWbhA47+9hn8=; b=n5NmWVcim6UTtkkacyU56Hbz6jd
	Q6SiZiwvyMKhsOKStSPBvzkWdvn2zAub580WJq5s0SkGZfkiZJUsuLCphImYb9/G
	SNEq2IbX3GhnhQrgQCsfpxc8LUtx/GMiPRu9RZT7EOry16w7afj02Dc2mHdCuJtI
	wkv8M8OPw70ZNoNixRhnxI7DtKxL7uEifDbhYw94WiSjLL8Lo2jEEoTKssf59YXg
	RZwzYIDYCXtAyDkFIPpsgmyl1UJhHSFKBCyJn8yrrx7+rteyMPY8LHRtL2ZdUkKB
	jBhP67QLGCrZ46Vh6UuBr7Mn6mgRzcqCYzWif9+yvwNt1PpOcE7xE0nJtaA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmh92g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7398d70abbfso2093774b3a.2
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351339; x=1744956139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LI+y2nA3KGcyfqaaKLuNSW0EzMKBoBYWbhA47+9hn8=;
        b=sikbWGueDVypySmxxn8faWzpePq/NATKmvpB0OXmcIWhH6tu2S+ETSVtKLeZftsz0W
         RWjK5KC/SNZlpp0Mpu0QNlrSfICQ2t9c8JYKdBukpZy6SDXrnOLvFiyc1qlYRnkm5qlg
         wxw9wVDl2yZocY3ah/uGjtOUfyMuKUnlVc5Iz/5JrlP0L1WFFHceDVyxQ9vZqLBnVd0f
         O1sUkJsHb8ISZ1hQZEKyVHFoXMMJYjMpVNz3Fwu18VoHKNEjivmgMFCP5cL4MUigU+8p
         KUq03u1kkXAQ8SeL96/4onGEpwf4kblpgSCnOt/bZ7O0C1bYAi5IWzfRQoqYfrkO1edn
         kuGA==
X-Gm-Message-State: AOJu0Yy3cZtPzF8ZUrItE+eiai+CrmxURLblJuFfWaOhZPsCsnzV1DLg
	H4ZnPdjxt83YF/R0hvlKrkE23Na7rYOzaetsyZgkSJpeQanaHnq8bGmoG0eCSf6HLDPqoyudkoy
	ewAqW31tKS4g1s363mxe5ivdDMhgrZb9xrdLnPOql6zQWLZy4YTfw9OLaN9/KWUp93xtq
X-Gm-Gg: ASbGncuzqdsShsHhoWlp+6QRKAWhQmV0SSZQbYIHUeyh2f5nHukCADlf3hAs37ZL8td
	RepqjzZ5OrLGVWIAL6KK0xMUhYClfDXJLfiaPeScRWFVmn61K20L+clW8Ipre/HzU5OTc8X7P6f
	yKHyCrA+4NPVeToLfUEeZspfbvJZiNvyIhOATNkvDWF0u6Fpv9+53OsqXnkkNP6o/DcWGbnNYWy
	yhAiO1AhvDCqQ5hpzpMNGxR2/DCyZTHnqFwiSVqEkTV5EquapdOI0+5fuH5zFvOZIqcxiNQJMql
	k7qbDmAh2V65aT+nhMJNSUNN+twD8lBmFlZvmm8dwuuUlOMf0BQo3anSBvc4yQiP/ZyEwewKo7T
	9/wjA0cYq6nJW4F68UHZMRIsezuuxdg==
X-Received: by 2002:a05:6a00:1482:b0:736:55ec:ea94 with SMTP id d2e1a72fcca58-73bd1293b3amr2318909b3a.20.1744351339577;
        Thu, 10 Apr 2025 23:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeE2pYHLFT4X13kg4+fpoiqxepA5LEoDfh+AVs7ZQVLKyLO6oscajfotgM2Yn76JUwcsL0qg==
X-Received: by 2002:a05:6a00:1482:b0:736:55ec:ea94 with SMTP id d2e1a72fcca58-73bd1293b3amr2318850b3a.20.1744351339095;
        Thu, 10 Apr 2025 23:02:19 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2328435sm624567b3a.157.2025.04.10.23.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:02:18 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v3 4/4] wifi: ath12k: Use skb->len for dma_unmap_single() length parameter
Date: Fri, 11 Apr 2025 11:31:54 +0530
Message-Id: <20250411060154.1388159-5-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
References: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8LVY-0Wm1OtrS-8oaGiRhEZp7ze-jJn6
X-Proofpoint-ORIG-GUID: 8LVY-0Wm1OtrS-8oaGiRhEZp7ze-jJn6
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8b06c cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=HWa5UnKU9jpq--M6GMsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_230221_313765_D484DF44 
X-CRM114-Status: GOOD (  11.50  )
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

During dma_unmap_single() for extended skb, the driver currently uses
sizeof() of the corresponding structure. When the allocation size changes,
one of the parameters of dma_unmap_single() needs to be updated everywhere.
Improve code readability by using skb->len instead of sizeof() the structure.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 9bcd20712888..2136eeb278af 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -493,7 +493,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 fail_unmap_dma_ext:
 	if (skb_cb->paddr_ext_desc)
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc),
+				 skb_ext_desc->len,
 				 DMA_TO_DEVICE);
 fail_free_ext_skb:
 	kfree_skb(skb_ext_desc);
@@ -529,7 +529,7 @@ static void ath12k_dp_tx_free_txbuf(struct ath12k_base *ab,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+				 desc_params->skb_ext_desc->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(desc_params->skb_ext_desc);
 	}
 
@@ -564,7 +564,7 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+				 desc_params->skb_ext_desc->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(desc_params->skb_ext_desc);
 	}
 
@@ -781,7 +781,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+				 desc_params->skb_ext_desc->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(desc_params->skb_ext_desc);
 	}
 
-- 
2.34.1


