Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2B6CA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5Iqq+539NbNLhX/V3buU/n4i1mDEyjrAaiCEdRrr0s=; b=N710+oXjavY58LHpGqJAHshEnc
	3UvYmEHWcxLjGIM084YNpLK2bUdJdh+Zmlr95ww9dS8YEHtQVF4s2oUxfy6PP5k5rw3zyimqjtcPo
	OIXP2LdLXDNCEtfSRmSXp55HszTdAOqZlWu+gLmmmykvOTxWJYx5zmIJWjje1AciDjtnXPC6Y0HJn
	h0NxXCbvsiTx+fQ0k4NreJj930zhSeD29oFJ8OG+islTVkYQ+q+9HE+WnSG5/SpB4BPciQDI5avno
	T2ykM2fvdSsx+q2XOyFh7C2F4Vr3sdCoySgAzxurbT75lI3OTt5b/Hk5fkiMXi6Ny8y0KowFPXb8k
	JiMitu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnzC-00000004QfO-18AQ;
	Thu, 08 Oct 2026 13:16:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnz9-00000004Qdv-1KKA
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 13:16:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698CXLe42763173
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 13:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5Iqq+539NbNLhX/V3buU/n4i1mDEyjrAaiCEdRrr0s=; b=TCkJRFhILIiqEHtp
	X3EsA4PsPTImskFHNi0WBJgPZbrT40UY/nQ0BH2FTM1d32gDFgQNOS526gTxwuc9
	gwoyAy93SGE5Tqj2eNmAk5dHRMWOv0u89axtwHouipkA1oRv4e3czz1weA91UUnm
	bu+EAYSM2OO63fuThK6dXE4tnGPWRDECAKXKa9prdT8ptZAAfVvMXaS7X+f7EooV
	O4wmbg9ysSRVk60FDNq/0YDS8LiLUMkjqmp1sZHc3aXxxvgwxy4lMtnKtkgrnUP7
	8wUsVIlSWLBO4n3O19KWqSyBgv4XSMFHtaoFN9MQ3fDCJcmdX2U3khE6Y2tdDyAP
	NFS3wg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kg581-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 13:16:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e0a8f73addso5013397e0c.3
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 06:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465394; x=1792070194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5Iqq+539NbNLhX/V3buU/n4i1mDEyjrAaiCEdRrr0s=;
        b=VQvRvyoqZyfXArhGZ6YpJerjjKbOxjkJcuvHDun6J4x+mROoTZQ9lKYQt29JxOodM/
         GT2bxcoq7iiSy3Td3TUgODC6X//t6WduuN9VC/OSRKh52uQGsPL+9nhF4trfXge2dULQ
         EwQ6o78wUO9W5zZLLG2u+B5iGiKqTynpwtzhZNqjnx3siVasg5SzoYRLvDpZSl2qHReP
         HeoeGFEmNYVSXl90VTsfy3qlbramVSKvcXDEHvezPMQ/qoyjOVHBESKQp0zIYY2JNz5B
         MkZooO7GZmxe1LawtqbWBk1xaMCTvEiao/yA+X8arIkkBjAhydnl9TTGvuA2Xvm+S+HS
         lPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465394; x=1792070194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5Iqq+539NbNLhX/V3buU/n4i1mDEyjrAaiCEdRrr0s=;
        b=k7JuxgRhcKTx5pPURz+FpbB+twU/zS0xQGp/2kpVVloi3WqzxhX4BEA9tDrdqrnXzy
         srV6Kg9rJ2Wi88PWSCmh3zoCshw/9VOtY8blzJK6aWjKs0NGD4uHEXG6dRqUAHbWJEpB
         +k2uE3gtmoPKb+Q+rDpjXbzvb33vGuw/8dUbkdH8oNpIt6v3ff4h9flP2uTmMlA+1kk/
         XUKeSekgd21mi8/Z3V3OQSP4dcztIxR2WchZqLnuWVKp4nv0Vq8ptIvoZAC/fcPRTluC
         Q4w6WplPHEQhtzaSEfLVvQZUQnycADGRtiy1A1hubgYWRPqf4t0ulWJWSB8QhQ3E3yYC
         5WSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEChZdx9jWyaJnIvSh7JvLBT4SV7y/IgJ3tQBIcdTcDhUlJwZfeWt2aPx+sv80h8fvwV/ZZ3M=@lists.infradead.org
X-Gm-Message-State: AFq9FYLlbIgnX9rfv9AWYpH0+G216pX6Ia0Qx09t7MCCfGUQo/eBc/ZY
	SdjagfUl/M/nGQWhq19OIn9hptFq9DaxfeewqUdoEbiK+gCn2WkQfula9wY8/sQEaK/ThtfS7i1
	LNrya+rnTMd026VzGGnsbGCrxO6+X2ldaadVzQvIyRlWUomw+QAooQFPInq2a8KOb
X-Gm-Gg: AYBFou3HK2ciY9aoGUb7qygLA+FcbWh+gWqUDzJv1PsQe3IpldakJduQ0Q05kfBnlPN
	1mdRQnzGW0xaj0uXDtXEmz5VZkXNsdxd+vXBvPoQQOg2tSuoJ5AkcvLCDcHQV8+QIroVitOxmTX
	4AxDduQkMWywKLiEeWGMTBQsJ+KaD2wimHHv/r3ZpMQUhbSdb+jk2vlTTwR/NvpqTH9GW4z05Cr
	52K1iHiK59BOC255kvvESh7ENfnYOycfmkclwy5qyeWemrzwnzG5r9drA0k5FeZeeL3fwjf3pzm
	o15F2kqzm+83St1uWC2MC38b5S7pSQnkfCORgQvxoLG3YjFFgVGvUyhbD9X8ZmqP4RFDjc9BBrq
	/VivxJaCzg8jePA==
X-Received: by 2002:a05:6122:ca6:b0:5d6:36d0:d212 with SMTP id 71dfb90a1353d-5e6d0064f31mr2295141e0c.3.1791465392768;
        Thu, 08 Oct 2026 06:16:32 -0700 (PDT)
X-Received: by 2002:a05:6122:ca6:b0:5d6:36d0:d212 with SMTP id 71dfb90a1353d-5e6d0064f31mr2295107e0c.3.1791465392122;
        Thu, 08 Oct 2026 06:16:32 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b60fsm11414674f8f.8.2026.10.08.06.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:16:29 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:16:00 +0200
Subject: [PATCH 3/3] wifi: ath12k: rely on page_pool APIs for buffer
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-ath12k-pp-v1-3-68f888cd7eec@oss.qualcomm.com>
References: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
In-Reply-To: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: BmySQnCZI8TOsP5sRSm26a4y1G0KuUEy
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac797b2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5xX5sZLfjk1LizbPsLcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXyNa3cdCU6AFU
 0lXWRLjtvSQzL0zZpMp0vcFaTC8kpq78v7Ghonu17bBNfHTeOiQ/LzVTRnreaGQQV+oV4thSIKm
 5QZcf8wrqXF0VrZQByeVCE/ccqi6bIM=
X-Proofpoint-GUID: BmySQnCZI8TOsP5sRSm26a4y1G0KuUEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX3mCeWr2Xv26o
 bqiOoTqxKbKamIvl/Vfqj8ACuuzi/+dRUThctpQPVYJtyEL/mHh7nikII3fhQtvZITZFmBCxYln
 joNZiQJSJcSHasQrxlfoFac9zhOlPQorEF5c0qnlwGDfCUzvCSLvE9816a99o+Ckc0VF5yXxDYN
 osk4Zt3VhK2ZI80tjWkMzvOHAg9jaNcP/NJBDj0D69xDBwWN1qOrZyl+SkGMXXA8bZS42cHcUbN
 P5Z96ltFWw/4YI9+6heh1+e1eT1m6eUcQHRi/YKmU49OcAD0doBTlVukf7jpMQ1U4bfxUtBjdxs
 nr1ZWWL2w8TY8aATQJSMxY3O66P3E51HUEPj78IuMFdTFqFvssixe/fTBe54lFC+miri7OhnyRy
 OijaFmtUkgF57sDz3IMLJbe1xeRy7ZN1uVCGu2Hojs2wbFBxUgk6mAxZm+U+CqGIYbNg/6r2DRC
 WcOlpa3k4Dmkpl20aPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_061635_486804_B37736BF 
X-CRM114-Status: GOOD (  23.13  )
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

Convert the Rx refill buffers to the page_pool API instead of allocating
an skb with dev_alloc_skb() and mapping it with dma_map_single(). The pool
handles the DMA mapping and buffer recycling.

Add a page_pool to struct dp_rxdma_ring, created in
ath12k_dp_rxdma_ring_buf_setup() and destroyed in
ath12k_dp_rxdma_ring_buf_cleanup().

Update ath12k_dp_unmap_rx_buf() to sync page_pool buffers for the CPU
instead of unmapping them, and guard the teardown paths
(ath12k_dp_cc_cleanup(), ath12k_dp_h_msdu_buffer_type()) against
page_pool buffers. In the re-inject path, sync an already mapped
page_pool buffer for the device instead of mapping it again, and fill the
descriptor with the DMA address stored in the rxcb.

The monitor, CE and TX paths are left unchanged.

This is just preliminary support: the goal is to use a single page to map
two separated fragments of 2048B.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Kconfig       |   1 +
 drivers/net/wireless/ath/ath12k/dp.h          |   1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 101 ++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  32 ++++++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  34 ++++++---
 5 files changed, 121 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index 0d5d1c55bfc1..13985daffaee 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -7,6 +7,7 @@ config ATH12K
 	select QRTR
 	select QRTR_MHI
 	select PCI_PWRCTRL_PWRSEQ if HAVE_PWRCTRL
+	select PAGE_POOL
 	help
 	  Enable support for Qualcomm Technologies Wi-Fi 7 (IEEE
 	  802.11be) family of chipsets, for example WCN7850 and
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index c53eac20b989..599ce3c45c7a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -59,6 +59,7 @@ struct dp_rxdma_mon_ring {
 
 struct dp_rxdma_ring {
 	struct dp_srng refill_buf_ring;
+	struct page_pool *page_pool;
 	int bufs_max;
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index cfaf26ae2720..de9ea84323df 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -68,6 +68,31 @@ static void ath12k_dp_rx_enqueue_free(struct ath12k_dp *dp,
 	spin_unlock_bh(&dp->rx_desc_lock);
 }
 
+static struct sk_buff *ath12k_dp_rx_build_skb(struct ath12k_dp *dp,
+					      struct dp_rxdma_ring *rx_ring)
+{
+	struct sk_buff *skb;
+	struct page *page;
+
+	if (!rx_ring->page_pool)
+		return NULL;
+
+	page = page_pool_dev_alloc_pages(rx_ring->page_pool);
+	if (!page)
+		return NULL;
+
+	skb = build_skb(page_address(page), PAGE_SIZE);
+	if (!skb) {
+		page_pool_put_full_page(rx_ring->page_pool, page, false);
+		return NULL;
+	}
+
+	ATH12K_SKB_RXCB(skb)->paddr = page_pool_get_dma_addr(page);
+	skb_mark_for_recycle(skb);
+
+	return skb;
+}
+
 /* Returns number of Rx buffers replenished */
 int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
 				struct dp_rxdma_ring *rx_ring,
@@ -81,7 +106,6 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
 	int num_free;
 	int num_remain;
 	u32 cookie;
-	dma_addr_t paddr;
 	struct ath12k_rx_desc_info *rx_desc;
 	enum hal_rx_buf_return_buf_manager mgr = dp->hal->hal_params->rx_buf_rbm;
 
@@ -114,51 +138,33 @@ int ath12k_dp_rx_bufs_replenish(struct ath12k_dp *dp,
 	}
 
 	while (num_remain > 0) {
-		skb = dev_alloc_skb(DP_RX_BUFFER_SIZE +
-				    DP_RX_BUFFER_ALIGN_SIZE);
+		skb = ath12k_dp_rx_build_skb(dp, rx_ring);
 		if (!skb)
 			break;
 
-		if (!IS_ALIGNED((unsigned long)skb->data,
-				DP_RX_BUFFER_ALIGN_SIZE)) {
-			skb_pull(skb,
-				 PTR_ALIGN(skb->data, DP_RX_BUFFER_ALIGN_SIZE) -
-				 skb->data);
-		}
-
-		paddr = dma_map_single(dp->dev, skb->data,
-				       skb->len + skb_tailroom(skb),
-				       DMA_FROM_DEVICE);
-		if (dma_mapping_error(dp->dev, paddr))
-			goto fail_free_skb;
-
 		rx_desc = list_first_entry_or_null(used_list,
 						   struct ath12k_rx_desc_info,
 						   list);
 		if (!rx_desc)
-			goto fail_dma_unmap;
-
-		rx_desc->skb = skb;
-		cookie = rx_desc->cookie;
+			goto fail_free_skb;
 
 		desc = ath12k_hal_srng_src_get_next_entry(ab, srng);
 		if (!desc)
-			goto fail_dma_unmap;
+			goto fail_free_skb;
 
-		list_del(&rx_desc->list);
-		ATH12K_SKB_RXCB(skb)->paddr = paddr;
+		rx_desc->skb = skb;
+		cookie = rx_desc->cookie;
 
+		list_del(&rx_desc->list);
 		num_remain--;
 
-		ath12k_hal_rx_buf_addr_info_set(dp->hal, desc, paddr, cookie,
-						mgr);
+		ath12k_hal_rx_buf_addr_info_set(dp->hal, desc,
+						ATH12K_SKB_RXCB(skb)->paddr,
+						cookie, mgr);
 	}
 
 	goto out;
 
-fail_dma_unmap:
-	dma_unmap_single(dp->dev, paddr, skb->len + skb_tailroom(skb),
-			 DMA_FROM_DEVICE);
 fail_free_skb:
 	dev_kfree_skb_any(skb);
 out:
@@ -196,12 +202,21 @@ static int ath12k_dp_rxdma_mon_buf_ring_free(struct ath12k_base *ab,
 	return 0;
 }
 
+static void ath12k_dp_rxdma_ring_buf_cleanup(struct dp_rxdma_ring *rx_ring)
+{
+	if (rx_ring->page_pool) {
+		page_pool_destroy(rx_ring->page_pool);
+		rx_ring->page_pool = NULL;
+	}
+}
+
 static int ath12k_dp_rxdma_buf_free(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	int i;
 
 	ath12k_dp_rxdma_mon_buf_ring_free(ab, &dp->rxdma_mon_buf_ring);
+	ath12k_dp_rxdma_ring_buf_cleanup(&dp->rx_refill_buf_ring);
 
 	if (ab->hw_params->rxdma1_enable)
 		return 0;
@@ -236,11 +251,28 @@ static int ath12k_dp_rxdma_mon_ring_buf_setup(struct ath12k_base *ab,
 static int ath12k_dp_rxdma_ring_buf_setup(struct ath12k_base *ab,
 					  struct dp_rxdma_ring *rx_ring)
 {
+	struct page_pool_params pp_params = {
+		.order = 0,
+		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
+		.nid = NUMA_NO_NODE,
+		.dma_dir = DMA_BIDIRECTIONAL,
+		.max_len = PAGE_SIZE,
+		.dev = ab->dev,
+		.offset = 0,
+	};
 	LIST_HEAD(list);
 
 	rx_ring->bufs_max = rx_ring->refill_buf_ring.size /
 			ath12k_hal_srng_get_entrysize(ab, HAL_RXDMA_BUF);
 
+	rx_ring->page_pool = page_pool_create(&pp_params);
+	if (IS_ERR(rx_ring->page_pool)) {
+		int err = PTR_ERR(rx_ring->page_pool);
+
+		rx_ring->page_pool = NULL;
+		return err;
+	}
+
 	ath12k_dp_rx_bufs_replenish(ath12k_ab_to_dp(ab), rx_ring, &list, 0);
 
 	return 0;
@@ -263,10 +295,13 @@ static int ath12k_dp_rxdma_buf_setup(struct ath12k_base *ab)
 		ret = ath12k_dp_rxdma_mon_ring_buf_setup(ab,
 							 &dp->rxdma_mon_buf_ring,
 							 HAL_RXDMA_MONITOR_BUF);
-		if (ret)
+		if (ret) {
 			ath12k_warn(ab,
 				    "failed to setup HAL_RXDMA_MONITOR_BUF\n");
-		return ret;
+			goto error;
+		}
+
+		return 0;
 	}
 
 	for (i = 0; i < ab->hw_params->num_rxdma_per_pdev; i++) {
@@ -276,11 +311,15 @@ static int ath12k_dp_rxdma_buf_setup(struct ath12k_base *ab)
 		if (ret) {
 			ath12k_warn(ab,
 				    "failed to setup HAL_RXDMA_MONITOR_STATUS\n");
-			return ret;
+			goto error;
 		}
 	}
 
 	return 0;
+error:
+	ath12k_dp_rxdma_ring_buf_cleanup(&dp->rx_refill_buf_ring);
+
+	return ret;
 }
 
 static void ath12k_dp_rx_pdev_srng_free(struct ath12k *ar)
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index c3715c99054f..a1113f8b7399 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -6,6 +6,7 @@
 #ifndef ATH12K_DP_RX_H
 #define ATH12K_DP_RX_H
 
+#include <net/page_pool/helpers.h>
 #include "core.h"
 #include "debug.h"
 
@@ -187,15 +188,32 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
 	hal->ops->extract_rx_desc_data(rx_info, rx_desc, ldesc);
 }
 
-static inline void ath12k_dp_unmap_rx_buf(struct ath12k_dp *dp,
-					  struct sk_buff *skb)
+static inline bool ath12k_skb_from_page_pool(struct sk_buff *skb)
 {
-	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(skb);
-	enum dma_data_direction dir;
+	if (!skb->head_frag || !skb->pp_recycle)
+		return false;
 
-	dir = rxcb->reinjected ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
-	dma_unmap_single(dp->dev, rxcb->paddr, skb->len + skb_tailroom(skb),
-			 dir);
+	return page_pool_page_is_pp(virt_to_head_page(skb->head));
+}
+
+static inline void ath12k_dp_unmap_rx_buf(struct ath12k_dp *dp, struct sk_buff *skb)
+{
+	if (likely(ath12k_skb_from_page_pool(skb))) {
+		struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
+		struct page *page = virt_to_head_page(skb->data);
+		int offset = (void *)skb->data - page_address(page);
+
+		page_pool_dma_sync_for_cpu(rx_ring->page_pool, page,
+					   offset,
+					   skb->len + skb_tailroom(skb));
+	} else {
+		struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(skb);
+		enum dma_data_direction dir;
+
+		dir = rxcb->reinjected ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
+		dma_unmap_single(dp->dev, rxcb->paddr,
+				 skb->len + skb_tailroom(skb), dir);
+	}
 }
 
 void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 9cd9c0bb07db..d1703c736d49 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -902,14 +902,26 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	/* change msdu len in hal rx desc */
 	ath12k_dp_rxdesc_set_msdu_len(hal, rx_desc, defrag_skb->len - hal_rx_desc_sz);
 
-	buf_paddr = dma_map_single(dp->dev, defrag_skb->data,
-				   defrag_skb->len + skb_tailroom(defrag_skb),
-				   DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dp->dev, buf_paddr))
-		return -ENOMEM;
+	if (ath12k_skb_from_page_pool(defrag_skb)) {
+		struct dp_rxdma_ring *rx_ring;
+
+		rx_ring = &dp->rx_refill_buf_ring;
+		dma_sync_single_for_device(dp->dev,
+					   ATH12K_SKB_RXCB(defrag_skb)->paddr,
+					   defrag_skb->len +
+					   skb_tailroom(defrag_skb),
+					   rx_ring->page_pool->p.dma_dir);
+	} else {
+		buf_paddr = dma_map_single(dp->dev, defrag_skb->data,
+					   defrag_skb->len +
+					   skb_tailroom(defrag_skb),
+					   DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(dp->dev, buf_paddr))
+			return -ENOMEM;
 
+		rxcb->paddr = buf_paddr;
+	}
 	rxcb->reinjected = true;
-	rxcb->paddr = buf_paddr;
 
 	spin_lock_bh(&dp->rx_desc_lock);
 	desc_info = list_first_entry_or_null(&dp->rx_desc_free_list,
@@ -928,8 +940,8 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	list_del(&desc_info->list);
 	spin_unlock_bh(&dp->rx_desc_lock);
 
-	ath12k_wifi7_hal_rx_buf_addr_info_set(&msdu0->buf_addr_info, buf_paddr,
-					      desc_info->cookie,
+	ath12k_wifi7_hal_rx_buf_addr_info_set(&msdu0->buf_addr_info,
+					      rxcb->paddr, desc_info->cookie,
 					      HAL_RX_BUF_RBM_SW3_BM);
 
 	/* Fill mpdu details into reo entrance ring */
@@ -994,8 +1006,10 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	list_add_tail(&desc_info->list, &dp->rx_desc_free_list);
 	spin_unlock_bh(&dp->rx_desc_lock);
 err_unmap_dma:
-	dma_unmap_single(dp->dev, buf_paddr, defrag_skb->len + skb_tailroom(defrag_skb),
-			 DMA_BIDIRECTIONAL);
+	if (!ath12k_skb_from_page_pool(defrag_skb))
+		dma_unmap_single(dp->dev, ATH12K_SKB_RXCB(defrag_skb)->paddr,
+				 defrag_skb->len + skb_tailroom(defrag_skb),
+				 DMA_BIDIRECTIONAL);
 	return ret;
 }
 

-- 
2.56.0


