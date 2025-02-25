Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FAC021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2Yww8i5PD9sxDad7Sc6TNXIrj7gMeSMfS/yw5deiF8=; b=khjBs+tDO7vBgJovxUqUo+6fIm
	I+pVDKay7IS01U2PzJ/eZicKfv9APkXNRbkblUeERDXx2aar/sbDOlo8Vy/gQaV75iQHhpUt7YAqd
	6FfM5RrExZXzo4qiPHqstETDmRuXScaNBID0hFHw4npUiv8lqqloWxamTW0f0KPiYYY/5i0siVxDy
	ZuFia5kWYxNEtvEQJZD/8j2iRRRq/QvO5QZsbF/IEi6zTJyoDPn5y4AunOziUR+bV/6+rmewQfFnG
	roBXJvatYrgw7+N/Vw2D0WIM0/NPxo51qocMO4OmtESpb8nEuYLFIAiREs80eIEvthryBUwawxBFN
	npJXWjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZS-00000000a0s-0jKV
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 17:18:14 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyPX-00000000Xfz-0xrp
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 17:08:00 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so105075866b.1
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 09:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740503277; x=1741108077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O2Yww8i5PD9sxDad7Sc6TNXIrj7gMeSMfS/yw5deiF8=;
        b=n9ZIGo9CV6iGkjEQIjxqvYSzki9XrsxYego3GI1eFYrbV6aTnaDDwFtBLJQkgDyzbl
         JnwwULveOE+dZ/nxS6KWdCK+Errf1jOGeEnJSSlIchvoQa35enysrltplKZl9V8hn4RF
         c9ouWCZXRhh91NIf1/6jFtjHaFxsZ3Janw0g+TuhDez1AnXcgfmWFEiMPC+6wyVAYfzQ
         y4/EZ15mlDXryYgLjflhsh8txfav3C8sMrn225Gy0axF15Ve4mcriM/I62FO0FK9NzYA
         MC1r5kddARkXjNRpHcavTkNUxD38/uyGjDQpb0C+YJfuiIjhOhWsIVuDo1nUbC7+J5Y4
         QBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503277; x=1741108077;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2Yww8i5PD9sxDad7Sc6TNXIrj7gMeSMfS/yw5deiF8=;
        b=N1xOHhcD7xRAMZu0d4suNwKNQ5/GAQldlx5vn1v3j/WZBvozoTT35IbwFVtfHEgMT9
         ty0l/3YP1RKio9NGsc+9fECDYhwHw41//FU0viwBh68XipYEKpPdc/+Ehe383OFIF786
         tiDPEtCORn/KngtBc4JApAQSne3cHPNlJOvuoOs9o27D+yKrVL+6kCVDQkugDNt+LR4I
         PqQ9Nze+NkCm9KIEfFXttrVBgBl3uRGPgHp9sDya8hd5h6IfW8Xfc33m2+fQu4mU445P
         Mbg/6W/RMI81/GYr+CxwgZk+1C2gkKjZa3mCgmpRn9q8yT4c0stPLf4BBIau5qQffUH+
         20DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGINgqfOBJbCYN9y/M8HDlaqAsdv2ITfnSu8JGga5KFeMoiX7EaoXqsyD4VV7cZJyIXMsiTgs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTavGfcV/XCppYl8B1l3igc+jEreNXDhFpB7CFGt440R03/F8s
	d6OkSUr8P6m4jEdTcd+izW39AtN4kfsDdB5CccwGRBVluhFNcgy2ICp6l3ZZBZw=
X-Gm-Gg: ASbGncv0LGYXECa8vMXwb4F2oG5AMVXNRFxzwRLEfYK2RXwHxbgJPAvT2QIYnWNy5Ty
	IR1oSSlZp210OlYz2lxb/bXvWRQ4Uv6fZ5+jDblRp7JsDxWhgMBlMf644u7g6pA6JpLt0n+txrp
	bQCUaEbokdUY8jolB/lWjx/NJpIj7au/W4JJUt5rPKxrDvEooSTVU9/iW0GaMm9yJUTbaVofvjg
	vtaCiAz9ywd+Ia/0ZkSlgtxg3EmHJLVjOjolH/0uTQK/btyy63GXm8M897xFZwFyS6ymgdNk0Vm
	6NjvgWetw6m78oeefQEaxG027hTMRUuElLw/Xt8gw3sw84k8oH69bGT66eW5GOK+tQJB6BQm1VK
	vSsas
X-Google-Smtp-Source: AGHT+IFolR1/SB/hCyUdTCpb3AKwskzaM+cnfMctfFebsUFypTxfpk+6oEj+nPeNvivB7JnjlaXP4w==
X-Received: by 2002:a17:907:7284:b0:ab7:63fa:e48a with SMTP id a640c23a62f3a-abc099d4d36mr792150066b.2.1740503277338;
        Tue, 25 Feb 2025 09:07:57 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d55dcfsm171387966b.44.2025.02.25.09.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 09:07:56 -0800 (PST)
Message-ID: <c55f615e-6831-4470-9ea2-73fe605b8a5f@linaro.org>
Date: Tue, 25 Feb 2025 18:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath12k@lists.infradead.org
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
 <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
 <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
 <d93789c6-61d9-4761-98f5-aa3dbec14d82@linaro.org>
 <21ad3381-4d65-4c68-892d-9f485bf13735@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <21ad3381-4d65-4c68-892d-9f485bf13735@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_090759_281973_64E40071 
X-CRM114-Status: GOOD (  11.95  )
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

On 25/02/2025 17:44, Jeff Johnson wrote:
>>>>
>>>> But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
>>>> git grep), so how would driver use it?
>>>
>>> That's what I'm asking: is the property redundant or is it correct and
>>> it is a driver that needs to be fixed?
>>
>> I assume driver will need something like that property, but that's not a
>> reason to accept incorrect one in DTS. One cannot add properties to DTS
>> without bindings, so bypassing bindings review, and then claim "but my
>> driver needs them". Send proper patches for driver first which will get
>> a review.
> 
> We definitely need a calibration variant entry.
> I've pinged the development team to get the driver patch.


The patches were on the lists but were not accepted. Therefore DTS
property cannot get into the kernel. I am sorry, but this is not somehow
fluid or flexible that internal team can squeeze something into the kernel.

Also post factum reasoning is not correct, because this would open the
gate to bypass any sort of review. Just squeeze your stuff into the DTS
and then you can bypass all DT maintainers :/

All properties must be documented and bindings must be accepted *before*
DTS patch is applied.

Best regards,
Krzysztof

