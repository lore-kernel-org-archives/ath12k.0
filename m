Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E713C35FFF
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3wO0Es1m7WaTtYldTEIuT1McNAULewL4XYhxOb/1wY=; b=p04jP2W4W3J7D2c3S+7QQi0JXX
	slZaGkIHLa1riQnEJ3pEbmfObmuwEo2i38f1UewUMKFhcGaj0GN0v4a/onA0E512Zpc1g3uhCBCoe
	F1cHCsys4rgISG65dC7IrUgKieArBjcOqaictJilf/iuJVy06Sti/VhspU8rR8JpJBA7nWatT+/Q5
	oKiSnQjWNYvPDlH8SHvDhUX6Tk/PZHC8ETdcOZVqO3ZVLUgIQ/xW+dd2HaJ6O3arZmaOsURVydN5g
	mJhtz1/QGfNayBJD12nsXSIIcvmpAIdgsgr/5x3Ij/FBUnlrpJUMR93eV4QkU5xg26Z2yYnYJuEEH
	aLbBKE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupUy-00000008Rxg-1Ni8
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 09:14:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupT5-00000008Rd3-3cS3
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 09:12:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-390cf7458f5so5580027f8f.2
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375526; x=1742980326; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3wO0Es1m7WaTtYldTEIuT1McNAULewL4XYhxOb/1wY=;
        b=rxEgbqxTrq2kqQGQ6dtLXpHNRnBSOLgJM4Y3WWVTc32demu88FOUMv/RPG9iic9m5R
         o+eHzicY2fRAobaRy4yFydJtq30so2Kd4B8D/P3v0bryXPK/HjKK5RYUjpVH2sK8ziVQ
         Dl2fzTndXiBASbg1O4GVPEuEuz1eMLB43AEyp8H4BhFBSRhfDYGUGmlOVourjq1Zh+kX
         cqY8ff9iUfKej2Ah8bBAs5vDVKmf91CuvmHxPdPJ2GKA5nUZUSg068TR15+zazM7/s7S
         5+lSYit3D7sF0kAVpeyZrZ9MiCP+5ZiW9VT+X9CNO6F68JzNu+me/XhP3Y0TAC4nQAZN
         Jegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375526; x=1742980326;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+3wO0Es1m7WaTtYldTEIuT1McNAULewL4XYhxOb/1wY=;
        b=i342Kiuqtn7NyH9fUXVy4OEfGotrC8vk6WX67uEAu8GTIo/R6YB3CoY8nd2YsDrIcN
         tQP/HrenVB/pG8bqk/YSi4/23J1DcyA47+3eC1vqcAPQisEmX7kiVu9Y2NebK55VqndB
         RWGP9kj1Ykj/AKGnZUHLUO1sGNDQmupxjfvBOSSWslR2QkX913Q2FkJpE8GJGnSsAV5K
         wtfN+b5VBM5UieXNKYEkJWhrdN0TtRf5DZ+bpa0n7JugwlJ1sjYZ2W0n1buPyHNewxBe
         lpzvWvnESI8aTRPr68XG6+fos5w2wIaaLwU4O1vef0sV8/Ybeg1mBH5aHhci3GrKxGq5
         2Mvg==
X-Forwarded-Encrypted: i=1; AJvYcCV6CuPsuhoaaegwCYIDaeuyE5s+9PSnBbVD0xrQxqNbNF8F7+D+8mKClHHvga8Uzhi3SuRUEhU=@lists.infradead.org
X-Gm-Message-State: AOJu0YygXugIZ6j6OPly1oGi1Y+UyFXrYzGxhMV1/jagfN2fnz29CI8B
	LiKvFiUl3gj+nDZfEbPnXwgRz5XALO6YFKMHQ6oAw/3ttBhsdmcfVumu9vtCw7w=
X-Gm-Gg: ASbGncty4Xz5yVJIJS2OwmpQAqC5OvHUg30SCFJ7YDVbj7QZh1C73Guwelc4TzCUq2H
	Gd6HFSeKLaB9eGWDaeZ7FUAfMSD3Bv8Sw7KvLcNaUhOFBwAodUvfqhr+MwX8uIbsIS7FEvB2ECu
	Bj/ZV5gTC8IW05qNNjDLcp7AR34WLY/INmTlScyQj3VHFThcyib1tJKH+Lix9nxpNAmpKduMfh3
	HuPMqzYgzkM0efp3z9qj4DkDAdMKuY1S2x4OUQu27g1yDvgpcG1SaVYDIkiO3Vqnm8mK8QW6rm7
	V/z4+zZJIqNRTDSxvDca1t97my/scMYqWPl6WtAsXXEsmE9nrLHHYe6on0LaVGrJRyb5jx7Q8ub
	ZHW1G1l2gaMv9ozN6/WEGUQ==
X-Google-Smtp-Source: AGHT+IHRqvrvyZIXOKuWDiE2L3Da8ittau1UvypiK1oVlIjMXp4re/twA8F0bWNH4I1IMwAp3EV8vQ==
X-Received: by 2002:a05:6000:400c:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39973b28597mr2187719f8f.53.1742375526010;
        Wed, 19 Mar 2025 02:12:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f407:ab81:b45a:93e8? ([2a01:e0a:3d9:2080:f407:ab81:b45a:93e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a8bsm20852881f8f.66.2025.03.19.02.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 02:12:05 -0700 (PDT)
Message-ID: <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
Date: Wed, 19 Mar 2025 10:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_021207_913176_6D74737D 
X-CRM114-Status: GOOD (  16.17  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,

On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 3/19/2025 1:34 PM, Neil Armstrong wrote:
>> On 18/03/2025 17:35, Jeff Johnson wrote:
>>> On 3/3/2025 7:00 AM, Neil Armstrong wrote:
>>>> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
>>>> the line:
>>>>     ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>>>> was incorrectly updated to:
>>>>     ab->single_chip_mlo_supp = false;
>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
>>>>
>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
>>>> crashes on driver initialization with:
>>>>   ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
>>>>   ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>>>   ath12k_pci 0000:01:00.0: ignore reset dev flags 0x200
>>>>   ath12k_pci 0000:01:00.0: failed to receive wmi unified ready event: -110
>>>>   ath12k_pci 0000:01:00.0: failed to start core: -110
>>>>   failed to send QMI message
>>>>   ath12k_pci 0000:01:00.0: qmi failed to send mode request, mode: 4, err = -5
>>>>   ath12k_pci 0000:01:00.0: qmi failed to send wlan mode off
>>>>
>>>> With ab->single_chip_mlo_supp set to True, firmware loads nominally.
>>>>
>>>> Fixes: 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>> Bisect log for reference:
>>>> The bisect leaded to:
>>>> git bisect start 'v6.14-rc4' 'v6.12'
>>>> git bisect good 5757b31666277e2b177b406e48878dc48d587a46
>>>> git bisect bad d78794d4f4dbeac0a39e15d2fbc8e917741b5b7c
>>>> git bisect bad cf33d96f50903214226b379b3f10d1f262dae018
>>>> git bisect good 12e070eb6964b341b41677fd260af5a305316a1f
>>>> git bisect bad 6917d207b469ee81e6dc7f8ccca29c234a16916d
>>>> git bisect good 4fefbc66dfb356145633e571475be2459d73ce16
>>>> git bisect bad a6ac667467b642c94928c24ac2eb40d20110983c
>>>> git bisect bad b05d30c2b6df7e2172b18bf1baee9b202f9c6b53
>>>> git bisect good 56dcbf0b520796e26b2bbe5686bdd305ad924954
>>>> git bisect bad d302ac65ac938516487f57ae20f11e9cf6327606
>>>> git bisect good 8c2143702d0719a0357600bca0236900781ffc78
>>>> git bisect good a5686ae820fa7ab03226a3b0ff529720b7bac599
>>>> git bisect bad 6f245ea0ec6c29b90c8fa4fdf6e178c646125d7e
>>>> git bisect bad 46d16f7e1d1413ad7ff99c1334d8874623717745
>>>> ---
>>>>   drivers/net/wireless/ath/ath12k/core.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>>>> index 0606116d6b9c491b6ede401b2e1aedfb619339a8..33aba5fceec946fad5a47a11a4d86b7be96e682e 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/core.c
>>>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>>>> @@ -1927,7 +1927,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>>>>       ab->dev = dev;
>>>>       ab->hif.bus = bus;
>>>>       ab->qmi.num_radios = U8_MAX;
>>>> -    ab->single_chip_mlo_supp = false;
>>>> +    ab->single_chip_mlo_supp = true;
>>>>       /* Device index used to identify the devices in a group.
>>>>        *
>>>>
>>>> ---
>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>
>>>> Best regards,
>>>
>>> NAK since this will break QCN
>>> There is a series under internal review to address MLO issues for WCN chipsets
>>
>> ???
>>
>> The original commit is wrong, this fixes the conversion, nothing else.
> 
> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
> Setting the mlo capability flag without having required driver changes
> for WCN chipset will likely result in firmware crash. So the recommendation
> is to enable MLO (in WCN) only when all the necessary driver changes
> (in development, public posting in near future) are in place.

Right, I understand clearly, _but_ before 46d16f7e1d14 the firmware
was _not_ crashing, and 46d16f7e1d14 causes a regression because
single_chip_mlo_supp was set to false instead of true.

So if you read the commit message, it clearly explains the regression,
and the reason of the patch.

This has nothing to do with enabling MLO, it fixes a regression
on mainline for current users.

#regzbot introduced: 46d16f7e1d14

Neil

> 
> Vasanth


