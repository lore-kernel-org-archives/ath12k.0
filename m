Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CE9C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNm9CF22nxSn0y6dAdKNE8VFXGgWPtm2tN0cbfkS55c=; b=wTCVzRrJ9R95B0P3JfnlbmI3TZ
	hcrHD8GZibm5Xq5lT4/xmL7uSxdxA6BMVs0EMOYw8DFrpEgootQT7FZ0idmMbYmzaSfzNCam8jat8
	HXJ2weN0EY0sMuRwD102XcnV/EFPv0aH9oEk6s9QYIFDoN2PKt3jliL5FTnAgTkUleMNkJZFuPyac
	XcOffdV1wDe0piXy1oICoSS/mfZXaLBlP30tlhqd1R2ku7nO5Lybq3xcNJUbXIzvXlP336kMe2FTJ
	aS6EKqzn25tk7aFXo03KCX+fKZs1flz3OfUPQ42NFa58DgnrDxdlV0c679f8rVuJ3e7A0xgifLh1i
	OA0aTB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsdp-0000000GvVs-1WJC
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 10:58:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms57-0000000Go3i-0oml
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 10:22:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab7f9f57192so71832066b.3
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740478947; x=1741083747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sNm9CF22nxSn0y6dAdKNE8VFXGgWPtm2tN0cbfkS55c=;
        b=B4bcska7H0nj3K0zXJ3zqZJHf4vZ6et2bwF5Ykz4lD71w/lEZ64EstF6+qEcOsBumU
         VHL5qSP/4FrMvoPtEAhLgR+yJZ/PUwB0GM4oAE9m9QvZ5yOrryQeflAghGN1uKHlv7Un
         KQmz0HHlVHN4GPizA177WZRk52DQlBaLPiN1K7iz5svp3D9IlsZTSlIoZ8KfvLjSGcY5
         hRTZupK9h7KnIn2bprraF3yVkpSpIV0K4M0K9W8kJa5I+BWkB4kN1X2JA4c03IcSbS6s
         dXRJKROEq3zK8yJtViADwAL8/MlDtg6/9wu4yBXJK1yrqzkUKSkNimLy31NsU53VLhVb
         bKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478947; x=1741083747;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNm9CF22nxSn0y6dAdKNE8VFXGgWPtm2tN0cbfkS55c=;
        b=vNhIqhDJGaO4MtmViXY6uCstN1ZxJxKNo/35QRTWywgqyACq1UtnBCqQC/WLvxPhso
         Qgx5pV5ZTY6myU64vrG6Z5h0TT/D1u+guXIKXTPIoJs2Y9N8TgP+tDSXnYyu4/ygOb+1
         ytE0yx3tJCbzNNU56D5xx9DlscR/03FpMPgLzD0uUuFrXRF6T0Hg31cxvt5E3SRIYUMA
         waORbuKZsiMOfpqpNfQpMJSwYCgOqQZFzQ3RldEhsVSgPL3xkHC+nxNjqPTAR9HoKWtj
         w50uBGzORhprkPoeMeHQIT70BJjodgcuMZjSYM63allyutcBuCdNLYvA+2zJFbiwt2sb
         dH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhTaygiLGv0/uFEOGnzqt9yVws39swSJnS52KGSqmOjpsVNrxjb45rxvyaCk975XcSGRyfWVQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxRUvlZd5sz0MgexywuWPWCm3YLauWR3rESQGPF+ty9OrKEnE3
	pIvHwdeUHkILar2X/FwDhDrj2JrD8RGNjM1Kl8xn9BYW/Sl+XbQ0IqIeiYWL7Ug=
X-Gm-Gg: ASbGncuUZxheWHBLrfsj4JvR+AhHIYV3Hq2NGAAQFb8NDS0EFD5y72F4A1SzB5vnOru
	R65ChcNyDO/JCl/XjNpH3Rw6vi2GRoFVoIpVyixMIGkTdC5i/lZ8H4cRYbLpFqCfnFxHpnD5+mJ
	oMAKDJlvCHSfchFKWf+jWEjjG5FUz/3BjXjbyIa4RLbZf//CiLgN/orRaNmZVUsNMJrS0yUflkN
	A+AMJaOeXgKj4fgR/6ytTeDOuK9HYOFWonGZRpyz7zvnPn3WXIJLO/nmZ/2xqX39RDYN5T2s6IW
	dhmLidOS9gWehZhVj+MIJXqQ0qOtCDc3PuVuFIjOgS5vIE08wmYiDjLrs5JrJ3cCFpazNLSkh2x
	jmYRs
X-Google-Smtp-Source: AGHT+IHtffeLLh1yLu7nCHYhcNqtippdudVEDeBKKKKJEXeyYUCZJ5Ybf+sLAGKVXPIbB1aDmboHMA==
X-Received: by 2002:a17:907:7e90:b0:abb:ebfe:d5e9 with SMTP id a640c23a62f3a-abc09becfd6mr572181266b.9.1740478947358;
        Tue, 25 Feb 2025 02:22:27 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20122b0sm117367966b.107.2025.02.25.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:22:26 -0800 (PST)
Message-ID: <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
Date: Tue, 25 Feb 2025 11:22:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath12k@lists.infradead.org
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022229_242049_18B1746A 
X-CRM114-Status: GOOD (  12.85  )
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

On 25/02/2025 10:50, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
>> There is no such property as qcom,ath12k-calibration-variant: neither in
>> the bindings nor in the driver.  See dtbs_check:
>>
>>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
>>
> 
> Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
> calibration variant in case it is not running on the ACPI system? I see
> that it uses dmi_walk. Does it work in the non-ACPI case?


But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
git grep), so how would driver use it?


Best regards,
Krzysztof

