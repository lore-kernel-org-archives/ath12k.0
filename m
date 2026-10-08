Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951E4CA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rR04Wx2mH8a29cfVx5n0UxzburOUkMVF+wdpj3Q5H8E=; b=zLntUd0pnrT27yJJ+ieeMHL8zi
	+LcbPvkGe3Bq+7h5EhTHsYuNBGrSxtBYNyLme9ZXzA8a3MUT/EZ/Ax8aXIudTCTeHueVEG+bfg57r
	9cTTLbOBE5iS+C8KPQLW5LpzOiuVcAHpmXKirvOslYe6ux8Ez5+w84oAZrxeYcoEV3js6NubICmT3
	N4Ku3FLiHH7Et5csOrjArX6nMOAPwKQrzyw7Pkfx/Yo2IwS5Pgr7utw79FYdMYszIfLm7a+fHqvEM
	i0wWX9pwNRBGw68AyZYPvByplVNqHCvo+71rHOiHOzl8GQEC8YOCtw8nVeQnTi618mP6XdkK0BmRJ
	uDUtYqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnz7-00000004QdZ-0j5A;
	Thu, 08 Oct 2026 13:16:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnz4-00000004Qbi-17Zv
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 13:16:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK4A62704965
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 13:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rR04Wx2mH8a29cfVx5n0UxzburOUkMVF+wdpj3Q5H8E=; b=dLeJT7rdIe5V/eIC
	mPIvCYv6h44HzZBr5BMfwMJl9lvzaUoP3F1JK1nhoSamF/mNF5vru1JxLX4PWwB0
	4w2FTDAVeclIXmJyt7lxfRAzl3z797BDcD8+b938MDK8olms6ZbZvS0ovgWe5u2c
	vgU3lqknXPXjkczpGESj1Q3pxmqu4uBAWNcq1frx3oHvODMeYQhB8JDRT07gJTLz
	dVxUkSjnukXxBHvtqvOZdnN/Om1T/Qc74uCaDSOwhHOM4dcH+i9hw34Ut9l94BrX
	EVot9OCkXcHj/U6+nuLtYi05NNrKct91epoAnZ8m13gv6pcZoKo8Ns+muo1oIwsU
	XmcxAA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2u4da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 13:16:29 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ce86cc29c6so1131798e0c.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465389; x=1792070189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rR04Wx2mH8a29cfVx5n0UxzburOUkMVF+wdpj3Q5H8E=;
        b=XXMMZtVoN8wMBz2q12Bvy+hE+wibt4ezULMRGOXOqChiO4cPtQjGH88IV5fpctgA2M
         /azmoUYr+wZfZMOAuUUjKZYfg9KPIyRD9soK9trmZLSRO/NT/fpSpgeizyNP0kvjb60m
         YjWKmsGrBwgO17GZQaBIvjaLL4YoCGdXZ81g7Qf4dfYp8EPiYODz77Y25e4185ljxDRF
         9hbs2/EBBLyhO3U/51PDfFN3JlGlNU+zMCu6ZgsKiazHiPiummejyOgtHm6Z1Ii27oeU
         Um7Wbi9Vq2Ns77tFxa/CEpslrBQrn92w5QvNfJMVNLCwntQdqhlSNL8VtnCrgsk3OSi9
         8tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465389; x=1792070189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rR04Wx2mH8a29cfVx5n0UxzburOUkMVF+wdpj3Q5H8E=;
        b=kGWOJh3N99JPDYcQPrrr+7r4+2MuFGrHg840WAB4+026tbr/FocjcWvkqgHpuXMhI4
         C2c5XidSD9aECxo7ywPDfRifhE9kCBQomGGYoF/LLGOL+QSRgCzUF4KWFq2uhhpB4x/d
         pNfb6IBy/Ii/gP1I0GGXRsVDTOrNc4EWtsUJFc4ykpQGUjR3yTWXoI47D1yKGsPcvJGg
         LhXMLAeyFg+28ZCT24zDnnkwYKxH3NhvpKSH+YrJ34N2tUs/fgGB5TznF1fS9bsr4/o2
         Zie1t/DTuyQwNwegKTAzC4UJBHeZ0Ywx17ux+gw17fhRWKA+4Fr/IBb6Kx+btO1zo9wT
         YZRw==
X-Forwarded-Encrypted: i=1; AKwUvBwP2paBSKOowBdsYk/er4pt3SBAng0lBmAtwbSH3DmjEpQGl7OjerXRtm6zg/1RmEoihiMyaHE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKsjOJK6JR4fPDJ+uzR4NBKisHadtWkmhuwoWE6SgNtBzMerduv
	JulINNqQkBtFsiIsIaf9MftMG9a5RJSf4ES/FjZDCyzzFzJYrddP+3JKDRKYEt3y7tvNLVyCW8m
	zJJGhjcUg7zfarEyvmU0w+t+ubkhmm/5zqkhHSXJ4dVspDVoj4lb5rUzGpP5fEKEy
X-Gm-Gg: AYBFou1gyq+hwo+uuDEVCOw9N+AOTKB/e4PrzkS17zDets3TPt/D36HpLFdTu1kPDQF
	Eh0TVea8eo2qWUrgQSHODZqFZPhDR6NZ3AY00BPyss9/qOGwp+UcZePppBnpin+CjW2iFpfGvSu
	zPWNuPsXdqBqOeWcFGMRAYN38jecNQFzkZ0Zk/5f+NrhFWGNVbigCUAHYZeMOTGLiBRdbaimlTN
	x1ATvdb31P38m2YLRFMTBZ2/QDpamReAyD1mhKR1SPkfkyNWMaTVm4zTZrAPLKXlIx/qnKbosTL
	vC4CWJxjEqEtDf9VGATL++M1vwdtCAkDhWchU9YcgJsEtHUc9bfoGzdrKjc5eXsaoX0QCQ0BQhE
	rG4hw/pMpctaMBA==
X-Received: by 2002:a05:6122:310c:b0:5d9:82c1:b343 with SMTP id 71dfb90a1353d-5e6cf587159mr2167927e0c.1.1791465388356;
        Thu, 08 Oct 2026 06:16:28 -0700 (PDT)
X-Received: by 2002:a05:6122:310c:b0:5d9:82c1:b343 with SMTP id 71dfb90a1353d-5e6cf587159mr2167884e0c.1.1791465387744;
        Thu, 08 Oct 2026 06:16:27 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2eeb6sm11580902f8f.43.2026.10.08.06.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:16:26 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:15:59 +0200
Subject: [PATCH 2/3] wifi: ath12k: fix DMA direction for re-injected Rx
 buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-ath12k-pp-v1-2-68f888cd7eec@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac797ad cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uUysdbmPE_KshqraYcwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: _KSjqjXWtm3fwZE9Bpv3YfPf4T1TngSU
X-Proofpoint-ORIG-GUID: _KSjqjXWtm3fwZE9Bpv3YfPf4T1TngSU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX6IYpVGC1pHDt
 k3s16Qg8iMaUOXISrtbqnbzneV+Q28hqAgvnw5R4ZewfzH+utTYG/I7x6PXK8dskrheFmaq3rbP
 b6k7aqqWFdklAhYSyc9YzmiSxYnhLtw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX8efLz7jdsBUT
 AclVjlCiDc9T055nynkIEBt6x7skZId5R3JqU3L/hCj5FeTko4OOE4kYNB/oj1z02PgROuyzLbU
 DLUF1w0bcWduP/jn6ceuSyunE+c5EVDn1yblgB1r+Nipe/fOv2iQXbMM5cfZZzFFWmho9+nHW2P
 Vv04DMr+ot75d+IVvqi1fVv56asghOHwPjy5F4WisEBLpGMbM4Uw1hkaQz8PNE5sKXttmo2pG+V
 w0jaILmWT/ZpZaeVVmBu+Hy/XukERaReggmIBIgXDjw/FTrHy1VeoGadgDeoz87eifRWK4FF2oL
 BTTdyH8v06c4bwHja75dogsO1IC6Ua/v7BvcxtjsCa75VmUOBAoqszzxk3ugPBnU4WHJko0Wkai
 4hE3wktdwfbBDqZAv90g1Iyh5Hzu8aVBwW0+uQ7z0R6tSfwN8JxsmSQiZG0UKMswwd3UesKArb3
 0i8ikK/DAwP4o3CzeDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_061630_433186_EB608E25 
X-CRM114-Status: GOOD (  18.54  )
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

Defragmented MPDUs that are re-injected into the REO are mapped with
DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
map direction, so this violates the contract.

The mapping actually spans both directions, since the host has written
the buffer before the REO reads it and the buffer is read back by the
host afterwards, so DMA_BIDIRECTIONAL is the correct choice.

Add a 'reinjected' flag to struct ath12k_skb_rxcb and a common
ath12k_dp_unmap_rx_buf() helper that selects DMA_BIDIRECTIONAL for
re-injected buffers and DMA_FROM_DEVICE otherwise, then use it in all the
Rx reap and cleanup paths. Map and unmap the re-injected buffer with
DMA_BIDIRECTIONAL consistently.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping reinjected packets")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/dp.c           |  5 +---
 drivers/net/wireless/ath/ath12k/dp_rx.h        | 11 ++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c |  5 +---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  | 37 +++++++++-----------------
 5 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 99d71dab7c04..7a219249dc51 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -149,6 +149,7 @@ struct ath12k_skb_rxcb {
 	u8 tid;
 	u16 peer_id;
 	bool is_end_of_ppdu;
+	bool reinjected;
 };
 
 enum ath12k_hw_rev {
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..dd3b0dcfa055 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1003,10 +1003,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 					continue;
 
 				if (!ATH12K_SKB_RXCB(skb)->unmapped)
-					dma_unmap_single(ab->dev,
-							 ATH12K_SKB_RXCB(skb)->paddr,
-							 skb->len + skb_tailroom(skb),
-							 DMA_FROM_DEVICE);
+					ath12k_dp_unmap_rx_buf(dp, skb);
 				dev_kfree_skb_any(skb);
 			}
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 82700474548a..c3715c99054f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -187,6 +187,17 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
 	hal->ops->extract_rx_desc_data(rx_info, rx_desc, ldesc);
 }
 
+static inline void ath12k_dp_unmap_rx_buf(struct ath12k_dp *dp,
+					  struct sk_buff *skb)
+{
+	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(skb);
+	enum dma_data_direction dir;
+
+	dir = rxcb->reinjected ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
+	dma_unmap_single(dp->dev, rxcb->paddr, skb->len + skb_tailroom(skb),
+			 dir);
+}
+
 void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
 			    enum hal_encrypt_type enctype,
 			    bool decrypted,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 1e29c13ad66d..e7d5dfa31361 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -2722,10 +2722,7 @@ ath12k_wifi7_dp_rx_mon_mpdu_pop(struct ath12k *ar, int mac_id,
 				drop_mpdu = true;
 			}
 			if (!rxcb->unmapped) {
-				dma_unmap_single(ar->ab->dev, rxcb->paddr,
-						 msdu->len +
-						 skb_tailroom(msdu),
-						 DMA_FROM_DEVICE);
+				ath12k_dp_unmap_rx_buf(dp, msdu);
 				rxcb->unmapped = 1;
 			}
 			if (drop_mpdu) {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 633cb91b9e5d..9cd9c0bb07db 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -741,11 +741,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 
 		list_add_tail(&desc_info->list, &rx_desc_used_list[device_id]);
 
-		rxcb = ATH12K_SKB_RXCB(msdu);
-		dma_unmap_single(partner_dp->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
-
+		ath12k_dp_unmap_rx_buf(partner_dp, msdu);
 		num_buffs_reaped[device_id]++;
 		dp->device_stats.reo_rx[ring_id][dp->device_id]++;
 
@@ -761,6 +757,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 		msdu_info = &desc->rx_msdu_info;
 		mpdu_info = &desc->rx_mpdu_info;
 
+		rxcb = ATH12K_SKB_RXCB(msdu);
 		rxcb->is_first_msdu = !!(le32_to_cpu(msdu_info->info0) &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
 		rxcb->is_last_msdu = !!(le32_to_cpu(msdu_info->info0) &
@@ -858,6 +855,7 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 						    struct ath12k_dp_rx_tid *rx_tid,
 						    struct sk_buff *defrag_skb)
 {
+	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(defrag_skb);
 	struct ath12k_base *ab = dp->ab;
 	struct ath12k_hal *hal = dp->hal;
 	struct hal_rx_desc *rx_desc = (struct hal_rx_desc *)defrag_skb->data;
@@ -906,10 +904,13 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 
 	buf_paddr = dma_map_single(dp->dev, defrag_skb->data,
 				   defrag_skb->len + skb_tailroom(defrag_skb),
-				   DMA_TO_DEVICE);
+				   DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dp->dev, buf_paddr))
 		return -ENOMEM;
 
+	rxcb->reinjected = true;
+	rxcb->paddr = buf_paddr;
+
 	spin_lock_bh(&dp->rx_desc_lock);
 	desc_info = list_first_entry_or_null(&dp->rx_desc_free_list,
 					     struct ath12k_rx_desc_info,
@@ -927,8 +928,6 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	list_del(&desc_info->list);
 	spin_unlock_bh(&dp->rx_desc_lock);
 
-	ATH12K_SKB_RXCB(defrag_skb)->paddr = buf_paddr;
-
 	ath12k_wifi7_hal_rx_buf_addr_info_set(&msdu0->buf_addr_info, buf_paddr,
 					      desc_info->cookie,
 					      HAL_RX_BUF_RBM_SW3_BM);
@@ -996,7 +995,7 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	spin_unlock_bh(&dp->rx_desc_lock);
 err_unmap_dma:
 	dma_unmap_single(dp->dev, buf_paddr, defrag_skb->len + skb_tailroom(defrag_skb),
-			 DMA_TO_DEVICE);
+			 DMA_BIDIRECTIONAL);
 	return ret;
 }
 
@@ -1298,7 +1297,6 @@ ath12k_wifi7_dp_process_rx_err_buf(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_hal *hal = dp->hal;
 	struct sk_buff *msdu;
-	struct ath12k_skb_rxcb *rxcb;
 	struct hal_rx_desc_data rx_info;
 	struct hal_rx_desc *rx_desc;
 	u16 msdu_len;
@@ -1328,11 +1326,7 @@ ath12k_wifi7_dp_process_rx_err_buf(struct ath12k_pdev_dp *dp_pdev,
 	desc_info->skb = NULL;
 
 	list_add_tail(&desc_info->list, used_list);
-
-	rxcb = ATH12K_SKB_RXCB(msdu);
-	dma_unmap_single(dp->dev, rxcb->paddr,
-			 msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, msdu);
 
 	if (drop) {
 		dev_kfree_skb_any(msdu);
@@ -1379,7 +1373,6 @@ static int ath12k_dp_h_msdu_buffer_type(struct ath12k_dp *dp,
 					struct hal_reo_dest_ring *desc)
 {
 	struct ath12k_rx_desc_info *desc_info;
-	struct ath12k_skb_rxcb *rxcb;
 	struct sk_buff *msdu;
 	u64 desc_va;
 
@@ -1410,9 +1403,7 @@ static int ath12k_dp_h_msdu_buffer_type(struct ath12k_dp *dp,
 	msdu = desc_info->skb;
 	desc_info->skb = NULL;
 	list_add_tail(&desc_info->list, list);
-	rxcb = ATH12K_SKB_RXCB(msdu);
-	dma_unmap_single(dp->dev, rxcb->paddr, msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, msdu);
 	dev_kfree_skb_any(msdu);
 
 	return 0;
@@ -1998,12 +1989,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		list_add_tail(&desc_info->list, &rx_desc_used_list[device_id]);
-
-		rxcb = ATH12K_SKB_RXCB(msdu);
-		dma_unmap_single(partner_dp->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
-
+		ath12k_dp_unmap_rx_buf(partner_dp, msdu);
 		num_buffs_reaped[device_id]++;
 		total_num_buffs_reaped++;
 
@@ -2017,6 +2003,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		msdu_data = (struct hal_rx_desc *)msdu->data;
+		rxcb = ATH12K_SKB_RXCB(msdu);
 		rxcb->err_rel_src = err_info.err_rel_src;
 		rxcb->err_code = err_info.err_code;
 		rxcb->is_first_msdu = err_info.first_msdu;

-- 
2.56.0


