Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4AAC369A1
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olrNLy2pDRfTnemTktBOL55UfepkNvExCqdqi2eTMK0=; b=DQQVDMmROHDq57v2G00Ov41Md/
	QFmW8rgROSFmrdOG8pakClmnsT+CZSS1ftj3g7pNWaZz/R1036ng/Y7y7Ax3Q1XaxUxthHfw4sGSF
	3w0McNd/Z/LnOlDrXKvG6hbJtn4PPpBaw3mIPi/DLGktVuu4l6CjQ9+bhtNLRTfjVSwCWKckJvfVC
	JqQpQvvawVgm0YrXxon/E+xo4ySinrxspD5v1mfUW6rKzJlleXUnxHUvs2XH/ByArVlbazFgQtkYR
	eWtreN40Hou7CZEtbwHudtxK5KAwChnZZMtr4eau5pGA8uSas77FJnSm/vJdeIVnoKLoExbas4PTV
	Ynz/wz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Dn-00000002sij-1H4L
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:14:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Dk-00000002ses-1JmE
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:14:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GP4m010549
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=olrNLy2pDRf
	TnemTktBOL55UfepkNvExCqdqi2eTMK0=; b=DKnXUHgwFyXUkd69i/6kR6Q+tw4
	p01JHmh8s+bMlg59ki+XGEixri09fqwBG5/FNOjsWnBgvJwIIx6qW9S7jsnYHDnc
	dkXeyq4jKLkyo8emIRnBgSXjJ7hbSo61W0dA8QsJ370QzwXR1wFuaado4qRIna9s
	SLpoTxiv4Iz9DwP1BqrBOrPbebFtMfDw+pu7mT2Oq8/LCar0q5yA1iQGUpRiAhlp
	+/ptjP0T0w01SpDtuzC/hZN3D7q3W+FGuFayvboch2g+kOS62jhDEp0qgMTYbPbs
	/NXhOBjyt2ncduch9+liPsAuMhZlIBpSfpn3d0hHkY8BuKwASwgNc8lGR3Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1eken-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:14:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af8d8e0689eso5647139a12.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092841; x=1744697641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olrNLy2pDRfTnemTktBOL55UfepkNvExCqdqi2eTMK0=;
        b=T+tCPh3qv4yjKoPasLp/eV5YDIdjxQCzPBvTkv/J7Y25GcByOmmhgazQ4HJg578N5c
         FRsJhrxvhCRvyXpO1SHD7MTDDhMaFJbdLZr9QTg++NyMNWQ2xZ4onbrcLTfYRW405d20
         W9Zw8pf4Ms8gSYeXm/rdgbT6D1e1unjo1WIWkQWYSjyF8KqnuWO9cykmJ/EAxpa+w1k/
         /j8cn3wv/MyCBwlNoTjSCHCFBQfdln5YYNMOMOfbxkr5Nppo810b01E8THOlOIuwzqdL
         GAfOVFcyKlOVMVZHTYF116Inb9I0DDgHPj/lKHYkB7BCzYAA+d3ZJ9CPM4RsqXBn1tgK
         E6iQ==
X-Gm-Message-State: AOJu0YwGUHt7D0CpEA6Xr79arQJGQvDq6hzB4bi6BsIOG8TGRIw+s8Ca
	WR7YS5rdDEo6ZDmdCuyJcYwtvM6KqAFj9hysVUb+vIBRAsi8D7F5KMA5gYqsekXfgCRtrV3eioj
	m5ZwtsLqcfWYxUeQhvHZjIl6dsqEPxoEPeG45t1c2cnT3jVpJiqfNPunjw/tpgEz3qCpk
X-Gm-Gg: ASbGnctdxec7clFXntJRv6t4VvF8YcJmZ4iOoZndKDr2hIptIEa4pxekvtmClIAhXrr
	clDfZ+EcvzhNGmIgndMXa3FODJAl8vE+4O9+dNLQhpzvtFCBFVLMm9cU9RvgRcmVfwGppzABnEx
	zQDGjLFZ0twIp2YhJ+qofnOk+1+b6TUdElsUqrAggb0akcBL1jLpA4PWP5O3pucHhVQkxQAa8cR
	jg1+hRHyvH50JOGnoxeNMwLIYSn5PmEHgoxUraIoWRYAywMdt6gyOg/qwyF6Qgk0vqT3Dn/q3Qw
	2/JjuXfbnh7B3U+JEjW5Uj+yNlOcuyp7/FGvXUOvZJwN3/LKJNFDzjSuqpQox9VNTpq95EIIytN
	S6EFq7JMxbB6EoWAqAWmbHqfBd7Q9fqmq5w==
X-Received: by 2002:a17:90b:188c:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-306a6179a96mr12672337a91.19.1744092841671;
        Mon, 07 Apr 2025 23:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmOq7mvvxns/jU1l9GXGdqKsz3ASS5fX2Fd+UjuOJusmNSgIgcWzVv2cx4/ddu7CQ5sSqI9w==
X-Received: by 2002:a17:90b:188c:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-306a6179a96mr12672323a91.19.1744092841311;
        Mon, 07 Apr 2025 23:14:01 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb94f4esm10258444a91.46.2025.04.07.23.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:14:00 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v2 4/4] wifi: ath12k: Use skb->len for dma_unmap_single() length parameter
Date: Tue,  8 Apr 2025 11:43:43 +0530
Message-Id: <20250408061343.2774345-5-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408061343.2774345-1-praneesh.p@oss.qualcomm.com>
References: <20250408061343.2774345-1-praneesh.p@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XsidGep0vJlxiSBi2Dk0voBxg5B4g4u-
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4beab cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=HWa5UnKU9jpq--M6GMsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: XsidGep0vJlxiSBi2Dk0voBxg5B4g4u-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_231404_540215_938D2651 
X-CRM114-Status: GOOD (  12.32  )
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
index 03ca45d10f7c..3bda44b41e34 100644
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
 
@@ -745,7 +745,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	if (skb_cb->paddr_ext_desc) {
 		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
-				 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
+				 desc_params->skb_ext_desc->len, DMA_TO_DEVICE);
 		dev_kfree_skb_any(desc_params->skb_ext_desc);
 	}
 
-- 
2.34.1


