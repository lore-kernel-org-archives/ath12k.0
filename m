Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7641FD7F6F
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKbt7yTaanLR6L8cws8tx4dbOl5KiX0XuRpCcJ6dhLM=; b=v861Hi+iTlrWtgwCo4eyalLjMJ
	s4nAWXWYsTGl/MHR2Izka9P7TXWDulkGk480SauCBejlXKGMQU2B73h934zD2lZHoldElWXARSKjk
	c+cKkMO3fM4Qi2/757pONEQYHOJvRW3bsTfSVK28wNbH1UmTCSZmT4cSmNKjeg0MpWzxrXjZJBqj1
	WqN328hNjfuW+ePdg5/B4bwEfNLJ7EXJnIgNDlMTYKuULRY+cnIZJAW9NFKEvoUFTcjOvvg4GrWSI
	kXYtDAHF3aj7Dyp40GV21XS7C5ZeTt81eiWeqhGujeEOkTHOAlAhtIRYreLv5GDLU8b5nhkK8oqms
	Qsjybs1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvEd-00000008FPa-1ef3;
	Fri, 27 Feb 2026 10:38:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvEb-00000008FP5-2RS4
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 10:38:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9chou2402979
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKbt7yTaanLR6L8cws8tx4dbOl5KiX0XuRpCcJ6dhLM=; b=NZt2KfrKaz+goiQy
	WWVDhH4UxyY/GvnQCIgqiYancgdtfmSQcHY7+Lm3l9rh4NvpHb7VcZHqD8QRyxk2
	dXBxPN6Sw5NiadDcwDBxhzvcCgrrqm6SXwgbI0nNxBrTpYcSVEIhDCGAhki38ITB
	ebxq6SMrQkbDVxwNKUQpejH9+LHqOor6nTTz+xKeg6GkIs4+wX2z1fHShPiAXKko
	nl5U+v8d0ay1gzmgCQPoNdzykav9QSA6a+0x2BL6Y/p07soURJP4aAj/GgYNlpYn
	pcVsW5RQLn3I7utJwhJ9U3eF7JB0a6G4z89Rk5Lc0nhoyZQbJCJPL1yfEp1iP2E3
	u7Fatg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw23adpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:38:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad5fec176so18117085ad.2
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 02:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772188691; x=1772793491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKbt7yTaanLR6L8cws8tx4dbOl5KiX0XuRpCcJ6dhLM=;
        b=bm9djJWCZIOSZdjuHH7rQClIDXhf45tH0rA8adSMVZC/6g37cAztMrYSG/23czsCed
         Prqsoma9Flcg20Z50dZTX5ofDr9nlOoxPfZom8JcP1fjjTGhNMfaJVypXxuO54Rbsnm+
         ZdzCZO0U+bNDdWeMfqba3e92FaHshKR2YQtRpDdM7BBPPyrzwkZKzJZxH+ItPjO6Z3PW
         PRMtTs4GLOBzMHVzISfIDZ5NbBu3TfA4LPZfGjAx5uVTJ5y3Ai4/pnA1cZB+9DL448Jq
         fp4KSc2WhxSQnbEtqhAzKTAciTIA9nFW9zq7lSyt4QWZJHInQ9+OjCy1TFKTnXpV8YlF
         dAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188691; x=1772793491;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKbt7yTaanLR6L8cws8tx4dbOl5KiX0XuRpCcJ6dhLM=;
        b=UJI3dj9s2ttj8s+68X764pDu2CyJWy6vQ0ckdsOqtLgaJkGn0SzR0bS+t/5gW067RF
         5Ay3j6jBwjUlRibLT4rfxezc+mB58qW2fnTxyl6GUeIgkDv01aABoWA2rHqLIkNHxY77
         ukLToLRPeFG5fUHwIOI/IAKqnAZGQElPu4+bFHNLt3gZC0y77IQhH4Dt/bK7mpkBzdKU
         dG3Ebi2WRxOmLtI7avnCH3Ed5Nbk0cthR5/cEG28MrI3DvTVICxHLnXf9TPww618hXgD
         xmvChalUw9jPcPuKuWoy2osviplp8WyQaL2upYH8+6vtosqOHIqZz5sdkTqvorRFn+Ee
         hwzg==
X-Forwarded-Encrypted: i=1; AJvYcCXBcPAZd9bGsw2rjsaXKUZwvFOWBIAESyTVCMeEJi9X21dBuQ3IndxVqmZQ00mBc5szvwqNTXc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyY3GjGIHGPMenwk2LhfQeefawRNREfI3wTalUyWIHN4kyW7Dj8
	HZaePWJwDFNCceRZgL+FmHbbZgUmU8DSrndtYgDD1FOMJWUR5rzu8vaLkN1SUy3haLoqDYfSzw3
	vxuxIA4e/iLn1eforqrH63P9r8TJyEY3xEZLMUa2TdquUKf1VS4LrxxODwx3/UuHi
X-Gm-Gg: ATEYQzyXGnigSpTBFoRP0IJYMfaqVgRe/Ftt9VXC0CWSsX8f23i99cDNDnSVGgnYOic
	farJybA1ceu94gp9jCmoXm27KvqUduDTF2QpBNlUYIROx5QOtncz9HFA6OJiK9lnXZSVCQIEnXN
	IYYtS/fLAvWTfkDWkr3mplfeycZ9AVZWhLe+BeVLw43Ngl8G+f2PH5F3ntDf5plYCmFYlPqYsYs
	BxAZAdwoJdOOV8HX/guwIBeJf0RABXZ8s8Zd+wutpeLuuy8e4t+uhfOH4+cznqaOKySjEVIgsIb
	jrKFHENy1T1BXWi3W/j+shmRrEKsqWFOBYXqGBNCi/lieLboR7GL0IrlkaN1FNtZzxmAL/2t17O
	WNjmh8rPjFSNT5SgyWtEKFswlaQz0sUCgzBZsBe456Clk38RFAN5eUIbIssRrczEoGiwNDgI3W6
	GXsxUXRyO1/2mKMrxijQ==
X-Received: by 2002:a05:6a21:9217:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-395c3b0dd7emr2123297637.41.1772188691528;
        Fri, 27 Feb 2026 02:38:11 -0800 (PST)
X-Received: by 2002:a05:6a21:9217:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-395c3b0dd7emr2123279637.41.1772188691052;
        Fri, 27 Feb 2026 02:38:11 -0800 (PST)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa801704sm4441519a12.19.2026.02.27.02.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:38:10 -0800 (PST)
Message-ID: <f667ddc5-0015-4970-8f9d-467f7165c962@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 18:38:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable monitor mode support on
 IPQ5332
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260227033332.687805-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260227033332.687805-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3kKFfw1Ju3Jz5uyleDl5s8nquqXWkAd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MSBTYWx0ZWRfX8gaBZCsbT2Wk
 EKtUEr4fhqUbpURRYM0ogbQCKwAPL5y90L1qZ2sOJOmypt3k3iTkRGRpMMJkiCEMX1bvv429gop
 BserTzP5LmnWNUyIn4pqjF3GLsC28+Eaxvur3hD5NIqAfePZCXywfff3vCEoCBw6Fg7wbBFZFUE
 W4aNJmPN5aEKS3hiEdgqJZ60DNQXExCU3QyVb2zIvOEl8RndQQHNkpen5+7n1P+2yvHN+qp2dsW
 u5a0S11aT796w3I0SA4VWxCQRxsbmOOUMIv8rVIJJteyk0LSxSPWscCVkFspRvV7hS9gGBfoVM4
 H3cHKQJP4KsSrY5BEApEayXkQQpXO75C22ckYY1m8t+Mkt26RdPL8Gx812k/+2ingAlfmcLHAAN
 fV/BKjxciEHDBnAiHOqheNM/rQKVZj8oPsBeIUBXmd7v09Oh2F3cB/J7/JwOmjz2FHm2s+S/5Ih
 Ta55XXUPKRrVpRBxyAg==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a17414 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RW0mjsVknEAIwFTJWnUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3kKFfw1Ju3Jz5uyleDl5s8nquqXWkAd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_023813_742129_E7BAC009 
X-CRM114-Status: GOOD (  15.59  )
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



On 2/27/2026 11:33 AM, Aaradhana Sahu wrote:
> Currently, rxdma1_enable and supports_monitor are set to false in
> IPQ5332 hardware parameters, which skips monitor ring configuration
> and removes NL80211_IFTYPE_MONITOR from the supported interface modes.
> 
> Set rxdma1_enable and supports_monitor to true so that monitor rings are
> configured and monitor mode is enabled on IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.7-00587-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index df045ddf42da..27acdfc35459 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -617,7 +617,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
>  		.svc_to_ce_map_len = 18,
>  
> -		.rxdma1_enable = false,
> +		.rxdma1_enable = true,
>  		.num_rxdma_per_pdev = 1,
>  		.num_rxdma_dst_ring = 0,
>  		.rx_mac_buf_ring = false,
> @@ -626,7 +626,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>  				   BIT(NL80211_IFTYPE_AP) |
>  				   BIT(NL80211_IFTYPE_MESH_POINT),
> -		.supports_monitor = false,
> +		.supports_monitor = true,
>  
>  		.idle_ps = false,
>  		.download_calib = true,
> 
> base-commit: 20ad0d58517073b3b683ff786c65dd3142321707

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


