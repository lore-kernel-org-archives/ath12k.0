Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41642D25926
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 03:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5xXWCoWg7LQszRz0+jab1sYAUXDotCHY9l9ynoFcM8=; b=Q+7jxsgbwTR5FaryOLy4SH9jn7
	RKSJM5RPDjTW0RMG4SOIoSLoYj35vBIcIrBjrMw2a4ehasVMwr7oiUUnwAeUquSQ5VTdw5wTe0lmD
	vwc/AyTV8SnKlxV2t2eJrW9xNQG7hVbx8qyk6N9SX1ae70DplB3oti9wHh74EpDxC2CuVOyVanhKT
	3Ok+12IF1S7McX+17/5G8Hxe37xsCZx4HMg/vKRAH/tqGUVB5DhpwnQw14+HtTDm+ayEyFnP6h7ya
	8u5rBMCvDX6pbrurjnlpexgxo7CQzNP2tD9z+Swrpovb3Jurn4MA3VAGBFs5oeBMKNSWn+rtc5ZyE
	XCObvESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZec-0000000DaDT-3tPi;
	Tue, 27 Jan 2026 03:22:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZea-0000000DaBB-00hd
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 03:22:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJ9c3399287
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 03:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5xXWCoWg7LQszRz0+jab1sYAUXDotCHY9l9ynoFcM8=; b=LaLpgMeS/Z0JX2yZ
	TVebAhn7Mu8oFYnTI6H6oU71VXvAWzcfMw6xCkS/kXDEEeLhXH7MzbzZtx6KypEZ
	NAzFx2TWdNydlnrM8tzu98hAGE5F4l0DTxZwaAAtX4arUsE7euPupmfObYQ9z8C/
	uXdmS49EsqpnHVGefPux629p2ztAo/7CTZBzYKNE2BZWUCY/Kyl4LoyFcWyrfOwb
	wUKfG1rrfLuxF6JSsE4JNx5cvTkLXUOq/pDMN2ZwHb0w3ilYawaTDCS2cXxTgkoe
	526tTkQx4drf3DqKD5jnSHxP4tHehl9mzUxOTq9I/VJMXKaWZBlhHJlIDQygwxAi
	MQViAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9h8wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 03:22:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8230d2a470eso2052776b3a.2
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 19:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769484124; x=1770088924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5xXWCoWg7LQszRz0+jab1sYAUXDotCHY9l9ynoFcM8=;
        b=i9zLiFUvquaTHrATrFzTkYKF2M2pzwQ96eBNoHMA9zgDYUZ5YQVZVCvvEsUFGD+FHi
         j6KcexIjLkCYqjPF60SrscKtvxf90ly+k9WVTazX3s+B1WUiim+FXaxzdqAGQBOYSYj1
         2Q3om2V5umiiLfnQW5HWA+AUBbmPDaO3ket+WctwBnMMr9iOgorhl6FC3+ngA8I3Alkd
         1bs1lRSHEeNqH3FupBg5EK2upRNj8TswI0jrP85JvHbPgia3zmJ0TS7pju0ll+rnXy7M
         C6h3lQB/PRHnnF9NlQHYsmRJCx9Tu5JH/duEopNo+/aijjMRx6sjlfqdbPqR3I/dqvRu
         uZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769484124; x=1770088924;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5xXWCoWg7LQszRz0+jab1sYAUXDotCHY9l9ynoFcM8=;
        b=o7LR/1B8b7qd5CJ6WQROc3gh/YO1nzwfRON1R0hr7bCv1XxBy1hWQ7UaDcSh16A89P
         pJ+eYrgZfZe77t4jBNYhDjslfMihLiB5Qx6ZWEMDQR2kARIZTRBjESwCUgG/axA1YLLD
         tiLVg7Gq/96ICc/jJmMBtLrdabiJ4iWUn1htRlelENzRQjPn2snr7Vy8+sTzUUAPIgxj
         pJfuhM6lcw980ALfd0KX+EXNjfya/3H/ffM4+HOKpkDOqmScrfPeUMpFfwGSDqvZ2Uwz
         cRJSzkGM0aZdkHl1wShzWzIAVWlOYCCyZzT0mic3Xt6Y/gs2/UuL2cZorMwYSK7C+Pzd
         lL0g==
X-Forwarded-Encrypted: i=1; AJvYcCV9zLjrxIiORH+OEPRSA/FokRT2YHO/uzmVoWM6J2Q4AR+aFxOvo17gkD5DJiM+m6uYkIjNxdw=@lists.infradead.org
X-Gm-Message-State: AOJu0YySjDUD0rM8lplAH+2fSgbPtgCAY+zLUi0CthVC1d+UG9TvFSXW
	uHPAXfi3QP28yUc0ExQrmDE8R1ksCusuXUBZDOx1ASgo+PAfDvwcO42JSF/Vr6TIiX5m6t2MO3q
	eoNXcU3dCeqqclM8Qt7g+P8NW2lwJX/Gkdis+pQNXDKZSyshu9qoMZ5vwgNvfwVeh2CuOXT8B
X-Gm-Gg: AZuq6aKgvRlRTDxIYvCHDbjZuihDsgok9MMVqQsSEqDvt1wEEPKkAcsED8pzNRed+va
	uIXjyEx9seY5VVOkd8oSOK4EhVJfIcqWVPF3wHpY1t7HJMVKbNHCaYauBDuQEy1gStHVcl2erVU
	MtEmM7KbKdffp16hMnLps8kTI5mf1RI0W34niOVplLFgUDnmnVnxH+s0ZhHQPKazuMKy4Yl3tei
	T8STHdBf+1VNxtynHSo+PobqY8D7jF99CHYmSSy7kTF3qGOjdT4DHF2BHr1Wi3z1PnmBAwkTDXP
	DGyn/kd1hqWwqqaF8rCSm0RIbjLZBP+0Sg7PSQa0Fbm/Oznvwhar7dgN+Sg85vaM6t/UtMxcgAI
	IXef60By+nus8SxRz26vL8VBlrxXXPwPmg1FcNqJxZUEWaFx6hRSSTITjrNtfyMgKI3ZXFq8=
X-Received: by 2002:a05:6a00:2d12:b0:81c:92ec:ccf3 with SMTP id d2e1a72fcca58-823691732a9mr465833b3a.19.1769484123672;
        Mon, 26 Jan 2026 19:22:03 -0800 (PST)
X-Received: by 2002:a05:6a00:2d12:b0:81c:92ec:ccf3 with SMTP id d2e1a72fcca58-823691732a9mr465808b3a.19.1769484123177;
        Mon, 26 Jan 2026 19:22:03 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318663addsm10500641b3a.20.2026.01.26.19.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:22:02 -0800 (PST)
Message-ID: <776ae681-9db7-4051-abe1-07530f87d485@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:22:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: Remove frequency range filtering for
 single-phy devices
To: Saikiran <bjsaikiran@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org
References: <20260126095244.113301-1-bjsaikiran@gmail.com>
 <20260126095244.113301-2-bjsaikiran@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260126095244.113301-2-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=69782f5d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EQzWbPYLQmh-4cZE9FEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -o1b-Jk1lo69BaGObgNwQssJc4lXfXOR
X-Proofpoint-ORIG-GUID: -o1b-Jk1lo69BaGObgNwQssJc4lXfXOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNSBTYWx0ZWRfXyu4T/4p2C//V
 8FScUyoGlNgZ04HV4+41o8pZTa5JO4UPxLMxOd7KGBfUluQiI6hTWXELRtM3qlbIYZCSfFhUbo7
 MUIyLELoPr9CD6+KCEYeolKt0GxTDMuqotrt32LcWDeVvd3IV7MnalUUOzDesjrhlLdF0sO/I4K
 7EuDmEYv6Vx2QvdRwpbJPLWsC7+YmWdm8vIdFKIW/z+8yaEaTyu6CIPtRYWgZL7WzeRkXqSDVSt
 ru5TyHBFP3JsCmZjaOgk0JcrZKaHK67PW1Y0P7tQYzXbTQg3ecJ8xPsyjjmxmxgWCJpktgjrpGR
 VPtoksVn1USN9pdqfXjJNm8eiTt1oAq0+JrpSqtdl1aewtjivOUTAsz9tvpYl8rEA0E0umlY05v
 pDQJuQe7vlc8kjvPz75WmCAUqpKY0TdRLIsYwisa2qTY6jDgVr0x4EJvCZLTWlDIXWDhXszCYrU
 0653C7GFEHgESOzH7pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_192208_197801_8027FA1A 
X-CRM114-Status: GOOD (  21.04  )
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



On 1/26/2026 5:52 PM, Saikiran wrote:
> The frequency range filtering added in commit acc152f9be20 was designed
> for split-phy devices where multiple radios with overlapping frequency
> ranges within the same band are combined into a single wiphy. Each radio
> in such setups handles only a subset of channels within a band (e.g., two
> 5GHz radios covering 5GHz-low and 5GHz-high separately).
> 
> However, this filtering breaks single-phy devices like WCN7850 that use
> a single radio to handle both 2.4GHz and 5GHz bands. On these devices,

To be accurate, WCN7850 still gets two phys in hardware, it is just in host that we treat
it as single.

> the freq_range is set to cover the entire supported spectrum, but the

exactly

> filtering logic incorrectly restricts channels, causing 5GHz to become
> completely unusable.

how? what are the actual values of freq_range when you hit the issue and how are they
calculated?

> 
> The issue manifests as:
> - All 5GHz channels filtered out during channel list updates
> - No 5GHz SSIDs visible in scans
> - Only 2.4GHz networks functional
> 
> Remove the frequency range filtering entirely and rely on the firmware
> to handle frequency restrictions based on actual hardware capabilities.
> This approach works correctly for both split-phy and single-phy devices,
> as the firmware has complete knowledge of what the hardware supports.
> 
> Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
> index 7898f6981e5a..48c362a86524 100644
> --- a/drivers/net/wireless/ath/ath12k/reg.c
> +++ b/drivers/net/wireless/ath/ath12k/reg.c
> @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>  			if (bands[band]->channels[i].flags &
>  			    IEEE80211_CHAN_DISABLED)
>  				continue;
> -			/* Skip Channels that are not in current radio's range */
> -			if (bands[band]->channels[i].center_freq <
> -			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> -			    bands[band]->channels[i].center_freq >
> -			    KHZ_TO_MHZ(ar->freq_range.end_freq))
> -				continue;
>  
>  			num_channels++;
>  		}
> @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>  			if (channel->flags & IEEE80211_CHAN_DISABLED)
>  				continue;
>  
> -			/* Skip Channels that are not in current radio's range */
> -			if (bands[band]->channels[i].center_freq <
> -			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> -			    bands[band]->channels[i].center_freq >
> -			    KHZ_TO_MHZ(ar->freq_range.end_freq))
> -				continue;
> -
>  			/* TODO: Set to true/false based on some condition? */
>  			ch->allow_ht = true;
>  			ch->allow_vht = true;


