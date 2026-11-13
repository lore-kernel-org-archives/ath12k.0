Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AE2606A32E
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a2y0o+0v;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SkwM4jnG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RNiq3/zE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jxL+WodpVWg29CSTzzs/MTzCYiWhhWEtVhmrBGaOtyk=; b=a2y0o+0v9SGcea
	sveu8v67ZZhS3yst7VJLrXYG41CGQlDATdAKS9VpZuEebs0CjqD/GbV7NHIvgLlf1vQHjT6L/Hx7U
	dxqElsrfwj2Ly/lrOxLdiwNGzo/kB/wEsK5NiFc7Ywq5YOrzb9qW2suZGoW6fjH3BeX1HE5nWgNzS
	SUww71xI/l+8ZBW/GXQ77ZM7xLh05v1fH0pKL/VM+KUwQPtd2Nd5iCgO8HgGz4atEklE7Db1dOqAw
	oAIoeZUMFicXHer6E4A1l747lk+Z4t4w8+8/h17ZxsH6IABdAehoY4G+332pW2Nvn71fJO9oJybI2
	ya+Ogd+mLHU0WFnTMoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdV-0000000DEt7-16Jy;
	Fri, 13 Nov 2026 14:52:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdP-0000000DEq3-3BZh
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 14:52:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJVLN3771889
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxL+WodpVWg29CSTzzs/MTzCYiWhhWEtVhmrBGaOtyk=; b=SkwM4jnGz1l25aDj
	u6mEmUBjfUuGcZiKXWcaSQp7cvHSxPzyzWDYmGCYNRsoaCDv7G0jJftkCHJibKsb
	TjcGbbjpsZMpgFyQ8+b+bEhV2hqnC8unFCMegfQYthtcK0P4XikhxHwraAdeQpdc
	QpOEFNtVc0tffbWCXk23HDT6S509GYI5Y8UZyLzGu3DSG2g/oDHhn940i1ShscaG
	YiCQ6broAihJPh45ESJBqzDcXfGQz35HL1pcInD2sLap8i5paKrkJeVaB/AVV6BO
	LxN1VBpEf/0hgaolBLrlc16cZeU6knnBd0zjVsBDp/Ioy0lErOB9gIFfxRtod7EG
	Bnfxtg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mt6xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso111010241.1
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 06:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581530; x=1795186330; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxL+WodpVWg29CSTzzs/MTzCYiWhhWEtVhmrBGaOtyk=;
        b=RNiq3/zEpmiCZmmb9omVJJknjEuc8f/rfT5Vs8k4UPCdRSA2bSl12VJbjLQPCJf6Lq
         MuYleeo53G3uUQiSYscKQjZtIACgebQ0K7OAQgym8IzAFn2h5EK/auFAJVIH/SLrk6vT
         zkEk6CS0LGdfjXdB84xeMy8Q79Crf0R8woWBBJWw0hX48Xq0Ipf3Y/mKceTp6fZO65zq
         sFtbLT6ERgqpavyMcS7J5UBqr47+UYXqP+zmuaW12vlYbNsKXIvISOtLLg6TCEfu0KZX
         yAJ5/OzOeKWePfqBWbgyrHyjdX1QffJVhYnGV0garq57pSyheic+tPWUxEv/pCsgEI4F
         SEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581530; x=1795186330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxL+WodpVWg29CSTzzs/MTzCYiWhhWEtVhmrBGaOtyk=;
        b=KOeoP3wUHRM4jeTfw+vTXXY9FkeB20yP3oN41Nu949VRXxwzVHrouB4pE1GWDuu/zE
         pIIGG76fnpjGVQ2kKrf2nclCDdyT8rKKDtVE7oTKLrrvstW38q7fnQyc97NbppdgJIbe
         2a+iFgwvW6azT2fInyzMQATobe8jKhFQKovMttFE/GR3x+KTrtiM8JJhAztm8wwku61o
         m2Zayxsw3IbmZjqBhk6ShdwiM5Nb15DvR9p3uP8NI4Hegt96tjnkZEDRbQdwtuxYM4XG
         q1dRZuEPbu5ZiJz24Ye+T7Ig1sAGlrFEY/Jj8PWsG9yMSlgr3s53/hlXFUN8d6ovKt6W
         cpnA==
X-Forwarded-Encrypted: i=1; AL+hErFIMeyxAbTxwaOEiVRL8DC5kUvCdPLpR2A59mPG61f9kcIqtFke/POJoXL+Kt4SQ51GjDKtuDg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9eIGkjTnQesyfLgnol/hBi/EMGSH3iTj7+Om6yoVnXkLcy5Cog
	AD+n/kcJP3IfnIinWmRN23J5MUvbtLR05pe9QpsZSZ1z+sBGW2JfZnXuFSJQQUzSlnIDeo/O1Nw
	I/uZJDfx36htDejyRnO4g4k3Eq1Hac15KMTUkCkVPr7bTaDSxCQD7AF1Eb5x+vgCi
X-Gm-Gg: AYBFou1KD4yLND59mTHOvhkNk0iwwa96VHz8KgqN7/yfBWcegV02GsbRLZmiTmARNYS
	fnCYDc23M5QS3EjDPBajHOtHm+WqNcsPtkJaEMr367ShB6QTifp8pg6BGiCM1nLAXl+XNg5rbdM
	lVoDmvwZB50oXHhItVgnjaKih+WbtzCM0Xkl4omO9nf/njJe3KoBoAYd1z154jQXIMMiHZvSmzz
	tWXYWvKKwDDsUZTJ4CtuqTdv3TaeePY8Sx8BPnRlgaaXfo+SCh5ooA+0n3NZf4JwDFinthhIR8B
	qKN7SpBkgJadqoAfvnJaf9pihtEwYQQ01UPE/WfM9W3YwsejS0vZ/KYIAvFavvsZeQxRiEZmyYL
	8RD/ZmaUwDxHgtjpJnb8yGivn/OUwf0sb01MaSQ4QH08GR91rqLjdDIQT9F3lig==
X-Received: by 2002:a05:6102:84c8:b0:7d0:6db8:dc43 with SMTP id ada2fe7eead31-7d64d76fcbbmr516606137.24.1794581529931;
        Fri, 13 Nov 2026 06:52:09 -0800 (PST)
X-Received: by 2002:a05:6102:84c8:b0:7d0:6db8:dc43 with SMTP id ada2fe7eead31-7d64d76fcbbmr516587137.24.1794581529205;
        Fri, 13 Nov 2026 06:52:09 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e294420sm151359195e9.9.2026.11.13.06.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:07 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:51:45 +0100
Subject: [PATCH ath-next v2 4/4] wifi: ath12k: use ieee80211_rx_list() to
 deliver packets to mac80211
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-4-46d186f8688b@oss.qualcomm.com>
References: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
In-Reply-To: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: BcW9A4stTgjtkm9vYO9kGd_nxoTj3LtD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX/CauIOqA74rf
 zGaEd2RLNH0Ud2ZzwpNB+hNG7zl8ivG1iRSTFDcRTCB7+NwnsXtpnCNOtrH7yHpQSbJpVis/z0H
 4naBBY9imotn0WE+UoSi2xoa2vYsMtAuoYBROOF2megTg8ZTXsw62f7j3p9ihfpy7WuxQ+Soo9H
 veSfQMCopioE+Xkte1wP6D0cP5Xi0Q3KuAi+wU2+wkQOq5vJ5Q7Om36kPkleLBRxU6p8jwJcJDd
 /CvJHQ88f7hgTGePiN94CIDGwsXDDusNk0w3Qhys7d/PVrNgDHyoe8eUXmG5tCq9FzD0c4+327n
 zwoV47bqgWiSWW5ep+e5wMKhTMoeX/i3VUfWmRjlkL0JxZKhIcGA7pn1pe9v0skTd345kf0zWoJ
 P34DuYWFIMpe1pK3Wmt59NOhm0SqvBn49SA1cceZvpcYvHG5aCyKEkD61AinHtqM/cEax3DjM6i
 TqHIlY/Beu5g1aXDrYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX7Rr/AyKpHBfT
 0uzmeGmpHjT86hx9E/cmPvBha6Ow8pUpwT2GhFlgFC+9gcG8SDcqxn9Cou/0jgqec/4nxc9jHTV
 2zMSwvvFs/pp9U88c5RaLh38Fm1jvEo=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af7241b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6kEX7mH1gwqfXXxvQscA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: BcW9A4stTgjtkm9vYO9kGd_nxoTj3LtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065211_842002_ED408E20 
X-CRM114-Status: GOOD (  23.75  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently the regular rx path hands MSDUs to mac80211 one by one through
ieee80211_rx_napi(), and MSDUs spread over multiple rx buffers
(MSDU_CONTINUATION) are first linearized by
ath12k_wifi7_dp_rx_msdu_coalesce(), which may require a
pskb_expand_head() reallocation.

Rework the receive path to collect processed frames on a list and
deliver them to mac80211 as a batch with ieee80211_rx_list(), feeding
the result to napi_gro_receive() once the received packets have been
processed. Delivering frames in batches improves the icache footprint
and lets GRO process more frames together.

While at it, drop the linearization for multi-buffer MSDUs: chain the
continuation buffers on the head skb with frag_list and deliver a single
(possibly non-linear) skb per MSDU, running the per-frame processing
(h_ppdu, h_mpdu, link station lookup and rx_status copy) only on the
head.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 257 +++++++++++++-------------
 1 file changed, 126 insertions(+), 131 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index f151f7de5554..c51faac4eb20 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -441,114 +441,28 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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
@@ -557,56 +471,131 @@ static int ath12k_wifi7_dp_rx_process_msdu(struct ath12k_pdev_dp *dp_pdev,
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
+	if (rxcb->is_continuation)
+		ath12k_dp_rx_desc_end_tlv_copy(hal, rxcb->rx_desc, lrx_desc);
 
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
+			int link_id = peer->link_id_map[rxcb->drv_link_id];
 
-	rx_info->rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
+			link_sta = rcu_dereference(sta->link[link_id]);
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
@@ -618,8 +607,8 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct ath12k_hw_group *ag = dp->ag;
 	struct ath12k_dp_hw_group *dp_hw_grp = &ag->dp_hw_grp;
 	struct ieee80211_rx_status rx_status = {};
+	struct sk_buff *msdu, *skb, *tmp;
 	struct ath12k_skb_rxcb *rxcb;
-	struct sk_buff *msdu;
 	struct ath12k *ar;
 	struct ath12k_pdev_dp *dp_pdev;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
@@ -627,6 +616,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct hal_rx_desc_data rx_info;
 	struct ath12k_dp *partner_dp;
 	u8 drv_link_id, pdev_idx, device_id;
+	LIST_HEAD(list);
 	int ret;
 
 	if (skb_queue_empty(msdu_list))
@@ -662,7 +652,8 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 			continue;
 		}
 
-		ret = ath12k_wifi7_dp_rx_process_msdu(dp_pdev, msdu, msdu_list, &rx_info);
+		ret = ath12k_wifi7_dp_rx_process_msdu(dp_pdev, msdu, msdu_list,
+						      &rx_info, &list);
 		if (ret) {
 			ath12k_dbg(dp->ab, ATH12K_DBG_DATA,
 				   "Unable to process msdu %d", ret);
@@ -673,7 +664,11 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
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


