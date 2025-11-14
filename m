Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81789CE7AF4
	for <ath12k@archiver.kernel.org>; Fri, 14 Nov 2025 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3bWQ8GMrssZqusnaHfetg7uXcMqTlFjBxdeS35ms5g=; b=xAADLK8Zaf9QwbbAHl312cpxV4
	KocfFlNCg5ViluKA7B1AJwoXjU+jddPN3xXgZXJou/qGP2cUcFltCc/qaXH4eI4zV9oq5B08Q1eXo
	4d3/7xoA9LV7gHRM4i5W6JfI9rhA7QzphyCsJW9anWxWqkBeH9N3qpjPotd21VHTmaTo6bTtYeday
	EWQ9cATwznROi5Jginp4ANqY5Bc3x3v6itpDzBbn2Xt5QvDh99kE+58NgUx72XzQUwKR1pcEPUdXm
	UINlDZajwbkF/f13TIkpFF+GxVQzpMV+WzUBOlcb+VFJ2LcyDLDmbl2MP0pW477Sa7goS5ad7Fakt
	qc4jW0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsIf-0000000C9EI-18dw;
	Fri, 14 Nov 2025 11:49:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsIb-0000000C9DA-3OYt;
	Fri, 14 Nov 2025 11:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2ABE743833;
	Fri, 14 Nov 2025 11:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA94EC4CEFB;
	Fri, 14 Nov 2025 11:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763120945;
	bh=cC46TDZLqw5+GYMhdoo+O522lBYA4CPjnOeOdcsc1+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZeQkJVwiXV1dOT2t+9jWjSvBpOMZLOQJxLHxO0cPMqNQ2ph31ma57WBeUzyomVa3D
	 KOrF19b9OaI+rIAMc7XH3XtY8Aqf15oqO7sFpZRWR+1OuziNB54zBYAh+oZtMSRk6A
	 ULwc11/eQpSTRUxsa+A35IwDKSG8OfyLaLS0g7i0hKnAoprHPqiK1BNfr8Ytl0CAUH
	 OU56R/ZNSk/Tm4w/kf1OKTRHvt4bzZcSYIawlUNl1Xi7bUI9+nkSR2318I2/9L22Jz
	 JeDAss0Crl48QYeBfmlD7edepkG+TL7Lc2G5IabZ90MuMBJjt9RVCXw5wTHKRm2cig
	 wQKUbwxXgMrzA==
Message-ID: <a0d238a8-a618-46e7-b4da-0f47b468aae3@kernel.org>
Date: Fri, 14 Nov 2025 12:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, devicetree@vger.kernel.org,
 ath12k@lists.infradead.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
 <3a951821-14b1-464e-b1da-05a95f4164af@kernel.org>
 <kn24jkn77ydcrn23xz6z27cvaclksmeb3ic7pr24lxsqediugl@ubkf5t4wyyrq>
 <f9d47593-6fba-495e-aedb-c0efcaa5526e@kernel.org>
 <70322e09-694a-471d-b4fc-f5a8a1c01450@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <70322e09-694a-471d-b4fc-f5a8a1c01450@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_034905_896027_8CAEF7FF 
X-CRM114-Status: GOOD (  17.90  )
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

On 14/11/2025 12:44, Srinivas Kandagatla wrote:
> On 11/14/25 11:24 AM, Krzysztof Kozlowski wrote:
>> On 14/11/2025 12:16, Manivannan Sadhasivam wrote:
>>>>>  
>>>>> +static const struct __ath_calib_variant_table {
>>>>> +	const char *machine;
>>>>> +	const char *variant;
>>>>> +} ath_calib_variant_table[] = {
>>>>> +	{ "ALFA Network AP120C-AC", "ALFA-Network-AP120C-AC" },
>>>>> +	{ "8devices Jalapeno", "8devices-Jalapeno" },
>>>>> +	{ "Google cozmo board", "GO_COZMO" },
>>>>> +	{ "Google damu board", "GO_DAMU" },
>>>>> +	{ "Google fennel sku1 board", "GO_FENNEL" },
>>>>> +	{ "Google fennel sku6 board", "GO_FENNEL" },
>>>>> +	{ "Google fennel sku7 board", "GO_FENNEL" },
>>>>
>>>> Are these top-machine models? If so, you cannot use them. The value is
>>>> user-informative, not ABI. If you wanted to use them, you would need to
>>>> document the ABI.
> 
> the value has expected format, can it not be an ABI?, from DT Specs:

Where is the ABI documented? You should not have ABI which is completely
undocumented.

> "Specifies a string that uniquely identifies the model of the system
> board" We can argue that its not part of
> Documentation/devicetree/bindings/arm/qcom.yaml
> 
> @Mani, can you not use the top level machine compatibles instead,
> something like: "google,fennel-sku7" instead of "Google fennel sku7
> board" which is an ABI.
> 
>>>>
>>>
>>> I had this question initially, but Srini convinced me it is OK to use it in the
>>> driver as they do it in audio :)
>>
>> That's sounds like an issue which could be fixed or at least discussed.
>> There is no in-kernel usage of ASoC's 'model' property, thus we probably
>> never noticed that it is an ABI.
>>
> model is actually used as soundcard name and long name if there is no
> DMI info for the platform,  This string is also used at the UCM level to
> identify the correct UCM configuration.
You speak about user-space... I did not dispute that. I said - it is not
used in the kernel.

> >
> However the model that we are referring for sound is part of the
> dt-bindings for the sound card, not the top-level model, so this is an
> ABI for soundcard itself.

We speak about the values. They are not defined as ABI and not used in
the kernel.

Best regards,
Krzysztof

