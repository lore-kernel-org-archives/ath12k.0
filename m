Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6EDD1CDC6
	for <ath12k@archiver.kernel.org>; Mon,  8 Dec 2025 02:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBAKNQNQ6lwF0FgB7TSW97QySjZwRKCBqn6ogYF17wk=; b=Oo4B4VPCEBjO9DWItwQSLW4Wcs
	26Z/4aJ/Ip67n0pPPQwBifGxSFOwhSEWaqqVBUy0WCUbcTf0iZbsxCNu5VHGXj8f4GcI7ZKzIqRFz
	5aXRn5LO07bi6Q5CZk89U1p7OBLtvOX6LC176OU5KTkOIWFFG0L7icEn5Kr1wvWTI4eOU+FWTsnn8
	FkNon8oBTBdafi0AswhiNrt3LI3DTYWulVTJhJXyej+sao683ArWXe5QDXT8bWoSga3LaYEX3mhIn
	ZFxrDkI1QEkHC05RFVGCUVi7L/+jxvLCwU4brPfBbA3xoM0UOXsJZIGnEqcQj7xNaDGV/ZFQujbFs
	moNJoSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQrq-0000000CTTg-47pV;
	Mon, 08 Dec 2025 02:20:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQro-0000000CTT2-21FH
	for ath12k@lists.infradead.org;
	Mon, 08 Dec 2025 02:20:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46DBF433C5;
	Mon,  8 Dec 2025 02:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7F4C4CEFB;
	Mon,  8 Dec 2025 02:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765160447;
	bh=TAKQ1BejKaRZJjBshOAo3jq/BYcYSUoEANnrwmHTPqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RI65BHMoNBJncsbWuTsTKsrmiPi8D4zLMYxbFWPqm6zIIqoez3U4WCyGO4Bba9mtF
	 0Jz3xUd+WKgvfz6MjExCa9pfoY/HVyDmzMswl4zzos39LssUlcZjz20ccm0rJFeurh
	 AZDbhDWdb7kNNkteH4z0/NHRy5HLrJHuFHIbjoAVbBrN4FQ5XCIPd16/S90wQsslFG
	 2b1YJ/AKtIHjTO7a1blolbsRqnTgtv4jeWHyCAWcEyhs6j/rUVOJGHnU1xhLzq0F8e
	 /qUrj7RBnCeyTfzybQtlG88avHQ+SUH5YcT8HFwnSRYUq9KSuB5zLqVFzRnaNL9+dI
	 2h40bx5Ge2xuw==
Message-ID: <40ab3a19-01b5-461e-aaf9-c3d8142fc926@kernel.org>
Date: Mon, 8 Dec 2025 03:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: wireless: ath12k: Add disable-rfkill
 property
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Rob Herring <robh@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Dale Whinham <daleyo@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251201011457.17422-1-daleyo@gmail.com>
 <20251201011457.17422-7-daleyo@gmail.com>
 <7ea43ef2-b453-46cf-a35e-ea11ca1dbe24@kernel.org>
 <CA+kEDGEjR7cGA0zZfuKkYg37mJZs3Fn7eKbgkB6hdjDLtGxjRQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CA+kEDGEjR7cGA0zZfuKkYg37mJZs3Fn7eKbgkB6hdjDLtGxjRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_182048_574744_4078E6E1 
X-CRM114-Status: GOOD (  15.56  )
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

On 07/12/2025 20:28, Jérôme de Bretagne wrote:
> Le lun. 1 déc. 2025 à 08:34, Krzysztof Kozlowski <krzk@kernel.org> a écrit :
>>
>> On 01/12/2025 02:14, Dale Whinham wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> rfkill should be disabled according to the Surface Pro 11's DSDT.
>>>
>>> https://lore.kernel.org/all/20250113074810.29729-3-quic_lingbok@quicinc.com/
>>> has added support to read the ACPI bitflag when ACPI is supported.
>>
>> It wasn't merged. If it was, reference commits, not random emails.
> 
> Good catch, It was merged in commit c6a7c0b09d5f, we will reference
> this commit instead.
> 
>>> Document the disable-rfkill property to expose one specific feature
>>> (DISABLE_RFKILL_BIT) for devices described with a DT, so that the
>>> feature can be disabled.
>>
>> This is just a circular logic. Add property to have property in DT so
>> that you can use feature.
>>
>> No, describe the hardware or actual problem instead.
> 
> Point taken. Would something like the following be better?
> 
> "For some devices, Wi-Fi is entirely hard blocked by default making
> the Wi-Fi radio unusable, except if rfkill is disabled as described
> by an ACPI bitflag on those models. Add the disable-rfkill property
> to expose the DISABLE_RFKILL_BIT feature for devices described
> by a devicetree."
> 
>> You still need to answer Rob's questions.
> 
> Indeed, we didn't answer another question, sorry. Here it is for
> reference:
> 
>> [Rob] Assuming it belongs in DT, why is this ath12k specific? Could be
>> for any wireless chip...
> 
> Agree, it could be applicable to any wireless chip, it should be moved
> somewhere else. Would ieee80211.yaml be the right target file for
> this property? Or any other file suggestion instead? Thank you.

Yes, then place it please in above iee80211.yaml common file, with some
sort of bigger picture explanation.


Best regards,
Krzysztof

