Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16232FD45F9
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 01:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl1QbDI2+JWHspZXnzLzk/O8BOFPU/eDoUansuFH5dI=; b=GkDkYtdMOXBvk88xUgKgTQOUTB
	EbDz+b1bhWTRqqWDdkP/aW/mNUJCAF6ExPsg6UJ2byhpmFuQIyT2MSZoEBc6tIOv8HsYd9P6vqx0W
	zgAdCsL8Kscj2AieTtewDJbstNf95KztEUulY5bRauqPWgRKCK+8IEHc1Ypv0w/u945DGwNDROeAN
	ZDaKTgYeQVqbc1QZW41fhod0Txbt7YPJyGr9MyfCKqiwP7EtWCKXj74sFVhv9boww02T4a0PPgP3E
	cXu8h/cd7vf4UGYWFV96b6WLyACC0xiKJ+7Z28+MM9TeuUKHjlzYdfw93W85Diwm5MblvhjfIo25h
	77l9LzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQUG-00000005ChT-3CPo;
	Thu, 26 Feb 2026 01:48:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQUD-00000005Ch7-3PbX
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 01:48:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PJ4oXY2818472
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 01:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rl1QbDI2+JWHspZXnzLzk/O8BOFPU/eDoUansuFH5dI=; b=RDOzlmTedvUDGExE
	ILHmazNwAggxV1LVn+Cp0Vse7glxIS8Fbq4dPnQLkzRI3/dekwT+bR5y4kcpawMZ
	ShCr6HQNs9POIjLg8fSNI14EOh+BIdm22dvPYRDtTSsWwjpc5pZVGkRlp/lo3lMK
	0bMgTjPbsvxHmor9L5aoutjGIIW02MTzR2/Gt7V3KDT5MWeBeZ5XTUIKGDETC8Tl
	Fyfq+hr2uIgefOApeOarMISu7CxZ+WNZcC2FkPG/95eV3NLu8O4WTZvYsbtsKm1l
	4d/7hMu3fhsieA6LqAjdHUAmIskE4OeO5iBDHTuaV4rFfN95Snxc/ZDx6QpnoO98
	2zm86Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj55ssaf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 01:48:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso2803635ad.1
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 17:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772070495; x=1772675295; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rl1QbDI2+JWHspZXnzLzk/O8BOFPU/eDoUansuFH5dI=;
        b=Rc2W+TI0uW9vIbcKJPC0QdSBICuyy+jXKEDHfy+rTAwB6idrcF0FCbRwKN0zcZldZM
         BHbf3T+OQ055O0JkbVLGqkC8fuCWAhs+DuuQJpZZOJCk3UcHaxAxYYmgFc/rhlOkvvcI
         ush4qnh+jKgqigJPcOlhnz8AVhoaFdKmh5ajI1E601YG/xJh3Af0zFSvh0E/ARg9N2ho
         ubRHs49N9ZeimS8zldjUlUizWT62gaJ10vG9UxPVTOyPTyP8fKc5V7f7lN0vu2qM1nQa
         5YJQ00NxZZICXcPZpAByiiw9BieAYujmQRbYSRyLDof5Vbb4bo+20lWhnejIrKmRAPDz
         QxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772070495; x=1772675295;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rl1QbDI2+JWHspZXnzLzk/O8BOFPU/eDoUansuFH5dI=;
        b=K2UG7FF2HEFbuU/KuLImPVuvP+1g+eKZn7t0QB+B+GmR8fSy0gCTtdMlLVpRPoQ8G5
         Qlt3+HQCfu1jqSY04BaSaaaulmkT8vTvyZG+AKngxxS60KBprPmnX6uRGxLuHxgvdUDV
         SWjS1bPc69lVNp98qh1XS9SIOCOnb0gA3nPBfvF0f0PNjL67Xjs3i6cbISH5LEMcTQah
         gXaulWyOSQm0AG3qAqUPN+r/OOztprW7PtHBayDmKGuybT83w9R+8MqLOdK93uFlpfiu
         C0s8zR1LPZzQ7NgZHL4g/JmWOPguEWEtq4nxD4/KcSfsH9XNBIpIiHtDvCrGlSkeATCU
         Mevg==
X-Forwarded-Encrypted: i=1; AJvYcCWw7zDZuN/ccPxvG/V2WZZ/G3dDcI0iUbcJCKPeNzGossF5hzgfkwxxEebCRmDwPHQGlq+wNaA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4KC/+rN/+7Eblb4u44Yo27amXCQeVtlu1PWfAJkhp9FqbGOat
	m8sLMwk1JbmUDf+FldYKUbpdbNyHVvshJUzpwuOpiDejBWhTpbhSz6nR8+DK78PRoGStJ+Br3im
	NzoA4+d5mRgjFvDBIbdFT4PIZhwI+LeyDwcLQ9qzt0PAs4a8mOCuEP/OVebtXWm/O
X-Gm-Gg: ATEYQzxgtadstSQkHH05JqBQo1oCSXwB2RXJUYq4vZWRDyZqQnIhMzlT9ajOY1SChIs
	SBfeIhgpKZK0lGGWm4xdfCOov3yrsfd7NE3cP7zKZ/yvKGSNl7mO72PybCbWny9E3O5vRUq/1Ip
	J+BLWmZmQc05ViB5z0XA6qaBaDnQq5ztCXzuNHRmZZ6hCVxBh0ZpUETOf1d5UAAs84Ity/HDYuQ
	QRkwk05bqRcpQRknYYPRd7oABobIf76XFEtW074CZ2FSRVEcpfKrxL/Y2Bvrimtaab5/wOqziSc
	1JiZg7S9uF9ZGSr5IuYWjefk1mE5jEk+DbXIyWuwa5a2yjuLlzn768vy5DkxCGmrcOmPutzmZQj
	L2sLurR+aSoF23GdqPNNDggipF/eCbzFVh4d4ieeIdwDYjI11B3TCnuRuUlK2QhgBAOw93dsU2c
	h6P6lJNSLIjgqXjZob0hk=
X-Received: by 2002:a05:6a20:2d0e:b0:395:3677:675a with SMTP id adf61e73a8af0-395b48da4e4mr707474637.35.1772070494534;
        Wed, 25 Feb 2026 17:48:14 -0800 (PST)
X-Received: by 2002:a05:6a20:2d0e:b0:395:3677:675a with SMTP id adf61e73a8af0-395b48da4e4mr707434637.35.1772070493751;
        Wed, 25 Feb 2026 17:48:13 -0800 (PST)
Received: from [10.133.33.106] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa3756dbsm290210a12.0.2026.02.25.17.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 17:48:13 -0800 (PST)
Message-ID: <eca60324-aed3-4c97-a8ea-14aaf910543c@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 09:48:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix legacy rate mapping for
 monitor mode capture
To: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
References: <20260209054924.2713072-1-thiraviyam.mariyappan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260209054924.2713072-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxMyBTYWx0ZWRfX7VpHFWfFGtNO
 j7bzTJm1ZVUOMtakeayPdTOUzpSAA6VIX2Ajm/vCV/UDMH6c5ZJRHNePnHl8bO/Xq9B4OBrgCsk
 22kyPSYnMq5Q2AoHyzkN8bTcWdDJJs3S0bR+Pbbz1ECSynxuj79D3L2+yoBhT8uE94PIZtkU1yG
 wzixLB+KMCt3ASp21kB/f0QP2WO8qID+9M0c0rJhFvjvEBdKs7EqOTa5plgb+NKybGtBFFTa9Bb
 cZFklTW0fC9OaRWAosS4OZEMxf0cMg+K9u5rirEuVH23ogCh4ukceYWgrly4k4v/izldJEuEJ9P
 AgdkEF3iVTqCa6GKWTKpV4P2eqNj+JWUlOWdaMP5EM0tLYVl0040GHeceI/PnsBzURH8dkRBhPA
 zROYlfk9/MUvG6JaADrZzlnpk+kDuWhSRo4iwrBVqokfdr9l+E3xig7h1teJjqLsDQZnYXKnCfo
 XYZQMUXMnMsN0hr5Mvw==
X-Proofpoint-GUID: TNbQ1ineOqRAr7NEFmhqBOyRdrKbl4zr
X-Authority-Analysis: v=2.4 cv=JfGxbEKV c=1 sm=1 tr=0 ts=699fa65f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Xiczk5uq6A01BK9_cRwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: TNbQ1ineOqRAr7NEFmhqBOyRdrKbl4zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_174817_884409_83E37AAA 
X-CRM114-Status: GOOD (  28.84  )
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



On 2/9/2026 1:49 PM, Thiraviyam Mariyappan wrote:
> From: P Praneesh <praneesh.p@oss.qualcomm.com>
> 
> The current implementation incorrectly reports legacy CCK and OFDM rates
> in monitor mode radiotap headers. The rate field displays wrong values,
> for example showing 11 Mbps when the actual rate is 1 Mbps. This occurs
> because the HAL layer uses a unified enum for both CCK and OFDM rates
> without distinguishing between long/short preamble variants and proper
> rate mapping to hardware rate indices.
> 
> The root cause is threefold:
> 
> 1. The hal_rx_legacy_rate enum conflates CCK and OFDM rates into a
>    single enumeration, making it impossible to differentiate between
>    802.11b CCK rates (with long/short preamble variants) and 802.11a/g
>    OFDM rates.
> 
> 2. The L-SIG-B parsing function maps hardware rate values to the wrong
>    enum values. For CCK rates, it incorrectly combines long and short
>    preamble cases (e.g., cases 2 and 5 both map to 2 Mbps), losing
>    preamble information critical for proper rate identification.
> 
> 3. The mac layer's rate-to-index conversion function does not properly
>    handle the precedence between long preamble, short preamble, and
>    OFDM rates when matching hardware rate values.
> 
> Split the hal_rx_legacy_rate enum into two separate enumerations:
> hal_rx_legacy_rate for CCK rates with explicit long preamble (LP) and
> short preamble (SP) variants, and hal_rx_legacy_rates_ofdm for OFDM
> rates. This separation allows proper identification of rate types and
> preamble modes.
> 
> Introduce a new mapping ath12k_wifi7_hal_mon_map_legacy_rate_to_hw_rate()
> that converts HAL CCK rate enums to hardware rate indices defined in
> ath12k_hw_rate_cck. This ensures the rate field in ppdu_info contains
> the correct hardware rate index that matches the mac layer's expectations.
> 
> Update the L-SIG-B parsing to map each hardware rate value (1-7) to its
> corresponding CCK rate enum with proper preamble designation:
> - Cases 1-4: Long preamble (1, 2, 5.5, 11 Mbps)
> - Cases 5-7: Short preamble (2, 5.5, 11 Mbps)
> 
> Update the L-SIG-A parsing to use the new OFDM-specific enum values,
> maintaining the existing rate mapping for 802.11a/g OFDM rates.
> 
> Refactor the mac layer's ath12k_mac_hw_rate_to_idx() function to
> implement proper matching precedence:
> 1. First match OFDM rates using the IEEE80211_RATE_MANDATORY_A flag
> 2. Then match CCK short preamble rates
> 3. Finally match CCK long preamble rates as fallback
> 
> Add helper macros ATH12K_MAC_RATE_A_M and ATH12K_MAC_RATE_B to improve
> readability of the rate table initialization and ensure the mandatory
> flag is set for OFDM rates.
> 
> This fix ensures monitor mode captures display accurate rate information
> in the radiotap header, correctly distinguishing between 1 Mbps and
> 11 Mbps, and properly identifying preamble types for CCK rates.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/hal.h         | 31 +++++---
>  drivers/net/wireless/ath/ath12k/mac.c         | 51 +++++++------
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 76 +++++++++++++++----
>  3 files changed, 108 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
> index 43e3880f8257..bf4f7dbae866 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/hal.h
> @@ -268,21 +268,28 @@ enum hal_rx_reception_type {
>  };
>  
>  enum hal_rx_legacy_rate {
> -	HAL_RX_LEGACY_RATE_1_MBPS,
> -	HAL_RX_LEGACY_RATE_2_MBPS,
> -	HAL_RX_LEGACY_RATE_5_5_MBPS,
> -	HAL_RX_LEGACY_RATE_6_MBPS,
> -	HAL_RX_LEGACY_RATE_9_MBPS,
> -	HAL_RX_LEGACY_RATE_11_MBPS,
> -	HAL_RX_LEGACY_RATE_12_MBPS,
> -	HAL_RX_LEGACY_RATE_18_MBPS,
> -	HAL_RX_LEGACY_RATE_24_MBPS,
> -	HAL_RX_LEGACY_RATE_36_MBPS,
> -	HAL_RX_LEGACY_RATE_48_MBPS,
> -	HAL_RX_LEGACY_RATE_54_MBPS,
> +	HAL_RX_LEGACY_RATE_LP_1_MBPS,
> +	HAL_RX_LEGACY_RATE_LP_2_MBPS,
> +	HAL_RX_LEGACY_RATE_LP_5_5_MBPS,
> +	HAL_RX_LEGACY_RATE_LP_11_MBPS,
> +	HAL_RX_LEGACY_RATE_SP_2_MBPS,
> +	HAL_RX_LEGACY_RATE_SP_5_5_MBPS,
> +	HAL_RX_LEGACY_RATE_SP_11_MBPS,
>  	HAL_RX_LEGACY_RATE_INVALID,
>  };
>  
> +enum hal_rx_legacy_rates_ofdm {
> +	HAL_RX_LEGACY_RATE_OFDM_48_MBPS,
> +	HAL_RX_LEGACY_RATE_OFDM_24_MBPS,
> +	HAL_RX_LEGACY_RATE_OFDM_12_MBPS,
> +	HAL_RX_LEGACY_RATE_OFDM_6_MBPS,
> +	HAL_RX_LEGACY_RATE_OFDM_54_MBPS,
> +	HAL_RX_LEGACY_RATE_OFDM_36_MBPS,
> +	HAL_RX_LEGACY_RATE_OFDM_18_MBPS,
> +	HAL_RX_LEGACY_RATE_OFDM_9_MBPS,
> +	HAL_RX_LEGACY_RATE_OFDM_INVALID,
> +};
> +
>  enum hal_ring_type {
>  	HAL_REO_DST,
>  	HAL_REO_EXCEPTION,
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 6c534f0d59ce..035937dde5c6 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -164,30 +164,31 @@ static const struct ieee80211_channel ath12k_6ghz_channels[] = {
>  	CHAN6G(233, 7115, 0),
>  };
>  
> +#define ATH12K_MAC_RATE_A_M(bps, code) \
> +	{ .bitrate = (bps), .hw_value = (code),\
> +	  .flags = IEEE80211_RATE_MANDATORY_A }
> +
> +#define ATH12K_MAC_RATE_B(bps, code, code_short) \
> +	{ .bitrate = (bps), .hw_value = (code), .hw_value_short = (code_short),\
> +	  .flags = IEEE80211_RATE_SHORT_PREAMBLE }
> +
>  static struct ieee80211_rate ath12k_legacy_rates[] = {
>  	{ .bitrate = 10,
>  	  .hw_value = ATH12K_HW_RATE_CCK_LP_1M },
> -	{ .bitrate = 20,
> -	  .hw_value = ATH12K_HW_RATE_CCK_LP_2M,
> -	  .hw_value_short = ATH12K_HW_RATE_CCK_SP_2M,
> -	  .flags = IEEE80211_RATE_SHORT_PREAMBLE },
> -	{ .bitrate = 55,
> -	  .hw_value = ATH12K_HW_RATE_CCK_LP_5_5M,
> -	  .hw_value_short = ATH12K_HW_RATE_CCK_SP_5_5M,
> -	  .flags = IEEE80211_RATE_SHORT_PREAMBLE },
> -	{ .bitrate = 110,
> -	  .hw_value = ATH12K_HW_RATE_CCK_LP_11M,
> -	  .hw_value_short = ATH12K_HW_RATE_CCK_SP_11M,
> -	  .flags = IEEE80211_RATE_SHORT_PREAMBLE },
> -
> -	{ .bitrate = 60, .hw_value = ATH12K_HW_RATE_OFDM_6M },
> -	{ .bitrate = 90, .hw_value = ATH12K_HW_RATE_OFDM_9M },
> -	{ .bitrate = 120, .hw_value = ATH12K_HW_RATE_OFDM_12M },
> -	{ .bitrate = 180, .hw_value = ATH12K_HW_RATE_OFDM_18M },
> -	{ .bitrate = 240, .hw_value = ATH12K_HW_RATE_OFDM_24M },
> -	{ .bitrate = 360, .hw_value = ATH12K_HW_RATE_OFDM_36M },
> -	{ .bitrate = 480, .hw_value = ATH12K_HW_RATE_OFDM_48M },
> -	{ .bitrate = 540, .hw_value = ATH12K_HW_RATE_OFDM_54M },
> +	ATH12K_MAC_RATE_B(20, ATH12K_HW_RATE_CCK_LP_2M,
> +			  ATH12K_HW_RATE_CCK_SP_2M),
> +	ATH12K_MAC_RATE_B(55, ATH12K_HW_RATE_CCK_LP_5_5M,
> +			  ATH12K_HW_RATE_CCK_SP_5_5M),
> +	ATH12K_MAC_RATE_B(110, ATH12K_HW_RATE_CCK_LP_11M,
> +			  ATH12K_HW_RATE_CCK_SP_11M),
> +	ATH12K_MAC_RATE_A_M(60, ATH12K_HW_RATE_OFDM_6M),
> +	ATH12K_MAC_RATE_A_M(90, ATH12K_HW_RATE_OFDM_9M),
> +	ATH12K_MAC_RATE_A_M(120, ATH12K_HW_RATE_OFDM_12M),
> +	ATH12K_MAC_RATE_A_M(180, ATH12K_HW_RATE_OFDM_18M),
> +	ATH12K_MAC_RATE_A_M(240, ATH12K_HW_RATE_OFDM_24M),
> +	ATH12K_MAC_RATE_A_M(360, ATH12K_HW_RATE_OFDM_36M),
> +	ATH12K_MAC_RATE_A_M(480, ATH12K_HW_RATE_OFDM_48M),
> +	ATH12K_MAC_RATE_A_M(540, ATH12K_HW_RATE_OFDM_54M),
>  };
>  
>  static const int
> @@ -732,11 +733,17 @@ u8 ath12k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
>  		if (ath12k_mac_bitrate_is_cck(rate->bitrate) != cck)
>  			continue;
>  
> -		if (rate->hw_value == hw_rate)
> +		/* To handle 802.11a PPDU type */
> +		if ((!cck) && (rate->hw_value == hw_rate) &&
> +		    (rate->flags & IEEE80211_RATE_MANDATORY_A))
>  			return i;
> +		/* To handle 802.11b short PPDU type */
>  		else if (rate->flags & IEEE80211_RATE_SHORT_PREAMBLE &&
>  			 rate->hw_value_short == hw_rate)
>  			return i;
> +		/* To handle 802.11b long PPDU type */
> +		else if (rate->hw_value == hw_rate)
> +			return i;
>  	}
>  
>  	return 0;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> index bd741532b7dc..074df2ab6bbf 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> @@ -405,6 +405,42 @@ ath12k_wifi7_dp_mon_hal_rx_parse_user_info(const struct hal_receive_user_info *r
>  	}
>  }
>  
> +static __always_inline u8
> +ath12k_wifi7_hal_mon_map_legacy_rate_to_hw_rate(u8 rate)
> +{
> +	u8 ath12k_rate;
> +
> +	/* Map hal_rx_legacy_rate to ath12k_hw_rate_cck */
> +	switch (rate) {
> +	case HAL_RX_LEGACY_RATE_LP_1_MBPS:
> +		ath12k_rate = ATH12K_HW_RATE_CCK_LP_1M;
> +		break;
> +	case HAL_RX_LEGACY_RATE_LP_2_MBPS:
> +		ath12k_rate = ATH12K_HW_RATE_CCK_LP_2M;
> +		break;
> +	case HAL_RX_LEGACY_RATE_LP_5_5_MBPS:
> +		ath12k_rate = ATH12K_HW_RATE_CCK_LP_5_5M;
> +		break;
> +	case HAL_RX_LEGACY_RATE_LP_11_MBPS:
> +		ath12k_rate = ATH12K_HW_RATE_CCK_LP_11M;
> +		break;
> +	case HAL_RX_LEGACY_RATE_SP_2_MBPS:
> +		ath12k_rate = ATH12K_HW_RATE_CCK_SP_2M;
> +		break;
> +	case HAL_RX_LEGACY_RATE_SP_5_5_MBPS:
> +		ath12k_rate = ATH12K_HW_RATE_CCK_SP_5_5M;
> +		break;
> +	case HAL_RX_LEGACY_RATE_SP_11_MBPS:
> +		ath12k_rate = ATH12K_HW_RATE_CCK_SP_11M;
> +		break;
> +	default:
> +		ath12k_rate = rate;
> +		break;
> +	}
> +
> +	return ath12k_rate;
> +}
> +
>  static void
>  ath12k_wifi7_dp_mon_parse_l_sig_b(const struct hal_rx_lsig_b_info *lsigb,
>  				  struct hal_rx_mon_ppdu_info *ppdu_info)
> @@ -415,25 +451,32 @@ ath12k_wifi7_dp_mon_parse_l_sig_b(const struct hal_rx_lsig_b_info *lsigb,
>  	rate = u32_get_bits(info0, HAL_RX_LSIG_B_INFO_INFO0_RATE);
>  	switch (rate) {
>  	case 1:
> -		rate = HAL_RX_LEGACY_RATE_1_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_LP_1_MBPS;
>  		break;
>  	case 2:
> -	case 5:
> -		rate = HAL_RX_LEGACY_RATE_2_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_LP_2_MBPS;
>  		break;
>  	case 3:
> -	case 6:
> -		rate = HAL_RX_LEGACY_RATE_5_5_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_LP_5_5_MBPS;
>  		break;
>  	case 4:
> +		rate = HAL_RX_LEGACY_RATE_LP_11_MBPS;
> +		break;
> +	case 5:
> +		rate = HAL_RX_LEGACY_RATE_SP_2_MBPS;
> +		break;
> +	case 6:
> +		rate = HAL_RX_LEGACY_RATE_SP_5_5_MBPS;
> +		break;
>  	case 7:
> -		rate = HAL_RX_LEGACY_RATE_11_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_SP_11_MBPS;
>  		break;
>  	default:
>  		rate = HAL_RX_LEGACY_RATE_INVALID;
> +		break;
>  	}
>  
> -	ppdu_info->rate = rate;
> +	ppdu_info->rate = ath12k_wifi7_hal_mon_map_legacy_rate_to_hw_rate(rate);
>  	ppdu_info->cck_flag = 1;
>  }
>  
> @@ -447,31 +490,32 @@ ath12k_wifi7_dp_mon_parse_l_sig_a(const struct hal_rx_lsig_a_info *lsiga,
>  	rate = u32_get_bits(info0, HAL_RX_LSIG_A_INFO_INFO0_RATE);
>  	switch (rate) {
>  	case 8:
> -		rate = HAL_RX_LEGACY_RATE_48_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_48_MBPS;
>  		break;
>  	case 9:
> -		rate = HAL_RX_LEGACY_RATE_24_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_24_MBPS;
>  		break;
>  	case 10:
> -		rate = HAL_RX_LEGACY_RATE_12_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_12_MBPS;
>  		break;
>  	case 11:
> -		rate = HAL_RX_LEGACY_RATE_6_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_6_MBPS;
>  		break;
>  	case 12:
> -		rate = HAL_RX_LEGACY_RATE_54_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_54_MBPS;
>  		break;
>  	case 13:
> -		rate = HAL_RX_LEGACY_RATE_36_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_36_MBPS;
>  		break;
>  	case 14:
> -		rate = HAL_RX_LEGACY_RATE_18_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_18_MBPS;
>  		break;
>  	case 15:
> -		rate = HAL_RX_LEGACY_RATE_9_MBPS;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_9_MBPS;
>  		break;
>  	default:
> -		rate = HAL_RX_LEGACY_RATE_INVALID;
> +		rate = HAL_RX_LEGACY_RATE_OFDM_INVALID;
> +		break;
>  	}
>  
>  	ppdu_info->rate = rate;
> 
> base-commit: 2c1ba9c2adf0fda96eaaebd8799268a7506a8fc9

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


