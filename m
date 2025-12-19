Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACEAE66891
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aS4OmYCzbKdvwE5BntPhqf93lcN6z7RXIUJ/QZyRAnc=; b=YWY1HWlAEQYGZJwF6Scw57a5Iu
	uWV2Vl8ENnsc6pj7CgmCotC8uUvbe4BnKXz7jndMEvWpyrGhUguKytExSslvi9kTMt6jHFjy9ya/s
	j0rGFvz8De5WHk/j+NiMVCbz4ved/mkBrc5fReDA3YMwsNz2Lkvirgr5sJRxGXXAG2y94eb4cchHf
	hKDbNQJbsI8IbjogauczQhz8iEVwmxJ5V7UQIfMdCh8Trnjg80WlLbDeDRgnr/qOrzlPAvuIISzDq
	AhRDVEBHXYZGr3R0Icdh7s7nS3P2lLJvxx9BTDrIFOaNacHBPbVV8/gsWThWrc7ESjrjJr5YwbkRJ
	eFhpEt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhZY-0000000Az8k-0iti;
	Fri, 19 Dec 2025 20:59:36 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhZV-0000000Az8E-1rXj
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 20:59:34 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ee0ce50b95so28528371cf.0
        for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766177972; x=1766782772; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS4OmYCzbKdvwE5BntPhqf93lcN6z7RXIUJ/QZyRAnc=;
        b=kcwe8xfImDMc3A37aB6g2b0jSw5cAxJDZEZ2dqJh5wRLk3Uxweo6mrBti5tpJQq498
         lzHyzA/Msol26VYCekoUntnMPu6NqEl+svGjS2D2UO3tK5BaN4f8jVjRC/8MGA+ITtnt
         HPQfk6LngxHDngSSYIlTWizFejPIP8JpsCXrGoQlnoqwpgAl1u3bXjmB541wbVNd/t1U
         MZIw54Um5NOxopUOZQU102Yob/cKnNv/YwrhjkshcII/NjvuGuyiOZ1ebXHpQyPWgeXi
         YwTg0wpwxiOukRhCnKTHNk+lfO2eQxAEL2cZdU/jZqqErZd84qaHm3hK/RPRtSyPhBE3
         q20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177972; x=1766782772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aS4OmYCzbKdvwE5BntPhqf93lcN6z7RXIUJ/QZyRAnc=;
        b=xNINih6ebi0YqgPpWDTNJk5W+5osbHg+sS5DTd58aSbRD5wHcKdqfAFIagpsoXH9LW
         kgPvNdAUCnK344NbCz2IU5nVWHkGi0VTqcX+2Q2EiHcNys5PYjck3iPZtrgTEKDtM8Rn
         izTwNBX9Xi9NDA8yxQAMDGMXykHTIehyybdD1vJtkD+7+BmMIwU9mWzCPI37yg6ZJaHr
         XhsPfvFv4jwesWsXrcQcouplIAXgI/ahwq7UQxWwNeaQ1QsQ7S5M8Gna46bSxgTlR1v2
         uePe87nWPfw1BUoywnyL7XBcfQOP9NcCgfDX/DEA728M0NBCopGAn90Qj4RPc3dWO2eu
         vXug==
X-Forwarded-Encrypted: i=1; AJvYcCUleVtdslPpAtqoXqgfYnuyxVwYnPCy/LY1SpvcSXGIO1Dv4Fm2tmWmTxCopejluHkXfQ/TmEw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjt1wJ7AQ85o8gUeUmWj7LgXuWbgWDxU6RZoI/CJ/t0wgfrIjg
	59nawDGm9yglKWbzTC0utUMUB3qsHWUw5eMJKINsaxVqOFUjDa2qMwZ52AQ2s31f9x0+ksYKhdt
	pmmt5khhKtvHTkDxXlWdY0seuBZQ7QOjcXOo=
X-Gm-Gg: AY/fxX6UsK5Zu34D7V7snh6m/3lTkdQEkYE4im5+6NymG6ifYrYF+yYIUXWZTMAHIw8
	LoOCWsNXsIEP3LEWdOkpTnoSzdAMu1CyaZheB7GUboF9oYAUEOy77ljWkiVzy3PVxoYAEFAHcr6
	L8JNJ+rwGC58pWCTd8oMvxbS6krPoePx7JrQppoS/2+wCAKkiQO+wgHFQ6dOvoYwCNXRUWZJmHN
	N66qdypjmg4OY5+shDMMU+PO7tInMyZmDj/2oxf5NpnHtprXF1Q6Itfd360tksTyNLCWeNjq8A2
	yUdHLqrIiURC8XF00vRx875u8uk=
X-Google-Smtp-Source: AGHT+IHUInld4dr0tzVSPygeNnFyM8vctUDTI0mt+1P0cbCbzfNlC5onUK4e2vD+yoiglNE4/4NgRuxckawSVQK9Zag=
X-Received: by 2002:a05:622a:30d:b0:4ed:9264:30fa with SMTP id
 d75a77b69052e-4f35f45624dmr120435961cf.31.1766177972100; Fri, 19 Dec 2025
 12:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-1-7bcf83c1504a@gmail.com>
 <4d167792-cc62-422b-bf65-3ce101377d46@kernel.org> <fe4148ec-9dbd-4418-9c36-f4a0b9fd2c24@kernel.org>
In-Reply-To: <fe4148ec-9dbd-4418-9c36-f4a0b9fd2c24@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 19 Dec 2025 21:58:56 +0100
X-Gm-Features: AQt7F2r6__kaZegqQ_DFSq72HXuciQhViJslLmVbHDK7WPbCev8YRRE_uxJgK2U
Message-ID: <CA+kEDGHK7J3h8mUvgjf-Y_PJ11zcuaCPXik1d_rp27WPCbLBFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
To: Krzysztof Kozlowski <krzk@kernel.org>
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
X-CRM114-CacheID: sfid-20251219_125933_512320_2D5C83F3 
X-CRM114-Status: GOOD (  18.44  )
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

Le ven. 19 d=C3=A9c. 2025 =C3=A0 18:44, Krzysztof Kozlowski <krzk@kernel.or=
g> a =C3=A9crit :
>
> On 19/12/2025 18:40, Krzysztof Kozlowski wrote:
> > On 18/12/2025 23:22, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> >> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >>
> >> Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
> >> using its Denali codename.
> >>
> >> The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
> >> the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
> >>
> >> Due to the difference in how the built-in panel is being handled
> >> between the OLED variant and LCD one, it is required to have two
> >> separate DTBs, so document the compatible string for both variants.
> >>
> >> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.c=
om>
> >> ---
> >>  Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documen=
tation/devicetree/bindings/arm/qcom.yaml
> >> index d84bd3bca2010508a8225b9549d8c634efa06531..3685330344c0bf621125fc=
3d2f9c04082d6de144 100644
> >> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> @@ -1067,6 +1067,17 @@ properties:
> >>            - const: qcom,x1e78100
> >>            - const: qcom,x1e80100
> >>
> >> +      - items:
> >> +          - const: microsoft,denali-lcd
> >> +          - const: microsoft,denali
> >> +          - const: qcom,x1p64100
> >
> > 64 < 78, so this should be placed after devkit list.
>
> No, I missed this is x1p, not x1e. This is placed correct, but the oled
> should be moved as I suggested.

Indeed, this is x1p for the 64100, I didn't choose this naming :)
I will move the oled entry after hamoa in v5.

> >> +          - const: qcom,x1e80100
> >> +
> >> +      - items:
> >> +          - const: microsoft,denali-oled
> >> +          - const: microsoft,denali
> >
> > So this goes after hamoa list, to keep somehow logical order.
> >
> >> +          - const: qcom,x1e80100
> >> +
> >>        - items:
> >>            - enum:
> >>                - asus,vivobook-s15
> >>
> >
> >
> > Best regards,
> > Krzysztof
>
>
> Best regards,
> Krzysztof

Thank you for the review,
J=C3=A9r=C3=B4me

