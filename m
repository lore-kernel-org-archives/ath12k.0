Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAB0C35FFA
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPFvbCwo+PRCHaD6jfdENXZY2EG3HCcoClKlZq94Cy8=; b=HJPbjtXHlurFpwiSh03HqN7k4G
	0gi3QBbgwjjMyoygfKDPAdeVhpNyD+SgxV4PEV0maq3T2PXS2VboXOJt/sARzyjamU8pGhj+9cSnp
	YYqWyGv78mcybNOuh2h7ihb8ySHnPDZO6GcVJFH9k4nNk1rLV9xKVHSPu4fo4YJLC05apxrtpwKq6
	PgvRyueYj0A/jkzU0FNvc1w7kwSpmpPgjXUb586XOlVj/Rhs12IrheletcqrMFHsuEqTd8Df0QODv
	C3DkiaTsUuik1Uds+bVVK+iZFGyun4gWbCc2F3k4q5D0l0jEg5D7yKXj1rZVYEXfCw9lVg4RN/9Iu
	pufZjcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqaU-00000008eTM-4AZN
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 10:23:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqYj-00000008e6W-3Em4
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 10:22:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf257158fso29120015e9.2
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742379720; x=1742984520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPFvbCwo+PRCHaD6jfdENXZY2EG3HCcoClKlZq94Cy8=;
        b=DcXvTt9bsm/sxZ3e92+Gx9dJeeZJCNUUSMpCQHNkuqxcGIE76eQWQB9i/dvtoofWJ2
         MkFj2lHYM9P10XA3yf/f08ffRymoB2EBVrfUhV+1/W0FP0p+3dYFP4BSXQd/aqsfdgaY
         kcvSSizdNkPeZuJXrBT48uyKevhElabQU5rmCHTMTeuAxnLpgYCdzgwRF/BzDdK2L3lN
         RqWUSvB4lZdyj+7CEwyMtRfAw61vKu80ag5zFxWGGp0ehZg4y8Q0fTHkM/S10lco8q68
         WP5TbhN4OkqwulCzTp1BGckC3XJY0r74p6g+17xlIEEYJ0lZBGjHV9wLS3rIHNnd+13K
         aVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379720; x=1742984520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PPFvbCwo+PRCHaD6jfdENXZY2EG3HCcoClKlZq94Cy8=;
        b=PpICC8EQiQunuBl79UAfvQiwLTGINJW1bXYxI/vxTywQ5XPrakY/Lnyg1LBcrvbBZd
         q6+vME2mNnQeX4fPcJaSVARzZ2ygzhwZ27Y+/dtV2WrFh0HyXum0UDQz9wZoa0u9u5Ms
         GF3Quxs2BJsIsAmK3bUlN4w7gDvqUqMc81UOyLH3Z6qiE4nZWWwS0dpIohNTZl+Pbdjg
         i3s+scHOu49K5v/PsCauVmw+mI3X4PQJiU1BdmIaEEL+3LY4cGc6J+gunamhDKSPLa1L
         i7YNb01QDbz8OL6qN8kEgifb3hHQGqtGDX+5shvyoiX9z+YZAKjsUh0q+joN8gl1LQ5f
         KLMw==
X-Forwarded-Encrypted: i=1; AJvYcCWZhLoscEGhvPbnBNOUusNbB2dwjt118Gr2mZYMNntM1kZ3d3TRccBadjwX/6a0+OM3rkUbEAc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwD9i11vtgKeHYnGOv0Ck3Q3nxIs+DOJBFDKORfrADwYE4F+S6t
	WPyIynBI85iHpYa61kmII+spsA7qJb3BEO3owfTeWV1sJWnQRaIppwSHcF0/drZohbts75HL95n
	K
X-Gm-Gg: ASbGncursQCRFsGqi4YzQ20BLfuCMARNsM9yLtec9VEutdZZvJ9vMgA+RaLsiMqyW4k
	5MY+hQRvh8fd7DcAp5TCCV5FMxmIw3gx6QuFzLNuXsBG2tTR48rw7nyOm2I4j6hNFoIlaFMebsh
	6h0zi+n9RKDrURXZLCeblLliJry+HqXR5GluSPnhloXJYPa+l1izhNxB2EY2+50rc1YTU4J49Jn
	FfOa1p0N+w3FVKji6pHQcZpF7/3582fr/WPsNhgBIPN6/bVCpqNqKrNiao6nJ+03m1vDLv5GKL1
	i82pyp2bBsHkWvxgn9i2gc244/uUPQyDNvo6rfXe4nEZszcKtflGGWKuwRQGrSrRCnF/JGrulfs
	I7/NFxKVQEfeVeMLsY81Hcg==
X-Google-Smtp-Source: AGHT+IF7qsUFGh7b/cZ62KfV0CEOIKewRH8TrAKUxQUlzKd+BTZTQCyUCBgYT9vnQFSO9Z26J4XamQ==
X-Received: by 2002:a05:600c:3b07:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43d4378d067mr14030935e9.8.1742379719772;
        Wed, 19 Mar 2025 03:21:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f407:ab81:b45a:93e8? ([2a01:e0a:3d9:2080:f407:ab81:b45a:93e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f33242sm14664945e9.5.2025.03.19.03.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 03:21:59 -0700 (PDT)
Message-ID: <42932860-dd78-4eed-b8ba-6eca1c7099ef@linaro.org>
Date: Wed, 19 Mar 2025 11:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Aditya Kumar Singh <quic_adisi@quicinc.com>,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
 <6717d816-02b3-4d27-848b-620398808076@linaro.org>
 <4pidr33bvbtykyufw35ubfr7mut2ypqmoiydgjlcsyxolqteze@j2xhigdoxqhp>
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
In-Reply-To: <4pidr33bvbtykyufw35ubfr7mut2ypqmoiydgjlcsyxolqteze@j2xhigdoxqhp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_032201_824503_E08932AB 
X-CRM114-Status: GOOD (  13.34  )
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

On 19/03/2025 11:18, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 11:00:34AM +0100, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 19/03/2025 10:46, Baochen Qiang wrote:
>>>
>>>
>>> On 3/19/2025 5:12 PM, neil.armstrong@linaro.org wrote:
>>>> Hi,
>>>>
>>>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>>>
>>>>>
>>>>> On 3/19/2025 1:34 PM, Neil Armstrong wrote:
>>>>>> On 18/03/2025 17:35, Jeff Johnson wrote:
>>>>>>> On 3/3/2025 7:00 AM, Neil Armstrong wrote:
>>>>>>>> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
>>>>>>>> single_chip_mlo_supp")
>>>>>>>> the line:
>>>>>>>>       ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>>>>>>>> was incorrectly updated to:
>>>>>>>>       ab->single_chip_mlo_supp = false;
>>>>>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
>>>>>>>>
>>>>>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
>>>>>>>> crashes on driver initialization with:
>>>>>>>>     ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
>>>>>>>>     ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
>>>>>>>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
>>>>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>>>
>>> this FW version is not upstream yet, why are you testing with it?
>>
>> I was not aware the driver supported only a small subset of firmwares.
> 
> Yes, this has been communicated by Kalle (and now by Jeff) for ages:
> using any firmware outside of linux-firmware is not supported, unless
> you have been explicitly told to use a particular binary. Firmware
> coming from the Android / Mobile might use different knobs and have
> different expectations regarding driver behaviour.
> 

The patch remain valid nevertheless, the 46d16f7e1d14 changeset remains
bogus and needs to be fixed whatever the firmware version or ongoing work
to fix MLO in the future.

Neil

