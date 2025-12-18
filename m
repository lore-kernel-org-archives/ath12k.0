Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998E3D68BED
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFatZ2cHC57MPqYi+kElcilUE7e6ABilLQQM4w6mW4c=; b=rCDo27dpqv0/7UrjW5wSHfTddS
	/mCM2LWCuqBNFrVXDYrNWltgIskPJkt0t5dcF7bJBXVug4yBBPC6ZUZi341s8fRm9EQ3JtT2sv9Uu
	Pmox5vPSgYF6a9kHQADKHjkJ8RjLMaoLHX7+Cr/aRBaWW80Phc1Q8e6a6AYYZue06lstGG6PJ7jyl
	A0wvycdD2wyDdgf4YHIsl5oQtbjKVIwbJ8KYLWAbBhVp7rwi/fPC+txf6XnMLvpc59zND5fc071zK
	KtsjzEjpZxUrKzyG5U79sa7ZP7Uy40PxktEECjuAD5gbO+QMSEr8slkUsMPkFJQX2lLAcyv3qHWxM
	+iNg7Q/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW90E-000000080HO-17sJ;
	Thu, 18 Dec 2025 08:04:50 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW90B-000000080Gg-0laZ
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 08:04:49 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8b2ec756de0so40255285a.3
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 00:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766045085; x=1766649885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFatZ2cHC57MPqYi+kElcilUE7e6ABilLQQM4w6mW4c=;
        b=aTR06efTd6WMgnXIQZzLNe4Q7MVmrcYLEgCxOIM+BLDfSsJK+4gPh1FGrWRoD9YyIM
         oWZ8wt3aLkzjse7k7iQZFJTFMuTgmBjWCwJ66K8tKPhI3zezlknX+MUqtjwb5t1h/cng
         LXsRW5V1/vcgOoQ9Wh2XJWxgv09QD/qYSdoxuo0NH2pwacuPURB4ivSjIvaeEGcsjGsM
         hih4O12bToH/q5YtsHUNdMyP+tCGoUpIGg07GYILI/NJOiijjqAaGm7cHkR+PgG1pRje
         Zh0wsd8/UhVEmO+xc8ZVTiVtUK//wblgvIB8jSriXbvnPN9+t+vaZ178Ui/oBKMw+RrO
         LwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045085; x=1766649885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZFatZ2cHC57MPqYi+kElcilUE7e6ABilLQQM4w6mW4c=;
        b=vDZlN7yqWhYileYmrAi5CklcTI0Qo4wwCicim2O0wxzNs6D5NDmZmSqDK/4vhKAxK6
         VfaIkyUHmyGrFgz9J4yOoKPlg1lNe3pCesnI5p+L7xSN82eqUvGE4to9JxdZaRhNgOXi
         p8sEfJfhNOC+Y93iPosrFxoXMUIwpW16qPqkWMAUbmjSUbmnCyhDMHZnv6K3qvaFHuHp
         U6PrZls5DMvp/8JJMaZTTwpxfeg33P/DbYkVf5KBitfDfuKtcHVNMOp+Vy1B/vg0qky+
         WRZOVXeLCEeEINXkLhoCcvCvZ9wiRu2aa2V0pI/OBx4W257ozxZhUaGTyMnad49gTYQv
         mAtA==
X-Forwarded-Encrypted: i=1; AJvYcCWV8mXIWmobmM6EY/H/TkdyD1bwBISM7C7M2eWpq11BU6X/MgmF2twQvdg/e6SdAAUEDHvixcA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPn4DJg09qa9rRCCGXV5BeS52E/4fuW7ULcGWETvXzgEu1jRP6
	0hSutaUoSr5uV0l1SqVCvZ7qICdBmjvXgBzVySFj/NyqpbnWwW0tWjYfLrsFsMVqT3SCE2ZZx4G
	gTHWa0KbOHLQmMmikZcjcYiEzbfQOpw==
X-Gm-Gg: AY/fxX644RQZ4JqeW3/CTy/EASIglIMH0C3vvQuACcC84iBYaAYGu4j6aXCR9V8ooxt
	K+7AC5YvUQcckyjCjvC0v68GanXJP+ctFTuCTC4bIP7KNZghTZs4dhsD1kA/t7ArgFxcPF2WQPA
	4mV4qVgGpcH+/vcrEvknIAe/m/bWNv0O+FSrRXfNPyYUaTFyUc7TGspsNrqfUBTM+wTsfHrfcs7
	Z6K/x3tCzsjK49WqJrx6D2QxIgyP8PaoLAT30hgTAI5WnFtvnNZ0zlXmwz+UynRYNrthvA3hWtV
	lISUaT+Ht4pIwGZlICWf+af7aq66vc1T
X-Google-Smtp-Source: AGHT+IGeR69NlMrzzWAKf9Swns5oCRSmbi6pAM+ySzcMfeKthzzgVomUQBx8U3ObrUEQapivifkUsz3RXTHr8lctfyo=
X-Received: by 2002:a05:620a:460a:b0:8b2:e179:feb7 with SMTP id
 af79cd13be357-8bb3a36d2c1mr2973617185a.49.1766045085533; Thu, 18 Dec 2025
 00:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-4-875afc7bd3b7@gmail.com> <s45ki2ckgw7fu25h5wd6mb3mc4kzs6qq5eitv56asqf2suxh6l@s5tbqce7gz3f>
In-Reply-To: <s45ki2ckgw7fu25h5wd6mb3mc4kzs6qq5eitv56asqf2suxh6l@s5tbqce7gz3f>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Thu, 18 Dec 2025 09:04:09 +0100
X-Gm-Features: AQt7F2rxXLkRo1KdQwBVcMP3Fy3-pCbHAovHIvjCqXVawC_ZHWulzabv7lnj8zk
Message-ID: <CA+kEDGFTh5bG98dtok66A+hC+-QcfSubdr64M7+JZ0nLeqm_tw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] platform/surface: aggregator_registry: Add Surface
 Pro 11
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_000447_234153_99DD0C3A 
X-CRM114-Status: GOOD (  16.47  )
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

Le jeu. 18 d=C3=A9c. 2025 =C3=A0 01:07, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> a =C3=A9crit :
>
> On Thu, Dec 18, 2025 at 12:56:40AM +0100, J=C3=A9r=C3=B4me de Bretagne vi=
a B4 Relay wrote:
> > From: Dale Whinham <daleyo@gmail.com>
> >
> > This enables support for the X1-based Surface Pro 11.
> >
> > Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> > ---
> >  drivers/platform/surface/surface_aggregator_registry.c | 18 ++++++++++=
++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/d=
rivers/platform/surface/surface_aggregator_registry.c
> > index 78ac3a8fbb736384f7e50f1888a71297a892a7c3..c18d991afc8b0a0bbb26966=
351b75b8ea01097a4 100644
> > --- a/drivers/platform/surface/surface_aggregator_registry.c
> > +++ b/drivers/platform/surface/surface_aggregator_registry.c
> > @@ -406,6 +406,22 @@ static const struct software_node *ssam_node_group=
_sp9_5g[] =3D {
> >       NULL,
> >  };
> >
> > +/* Devices for Surface Pro 11 (ARM/QCOM) */
> > +static const struct software_node *ssam_node_group_sp11[] =3D {
> > +     &ssam_node_root,
> > +     &ssam_node_hub_kip,
> > +     &ssam_node_bat_ac,
> > +     &ssam_node_bat_main,
> > +     &ssam_node_tmp_sensors,
> > +     &ssam_node_hid_kip_keyboard,
> > +     &ssam_node_hid_kip_penstash,
> > +     &ssam_node_hid_kip_touchpad,
> > +     &ssam_node_hid_kip_fwupd,
> > +     &ssam_node_hid_sam_sensors,
> > +     &ssam_node_kip_tablet_switch,
> > +     NULL,
> > +};
> > +
> >  /* -- SSAM platform/meta-hub driver. ---------------------------------=
------- */
> >
> >  static const struct acpi_device_id ssam_platform_hub_acpi_match[] =3D =
{
> > @@ -485,6 +501,8 @@ static const struct of_device_id ssam_platform_hub_=
of_match[] __maybe_unused =3D {
> >       /* Surface Laptop 7 */
> >       { .compatible =3D "microsoft,romulus13", (void *)ssam_node_group_=
sl7 },
> >       { .compatible =3D "microsoft,romulus15", (void *)ssam_node_group_=
sl7 },
> > +     /* Surface Pro 11 */
> > +     { .compatible =3D "microsoft,denali", (void *)ssam_node_group_sp1=
1 },
>
> Please keep it sorted. arcata < denali < romulus

Thank you, I will fix this in v4.


> >       { },
> >  };
> >
> >
> > --
> > 2.47.3
> >
> >
>
> --
> With best wishes
> Dmitry

