Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3CFCD98ED
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pp3Uk0k/hYv7bLf1WuLS440HbLEWQGU3+m2R2+M1BZI=; b=EUMT2wews2aapSq1r3tIobh+yn
	RiKzodP82NbfvYof8HoiJN4yBugqmLi+7BjcD1qNq15cJ43rW4iOIxAWkncddBfOsy7vcg9lveKzz
	l9XAHmuc3esq2vjwaKYpRDGirf6TaY8fBHwrlIQtTPD4tWJGFJ5d2rCq0F9avr0i5B8pbFfY1IFig
	3Bb45sdDA8eNctB704dkIKcWKUTd7WUFynVAcWbgvlEiWyO0NSNLcY0PyIAA/77mFVJR3Izhp3nkg
	BDPCftmRhaIougs5pzYsZAEd4WwRb3d5D3l5wCSXloH1BysvcOdUyxYoe1ywl3hhlq9pmjlUL9nfW
	YmEKucVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8ob-00000000uQz-0JOU;
	Thu, 18 Jun 2026 09:13:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8oY-00000000uQW-0tlC
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 09:13:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G2ht1253284
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pp3Uk0k/hYv7bLf1WuLS440HbLEWQGU3+m2R2+M1BZI=; b=nkPtvtMuwab0Ggeq
	DnQD5qI3a2BJYOf2E7FkGsb15asBARDWV+rLqOGCf3jF45rLpU3I4ZQqw/IOmE7h
	0hfJwzUzVf+tnrjMbS2pHHazAthB5ghgdCu60AW+2vTUWbseTsleOPgdPtB9pp3M
	16Lm8GxVyrJf8xfYpE4PY4ZSubPtiOWGGFsw2WWcRLN8nrjULtqmZzoFQdj8r8gc
	hIAs09g0e51WBmMAuNHrMZJ1EligUvKDwPrE7sTVRqfOPjThdTAWpylw46e/kF8X
	D/X0orsqF8gwKYp/gBF3OhTNcbOgSftRKlnctWe81qcOwO9zTC8Cf6ColyyIw77S
	tpFOLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7jxq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:13:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6bbd0afffso17485335ad.0
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 02:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774012; x=1782378812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pp3Uk0k/hYv7bLf1WuLS440HbLEWQGU3+m2R2+M1BZI=;
        b=knQl2jkT7L3RBTVVce1NunpWoIIbNs7msJq9k25Hefy6oWQmFQZFqFBZz38BorBpgx
         IxEEoXqu5va86CK4xJyEbiS5ZslYLZJ27TipXQ9mdr8nX9UcH2W/ec3tuB8is8IY7x8j
         uvZCcviAYomAfjRy/cxGmdWPiNHtgUSQVISEvbI5G12A7aKomyH/E+e7ViYHgRulY4Ou
         yS63/jtAoCpvi45JkGp+sVZyZXof+J8jtcUR7buNGez8J6Uo6vaET3PJeYApa2fK22ay
         5mNhyB+xCKl4/akDFDXD9l+0rA8/PHlhfxZa+aZSnjw7wM0CG+jJxM1ymymgNBVdANwq
         VICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774012; x=1782378812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp3Uk0k/hYv7bLf1WuLS440HbLEWQGU3+m2R2+M1BZI=;
        b=rSgXOVSfnWRAe3bsxBLLhYpr069s/aQKn26iCboUPrTjSZ8BmlKcc3E4N98SluDHhU
         FPUXrLTg46jUNuvAqzQuqj6g38QD9MYfLqfcaBMGOzb3qq6L8qXfR7qxJWVFm4/6YQ/L
         mKMx92HhC3EtsX/iWaEmZKsPFbSY+bzZx6rDHtlJMOoXg8M6AbXjhQ/PIvsdQ/syHfaY
         NSAUV4fUz+gTbOvPfiGPCWb7u8fDRuKdEpV4rqYbodm2BHP16W3gWkXpITJlfyf8wMzq
         gPSEkhUpMdnrDNiTnfvu/ldTUCBtWVXdxBh1del6W3gwdbZ3B2KLhWdkrfSSme8xncmo
         3hNw==
X-Gm-Message-State: AOJu0YxJuQqYA4qqWobOG0oW5r++6DAE3241LAKnaxBrGhC+EnH8Aepf
	A0cGM9CHjXnUPrYU6Jj9t8Rjw0m9dOfY3yiWE6ayid+Odlhkvf/wYAg02wO7GpQx/JH1z9BF713
	QSBl5wCGQZgoPWPqgv1JWsuC3Flgj9Yd7636jtRjjglvq2FaE9kfV8VacKPjuk1qQeZXF6Ub3
X-Gm-Gg: AfdE7cljaHEKDBguX/c/JGcKiVa1Yfr3lXKoVDDCOo0vdlH6PdlJQ2ZY/tr+QStFF0z
	utCsDyx0nHD5S+hhIuBmemn125VvhkA8AaFEt/cifUOhuVusHGMr7Ndwv5BEKIh4EFesLVXHFao
	qrJoC3DKlx5ZWqWSTKN6vUulaZYisqzXHDzHbdbcg4BktdXa0gxFrc58Q9+CNuK0ZajrNthZcxo
	7ZCt9MtIiANQpzn/+mrBH0LXFiQM/9J7xPCRXZw0ROgzTDSjThDqAp/IawKGuGNXtlYYfMmVnKV
	UsrAaQoEXLJ3Prbd9hYWS1O9wzZS5w6i2oxmsTrKHSRVqwaZDYw4DKnMr9HiFTPkQ4O4vWCRhaK
	dagC5GD4j6vNz9WAbIaqI+USWFabFy3LkGFjS1isdWlWV1yfQDbpuSIJMhd4=
X-Received: by 2002:a17:902:ef43:b0:2c6:d5da:838d with SMTP id d9443c01a7336-2c6d5da84cdmr48324715ad.33.1781774011886;
        Thu, 18 Jun 2026 02:13:31 -0700 (PDT)
X-Received: by 2002:a17:902:ef43:b0:2c6:d5da:838d with SMTP id d9443c01a7336-2c6d5da84cdmr48324355ad.33.1781774011395;
        Thu, 18 Jun 2026 02:13:31 -0700 (PDT)
Received: from [10.137.71.130] ([106.197.93.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432f77479sm191501365ad.63.2026.06.18.02.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:13:31 -0700 (PDT)
Message-ID: <aa5e214f-2d9e-4c97-b45f-7181c81cf023@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:43:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/5] wifi: ath12k: add HAL ops for monitor TLV
 header decode and alignment
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
 <20260509025819.1641630-4-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260509025819.1641630-4-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NSBTYWx0ZWRfXwK5gH6AsMdKc
 5GhMzhJ/FEBTYnfUrQ4N11O9M6H8ASBz/W3roSqASm6fIM0mcjo/lqQEvat3tQxu9ZyH46pylfP
 WTaudHb6xIvXO+xB/tZCs0MyKMVxiAt5NAOxL8wbrK00EQpjqOKzzBOMFPK1SsdEjIjDkYkUdAW
 YA3dBMDNY3BumHqIoV+lCGcCCe6I17Zbbyko3SvOMhqGh9cz2JcnB4SfS00qo9VPV5CSXCQ3l2X
 osmiDodC5OzHzX7WfPI7hlnfkdXMVazmd15+CjIguJ+2p1OaCjqM7CGMgk1z0uRKbeRGcFsmo5H
 Soa0WwkugubkeXJGUiZt2JVPW3FJoPUaXr3Ktk44S2yhj4EXZbmOrSFAp5RAb6JQe0J4I0vUA0a
 r8h1sEGoPhMUXPvvgw7dB2joDQU++GwtsavAat+aacWxxAnbbXnG0sRn5MGARUMQs5nRlVI3w80
 WgIeKMiJvLJ9VzxvoQw==
X-Proofpoint-GUID: UJruEvTjgxGtzWlQfkZzGs0otVLggNDe
X-Proofpoint-ORIG-GUID: UJruEvTjgxGtzWlQfkZzGs0otVLggNDe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NSBTYWx0ZWRfXz7pdAkTjn0j9
 wD9gXOY/d0HUsryedKrLRygRtZLrlBe2herZEcp2z5BWr10i95b3P41+WsIUhkAdNZojFeUmgr0
 yq+NOAAcLEMJ9mTBKOlRwiIK6bh6AX8=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33b6bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=wlpA7Av3g41Jdys7FXR3eg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=T2WGhnzAuiY_ZRgizcIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_021334_372735_5A2FB871 
X-CRM114-Status: GOOD (  17.99  )
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



On 5/9/2026 8:28 AM, Miaoqing Pan wrote:
> Wi-Fi 7 monitor RX status TLV parsing needs to decode TLV headers and
> advance the pointer with the correct header alignment. Different targets
> use different TLV header layouts (32-bit vs 64-bit), but the HAL ops for
> dp_mon RX status header decode and header alignment were not populated
> for all wifi7 targets.
> 
> Add dp_mon RX status TLV header decode callbacks and TLV header alignment
> helpers to the wifi7 HAL ops for QCC2072, QCN9274 and WCN7850. Export
> helpers to query the required TLV header alignment for 32-bit and 64-bit
> TLV headers so the caller can align the TLV walk correctly across targets.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/hal.c               | 12 ++++++++++++
>   drivers/net/wireless/ath/ath12k/hal.h               |  4 ++++
>   drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c |  2 ++
>   drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c |  2 ++
>   drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c |  2 ++
>   5 files changed, 22 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index d940f83cd92f..c0c3d2f047ef 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -875,3 +875,15 @@ void *ath12k_hal_decode_tlv32_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid)
>   	return tlv32->value;
>   }
>   EXPORT_SYMBOL(ath12k_hal_decode_tlv32_hdr);
> +
> +u32 ath12k_hal_get_tlv64_hdr_align(void)
> +{
> +	return HAL_TLV_64_ALIGN;
> +}
> +EXPORT_SYMBOL(ath12k_hal_get_tlv64_hdr_align);
> +
> +u32 ath12k_hal_get_tlv32_hdr_align(void)
> +{
> +	return HAL_TLV_ALIGN;
> +}
> +EXPORT_SYMBOL(ath12k_hal_get_tlv32_hdr_align);
> diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
> index 3158c1881c76..312993d3d5d4 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/hal.h
> @@ -1439,6 +1439,8 @@ struct hal_ops {
>   					 u8 *rbm, u32 *msdu_cnt);
>   	void *(*reo_cmd_enc_tlv_hdr)(void *tlv, u64 tag, u64 len);
>   	u16 (*reo_status_dec_tlv_hdr)(void *tlv, void **desc);
> +	void *(*mon_rx_status_dec_tlv_hdr)(void *tlv, u16 *tag, u16 *len, u16 *usrid);
> +	u32 (*get_tlv_hdr_align)(void);
>   };
>   
>   #define HAL_TLV_HDR_TAG		GENMASK(9, 1)
> @@ -1553,4 +1555,6 @@ void *ath12k_hal_encode_tlv64_hdr(void *tlv, u64 tag, u64 len);
>   void *ath12k_hal_encode_tlv32_hdr(void *tlv, u64 tag, u64 len);
>   void *ath12k_hal_decode_tlv64_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid);
>   void *ath12k_hal_decode_tlv32_hdr(void *tlv, u16 *tag, u16 *len, u16 *usrid);
> +u32 ath12k_hal_get_tlv64_hdr_align(void);
> +u32 ath12k_hal_get_tlv32_hdr_align(void);
>   #endif
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
> index c0583c3a2191..80ffadc47d48 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
> @@ -490,6 +490,8 @@ const struct hal_ops hal_qcc2072_ops = {
>   	.rx_reo_ent_buf_paddr_get = ath12k_wifi7_hal_rx_reo_ent_buf_paddr_get,
>   	.reo_cmd_enc_tlv_hdr = ath12k_hal_encode_tlv32_hdr,
>   	.reo_status_dec_tlv_hdr = ath12k_hal_reo_status_dec_tlv_hdr_qcc2072,
> +	.mon_rx_status_dec_tlv_hdr = ath12k_hal_decode_tlv32_hdr,
> +	.get_tlv_hdr_align = ath12k_hal_get_tlv32_hdr_align,

ops get_tlv_hdr_align() seems unused, may be patch 4/5 is supposed to
used this ops instead of removing the alignment?

Vasanth

