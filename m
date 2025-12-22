Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA9BD711D5
	for <ath12k@archiver.kernel.org>; Mon, 22 Dec 2025 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfU7WQ/PhIR7yU5X2qiBDZbkFz7RvgCdn6hITkLbAbI=; b=vXLn5IljDcNmQFR9hAavguLAhb
	jev/P3eGedr2Fsdwawl4KCIzXfo/k9Wehn28RwHc+NGmNVfWwNAk3K0eFaFe9LkvDNzJkcU+USEKP
	FS1mc0RMX0UBp48fATJoPaglXyuiHx+D0/6ZqRy8oh0lYgLIzRNrCc/o6SVtCDl1zRs29weoeeeqy
	MFkx6NtNPVYFKHjiAq3i7/reUrS4l0TGnt9ZvRbhyEwRUNHk2DdhLLkXywE6MW5LF/uOQEusBNtEB
	f//DlGxCwiw7+BWsDuSmDjVD2Eblo9bAfiH6BFO7kVIKO3DprfFoDL3f3sB28KU9YBiS6tN7J4Xvs
	nrGO+9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd4b-0000000DcOZ-3HI9;
	Mon, 22 Dec 2025 10:23:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd4Z-0000000DcNq-31MV
	for ath12k@lists.infradead.org;
	Mon, 22 Dec 2025 10:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E4696001D;
	Mon, 22 Dec 2025 10:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06207C4CEF1;
	Mon, 22 Dec 2025 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766399005;
	bh=FWAzzIL1x1PVb5pw3WRq7KOwgjGFCl6UQKfwo1uVKc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W6sC2IcnGt71ZuEzFn7MTJ1rEEbh9mKgXHqAPPCWUdldtNqvlcVWixNcjVm5Eik0F
	 eSXvXLLEciWBV8hJYFtCVePMBiFkkhYWC/bkDYyeW7RghoZH0nJBsWTISXH4VNAOYF
	 yOTYfti6RyDab3wgQwkyy4SIMNB5MJeZseAuvsyM3rZoh5UIVlgTCjqSxFHkmRt+gH
	 G93m47K3btiYtzavzG0INPh7iU7fGO9XMazOuYPMQW8ZEzzxkEmA54utKlvC19keww
	 oAXOZ3ILDjmAimwFm7PiFfqFVAE3gQ3v0ox4gy50qkWFWHzlV3ru5gXR+2Ui9k/7Gi
	 POjGFbhai9UPA==
Message-ID: <c29de60c-c7c6-45d7-8d90-616df23df01c@kernel.org>
Date: Mon, 22 Dec 2025 11:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Bryan O'Donoghue <bod.linux@nxsw.ie>, jerome.debretagne@gmail.com,
 Bjorn Andersson <andersson@kernel.org>,
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
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

+Cc Mani

Hi,

On 20-Dec-25 07:04, Bryan O'Donoghue wrote:
> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> For some devices, Wi-Fi is entirely hard blocked by default making
>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>> on those models.
>>
>> Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
>> disabling specific features based on ACPI bitflag") added a way to
>> support features set via ACPI, including the DISABLE_RFKILL bit.
>>
>> Add a disable-rfkill property to expose the DISABLE_RFKILL bit
>> equivalent for devices described by a Devicetree instead of ACPI.
>>
>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>> index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>> @@ -29,6 +29,12 @@ properties:
>>         different 5 GHz subbands. Using them incorrectly could not work or
>>         decrease performance noticeably
>>
>> +  disable-rfkill:
>> +    type: boolean
>> +    description:
>> +      Disable rfkill for some devices on which Wi-Fi would be entirely hard
>> +      blocked by default otherwise
>> +
>>   additionalProperties: true
>>
>>   examples:
>>
>> -- 
>> 2.47.3
>>
>>
>>
> 
> Is this really a hardware description though ?

I would say yes it is. The wifi chip has an rfkill input pin and
things will be broken when that pin is hardwired to a fixed value
rather then being actually connected to a GPIO from say
the embedded controller.

So I think that we would need here is not a disable-rfkill property
but some way to indicate in the DT-node that the rfkill input pin
is not connected and thus should be ignored.

This (the rfkill input pin being not-connected) IMHO very much
is hw-description.

Also see the
"[PATCH 0/9] Add support for handling PCIe M.2 Key E connectors in devicetree"
series and then specifically:

https://lore.kernel.org/platform-driver-x86/20251112-pci-m2-e-v1-7-97413d6bf824@oss.qualcomm.com/

Which adds:

+  w_disable1-gpios:
+    description: GPIO controlled connection to W_DISABLE1# signal. This signal
+      is used by the system to disable WiFi radio in the M.2 card. Refer, PCI
+      Express M.2 Specification r4.0, sec 3.1.12.3 for more details.
+    maxItems: 1

What if there is no such GPIO, because the W_DISABLE1# signal is hardwired
in a specific implementation of the M.2 slot ?

In that case we will also need some way to propagate that info to the wifi
driver, having some sort of generic devicetree property for wifi-cards
which can be injected as a software-node property in the PCI-device being
instantiated for the WIFI card to let the driver no not to honor to
W_DISABLE1# signal will be useful here too and this is as hardware-description
as hardware-description can get.

So how about: "w_disable1-not-connected" + "w_disable2-not-connected" boolean
properties in a generic WIFI devicetree binding and also use that here?

> I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on a compat string.

See above, I do not believe that abusing compat-strings for this is the way
to go.

Regards,

Hans



