Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154AFC55184
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DS5uMq/V/wG19vF/mEvQNvyxbB0WznTmF9aYgYlRHF4=; b=jMtf0iyVSjTpzCjWfxfi8Th5M1
	WwsHWokoB7kOyveZJlSu6/JMbChESmCQ8yJXEl+sfDa5I7u4OK02syiDWUcVXc1Zf/0qjPFuN1y0W
	DXy79bTEJR9KC/qn6O2XmfAWUdZtc/0kCPOYj+wM+oYPPhnpyO+wRphgHo4OsWh2IaLZJl/xL3vQD
	eneKLkD7d9AczteWqX122XjxmVuZaeJpjuyv4lQmk5sNKCEWw8bPXccyv1/w4Sb+jaFRKHgyTOnVr
	OE+qIoIMVgLo7URCxWaxMXVDPPzq7cExeK9ptCqdGGJjbznXOpBPXU6heY7H6/bsJADckNsSN0MiP
	5moZO7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqoBX-0000000GcOd-32hO;
	Mon, 03 Aug 2026 08:38:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqoBU-0000000GcO5-3rTp
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 08:38:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736TCaR4015082
	for <ath12k@lists.infradead.org>; Mon, 3 Aug 2026 08:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DS5uMq/V/wG19vF/mEvQNvyxbB0WznTmF9aYgYlRHF4=; b=hnKoq4DrqfEor8Q5
	+sxVFYJpbP/hJERB6lHZI7gdRAq/VpMAxHtxKH3YTppbJZwT4DyTw3BjfHzZfYF1
	HovlZ9RnOBoD2TuAI8NvvpM3HjDCdGy7jiW4yPr2lyw2lhC0Dd6xzapIJMT2RFyl
	fxS8iw5hXAu9LFZSf+2R85ga6UL3nP9QNpxZNlf+vJINDvsrb1Hfk4GkX/tusteK
	rn2ZNMIc49KJ4ukgSyUModZc37mumXRkYW0VQBV5h4qiI8t/O43zXPeoRLIFXPX/
	TJrLv67Fkwg9Qm8ea2VHGFsp2A9mDz8DbQEkjKMzh8/lj2B9U+uLvRV6ZzD3YfsO
	f83PcQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt8gvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 08:38:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso4049645a12.1
        for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785746287; x=1786351087; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS5uMq/V/wG19vF/mEvQNvyxbB0WznTmF9aYgYlRHF4=;
        b=aNwmLCifd/XOtRdiw6d7CQd+sHz3R5CgW4eoEBrgYIulKNe601N/5lCL9vJZn9lKWi
         FLkdVtpE/kPen0nm85vOgX7Byg/SoMxknP9YPXHb5zpbXrk+dXzcMgSV8PafY/5xILal
         KumcucXlOh4Bv8RLO+B6ewcvCTqHFT1PbUaVzgPQklpXf+B645/cMXFb0dCcNX9232aG
         UMpK6NtGpAEaV3CCDGQ3pOjjrhJrZaKKBn8mr3eLZjcvkviKaRdi7veHG2t5cv7nCkL0
         JZg5eEK8e+q6hVjrQYr1q4X4ww0NcxE43m9tER3xx35shLDm2yR2dcVX/xoXMmW30995
         nOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785746287; x=1786351087;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS5uMq/V/wG19vF/mEvQNvyxbB0WznTmF9aYgYlRHF4=;
        b=Y8guecRx98mupWe5AkiU3gGugv1vWaVs/2AsJ34230zmZOINob2/ebna+bDeAPZNRu
         s0y08c7MBDh7F/qNhYpXBT37Kso5tlNUVZsyoUI8mmJ1bikJXrd319uCsaX8ZikUxJD/
         g4pble8vpaxjay8aI3yicbsee54J4hey2o+FbkbJ08Il338UUb8qTelgMTeUJK2kzxum
         GeMOlU1UbakqNE0G3ZGFOPNYOD+tNK+o/FovvcExDJJ3ifl8X+VnM4POoQBXyu0GtHMb
         no3KtjVcliFCAudfrWf4/+naHXYCDB1FIXaO2VVZm4aorCel8/K/HvLpUuh6GVF3Gwgy
         EM+A==
X-Forwarded-Encrypted: i=1; AHgh+RodwCq9FjOYy19FmBQ46BSyfEwV+ydG5IFJ9X0vxQYjzSHcAcYJoHTKVN5IkvrCeM98QgG6o2A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMWdmtNtwBZEG1Ve7aiGN0XREQMESR/WxClg3//DznyPoAnZNh
	KNNQzSieRaqr+ThHVDsXyv7my+TVNvSs7INt7mMv49tQYMhFyd9cJdByyg45GGzBDQ9p8Is/UlI
	Qf+2O3G/p3aPoT+uaGWVt/36jWmYZl8OuOkj8p9SqexyLbIHEut9UAhTXqZjBoAEJ
X-Gm-Gg: AR+sD117bjX3H2r88x+7bSIn8HLvFtOKVaQumZhFCZoqtn7jT6vKU3iyfCj0JQvYJKu
	jVS+4KSWpE8M805xefXNwjdOiS65jQGQLG1D57S4pVE963tvpBlwD0nMVPWhgHfqfDcXEGH7JMm
	yYXYMdUC1iqP6/Ej0ZfasFPASEF2fhmmVK6roZblBtgIxnG2dGjmUQtrFn/sCTbbM42N/QwgV2B
	NQ4HCnlVPYrSradVI0xc/SWcHST1JkKmqLDRoeaLnzyjv7x48fLMP1A7LUr/IEgGhV8jguA3sO0
	xdEQoa9G1eQoL6ZdsNLnwsukDKgT4Ia6ZHTmTrYdoBWW3XnNsTxzCeHGzIahVyUuWXIjitYVwuX
	Ki7lTRC7KO57yZmKYLpcyJ5YAVWbcXUAtPsOolKY75xtV1/DHOEI4U2MTP0qRclduLvL0j6o0Nw
	==
X-Received: by 2002:a05:6a20:4394:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c92a8a6b1bmr9375850637.44.1785746286758;
        Mon, 03 Aug 2026 01:38:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:4394:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c92a8a6b1bmr9375825637.44.1785746286352;
        Mon, 03 Aug 2026 01:38:06 -0700 (PDT)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ebb342sm3302604a12.30.2026.08.03.01.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:38:05 -0700 (PDT)
Message-ID: <65ea2bb2-3396-4db5-8321-857a42cfa9e4@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:38:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix frequency range for
 single-pdev devices
To: Shenghan Gao <gsh20040816@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260715065218.41232-1-gsh20040816@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260715065218.41232-1-gsh20040816@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA3NiBTYWx0ZWRfX8cPdZFq07HV+
 rEv3yBoB0Z6+qMEZztDYQ5DeFTbOoGdAC6yhhJ1/rx6HBc+Dh/+Iy0X6ve9tcZFngTYnFopfodk
 Us71DSpLWXl3rt6lciIO1iF8lC+1Ik5z9Bcheh2ZKrjxAfLZ7ZDvOyWYwbaAxqcB+CH0qr6W9l2
 +FQANT7qQa+PYjsKUIy6ySL+9S2m/hx9BViuwb81b0Q4eoDiSMkJnOQy9yyLOrXts7e0isIrHDH
 PmIBLo3v7QHm592uQ3OVVI6i31/0nF+3OZHZdJeXi2ZJT7L1l1PbAsMn2aL3FBvF9/IZ/zOYkXp
 4dFE6G8PI8Ao+0J+NUClveslvg2XqiUg+Cuq+hTBzSNxpxC84s+79Dtod2l6QuWFQb3HfYsEBqj
 sI/qFcnbYK2f7RK4CPa8fvVcdEyg5/8gYo/BxmTEhWFVsI6Aet9me8XO80uZoZ84l1zdlHbwsMb
 nWf6PG4gmL+m/ZsQ4XA==
X-Proofpoint-GUID: w4F0UkO0Q8JeP4f8FlUE0l_xI7Hb22A1
X-Proofpoint-ORIG-GUID: w4F0UkO0Q8JeP4f8FlUE0l_xI7Hb22A1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA3NiBTYWx0ZWRfX7uTi4TOZZQIG
 +4dONc5C5YxJjotNsseXoZK9MNANBqOefz7lB2f1f/VUA5wdrzb3sW1VUZHQm+9Dls1/bxf3SW/
 aXxr51qbJqUIL/bdjPPwHbGWfcz9T3o=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a70536f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ptET_oXVa2BxEO8-YBQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_013809_084908_883CC673 
X-CRM114-Status: GOOD (  22.21  )
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



On 7/15/2026 2:52 PM, Shenghan Gao wrote:
> Commit 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
> made ath12k_regd_update() handle each supported band independently.
> However, it uses WMI band capability values as indices into
> pdev->cap.band[]. Those values are bit flags, while cap.band[] is indexed
> by enum nl80211_band. As a result, the 2.4 GHz lookup reads the
> 5 GHz entry, while the 5 GHz lookup reads the 60 GHz entry.
> 
> Also, the 5 GHz range is skipped whenever the radio supports 6 GHz. This
> is valid when 5 and 6 GHz belong to separate pdevs, but not for single-pdev
> devices such as WCN7850, where the same pdev covers both bands. After a
> regulatory update, 5 GHz is therefore omitted from ar->freq_range and later
> filtered out of the channel list sent to firmware.
> 
> On the tested WCN7850, the 11d regulatory update left the frequency range
> at 2402-2482 MHz and sent 13 channels to firmware. A subsequent 5 GHz scan
> failed with WMI_SCAN_REASON_INTERNAL_FAILURE. With both ranges combined,
> the range is 2402-5835 MHz and 26 channels are sent to firmware.
> 
> Index cap.band[] with NL80211_BAND_* and update 5 GHz for single-pdev
> devices even when 6 GHz is supported.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5.6 Sol
> Signed-off-by: Shenghan Gao <gsh20040816@gmail.com>
> ---
> Testing notes:
> 
> - Runtime testing was performed on WCN7850 under the CN regulatory domain.
> - 2.4 and 5 GHz scanning and 5 GHz association were verified.
> - 6 GHz operation was not tested because it is unavailable under the CN
>   regulatory domain.
> - QCC2072 was not tested because the hardware was not available.
> 
>  drivers/net/wireless/ath/ath12k/reg.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
> index 89abf2e87ad1..c3bb1df2b1e2 100644
> --- a/drivers/net/wireless/ath/ath12k/reg.c
> +++ b/drivers/net/wireless/ath/ath12k/reg.c
> @@ -300,7 +300,7 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
>  
>  	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
>  		if (ab->hw_params->single_pdev_only) {
> -			phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_2GHZ_CAP].phy_id;
> +			phy_id = ar->pdev->cap.band[NL80211_BAND_2GHZ].phy_id;
>  			reg_cap = &ab->hal_reg_cap[phy_id];
>  		}
>  
> @@ -310,9 +310,10 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
>  		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
>  	}
>  
> -	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
> +	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP &&
> +	    (!ar->supports_6ghz || ab->hw_params->single_pdev_only)) {
>  		if (ab->hw_params->single_pdev_only) {
> -			phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_5GHZ_CAP].phy_id;
> +			phy_id = ar->pdev->cap.band[NL80211_BAND_5GHZ].phy_id;
>  			reg_cap = &ab->hal_reg_cap[phy_id];

seems we should also refresh reg_cap for single-pdev case 6 GHz band?

>  		}
>  
> 
> base-commit: a1a21995c2e1cc2ca6b2226cfe4f5f018370182a


