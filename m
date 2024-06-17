Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D203AC27C6E
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFsb4JRR8B7+LNbbg/vD4+mfvHSBhr5GHHr0I+YW3Zc=; b=R6zLAU0RwJ1XfFjqNEPfDA2HOi
	0q0jbsr3hxv6WLMci6gCHxJZELddzIEmobgNkIraLdJNEZsO71kM9F5gXUOETftUFwJl+1JS/9vqc
	p/0qKjozlKj8K6m9Va4opHxpj6i6etxVliOn1weAj4WhwXw3f0uT2kwmvXbxZo3rbz7zbiu95PLxh
	MklXFRtneB+lkRo+tukJaqsq8VJbYLZefSzS+Idx42PpSMRqnnm/qqjcrlvr3I+NQDFKoseIVwHWM
	uzxmiNMNRYfiJ1m6sv2lNQcOE99gmkkjCldECmKoxqwwKAou+exGSMLQcTfBq2IwUleBGAaAm/gmI
	4y82r2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8Mz-00000009xr2-29Ye
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 09:09:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8Mv-00000009xpf-1zoa;
	Mon, 17 Jun 2024 09:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D66E2CE0BA2;
	Mon, 17 Jun 2024 09:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C68C3277B;
	Mon, 17 Jun 2024 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718615379;
	bh=CFsb4JRR8B7+LNbbg/vD4+mfvHSBhr5GHHr0I+YW3Zc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=G1c5oIuTePKfG2RzKc8tjI5+qJyx22PFYRthWIJb40HJGySFJR02dRUwTKxt8qCdV
	 QvMWlvTPpO/998/8121SGDWwPusP7s+ExTE/Mk20ukPkEnUI+aoPe4tZHRTQGmerON
	 WqyW5MrPNbTFAdSkUk+XoRj/xih/OjLlaE/Ve5bbghMw2lUdh6S9P2XvmRJ5QTNAoE
	 CjoOzYnL4feeyss7uNmDJom8g7ut1HyCz6Dx7KdAH23aRkzj6r+9nvearD04vM9mjd
	 nOVkiXu/A70y1Bsye0WO/tO+wrzx3cUmIHjPmDTTrL4ZL9hgwCUSg85SwE+tcqewxk
	 5+y7QOzLvi2gg==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  ath11k@lists.infradead.org,
  linux-kernel@vger.kernel.org,  ath12k@lists.infradead.org,  Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
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
	<8db01c97-1cb2-4a86-abff-55176449e264@kernel.org>
	<CAMRc=Mer2HpuBLGiabNtSgSRduzrrtT1AtGoDXeHgYqavWXdrA@mail.gmail.com>
	<87ikyenx5c.fsf@kernel.org>
	<CAMRc=MdPQu-r4aaeag9apYP1-FoQ2-_GAk_qnHqDz-jWibRDFQ@mail.gmail.com>
	<CAMRc=Mfsqnfy-Q++QyZNmsYoV72hUoNFEDCW6KZ0H_MEHEe5Rw@mail.gmail.com>
Date: Mon, 17 Jun 2024 12:09:33 +0300
In-Reply-To: <CAMRc=Mfsqnfy-Q++QyZNmsYoV72hUoNFEDCW6KZ0H_MEHEe5Rw@mail.gmail.com>
	(Bartosz Golaszewski's message of "Fri, 14 Jun 2024 09:18:14 +0200")
Message-ID: <878qz4kkaa.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_020941_996993_6C0A7445 
X-CRM114-Status: GOOD (  23.39  )
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

> On Wed, Jun 12, 2024 at 2:52=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>>
>> On Wed, Jun 12, 2024 at 2:49=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wr=
ote:
>> >
>> > Bartosz Golaszewski <brgl@bgdev.pl> writes:
>> >
>> > >> >> Sure, I don't need DT but that's not my point. My point is why r=
equire
>> > >> >> these supplies for _all_ devices having PCI id 17cb:1101 (ie. QC=
A6390)
>> > >> >> then clearly there are such devices which don't need it? To me t=
hat's
>> > >> >> bad design and, if I'm understanding correctly, prevents use of
>> > >> >> qcom,ath11k-calibration-variant property. To me having the suppl=
ies
>> > >> >> optional in DT is more approriate.
>> > >> >>
>> > >> >
>> > >> > We require them because *they are physically there*.
>> > >>
>> > >> I understand that for all known DT QCA6390 hardware, the supplies s=
hould
>> > >> be provided thus they should be required. If in the future we have
>> > >> different design or we represent some pluggable PCI card, then:
>> > >> 1. Probably that PCI card does not need power sequencing, thus no DT
>> > >> description,
>> > >> 2. If still needs power sequencing, you can always amend bindings a=
nd
>> > >> un-require the supplies.
>> > >>
>> > >>
>> > >> Best regards,
>> > >> Krzysztof
>> > >>
>> > >
>> > > Kalle, does the above answer your questions? Are these bindings good=
 to go?
>> >
>> > To me most important is that we are on the same page that in some cases
>> > (eg. with M.2 boards) the supplies can be optional and we can update t=
he
>> > bindings doc once such need arises (but we don't make any changes right
>> > now). Based on point 2 from Krzysztof I think we all agree, right?
>> >
>> > Just making sure: if we later change the supplies optional does that
>> > create any problems with backwards compatibility? It's important that
>> > updates go smoothly.
>>
>> No, you can always relax the requirements alright. It's only when you
>> make them more strict that you'll run into backward compatibility
>> issues.
>>
>> Bart
>
> Kalle,
>
> Is that ok with you? Can we get that queued to avoid the new
> check_dtbs warnings in next when the DTS changes land?

Yes, this patchset is already on our pending branch and should be
applied soon. I was on a long weekend hence the delay.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

