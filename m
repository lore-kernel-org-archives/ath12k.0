Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCECDCD98E1
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 05:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgI+Cd0eSg5v7nwjX9kRNWHWUjEtqaXIcA4x0uTN1TY=; b=2oWZHLqz4zPPm5XRs72NPfZZBH
	PWMlib/dDqg4DWpfqXcbNEnKO2U3rADywoCcU/rBBn65sLMZWcegiVMqpWHldVIYksthNM15sOTch
	835TjfCPQ4itJ9tOxGQEk3rYdHzuUaD3hmTUIgqwlXI+Ma6vmKzXnEJlLPCGLpVrjj960cKoP2EcN
	kiZC57OOe8j8cOtiEXq0TUHMzRlzBBTyUgpnd6yCs/yFq8UQ6XhwmJgqpFcks3NOcXi5UEUR6avJb
	IjyWobZyG9SJ6XdWz8TIy+af+MIXv323GIUJfAlXTypqdA/si7g/SVp8TTjGAkzcrzEFpGPYOkEwL
	oREb2BrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZiQu-0000000GdES-1tUs;
	Wed, 17 Jun 2026 05:03:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZiQr-0000000GdE5-3nCR
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 05:03:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H4kuDh1768453
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 05:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgI+Cd0eSg5v7nwjX9kRNWHWUjEtqaXIcA4x0uTN1TY=; b=J+3stysHJ5gd8CKX
	J/jMfx8SpS/LqbunMC0hbI+Hb4E8g3sk4lQs9ggvIlqcXda/yQp7ife+e2oDepbq
	AzDrfcpq9Oz7kh/TSVmw5e4krGlsG20d26+xiu5cH3arFBjXJXGhZK31mfxrxVl7
	Eqn+VoN+TMioBOMV+P59epyAVyGCCLKD3i6rW0+trIf6vjTl/ps3xjVFq1Pqt+qj
	LZnP/LZgGsSSFMCbkReIZmCwPcAlTZ2Ntn3GUXAh26KJojHq+pNNcT8LkE9NTVL6
	/I+2EJcfn/IMyLoiXLUQqmkZKnGSyaUmsHLsgdRAGE+y3iw4E5xLeMAJIW2c0ZUA
	ZqhRqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef29frb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 05:03:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6b4271491so5298605ad.2
        for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 22:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781672599; x=1782277399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgI+Cd0eSg5v7nwjX9kRNWHWUjEtqaXIcA4x0uTN1TY=;
        b=alIjt3jOO3dnQ/wb11MhRnLzTgTIvy4/AmXV/EdXOvMJPifqxRwx1ZF8E8BScFVDJG
         RuRGbCnBQDpOSrQGST7eUo68eCGqY6a8z82ms8aHwITZn3qaD/OS9yMnOvpn7XE8upOG
         1OzHihS2j0TP492bhMr66wwN4hQbU5O4jTTNgbt8QsNYWgRQaugtHRNkVRA8VlbgM2Ut
         e+2mQ9X1STZbKbzrOrTWY3DdU3DxElFw3sFEudh7ryseBSIAc3JPWrnPugUs9AX2mXIe
         eoNNEzu01URf4mRFn+yIni7hwL2POIHOPLzrFgUlPNLX4+lSbMCfciBg99uUh9qAsWl0
         xXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781672599; x=1782277399;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgI+Cd0eSg5v7nwjX9kRNWHWUjEtqaXIcA4x0uTN1TY=;
        b=fCtiKxQ9U4zi5CYq3Z+lacisf7eZ/UbececXhCfADAMxolNjxl3+1AgibpN0+4yTpl
         OU9Nse1MBHtnhQbmLz+1JZ5JzEidu/9IUEk01qkg6Mg28DvhOmW6fdeQ3/GOXymMXfp6
         yogt9OKFxvEwTQKFilRWmfHMXr/zA7xhG6uqf/WHeeGaPlxQNifpTx6BsDUB4unfnek5
         Z5hntpLU+aABgk3iEm7rULR2DB/EZLH8hlx9jBK7GrR4KzH842KjBrakpSvHnY008MAD
         Mzj3ko+PmrV1A/+L4tZEwWWloHqGuFm6zlLUSC6dnExbAyATqD4hmwWqgmadb3VT+/E9
         8wSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jm7hJRufmUkb4IFI7Feq/WP4YYlmtI7tGGv7wTuMoPdIr8Q9TeJzN12dMqVC0wozJG32W+aE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxceowswP/B6aVS/pE28yRvENUuVmbKdpvOEAgKf5jYvsCDX4/D
	WsIiApnkkIsBCDmqBriLxY/ZLcG+y8zGT3hSjzqIcyXQ4mQ4gP0RqP60w59OgysJ9WcFrO5AMj6
	e54hSQFkzXsRtnAv8sf1llO7qvS/in3PqpE5WY4bN8tHItH2YyZgJbkJVWwV9DRIY
X-Gm-Gg: AfdE7clG6FuzfRtfghWy7A0iLHgcXxHt9VIG/5kTFSa4tsk4aaaUHpy53xfd4/i4toM
	GHIAvSRktpoh3LCT6J9D9HyhdQT9RSWylHv53CpyOlbWd2d0ORIBr2+gajTefdIPv0cIySTNiok
	I0HMv+/x8JNOEM0RsuFEXLO9UwvQPc8mAfV/ZMsCVRga2SETXItZoPQr2sIcEDNCHzdwkx1bJtw
	pTMQF8mtct2WxXwq4GeXJdqV0OHHoOzn43F6X+GIUUJNgV4xd3851NmbjSXktG28/G19Cw1Q+hB
	ILOG6IRW+3O9IHuHGDrOnFiLr6bU1B/sa9sXxgHq39zZQXeN8sgs06JuuNDKEmQ9zBXHQndOlOe
	+OEPsYPqsaa2D+2J7FnpaWi4QTyWGSWPQPoHHiyoofKmYpuAn+ro=
X-Received: by 2002:a17:903:1b4d:b0:2c6:9358:3ad5 with SMTP id d9443c01a7336-2c6bc20f6d4mr23015815ad.17.1781672599138;
        Tue, 16 Jun 2026 22:03:19 -0700 (PDT)
X-Received: by 2002:a17:903:1b4d:b0:2c6:9358:3ad5 with SMTP id d9443c01a7336-2c6bc20f6d4mr23015515ad.17.1781672598711;
        Tue, 16 Jun 2026 22:03:18 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43336937fsm152362095ad.72.2026.06.16.22.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 22:03:18 -0700 (PDT)
Message-ID: <3fb00a3b-2092-43d2-a8f8-9f934505dcee@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:33:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260611084422.1511513-1-nico.escande@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260611084422.1511513-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a322a98 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=0TnLR4_Wa9VIDZeikcEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0NCBTYWx0ZWRfX7N28NxSVBf9p
 x7WlfCO4kY9BHtUkJ1EgVIyczDZMb7+8njf7tByjPiK4YIbQTu88o4oKc94m/1LRbE5q9WjgInI
 6rGRLzW+jJZlqAmWb4d7eEJbpTFLP6s=
X-Proofpoint-GUID: RRKxxRAfubmJgiJvuwZWIfatRJYdIvog
X-Proofpoint-ORIG-GUID: RRKxxRAfubmJgiJvuwZWIfatRJYdIvog
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0NCBTYWx0ZWRfX5V0h91PbyDmr
 ew+Romlomt9jBul7FHlRTTjmEIRxGJPnoYB2TPIq/y2x2i3R2vQnoEXz7rgpXqdhT/Q0GOhRB0/
 8cdlU3ZSyjqWPUIHKzY0Cb8/goy5uLpLF5I5tpcmUjDZju07+i5Re2UNuAWpCHxJ5gNj/lqVNHo
 jHYHrvM3qptrlKr0YY7IlOeDkLM0Iytqam6cqE13qiAsjBPTBVGDWkHVLzow/6MdPeAHZ0/2M1C
 P7bSvGPm3v5TDBGoQpLhuNzj0FCCn8ZX3xeqeDXAIFusgXfnp58Af9iKAKrw9408uS0Uc2AEMgZ
 t0tuksnQvVf+FPeudr7qLhjZn8rUNrPlUA9LRyX2cngKdp83wk9X/p9ZF8259h606Mf5/HhS6ty
 lpmetCkWptmS+0MkW8G5b5Bd1BDgeBcfQ720JUFq8QTAkQm3pvDU9hXCl/B/niN5wX64t84Dbvx
 1jSStW9HLS38Np6wdEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_220322_147069_E8A9178D 
X-CRM114-Status: GOOD (  26.84  )
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

On 6/11/2026 2:14 PM, Nicolas Escande wrote:
> On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
> realated features on the 5GHz band while it should not:


s/realated/related

> 
>      Wiphy phy1
>      [...]
>          Band 2:
>      [...]
>              EHT Iftypes: managed
>      [...]
>                  EHT PHY Capabilities: (0xe2ffdbe018778000):
>                      320MHz in 6GHz Supported
>      [...]
>                      Beamformee SS (320MHz): 7
>      [...]
>                      Number Of Sounding Dimensions (320MHz): 3
>      [...]
>                  EHT MCS/NSS: (0x22222222222222222200000000):
> 
> This is also reflected in the beacons sent by a mesh interface started on
> that band. They erroneously advertise 320MHZ support too.

s/320MHZ/320MHz

> 
> This should not happen as the spec at section 9.4.2.323.3 says we should

Reword the spec citation to: IEEE Std 802.11-2024, subclause 9.4.2.323.3 ...


> not set the 320MHz related fields when not operating on a 6GHz band.
> For example it says about Bit 0 "Support For 320 MHz In 6 GHz"
> 
>    "Reserved if the EHT Capabilities element is indicating capabilities for
>     the 2.4 GHz or 5 GHz bands."
> 
> Fix this by clearing the related bits when converting from WMI eht phy
> capabilities to mac80211 phy capabilities, for bands other than 6GHz.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 

The commit log mentions wrong `iw phy` output and wrong mesh beacon
advertisement, so this appears user visible. If that is the intended bug 
being fixed, please add a Fixes tag.

> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> Changes from v1:
>    - rebased on ath-next
>    - clear all 6GHz / 320MHz related phy capabilities fields from the firmware
> ---
>   drivers/net/wireless/ath/ath12k/wmi.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 84a31b953db8..a8a4654c4f34 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -5154,6 +5154,7 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
>   				       __le32 cap_info_internal)
>   {
>   	struct ath12k_band_cap *cap_band = &pdev->cap.band[band];
> +	u8 *phy_cap = (u8 *)&cap_band->eht_cap_phy_info[0];
>   	u32 support_320mhz;
>   	u8 i;
>   
> @@ -5167,8 +5168,22 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
>   	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
>   		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
>   
> -	if (band == NL80211_BAND_6GHZ)
> +	if (band == NL80211_BAND_6GHZ) {	
>   		cap_band->eht_cap_phy_info[0] |= support_320mhz;
> +	} else {
> +		/*
> +		 * It seems the firmware can report capabilities specific to
> +		 * 6GHz also for 5GHz, so lets explicitely clear them out.

The code comment should be less tentative, how about:

      /*
       * Firmware may report 6 GHz/320 MHz specific capabilities for
       * non-6 GHz bands, so explicitly clear them.
       */


> +		 */
> +		phy_cap[0] &= ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
> +		phy_cap[1] &= ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
> +		phy_cap[2] &= ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
> +		phy_cap[3] &= ~IEEE80211_EHT_PHY_CAP3_SOUNDING_DIM_320MHZ_MASK;
> +		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
> +		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_EHT_DUP_6GHZ_SUPP;
> +		phy_cap[7] &= ~IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ;
> +		phy_cap[7] &= ~IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;	;
> +	}
>   
>   	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
>   	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);


checkpatch warnings:
ERROR: trailing whitespace
#61: FILE: drivers/net/wireless/ath/ath12k/wmi.c:5171:
+^Iif (band == NL80211_BAND_6GHZ) {^I$

WARNING: 'explicitely' may be misspelled - perhaps 'explicitly'?
#66: FILE: drivers/net/wireless/ath/ath12k/wmi.c:5176:
+                * 6GHz also for 5GHz, so lets explicitely clear them out.
                                                ^^^^^^^^^^^

WARNING: space prohibited before semicolon
#75: FILE: drivers/net/wireless/ath/ath12k/wmi.c:5185:
+               phy_cap[7] &= 
~IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;     ;

WARNING: Statements terminations use 1 semicolon
#75: FILE: drivers/net/wireless/ath/ath12k/wmi.c:5185:
+               phy_cap[7] &= 
~IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;     ;



