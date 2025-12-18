Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCD5D6E2B0
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vthX8EZ69SmXta9bEKt82uOMLThl45XqVhRz116/j3k=; b=mCBZzB2ifCchcdg52F60SYs/hb
	VO0xHDofk5bEbNTSYlHvmlvatT5lWfg2AZYzlWKtfUfh6YhufylqZbdIyTqBfWQmc0CPO7P8lfPcz
	P5W2nEPp/Ra0QaBjsLuNumelJoYNLu1c9jgFVvFRF53PkLx5LcpEyV0rk57dYs5WI+ZncjZf7yJHQ
	SAZ/eytql/RzNo4MuR/DumgbbbxyNf058eUU79kyD8GqHDebUL9iSNyAz2mFMeItaVT36QIsZpGPD
	NLoBLHMMaB+6Nh6x/pHgD0nkMm16xv2CT/yVyxnzJ/YRYFdISHxEYCbUptgE//7nC+Wx0cAkH6dAW
	Q+qZ+NFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGyb-00000008pvC-30RU;
	Thu, 18 Dec 2025 16:35:41 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGyZ-00000008pur-3HlQ
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 16:35:40 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8885aae52b1so7067126d6.0
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 08:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766075738; x=1766680538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vthX8EZ69SmXta9bEKt82uOMLThl45XqVhRz116/j3k=;
        b=U6r4TC3oHyMt2M/w56cjVgwBkb4krwmMWLiPP+qDbdZr93SxsT+Q3u1bexn7PDGMT7
         7Rbfezqv+UjeLo0duCl3XZWnpvMqAZyr6AaOgtQqK3twx7OjzfjYwBnDOrulNwCU0OKg
         /xtCE23wvh8Lx2n7CgkVk2EjnRaCClQINPZh3ObKUGNnFsodZ9ykSrheJsvz/2A0tFbl
         Rp+TtpLOySg4xuSDdq+7VF73m2cPrpCQ3oRz6RO2sNrPDpo/j8v0zx0kksDgV//ptzUs
         +Vprm/4v1PofXmBBKUF176OkQGcOIc0NN1fmj6mQFBu06S7IXZFS7/SaHyL85u1OIBr6
         wp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766075738; x=1766680538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vthX8EZ69SmXta9bEKt82uOMLThl45XqVhRz116/j3k=;
        b=pNTuHzdNw+mYP/rN+N2h7ePfir3TKbgYbaPQ2ZpCw9j6ywBhXqrtHCZj9/Strzglex
         N0qO0U5Deda8wUFBqzkcbVw0a9B7VnuTbsRFJSRAuyjzKm02dYKxj5/u9e6YllS6+4zk
         YkEtWTbD3mdsGd/wLHW+SZDdR4UlpiLd2FL1DzmI8i/EjDxCZj2x5G3m5IYgJx+y8iaD
         fHmwzlfUKWRTCQOHdhYvhHB4S2hJdbXf2eq7mANHgkj2iT3j2hZlhEow5sozbLAbABsJ
         yc/MMjvsecX5qO4yMqVmnZldcp5s5Sj0TmdSG5DVu8CFq1WQfnmj7hfy2ij6xd9sKgxu
         Y62A==
X-Forwarded-Encrypted: i=1; AJvYcCX8CXknz3omZCq9UDkG4CMF+dPMJluupyQGcwZHcRO5xgdEVOiVHK1EOHhGG1YreSFZjlRj1W4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdd24Kh8KyCHENM4YSw0VtZ/9seug4s3YPuKD6etxByFZuBQlr
	9oGacl/HpLpWczu9yQ8rIoDqMhCA9X0WaNQHnuyt/F+c7nQjlwVaYg6TGQWCIGlRO0P2honmBOa
	F8FF3611aXxXd7eBSpnNnvpwcFhYDdQ==
X-Gm-Gg: AY/fxX4NrT3cGDYN6o0Ns6wbDQEX421au8y+mPvaO7XZX/gFnk2+VWdok33/FzKY88b
	jwbUUvq3FFasOE0yqKUXhRhg0ykEgv/deG08mJsu6Ecmn7dzPQ3n/PUhzUoiq73nkmLBTmipxVq
	OtI+8A2XV6LRjWbbln0Eg1IQp6T/RiLakE45OEh4Eg+rsyH5+cvewLEzsw9mNGyUQRWswQsTZcM
	Xdl6s1YVU9cZQ0yC5WG+gBxNKJNbETCDQWmesaodCxZziWlqof3SMp5HuDGJWLBj0KN35XAfCYy
	XwYGPD0gFe71Ui8nzIr6xjETu5E=
X-Google-Smtp-Source: AGHT+IE9/ZCMCiyjrmPyCIsxYsQHia6PO/5OA2ZJrCLu8tQ8JQjcXci/gveKRp2q1MLBH7jp/9tKHDC2qJ1c5+HtAN0=
X-Received: by 2002:a05:6214:598e:b0:888:7e41:a9a with SMTP id
 6a1803df08f44-88d87be8db8mr2888306d6.46.1766075738235; Thu, 18 Dec 2025
 08:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com> <438a352e-5174-4361-b6e5-6ff5fe1ce0c0@oss.qualcomm.com>
In-Reply-To: <438a352e-5174-4361-b6e5-6ff5fe1ce0c0@oss.qualcomm.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Thu, 18 Dec 2025 17:35:03 +0100
X-Gm-Features: AQt7F2rTRoXMF5xHMqmkLERUjvS2qI4aUT26N8INWGtmOaD17Y8RxpKD_isxRH0
Message-ID: <CA+kEDGE42HhaWZy1o9DjpwcjPiJcqvq52o-_g+auOkp26ukULg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
X-CRM114-CacheID: sfid-20251218_083539_852613_FB9246B4 
X-CRM114-Status: GOOD (  16.66  )
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

Le jeu. 18 d=C3=A9c. 2025 =C3=A0 15:15, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
>
> On 12/18/25 12:56 AM, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >
> > Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
> > using its Denali codename.
> >
> > The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
> > the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
> >
> > Due to the difference in how the built-in panel is being handled
> > between the OLED variant and LCD one, it is required to have two
> > separate DTBs, so document the compatible string for both variants.
> >
> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
> > index d84bd3bca2010508a8225b9549d8c634efa06531..7c99bc0d3aae3dc6e9c08fe=
f0a535e114a3297a8 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -1067,6 +1067,14 @@ properties:
> >            - const: qcom,x1e78100
> >            - const: qcom,x1e80100
> >
> > +      - items:
> > +          - enum:
> > +              - microsoft,denali-lcd
> > +              - microsoft,denali-oled
> > +          - const: microsoft,denali
> > +          - const: qcom,x1p64100
> > +          - const: qcom,x1e80100
>
> As the bot pointed out, this is valid, but not what you want:
>
> This expects
>
> "microsoft,denali-(lcd/oled)", "microsoft,denali", "qcom,x1p64100",
> "qcom,x1e80100"
>
> whereas you're looking for 2 entries:
>
> - items:
>         const: microsoft,denali-lcd
>         const: microsoft,denali
>         const: qcom,x1p64100
>         const: qcom,x1e80100
>
> - items:
>         const: microsoft,denali-oled
>         const: microsoft,denali
>         const: qcom,x1e80100

I was trying to group the 2 variants together, as they are very much
related. Your description captures the 2 variants way more precisely,
I will switch to 2 distinct entries in v4.

> Konrad

Thanks again for your review,
J=C3=A9r=C3=B4me

