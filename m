Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325DAC27C55
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcE4lbv2vNyPF1qxio9ZhgpB3UHvF6AORt7V6CDt54g=; b=emAACxU3Fs8QbyUlX+DTdeFp80
	xnBviYPb1o2QkEq4baoNpj9qTkL0x5ilGP8K8MUK1XV0Qfc/KbXRgkclRi/2vmDY9tHxploVEyFN5
	7Kpu3IN1E0E6qEEPdJmZMgMkO4cB9Ar9PTQuEKNC7bKrofQ1mJa7ofLrr/nz9hrKKvtRkPUMLEdBv
	HPD/iE1R6lXC/Sw1pS5WsbukHc/j0+7q1rmdgrYYL9Fjz3PXenVQbduvP8KoF/VJlpbcbQDAJVn1j
	D/EqzY8oV6NRm5O+U7tTSGsaoVUgjucq+k0nTIdA/itthVreimMhzLJy4F2ofbjE/MG1Oj+t+37RY
	lbV9RbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDHj-00000009vGg-3f1q
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 13:36:07 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDHf-00000009vEE-378j
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 13:36:05 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2eaa5cd9f0bso20257531fa.1
        for <ath12k@lists.infradead.org>; Thu, 06 Jun 2024 06:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717680959; x=1718285759; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcE4lbv2vNyPF1qxio9ZhgpB3UHvF6AORt7V6CDt54g=;
        b=epJ7ahyfvKv95M0RLgmGcqhB5klRIQ9aHfAgm3Tu46bgx2z/IeycVFdo+eJHtGPzEb
         GdK4rG0fmTxPqWjEtAYhNGGVrKPUm9xOffsoK5FfIuXBzcQqX+o/+owGE0rDNM+5+/xG
         Sx1V6UbBN1UFnpc0zuNHQatWBjvGHAjtJrfvk+UnSXVWUCfJbTwizcKrWbWZ81vhQSoz
         blc9g0Xt+to3LHuVgzsEbSbos1233IEMsnm+RSOC9yCmbh6cB6uKwnUCPcT36kifSEkI
         LJnG+09f/k/lY7kbujwtr9ufCWOCl3gKwaM2En714X6snXH4nd17p5CLv4s35f4wYR28
         oAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717680959; x=1718285759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcE4lbv2vNyPF1qxio9ZhgpB3UHvF6AORt7V6CDt54g=;
        b=D1zf7r8K1AiS7Op6k1lRn6yp/9muA+V9CC9fcUwbyS9HcnO/TVLjSHSEMOenVl34zu
         AVxN0l/t+i/R3q9GgnU0bQfJNxCr6H/zjRfPOpBKV/5T8AUdpouF3j6hkM3cUcmKSuVz
         J4C+uYrqLsVnieE7j4DXMnz1HiR8PlhKdclIHEDOa4+PSuRtfiZZ4DgXhtvw9U525YJ1
         pUTY69Qoj1jmlWwGWhODhxbbVgB8SOT4M8a4/wy+9aN1wUErc8VyeI6rCf4ZLO6z8GcZ
         ska4IDRg+L/G2q3OxHdQl3iC7EMUjc9daA2K4y6a1+SSDn2qL3DKr/duOFc49K63pHBD
         mf0w==
X-Forwarded-Encrypted: i=1; AJvYcCXX2P0Koumj4hB7Z1MmeOUe5JesRTW4zvEHDJPh6dEVTLItyrEF3LG44YCXhI8b4f7qBgnsd6nJRjHokQONEc6zXeUDKYZoSVgqrQ==
X-Gm-Message-State: AOJu0YwugkPN/wEQ5Z6xHVoYsXpQ6TG0p3nSbN7+NJ7ho+O98qPLnJUg
	cUd0KAqE0F/vIugATUJ39L08SRuLn5qN1HliaU6a1cdnCMvzC97uTJx/CFrey8veJYBqdHwTBEQ
	YfjhZzSq5lz/i6OLUbqC5VCZSYD8FY4eJV16pjg==
X-Google-Smtp-Source: AGHT+IFBM66nYsYkj5n/LotNPGso9ssGRfTDwE6YFuYv71IJpcC35zwc+EVz+BTh4BzurMJ5gBpZ2OPmZZ2xaKfaFt0=
X-Received: by 2002:a2e:9e99:0:b0:2ea:c518:7c6f with SMTP id
 38308e7fff4ca-2eacff98b6bmr8848171fa.1.1717680959188; Thu, 06 Jun 2024
 06:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240605122106.23818-1-brgl@bgdev.pl> <20240605122106.23818-2-brgl@bgdev.pl>
 <87h6e6qjuh.fsf@kernel.org>
In-Reply-To: <87h6e6qjuh.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Jun 2024 15:35:47 +0200
Message-ID: <CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe
 the ath11k on QCA6390
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_063603_898267_4C5823AC 
X-CRM114-Status: GOOD (  17.39  )
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

On Thu, Jun 6, 2024 at 3:30=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a PCI compatible for the ATH11K module on QCA6390 and describe the
> > power inputs from the PMU that it consumes.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> [...]
>
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: pci17cb,1101
> > +    then:
> > +      required:
> > +        - vddrfacmn-supply
> > +        - vddaon-supply
> > +        - vddwlcx-supply
> > +        - vddwlmx-supply
> > +        - vddrfa0p8-supply
> > +        - vddrfa1p2-supply
> > +        - vddrfa1p7-supply
> > +        - vddpcie0p9-supply
> > +        - vddpcie1p8-supply
>
> Not sure if we discussed this before, but based on this I understand
> that there can't be an DT entry for device pci17cb,1101 without all the
> supply properties? But there are QCA6390 devices with PCI id 17cb:1101
> which do not need these supplies and already work. For example, my Dell
> XPS 13 x86 laptop is one. Or anyone who manually installs QCA6390 board
> to their PCI slot and some of them might want to use DT, for example
> setting qcom,ath11k-calibration-variant.
>
> This is not a blocker for me, just making sure that we are not breaking
> any existing setups.
>

If they are already powered up without the need for the PCI pwrctl
driver to do it, then they will work alright. Bindings don't affect
functionality. But if you have a QCA6390 then you have its PMU too and
the bindings model the real-world hardware.

IOW: your laptop should be alright but the supplies are really there
which warrants adding them to the bindings.

Bart

> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

