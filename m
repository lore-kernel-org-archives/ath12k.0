Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC35C36017
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 18:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfQKh9W0ONVXpnR6TE/4zg4F3jk/hUWyS7VSMd4+DYk=; b=xuXY0c5s27jL0EADlJd9u3O/iD
	Qmx3BrV4XRQGqk37HUNazpRTq7FHto69+yuQp0fEvB1USyGeMXC5hgu8WPRmWte5RTxqvT4dHyLy3
	mW4yq/KptpmMoS85KgEuUTziz5xNv+ZNCK78aN2Llc+krEa+rMVrwhcHn/xFv0KA9ay6teMjndB1U
	by69MW3pY+eyygw/o0pflOdOuO2p+BkNXqOcKwq84P1hBXnhoYpnSTj+2TZoUAEpS4DfJIbVEsU9v
	MReC/hsLFyxUgh+uGH8mP7Xs1nLwR+CacdaqIZZ/u9y7ZPWA4ZFvmyru0R9UEpdcSLEezFdsR8LEf
	3phzVynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02cN-00000006tMF-0uSe
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 18:15:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02cK-00000006tKy-2tah
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 18:15:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DDmmR007564
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 18:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BfQKh9W0ONV
	XpnR6TE/4zg4F3jk/hUWyS7VSMd4+DYk=; b=mfK/No/3+mWyMiV4YPZOfGrK+LM
	lzE50XIk+UlxxLGc2woXYY/k9AW0x4fYq24LRhp0qE+gWZ1unn95+nGNSbbpTK/t
	Tyfc0MOFItBUx2W+lr48qSX6lZ31+2gN07sOR6S51zwhWf7Wz3C6VkOFMiuOfPlm
	04A4HX2/jDLeOkd790cFAfDfTnsKWZVbPd4MzCf+shNeq3HbOVZGu8HEfITq5B3L
	2OlPnlQA0ZnMspyMdaQHZhXjYN9brBRkKP9rzPVP8rne2kCpd8wOkMBERTH5PBdL
	fO3tXpolCNOdvHGx/B+WQ1odB/xV4WosAGS27sHYzPXW5pnde+VsrnuzPsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxb02a2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 18:15:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224192ff68bso1125435ad.1
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 11:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617711; x=1744222511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfQKh9W0ONVXpnR6TE/4zg4F3jk/hUWyS7VSMd4+DYk=;
        b=KmtoTpmQyxGLLILWmvYYyapLnDMHAeZXhJ+cjrxtqcwF7Se90iQS6l7RZMOZRrzVxa
         GWSJAAQNgldnbEBDxvNGbqj56TEjWwItNr0W7LV+j5OXjWCaGNrI+i9wmsfpCxaBu9H6
         GFIEKQksguEXJZA54MnhYpAY7/uht4B8VNWcpX+lMFA0eBKjr0xFFSFOvKtpDHYBgTCC
         KQAVEuPhlMfld5TVqZ5FOt8of2EGN0MfIou27NaN2NzcgBKt7zQ5+9c5lUo57/dMhGwy
         b3QhdoF0YXxtSCsXdlE0Fgy953UbD24Nb72wrn3qFtcn5tcWNoicQMUZxLN0rLB76zPG
         V3qA==
X-Gm-Message-State: AOJu0YyKfL5pZHY0PqBBDCsiPlTCduzQHJx8/AEiBa0G4umSqksdqogR
	OsPFJKKn4Ng9C7npB3GjcjgqW6HAreq/nlMXdqEMjV9IKkmvsOSS6k4ovfxU5WW3HdBGCL6nPPd
	Fmyox595FPTjIvhbJh4d/FQ4S1zjfTiTPBqVWnLS4jdEu6Epl9+pbgfm9lFQAtqiAZyia
X-Gm-Gg: ASbGncsSOmQ/kAbp4KXLA2x1QUJdXtj8Z2eNZ06tp/i/TUY8l6NQomSbq9m1DCjz08a
	a44sYvc8cItf8UaBzwYc9B7hwY84EH7Lq+x48pEZWhJHgU4gZoUrAsyN/e1ZsoLqBRvXKglrm0f
	fWsjvYQY/qocAPMlCHqc/+Ur7ti7mcTyTnBovm8l8emUiv5kALIdjWkkdbT8xPFqJtrD+euDckZ
	JrfPtg2iC3z8w9zlOOZOzB6NpWytR5vQnN+gmLPdKZEyTdzOh9d8Xc0kNqnSnLoRFkP6iCjzl5X
	grvE2+qiY5WqK5ZcJgBvDFUrzm/fZ62dsCNZHe7GzJYXZx7LjGiwxlNqw68evV5+2iEX2oN9aKK
	sc5m2y5Ya66XbyqIPnkhCMsR0DeZPSW94MA==
X-Received: by 2002:a17:902:e5c5:b0:223:3396:15e8 with SMTP id d9443c01a7336-2296c6821bfmr43794155ad.22.1743617710967;
        Wed, 02 Apr 2025 11:15:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDLD8/RfIj/Y/+RSGHKxY9YJrRooy+dzn16LPNSwmIfHzQhWbkjgZHdlZ9sKnsUrmpQ+k3cw==
X-Received: by 2002:a17:902:e5c5:b0:223:3396:15e8 with SMTP id d9443c01a7336-2296c6821bfmr43793715ad.22.1743617710206;
        Wed, 02 Apr 2025 11:15:10 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf14csm111689675ad.137.2025.04.02.11.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:15:09 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 4/4] wifi: ath12k: Use skb->len for dma_unmap_single() length parameter
Date: Wed,  2 Apr 2025 23:44:54 +0530
Message-Id: <20250402181454.2699777-5-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
References: <20250402181454.2699777-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _Up3THjYNsvfDqGqS3rbGRoAofbctThW
X-Proofpoint-GUID: _Up3THjYNsvfDqGqS3rbGRoAofbctThW
X-Authority-Analysis: v=2.4 cv=BavY0qt2 c=1 sm=1 tr=0 ts=67ed7eb0 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=HWa5UnKU9jpq--M6GMsA:9 a=uG9DUKGECoFWVXl0Dc02:22
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
X-CRM114-CacheID: sfid-20250402_111512_737599_E91EC8CB 
X-CRM114-Status: GOOD (  12.38  )
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
index ab359483472f..9e598a585020 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -481,7 +481,7 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
 fail_unmap_dma_ext:
 	if (skb_cb->paddr_ext_desc)
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc),
+				 skb_ext_desc->len,
 				 DMA_TO_DEVICE);
 fail_free_ext_skb:
 	kfree_skb(skb_ext_desc);
@@ -512,7 +512,7 @@ static void ath12k_dp_tx_free_txbuf(struct ath12k_base *ab,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+				 desc_params->skb_ext_desc->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(desc_params->skb_ext_desc);
 	}
 
@@ -544,7 +544,7 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+				 desc_params->skb_ext_desc->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(desc_params->skb_ext_desc);
 	}
 
@@ -744,7 +744,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+				 desc_params->skb_ext_desc->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(desc_params->skb_ext_desc);
 	}
 
-- 
2.34.1


