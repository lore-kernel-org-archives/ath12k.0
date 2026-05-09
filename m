Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3C4CD37AC
	for <ath12k@archiver.kernel.org>; Sat,  9 May 2026 02:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiDz0P/Mnp1qjre9Pw1n3xWLk8C6LBzQ/tAeEv9bMZw=; b=amjv7Vq+fKvfKQ9rS1q5DE9GYh
	ancZa7rWkL1Zfa6ANwKdIiIHArIoABEcb7xpwkZmgZZxSgpZ5eE9NDwm4tDnc9Rxu+yORN680BQXc
	gFzzgaMYU+guXzB6ubelFPstUvQx55uIKkJhdBrX7OG4faGZmlkdz1Qmb/kdKZltE7PRrdtObbWXt
	LWtKw44ETWb3zcUssatE1sVJ+4m9JXowIClRLTaQmRrwLFwFZ/JroueWH2Fc8UjAtlpS0HlVZUbHN
	grqTgxPPfN5JqsSjosQSAT3sUZnMW4MqsHhK2rsZmvmjEOepzRPOHpLr+hO/vKJNaX2tqzqE1RHYJ
	nOgfBe4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuY-000000084JH-1cgv;
	Sat, 09 May 2026 02:59:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuV-000000084Hf-2ifb
	for ath12k@lists.infradead.org;
	Sat, 09 May 2026 02:59:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492poOc2866538
	for <ath12k@lists.infradead.org>; Sat, 9 May 2026 02:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SiDz0P/Mnp1
	qjre9Pw1n3xWLk8C6LBzQ/tAeEv9bMZw=; b=HnvAIrt8TH3Yjvc8U/knIwoABcf
	nTLhOx+6kjt41UC7OcTMJ3yHk8EDZoJU4jbFO3xHKoxUUZVS38+KSlGm7igmb4nk
	HNI1sk5jQBwnEDCE2yulS1RnUtmQddG6MgXGJUquBouJyXFyQ615w3u7TurSsq3L
	LjSgGnJIU2UZM4gdeyCtl3ye+IA6CHADwKgPCNuU3nkd9/dqIs45bPal40TF9jc/
	NUSD7D5vwOfbjNAJl+l47QS+U+oR6lq5uBy521ivNJLI8zWVZGsmPqsL7WEKKduO
	TbfABSfU5ns7VjYfx+yRqKlqO2J9/5hdMQLGPEjhf5ilEAFjAh+doK3xEtQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy00f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 09 May 2026 02:59:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3653638874cso3755392a91.2
        for <ath12k@lists.infradead.org>; Fri, 08 May 2026 19:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778295561; x=1778900361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiDz0P/Mnp1qjre9Pw1n3xWLk8C6LBzQ/tAeEv9bMZw=;
        b=gty8SorOvTVRLbOrcVcRcuZWL+NXaXX+LBa3AGBlVSDHxk2niICAH2AkfTKMdrUWxo
         nq8o3fWQV3s3wjOgxF/exafoJagIF88aSMI5aW+NAq50wC01jO7XqE7uWF78h8Aiq10G
         tu63yVKBSJZqEudt5B3xEtz5NrIlya5eAhhsaeuE+OijiJSge17O4rIKpA77fRNq1Ejv
         xwQedhvRbSI6B50YOqdU01rur4SmE2R1KyROREkKUR9sakI7I24ZAMVHC7z4zHGspugt
         fhPkoPaVVfMVsamUh0GH9k6oO+0YlK7xMjVZOlUHmYCQRveO2GTBpZAmnrFDqfxIQefy
         HvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778295561; x=1778900361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SiDz0P/Mnp1qjre9Pw1n3xWLk8C6LBzQ/tAeEv9bMZw=;
        b=fMAFJSQnDDTHj2F9JEfeMCPEUMHn+MNlTR0TO/hEwXhr8qc+2JwWNfSsBFkf6otJLa
         HSltEmmEgfnP6m8TF7PRAMmQABdEDWpU3igL/6EkPPlVaaDmv2+/pM/R4cFIgwiQfrbu
         Figz3MTMQY3EOkiZtiMAxEr9x0VpR17aKSHAJsaT21Xck16GxCLaG8YsEpGoBFR2qfvF
         J+sPwexM836WUaKiLQAeiskPmm0RWgPJLVCiTFEWx7SRcWz9itCJfb1FACe2lruzbqb2
         Ua4ZrteZb/tjUvr5F9cFMPgyXziY3HuV/VtQUflWxN8xs0Ijz74i477pYACEXC7eazi9
         +KKw==
X-Gm-Message-State: AOJu0YxQhk2l+hxqfV7U3b/DlNnNCqo53AcSrDYYQQHn9hxN8u2ei4mm
	JMaxvNARQ2pAO+U84qizGMl2w2YcgZ/R14DyJJCY25Hg+QIJcQ/SQYmjQf8l9KTouv7+ojDHcBA
	kfkOfgBkN3Yi++i4fRV2FfnE4I78X4pOjvVgEe8/p2LyHEl05iUga8ORJ/6Px/DFd
X-Gm-Gg: Acq92OERw29G71l6KhiZVip/XYnMk+2pwafEXwvF1gQxkJToZfFaEEDW/5zXz+PTBdB
	6IDvH6hH1hdVtTbMZsSs07P1C/d2bTJqvcCHcT0dKQ5tNCdnAsXIMmGkdev7jtJ6Id2vM4CaS2k
	M8uEbyOuSvZZgTlo0KJU6cVcFRbFbCoWMQWkNjhYk3sUHWHWenCtJEy/ONx6ZirbPT0ExBVbLCW
	CL+9YWXqfUNumScf2mC88PvGbqyJrjCNeHv4pl2HVB0/4rwcQ5vH8ZNN5U0XiI3zVHyvkq2Tji+
	KyNHTsE5s6rFcfU7IbejqczEIS4FGw44LCgjC13hKZXEijD/AJ3ggd+lshxRNtiq6/CBFkpU0o7
	lp0LkiauFAgZyrCETypJR2cuRKwUapnT+6BRJxOUl7CHH23ZHjK6qaAKBMEo3Yl3aRf9Yoc8jzo
	wpwJNU
X-Received: by 2002:a17:90b:4a03:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-367d4845b95mr1127707a91.13.1778295561411;
        Fri, 08 May 2026 19:59:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4a03:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-367d4845b95mr1127687a91.13.1778295560880;
        Fri, 08 May 2026 19:59:20 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be8be938sm750899a91.4.2026.05.08.19.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:59:20 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 4/5] wifi: ath12k: add dp_mon support 32-bit TLV headers
Date: Sat,  9 May 2026 10:58:18 +0800
Message-Id: <20260509025819.1641630-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=69fea30a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JST6KbR4yvz285-FHA0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ebq881pux2iQi8Y_ezaQHO_Lckc5yshe
X-Proofpoint-GUID: ebq881pux2iQi8Y_ezaQHO_Lckc5yshe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyNyBTYWx0ZWRfXx8025hwuXOWu
 CrTAEM23v/Me+wZha6Zxt2Ptn9BgoskwcIWUIG6vovr2R9/68Vgo2taq84/TIHYqigHjdFiIpHs
 fmfufBYM3AtoRBX4f8Z3FUQln/9RFg3l0HCRMB9I4HBSCqCpxkoFWltEVW1KFyvij1ItfipWmTR
 OCeYBUm1EzY/avyygZ5FJM0aASz9YXTPhLWMpWDHIOdhENW4aUaszHAkC87cu5Q/6+RVF+vWU7v
 ygQAWIYYeyXrZYRq8nLyVWx5qE6knEtHiOsu+Tai2klccZ1CwC0sB7lI+xbw9x4d1lXCvWxOADJ
 M2dy8GSA8O3AeAF9vvNnntNbeOf18hCNNm6N/D/7OjH+SjzjdTv8AVTcwGxDsEAYUq7j6cedXGc
 zK7TOR2jPrEtwLqjzomOiLMjS6S912seqWQz5fiM3ekuPDDzeB7bfZu7wPjZfPg/uOMYPHJkaoW
 L8oUvxW4O7NRSPALS0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_195923_803679_209A3265 
X-CRM114-Status: GOOD (  17.34  )
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

Wi-Fi 7 monitor status parsing in dp_mon currently assumes a 64-bit TLV
header and directly decodes tag/len/userid from struct hal_tlv_64_hdr.
On chips using a 32-bit TLV header (e.g. QCC2072), this causes monitor RX
status packets to be dropped during TLV parsing.

Introduce HAL helpers to decode TLV header fields (tag/len/userid/value)
for both 32-bit and 64-bit header layouts. Without changing the actual TLV
parsing logic.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 57 ++++++++++---------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 77f5d23be78d..4266bd1d0d3d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -1565,16 +1565,17 @@ ath12k_wifi7_dp_mon_parse_status_msdu_end(struct ath12k_mon_data *pmon,
 static enum hal_rx_mon_status
 ath12k_wifi7_dp_mon_rx_parse_status_tlv(struct ath12k_pdev_dp *dp_pdev,
 					struct ath12k_mon_data *pmon,
-					const struct hal_tlv_64_hdr *tlv)
+					const void *tlv)
 {
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
-	const void *tlv_data = tlv->value;
-	u32 info[7], userid;
-	u16 tlv_tag, tlv_len;
+	struct ath12k *ar = ath12k_pdev_dp_to_ar(dp_pdev);
+	struct ath12k_hal *hal = &ar->ab->hal;
+	u16 tlv_tag, tlv_len, userid;
+	void *tlv_data;
+	u32 info[7];
 
-	tlv_tag = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_TAG);
-	tlv_len = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_LEN);
-	userid = le64_get_bits(tlv->tl, HAL_TLV_64_USR_ID);
+	tlv_data = hal->ops->mon_rx_status_dec_tlv_hdr((void *)tlv, &tlv_tag,
+						       &tlv_len, &userid);
 
 	if (ppdu_info->tlv_aggr.in_progress && ppdu_info->tlv_aggr.tlv_tag != tlv_tag) {
 		ath12k_wifi7_dp_mon_parse_eht_sig_hdr(ppdu_info,
@@ -2931,11 +2932,12 @@ static enum dp_mon_status_buf_state
 ath12k_wifi7_dp_rx_mon_buf_done(struct ath12k_base *ab, struct hal_srng *srng,
 				struct dp_rxdma_mon_ring *rx_ring)
 {
+	struct ath12k_hal *hal = &ab->hal;
 	struct ath12k_skb_rxcb *rxcb;
-	struct hal_tlv_64_hdr *tlv;
 	struct sk_buff *skb;
 	void *status_desc;
 	dma_addr_t paddr;
+	u16 tlv_tag;
 	u32 cookie;
 	int buf_id;
 	u8 rbm;
@@ -2960,8 +2962,8 @@ ath12k_wifi7_dp_rx_mon_buf_done(struct ath12k_base *ab, struct hal_srng *srng,
 				skb->len + skb_tailroom(skb),
 				DMA_FROM_DEVICE);
 
-	tlv = (struct hal_tlv_64_hdr *)skb->data;
-	if (le64_get_bits(tlv->tl, HAL_TLV_HDR_TAG) != HAL_RX_STATUS_BUFFER_DONE)
+	hal->ops->mon_rx_status_dec_tlv_hdr(skb->data, &tlv_tag, NULL, NULL);
+	if (tlv_tag != HAL_RX_STATUS_BUFFER_DONE)
 		return DP_MON_STATUS_NO_DMA;
 
 	return DP_MON_STATUS_REPLINISH;
@@ -2973,39 +2975,38 @@ ath12k_wifi7_dp_mon_parse_rx_dest(struct ath12k_pdev_dp *dp_pdev,
 				  struct sk_buff *skb)
 {
 	struct ath12k *ar = ath12k_pdev_dp_to_ar(dp_pdev);
-	struct hal_tlv_64_hdr *tlv;
+	struct ath12k_hal *hal = &ar->ab->hal;
+	u8 *tlv_value, *tlv = skb->data;
 	struct ath12k_skb_rxcb *rxcb;
 	enum hal_rx_mon_status hal_status;
 	u16 tlv_tag, tlv_len;
-	u8 *ptr = skb->data;
+	u32 tlv_hdr_len;
+
+	tlv_hdr_len = hal->ops->get_tlv_hdr_align();
 
 	do {
-		tlv = (struct hal_tlv_64_hdr *)ptr;
-		tlv_tag = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_TAG);
+		tlv_value = hal->ops->mon_rx_status_dec_tlv_hdr(tlv, &tlv_tag,
+								&tlv_len, NULL);
 
 		/* The actual length of PPDU_END is the combined length of many PHY
 		 * TLVs that follow. Skip the TLV header and
 		 * rx_rxpcu_classification_overview that follows the header to get to
 		 * next TLV.
 		 */
-
 		if (tlv_tag == HAL_RX_PPDU_END)
 			tlv_len = sizeof(struct hal_rx_rxpcu_classification_overview);
-		else
-			tlv_len = le64_get_bits(tlv->tl, HAL_TLV_64_HDR_LEN);
 
 		hal_status = ath12k_wifi7_dp_mon_rx_parse_status_tlv(dp_pdev, pmon,
 								     tlv);
 
 		if (ar->monitor_started && ar->ab->hw_params->rxdma1_enable &&
 		    ath12k_wifi7_dp_mon_parse_rx_dest_tlv(dp_pdev, pmon, hal_status,
-							  tlv->value))
+							  tlv_value))
 			return HAL_RX_MON_STATUS_PPDU_DONE;
 
-		ptr += sizeof(*tlv) + tlv_len;
-		ptr = PTR_ALIGN(ptr, HAL_TLV_64_ALIGN);
+		tlv = PTR_ALIGN(tlv + tlv_len + tlv_hdr_len, tlv_hdr_len);
 
-		if ((ptr - skb->data) > skb->len)
+		if ((tlv - skb->data) > skb->len)
 			break;
 
 	} while ((hal_status == HAL_RX_MON_STATUS_PPDU_NOT_DONE) ||
@@ -3057,15 +3058,16 @@ ath12k_wifi7_dp_rx_reap_mon_status_ring(struct ath12k_base *ab, int mac_id,
 	int buf_id, srng_id, num_buffs_reaped = 0;
 	enum dp_mon_status_buf_state reap_status;
 	struct dp_rxdma_mon_ring *rx_ring;
+	struct ath12k_hal *hal = &ab->hal;
 	struct ath12k_mon_data *pmon;
 	struct ath12k_skb_rxcb *rxcb;
-	struct hal_tlv_64_hdr *tlv;
 	void *rx_mon_status_desc;
 	struct hal_srng *srng;
 	struct ath12k_dp *dp;
 	struct sk_buff *skb;
 	struct ath12k *ar;
 	dma_addr_t paddr;
+	u16 tlv_tag;
 	u32 cookie;
 	u8 rbm;
 
@@ -3110,14 +3112,13 @@ ath12k_wifi7_dp_rx_reap_mon_status_ring(struct ath12k_base *ab, int mac_id,
 						skb->len + skb_tailroom(skb),
 						DMA_FROM_DEVICE);
 
-			tlv = (struct hal_tlv_64_hdr *)skb->data;
-			if (le64_get_bits(tlv->tl, HAL_TLV_HDR_TAG) !=
-					HAL_RX_STATUS_BUFFER_DONE) {
+			hal->ops->mon_rx_status_dec_tlv_hdr(skb->data, &tlv_tag,
+							    NULL, NULL);
+			if (tlv_tag != HAL_RX_STATUS_BUFFER_DONE) {
 				pmon->buf_state = DP_MON_STATUS_NO_DMA;
 				ath12k_warn(ab,
-					    "mon status DONE not set %llx, buf_id %d\n",
-					    le64_get_bits(tlv->tl, HAL_TLV_HDR_TAG),
-					    buf_id);
+					    "mon status DONE not set %x, buf_id %d\n",
+					    tlv_tag, buf_id);
 				/* RxDMA status done bit might not be set even
 				 * though tp is moved by HW.
 				 */
-- 
2.34.1


