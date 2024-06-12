Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2231DC27C53
	for <ath12k@archiver.kernel.org>; Wed, 12 Jun 2024 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4GwlwGfBQlnNfyaS5mrHYpZ8wLq2fCIW70IywjAOXI=; b=JPUFZQW68/rVD7u1kdkGbhWCtV
	qhEoPxo8cQ8X3rrjKg+x+SdrsnovJTO6+ngv5ggNZASGbYkMzK9hxQSwPqO6Hgv4aGd29TvOIdAZA
	oUjolQLFWxzJ2gA8VPWZEphYa2qvEy3zPJjOasVUB4dRo+K95KaR/6n5+TlVD914TQvMKc/knA5nv
	G9u1aivdy5BFfcefnH4k4lxRqyqrh8PHtVhFeQlHSMeyxP3zbbW0hGbUzQgMk00a7nk/kehzHJzii
	Vsuz/qFXdd4KcaFO+JukFio7yVsLsxj1s1eQ+34tmUnOqUPx4MQ+ZJdpXS2xFOcvGSwtNjeTjfDVg
	yWsRlqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHNSz-0000000Cdpo-2s6O
	for ath12k@archiver.kernel.org;
	Wed, 12 Jun 2024 12:52:41 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHNSv-0000000CdoT-3weY
	for ath12k@lists.infradead.org;
	Wed, 12 Jun 2024 12:52:40 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52c9034860dso3603815e87.2
        for <ath12k@lists.infradead.org>; Wed, 12 Jun 2024 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718196755; x=1718801555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4GwlwGfBQlnNfyaS5mrHYpZ8wLq2fCIW70IywjAOXI=;
        b=s1AS7hdLSJHji3Oy7HPtQQAzRhMqbc+EAgEyfC9PVFJA42c/7gRbopue1d8ozlDBVL
         1uxgGfQ0ZxpiEuwP2bu/pPDS9ymqgKG3+BRXm7x3aNjqlNF55qQla1mjutmnDhIFLzoH
         iZO1f61aZLD10+FPnZhKkcGIbnN/h3OIsHMhPibUfvCk3suyZ+hMYoDH3z2FjRzGkdoF
         HMUcFIMhPU7deSBAejPPNi5P+0DNL7abiewBx6izRJAMdzrReQSoc3fTdpth/OIqbcD/
         4Rwwm+En4WH/WLNzGk6ChUwaH3NJcUv/wOuD72A/la9F76hAcGb0qet25y/U5HMXqqwg
         jZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718196755; x=1718801555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4GwlwGfBQlnNfyaS5mrHYpZ8wLq2fCIW70IywjAOXI=;
        b=iGtiW+jbndgJNUH/+5izn3wQXLiux/mMkqZQYpHXV74Tf4BRqjRNJo3LIwGxED6R8l
         Mm8w9n67Rkg0KG9upTlz1Tf4oJ1rNUxpeHTN5r9TgGVbquiZ6E8Dmp4C+LPMsezWnyTD
         qwJKEb9p3UFmNj2Z2LTQyZr7tvpUxMAVSBjAXv9VwHB5SRG//jAWqRmadqjsggK63FE6
         fy+pMDIgXsVH8VHB5JmgjOyY3zRCyGR7qchqCM7oKpmfSglXBwDcb0Dcje9FSYOPnsK/
         9MEW8Vf6YyUYv07yuLmVRxpPh8GOr9aAHd/kTh6qKQi/LskY7iv7vKu9uST+gLwOlM20
         WSng==
X-Forwarded-Encrypted: i=1; AJvYcCUo9NjyorAAqr0iC6tLgjNg7bjRa9dTmCh+VwEl2r5WDgYdg3/PD06y13R3Zb6vD9FGxeUXfiVKKcH4EgX5XL1D8HaYtrk6+8D7xQ==
X-Gm-Message-State: AOJu0YyZ2HZZJFvcddsXBAXt/ujNCr4puUZpKUQYpEzRN1CtJzf+bz0v
	WRg4qRWPnN9DPDkohsfnmoGY6E83yLezQX0F0LqJNesXjLbnh8RCUhIoXSoTshd8csREoLTsTW3
	/XT+Jvt97V8La8IM5jI1ICgt2+VACfdCZhfvKiw==
X-Google-Smtp-Source: AGHT+IFe+r6yKhsmufEY9zI0E5nEG73VhIrL6yR6XIX0JzQBh8t8vS1gVMACOhRz3PdyyC7pIpNTDk6MWfIpHIDS9y8=
X-Received: by 2002:ac2:46d3:0:b0:52c:9877:71b7 with SMTP id
 2adb3069b0e04-52c9a40b1e1mr1287628e87.59.1718196754793; Wed, 12 Jun 2024
 05:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240605122106.23818-1-brgl@bgdev.pl> <20240605122106.23818-2-brgl@bgdev.pl>
 <87h6e6qjuh.fsf@kernel.org> <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
 <871q5aqiei.fsf@kernel.org> <CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
 <87sexqoxm9.fsf@kernel.org> <CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
 <8db01c97-1cb2-4a86-abff-55176449e264@kernel.org> <CAMRc=Mer2HpuBLGiabNtSgSRduzrrtT1AtGoDXeHgYqavWXdrA@mail.gmail.com>
 <87ikyenx5c.fsf@kernel.org>
In-Reply-To: <87ikyenx5c.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Jun 2024 14:52:23 +0200
Message-ID: <CAMRc=MdPQu-r4aaeag9apYP1-FoQ2-_GAk_qnHqDz-jWibRDFQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe
 the ath11k on QCA6390
To: Kalle Valo <kvalo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_055238_222907_F7F04208 
X-CRM114-Status: GOOD (  19.92  )
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

On Wed, Jun 12, 2024 at 2:49=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> >> >> Sure, I don't need DT but that's not my point. My point is why requ=
ire
> >> >> these supplies for _all_ devices having PCI id 17cb:1101 (ie. QCA63=
90)
> >> >> then clearly there are such devices which don't need it? To me that=
's
> >> >> bad design and, if I'm understanding correctly, prevents use of
> >> >> qcom,ath11k-calibration-variant property. To me having the supplies
> >> >> optional in DT is more approriate.
> >> >>
> >> >
> >> > We require them because *they are physically there*.
> >>
> >> I understand that for all known DT QCA6390 hardware, the supplies shou=
ld
> >> be provided thus they should be required. If in the future we have
> >> different design or we represent some pluggable PCI card, then:
> >> 1. Probably that PCI card does not need power sequencing, thus no DT
> >> description,
> >> 2. If still needs power sequencing, you can always amend bindings and
> >> un-require the supplies.
> >>
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > Kalle, does the above answer your questions? Are these bindings good to=
 go?
>
> To me most important is that we are on the same page that in some cases
> (eg. with M.2 boards) the supplies can be optional and we can update the
> bindings doc once such need arises (but we don't make any changes right
> now). Based on point 2 from Krzysztof I think we all agree, right?
>
> Just making sure: if we later change the supplies optional does that
> create any problems with backwards compatibility? It's important that
> updates go smoothly.

No, you can always relax the requirements alright. It's only when you
make them more strict that you'll run into backward compatibility
issues.

Bart

