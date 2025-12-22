Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0048E6749C
	for <ath12k@archiver.kernel.org>; Mon, 22 Dec 2025 12:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzJ8OviCv3igIK4hkMi6sEc0mQb5kA474z9FbAZ7XhM=; b=Da4FkEyKsVg1vTLuzKrvXEHvfv
	0d3xaWFNgqkdXSjDH8sFJlkcTJqJ46AV5X/Y6IzqtnXujAsozZ9dB4nV06XgVthx8wIrM+Dzokxsi
	r5ZxekwvWqUW7/hHGlgQSak64JgxX4uj+iw7Lz+NBUj3cl4ZLvtPqrcW7Sh3La5LujnYARJV6Gopu
	+TMycAwxhuS9Z5BUWCA4usVILRaMJmgBQu/rzKjpj0HWh7qBmvuWv6JkSmEtQHanSOmUQOd4MsoWc
	TGDLP1paLjFDGST+/0j669xJiNbqoxQaG38TIYnpuucMt0t+hw7VxV+GcNL3IqO+SfpPJa2IYh8P7
	CZ+gI7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfEb-0000000Dkkj-2gzY;
	Mon, 22 Dec 2025 12:41:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfEZ-0000000Dkjs-3x7B
	for ath12k@lists.infradead.org;
	Mon, 22 Dec 2025 12:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE2D26016A;
	Mon, 22 Dec 2025 12:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4ED2C113D0;
	Mon, 22 Dec 2025 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766407314;
	bh=G5Zg4EHeNRLacKj+LTFhvKWt/cUI8R7NhKAOfZw/9c4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M3sFdgPZXQTBDSkFVxFGUcF+kiGNSnacJtoydMWKvbVZ6+zTIZk+HEiCdCkAOErbg
	 ui0DjVc8m2ZSfxuuRcIgi5Jhs5UyFwKFG5qCGTlVfs0oViNl+YrTLCDLr3lq3wZFKO
	 91oeaduN5OxJdxu36f7HEz6OpPgdc7Tj38W8yxFaZ2YLRSqpujFZ8ERsGqxK0TJfAg
	 DZFoF3qu5ATNBSfeYx2oj1W0V3Hos551TFtKqgb9icdxG26p3gBVKp2kzvwnL2jBrp
	 fx2L2C26w0Vg8aPOsCmCFk0ZyVxF+RfFCqWLRATG0XPdnvLlrs8+kRXugwYk00bbtQ
	 mDMG7dzYmx/iA==
Message-ID: <2ff993a7-0fda-4337-9acc-92aaa75be750@kernel.org>
Date: Mon, 22 Dec 2025 13:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>, jerome.debretagne@gmail.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <c29de60c-c7c6-45d7-8d90-616df23df01c@kernel.org>
 <v4hxei4t7n6ebvw6heoccei2t3mskq7uo7zejv6dyvvq5fr5sv@xzpsiic5x7a4>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <v4hxei4t7n6ebvw6heoccei2t3mskq7uo7zejv6dyvvq5fr5sv@xzpsiic5x7a4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Mani,

On 22-Dec-25 12:45, Manivannan Sadhasivam wrote:
> On Mon, Dec 22, 2025 at 11:23:18AM +0100, Hans de Goede wrote:
>> +Cc Mani
>>
>> Hi,
>>
>> On 20-Dec-25 07:04, Bryan O'Donoghue wrote:
>>> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>
>>>> For some devices, Wi-Fi is entirely hard blocked by default making
>>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>>>> on those models.
>>>>
>>>> Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
>>>> disabling specific features based on ACPI bitflag") added a way to
>>>> support features set via ACPI, including the DISABLE_RFKILL bit.
>>>>
>>>> Add a disable-rfkill property to expose the DISABLE_RFKILL bit
>>>> equivalent for devices described by a Devicetree instead of ACPI.
>>>>
>>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>>> index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
>>>> --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>>> @@ -29,6 +29,12 @@ properties:
>>>>         different 5 GHz subbands. Using them incorrectly could not work or
>>>>         decrease performance noticeably
>>>>
>>>> +  disable-rfkill:
>>>> +    type: boolean
>>>> +    description:
>>>> +      Disable rfkill for some devices on which Wi-Fi would be entirely hard
>>>> +      blocked by default otherwise
>>>> +
>>>>   additionalProperties: true
>>>>
>>>>   examples:
>>>>
>>>> -- 
>>>> 2.47.3
>>>>
>>>>
>>>>
>>>
>>> Is this really a hardware description though ?
>>
>> I would say yes it is. The wifi chip has an rfkill input pin and
>> things will be broken when that pin is hardwired to a fixed value
>> rather then being actually connected to a GPIO from say
>> the embedded controller.
>>
> 
> IIUC, even if the M.2 slot has the W_DISABLE1# signal routed from the host,
> the device won't make use of it as there is no physical connection. So you want
> the WLAN driver to change the state through SW?
> 
>> So I think that we would need here is not a disable-rfkill property
>> but some way to indicate in the DT-node that the rfkill input pin
>> is not connected and thus should be ignored.
>>
>> This (the rfkill input pin being not-connected) IMHO very much
>> is hw-description.
>>
> 
> Though we can argue this way, I would prefer to handle it in the driver. For
> example, with my M.2 series, we will end up describing the M.2 slot:
> 
> 	connector {
> 		compatible = "pcie-m2-e-connector";
> 		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
> 		...
> 		ports {
> 			...
> 			endpoint@0 {
> 				reg = <0>;
> 				remote-endpoint = <&pcie4_port0_ep>;
> 			};
> 		};
> 	};
> 
> Then if we use a DT property to convey the RFKILL pin state of the device, we
> would need to describe the endpoint device in DT and hardcode the state:
> 
> 	&pcie4_port0 {
> 		...
> 		port {
> 			pcie4_port0_ep: endpoint {
> 				remote-endpoint = <&m2_e_pcie_ep>;
> 				disable-rfkill;
> 			};
> 		};
> 	};
> 
> So this will essentially make the M.2 device non-swappable unless you change the
> DT since you've how hardcoded the device property in the binding. This is
> something I try to avoid to make the M.2 slot really swappable.
> 
> For this reason, I would prefer to handle the RFKILL state in the WLAN driver
> using the device specific compatible. This will be problematic only if multiple
> cards of the same Device ID have different RFKILL state and the devices are not
> distinguishable even with sub IDs.

I think we're miscommunicating here. I'm not talking about the card having
a broken rfkill implementation, I'm talking about the M.2 slot on the mainboard
having e.g. W_DISABLE1# hardwired in such a way that cards would interpret it as
having to always disable their wifi radio which is very similar to what is
happening on the surface device. Except that on the Surface there is no M.2 slot,
the wifi is just soldered onto the mainboard I believe.

Based on experience I'm pretty sure we will encounter M.2 slots which such
a hardwired W_DISABLE1# signal sooner rather then later.

So my proposal is to come up with a generic way to solve the broken M.2 slot
case and then apply that to the Surface case.

Regards,

Hans



