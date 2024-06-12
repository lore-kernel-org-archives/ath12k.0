Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D699C27C77
	for <ath12k@archiver.kernel.org>; Wed, 12 Jun 2024 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+KLxZwv3KVjMH+GO5G/9Jy6q5pczKwfg5UxIKL9ucM=; b=cWjFcrO6RTr0c/+BeGW4GckMzo
	Djay0XxuW4VbLb9SnSLJv1QGVitBrBuOjL8pmU8D+KxVCpYi2L8jFfvdSYDTdrqZuSaAL5ZdY9y45
	lUeB7MyImZePy56vLxKEXDjFqfP64rGwIPEONNK+Q0bLDhtB2HiiKIxJoNsISEJRgjgmXMxTlF8LJ
	qeYmH1m224LKnm/jtQUngJOBTn0SB/3mgbRY8PnCDmy4YqTSVTnGw2jcKTdp/GhVejYFJ+gxNE/mm
	jX3BLxhTLopOG0Q/a7nmWb40vbGIek+GybgaO61d6Ot+m8O7msHwJ3Ya0eXuHuGNr70l9S9ZB9sEF
	n2LXkqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHNJL-0000000Cc2L-06ZG
	for ath12k@archiver.kernel.org;
	Wed, 12 Jun 2024 12:42:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHNJH-0000000Cc1d-3wo2;
	Wed, 12 Jun 2024 12:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F44C61311;
	Wed, 12 Jun 2024 12:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D9FC3277B;
	Wed, 12 Jun 2024 12:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718196159;
	bh=z+KLxZwv3KVjMH+GO5G/9Jy6q5pczKwfg5UxIKL9ucM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kJkZjo5xs0lK86YklafnNU927mRi4jWdl0SCGkcphfa1Z9n6VxvAqQaJxC1gGKSJL
	 RoYSkIqL4CUGFKVz5HYkntqCEGAENNgD7w4d4FJS/6uVur/sAgna6t3xIvSZskMA/p
	 /VwEt3XVxLyFLVDui40jlEas+ijlXkVJ16ZphJ2DNl6vJKAS9MyqzY1eeFgKafp8xn
	 ZUNWCt5FywUYQkmoATvI1+GZTDKK4AhAsDmmcI8y2Hy7FDnjzSDJE7IgrTAKhAeXnq
	 cE9u+gLYEpoAJQ7sz1AaBmUwdaD55b90h9Ce+/V39ScOZUkvnLCOKAN/sB93TfGn59
	 YF6m2J0Q8nbGw==
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
	<871q5aqiei.fsf@kernel.org>
	<CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
	<87sexqoxm9.fsf@kernel.org>
	<CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
Date: Wed, 12 Jun 2024 15:42:33 +0300
In-Reply-To: <CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
	(Bartosz Golaszewski's message of "Thu, 6 Jun 2024 20:08:11 +0200")
Message-ID: <87msnqnxhi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_054240_106063_C8CCE568 
X-CRM114-Status: GOOD (  44.67  )
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

> On Thu, Jun 6, 2024 at 6:16=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrot=
e:
>
>>
>> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>>
>> > On Thu, Jun 6, 2024 at 4:02=E2=80=AFPM Kalle Valo <kvalo@kernel.org> w=
rote:
>> >
>> >> Sure, I'm not worried about functionality. I'm worried that if I
>> >> there's, for example, an ARM based setup which uses DT and wants to u=
se
>> >> a similar QCA6390 board that I have, and set
>> >> qcom,ath11k-calibration-variant in DT. In other words, I'm worried if
>> >> you are looking at this only for Snapdragon family of boards?
>> >>
>> >
>> > No, what I'm looking at is the entire QCA6390 package. That means WLAN
>> > *and* Bluetooth *and* the PMU that manages power.
>>
>> I think we are just looking at this from different point of views. You
>> are looking at a datasheet (most likely for a Snapdragon based system)
>> and I'm looking what actual devices there are out in the field.
>>
>> > If you're using the QCA6390 on a device-tree system then you should
>> > probably model at least the WLAN node and the PMU and the problem with
>> > supplies is fixed.
>>
>> But why? If there are boards out there who don't need any of this why
>> would they still need to model all this in DT?
>>
>
> Because this is what is there? The goal of the device tree is to
> describe the hardware. The fact we didn't describe it before doesn't
> make it correct.
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
>> > But if you don't have the supplies, that's alright for downstream.
>>
>> What do you mean downstream in this context?
>>
>
> I mean: if you wanted to upstream the DT sources, then they should
> include the supplies AND the PMU node. But if you just want to make
> the WLAN run on some vendor kernel then you don't need to think about
> it, it will work.
>
>> >> Again, I don't see this as a blocker. I just want to understand how t=
his
>> >> should work for all types of devices there are out there.
>> >>
>> >> > But if you have a QCA6390 then you have its PMU too and the bindings
>> >> > model the real-world hardware.
>> >> >
>> >> > IOW: your laptop should be alright but the supplies are really there
>> >> > which warrants adding them to the bindings.
>> >>
>> >> Sorry, not following here. Can you clarify your comment "the supplies
>> >> are really there"? You mean inside the PCI board? But that's not visi=
ble
>> >> to the kernel in anyway, the PCI board just works after I plug it in.
>> >> It's like a regular PCI device. So I don't understand why that should=
 be
>> >> visible in DT, but I can very well be missing something.
>> >>
>> >
>> > I think you're thinking about some kind of detachable PCIe board with
>> > this chipset on it.
>>
>> Exactly, a lot of WLAN boards are like this.
>>
>> > I refer to the QCA6390 chipset itself which is also more than just
>> > PCI. The Bluetooth interface doesn't use PCI at all. On the boards I'm
>> > working on, the chipset is just soldered to the main board.
>>
>> And I guess you are looking at Snapdragon boards only?
>>
>
> But what is your point?

My point (again) is that to me it look likes that you are looking this
only for Snapdragon type of devices and ignoring the rest. I am looking
at this to support _all_ type of devices and I want to make sure that we
don't have any artificial restrictions to use ath11k or ath12k devices
in upstream Linux.

I could not find a public example of a QCA6390 M.2 board like I have, but
here's one for QCA2066:

https://compex.com.sg/shop/wifi-module/wlt206h-wifi6-ble5-1-11ax-qca2062-qc=
a2065/

QCA2066 is a mobile chipset supported by ath11k, similarly like QCA6390.
It's just newer and different features, and with a different PCI id. In
the past using these kind of M.2 boards for Wi-Fi has been quite common
but don't know how commit it is nowadays.

>> > If your detachable board "just works" then it must be wired in a way
>> > that enables WLAN the moment it's plugged in but this doesn't happen
>> > over PCI. The chipset has a power input and GPIOs to enable each
>> > module.
>>
>> I don't know how the boards are implemented but it could be so. But from
>> host system point of view it's just a regular PCI device.
>>
>
> And you don't need DT anyway for this type of devices.

I wish we wouldn't need to use DT for such M.2 boards, but we do need to
use qcom,ath11k-calibration-variant in some cases when the device (or
the firmware) doesn't provide unique enough identifier to choose the
correct board file automatically. I already mentioned the property in my
earlier emails.

I hope this clears up what I'm trying to say.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

