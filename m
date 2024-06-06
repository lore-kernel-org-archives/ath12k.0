Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415D9C27C54
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Exqth/+k9FmA2UDmjf7oc1trllf1KrAhidtEnW+PkAk=; b=tBWlUrjrPY5K3uXOKafcqgcx2M
	Ks1o0GPIjiV7xtN5ib4i5hNV7ivkS96A9gg03FScdIHlPverf5jYRmvEhjBBau8d4fU9afMq8p37x
	ANNKto67Nu4ZNyzdgNWeOpz7GzMm0MC93UusaS+AMkS+83xJ/vgO7W45TyZTi4kCcTnf2HPlgM00P
	SUbq2MmLlQOdsx97c4Gaoa/rBKu1SOlQa+q9CWa3A4ggk2I8md9U1A7NRl83ZEur8yzLNmoOUMpwf
	2B1JXdO0nk7GHfrnH34hNvfUNm4WccDbIiIu1ah2OUBFXpozNXBp9pQqtxsJEh4etTtF8ighvHB5z
	zg5ZW9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDgt-00000009zJD-3nnr
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 14:02:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDgq-00000009zHx-2HMR;
	Thu, 06 Jun 2024 14:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F02061DE2;
	Thu,  6 Jun 2024 14:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55343C2BD10;
	Thu,  6 Jun 2024 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717682522;
	bh=ivsf4NbZZPAamDEi3OCHaSjrBCmG4UqHfSgu3HZ5PWY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uGSpgk2S9Q99QsCDrnFKgKraNdbOOhYSONYIIH2BHVK2ycaCv0j+dmU4CbWH9oBsl
	 /J8x10c81VUUGgH+F+o5iFK8iJ1N3/hdDgSJpOL1eMQ64ggEw7IYNBeyUIg1QS0kuY
	 Lym15z8f+QhlPxGLzLuxIEHUmDvZAvWyIa8AQ9O+MCJ4+iA9TEZTreiq6kGUHPKhy2
	 l5LxMFSLbsqNE1sagCmLT/7GMCy/HoZtA3CTZiOAwK5tf6EVyW4/g5jr+XaV5B9ReZ
	 7Bsrq9LThBfrwDEkz9kIRyRY1w8DCgbIRo9Vfe2lwE9W2LSIGgnws/KaPOes7FDA1J
	 YXpduBI7BQwFA==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-kernel@vger.kernel.org,
  ath12k@lists.infradead.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
References: <20240605122106.23818-1-brgl@bgdev.pl>
	<20240605122106.23818-2-brgl@bgdev.pl> <87h6e6qjuh.fsf@kernel.org>
	<CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
Date: Thu, 06 Jun 2024 17:01:57 +0300
In-Reply-To: <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
	(Bartosz Golaszewski's message of "Thu, 6 Jun 2024 15:35:47 +0200")
Message-ID: <871q5aqiei.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_070204_741194_622CBD22 
X-CRM114-Status: GOOD (  22.29  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> On Thu, Jun 6, 2024 at 3:30=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrot=
e:
>
>>
>> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>>
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > Add a PCI compatible for the ATH11K module on QCA6390 and describe the
>> > power inputs from the PMU that it consumes.
>> >
>> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> [...]
>>
>> > +allOf:
>> > +  - if:
>> > +      properties:
>> > +        compatible:
>> > +          contains:
>> > +            const: pci17cb,1101
>> > +    then:
>> > +      required:
>> > +        - vddrfacmn-supply
>> > +        - vddaon-supply
>> > +        - vddwlcx-supply
>> > +        - vddwlmx-supply
>> > +        - vddrfa0p8-supply
>> > +        - vddrfa1p2-supply
>> > +        - vddrfa1p7-supply
>> > +        - vddpcie0p9-supply
>> > +        - vddpcie1p8-supply
>>
>> Not sure if we discussed this before, but based on this I understand
>> that there can't be an DT entry for device pci17cb,1101 without all the
>> supply properties? But there are QCA6390 devices with PCI id 17cb:1101
>> which do not need these supplies and already work. For example, my Dell
>> XPS 13 x86 laptop is one. Or anyone who manually installs QCA6390 board
>> to their PCI slot and some of them might want to use DT, for example
>> setting qcom,ath11k-calibration-variant.
>>
>> This is not a blocker for me, just making sure that we are not breaking
>> any existing setups.
>>
>
> If they are already powered up without the need for the PCI pwrctl
> driver to do it, then they will work alright. Bindings don't affect
> functionality.

Sure, I'm not worried about functionality. I'm worried that if I
there's, for example, an ARM based setup which uses DT and wants to use
a similar QCA6390 board that I have, and set
qcom,ath11k-calibration-variant in DT. In other words, I'm worried if
you are looking at this only for Snapdragon family of boards?

Again, I don't see this as a blocker. I just want to understand how this
should work for all types of devices there are out there.

> But if you have a QCA6390 then you have its PMU too and the bindings
> model the real-world hardware.
>
> IOW: your laptop should be alright but the supplies are really there
> which warrants adding them to the bindings.

Sorry, not following here. Can you clarify your comment "the supplies
are really there"? You mean inside the PCI board? But that's not visible
to the kernel in anyway, the PCI board just works after I plug it in.
It's like a regular PCI device. So I don't understand why that should be
visible in DT, but I can very well be missing something.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

