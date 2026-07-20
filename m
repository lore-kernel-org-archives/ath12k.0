Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F125C4451B
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjExmZ+ZBvgP5brGvJupDhlln576J9vFP8VTLvapH2A=; b=vgMoKNpUkQBycpzXHKxhKUXOpf
	Mf55v0zlPhFm9mIp0SDYTJl3WQVxNwwUVaOtCvrrdyTxphARZHmV5iEi3359v4YpNgOmZ26P6Zvie
	18hKF0pzbai3HfTgjFI+3gvn5ilo9wPngmVkd81bOli6wpp03cueBXdXPItG8Rf809YaCTvPK8OTi
	DsIpzXEue6zzbzpQOD5SRvRNGUbkUQROhV4+xQO+kJbLW1ABKxJxD/8EFijh5CYtGX8R+hAzbYdCT
	MbP9dv4XDSaz8A1d+GYj25JYn1tZ6cvrxq3vhtCJmsAQfgBfxcaBfMwkHiSinITnB1VkyJWtCmaum
	xXdrwIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljSX-00000006CvH-3own;
	Mon, 20 Jul 2026 08:34:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljSV-00000006Cuj-3ue2
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 08:34:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6Rqaa1263329
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 08:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjExmZ+ZBvgP5brGvJupDhlln576J9vFP8VTLvapH2A=; b=P9YCTXYsUlgkGE24
	aLX6y0hij2swfq/Od6UKUsNmYKcPtLwDgSK89P84D9JRI0ru8xWo26ofTLq0TIuT
	2fyK+EEu/6Ph3+rSEmCrtExwiOEXbzucYPMBpogRoqzC/S6TutuHgiDheyQNutqz
	4wFBwWrVDay6BCelyeVyPIWmkyPfDY3+2UaCn4Pmkpi2qII42oFW239MVU6CKlsM
	ow88KoEoR2wRZfq5XtzuE4It4ldF8YMerz4X0GAEAJGYnEtgd2ZD4ONRTfSQDEO4
	7aKqhbJs2htSNcVqDKUfJowzGh74A7PlHBdkD6X+1uI8QktsE+DpbaHZ7sdnjmvc
	ONKUfg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhn6qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 08:34:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so10891478a12.3
        for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536482; x=1785141282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjExmZ+ZBvgP5brGvJupDhlln576J9vFP8VTLvapH2A=;
        b=d2l3wOP4K1Mpzf7RviuC+WoYUgyxrBL1+TPID/Qz7D2CVeqiMnRZqFO5jVqS0aKl/8
         P9OHlOBAcaY143NhgYdHhvZhuk22FOUM0SqWhFcLnQ27bnWHFdsJKks79VuKbNCy/0B3
         uHTHMKcwBTNFuiw1EwkENFDmnfA6AATYwljWmcenbuajBcqZ5WXPDof+Ap+oPRb9ivob
         MDvkyzrYK/6TRw2+YjB2wBswtUwExuzNGjON5qNAbrGssSI0xoyAuT3gXNRnNabm6cHu
         +nmKYXypKrC+JjOby0ZjigPw/sR9ezquzOoCa0QQnO/FNevRoBh7zxiEI3EUeI/RfvTQ
         wFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536482; x=1785141282;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjExmZ+ZBvgP5brGvJupDhlln576J9vFP8VTLvapH2A=;
        b=pVgu5vzHPMhJ3JXKDCnKB8bW1gkZJn9oaefD+/eG+fdfKA+a3Xz4ByqdvA564J7eSY
         qDNMoFxJAecP18xbRagM+hjr0RDFl7JoL7x+msfRwaU5236fuY0Yn3KO8X9rrstjswpz
         gZednaguHGdfeJGbbESSsDdPN8J+GtpvAXDxeKHCAdoRwG6EzLBe5B1Z4XCnoYekzE1o
         Oqa9q2UjGhlZJCLva+9GJvH7Jcj6OwzssCUvJLGrCFtaqK2I+Wd5itdivbnEYtQeLCZA
         Z3LafORIJK6W5J3F90wYWoTONDEuTR59MhApEyKzkIABck1qQqYv6RoMppGmZ/KzI67z
         WAuw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4T1v9wxNNlOqX8QAQ7a8K1AJ5VILGLB3YDzjsScZoqsIkQU0VCsFCib+a0U09s0A2Zdd/EmA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbDGa1WKOYIT4xjWAI5WJc2iR8xXw07+Gb36pA6CFs+RKO9+bo
	PKTsVjZCPzvnIpTabG/Pv2neVYeZtpAgCuRnW5efu6oVY2YatQXqiKQmZFFh9Et5qap8nuGe/td
	U5+jpRbWSZ0yrfiX1CNjuOox09M5WJGwUP2nl+f9sxtp6CZcL3eRzgMcbCUicX8XC
X-Gm-Gg: AfdE7cnFif0uG1oS6fZ0XGkbCOx8xRR1HKdonsRDO06qfG2fzpdn10abQvaBQBlfPq+
	xCxRmYl9oxZpxVAv8hDxBYzaQof7jEhzY1SDKnSiCYYzXIKJLkhNGm0G/GVXFmt+XVYSTLXsrQh
	Nk8m652+Hz8dCiIcExFOWYTkbBq92FaQOac9FsYUAbRCbeppackPD6KoxZ5ADmKkN2LigqjvJkQ
	DcNEJ7Cxqn4nvXmnfY0KlHCF0i4u/ESvV/MgVVktjYEz7NL6+MXRNXaBpwOGn5+ftHM6bCHRmz7
	x+corQoQekzItE7S5+OeyrQdGDwpo7iJ1tpOO1d3V0CSUxbWIeA0OqpzUo14Kp9/2JB5YEHbsFu
	9ogtbKNQGbRmXPatMShkwlunE0MVGgHaQF4pDh45Bh1dv1cN+6Ky5v+5qjecMARnxFLeLCZa6
X-Received: by 2002:a05:6a21:4edb:20b0:3c3:bbe6:95c9 with SMTP id adf61e73a8af0-3c3bbe69a7cmr8385775637.16.1784536482164;
        Mon, 20 Jul 2026 01:34:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:4edb:20b0:3c3:bbe6:95c9 with SMTP id adf61e73a8af0-3c3bbe69a7cmr8385757637.16.1784536481606;
        Mon, 20 Jul 2026 01:34:41 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519de2fb2sm4237277a12.24.2026.07.20.01.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:34:40 -0700 (PDT)
Message-ID: <5ca16013-e8a0-4403-a2b3-b3b43ea2bb2d@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:34:37 +0800
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
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5ddda2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ptET_oXVa2BxEO8-YBQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: z3kUzhtqDmF3XGQTEgnyyI3yEztTK42z
X-Proofpoint-ORIG-GUID: z3kUzhtqDmF3XGQTEgnyyI3yEztTK42z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NCBTYWx0ZWRfX8vDe99HV2rUK
 RrjhAamV+6omUYphbuROukqGCeBZb6GnPS9dHmkaZlXgMAcMLTPNg1cLuxX+D1dVpUW+BHk//eu
 sVaIXyFL1wBWP2ZlBuF+6JVWZRWo2k43YaEjvCdBJFPZj7BstwHR1Ot81j1by5qVwK7g9QNrzfD
 a+znBHqoMhcLD21mkBZSeQfU/ruRg4qcKv4fRHqibeY9TysPLECN7BZby9LxErkB6osz2PHNstg
 B2sp1TksnHsPY1m5Ekqv4QiZBbNwtkIrLpFJOC3KuihG3K9IqHfbXdnC7UuR7xpJfKB87LfO9wY
 o8PIq5sU570wDZjlLeSjVS8UjTXcZdxw7qsBqdr3hzb/5QXgRM8keFZ0rWvNhRQ7aFNG0bcPFqn
 H5hHojn3KsmXSv+mHfcrbhVBI7xH0RK0jGCdJnpxdLAs9RpUJx4gMKB1nL2jZyRxTXs4DKLZ7Ms
 f8l1H7TRgJCOlNyDEAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NCBTYWx0ZWRfX03cU0mYUbZ7m
 SYWyrs/rlTRDH9LsdSXf2SUKV1sTlmcsRLuixswPoHDGsb7AtkWaYnKLCQ8VdGH83ZpX43f3Uqr
 wB7qVzR+cjjmEpjqdxnCCe3tlaX+jkY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_013443_982402_77622732 
X-CRM114-Status: GOOD (  20.93  )
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

can you share more details on how the frequency range is updated to cover only 2 GHz band ?

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
>  		}
>  
> 
> base-commit: a1a21995c2e1cc2ca6b2226cfe4f5f018370182a


