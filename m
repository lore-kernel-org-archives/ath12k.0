Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E608D78770
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kxkkJnPi9GBxxRfQSUamkMaS41d/etdoL+kweUhQKE=; b=WfofXh//+qf7OPW/i1fb+rBGv8
	hsIVBwU/KJZLEVFprd2BHgTCH56s76KVykZzE6055eAtyWfnzrcwVCA3ZFJMwvdDllRIbL5Fz5TjU
	n6fMjIoNwOlUwygfw8QdjKNqp7TqnbT6vhOnGw+GJK0LZpq2nHXhYan71VS4MtV9CTRgAvFLKCeEc
	NPodIeH507HAcTTMQkr2NDmJYMfT13qaR1U8LiqV8MilMOZvxIiGSUWKzxgJd3rDemT389JaHTEKw
	ExpDL8Q9AdUJz2mD1evnEOZyoDu2d7groB9cDPvVt/j6puZUURzh4IVzxuXl/6codG+JY55++dg4D
	sgpc4exg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg88-0000000Aspf-0EVf;
	Fri, 19 Dec 2025 19:27:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWg82-0000000Asos-3RZz
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 19:27:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47774d3536dso17822345e9.0
        for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 11:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766172424; x=1766777224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kxkkJnPi9GBxxRfQSUamkMaS41d/etdoL+kweUhQKE=;
        b=FgKA2N/Tp96qNGMLXy6jEo1iXLx4rbNbDmUKoHKNUIafLHZhOwWxtqSS1+HU1kgS6S
         UvYUG9dPr/KQILJqfI0/TAfA1kw8lldZchsJJtdhbgY4zjzXRu4ANl9qsfkw9Kkn8/lh
         W4NnGWBOPp9QMcj60nXjHujOHmmTiCqQ7MdQlIEe43BKF6PoUigDBgtc/qBup3k/cFn1
         3ndvUzP4zNf462NniX/zyyJP70CvTb1260uJxx7WU7uqsR8V/Wq84nFWRrZ7yDo161zF
         wzJ8Wj/rGUieEdy27BtyOkyeLRmqPcBdmFKWkhZVmG34KdpfUlY6OjICGeG5891oFloq
         h1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766172424; x=1766777224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kxkkJnPi9GBxxRfQSUamkMaS41d/etdoL+kweUhQKE=;
        b=jTSbICwpAD/mdIiMBaXQa0sO149w8Wxs395LbcBFghGfXzv/Fozg7sY0BprL6Q6J1c
         Pdgl2Vq2e2+IwPfe7qiigYRcX14tXDRIzczYPz/OlaAmtG/UawobNRc9sUOKNEwY4RCN
         +jcK5xjKJzUyucHfl2ZDHrC0ABzlUIIH74EuOwD6/9db8x25Te3b3Zi/bJqV9R7n7XKQ
         2yAOjJXBAL4hT6QKy9JsIpYhmYNWPtWu+8TI4y5Cn6pMlv/iJmoD9MiTUBqMfse0Ci9l
         5goiyQW5mOZbkUoB1TOcI2IsfjX37Beq8onxJxiz/e1NptISDS0lkV/VqF1374x8/Ukf
         Mr3A==
X-Forwarded-Encrypted: i=1; AJvYcCUBGVP+1yriz5krc3Y+MA1MP4g6vwmAHAL9AC78UuWxxMQQyUl60vQfLdj6HRoeU1IzlsHy/5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyD5/avyDt/i+WgkQ5sCm05tnKaovkn+BB/PIp4aU+STdezjELV
	mMxDgk31Fue0jL+Llik1vKG0nzh3JcVFC6aV4/nLlsJpffADDa/ggmMT
X-Gm-Gg: AY/fxX56Q89uVRcucl7BKWXR/a7ILayw7BxKg7ySN23mbJgJzSyHuOClb+GyR4oNmy8
	yYsHs5TScdC4SDYEkyP1J8FqZbj1dJKXU8JQxVvT+YNZkUJmceAUFczDfg9bh03jW9QVGUBds6w
	jjHsvLZjtE98mUFdrrS2TGwdHrxh9D+dJMhmBw2prQ6lXgq5nLyy8C5wrPIKBo4sWTK+P+hOXuP
	fRn1AB6crqLjTGVnhL1Y7ViqpV6NnBAsHZCzM20qXCN001R+JA1ue7EAAmzVWoPyirJT+wMBCNs
	j4TLPZOVf6EWN8GA+rJOjaLjv/I+TajvbXE6ZjnkTrkGHOKmKmNZc3+FLx+idInaozkdYpvKKEi
	Pfz2K7OXing9x9E30J2oVhT5QeBWNH6zd75i3/yR27RibpJY4Yu5kCmsIqSXx+YirdOnXAT4OaK
	Mn/1a6BZZ8t6onZPpf/mlzLAeNKaZKQ1U74qTOCYNH8u9upluobOuyVMyGNP/xWluAEnolOR6gh
	EG8PXOd
X-Google-Smtp-Source: AGHT+IHqqrUl2vSl0/wNfOnsIYZIIhJ1dpHJbH2MQVzIZ0EaTbpy5rMArQU7ewGjw++aIHXKYVdtyg==
X-Received: by 2002:a05:600c:4f08:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-47d18b83218mr39401345e9.1.1766172423809;
        Fri, 19 Dec 2025 11:27:03 -0800 (PST)
Received: from [192.168.1.10] (92.40.201.212.threembb.co.uk. [92.40.201.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193e329asm57197755e9.15.2025.12.19.11.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 11:27:03 -0800 (PST)
Message-ID: <d4a87f75-92a3-4c09-9f9c-e906f0b7ae70@gmail.com>
Date: Fri, 19 Dec 2025 19:27:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: Krzysztof Kozlowski <krzk@kernel.org>, jerome.debretagne@gmail.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-5-7bcf83c1504a@gmail.com>
 <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
Content-Language: en-GB
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_112706_882773_C5346EF7 
X-CRM114-Status: GOOD (  10.13  )
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

On 19/12/2025 17:47, Krzysztof Kozlowski wrote:
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> How exactly is this copyrighted by Qualcomm? I don't think Qualcomm ever
> prepared DTS for this, so can you point us to the original work?

As mentioned in the commit message, this device is very similar to 
Microsoft Romulus (Surface Laptop 7).

Its associated device tree (x1e80100-microsoft-romulus.dtsi) was used as 
a starting point for SP11, and so I felt it would be courteous to keep 
the original copyright notice there.

If this isn't appropriate, then that's fair enough and we can remove it.

-- 
Best regards,
Dale

