Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF6FCF5368
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTxpINqgd6fE9maHMnhx0ejrYZsOprEHPT/54Sgbo/I=; b=MSLA55J5OI5PecSSH17eVCSt+w
	vaf0KNkVhGbZOWKb+5+LX7THKzsCrqzSSUZJ+VHviTOmOZ4sBrSzWJuzfeyP5cdratKR010pGV+rY
	xWJ/EGxHxUlWG8jr8athNkBBbh026+ZC32mFGDoixywNwVkD0RGr8muXXSNqZLpMWSId8U5pv4kvs
	4KxZaTogG+3OTUBWzvIZcdti2LuGQGPFslHF029oW9/Ro+HDBxGrsk8qpwq33HE4Cj7obfcWIcmEe
	/5c6kCkNP/8PPfRUXdEgC2dw6eJi4y4yHtK/yZerHt4KFssYiskKHgGy7AR16mB5hOtE8pbKBVAwX
	RCuyUpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aM4-0000000EJ38-3mAg
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 12:20:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aAQ-0000000EGaq-1Sdb
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 12:08:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BF1EA44C45;
	Wed, 23 Oct 2024 12:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84640C4CEC6;
	Wed, 23 Oct 2024 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729685324;
	bh=F3oVWNgIClwObbZ786CTcXhGTYxKdHNsWla3wR2/wGg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EvKMFIP3M8vkM4ZW58KdPKtmIehEQyM8FHsKpCHfIOhW8RWY8Ua8XKlFEGpadMddX
	 /TgAaKC6fI+xVlh/BQ1jFl4gt54EYbOEk3MvICqac0SDZHaDFp/xrhu3TabdkdZyxd
	 HU0gQLh6p0EsNkKauvBXcT4/ZLUf6paGuFDKfSWsSOsx3Y/aOkZsVfDxzvPnOLQ91u
	 bqUptE3GqcWTDaSLh9jWFB3yBXBUOtW1e66k6YvKrgj+XTXCJ/mBWuI2A+Qwb97FYh
	 glRNPdw2kohcyhARw2Eg3ArJM7YgBXEhNCbuBfVKCuojfDut12ef2j6poKlQhowhxi
	 HhJuMRxRQA+Sg==
Message-ID: <50c0f184-030b-4a19-bf8a-077505170f03@kernel.org>
Date: Wed, 23 Oct 2024 14:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] dt-bindings: net: wireless: update required
 properties for ath12k PCI module
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
 <20241023060352.605019-2-quic_rajkbhag@quicinc.com>
 <87db3d68-ab1a-4cc4-9857-416de39cea0f@kernel.org>
 <e2c1ce1a-89af-4feb-a21a-9ca2578430e7@quicinc.com>
 <b97b8350-3925-40b0-8f87-f89df429a52a@kernel.org>
 <e7b27f57-efb2-45ea-bbe0-e5aeb90cbff9@quicinc.com>
 <606083d8-4332-45e4-be41-08ca5425cc03@kernel.org>
 <94defe49-c87a-44f6-8768-03f3d6687ac3@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <94defe49-c87a-44f6-8768-03f3d6687ac3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050846_539501_F8E7C6B4 
X-CRM114-Status: GOOD (  20.29  )
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

On 23/10/2024 12:28, Raj Kumar Bhagat wrote:
> On 10/23/2024 12:29 PM, Krzysztof Kozlowski wrote:
>> On 23/10/2024 08:53, Raj Kumar Bhagat wrote:
>>> On 10/23/2024 12:17 PM, Krzysztof Kozlowski wrote:
>>>> On 23/10/2024 08:45, Raj Kumar Bhagat wrote:
>>>>> On 10/23/2024 12:05 PM, Krzysztof Kozlowski wrote:
>>>>>> On 23/10/2024 08:03, Raj Kumar Bhagat wrote:
>>>>>>> The current device-tree bindings for the Ath12K module list many
>>>>>>> WCN7850-specific properties as required. However, these properties are
>>>>>>> not applicable to other Ath12K devices.
>>>>>>>
>>>>>>> Hence, remove WCN7850-specific properties from the required section,
>>>>>>> retaining only generic properties valid across all Ath12K devices.
>>>>>>> WCN7850-specific properties will remain required based on the device's
>>>>>>> compatible enum.
>>>>>> Just not true. These apply to all devices described in this binding.
>>>>>>
>>>>>> NAK.
>>>>>>
>>>>>> Don't send patches for your downstream stuff.
>>>>> This is not for downstream. This series is the per-requisite for ath12k
>>>>> MLO support in upstream.
>>>>>
>>>>> In the subsequent patch [2/6] we are adding new device (QCN9274) in this
>>>>> binding that do not require the WCN7850 specific properties.
>>>>>
>>>>> This is a refactoring patch for the next patch [2/6].
>>>> It's just wrong. Not true. At this point of patch there are no other
>>>> devices. Don't refactor uselessly introducing incorrect hardware
>>> Ok then, If we squash this patch with the next patch [2/6], that actually adding
>>> the new device, then this patch changes are valid right?
>> Yes, except I asked to have separate binding for devices with different
>> interface (WSI). You add unrelated devices to same binding, growing it
>> into something tricky to manage. Your second patch misses if:then
>> disallwing all this WSI stuff for existing device... and then you should
>> notice there is absolutely *nothing* in common.
>>
> 
> I understand your point about having separate bindings if there are no common
> properties. However, the title and description of this binding indicate that it
> is intended for Qualcomm ath12k wireless devices with a PCI bus. Given this, the
> QCN9274 seems to fit within the same binding.

Feel free to fix it. Or add common schema used by multiple bindings.

> 
> Additionally, there will likely be more properties added in the future that could
> be common. For example, the “qcom,ath12k-calibration-variant” property (which the

You are supposed to add them now, not later. See writing bindings. They
are supposed to be complete.

> ath12k host currently doesn’t support reading and using, hence we are not adding it
> now) could be a common property.

What is "host"? Either the device has this property or not. Whether host
supports something does not really matter, right? You have hardware
property or you have it *not*.

> 
> If you still recommend creating a separate binding for the QCN9274, we are open to
> working on that.


Best regards,
Krzysztof


