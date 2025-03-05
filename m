Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994E6C282E5
	for <ath12k@archiver.kernel.org>; Wed,  5 Mar 2025 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x6wONZUBfsWlOj2E3IYGYtr1M7k0FZH2clO4Vq2FEg=; b=QU/Ov6gyd6WHKAjNg0srz5zj61
	BUAjJTeKvz5EmzEjREC2UHKXyuXUAWZOW6I9XBSk4du4p9PFbnpK2Ced0lIGm6F5c6jVvZslyJabs
	dCMTn87mzz/rGMPbC8cAbFD0VJ0pTieHHYWlORXL6mBfmvMiV0JBDrA7FDg2+vdEzLerzLbZclGpc
	ctsFLkztL3dunbLhnmgWrr56KzhMIG8ZFpMXJEaB+uK6O3ijWBjZ6C/hUoH8HRN/QwREuUaSXSDrz
	P+RioC96VFKZJtDoh4Wdxf4e9vk9Xda3r903C7kUzThCQUjR0IBVYR6jdyCiInINWr2wMjvTkv78H
	vIuru/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpteB-00000008wvL-1bVZ
	for ath12k@archiver.kernel.org;
	Wed, 05 Mar 2025 18:39:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpte8-00000008wuQ-3CUD
	for ath12k@lists.infradead.org;
	Wed, 05 Mar 2025 18:39:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AkPne031403
	for <ath12k@lists.infradead.org>; Wed, 5 Mar 2025 18:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4x6wONZUBfsWlOj2E3IYGYtr1M7k0FZH2clO4Vq2FEg=; b=ixK9I0/n3F3231Pk
	GeG5rFY6fTezSzxLMzf2zzi7EpegQDyTlkleUpbuIZ6c9V1RU6tandjRfsh9KF/6
	pkIsWDAb3apUQOskOMVmhv0P6egzfbjJxL54JOD3zds9Zn2/jGScpYHJA7K7L7gX
	w9drYsOu40egdwvslCb5b8DFzGmkl0zd9i2cYU5uk98zmhVKtdvp1RN+ockJfhfr
	56fcocqtAAtp/BA5SoFyREbzwAqQj69rLl3SV9DMoKf7JW0OJax2z3WSl/Z2WGLX
	YKeR3eHOjSMb4esNUFXLAOeaUvUjNIcClC7nEwe8hYV9G2hoZzdQ6JsT43TyUAxL
	Sj+TFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t6dhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Mar 2025 18:39:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2feda472a6eso8405343a91.0
        for <ath12k@lists.infradead.org>; Wed, 05 Mar 2025 10:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199947; x=1741804747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x6wONZUBfsWlOj2E3IYGYtr1M7k0FZH2clO4Vq2FEg=;
        b=UGXGbztbKsbX1yn198uYHDBcukAC2mg+4mhSiHrvRkUBlpeKAY9TndcVX3rHyH4HhX
         b+043AtB5ML95Yd7KCK/Zv1RtT901AyPI7kdalHp0KZuluTHgfiGmuHYyhWLF/TZVgSE
         +fTJW3xp/u4cnHR6Um/xV3Ne4LNPaTWaNT/2UnIkOmpQOsL6NvJAWe0J4Gzz93jYI6BG
         xUiBvqKkrPDw50UPWTXcBudciaCMdlTRgkWUGpKm6ot4s9OeLaDkdsux1Z5ZJLksJi0Z
         xR8LgbBzqi0kl5/t98Nj0mPKhkbCk9e4qlU0eAZWF0rDtVEZ/kINE9ChG74nclFmKiQ8
         5CXw==
X-Forwarded-Encrypted: i=1; AJvYcCVYM+kVgHqC1/UIYWBpXiXThNYL3uedQMWtuyRUvbyTPAbWU4wefHgN8u8+mTcep46YEwG8xDA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIaZRIit7Oynipe4vF+IWEq76i/y/lltXaPohyCy3UfeMzuuJ2
	s3MyV6xInZSCL3lUoFcT3VvyEQe8Wzu/Bes6S/ACCEJlN8krA2mS3rrQB5VfFrI3HJiI/yoZlSN
	nhIDZ9PEqpYur8iSCBmiePxHMzmN4YJiPxom+ju816j+vecjbXqeByij/DkVn
X-Gm-Gg: ASbGnctyfwmdOjo+shFVcwwaJRCryloyv6KCh6AzGe5avPA445oVMGdtBSsEfe4JHO+
	5YeGBRyUAz7gX/VvsJ6Utv4bWqXwou68bY71eGZ0zNQwwJjxGwgLhHPL/JE+aixIJG/28DDuN2S
	O5P+wVxcfBk1AV51MfABw47EJoJ4SqpS8jHmqW2VqV11oHMIkji9Zh5dc6JcNMyJB+VBPv1Y1Qg
	taqqBDXg38kUx7TZR5HRA5HQXXrpd6uoDpywt76eYenjX+9sveYOeeNE3GayeYsT2qdVCJ9d5/4
	2oZz9EUJcRSm18lv2oGH/crVlh6HN2ZTaeAs3/MJpsblERQ1YrLCNqZsgaWGqDKvFmY7v5Bg
X-Received: by 2002:a05:6a21:1f81:b0:1ee:e20f:f14e with SMTP id adf61e73a8af0-1f349577126mr8153711637.38.1741199946943;
        Wed, 05 Mar 2025 10:39:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuSB9M02Q6a4KnrOJn0CyfVp2XReVOm6VU9oxtaY5OBN6OCEGzWZdyqwTqIJGdfdByEGgkpA==
X-Received: by 2002:a05:6a21:1f81:b0:1ee:e20f:f14e with SMTP id adf61e73a8af0-1f349577126mr8153672637.38.1741199946520;
        Wed, 05 Mar 2025 10:39:06 -0800 (PST)
Received: from [10.227.89.219] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af26a9b285csm1866206a12.2.2025.03.05.10.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 10:39:06 -0800 (PST)
Message-ID: <13fc7b10-dbaf-4df8-aa8f-9e9095657d47@oss.qualcomm.com>
Date: Wed, 5 Mar 2025 10:39:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] wifi: mac80211: restructure tx profile retrieval
 for MLO MBSSID
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
 <20250213225036.3118133-3-aloka.dixit@oss.qualcomm.com>
 <e38f01b2fe15902770cc11de24e82fcfed1aad5d.camel@sipsolutions.net>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <e38f01b2fe15902770cc11de24e82fcfed1aad5d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z1JDoEoGcEXMzqaiO53-Jkj0ohIOj7IX
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c89a4b cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oEaP63jJ1L8retAtHqEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Z1JDoEoGcEXMzqaiO53-Jkj0ohIOj7IX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_07,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_103908_815629_557FA252 
X-CRM114-Status: GOOD (  18.05  )
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

On 2/28/2025 5:44 AM, Johannes Berg wrote:
> On Thu, 2025-02-13 at 14:50 -0800, Aloka Dixit wrote:
>> From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
>>
>> For MBSSID, each vif (struct ieee80211_vif) stores another vif
>> pointer for the transmitting profile of MBSSID set. This won't
>> suffice for MLO as there may be multiple links, each of which can
>> be part of different MBSSID sets. Hence the information needs to
>> be stored per-link. Additionally, the transmitted profile itself
>> may be part of an MLD hence storing vif will not suffice either.
>> Fix MLO by storing an instance of struct ieee80211_bss_conf
>> for each link.
>>
>> Modify following operations to reflect the above structure updates:
>> - channel switch completion
>> - BSS color change completion
>> - Removing nontransmitted links in ieee80211_stop_mbssid()
>> - drivers retrieving the transmitted link for beacon templates.
>>
>> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
>> Co-developed-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
>> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
>> Co-developed-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/mac.c         | 20 +++--
>>   drivers/net/wireless/ath/ath12k/mac.c         | 33 ++++++---
> 
> This probably shouldn't come with so many driver changes in the first
> place, but in any case the changes don't apply on my tree.
> 
> johannes
> 

I will refactor some of the driver changes in a separate patch in next 
version.

This series isn't applying cleanly because it depends on another 
refactoring series I had mentioned in the cover letter:
https://patchwork.kernel.org/project/linux-wireless/list/?series=932457&archive=both&state=*

I know it is a big no-no for mac80211 changes to depend on the driver 
but sent both for the sake of completeness. It also explains why the 
driver refactoring was required in the first place, because without that 
series this current patch was even uglier trying to access tx conf at 
2-3 places, RCU accesses everywhere.

Anyway, the pre-req is now in ath.git, let's revisit this one once it is 
merged in wireless-next.

Aloka

