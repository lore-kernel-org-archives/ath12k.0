Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232C3CCF2C2
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dIcYYNbbNBmX1h2umAdFtEG3Abe69vs2ikA3rzQFT4=; b=BMHgG3omK46gkAtnHI3dktXxtx
	Yh1niq/fQShfooLZtIIyHSpAbc+HjVuONeXlms916VeYW6FdSseiPV5DbHUPr4iVKOUB0G4+ZuCRp
	xDreOwePT/IUVVJzjltjIk2RK/WZgPEVK/h+Dh/OSW///+PhWdYLnjDFs4XGAu4h79rmmzARPIqfJ
	Mv30OHvhiwUaCYGQE6Bz87yil8XVmJYe0Hq3J/ZTlUdzg8FAzMIfAKTqkrx7TsqtTbjS2uV39KU/J
	guFSVdqvzOdRt2sIO9BLC1B7Ehg5H2SM56kqcttxVT1zmhWuhriM9LQ5swP8pgcGKjZMRdrqD+J/1
	f5awMZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjfy-00000003Fpe-3aIo;
	Fri, 16 Oct 2026 15:16:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjfv-00000003Fn1-3lMP
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 15:16:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5p762153847
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 15:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dIcYYNbbNBmX1h2umAdFtEG3Abe69vs2ikA3rzQFT4=; b=asZmEHnisd6tfqtL
	Kk811rpkt4TAnQvOVEwceft6ohcgbqXdCtrRh9ILu9dd4QLVlonFNDzvDX8cV9SH
	IU602QUtHRNRi9bqJ4InYnPojP6ubkNZ7bw8S5IP/TvzNLDdcjLmPWTSe91uyiAb
	eR1tKmuTWyZ1VMLZeHcwXtGJYEi7aiA17xf3xOq9S4SHJwHqxhAT5DGoetM2rdwt
	sHUdkg15O8/j0krjFoIaVASpwQlaB0cEBbuU13YgTEXvUnJWQxx6hhABdbXSWQld
	gTrLYVitQK3raeBToCx5kh2mOG0HhOZhIhJOy0S/20aKsEkqnupga3cdfjzLmo5c
	Dimwyg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhums38q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 15:16:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e8078ac577so2000216e0c.3
        for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792163810; x=1792768610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dIcYYNbbNBmX1h2umAdFtEG3Abe69vs2ikA3rzQFT4=;
        b=B/oRe6toeMsCZ+BKrdTARz3Yni765CiKrEHN/+BVgiLOTsyAHlGAf7SE1hA/wzqy26
         thexs/Jju8D4g9vvI2yrawTok6Sl2iC4klDmimrFRdjx0uQrGkpJ/8c79MNAdSKRwCeh
         kwTz6gy8O5SPRy/4xi+6wz3d+sYBEGisTlWSiQenLa+Jemi2+VQwNr5Sw/zWUCS6PYfX
         lW//JJy7qWE4wuXZBSZxfU6yzlfhQRZ7JwJHAO3dr3WI8o2PbapLiCgI5HKBSU/Jz1Iz
         vYqK4kj2plB5UWER1yX6ldz08aRTPkUbSZdZfENtZ0WCb51e/CX9XHfOc9qkCH87iQ6B
         T0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163810; x=1792768610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dIcYYNbbNBmX1h2umAdFtEG3Abe69vs2ikA3rzQFT4=;
        b=rqX42wM4ggw7kW1PP6NT98rJhsYGYAwYSQ4MV1oR1PNKq8ZhIyocx3Z+4czR8O4YPg
         TW0j4ynnxiz0lBYlpLbFqqDZlzIjydR9E2R32abUMEdbcP4WTBTjcEltW8ZQCObGPcXb
         1h43z+tM8M4RE+YFuIjOBJIjaYg1ntt5ewVF2d6sepH2oYiAIlIFVzRImgvmW5/mPBXD
         KsmUBvLf8OvQGikdEy44CLvZ/lOuyDGZI7vfXXP7PDKtNPIXUVj6mJ/INrIhD+DhpTth
         zZc6YBOq3l9bnEsfVIazoAxadYLxlLebEN0DSBI93Kf/cMbSyctk4e3lzGoY+EYSecX4
         uBtg==
X-Forwarded-Encrypted: i=1; AKwUvBxv3KxkwWQHwwCDpK8lBRMjaMNo7tT87Gvq4ePWSDwHRgCUgU3vgKurS+nym4VTzcSnWhj3Dw4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4EglYbd3A5GZag3Eh6yWblb/RcMbt7Sl6iXa7do7xowqE2u2/
	hkfPfhlfx6MRPqySOjCL/fao3DV7XfqkNDXCqgb5G8/wTiajYNyhzhoz2k+KSwhYhzCxVZVwCOw
	hxOXgFWsGBd/E2j5SHGdEGfR5OdCQJVXr8G6Y4SJYnIRJwgLXAtrKUkzA/ZO68vi+
X-Gm-Gg: AYBFou1n6GlamEzSdXTYFnym7C48yCaeLHWF1Na0uBLOZx6oDn4ebCPq0oMmk2ZZu9Q
	+USKdKfkJuJV6+Bnf5bgsOLeREVyNiiUiZy6+DmT0oSHZ2BqiNyYktDZ2bSPN5vpR8K1s7zUsSD
	KZLHCxOlKMt87Tvd+WogA9BsmOq9WzwHnS6lzDs2DVgNdauB9xXol2FSQaJYK5GpRsKcCp7oRDP
	wFcZboQKWP7vVMPn3aYE1PDzllqBFKOk4ymjVl9l/MXBrlmmQsRFpVUuAtfGLcoWFIkYNp3ij23
	VCjE46TAeGF0dp+jLPPqed6lVlTivfGS0myhjEVJH1MPdVH4buZgJGZQWNwmBN7DvShpz4vTmWc
	9B61jwo6zqszQ3Q==
X-Received: by 2002:a05:6122:5101:b0:5c9:ef0d:155d with SMTP id 71dfb90a1353d-5eaaa409039mr142464e0c.10.1792163809886;
        Fri, 16 Oct 2026 08:16:49 -0700 (PDT)
X-Received: by 2002:a05:6122:5101:b0:5c9:ef0d:155d with SMTP id 71dfb90a1353d-5eaaa409039mr142411e0c.10.1792163809223;
        Fri, 16 Oct 2026 08:16:49 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm4939352f8f.3.2026.10.16.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:16:48 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:16:29 +0200
Subject: [PATCH ath-next 3/3] wifi: ath12k: use ieee80211_rx_list() to
 deliver packets to mac80211
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ath12k-rx-avoid-realloc-v1-3-0ce6cd99dd5f@oss.qualcomm.com>
References: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
In-Reply-To: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfXz17QR2uxBG6N
 bwqvOcCGUqquqZU+s/JVoCHnNje53rnihG7WEzmnuFPaRCUOINd9sS09Ue7VWs4FJhg418moo8u
 /RnU0lDm+ZIEzoTSvktmiSyy3tS6NaE=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad23fe2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6kEX7mH1gwqfXXxvQscA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: jhPseLaqG82NIJqx8PIRWzigw2k9pxWu
X-Proofpoint-ORIG-GUID: jhPseLaqG82NIJqx8PIRWzigw2k9pxWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfXwKDaLb9KAkVU
 iShTDggVh57YCVqptGIHZbSKXsTywcYD+iRp7TfXSZ3zFX6SEUkhsMkSJx9OXhs6xIRW1fhg1wc
 xbs+pKTWKMvgmmc9UdhQ95rztMapHTchGladPi+pVnMekEROPV4S0+S8QAscTTdbuvzQIHTuZj1
 fAYtbm5x8kURkGiN76gXClWHc4SRKS3Ugc8diToipX/n3B+/g7ZfHUcNjMKsATlcioA2IlP9ji5
 Hw9NWIKsmWc+12shmDN6IKIjEAURFxCaWsmIstb8B0gE8RXFGPySF2wx+c6wibYUS8Cm9VTO7Ba
 Gm1IQd988MqUtGH3aq8nsjA4zeZrFU7xZxp1ErUQqu2Oep6VbMxzgDcgGXno7XQ7MaEiDzcv8Y6
 T+TUk1oB6pnnluZA2xSS6VPDwlaLzMWCBc2HtzvSzOfJE+WFFpC+RoGzzNF0ia+9cYpZ4tVfi9v
 dO6UAdZ+T30cJYq40nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_081652_071013_00B60D4C 
X-CRM114-Status: GOOD (  24.39  )
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

Currently the regular rx path hands MSDUs to mac80211 one by one through
ieee80211_rx_napi(), and MSDUs spread over multiple rx buffers
(MSDU_CONTINUATION) are first linearized by
ath12k_wifi7_dp_rx_msdu_coalesce(), which may require a
pskb_expand_head() reallocation.

Rework the receive path to collect processed frames on a list and
deliver them to mac80211 as a batch with ieee80211_rx_list(), feeding
the result to napi_gro_receive() at the end of the NAPI poll. Delivering
frames in batches improves the icache footprint and lets GRO process
more frames together.

While at it, drop the linearization for multi-buffer MSDUs: chain the
continuation buffers on the head skb with frag_list and deliver a single
(possibly non-linear) skb per MSDU, running the per-frame processing
(h_ppdu, h_mpdu, link station lookup and rx_status copy) only on the
head.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 259 +++++++++++++-------------
 1 file changed, 128 insertions(+), 131 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index e7afadf2bf2c..af5333663603 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -426,114 +426,28 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	return 0;
 }
 
-static int ath12k_wifi7_dp_rx_msdu_coalesce(struct ath12k_hal *hal,
-					    struct sk_buff_head *msdu_list,
-					    struct sk_buff *first, struct sk_buff *last,
-					    u8 l3pad_bytes, int msdu_len,
-					    struct hal_rx_desc_data *rx_info)
-{
-	struct sk_buff *skb;
-	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(first);
-	int buf_first_hdr_len, buf_first_len;
-	struct hal_rx_desc *ldesc;
-	int space_extra, rem_len, buf_len;
-	u32 hal_rx_desc_sz = hal->hal_desc_sz;
-	bool is_continuation;
-
-	/* As the msdu is spread across multiple rx buffers,
-	 * find the offset to the start of msdu for computing
-	 * the length of the msdu in the first buffer.
-	 */
-	buf_first_hdr_len = hal_rx_desc_sz + l3pad_bytes;
-	buf_first_len = DP_RX_BUFFER_SIZE - buf_first_hdr_len;
-
-	if (WARN_ON_ONCE(msdu_len <= buf_first_len)) {
-		skb_put(first, buf_first_hdr_len + msdu_len);
-		skb_pull(first, buf_first_hdr_len);
-		return 0;
-	}
-
-	ldesc = (struct hal_rx_desc *)last->data;
-	rxcb->is_first_msdu = rx_info->is_first_msdu;
-	rxcb->is_last_msdu = rx_info->is_last_msdu;
-
-	/* MSDU spans over multiple buffers because the length of the MSDU
-	 * exceeds DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE. So assume the data
-	 * in the first buf is of length DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE.
-	 */
-	skb_put(first, DP_RX_BUFFER_SIZE);
-	skb_pull(first, buf_first_hdr_len);
-
-	/* When an MSDU spread over multiple buffers MSDU_END
-	 * tlvs are valid only in the last buffer. Copy those tlvs.
-	 */
-	ath12k_dp_rx_desc_end_tlv_copy(hal, rxcb->rx_desc, ldesc);
-
-	space_extra = msdu_len - (buf_first_len + skb_tailroom(first));
-	if (space_extra > 0 &&
-	    (pskb_expand_head(first, 0, space_extra, GFP_ATOMIC) < 0)) {
-		/* Free up all buffers of the MSDU */
-		while ((skb = __skb_dequeue(msdu_list)) != NULL) {
-			rxcb = ATH12K_SKB_RXCB(skb);
-			if (!rxcb->is_continuation) {
-				dev_kfree_skb_any(skb);
-				break;
-			}
-			dev_kfree_skb_any(skb);
-		}
-		return -ENOMEM;
-	}
-
-	rem_len = msdu_len - buf_first_len;
-	while ((skb = __skb_dequeue(msdu_list)) != NULL && rem_len > 0) {
-		rxcb = ATH12K_SKB_RXCB(skb);
-		is_continuation = rxcb->is_continuation;
-		if (is_continuation)
-			buf_len = DP_RX_BUFFER_SIZE - hal_rx_desc_sz;
-		else
-			buf_len = rem_len;
-
-		if (buf_len > (DP_RX_BUFFER_SIZE - hal_rx_desc_sz)) {
-			WARN_ON_ONCE(1);
-			dev_kfree_skb_any(skb);
-			return -EINVAL;
-		}
-
-		skb_put(skb, buf_len + hal_rx_desc_sz);
-		skb_pull(skb, hal_rx_desc_sz);
-		skb_copy_from_linear_data(skb, skb_put(first, buf_len),
-					  buf_len);
-		dev_kfree_skb_any(skb);
-
-		rem_len -= buf_len;
-		if (!is_continuation)
-			break;
-	}
-
-	return 0;
-}
-
 static int ath12k_wifi7_dp_rx_process_msdu(struct ath12k_pdev_dp *dp_pdev,
 					   struct sk_buff *msdu,
 					   struct sk_buff_head *msdu_list,
-					   struct hal_rx_desc_data *rx_info)
+					   struct hal_rx_desc_data *rx_info,
+					   struct list_head *list)
 {
-	struct ath12k_dp *dp = dp_pdev->dp;
+	struct ieee80211_rx_status *rx_status = IEEE80211_SKB_RXCB(msdu);
+	struct ieee80211_rx_status *status = rx_info->rx_status;
+	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
+	struct sk_buff *last_buf, *frag_list = NULL;
+	struct ieee80211_link_sta *link_sta = NULL;
 	struct hal_rx_desc *rx_desc, *lrx_desc;
-	struct ath12k_skb_rxcb *rxcb;
-	struct sk_buff *last_buf;
+	int ret, msdu_len, rx_desc_headroom;
+	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_hal *hal = dp->hal;
-	u8 l3_pad_bytes;
-	u16 msdu_len;
-	int ret;
-	u32 hal_rx_desc_sz = hal->hal_desc_sz;
+	struct ath12k_dp_peer *peer;
 
 	last_buf = ath12k_dp_rx_get_msdu_last_buf(msdu_list, msdu);
 	if (!last_buf) {
 		ath12k_warn(dp->ab,
 			    "No valid Rx buffer to access MSDU_END tlv\n");
-		ret = -EIO;
-		goto free_out;
+		return -EIO;
 	}
 
 	rx_desc = (struct hal_rx_desc *)msdu->data;
@@ -542,56 +456,133 @@ static int ath12k_wifi7_dp_rx_process_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_dp_extract_rx_desc_data(hal, rx_info, rx_desc, lrx_desc);
 	if (!rx_info->msdu_done) {
 		ath12k_warn(dp->ab, "msdu_done bit in msdu_end is not set\n");
-		ret = -EIO;
-		goto free_out;
+		return -EIO;
 	}
 
-	rxcb = ATH12K_SKB_RXCB(msdu);
 	rxcb->rx_desc = rx_desc;
+	rxcb->is_first_msdu = rx_info->is_first_msdu;
+	rxcb->is_last_msdu = rx_info->is_last_msdu;
 	msdu_len = rx_info->msdu_len;
-	l3_pad_bytes = rx_info->l3_pad_bytes;
+	rx_desc_headroom = hal->hal_desc_sz + rx_info->l3_pad_bytes;
+	/* When an MSDU spread over multiple buffers MSDU_END
+	 * tlvs are valid only in the last buffer. Copy those tlvs.
+	 */
+	ath12k_dp_rx_desc_end_tlv_copy(hal, rxcb->rx_desc, lrx_desc);
 
 	if (rxcb->is_frag) {
-		skb_pull(msdu, hal_rx_desc_sz);
-	} else if (!rxcb->is_continuation) {
-		if ((msdu_len + hal_rx_desc_sz) > DP_RX_BUFFER_SIZE) {
-			ret = -EINVAL;
-			ath12k_warn(dp->ab, "invalid msdu len %u\n", msdu_len);
-			ath12k_dbg_dump(dp->ab, ATH12K_DBG_DATA, NULL, "", rx_desc,
-					sizeof(*rx_desc));
-			goto free_out;
-		}
-		skb_put(msdu, hal_rx_desc_sz + l3_pad_bytes + msdu_len);
-		skb_pull(msdu, hal_rx_desc_sz + l3_pad_bytes);
+		skb_pull(msdu, hal->hal_desc_sz);
 	} else {
-		ret = ath12k_wifi7_dp_rx_msdu_coalesce(hal, msdu_list,
-						       msdu, last_buf,
-						       l3_pad_bytes, msdu_len,
-						       rx_info);
-		if (ret) {
-			ath12k_warn(dp->ab,
-				    "failed to coalesce msdu rx buffer%d\n", ret);
-			goto free_out;
+		if (!rxcb->is_continuation &&
+		    msdu_len + hal->hal_desc_sz > DP_RX_BUFFER_SIZE) {
+			ath12k_warn(dp->ab, "invalid msdu len %u\n", msdu_len);
+			ath12k_dbg_dump(dp->ab, ATH12K_DBG_DATA, NULL, "",
+					rx_desc, sizeof(*rx_desc));
+			return -EINVAL;
 		}
+
+		if (!rxcb->is_continuation ||
+		    msdu_len <= DP_RX_BUFFER_SIZE - rx_desc_headroom)
+			skb_put(msdu, rx_desc_headroom + msdu_len);
+		else
+			skb_put(msdu, DP_RX_BUFFER_SIZE);
+		skb_pull(msdu, rx_desc_headroom);
 	}
 
-	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
-							     rx_info))) {
-		ret = -EINVAL;
-		goto free_out;
+	if (!rxcb->is_frag && rxcb->is_continuation) {
+		unsigned int frag_len = 0, truesize = 0;
+		struct sk_buff *skb, *last_frag;
+
+		/* The MSDU is spread across multiple rx buffers */
+		msdu_len -= (DP_RX_BUFFER_SIZE - rx_desc_headroom);
+
+		while (msdu_len > 0) {
+			struct ath12k_skb_rxcb *cb;
+			int len;
+
+			skb = __skb_dequeue(msdu_list);
+			if (!skb) {
+				WARN_ON_ONCE(msdu_len > 0);
+				goto free_frag_list;
+			}
+
+			cb = ATH12K_SKB_RXCB(skb);
+			if (cb->is_continuation)
+				len = DP_RX_BUFFER_SIZE - hal->hal_desc_sz;
+			else
+				len = msdu_len;
+
+			if (len > DP_RX_BUFFER_SIZE - hal->hal_desc_sz) {
+				dev_kfree_skb_any(skb);
+				goto free_frag_list;
+			}
+
+			skb_put(skb, len + hal->hal_desc_sz);
+			skb_pull(skb, hal->hal_desc_sz);
+
+			if (!frag_list)
+				frag_list = skb;
+			else
+				last_frag->next = skb;
+
+			skb->next = NULL;
+			last_frag = skb;
+
+			msdu_len -= len;
+			frag_len += skb->len;
+			truesize += skb->truesize;
+			if (!cb->is_continuation)
+				break;
+		}
+
+		if (frag_list) {
+			skb_shinfo(msdu)->frag_list = frag_list;
+			msdu->data_len = frag_len;
+			msdu->len += frag_len;
+			msdu->truesize += truesize;
+			msdu->next = NULL;
+		}
 	}
 
+	if (!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu, rx_info))
+		return -EINVAL;
+
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
 	ret = ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_info);
 	if (ret)
-		goto free_out;
+		return ret;
+
+	peer = ath12k_dp_peer_find_by_peerid(dp_pdev, rxcb->peer_id);
+	if (peer) {
+		struct ieee80211_sta *sta = peer->sta;
+
+		if (sta && sta->valid_links) {
+			int link_id;
 
-	rx_info->rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
+			link_id = ath12k_hw_get_rx_link_id(dp->hw_params,
+							   peer, rxcb, status);
+			if (link_id >= 0 && link_id < ARRAY_SIZE(sta->link))
+				link_sta = rcu_dereference(sta->link[link_id]);
+		} else if (sta) {
+			link_sta = &sta->deflink;
+		}
+	}
+
+	status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
+	*rx_status = *status;
+
+	ieee80211_rx_list(ath12k_pdev_dp_to_hw(dp_pdev), link_sta, msdu, list);
 
 	return 0;
 
-free_out:
-	return ret;
+free_frag_list:
+	while (frag_list) {
+		struct sk_buff *skb = frag_list;
+
+		frag_list = frag_list->next;
+		dev_kfree_skb_any(skb);
+	}
+
+	return -EINVAL;
 }
 
 static void
@@ -603,8 +594,8 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct ath12k_hw_group *ag = dp->ag;
 	struct ath12k_dp_hw_group *dp_hw_grp = &ag->dp_hw_grp;
 	struct ieee80211_rx_status rx_status = {};
+	struct sk_buff *msdu, *skb, *tmp;
 	struct ath12k_skb_rxcb *rxcb;
-	struct sk_buff *msdu;
 	struct ath12k *ar;
 	struct ath12k_pdev_dp *dp_pdev;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
@@ -612,6 +603,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct hal_rx_desc_data rx_info;
 	struct ath12k_dp *partner_dp;
 	u8 hw_link_id, pdev_idx;
+	LIST_HEAD(list);
 	int ret;
 
 	if (skb_queue_empty(msdu_list))
@@ -647,7 +639,8 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 			continue;
 		}
 
-		ret = ath12k_wifi7_dp_rx_process_msdu(dp_pdev, msdu, msdu_list, &rx_info);
+		ret = ath12k_wifi7_dp_rx_process_msdu(dp_pdev, msdu, msdu_list,
+						      &rx_info, &list);
 		if (ret) {
 			ath12k_dbg(dp->ab, ATH12K_DBG_DATA,
 				   "Unable to process msdu %d", ret);
@@ -658,7 +651,11 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 			dp->device_stats.sent_to_stack[ring_id][partner_dp->device_id]++;
 		else
 			WARN_ON_ONCE(1);
-		ath12k_dp_rx_deliver_msdu(dp_pdev, napi, msdu, &rx_info);
+	}
+
+	list_for_each_entry_safe(skb, tmp, &list, list) {
+		skb_list_del_init(skb);
+		napi_gro_receive(napi, skb);
 	}
 
 	rcu_read_unlock();

-- 
2.56.0


