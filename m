Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC88CC35FFA
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKBKC1t74w4q5v3VETFM9JPylNV6hAJge0nZkPgWvfo=; b=bVOZ6g33e8unyV1Bk+bleQLcSU
	jwUYOqEkh0gfgDmLffRPfkkNXAQ7+qI2sdq9TSRDRm22AqYQrc0u1vzutrKuzi0+1y2s3nFTPJi01
	8fNmM6LjZ7nZCOYwFuRH/OneOwhjYc8tRP5LZpzHFDBgSrMN+ULLlRcRqI7tbPFmUOZIQFEk+cqN9
	JJcuOYnhsgHUvIUj2k4EISDZrUbgXWT8medsHsmt2fsn6Aog13tnsUuvt/AA16AieHlwPAdMYfBaS
	CjinhestKoGNwE3gMqZkuKyTDj6lDvTf1SGmhfK4CPZ9t2xIzSf5PX4i/Lz1Et2zxfW3s9BRF+yVT
	GD4p6WyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqHo-00000008bxG-2zHs
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 10:04:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqE1-00000008bSE-0KR3
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 10:00:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so5385530f8f.2
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 03:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742378435; x=1742983235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKBKC1t74w4q5v3VETFM9JPylNV6hAJge0nZkPgWvfo=;
        b=w8rfgO/9FbreQQfDHxBbRlmnQkn1/m93vFpsuA7Fm/3ypBp013miadeybrsmhXBJeZ
         8sEfNj6H6UdbpGJxfbHGwMz1Fa0KVc/aoOAzhQaIIO9ETVeJTo5OZOw1Hxve3BNmP4v9
         EY9i19pxKrNbjQJ++hA8ilJr/uYFF1HKUNYJ9N1tXGtlqHFfFmOiaJiTMrW4qWUZfHhL
         kW3oSQZM8vK9+z9O4e0qcq+TbrV3CcPKvj2r6YhhwhV7m/RFKdvYs9iaCf6EYmC2hEKw
         RLSWhZQd/3FHNVkOD65As61WYAotK+asnbeaBx3+pdPndborh5yJ66c/Vi/Lr5LK3KsS
         rBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378435; x=1742983235;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JKBKC1t74w4q5v3VETFM9JPylNV6hAJge0nZkPgWvfo=;
        b=qqZmXOvqhKfhHs5MoMSvNLLGbmwOR3g85jbbU9LDyJK/CaVhUep1Gb8ExFWGvwRZn3
         uSFxkgKhjnbAVIzppSJZNwWHX85RCp7KbZ+zM4R8GXYmDdzFLR2weV7wKwjW5TV5DRh8
         xVcNxJiNiQrs3pzhM7AK9Wot1PS1yS9f9gHNbdSap4qvVMC8hNJHV80juKd6modlu5vK
         8uLKOArZcogu+dAHHQzgyf5VkoCcb5dmpcQl/mrkY5fmzAPoPL4P0lenB/RrI0B51mKf
         8/P3HzF7Ty3EEbyo7DTahfEpuwN3J243mR1JKP9tLn9m5COhZ9LpPfKBpJFmrjFF1uRt
         sp3A==
X-Forwarded-Encrypted: i=1; AJvYcCWjgdAKUiv+nKuyaRWopx2M5w4QeXTx0b7YyvM2H5k+bb1Y5VazX35+/LYCf9vQn7F8WBeBnvg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzS7txw79Ia8LqWA/CInKnFs5U3J+980Bn77MC3lGRZRvpSBdU7
	PjfiNyFappXEkMmGEG+NsD+igI4bh5LcfYbccu4BFuYG7UGPyjrMYpw8HqZmrzY=
X-Gm-Gg: ASbGncsSwzcGAxLKcbSsdlzLFIojUCLV1SEpuFac1GXOQyea9PuUqm3UyussjXqzMr0
	CQcatDKghNvbWhMiGlIkL37ilPCJf+UCQyzeAWi01qFWTJ4gys5HrRCIH+b+McFSaUOJnsQ1SkX
	tpDfOMbvfeThLprs+ekOzTliONE6m5L3L7HSRnL0o12eanJGl5UlNpfikIJ498gq94/uf7dmktT
	63abcnOFsv5N41UwFciB+fdAPrEqIO/OAiU1D0lbSWRBGaQXwAr3VOEdvXCQXGL+/hsBcfzmz7d
	Y/HRXCpynX9da9DhFnowxJMXdf7jEi7Z+vuOhiuuFFZyLNFkr0S0aan748AKBpqYO1br78egQil
	Yxq85nAJlJ6WkQVwWDe1R7g==
X-Google-Smtp-Source: AGHT+IFPvuadG3q+4a6lZteTGGlgeKUF5dwtPa59M5BEe3exuWj1VF70jNqrA7LnS1xtHhwKB/Kxwg==
X-Received: by 2002:a5d:64a8:0:b0:38d:ca55:76c3 with SMTP id ffacd0b85a97d-399739b63femr1522212f8f.11.1742378435322;
        Wed, 19 Mar 2025 03:00:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f407:ab81:b45a:93e8? ([2a01:e0a:3d9:2080:f407:ab81:b45a:93e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975bdfsm20216148f8f.49.2025.03.19.03.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 03:00:34 -0700 (PDT)
Message-ID: <6717d816-02b3-4d27-848b-620398808076@linaro.org>
Date: Wed, 19 Mar 2025 11:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
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
In-Reply-To: <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_030037_119098_B409F7FA 
X-CRM114-Status: GOOD (  22.24  )
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

On 19/03/2025 10:46, Baochen Qiang wrote:
> 
> 
> On 3/19/2025 5:12 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>
>>>
>>> On 3/19/2025 1:34 PM, Neil Armstrong wrote:
>>>> On 18/03/2025 17:35, Jeff Johnson wrote:
>>>>> On 3/3/2025 7:00 AM, Neil Armstrong wrote:
>>>>>> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
>>>>>> single_chip_mlo_supp")
>>>>>> the line:
>>>>>>      ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>>>>>> was incorrectly updated to:
>>>>>>      ab->single_chip_mlo_supp = false;
>>>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
>>>>>>
>>>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
>>>>>> crashes on driver initialization with:
>>>>>>    ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
>>>>>>    ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
>>>>>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
>>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> this FW version is not upstream yet, why are you testing with it?

I was not aware the driver supported only a small subset of firmwares.

> 
> Generally we only support upstrmea driver + upstream FW.

In this case, change the driver to only support those exact firmware versions,
or print a warning in case we try to load a non-mainline-supported firmware.

But if you did read the commit message, the commit 46d16f7e1d14 is bogus, the
single_chip_mlo_supp should be set to true to keep the driver behavior prior
of commit 46d16f7e1d14. It happens to trigger the crash with this firmware,
but the code behavior was changed by commit 46d16f7e1d14, which should be fixed.

This is the whole point of this patch, fix a regression on the mainline tree
for existing users.

Neil

> 
> 
>>>>>>    ath12k_pci 0000:01:00.0: ignore reset dev flags 0x200
>>>>>>    ath12k_pci 0000:01:00.0: failed to receive wmi unified ready event: -110
>>>>>>    ath12k_pci 0000:01:00.0: failed to start core: -110
>>>>>>    failed to send QMI message
>>>>>>    ath12k_pci 0000:01:00.0: qmi failed to send mode request, mode: 4, err = -5
>>>>>>    ath12k_pci 0000:01:00.0: qmi failed to send wlan mode off
>>>>>>
>>>>>> With ab->single_chip_mlo_supp set to True, firmware loads nominally.
>>>>>>
>>>>>> Fixes: 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp")
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>> Bisect log for reference:
>>>>>> The bisect leaded to:
>>>>>> git bisect start 'v6.14-rc4' 'v6.12'
>>>>>> git bisect good 5757b31666277e2b177b406e48878dc48d587a46
>>>>>> git bisect bad d78794d4f4dbeac0a39e15d2fbc8e917741b5b7c
>>>>>> git bisect bad cf33d96f50903214226b379b3f10d1f262dae018
>>>>>> git bisect good 12e070eb6964b341b41677fd260af5a305316a1f
>>>>>> git bisect bad 6917d207b469ee81e6dc7f8ccca29c234a16916d
>>>>>> git bisect good 4fefbc66dfb356145633e571475be2459d73ce16
>>>>>> git bisect bad a6ac667467b642c94928c24ac2eb40d20110983c
>>>>>> git bisect bad b05d30c2b6df7e2172b18bf1baee9b202f9c6b53
>>>>>> git bisect good 56dcbf0b520796e26b2bbe5686bdd305ad924954
>>>>>> git bisect bad d302ac65ac938516487f57ae20f11e9cf6327606
>>>>>> git bisect good 8c2143702d0719a0357600bca0236900781ffc78
>>>>>> git bisect good a5686ae820fa7ab03226a3b0ff529720b7bac599
>>>>>> git bisect bad 6f245ea0ec6c29b90c8fa4fdf6e178c646125d7e
>>>>>> git bisect bad 46d16f7e1d1413ad7ff99c1334d8874623717745
>>>>>> ---
>>>>>>    drivers/net/wireless/ath/ath12k/core.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/
>>>>>> ath12k/core.c
>>>>>> index
>>>>>> 0606116d6b9c491b6ede401b2e1aedfb619339a8..33aba5fceec946fad5a47a11a4d86b7be96e682e
>>>>>> 100644
>>>>>> --- a/drivers/net/wireless/ath/ath12k/core.c
>>>>>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>>>>>> @@ -1927,7 +1927,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev,
>>>>>> size_t priv_size,
>>>>>>        ab->dev = dev;
>>>>>>        ab->hif.bus = bus;
>>>>>>        ab->qmi.num_radios = U8_MAX;
>>>>>> -    ab->single_chip_mlo_supp = false;
>>>>>> +    ab->single_chip_mlo_supp = true;
>>>>>>        /* Device index used to identify the devices in a group.
>>>>>>         *
>>>>>>
>>>>>> ---
>>>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>>>
>>>>>> Best regards,
>>>>>
>>>>> NAK since this will break QCN
>>>>> There is a series under internal review to address MLO issues for WCN chipsets
>>>>
>>>> ???
>>>>
>>>> The original commit is wrong, this fixes the conversion, nothing else.
>>>
>>> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
>>> Setting the mlo capability flag without having required driver changes
>>> for WCN chipset will likely result in firmware crash. So the recommendation
>>> is to enable MLO (in WCN) only when all the necessary driver changes
>>> (in development, public posting in near future) are in place.
>>
>> Right, I understand clearly, _but_ before 46d16f7e1d14 the firmware
>> was _not_ crashing, and 46d16f7e1d14 causes a regression because
>> single_chip_mlo_supp was set to false instead of true.
>>
>> So if you read the commit message, it clearly explains the regression,
>> and the reason of the patch.
>>
>> This has nothing to do with enabling MLO, it fixes a regression
>> on mainline for current users.
>>
>> #regzbot introduced: 46d16f7e1d14
>>
>> Neil
>>
>>>
>>> Vasanth
>>
>>
> 


