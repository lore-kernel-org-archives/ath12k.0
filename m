Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A1DC28B30
	for <ath12k@archiver.kernel.org>; Thu, 20 Mar 2025 07:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DG/5sD4Uvf9BOqZKHlnsUC3tiWerZEGqI1/LRL2gjes=; b=x9Pf0usAdPrCSJPvKtUnHG1Myf
	liRiF9DizqCC8xgYOqH19uHPVYJz82P05gOo0dWz+LTJPlt4epXGPFiyZPIZyx0rLQ9LzOprXva1Q
	8o1zXTXn4cOQSvMadZQ/K9bM+NQBzpD2dNea+4FchyQRy8AwVCKxcjSGB0kGxLfKXM1eyycSNui5v
	rIWSFeIvcXjtf90Duh/OdVyQaj42595ichQ7Dyif/RDBN9Lb4Qz018HzOC/27OZt7WlctLHzeBuQd
	N51Z6pLVe2m5rdamow5hmHSS/dZ/magmXNFdqQyTYbjaKcGbY1wMWtjl0bTmvb83JWTHIhcPcq5Md
	HQnWiUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAFp-0000000BOyB-1EfX
	for ath12k@archiver.kernel.org;
	Thu, 20 Mar 2025 07:23:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAFm-0000000BOx5-1FHw
	for ath12k@lists.infradead.org;
	Thu, 20 Mar 2025 07:23:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z0hO019538
	for <ath12k@lists.infradead.org>; Thu, 20 Mar 2025 07:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DG/5sD4Uvf9BOqZKHlnsUC3tiWerZEGqI1/LRL2gjes=; b=owaW0wef5EtBNa2H
	sEoUuyguN9WHKrJPo2z+rX/YirJK/kBA+rdQKnOizcOie3QeuQcGaAj89xatWOkt
	LtM/YpAtWJY4pKHQj/LuQugBo0Ewmh29jq2UM/PjtVj/EsN6eW3x7fv0EeiLu99M
	L7mt+uNvAF347509tfj2bNpzVUiRbV+BCY0qLvGWgzZjxOM+leM1KLfUmo/FDXBZ
	IyA8O+5kyjGthgd12x2g3Nw+U/YH/eZ96DuMx2ngnQA2iw9Oj+2YYxULH3pgkrur
	aFkC8TQgliO+k3gARLmHV+Qij+OPDAuz7NRajsJ7pUNMY5WfzBOMv3B6VAU7i7WN
	LeQ4gQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf1ff3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Mar 2025 07:23:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-300fefb8e25so812897a91.3
        for <ath12k@lists.infradead.org>; Thu, 20 Mar 2025 00:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742455423; x=1743060223;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DG/5sD4Uvf9BOqZKHlnsUC3tiWerZEGqI1/LRL2gjes=;
        b=r0LfQ3iRdfhza/SCowNn6vPZLxqjPE2KB6uC6MVv5W+TzG90DkPQ6T9TBXeGwEnl0e
         CiYV9ycYAtyurVCN69YBb6jpWjceHJvy9l0tUd9IDuuLBZ9B7mTyzS8721cali1TDhmO
         Fp0FzY4CIo0MtH41AKsQ2ymXL95x1uItaVntxXMZRKQz3ptWkPEQMLpuvMeopXl2iUz3
         Zfd9MvQ73p2BzEb01fKLWOY/JXbiSKB5MvDAJaB++jd3SqHkGpRfWT2cRBvW3BL7WbDo
         Mlf6j+d3CCxNd2a26j0JD0RV/1G+5ovemCzKs/tnUNNwOMY/PXJvFTBEE6FkohgGTP/V
         jFVg==
X-Forwarded-Encrypted: i=1; AJvYcCV2Pac6Np6JA+KXMhPsAX/SdFSAMHlj7uEKL9UTa0xa3HxlY0oex9ZsrzFmxWR8o7zAfyopsus=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiHcr1A1ww5qJI7Jw1V4dD1LywiJhAMz8FKyAB44spW0BG5Ya6
	/bUWBE1wMlNkIXXXBOgm0TftgMqaBxbZbC9kV+cqbzAwQoNEnJQ1OYe9jsdQzGIp/bEsXD5Tmpq
	OYlmaYH2kKblkYotSasEwSGD6CMAras2vR/yrzF+a0hbdNCfqLKmpqwiqvZhlnXHKAb6t
X-Gm-Gg: ASbGncuRMtiTgxHVfxRGjsJ8PmQ6H5dbzYf9UEmGnXDFGqtDIeB0+FEVoXPREIIYJGW
	CIc8xjtJt7T0n8IAmgXYwY/qsUEgyI7Q+3dJ103V5d+usHx7LTMe0IJh2WC7b33YTWw1x/O0O2D
	m/67kAPHoPwVclygRC/xggkxN8k3OlB/oHMLq/QUlGYvv9ieIzXmCfMaAY49n7IEES0l6YxqtMm
	NTAyW4M0XMu/VRU4Lv8zhh7zg8XiHbJaBIIriUh3K0N70uQAQ+DQeLQHHRfSz3ympZKoR3bBiyY
	Iy09PP4cTVtnWGpuL6SRKPxaZ+1sisO5qkX0sLK4B0u4EvStROHYaMUXWA==
X-Received: by 2002:a05:6a20:7f9f:b0:1f5:8622:5ecd with SMTP id adf61e73a8af0-1fbecd36dcemr12362570637.32.1742455423578;
        Thu, 20 Mar 2025 00:23:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6vL0FKiT0FrUm64NWVT0vyhZLgbzJ4G/pmtWfyzAlb6pKCq5XuCaqJLVhL29ETCkhsjK99A==
X-Received: by 2002:a05:6a20:7f9f:b0:1f5:8622:5ecd with SMTP id adf61e73a8af0-1fbecd36dcemr12362537637.32.1742455423217;
        Thu, 20 Mar 2025 00:23:43 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea0408fsm12218652a12.42.2025.03.20.00.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:23:42 -0700 (PDT)
Message-ID: <c556876d-01af-a6b7-51dd-2748d6d0bbba@oss.qualcomm.com>
Date: Thu, 20 Mar 2025 12:53:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, neil.armstrong@linaro.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
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
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <hmfvyajygmjoeaaashmddu4rg6ttzn7es4sjls5qvnemykkx2l@zuzixrzkmkgx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tWctkRT-jN4Rvw5pl8hNvhEh-xZCwqb7
X-Proofpoint-ORIG-GUID: tWctkRT-jN4Rvw5pl8hNvhEh-xZCwqb7
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dbc281 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=fppTZj3WDclMhW0upbEA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_02,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_002346_477427_70E4F853 
X-CRM114-Status: GOOD (  33.28  )
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



On 3/19/2025 7:03 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 06:24:57PM +0530, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 3/19/2025 5:21 PM, Dmitry Baryshkov wrote:
>>> On Wed, Mar 19, 2025 at 05:02:39PM +0530, Vasanthakumar Thiagarajan wrote:
>>>>
>>>>
>>>> On 3/19/2025 3:57 PM, Krzysztof Kozlowski wrote:
>>>>> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>>>>>>> ---
>>>>>>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>>>>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>
>>>>>>>> NAK since this will break QCN
>>>>>>>> There is a series under internal review to address MLO issues for WCN chipsets
>>>>>>>
>>>>>>> ???
>>>>>>>
>>>>>>> The original commit is wrong, this fixes the conversion, nothing else.
>>>>>>
>>>>>> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
>>>>>> Setting the mlo capability flag without having required driver changes
>>>>>> for WCN chipset will likely result in firmware crash. So the recommendation
>>>>>> is to enable MLO (in WCN) only when all the necessary driver changes
>>>>>> (in development, public posting in near future) are in place.
>>>>> Really, these are your answers? There is regression and first reply is
>>>>> upstream should wait for whatever you do internally. Second answer is
>>>>> the same - public posting in near future?
>>>>>
>>>>
>>>> May be I was not clear in my response. I was not telling MLO bug fixes were
>>>> in the development. Actually the MLO feature itself is not enabled
>>>> yet with WCN chip sets. Any code changes enabling it without full feature
>>>> support would result in firmware crashes with the existing firmware binaries
>>>> available in upstream.
>>>
>>> Is there an undocumented change of the behaviour in the commit
>>> 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
>>> single_chip_mlo_supp")?
>>>
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>>
>> -       if (resp.single_chip_mlo_support_valid) {
>> -               if (resp.single_chip_mlo_support)
>> -                       ab->mlo_capable_flags |= ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>> -               else
>> -                       ab->mlo_capable_flags &= ~ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>> -       }
>>
>> The above logic seems to keep the initialized intra MLO support even when
>> single_chip_mlo_support_valid is not set. The above code removal is correct as
>> MLO support can not be enabled in host when firmware does not advertise it.
> 
> Ack
> 
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>>
> 
> You skipped an important chunk:
> 
> -	ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
>> +       ab->single_chip_mlo_supp = false;
> 
> Is this an _undocumented_ change? I think it is. If the developer has
> described that the commit disables MLO, there would be no such
> questions.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>>
>> +       if (resp.single_chip_mlo_support_valid &&
>> +           resp.single_chip_mlo_support)
>> +               ab->single_chip_mlo_supp = true;
>>
>> The above code does it in right way. Overriding firmware MLO capability as done
>> in the submitted patch under review is obviously wrong. The firmware used to report
>> the issue seems to have an odd behavior: 1. it does not seem to advertise MLO
>> capability in single_chip_mlo_support bit and 2. expects configurations to enable
>> MLO from host. None of the WCN firmware available in upstream either advertises
>> MLO capability or expects configurations to enable MLO from host.
> 
> Additionally, from the commit message:
> 
>      For the WCN7850 family of chipsets, since the event is not supported,
>      assumption is made that single chip MLO is supported.
> 
> However the code doesn't contain that change. Instead single chip MLO is
> unconditionally disabled.
> 
> I guess, Neil's change should be reworked to be limited to WCN7850 only,
> however it must be done as it is what was expected from the commit
> message.
> 

There has been lots of rework gone in to ath12k driver towards enabling
MLO support for QCN chip set. As of now, MLO boot and runtime configurations
are restricted to  QCN chipset. WCN will not work with those MLO changes.
Re-enabling single_chip_mlo_supp equivalent (single_chip_mlo_supp got cleaned up in 
ath/linux-next) will create issues when MLO gets enabled for WCN. Driver
changes/hacks to support this non-upstream firmware specific behavior will
become a major challenge over a period as new features are getting added in driver/firmware.

Vasanth

