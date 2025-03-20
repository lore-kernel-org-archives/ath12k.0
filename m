Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4A3C28B30
	for <ath12k@archiver.kernel.org>; Thu, 20 Mar 2025 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsTKzQd+0EkTWpAX3OmSlSj7NCNCv0EtzNWUjH+/fWo=; b=FnTErLFCiAp/Lh6NwGr/x3gZrZ
	SHeGf/eQwlamyNZwBeUwmWU0vzUdzdZjZEouVX6LpdgrPkhl4zUUs9yPPtnXXSHvowC3gYUZlB/EL
	lSgcfq9ljWM0u5GFDJdFd/9CMqsjJ3vi4FE7DCRG4prBK2yG5fdLBXQVZDJTh6FK3wP9eL+mbp3ZT
	VhzCsNTu4qK7KTTZ0myQ4zFMA/fNoAI5XTECU7iwLZhTzMhrPzsarEp2Z07OjoG1LMmo/hP3VoVBH
	dUBMU3BiQvEGjHjiRJ9N6pHLYXGN7LryakdItY3R/s+2ox3AKcm28mdDxzjpwMHT2mR41v1zfgKZw
	O6sx14dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCvS-0000000Bn7f-14Qb
	for ath12k@archiver.kernel.org;
	Thu, 20 Mar 2025 10:14:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCvQ-0000000Bn72-09e8
	for ath12k@lists.infradead.org;
	Thu, 20 Mar 2025 10:14:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso6105925e9.3
        for <ath12k@lists.infradead.org>; Thu, 20 Mar 2025 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742465694; x=1743070494; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsTKzQd+0EkTWpAX3OmSlSj7NCNCv0EtzNWUjH+/fWo=;
        b=pmI+fgSVWBut/lKqajGCRCVX9HjPmg4Wopwiq2z3TyMqWAUIZ4hbl29O69/DvffYWo
         VvEu0dMzoa60RqTFUEYVlgwwKv0YCZsHR9GEf87EqHTvK1BWAdJ2vjjCD0FIXx3D3QNo
         GNpMPyefInBggRXCp7whwFM9nZiAm3RD0m1yOpDGBXIVSC949rRzRD+9iE4dtZc7ROSw
         lEm0nlPm55/lF30XhZ7dgBuswMQAe82CiHhy8S9T5Hz7VrEYaLEOl3AvmjraEBMOEGLr
         2Zu6vEZpjgSzn127rksrPVuh3Ku0tzwIBfBzWHYRaDjaZQdSMk8FfFoHeGEd8i+AMaC2
         30uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742465694; x=1743070494;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KsTKzQd+0EkTWpAX3OmSlSj7NCNCv0EtzNWUjH+/fWo=;
        b=l06jMq8EACEcLbUW8E9wVCYuS+M7YitxlWrvHP4JrC2IUow6xRsXKZ8yHljyiv+XYG
         Z0tJg2Qbn2zsw4Z9BRAwG4mUbQHuMDICEPkFIARc0qCFLK/oFhomtP2qORbPYsBIkX2k
         MxZ2GnC/cQu5Ny7Z+TKIeW+rNPGXulwsfnzym7MC7qmQJIoFqb/pVjrBEgQn9VZq9Dvd
         lNQx1qylODD3arUsNXFJUuqAd0Ep0DbVN3xDkYOaC+Xu5XM+eMiyYmWjo1x6ZDqEuuex
         qtScg35LZq9/t3h9K4f6xlyTFrT57oqKbklmhz/3AYuHiR62Fns8/HheiAzJu6Psk5fK
         eF7w==
X-Forwarded-Encrypted: i=1; AJvYcCXK76Q2DcmPCLuEEMsi8M9MFQrft/5LD7zgRDpmo3jJZs1sUlQPsSb5ea99YdniGl/mV0NQ/PA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwISYlL7ZgnKMqylj7JoWme7zepA5oskd9hdbxhge2is8exo+Bq
	iiBzw8A6nSjkAGDLVtR0v7b3Y1y0cjsmhCLyyd4BNTMQxiiiX1zJu6py6k6pOkU=
X-Gm-Gg: ASbGncs3ISKdAWPudzSXZM1WBYjxmXqVFGlR16mI3Djxq9yU/kfECDnH2z3vpRMSus8
	w+CsHWXFf8X6hz0soEgxn28ID1L60ppTJbb5oT/2UCcScrFqgka6jF52pPCW8C4MMiDa0Nm2oCD
	TMqyo3rH2s1kO/iEq4s+V04j+92fgkrwHEJb5i+fYRXEKGohBAoAOEiL7wBmVLq8oI7HfFgVO3Z
	Vxva9qWZglMnmwKmgg/tBkPcZZYvvRq+29Tk7x1IhnhLLRC/QfLJecacxoaeitmrm/zFNpq0Gcd
	nzHaNBi/Emev4U5uqV4/pg7fgfiJ5L0kwMQkSY75Ho+jIzwM8JgbqRN10BEDoykCZvcgrYmCsDJ
	6w5p4UF6m3ZGTT9Mb
X-Google-Smtp-Source: AGHT+IFim8WXF4Bw641hmtsIGi/r9529B0IxX/j4bUMRvtVtznNxhRUIgBVI1Lkw4lHn3sf2W9z0JA==
X-Received: by 2002:a5d:59ae:0:b0:398:9e96:e798 with SMTP id ffacd0b85a97d-399795a8cb5mr3197534f8f.13.1742465694455;
        Thu, 20 Mar 2025 03:14:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3bd:568:f697:d1a2? ([2a01:e0a:3d9:2080:3bd:568:f697:d1a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b7656sm22861868f8f.40.2025.03.20.03.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:14:54 -0700 (PDT)
Message-ID: <2fafed58-4959-41ca-b0e1-c10a8da60aa1@linaro.org>
Date: Thu, 20 Mar 2025 11:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
 <770daf27-ae9c-4ed5-87d0-aadcc3b74bbd@oss.qualcomm.com>
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
In-Reply-To: <770daf27-ae9c-4ed5-87d0-aadcc3b74bbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_031456_080027_5BFC9950 
X-CRM114-Status: GOOD (  20.88  )
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

Hi Jeff,

On 19/03/2025 19:32, Jeff Johnson wrote:
> On 3/19/2025 3:27 AM, Krzysztof Kozlowski wrote:
>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
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
>> Really, these are your answers? There is regression and first reply is
>> upstream should wait for whatever you do internally. Second answer is
>> the same - public posting in near future?
>>
>> Can you start working with the upstream instead?
> 
> There is a lot going on in this thread. I want to address the big picture. It
> is no secret that Qualcomm has historically focused on downstream drivers, and
> upstream was mostly an afterthought. But that mindset has changed. Qualcomm is
> fully embracing upstream kernel development, and has actively recruited (and
> is still recruiting!) experienced upstream Linux Kernel engineers. And in
> places where there are shortcoming, Qualcomm has partnered with companies like
> Linaro to bring in needed support. So Qualcomm is very much "working with the
> upstream." We may not be working well sometimes, but many of us are still
> inexperienced with working with the upstream. We are coming up to speed.
> Specifically for Wi-Fi, we have a large number of engineers who have primarily
> worked on downstream code who are now working on upstream (including me!). And
> we still have the issue that many of the products we are shipping now still
> have a lot of downstream DNA, especially when it comes to firmware interfaces.
> So please bear with us as we learn and evolve.
> 
> Please keep the constructive feedback coming. And remember, the more detailed
> the feedback, the easier it is to incorporate the feedback.

Thanks for all the feedback, all this escalated mainly because the 46d16f7e1d14
commit doesn't do what is written in the commit message, and there were no clear
sign MLO support with WCN firmares would be removed shortly and redeveloped later.

As final note for this patch, do you have any timeline for when MLO would be enabled
again on WCN chips ?

I'm happy Qualcomm is embracing mainline development, but Qualcomm still ships
hundreds of different incompatible firmware and downstream drivers variant in the
field, and this makes system integration very hard.

And as you mention the partnership with Linaro, we are very happy to help
and support your mainline development over time by reviewing, testing and
reporting.

Thanks,
Neil

> 
> Thanks!
> /jeff
> 


