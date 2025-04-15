Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E526DC369BD
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcm3mTXhNgFIzDf8ONFOx3CSHaqCCKtUmgO29xy/9hQ=; b=Mwr/vnvT1QqLR/RfnH3TAabyY5
	vb50RV6Bi8LUNKdOFvBSQCWXSCZgSfU51b1vxAkXEGgv6zFdBRBrjeoTU3r+p7q7blIBNvJQgXY1+
	to+tRTNAM41NUdjrrVYQlgKQgQan2b7AG2lVLFU8nNkBjIxOKAFXVs33s6yX4cNU9/UMWvIwXjz03
	AqBjulu3jYipCyACNTd5lZJk7Ni9l+8HhJifSMdCfgR5GtQfxEBT6dB+yAwX49INR8kwJFBTNbjAI
	LxhyQj44vfaRJu78imfzrLiqQy6n41bHqoC4PfMHD8XAwD9+Q+d3yIcUa3YFTht647eomLOQahcVZ
	+h6ujfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mRr-00000006yBB-2dZq;
	Tue, 15 Apr 2025 19:59:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mQl-00000006y3f-1TIC
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 19:59:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FHlCLY006271
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qcm3mTXhNgF
	IzDf8ONFOx3CSHaqCCKtUmgO29xy/9hQ=; b=IY7eDxtOG7WtubByim9840yByMD
	n2/Bemn4g/ZKRrTnLvWen6JDCaNgc3la++V66RFbW2eWAsnocAGvc7gkPP1ch6PY
	8ofXuHzzOCk16Y/ibuTSKqZkEH32DzTn+ME3hFwZ9ktNGaVUF2RVpGYPo8cJ1CUY
	6riGABV3HUh7A5PgKv198me+womIETXRt/AhDPnSWG6gvwfWp4nD/Wfwktxb3zL9
	YX36I91M68jLozHXOABQExxfnngvXdYegVA9eFA5LG46Km75sF4MTQa6q09kigiU
	putfCfdXcd45cxHEQJL+Vy5ZiEO3zLWb3dEuf4tO0w7Zh0eUCf98YkY/utw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wh9pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:58:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so8673924a91.0
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 12:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744747129; x=1745351929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcm3mTXhNgFIzDf8ONFOx3CSHaqCCKtUmgO29xy/9hQ=;
        b=qG5vX2aswLw3mtNh1ByAXYRbcPhsyVP3muz9U2j/iw0yXD5vrhQ59HobBVGjt82ODg
         SWlUi7Ug8OkZgUyaZYQSWeoo+RFvr468mGLFgm8cWpHVGe4q6F0J9AB7H4J47uTLx0yA
         GrsPpxBy3T9v7bbASpX8xIl+kDB6muD0nUA2695UHDoAEOAHfWV83+L67mEeDmeAMmQu
         7gw8wRmLfyslzsLvgOJUXZymt7N2RLAhAYZhfsIYvMIm0L3yHjVzJ7D2CCwkHo8Jw5H9
         MHwtaxfcVQFu/InoPe+MwZSmF3q0uieNomKhXmAaAa0YcfUYxwso3racGom9ktDLkGZ5
         JmnQ==
X-Gm-Message-State: AOJu0YyPOeRHE5tJyJAPAQLQWfFX0Io51pCKoGzJW2whFLoBWkwNgYDK
	zs+NH6Bnf0s9Q5JEilglqMZeHkH5aYmQHoiGjKu1CJ/+fZvpqEWLU/fncCRHyy4Rttfucc7LiTC
	zmETQLlTEt2vZOH/6pp+atcdxRsL4NDt/01Di4zyAX+iWkfNbEOsLSE18qNrmOlATGqHh
X-Gm-Gg: ASbGncsm9W0qgDWILj29LiZCVkghR1uHdVJNrqXPhh930gZzKnfTJU5N3csDzH+xVCd
	p9zQKfFNtIGq5RV1KZU4dighvHLGyrZZ0xQuuCv5+DUq0Lr0rwh7y/iI1IUCitxLNJYkh/sVOzi
	Lsjt91cu0NJC3PwiRUxY9j3n8+NriqABYZDOkhN7tgDVLmf8qpu2eV5C+MCdGMQJ8nc6Z9cB2mC
	OdEajjF7gX60+lPdTqKEPWt9cYsztQYwCKCh0FtbELwbVW2SyHf4Z8Wq3rHKtRabWqPCyQeuZPM
	jG55NSEtg7DY+bTMhetC6nblCpcElHvnUyaG9nyNFoMk/Fxgd5qJaTcq/kWuJlQMVximE8PYx1v
	TfaQQ5DkvI67cAH7zRlIA7tDjYvtiU5MOA3LyHeg4
X-Received: by 2002:a17:90b:540d:b0:2ff:6aa6:47a3 with SMTP id 98e67ed59e1d1-3085ef52d0bmr664195a91.25.1744747128688;
        Tue, 15 Apr 2025 12:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdWdsmzjjjGnJ6hmwUqpmMBFwW4DMydzBiW9SemD5tAw57uItaXtXTFitggGXHXy4unOBTKw==
X-Received: by 2002:a17:90b:540d:b0:2ff:6aa6:47a3 with SMTP id 98e67ed59e1d1-3085ef52d0bmr664160a91.25.1744747128301;
        Tue, 15 Apr 2025 12:58:48 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8ea61sm121626265ad.103.2025.04.15.12.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:58:48 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: avoid multiple skb_cb fetch in ath12k_mac_mgmt_tx_wmi()
Date: Wed, 16 Apr 2025 01:28:12 +0530
Message-Id: <20250415195812.2633923-3-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415195812.2633923-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250415195812.2633923-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67feba7a cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Lpz1UfvgpueRW3gVfIYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -zOCJKi-__KjmffSPNOZjgEBCs_Szidi
X-Proofpoint-GUID: -zOCJKi-__KjmffSPNOZjgEBCs_Szidi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=912 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_125851_509861_41B73433 
X-CRM114-Status: GOOD (  13.47  )
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

ath12k_mac_mgmt_tx_wmi() fetches ath12k's skb_cb space multiple times from
TX skb which is redundant operation. Save the skb_cb in a local pointer
and use the same instead.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index aaa02d3d0f95..43497ed12190 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7150,6 +7150,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
 	struct ieee80211_tx_info *info;
 	enum hal_encrypt_type enctype;
 	unsigned int mic_len;
@@ -7159,7 +7160,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	ATH12K_SKB_CB(skb)->ar = ar;
+	skb_cb->ar = ar;
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
 			   ATH12K_TX_MGMT_NUM_PENDING_MAX, GFP_ATOMIC);
@@ -7168,14 +7169,13 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 		return -ENOSPC;
 
 	info = IEEE80211_SKB_CB(skb);
-	if ((ATH12K_SKB_CB(skb)->flags & ATH12K_SKB_CIPHER_SET) &&
+	if ((skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
 	    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)) {
 		if ((ieee80211_is_action(hdr->frame_control) ||
 		     ieee80211_is_deauth(hdr->frame_control) ||
 		     ieee80211_is_disassoc(hdr->frame_control)) &&
 		     ieee80211_has_protected(hdr->frame_control)) {
-			enctype =
-			    ath12k_dp_tx_get_encrypt_type(ATH12K_SKB_CB(skb)->cipher);
+			enctype = ath12k_dp_tx_get_encrypt_type(skb_cb->cipher);
 			mic_len = ath12k_dp_rx_crypto_mic_len(ar, enctype);
 			skb_put(skb, mic_len);
 		}
@@ -7188,7 +7188,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 		goto err_free_idr;
 	}
 
-	ATH12K_SKB_CB(skb)->paddr = paddr;
+	skb_cb->paddr = paddr;
 
 	ret = ath12k_wmi_mgmt_send(ar, arvif->vdev_id, buf_id, skb);
 	if (ret) {
@@ -7199,7 +7199,7 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 	return 0;
 
 err_unmap_buf:
-	dma_unmap_single(ab->dev, ATH12K_SKB_CB(skb)->paddr,
+	dma_unmap_single(ab->dev, skb_cb->paddr,
 			 skb->len, DMA_TO_DEVICE);
 err_free_idr:
 	spin_lock_bh(&ar->txmgmt_idr_lock);
-- 
2.34.1


