Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0A7C369D3
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xgf1G5WjPEbFk4Se+1OYeE4Uiavm8ExE2GJ/lXR1zVc=; b=i4+1NygzPqAiZHIDgz3zTCOvuX
	I69Rq3df5j+P+PnkwVuT0WnQhk4IhObBtgrpbFLyajOH7XS0G5hTGrmAbmGD+ofFJwNBZYeITG7fb
	2+Akc5WuTLFjEP5aw5af3OQ2KkiqVDLn9b1yxRGdq0QsJ/ItI9qEiYCZkM5uxpZ/9y3V9rCWnqgqs
	svUdwy0hyiTZQyRQFgRzxFhLpDci6HGgOQyt5G3/4whHeylnMS10gR9Auyc6gun7Z4WRLeNuhmpw6
	OjlzKRJBPH7WLufL2A2k7+hAwOFgdLwKTelnzz4E8s65d8VoHXzxckKTatS0js1BYsCb/SAJtLvX3
	RFnljgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0U-00000003S9V-1dWd;
	Mon, 21 Apr 2025 02:35:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0R-00000003S6U-11yY
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L0F6ko029835
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xgf1G5WjPEb
	Fk4Se+1OYeE4Uiavm8ExE2GJ/lXR1zVc=; b=fQDD/T+gFNNozAmnxvCofRIEL6X
	YVmhLAeuq/hP3y3v/zUr7I0qMOjPrI4+N9bOL1Sr63jeks4UFViDnrnz6qrAiY5h
	/uZgdjpmALx9b0LiN0PXOlzZLPQ1cuiqPD1+cpf79XAZ7SGFvAc0zvRWhHvdzfun
	pbq7r71N4bS9NIDjreFCjyDlrnufFJpRhuunTy5HRYAuy1UrrVDdzW9TUMcsCLtN
	1qkwQudfESlp/ZLUQtYx23Cm3bSr2fJBL6xT4hlbKfBqSYYAr4Puo2CSVISoN9hb
	eU+CaM+ACfDGWWGCIwVliYSxNSRGbI2Lgk+Txbs1MECsOc+YtpDm905SByg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svau2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22403329f9eso27619775ad.3
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202931; x=1745807731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xgf1G5WjPEbFk4Se+1OYeE4Uiavm8ExE2GJ/lXR1zVc=;
        b=Oced/wz0Fg7J0SE3V3Q/M/fm8QG4uCLRbL/GYJJ1cEstRRYVMu1v6rysS4a1Vw99K1
         4evgSo4w8BPQxGgoWS8XNn9SFOf0U+/BAve4EGnUo5lET3hOInByiQ9GNERKQ1df5rA4
         KbtgaS+OyQZUyW4QkDTpwsH/h4uQIT4o+1g8PPUOHtnoC/QVspD/tjY2wPN+UtXpuWyO
         JuW+XuMWa0LI3XCPGV04h+0OrgXQpt5oJH8xCYEtM9x7tePtbfnWea7ehUHG+NFg4Aqm
         SLtpzUCgu77gmokr1hRgzeH1Zp3HGmkzswqlnqDSRnFgTvCLQUYFxHE2xwfjbIEgF3ER
         3ClA==
X-Gm-Message-State: AOJu0YzPqREIdGm5ZHDfPcLMT3zsy5kc3SPwjL+b670E+11wEHhhG+GY
	Uwo29C1Xu/bEb2jfga1l4DLcbnWW03MKYzIHQyjF4JkVFVh0rnzzzSO6TVyhBeiQS5Hk9EcuhM1
	JwSQy2ZByEzDyZ1GYWuON0JO5TeIP31ywW/82jriD2uEgxrw6eCBMN7A8EwufDZuekpd71S4=
X-Gm-Gg: ASbGnctNC1CgDfl2n7f6TX8L+O5P7lRMAbnlf5kMZT+WMHifJgy8jFh4taotdunRBkN
	rKKMxwfRy5M9WT72Zs0XoIZdvxI0qJKWS8gds0SBndQDX9CHW+J/91zhMdA+OiZqg9GbdzC6bFf
	O7YKlmwAtlWQ6m+5dydGLltGdwKCNlXA7Hu0JS78ysWp/EgK0AIb0/8gXVP05Dapavb6CnT1DHV
	TSwf6h9+2AxAHjapfEpDuJhTiLtz1/ZycVaQZG6ZkWqBnNDkVacf9YqUzzgt5UcJ82SOdmhvZdk
	qfQrIbYSgyHPpJYlVxbeTCKKrYQ9wyS+7aSzrdUZGsvrzGRp0ljFCanV0ZZS0DIMYDwe88ew6fu
	adfm4lg5Myto=
X-Received: by 2002:a17:903:1a04:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-22c53601471mr179204945ad.32.1745202930654;
        Sun, 20 Apr 2025 19:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBf5VpLi0PI3fvFJZZkigJjzldOCRa1zgxU39hPhrkHjfrbcO5Q+PLMMRzl0HMpfpOBPGudQ==
X-Received: by 2002:a17:903:1a04:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-22c53601471mr179204585ad.32.1745202930179;
        Sun, 20 Apr 2025 19:35:30 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:29 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 07/13] wifi: ath12k: add support to reap and process monitor status ring
Date: Mon, 21 Apr 2025 10:34:38 +0800
Message-Id: <20250421023444.1778-8-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZwK3cy65IPtyEhMHcycMl50eTm1p9lKL
X-Proofpoint-ORIG-GUID: ZwK3cy65IPtyEhMHcycMl50eTm1p9lKL
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6805aef6 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Vib0JM9PE31_SV9fxGUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193535_290498_3BD5A73A 
X-CRM114-Status: GOOD (  22.90  )
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

WCN7850 uses monitor status ring to store status buffer. Status buffer
contains many TLVs such as MPDU START/END. From these TLVs, can get
necessary information about related payload, such as PPDU ID.

Add helper function to reap status buffer from monitor status ring so
that can parse TLVs later by ath12k_dp_mon_parse_rx_dest().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.h     |  12 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 267 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal.c    |  29 +++
 drivers/net/wireless/ath/ath12k/hal.h    |   3 +
 4 files changed, 309 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 0dd2a981516d..b4a2b27cec32 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -70,6 +70,16 @@ struct ath12k_pdev_mon_stats {
 	u32 dest_mpdu_drop;
 	u32 dup_mon_linkdesc_cnt;
 	u32 dup_mon_buf_cnt;
+	u32 dest_mon_stuck;
+	u32 dest_mon_not_reaped;
+};
+
+enum dp_mon_status_buf_state {
+	DP_MON_STATUS_MATCH,
+	DP_MON_STATUS_NO_DMA,
+	DP_MON_STATUS_LAG,
+	DP_MON_STATUS_LEAD,
+	DP_MON_STATUS_REPLINISH,
 };
 
 struct dp_link_desc_bank {
@@ -125,6 +135,7 @@ struct ath12k_mon_data {
 	u8 decap_format;
 
 	struct ath12k_pdev_mon_stats rx_mon_stats;
+	enum dp_mon_status_buf_state buf_state;
 	/* lock for monitor data */
 	spinlock_t mon_lock;
 	struct sk_buff_head rx_status_q;
@@ -348,6 +359,7 @@ struct ath12k_link_stats {
 
 struct ath12k_dp {
 	struct ath12k_base *ab;
+	u32 mon_dest_ring_stuck_cnt;
 	u8 num_bank_profiles;
 	/* protects the access and update of bank_profiles */
 	spinlock_t tx_bank_lock;
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 0f7d0d517372..9fd71665d086 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1751,6 +1751,90 @@ ath12k_dp_mon_fill_rx_stats_info(struct ath12k *ar,
 	}
 }
 
+static struct sk_buff
+*ath12k_dp_rx_alloc_mon_status_buf(struct ath12k_base *ab,
+				   struct dp_rxdma_mon_ring *rx_ring,
+				   int *buf_id)
+{
+	struct sk_buff *skb;
+	dma_addr_t paddr;
+
+	skb = dev_alloc_skb(RX_MON_STATUS_BUF_SIZE);
+
+	if (!skb)
+		goto fail_alloc_skb;
+
+	if (!IS_ALIGNED((unsigned long)skb->data,
+			RX_MON_STATUS_BUF_ALIGN)) {
+		skb_pull(skb, PTR_ALIGN(skb->data, RX_MON_STATUS_BUF_ALIGN) -
+			 skb->data);
+	}
+
+	paddr = dma_map_single(ab->dev, skb->data,
+			       skb->len + skb_tailroom(skb),
+			       DMA_FROM_DEVICE);
+	if (unlikely(dma_mapping_error(ab->dev, paddr)))
+		goto fail_free_skb;
+
+	spin_lock_bh(&rx_ring->idr_lock);
+	*buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
+			    rx_ring->bufs_max, GFP_ATOMIC);
+	spin_unlock_bh(&rx_ring->idr_lock);
+	if (*buf_id < 0)
+		goto fail_dma_unmap;
+
+	ATH12K_SKB_RXCB(skb)->paddr = paddr;
+	return skb;
+
+fail_dma_unmap:
+	dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
+			 DMA_FROM_DEVICE);
+fail_free_skb:
+	dev_kfree_skb_any(skb);
+fail_alloc_skb:
+	return NULL;
+}
+
+static enum dp_mon_status_buf_state
+ath12k_dp_rx_mon_buf_done(struct ath12k_base *ab, struct hal_srng *srng,
+			  struct dp_rxdma_mon_ring *rx_ring)
+{
+	struct ath12k_skb_rxcb *rxcb;
+	struct hal_tlv_64_hdr *tlv;
+	struct sk_buff *skb;
+	void *status_desc;
+	dma_addr_t paddr;
+	u32 cookie;
+	int buf_id;
+	u8 rbm;
+
+	status_desc = ath12k_hal_srng_src_next_peek(ab, srng);
+	if (!status_desc)
+		return DP_MON_STATUS_NO_DMA;
+
+	ath12k_hal_rx_buf_addr_info_get(status_desc, &paddr, &cookie, &rbm);
+
+	buf_id = u32_get_bits(cookie, DP_RXDMA_BUF_COOKIE_BUF_ID);
+
+	spin_lock_bh(&rx_ring->idr_lock);
+	skb = idr_find(&rx_ring->bufs_idr, buf_id);
+	spin_unlock_bh(&rx_ring->idr_lock);
+
+	if (!skb)
+		return DP_MON_STATUS_NO_DMA;
+
+	rxcb = ATH12K_SKB_RXCB(skb);
+	dma_sync_single_for_cpu(ab->dev, rxcb->paddr,
+				skb->len + skb_tailroom(skb),
+				DMA_FROM_DEVICE);
+
+	tlv = (struct hal_tlv_64_hdr *)skb->data;
+	if (le64_get_bits(tlv->tl, HAL_TLV_HDR_TAG) != HAL_RX_STATUS_BUFFER_DONE)
+		return DP_MON_STATUS_NO_DMA;
+
+	return DP_MON_STATUS_REPLINISH;
+}
+
 static void
 ath12k_dp_mon_fill_rx_rate(struct ath12k *ar,
 			   struct hal_rx_mon_ppdu_info *ppdu_info,
@@ -3727,12 +3811,191 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 	return num_buffs_reaped;
 }
 
+static int ath12k_dp_rx_reap_mon_status_ring(struct ath12k_base *ab, int mac_id,
+					     int *budget, struct sk_buff_head *skb_list)
+{
+	const struct ath12k_hw_hal_params *hal_params;
+	int buf_id, srng_id, num_buffs_reaped = 0;
+	enum dp_mon_status_buf_state reap_status;
+	struct dp_rxdma_mon_ring *rx_ring;
+	struct ath12k_mon_data *pmon;
+	struct ath12k_skb_rxcb *rxcb;
+	struct hal_tlv_64_hdr *tlv;
+	void *rx_mon_status_desc;
+	struct hal_srng *srng;
+	struct ath12k_dp *dp;
+	struct sk_buff *skb;
+	struct ath12k *ar;
+	dma_addr_t paddr;
+	u32 cookie;
+	u8 rbm;
+
+	ar = ab->pdevs[ath12k_hw_mac_id_to_pdev_id(ab->hw_params, mac_id)].ar;
+	dp = &ab->dp;
+	pmon = &ar->dp.mon_data;
+	srng_id = ath12k_hw_mac_id_to_srng_id(ab->hw_params, mac_id);
+	rx_ring = &dp->rx_mon_status_refill_ring[srng_id];
+
+	srng = &ab->hal.srng_list[rx_ring->refill_buf_ring.ring_id];
+
+	spin_lock_bh(&srng->lock);
+
+	ath12k_hal_srng_access_begin(ab, srng);
+
+	while (*budget) {
+		*budget -= 1;
+		rx_mon_status_desc = ath12k_hal_srng_src_peek(ab, srng);
+		if (!rx_mon_status_desc) {
+			pmon->buf_state = DP_MON_STATUS_REPLINISH;
+			break;
+		}
+		ath12k_hal_rx_buf_addr_info_get(rx_mon_status_desc, &paddr,
+						&cookie, &rbm);
+		if (paddr) {
+			buf_id = u32_get_bits(cookie, DP_RXDMA_BUF_COOKIE_BUF_ID);
+
+			spin_lock_bh(&rx_ring->idr_lock);
+			skb = idr_find(&rx_ring->bufs_idr, buf_id);
+			spin_unlock_bh(&rx_ring->idr_lock);
+
+			if (!skb) {
+				ath12k_warn(ab, "rx monitor status with invalid buf_id %d\n",
+					    buf_id);
+				pmon->buf_state = DP_MON_STATUS_REPLINISH;
+				goto move_next;
+			}
+
+			rxcb = ATH12K_SKB_RXCB(skb);
+
+			dma_sync_single_for_cpu(ab->dev, rxcb->paddr,
+						skb->len + skb_tailroom(skb),
+						DMA_FROM_DEVICE);
+
+			tlv = (struct hal_tlv_64_hdr *)skb->data;
+			if (le64_get_bits(tlv->tl, HAL_TLV_HDR_TAG) !=
+					HAL_RX_STATUS_BUFFER_DONE) {
+				pmon->buf_state = DP_MON_STATUS_NO_DMA;
+				ath12k_warn(ab,
+					    "mon status DONE not set %llx, buf_id %d\n",
+					    le64_get_bits(tlv->tl, HAL_TLV_HDR_TAG),
+					    buf_id);
+				/* RxDMA status done bit might not be set even
+				 * though tp is moved by HW.
+				 */
+
+				/* If done status is missing:
+				 * 1. As per MAC team's suggestion,
+				 *    when HP + 1 entry is peeked and if DMA
+				 *    is not done and if HP + 2 entry's DMA done
+				 *    is set. skip HP + 1 entry and
+				 *    start processing in next interrupt.
+				 * 2. If HP + 2 entry's DMA done is not set,
+				 *    poll onto HP + 1 entry DMA done to be set.
+				 *    Check status for same buffer for next time
+				 *    dp_rx_mon_status_srng_process
+				 */
+				reap_status = ath12k_dp_rx_mon_buf_done(ab, srng,
+									rx_ring);
+				if (reap_status == DP_MON_STATUS_NO_DMA)
+					continue;
+
+				spin_lock_bh(&rx_ring->idr_lock);
+				idr_remove(&rx_ring->bufs_idr, buf_id);
+				spin_unlock_bh(&rx_ring->idr_lock);
+
+				dma_unmap_single(ab->dev, rxcb->paddr,
+						 skb->len + skb_tailroom(skb),
+						 DMA_FROM_DEVICE);
+
+				dev_kfree_skb_any(skb);
+				pmon->buf_state = DP_MON_STATUS_REPLINISH;
+				goto move_next;
+			}
+
+			spin_lock_bh(&rx_ring->idr_lock);
+			idr_remove(&rx_ring->bufs_idr, buf_id);
+			spin_unlock_bh(&rx_ring->idr_lock);
+
+			dma_unmap_single(ab->dev, rxcb->paddr,
+					 skb->len + skb_tailroom(skb),
+					 DMA_FROM_DEVICE);
+
+			if (ath12k_dp_pkt_set_pktlen(skb, RX_MON_STATUS_BUF_SIZE)) {
+				dev_kfree_skb_any(skb);
+				goto move_next;
+			}
+			__skb_queue_tail(skb_list, skb);
+		} else {
+			pmon->buf_state = DP_MON_STATUS_REPLINISH;
+		}
+move_next:
+		skb = ath12k_dp_rx_alloc_mon_status_buf(ab, rx_ring,
+							&buf_id);
+
+		if (!skb) {
+			ath12k_warn(ab, "failed to alloc buffer for status ring\n");
+			hal_params = ab->hw_params->hal_params;
+			ath12k_hal_rx_buf_addr_info_set(rx_mon_status_desc, 0, 0,
+							hal_params->rx_buf_rbm);
+			num_buffs_reaped++;
+			break;
+		}
+		rxcb = ATH12K_SKB_RXCB(skb);
+
+		cookie = u32_encode_bits(mac_id, DP_RXDMA_BUF_COOKIE_PDEV_ID) |
+			 u32_encode_bits(buf_id, DP_RXDMA_BUF_COOKIE_BUF_ID);
+
+		ath12k_hal_rx_buf_addr_info_set(rx_mon_status_desc, rxcb->paddr,
+						cookie,
+						ab->hw_params->hal_params->rx_buf_rbm);
+		ath12k_hal_srng_src_get_next_entry(ab, srng);
+		num_buffs_reaped++;
+	}
+	ath12k_hal_srng_access_end(ab, srng);
+	spin_unlock_bh(&srng->lock);
+
+	return num_buffs_reaped;
+}
+
 static int
 __ath12k_dp_mon_process_ring(struct ath12k *ar, int mac_id,
 			     struct napi_struct *napi, int *budget)
 {
-	/* TODO:Implement monitor mode for WCN7850 here. */
-	return 0;
+	struct ath12k_mon_data *pmon = (struct ath12k_mon_data *)&ar->dp.mon_data;
+	struct ath12k_pdev_mon_stats *rx_mon_stats = &pmon->rx_mon_stats;
+	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
+	enum hal_rx_mon_status hal_status;
+	struct sk_buff_head skb_list;
+	int num_buffs_reaped;
+	struct sk_buff *skb;
+
+	__skb_queue_head_init(&skb_list);
+
+	num_buffs_reaped = ath12k_dp_rx_reap_mon_status_ring(ar->ab, mac_id,
+							     budget, &skb_list);
+	if (!num_buffs_reaped)
+		goto exit;
+
+	while ((skb = __skb_dequeue(&skb_list))) {
+		memset(ppdu_info, 0, sizeof(*ppdu_info));
+		ppdu_info->peer_id = HAL_INVALID_PEERID;
+
+		hal_status = ath12k_dp_mon_parse_rx_dest(ar, pmon, skb);
+
+		if (ar->monitor_started &&
+		    pmon->mon_ppdu_status == DP_PPDU_STATUS_START &&
+		    hal_status == HAL_TLV_STATUS_PPDU_DONE) {
+			rx_mon_stats->status_ppdu_done++;
+			pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
+			/*TODO: add mon dest ring processing here.*/
+			pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+		}
+
+		dev_kfree_skb_any(skb);
+	}
+
+exit:
+	return num_buffs_reaped;
 }
 
 int ath12k_dp_mon_process_ring(struct ath12k_base *ab, int mac_id,
diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index ed268089f9b6..276121ca31d1 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -2042,6 +2042,24 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *ab, struct hal_srng *srng,
 		return ((srng->ring_size - hp + tp) / srng->entry_size) - 1;
 }
 
+void *ath12k_hal_srng_src_next_peek(struct ath12k_base *ab,
+				    struct hal_srng *srng)
+{
+	void *desc;
+	u32 next_hp;
+
+	lockdep_assert_held(&srng->lock);
+
+	next_hp = (srng->u.src_ring.hp + srng->entry_size) % srng->ring_size;
+
+	if (next_hp == srng->u.src_ring.cached_tp)
+		return NULL;
+
+	desc = srng->ring_base_vaddr + next_hp;
+
+	return desc;
+}
+
 void *ath12k_hal_srng_src_get_next_entry(struct ath12k_base *ab,
 					 struct hal_srng *srng)
 {
@@ -2075,6 +2093,17 @@ void *ath12k_hal_srng_src_get_next_entry(struct ath12k_base *ab,
 	return desc;
 }
 
+void *ath12k_hal_srng_src_peek(struct ath12k_base *ab, struct hal_srng *srng)
+{
+	lockdep_assert_held(&srng->lock);
+
+	if (((srng->u.src_ring.hp + srng->entry_size) % srng->ring_size) ==
+	    srng->u.src_ring.cached_tp)
+		return NULL;
+
+	return srng->ring_base_vaddr + srng->u.src_ring.hp;
+}
+
 void *ath12k_hal_srng_src_reap_next(struct ath12k_base *ab,
 				    struct hal_srng *srng)
 {
diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index f627cd01f60c..0ee9c6b26dab 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1144,6 +1144,7 @@ void ath12k_hal_srng_get_params(struct ath12k_base *ab, struct hal_srng *srng,
 				struct hal_srng_params *params);
 void *ath12k_hal_srng_dst_get_next_entry(struct ath12k_base *ab,
 					 struct hal_srng *srng);
+void *ath12k_hal_srng_src_peek(struct ath12k_base *ab, struct hal_srng *srng);
 void *ath12k_hal_srng_dst_peek(struct ath12k_base *ab, struct hal_srng *srng);
 int ath12k_hal_srng_dst_num_free(struct ath12k_base *ab, struct hal_srng *srng,
 				 bool sync_hw_ptr);
@@ -1151,6 +1152,8 @@ void *ath12k_hal_srng_src_get_next_reaped(struct ath12k_base *ab,
 					  struct hal_srng *srng);
 void *ath12k_hal_srng_src_reap_next(struct ath12k_base *ab,
 				    struct hal_srng *srng);
+void *ath12k_hal_srng_src_next_peek(struct ath12k_base *ab,
+				    struct hal_srng *srng);
 void *ath12k_hal_srng_src_get_next_entry(struct ath12k_base *ab,
 					 struct hal_srng *srng);
 int ath12k_hal_srng_src_num_free(struct ath12k_base *ab, struct hal_srng *srng,
-- 
2.34.1


