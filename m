Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA79CC36000
	for <ath12k@archiver.kernel.org>; Thu, 20 Mar 2025 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef93EvBdMpDqmUh6kx0QLTgICnU6/6SZCOXaKlyYf2U=; b=vpdIUZrYEd/hPD/oZaREt5xZai
	dVgoVCo9LZGg/h4ZSLm2V9zEnFcqWG4mFm6YBGd1zN8T2OA8z6NmtaICpkqkUJ0gDKNSga0d8LkVP
	6qlf+kpKnU6ColHcmTToxro8f6/I4GzialLYJnYAFGZmPPdLT1pRJFsB14A6Zc6dryWHrAfKpj+Nj
	4j0OcpCbu/Kgs8pF7X06xkwdrKvCaRbfzn3ZlqS6NPKx09gDu5zIfeq8yhrs0skpK00aheAgo/Ej0
	bc4SCqwhy6C6geMYmQqulAeL/4s5zfug2DhaO0KEHBQQaov5hkyvXnfg7hofIJ+NzYCttTXaKChfa
	QTRomD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCog-0000000BmWw-2yoJ
	for ath12k@archiver.kernel.org;
	Thu, 20 Mar 2025 10:07:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCnK-0000000BmRY-1vI3
	for ath12k@lists.infradead.org;
	Thu, 20 Mar 2025 10:06:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43690d4605dso3374905e9.0
        for <ath12k@lists.infradead.org>; Thu, 20 Mar 2025 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742465193; x=1743069993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef93EvBdMpDqmUh6kx0QLTgICnU6/6SZCOXaKlyYf2U=;
        b=s6wQP9dUjOfcnK3bcoGxQCdQOTZbye55e8K7YqK7ENKCqa94PM4ywcxc2IQwB7Au0E
         agKI0lMUSQkVXjlRdvcYCi2m/i1eE7laKWgBYEWh3SwuLAXFwy8LEcel3OvTr2HD182G
         OlV4OqvEfFWGfJsQ5a2omC8gvMC4WpJ+E/GbCD+62E3SkhKIvx2iHrhYbDTQvyZbmDYv
         MhfWAeIhjtsGi8XzvgZGAOE81KwS08Um52yeFk8A1Uj8kNtj1pPKtW7PtsVlXOvuBUlV
         cQGz4uYz0j8kcmTe2fuKLPbuUDhW0HxbOXGRB6KLBwg5r15Gu8RNovuCyaqhpvZQDyKe
         BnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742465193; x=1743069993;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ef93EvBdMpDqmUh6kx0QLTgICnU6/6SZCOXaKlyYf2U=;
        b=DCzTwJtg/C0r9gQr02y/BHnATGrIKVh4RTDnAzq6KfiI7U0CEWZqOJ+kmkPBwspq0e
         8Y8jqwYGJ1Z92Qc3ZJyyc8SPisoKvAFsWNT1cPrQxwgOPr6jFCgyaNKT0R00nG/0usZe
         ovLVn6ZnSEx5UZEcPah0dOCdO7psNk97iMAaxL5159lR8FfTAG+pLWZkTkNYdYfATOH0
         47tWUuAP2I0eTyOka2kR7aJ6VpNtKWu5Ovd5vZ7XVBjvuZFM6dVhAeJCLnHeCO3ccxpT
         qkRII0mC77AV9o/Xa5IciY8+9cjbugsRCAlVM/t188VQU/0+hNzHcsiz5nIDURnxCFnS
         pm0A==
X-Forwarded-Encrypted: i=1; AJvYcCVmCMzsV1+aJeE4yeP5Vy1OawFsRzsMnQj/TxG+ZmCDki02f7J804AsM3Zb3AmkxK77GiTI0DQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwPYgk2q5OypuZjQskZGGbZgYaJSQszjCEy29lqZilbMQBz9y1
	VdnDGgwEGaNut6ISnC+WFSvocZGIag3WO/MCb/Ojg9OrgCvS1bDE4r/gU2qQSJs=
X-Gm-Gg: ASbGncva26nVODvZhhuleli/C8pP5AXqVkTJEj1qoKOAqo9scRutuSFWgvNz87aNGgO
	mbFJA83xSAUGGp92TWhOXFsvk4wA0R2g2rxqjavOLZSbMwWo/js85DkLhPwL4aL1Rf2OB0st03Z
	gOMo9Jvbx0Gg0bwftYx8ikhJT1F3P4jtpRUF4GzZHL9psdFXwJzFVfxWVJ/mfPfuxqTV4I4E9Sg
	1UAMyryPMso3yIIQmT3FtScwuFgngCG6b8Z4MlX/A/ptlugyVsPABug6XheGHwETdfgNtMZw13H
	t8VrAx9Gmz4c2hVbAHZHOzi4QIAisvSFT1lhYhfGsy68HW9rsCnnfjjk5QJkuW6XkEF/od69I2D
	D4vZSjgg0Ne+HDsZp
X-Google-Smtp-Source: AGHT+IFs2kUJ2yBcT1Hej45544hEo1UrQ1/ldZ8xLV3PQovPYI/9lDfWv1Fm3js+MIioMjHCm6lcnA==
X-Received: by 2002:a05:600c:1f83:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-43d4383d55bmr49232035e9.26.1742465192777;
        Thu, 20 Mar 2025 03:06:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3bd:568:f697:d1a2? ([2a01:e0a:3d9:2080:3bd:568:f697:d1a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43cbasm43375265e9.9.2025.03.20.03.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:06:32 -0700 (PDT)
Message-ID: <bcc653d4-ef34-4a2b-9843-a7e9f43bdb23@linaro.org>
Date: Thu, 20 Mar 2025 11:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Aditya Kumar Singh <quic_adisi@quicinc.com>,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
 <db232678-fa85-d75f-de72-d2b5e1ec611f@quicinc.com>
 <2a5hvicenftfiktviiofvknanyz756cbryu35gkfczdvbcdd5j@fktlzfieotgl>
 <c6e3b0c1-18fe-a9fa-0e72-d955809144e3@oss.qualcomm.com>
 <hmfvyajygmjoeaaashmddu4rg6ttzn7es4sjls5qvnemykkx2l@zuzixrzkmkgx>
 <c556876d-01af-a6b7-51dd-2748d6d0bbba@oss.qualcomm.com>
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
In-Reply-To: <c556876d-01af-a6b7-51dd-2748d6d0bbba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_030634_505621_2E44082B 
X-CRM114-Status: GOOD (  32.16  )
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

On 20/03/2025 08:23, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 3/19/2025 7:03 PM, Dmitry Baryshkov wrote:
>> On Wed, Mar 19, 2025 at 06:24:57PM +0530, Vasanthakumar Thiagarajan wrote:
>>>
>>>
>>> On 3/19/2025 5:21 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Mar 19, 2025 at 05:02:39PM +0530, Vasanthakumar Thiagarajan wrote:
>>>>>
>>>>>
>>>>> On 3/19/2025 3:57 PM, Krzysztof Kozlowski wrote:
>>>>>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>>>>>>>> ---
>>>>>>>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>>>>>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>>>>>>>
>>>>>>>>>> Best regards,
>>>>>>>>>
>>>>>>>>> NAK since this will break QCN
>>>>>>>>> There is a series under internal review to address MLO issues for WCN chipsets
>>>>>>>>
>>>>>>>> ???
>>>>>>>>
>>>>>>>> The original commit is wrong, this fixes the conversion, nothing else.
>>>>>>>
>>>>>>> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
>>>>>>> Setting the mlo capability flag without having required driver changes
>>>>>>> for WCN chipset will likely result in firmware crash. So the recommendation
>>>>>>> is to enable MLO (in WCN) only when all the necessary driver changes
>>>>>>> (in development, public posting in near future) are in place.
>>>>>> Really, these are your answers? There is regression and first reply is
>>>>>> upstream should wait for whatever you do internally. Second answer is
>>>>>> the same - public posting in near future?
>>>>>>
>>>>>
>>>>> May be I was not clear in my response. I was not telling MLO bug fixes were
>>>>> in the development. Actually the MLO feature itself is not enabled
>>>>> yet with WCN chip sets. Any code changes enabling it without full feature
>>>>> support would result in firmware crashes with the existing firmware binaries
>>>>> available in upstream.
>>>>
>>>> Is there an undocumented change of the behaviour in the commit
>>>> 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
>>>> single_chip_mlo_supp")?
>>>>
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>>>
>>> -       if (resp.single_chip_mlo_support_valid) {
>>> -               if (resp.single_chip_mlo_support)
>>> -                       ab->mlo_capable_flags |= ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>>> -               else
>>> -                       ab->mlo_capable_flags &= ~ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>>> -       }
>>>
>>> The above logic seems to keep the initialized intra MLO support even when
>>> single_chip_mlo_support_valid is not set. The above code removal is correct as
>>> MLO support can not be enabled in host when firmware does not advertise it.
>>
>> Ack
>>
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>>>
>>
>> You skipped an important chunk:
>>
>> -    ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>>> +       ab->single_chip_mlo_supp = false;
>>
>> Is this an _undocumented_ change? I think it is. If the developer has
>> described that the commit disables MLO, there would be no such
>> questions.
>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>>>
>>> +       if (resp.single_chip_mlo_support_valid &&
>>> +           resp.single_chip_mlo_support)
>>> +               ab->single_chip_mlo_supp = true;
>>>
>>> The above code does it in right way. Overriding firmware MLO capability as done
>>> in the submitted patch under review is obviously wrong. The firmware used to report
>>> the issue seems to have an odd behavior: 1. it does not seem to advertise MLO
>>> capability in single_chip_mlo_support bit and 2. expects configurations to enable
>>> MLO from host. None of the WCN firmware available in upstream either advertises
>>> MLO capability or expects configurations to enable MLO from host.
>>
>> Additionally, from the commit message:
>>
>>      For the WCN7850 family of chipsets, since the event is not supported,
>>      assumption is made that single chip MLO is supported.
>>
>> However the code doesn't contain that change. Instead single chip MLO is
>> unconditionally disabled.
>>
>> I guess, Neil's change should be reworked to be limited to WCN7850 only,
>> however it must be done as it is what was expected from the commit
>> message.
>>
> 
> There has been lots of rework gone in to ath12k driver towards enabling
> MLO support for QCN chip set. As of now, MLO boot and runtime configurations
> are restricted to  QCN chipset. WCN will not work with those MLO changes.
> Re-enabling single_chip_mlo_supp equivalent (single_chip_mlo_supp got cleaned up in ath/linux-next) will create issues when MLO gets enabled for WCN. Driver
> changes/hacks to support this non-upstream firmware specific behavior will
> become a major challenge over a period as new features are getting added in driver/firmware.

Making sure a driver doesn't regress with a fw is a major challenge for everyone,
this is why we CI test the kernel on different platform and make sure
it still works over time.

Please share your roadmap with the community and add some documentation
explaining which firmwares & features are currently supported and which
features are in development. It's something usually done in a TODO and
ROADMAP file in the driver directory.

And honestly, please report a warning in the kernel when using a non-supported
firmware version, because Qualcomm ships hundreds of different firmwares
with cryptic namings working with different driver versions and the situation
is honestly impossible to handle for developers & customers when setting up
systems based on mainline Linux.

Finally, it seems you only test the WCN on an x86 platform, and since you ship
the WCN along (at least) the SM8550, SM8650 and SM8750 SoCs (which is like millions
of phones) and since those SoCs are pretty well supported in mainline Linux,
these targets should be validated aswell since they have different power-up
requirements than the standalone PCIe card.

Last note, there's no "upstream firmware", the linux-firmware repository is a handy
collection of firmwares shared by vendors in a central place with clear reditribution
licencing, but it cannot be considered as "upstream" like the Linux code is.
So expliciting which firmware version is supported in the documentation and the
code is the preferred way.

Thanks,
Neil

> 
> Vasanth


