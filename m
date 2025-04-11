Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD88EC36010
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlHK4YKuTzkw/iX1UXQiiH6p3r2tB5QEn0INjW1eDb0=; b=nqz3cU5Lgx1eQDVkKPuGbliOKJ
	qoDhJHD4A4ORFpopc5EXS+QuMYzwShpl9MV34LdLeL4DuG2ZDbBLn9vKLXchPZJyBfWbTbeSVtalu
	Xhz+jgIxhaGb5U9xSxD/Mhj4MhUG+NpeYJY+pvK290paVO8GWkPjghBTUFKCOsd+nkBZefVnp8KhL
	KLKe0FmAjxuZffyNjvtPLH30v4HzF94vYwULm4cmg52o0XjWRjxFZhRqA3a02q0Pe7GTybjuisVGP
	/ulJEzTLmQMpB3oC31xNAzdRkrpNjXKJ9w/uq1dtUyrFsYrURF8rQwVSYN1hZMLsGUR+KqUDNY4dm
	B8g927Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ADF-0000000D6ao-2AsN
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 08:58:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37Sz-0000000Cegk-2gE8
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:02:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1Ew1C006985
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JlHK4YKuTzk
	w/iX1UXQiiH6p3r2tB5QEn0INjW1eDb0=; b=pKQXs+tS0Bt7f6KeZUKfYTp3HQE
	0ItrmB6whA902585eXlgxZARk6vAnSxoCba/Y60SIeyaC/3gjiEbq1uD9wHD037w
	IWSFH/f/6HKAvM2nfDQ9JSmjEOQuqdIN/cp1t24fjkUWcSs9veKfnr+/R0yxciC2
	40BUiup6DiCrdA4CQR54qo9LINBaS9xU0dQik43llc342sLNGtdLvrg2u4feKraE
	LyRvUzVSufFNuJ92xZICA5XRmKfHPyGNMmShxOrMRbJoHinnTSuU9fsaE+2hhAk9
	9mul6mRvAm4A9uZbJ/ErUzYFRhzScXQR8yVuLhSSxpM4OzHUNLwuAD9sWNA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3jc3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7394792f83cso1280908b3a.3
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351335; x=1744956135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlHK4YKuTzkw/iX1UXQiiH6p3r2tB5QEn0INjW1eDb0=;
        b=RWYJvOy4Ylpyk09bjGgHcrOfDvh7FutNtiiSjXxpQvrLoWFX8jno9tocWghrOVmTAk
         Jd3yTH9OAmZx4KtxQqI1S9TMEZA08L34aDx9CiIHkjPcM4r/2f3x+tRyu/ctHhXbewzt
         DxL5mNTYEIYLizbWtlEmUAeW5qvHQO9+s2vRnFILI688SBavqSKzroS7cwia6i6EyP7L
         hout3nN2Ep//QiSgglslBNVBiS+89mgDBdoI3V32iNBlDR7y2lU+KpRKCeUN9gYuggj/
         yCYGd77vc/B9tkoK05Ok7OlUjUFBzRvR6h+FFl0D4ttNxduiqgGLpmmiHmhUX6k2aQw4
         K/AA==
X-Gm-Message-State: AOJu0Yy+ZKD7zv7CmxzTxsFF0aEOg4V3q6rp0mnEfRRzNeFmNL64wNnE
	MjMrw0ppqnv4oc+S5Mz0WaUuQWjZ2iCIfDcSrEMurqxaRD5HvFIwGqrJLQ9X3j/S0JmZ3oCw1V2
	A8Zbn6tEy/b8eW0QT1bfDV53+kVp5CIcnYSw3DLlVCsDvPN588qG1uiKvaQnVncjGunpy
X-Gm-Gg: ASbGncsYzZRQ5MjuBnkanpeDWIXmaprt5sUHYIdFCkJMkfJP50QUJe8WzYcg+BYJ7rI
	yUdRcgYIGGch2yxEaoW/DOWG3IsEH1t8RqTrA0EkpXo1BCJb4HJ4TBw7SbFrYPE0KN9vxLeWu1w
	mzhRHghBaC8JAe6yP4HENo1p91AcCIKDqGLB7m9luGJhhlfyes4MveOu2cfAOEyNENgEpZGDloI
	TmfHQI0lxBjxcrIg1PEMBqjzy2U4y3zvdKLJLiw9ud230317Bw8981SAmmr3pnXuGDU0wt0dXe1
	3iege0JY1rrgWabXEVz5+Uj6M37r2nLscs/QA1CCIpBRm+Ycns0yfMLx9s1GqDioJNGs4FXLn3l
	i/Dz6TlB2E2nBdJRtUoAgCwKAsrYoTQ==
X-Received: by 2002:a05:6a20:2d0e:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-201799908cemr2526354637.38.1744351334680;
        Thu, 10 Apr 2025 23:02:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5sfpUjKl0m3+LJ6poTjKB4m7DlLGLpImnll9SAYXKJuyQ38HG2wIwpl2Ghcg0ArHJgQUbxg==
X-Received: by 2002:a05:6a20:2d0e:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-201799908cemr2526314637.38.1744351334173;
        Thu, 10 Apr 2025 23:02:14 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2328435sm624567b3a.157.2025.04.10.23.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:02:13 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v3 1/4] wifi: ath12k: Handle error cases during extended skb allocation
Date: Fri, 11 Apr 2025 11:31:51 +0530
Message-Id: <20250411060154.1388159-2-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
References: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8b068 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Qd23BeFobrpH1aaNZ9kA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: WkzkQU4uxsdcK6mgwQK9JgO_b4g9ll62
X-Proofpoint-ORIG-GUID: WkzkQU4uxsdcK6mgwQK9JgO_b4g9ll62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_230217_799828_6D48B77A 
X-CRM114-Status: GOOD (  16.42  )
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
index 91da0805706f..9d58a9a9cbff 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -231,7 +231,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
 	struct hal_tcl_data_cmd *hal_tcl_desc;
 	struct hal_tx_msdu_ext_desc *msg;
-	struct sk_buff *skb_ext_desc;
+	struct sk_buff *skb_ext_desc = NULL;
 	struct hal_srng *tcl_ring;
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	struct ath12k_vif *ahvif = arvif->ahvif;
@@ -417,18 +417,15 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
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
@@ -464,7 +461,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 			ring_selector++;
 		}
 
-		goto fail_unmap_dma;
+		goto fail_unmap_dma_ext;
 	}
 
 	spin_lock_bh(&arvif->link_stats_lock);
@@ -491,13 +488,16 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 
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


