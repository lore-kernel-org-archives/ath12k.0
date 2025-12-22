Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93483E67482
	for <ath12k@archiver.kernel.org>; Mon, 22 Dec 2025 11:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ef0bbnBgCYVrSin3EOE/SniXYZveUfNurTIze3IY15Q=; b=Wnx7fOf98WCdbHQdbN6+rEuK1k
	SELPjQAjJyjvQ0k8JU55CFdvtGyBmzexFUpJef21E1V3ULEM3KXLHftn51YAhaiJpgr6uu6i1lv2g
	/rUiKv7kCGao9nlxyg/0e8NOQSwHvRGacySBWkLlBKcDhLVI++pCVT4wi8AnXA6RQ/KS5JDEJpIvw
	0ItHs5fP/6W4NhicZ2ldvgCmazkO6XIUkyaFe8URSH6bFNA1GcsgZ2p1q4sxX9nKIIR83YsCaef3v
	Ah1YClVrQW4NhA77bDPh1QzQnnc9ZDBf/sYLip9VzqrupLyg5WDTCthepk1sNutU0bVszprViP/1a
	cZ3dpDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdi2-0000000Derr-0whZ;
	Mon, 22 Dec 2025 11:04:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdhz-0000000DerJ-39Yq
	for ath12k@lists.infradead.org;
	Mon, 22 Dec 2025 11:04:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1725343821;
	Mon, 22 Dec 2025 11:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB64C4CEF1;
	Mon, 22 Dec 2025 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766401450;
	bh=LYlcMODPLkUEBzkj4mBlJMnQUZyDN1PsH2qTjXgyWDI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JLRjgbVWlDzoqbhDmYQv2sKg8oNDpwyp7cF//k80XVFPyMd/wIdXbz7QdEBfRwrj8
	 /+o0byTyHGm66hVqrg/E8l3256/rS7ylLjoUTbjdgXOZH59OGcoo8T2d32k5c/4GfD
	 lQ4fKMdc2YkWDfLMmYuSpmC40lLfuX1xDU6nuh0hdmkbixRE5NNyh7tDeeCz3PFu3c
	 /7n5Mf0JjqliC8XgEK4r4/W9KAEiRcT9Z1E1cAihsXFFOtemuBbpLfhOAui3aI7XUA
	 XonrLy9IXls194qPLE049Gzgk0vtcZjcCyFsh8nUQBwjy8PaqTFyGcpeWKJalVNTr6
	 iPnBjC4YWKvcA==
Message-ID: <9b1b461c-f456-44ed-8c46-3405286fc532@kernel.org>
Date: Mon, 22 Dec 2025 12:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Hans de Goede <hansg@kernel.org>, Bryan O'Donoghue <bod.linux@nxsw.ie>,
 jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jeff Johnson <jjohnson@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <c29de60c-c7c6-45d7-8d90-616df23df01c@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c29de60c-c7c6-45d7-8d90-616df23df01c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_030412_008201_8FA0C2F8 
X-CRM114-Status: GOOD (  26.67  )
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

On 22/12/2025 11:23, Hans de Goede wrote:
> +Cc Mani
> 
> Hi,
> 
> On 20-Dec-25 07:04, Bryan O'Donoghue wrote:
>> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> For some devices, Wi-Fi is entirely hard blocked by default making
>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>>> on those models.
>>>
>>> Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
>>> disabling specific features based on ACPI bitflag") added a way to
>>> support features set via ACPI, including the DISABLE_RFKILL bit.
>>>
>>> Add a disable-rfkill property to expose the DISABLE_RFKILL bit
>>> equivalent for devices described by a Devicetree instead of ACPI.
>>>
>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>> ---
>>>   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>> index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
>>> --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>> @@ -29,6 +29,12 @@ properties:
>>>         different 5 GHz subbands. Using them incorrectly could not work or
>>>         decrease performance noticeably
>>>
>>> +  disable-rfkill:
>>> +    type: boolean
>>> +    description:
>>> +      Disable rfkill for some devices on which Wi-Fi would be entirely hard
>>> +      blocked by default otherwise
>>> +
>>>   additionalProperties: true
>>>
>>>   examples:
>>>
>>> -- 
>>> 2.47.3
>>>
>>>
>>>
>>
>> Is this really a hardware description though ?
> 
> I would say yes it is. The wifi chip has an rfkill input pin and
> things will be broken when that pin is hardwired to a fixed value
> rather then being actually connected to a GPIO from say
> the embedded controller.

You still do not describe the hardware. Read my comment.

> 
> So I think that we would need here is not a disable-rfkill property
> but some way to indicate in the DT-node that the rfkill input pin
> is not connected and thus should be ignored.
> 
> This (the rfkill input pin being not-connected) IMHO very much
> is hw-description.
> 
> Also see the
> "[PATCH 0/9] Add support for handling PCIe M.2 Key E connectors in devicetree"
> series and then specifically:
> 
> https://lore.kernel.org/platform-driver-x86/20251112-pci-m2-e-v1-7-97413d6bf824@oss.qualcomm.com/
> 
> Which adds:
> 
> +  w_disable1-gpios:
> +    description: GPIO controlled connection to W_DISABLE1# signal. This signal
> +      is used by the system to disable WiFi radio in the M.2 card. Refer, PCI
> +      Express M.2 Specification r4.0, sec 3.1.12.3 for more details.
> +    maxItems: 1
> 
> What if there is no such GPIO, because the W_DISABLE1# signal is hardwired
> in a specific implementation of the M.2 slot ?
> 
> In that case we will also need some way to propagate that info to the wifi
> driver, having some sort of generic devicetree property for wifi-cards
> which can be injected as a software-node property in the PCI-device being
> instantiated for the WIFI card to let the driver no not to honor to
> W_DISABLE1# signal will be useful here too and this is as hardware-description
> as hardware-description can get.

Please do not use antipatterns as examples. Above patchset is obviously
wrong there, it's a terrible example but also completely different thing
(spec). This is not a spec here.


Best regards,
Krzysztof

