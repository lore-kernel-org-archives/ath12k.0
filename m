Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81775E66882
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/s7YcuiJpwKoMYsi7MmSYzjmyYOegw0fzBHdgiPFOM=; b=WurMxoU2dN69buW4noEu2B30uj
	wEvWPJruKtZNc4ecEmr/uXDZkvXDLXCrvBrgufR0eOZ/VNsUFtKUxqZuj3OSTluBcbO0EiYYGV+YH
	XZ1BaTwU+3ktaO1nGekVJNMIbiXtdsKKE2WlFpp263ddlcAMOpeAxBDHLCUeakF+D8pO0nXThCcH2
	miRGRR5y62DgSJx4L3oncHLtjl305gCd59E7hjh5YwTSPSEUAuctEO2gnYr+hu37MbzKCbPz1KzAB
	AMTTIo2WRlnXCO1VeNfoNc3r3nhry+C+ccHthL/+LDkpG0hTi9Dr4hGBFVnME+Vax6DL14Pc4TOyE
	FQPRCLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhQT-0000000AyAC-156w;
	Fri, 19 Dec 2025 20:50:13 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhQQ-0000000Ay9N-2zsK
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 20:50:11 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4f34c5f2f98so24055291cf.1
        for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 12:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766177409; x=1766782209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/s7YcuiJpwKoMYsi7MmSYzjmyYOegw0fzBHdgiPFOM=;
        b=OZiQoAgOFi/I2/eRoHesm7MtOLzrM+ssTInOUO6O1OVDed9+visXwTAigcyGS6wDUh
         Pyrik0BUbYC4SaGBWWLvThe3AQRT2H8VGTgQHN99S2F3RUa6NnIS0TAmjr+Y6qRLa26g
         aCi6Ig6FmxMx/qOprU0HyFMyx6mFbyKO+nfmfp+dmQyeAQa4LBc4cA0XgL+xaJnvOpk6
         t/3N4hduTQea72G6j4pSDZqHCOj3Sy5cfK2bZw0+UlTCa3l2efyz/3o6CdKdaRU8DLu/
         cNhAXHq7v3zmigyF8eoUOLKFEvABhnSjt+LhPs1twA5gG+xshRzAn3l1XA9YMG/HyyNA
         ckbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177409; x=1766782209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E/s7YcuiJpwKoMYsi7MmSYzjmyYOegw0fzBHdgiPFOM=;
        b=exqNrB3pLRi0jnDz/oSt2wjxu5SlC1K4h+dTicSjql5rDcq/91zOeAf+lBHck9yKOJ
         IP/GplZX952FzQIAhNRWvl0S5Ua7L4Unh2Ru1gJwDQQJy4d8D7JQitOGL5sciIGxRhha
         junoo/hqSieJNDHKNWwdbt4syUA7osUAjg3G8pfnLYcqUrfKBBtHlUKbSi9C3HIQLnRb
         kTM3tYILTrw/wQmgwl0TsAAU6G8Tr55lv6AgKhkHvwIBJfu38rdCvrtXajPVEmQEQmTa
         9lzuwuebaMjSI2EoMM6ItL7ArlYONEzTaJIeHpo8JGAIjuupFbJKsv54cmfGDBnz+fhP
         mQdw==
X-Forwarded-Encrypted: i=1; AJvYcCUARrmTgdB9IbZ60ePTGC+zye4DznmS0zw2jDzcC49MZuS1sy+OEqTJVImrPVVUmLNVhEot0p8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOcOEzOiFdNW39DmVQrCm+ya35ldVjrr//nQxYzMK/cfdNHFqR
	lXURgaafWjmsvaO3Cnph+nxXfF8HoYpGUHdwijDaJeGrDB4Wi+s4wPhpG/eYqK3K9hMA2VINzcH
	hU82oifUhEeXQBShmqDRkoV7YTa+M7A==
X-Gm-Gg: AY/fxX7owLbbSreyeVthyDtz5jDOK/SZ3s79liFRimGriZ9bWNvVIvGQsqk2GNX92/B
	OmCAD5EXu+Eq9pUk3DmYsDvSRZ7sGFQdZhjH3YQ28FrFfUit5xWMeq+yFQvdc0dvBxRhjcqA86H
	Lno075oZ8EsO889KRvHxniEjdpYrHwcsa8EFqg0N5l3SUp2+mbsdXPqUe+LIVBqj5doWWIWRJTP
	lOXPq4RwsQq0H4DBBHJg39UmD3K0wmjzuBRMTiq7I4sTHNCxf5cOmV6x4u3xfwrNoohI+yUtQED
	Pbymwf2t8gsAOE8UOtINhvVrOyo=
X-Google-Smtp-Source: AGHT+IE42yv7FIsrWMR9yjYwFTyqReRn26jbbdEMiBw0u/y/uO6l059x2jBMuDoxTGPi0k5VPly4SKVeRcBZYLHomSo=
X-Received: by 2002:a05:622a:400e:b0:4ee:d6:7a51 with SMTP id
 d75a77b69052e-4f4abcceef9mr71345351cf.12.1766177408683; Fri, 19 Dec 2025
 12:50:08 -0800 (PST)
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-5-7bcf83c1504a@gmail.com> <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
In-Reply-To: <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 19 Dec 2025 21:49:32 +0100
X-Gm-Features: AQt7F2pcZUitjZSQNg2PzbbA2oie2fjwh-55TuTLVMXOnU3tEdVckxLHObxjFK0
Message-ID: <CA+kEDGHL0A=KYhp79_08sx=dUyvpDOuHXEuvgsOU+61PshtN3w@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_125010_757998_5E2C0378 
X-CRM114-Status: GOOD (  22.00  )
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

Le ven. 19 d=C3=A9c. 2025 =C3=A0 18:47, Krzysztof Kozlowski <krzk@kernel.or=
g> a =C3=A9crit :
>
> On 18/12/2025 23:22, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> > From: Dale Whinham <daleyo@gmail.com>
> >
> > Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> > Pro 11 machines (codenamed 'Denali').
> >
> > This device is very similar to the Surface Laptop 7 ('Romulus').
> >
> > Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can creat=
e
> > x1e and x1p-specific flavors of the device tree without too much code
> > duplication.
> >
> > Hardware support is similar to other X1 machines. The most notable
> > missing features are:
> >
> > - Touchscreen and pen
> > - Cameras (and status LEDs)
> >
> > Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> Drop, authorship implies this. Otherwise this suggest none of other
> authors test their code before sending.

Sure, I will remove this line in v5.

> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |    4 +
> >  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  | 1324 ++++++++++++=
++++++++
> >  .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |   20 +
> >  .../boot/dts/qcom/x1p64100-microsoft-denali.dts    |   16 +
> >  4 files changed, 1364 insertions(+)
> >
>
> This DTS fails dtbs_check.

Indeed, this has regressed when moving disable-rfkill into
ieee80211.yaml, we need to reference the moved property
from qcom,ath12k.yaml also now, I will fix this in v5.

> > diff --git a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts b/a=
rch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..93f1620ad8c71c6cf36ba3e=
c34b9eebc47bf3f18
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> > @@ -0,0 +1,16 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights rese=
rved.
>
> How exactly is this copyrighted by Qualcomm? I don't think Qualcomm ever
> prepared DTS for this, so can you point us to the original work?
> > + * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "hamoa.dtsi"
> > +#include "x1-microsoft-denali.dtsi"
> > +
> > +/ {
> > +     model =3D "Microsoft Surface Pro 11th Edition (LCD)";
> > +     compatible =3D "microsoft,denali-lcd", "microsoft,denali",
> > +                  "qcom,x1p64100", "qcom,x1e80100";
> > +};
> >
>
>
> Best regards,
> Krzysztof

Thank you for the review,
J=C3=A9r=C3=B4me

