Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EF6E668B4
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTIPtqzMduKujdd0veJ2LC19WzlWxxZcItU+/SfvSHQ=; b=2QQkozhY8UFkva3Ls8rPC/g1Zu
	o5x4fZZK5F/x6ovkpiHmaq+JLWUJF++GVA/g8wtuc3QinHRvQdZFTsDptKwMvKfCEHVF8nvg4c85R
	vU68B3Y2Ma21SzQ44dXgbjoPHjcysuoXNhwmxPMoandKwjeCZAPILM17dmSehUFJG0xV5T8L7DZP3
	9eDNA3ELnwjRnbPR7gDwfFTpVnDvH3Q+Bszo/UgbcM5rx05ZzGZUlCQzmF//HY5aWQIhIdKc+gXTF
	ujz+vdkB1jRwnY5hfY8BNQLIqRQW+MLoraZJmCAz/TOoUumh7Ut7yHiayDiSL0mWrxQSNCbEmPKQL
	f5LfpeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWxYD-0000000BdrX-3Q4i;
	Sat, 20 Dec 2025 14:03:17 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWxYA-0000000Bdr4-3tiz
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 14:03:16 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so27330146d6.2
        for <ath12k@lists.infradead.org>; Sat, 20 Dec 2025 06:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766239394; x=1766844194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTIPtqzMduKujdd0veJ2LC19WzlWxxZcItU+/SfvSHQ=;
        b=b8fkZLCEE3KGwBfxmkVzeoLfJq3T/s/tEXaZXDyaD9HlTxjBF4XXSLzkUAm400/p79
         +DCH5QZIpzokQthxgagGE4YVULF7eu/4mpv2B3oSMIW/CeB0judQ0460qNOJsn10NPof
         AwpOpdMrjhM2Zh1oWstYfq2ezuMlJj4UkK3eVAemQbLcoqiD2QdkwE1hhw1gk1pBod/Q
         XyqeGfAGkSzVLMUbgzGUSa3huHx5151MYA6WLCvOJ4v4vH4lDWwHVY5PPh2WxazJ8JKH
         6drphxE1g/eSleOsh/tzqwzamJsM+RZTXiam+J6PAYmA1n4haUPWxnhUHl6urlcMHe7+
         Qtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766239394; x=1766844194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTIPtqzMduKujdd0veJ2LC19WzlWxxZcItU+/SfvSHQ=;
        b=PqFbS9SdoAb36gd38umwAkE36xjpfP3olcLP1KbhUhM0Z/J2lQncC6kY8QCTINf2c6
         P9Bxg5U+Me8ZP1iAEU5TBq18Hz1bgd6uyXsg/BlLC3qlIDkhuUMxO/+tysZuK0oE184D
         99GjCum7btnxbGbRLD++37uN6jZAdjISOHqsLtzqeu267iSjUXFvDgdIweOvJtDsKCYz
         tDQWjItok5qGgugk8PyqzOdHdKOhBp7ldNTdMjGB+xUbb16PO9N04ELdmiHSn4OIZfKI
         oRaU6xCxrYCvBeBigCzydvEaDJmh+AVKtA+Tecl/YJQtgpiLGL0HNC8XrJKWhaNINVc6
         k4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVy1CI5skESLRC2IIpQaSzsK7qBdQh8Bz3rFErigB5SgXLGBjLCfxqj46FnR6tqobM1wz/80ug=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0FSR8yVd8jLc9txQrEFLlbER4iE0tG6WshGhRUzIp6uOo3Ibu
	NlXmlsjoequuNIfvhyLYnnNM5QrFYyCiteQSQfxaBq5DXyrjo0OVtDqEBEocpG0Wq8iVMyMWKSR
	AHD5XN76u/O56N5pp9NWf69c1q4sCUA==
X-Gm-Gg: AY/fxX6/ipRYq+Mceqj9GjnLuns5JcazxChWFlREj6ePNbzRvSpwxc8QexUiM9FL58K
	MYdA8Sy5SbS3OYaWGwIQtL2fMkxb5Yl5A29CaScw21Uyy+JQF+uFvKkLEYFOJTLoe1GSXR49+PI
	ZVgVnuwqaTna2LXYNzzdMogfDJ1e38PcIWH/H7xMLTHttzIEvwnw7Ibw0Q2oxXsRlu4Wwfq2xua
	/Jk+QIcsyo9PRiSEoYaF6k3LjAEas2yARejgHyS15nyliFVtE3rEERuheqgAMG7b3vpNd1e1LDq
	t8TsiAyV535wSTkNhgZ2d4vp8xM=
X-Google-Smtp-Source: AGHT+IFp4fR8Wc2qjRuYRZCvAQmroP/eyGv/wjwh1rGAG5pfcUyLHfpF6uaQ82FZr3MKIP8d6MaoUKVouxW6yw2G3dY=
X-Received: by 2002:a05:6214:248b:b0:70f:a4b0:1eb8 with SMTP id
 6a1803df08f44-88d8203f029mr99469936d6.13.1766239393583; Sat, 20 Dec 2025
 06:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie> <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
In-Reply-To: <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Sat, 20 Dec 2025 15:02:36 +0100
X-Gm-Features: AQt7F2qSP3aNPDvdAnYCQhdwd2yv91UgJ5ZtJLf3svJOCJgsank9Z_-67rvi34Y
Message-ID: <CA+kEDGEB-c1SuEdR4W8mnxYQLxN5bqW0v3G6wb=e+a8LY8+OTg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Bryan O'Donoghue" <bod.linux@nxsw.ie>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_060314_996996_CB644490 
X-CRM114-Status: GOOD (  28.37  )
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

Le sam. 20 d=C3=A9c. 2025 =C3=A0 10:12, Krzysztof Kozlowski <krzk@kernel.or=
g> a =C3=A9crit :
>
> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> > On 20/12/2025 00:21, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> > > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> > >
> > > For some devices, Wi-Fi is entirely hard blocked by default making
> > > the Wi-Fi radio unusable, except if rfkill is disabled as expected
> > > on those models.
> > >
> > > Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> > > disabling specific features based on ACPI bitflag") added a way to
> > > support features set via ACPI, including the DISABLE_RFKILL bit.
> > >
> > > Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> > > equivalent for devices described by a Devicetree instead of ACPI.
> > >
> > > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.=
com>
> > > ---
> > >   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 +=
+++++
> > >   1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211=
.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5=
eaec2c7ff367fd93945 100644
> > > --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > > @@ -29,6 +29,12 @@ properties:
> > >         different 5 GHz subbands. Using them incorrectly could not wo=
rk or
> > >         decrease performance noticeably
> > >
> > > +  disable-rfkill:
> > > +    type: boolean
> > > +    description:
> > > +      Disable rfkill for some devices on which Wi-Fi would be entire=
ly hard
> > > +      blocked by default otherwise
> > > +
> > >   additionalProperties: true
> > >
> > >   examples:
> > >
> > > --
> > > 2.47.3
> > >
> > >
> > >
> >
> > Is this really a hardware description though ?
> >
> > Its really more of a logical/functional description. It tells the runti=
me
> > what todo, not what the hardware is.
> >
> > You could also have a list of quirks in ath12k for this or have a user-=
space
> > utility look for the appropriate platform device string name and disabl=
e
> > rfkill.
> >
> > I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggeri=
ng on
> > a compat string.
>
> This is good point. Either this could be deducible from the compatible

Thank you Bryan and Krzysztof for your feedback, I will drop the
disable-rfkill patches from this patchset in v6 then. I will work on
a separate patch using a list of quirks in ath12k as suggested.

> or this should actually describe the hardware and whatever is there
> wired/configured, not what OS should do.
>
> Best regards,
> Krzysztof

Best regards,
J=C3=A9r=C3=B4me

