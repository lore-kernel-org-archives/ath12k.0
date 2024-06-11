Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5224DC27C65
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHnbK8yZ9GQzrqt+GVlF51JCkKEzN8ZWdF3jcm+f9eQ=; b=FeSQYFllNCGi0TS/3I2MlmXdym
	+UO08zquZzQfYdbn6ODXBcd+ulij9b207Mr7HPg+aeUo9GCscIRZ90e/kO3IGMeQcyrUrFC3Z10dp
	nzjofduSccUFTzcSDKEC0y2Pgbx1dKGKn6A+2HwDIdwo/3EDWeA3edDVpwORQHm+wWqvXaLdf+cNo
	2uUlubCRxZH5N/5XnzFr0bJRBjQ+0r5SUdbHihz8tufxWZjf96yYCNP5sw2Mfa0mpM8cY8E/ZVeab
	xhTWdHVBzK+JVNhMcNwrM1VMPezdxNZAImwdGeCpFFrvQzq4Mf+ArFBW6wolQqmFgitCnEdDaTFPw
	sWWy73cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7l2-0000000A7bO-2zL6
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 20:06:16 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7kz-0000000A7aB-3Is3
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 20:06:15 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso1764464e87.2
        for <ath12k@lists.infradead.org>; Tue, 11 Jun 2024 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718136368; x=1718741168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHnbK8yZ9GQzrqt+GVlF51JCkKEzN8ZWdF3jcm+f9eQ=;
        b=jKrcg16jrZYkJaxtS2E3b2E8t613qJVLNZeYkS9bC5vMg7S87uG57cIHyy2DSQwUpG
         naJLW79tK/hlZmlpNDZ3XKuN071HGMEk1OpbltL0umf9UK7FjWDftHUVKIGjQUfSP8Zj
         wCnrhvN18rxJqiHXlq/xh1KQ6LjcfD9XTbuQz6fdFjt8ptusUkb4xjSQyKkwSJj7qW43
         JnXOr6Fd5uBxga/5fgOK7qZicwN4HkyDtMFB36rRWCsFAVvmqfu3nsaG9e0hKFFLDcMf
         k3sB81qFQMB0tgGodeioz4g9jUG2dw/0AE2cBvpFAT3TyvvQ3qh8O7w+uVo0y1K3P/tk
         g1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718136368; x=1718741168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHnbK8yZ9GQzrqt+GVlF51JCkKEzN8ZWdF3jcm+f9eQ=;
        b=X4osuR06D/2YQNgq2ldWqw9wWMVYhKPUKXFvU6Zmb5rXWGGiQS6DaAlhtoy11aMkcH
         Ruguo8qrUpQpSIbwcp3zEqiCx8917XfXIAWldY+SbSeGFUy5/ELwCOfo8TcFVEAxVFlP
         1JkBPyBV8BS4VD+U+86mO1Af7F0Acqx0CqV9KI+y0ePjkqCXGkwtOYeCmRZH//3BEf31
         SGSMDjSl5aE/BbNB5lqtJ22abwJDZmSF88vMsTlhZM1J5JD2vC6txXzSaFAXdVVQ2F3N
         59QlaMXMzPLxO5DYH6cV8u/+FpGXxtAL2H+0L4sosEOoprs326fT0uhdqotTrBo/omya
         LRZg==
X-Forwarded-Encrypted: i=1; AJvYcCUlURj1NN7b+l993jtm1OvtkhvHqCd28h87Iz9YV4wmKC5foKr+PHrpWq9rKQ4s775d4a0GdYaERs2RS92NSDi4cZRGf5te/nPnVA==
X-Gm-Message-State: AOJu0YwsAEJy3qrP9WwTnvUBGNP6dZ3siUMzisMzu71VTGhGs+aKNWxH
	Oay5pcIbFA7olUrbr1/7cgGJMINgc4D7oOGR09+TcBjidyk3AUQixPdpCQSOGZ5LH1qXlHIh5Dp
	1b2+LJ75jL/+whRanGkP/yl0aIcvLwj1AOBoKUw==
X-Google-Smtp-Source: AGHT+IHo2kDMYmvh1Fiuq6Vp0TjSyMZ5wd2GkAYNc1OHzZu/lwJY6vNBizdeJ06QMzbe9upl8ARaKOiKysYnJKD3dmc=
X-Received: by 2002:ac2:5148:0:b0:52c:5f12:5317 with SMTP id
 2adb3069b0e04-52c5f1256a6mr5730643e87.44.1718136368542; Tue, 11 Jun 2024
 13:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240605122106.23818-1-brgl@bgdev.pl> <20240605122106.23818-2-brgl@bgdev.pl>
 <87h6e6qjuh.fsf@kernel.org> <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
 <871q5aqiei.fsf@kernel.org> <CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
 <87sexqoxm9.fsf@kernel.org> <CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
 <8db01c97-1cb2-4a86-abff-55176449e264@kernel.org>
In-Reply-To: <8db01c97-1cb2-4a86-abff-55176449e264@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Jun 2024 22:05:57 +0200
Message-ID: <CAMRc=Mer2HpuBLGiabNtSgSRduzrrtT1AtGoDXeHgYqavWXdrA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe
 the ath11k on QCA6390
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
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
X-CRM114-CacheID: sfid-20240611_130613_849204_AA151621 
X-CRM114-Status: GOOD (  29.90  )
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

On Fri, Jun 7, 2024 at 8:40=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> Kalle,
> All of the devices out there need these supplies, but they are sometimes
> provided by generic PCI supply and on-board regulators. Basically your
> PCI adapter is not the same as QCA6390 chip on Snapdragon board.
>
>
> >
> >> Based on the discussions I have heard only Snapdragon systems who
> >> require all this configuration you describe. Of course there can be
> >> other systems but I have not heard about those.
> >>
> >
> > DT is not configuration, it is description of actual hardware. It
> > doesn't matter if Snapdragon systems are the only ones that actually
> > *require* this description to make WLAN/BT functional upstream. The
> > chipset would be the same on any PCIe board, it's just that the host
> > systems wouldn't need to take care with its power sequence. But for a
> > dynamic board like this, you don't need DT.
> >
>
> Correct.
>
> ...
>
> >
> >>> If your detachable board "just works" then it must be wired in a way
> >>> that enables WLAN the moment it's plugged in but this doesn't happen
> >>> over PCI. The chipset has a power input and GPIOs to enable each
> >>> module.
> >>
> >> I don't know how the boards are implemented but it could be so. But fr=
om
> >> host system point of view it's just a regular PCI device.
> >>
> >
> > And you don't need DT anyway for this type of devices.
>
> Detechable board, like PCI adapter, derives these supplies from generic
> PCI whatever-3.3v through additional regulators. All these supplies are
> there - on the board.
>
> >
> >>> Also: I doubt you need DT for your detachable board?
> >>
> >> Sure, I don't need DT but that's not my point. My point is why require
> >> these supplies for _all_ devices having PCI id 17cb:1101 (ie. QCA6390)
> >> then clearly there are such devices which don't need it? To me that's
> >> bad design and, if I'm understanding correctly, prevents use of
> >> qcom,ath11k-calibration-variant property. To me having the supplies
> >> optional in DT is more approriate.
> >>
> >
> > We require them because *they are physically there*.
>
> I understand that for all known DT QCA6390 hardware, the supplies should
> be provided thus they should be required. If in the future we have
> different design or we represent some pluggable PCI card, then:
> 1. Probably that PCI card does not need power sequencing, thus no DT
> description,
> 2. If still needs power sequencing, you can always amend bindings and
> un-require the supplies.
>
>
> Best regards,
> Krzysztof
>

Kalle, does the above answer your questions? Are these bindings good to go?

Bart

