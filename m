Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DE8C27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FM+aVg/aLs/YZhzeREUgae8873jG8UYvkZRvVhjl35A=; b=lyhaogWSC0cnH7EYhHkQPsnffc
	41PoGkquZ3ULINK9dYOh6vOZDwKkhDrIQ7cyUPK8zLLxqzRgiLm7+DzPBaWXykXfJAJoTivk9iAVa
	ZNGPf/jO8ltUyFSjsZThdqXLSN5sDWcflLJpcbKtBHpoHw/iItHYLaiDh6zAgzX3+9Q2RfTDZdMMu
	NaapnyJiHA0a/fz5T/vYkb1DGQQIepTgIVA99+yArWIHSuVf+UbnLM4NkJDrh6YoD+AIksJvusWKW
	eZfPhfgXkXkDKLVzLgGQ9ZDSW5KAIOBq69zN3KM+U6U1T5VkHk/qPv0j6/H4CN5Fi8QoyuVlPTBNp
	yVRXXzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTHV-0000000CjlJ-2qoQ
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 06:40:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTHS-0000000CjkB-1ioX;
	Fri, 07 Jun 2024 06:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7CFC2CE1D07;
	Fri,  7 Jun 2024 06:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE1BC2BBFC;
	Fri,  7 Jun 2024 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717742451;
	bh=o4pvJBigImph+/4WxTGAX2YQ/B+mm8RB+o9aqeUkiBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T1d+RYtXCMgCPqWf0bG8FaiDQ9qYrVNW9jgDiDEa63tl0QR9uvL7Bc6/2j08QP3Wj
	 F+R2M1U0gLlwFkHy+YoLcQUe3UK3v1ZENu4/g1qpZ71Jz4Tf+AISiq+1wCQBGLn6fO
	 m/bOnQgZ80INfygz+9JNBm19Yy07j56kuMjRsuivs5RjNQEIhNo0NZWV9KhmD/NUW+
	 MypX18hbrzyHTyzEI4JOvQXzo/cjwuxtqr+ec5eTBbhOpK5obwam+SbzGL5U4MP71N
	 YEISl5BFTS3g+Xah2Vh8ChcwVxkkO6bIWZyaZNceH0sstGSvVW38MZDgcK8mfehNfA
	 sep3CsbS2KZsA==
Message-ID: <8db01c97-1cb2-4a86-abff-55176449e264@kernel.org>
Date: Fri, 7 Jun 2024 08:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe
 the ath11k on QCA6390
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kalle Valo <kvalo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240605122106.23818-1-brgl@bgdev.pl>
 <20240605122106.23818-2-brgl@bgdev.pl> <87h6e6qjuh.fsf@kernel.org>
 <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
 <871q5aqiei.fsf@kernel.org>
 <CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
 <87sexqoxm9.fsf@kernel.org>
 <CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_234054_832552_4306683B 
X-CRM114-Status: GOOD (  31.63  )
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

On 06/06/2024 20:08, Bartosz Golaszewski wrote:
> On Thu, Jun 6, 2024 at 6:16 PM Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>>
>>> On Thu, Jun 6, 2024 at 4:02 PM Kalle Valo <kvalo@kernel.org> wrote:
>>>
>>>>
>>>> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>>>>
>>>>> On Thu, Jun 6, 2024 at 3:30 PM Kalle Valo <kvalo@kernel.org> wrote:
>>>>>
>>>>>>
>>>>>> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>>>>>>
>>>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>>
>>>>>>> Add a PCI compatible for the ATH11K module on QCA6390 and describe the
>>>>>>> power inputs from the PMU that it consumes.
>>>>>>>
>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +allOf:
>>>>>>> +  - if:
>>>>>>> +      properties:
>>>>>>> +        compatible:
>>>>>>> +          contains:
>>>>>>> +            const: pci17cb,1101
>>>>>>> +    then:
>>>>>>> +      required:
>>>>>>> +        - vddrfacmn-supply
>>>>>>> +        - vddaon-supply
>>>>>>> +        - vddwlcx-supply
>>>>>>> +        - vddwlmx-supply
>>>>>>> +        - vddrfa0p8-supply
>>>>>>> +        - vddrfa1p2-supply
>>>>>>> +        - vddrfa1p7-supply
>>>>>>> +        - vddpcie0p9-supply
>>>>>>> +        - vddpcie1p8-supply
>>>>>>
>>>>>> Not sure if we discussed this before, but based on this I understand
>>>>>> that there can't be an DT entry for device pci17cb,1101 without all the
>>>>>> supply properties? But there are QCA6390 devices with PCI id 17cb:1101
>>>>>> which do not need these supplies and already work. For example, my Dell
>>>>>> XPS 13 x86 laptop is one. Or anyone who manually installs QCA6390 board
>>>>>> to their PCI slot and some of them might want to use DT, for example
>>>>>> setting qcom,ath11k-calibration-variant.
>>>>>>
>>>>>> This is not a blocker for me, just making sure that we are not breaking
>>>>>> any existing setups.
>>>>>>
>>>>>
>>>>> If they are already powered up without the need for the PCI pwrctl
>>>>> driver to do it, then they will work alright. Bindings don't affect
>>>>> functionality.
>>>>
>>>> Sure, I'm not worried about functionality. I'm worried that if I
>>>> there's, for example, an ARM based setup which uses DT and wants to use
>>>> a similar QCA6390 board that I have, and set
>>>> qcom,ath11k-calibration-variant in DT. In other words, I'm worried if
>>>> you are looking at this only for Snapdragon family of boards?
>>>>
>>>
>>> No, what I'm looking at is the entire QCA6390 package. That means WLAN
>>> *and* Bluetooth *and* the PMU that manages power.
>>
>> I think we are just looking at this from different point of views. You
>> are looking at a datasheet (most likely for a Snapdragon based system)
>> and I'm looking what actual devices there are out in the field.
>>
>>> If you're using the QCA6390 on a device-tree system then you should
>>> probably model at least the WLAN node and the PMU and the problem with
>>> supplies is fixed.
>>
>> But why? If there are boards out there who don't need any of this why
>> would they still need to model all this in DT?
>>
> 
> Because this is what is there? The goal of the device tree is to
> describe the hardware. The fact we didn't describe it before doesn't
> make it correct.

Correct.

Kalle,
All of the devices out there need these supplies, but they are sometimes
provided by generic PCI supply and on-board regulators. Basically your
PCI adapter is not the same as QCA6390 chip on Snapdragon board.


> 
>> Based on the discussions I have heard only Snapdragon systems who
>> require all this configuration you describe. Of course there can be
>> other systems but I have not heard about those.
>>
> 
> DT is not configuration, it is description of actual hardware. It
> doesn't matter if Snapdragon systems are the only ones that actually
> *require* this description to make WLAN/BT functional upstream. The
> chipset would be the same on any PCIe board, it's just that the host
> systems wouldn't need to take care with its power sequence. But for a
> dynamic board like this, you don't need DT.
> 

Correct.

...

> 
>>> If your detachable board "just works" then it must be wired in a way
>>> that enables WLAN the moment it's plugged in but this doesn't happen
>>> over PCI. The chipset has a power input and GPIOs to enable each
>>> module.
>>
>> I don't know how the boards are implemented but it could be so. But from
>> host system point of view it's just a regular PCI device.
>>
> 
> And you don't need DT anyway for this type of devices.

Detechable board, like PCI adapter, derives these supplies from generic
PCI whatever-3.3v through additional regulators. All these supplies are
there - on the board.

> 
>>> Also: I doubt you need DT for your detachable board?
>>
>> Sure, I don't need DT but that's not my point. My point is why require
>> these supplies for _all_ devices having PCI id 17cb:1101 (ie. QCA6390)
>> then clearly there are such devices which don't need it? To me that's
>> bad design and, if I'm understanding correctly, prevents use of
>> qcom,ath11k-calibration-variant property. To me having the supplies
>> optional in DT is more approriate.
>>
> 
> We require them because *they are physically there*.

I understand that for all known DT QCA6390 hardware, the supplies should
be provided thus they should be required. If in the future we have
different design or we represent some pluggable PCI card, then:
1. Probably that PCI card does not need power sequencing, thus no DT
description,
2. If still needs power sequencing, you can always amend bindings and
un-require the supplies.


Best regards,
Krzysztof


