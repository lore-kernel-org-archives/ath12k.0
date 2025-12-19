Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC6CE66891
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2mHPlSnjBcdFaDnCQucul1Ba9bLMUO55RhPO6dSnwA=; b=eRGZJMC1h+pDDvhKtPlOSb2B59
	zeRu+gU5IOznhpMU6xZvZtpurdf9Oi7/qv/yGeWvuXPQomqcmDjz/HN/hx94Vqb6fSgC0F4HPHPzJ
	LftPsTcICxpOYp7V5IzAO7vKapJwCuPY0C7QI4JooQhHd5ZCZ7nAt9m0oCFzIk5ViFMdHaRVUUfVA
	7bThc9Y2qF+6PwB57ATHyckbBzeJGA96dmKtCOrha8Ghtc3tPk6PzhIRhOpZ3U9freXMZtMAQc01E
	R3V4ugXv/Hn+KL+39Vrbdm2m0ZMjGvd5zeo7Di5/En/V/3tbfUs+qMz/IlkmhchMzk1P2vPx3WcM9
	6DRg8n/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhYN-0000000Az1f-2wqF;
	Fri, 19 Dec 2025 20:58:23 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhYL-0000000Az1L-0esX
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 20:58:22 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-88a2f2e5445so24504166d6.1
        for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 12:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766177900; x=1766782700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2mHPlSnjBcdFaDnCQucul1Ba9bLMUO55RhPO6dSnwA=;
        b=H5cvik/WsEmpZyHoPN6B4FiNBnRCj/5vYrN7NAIysaUuW0wbt0h+cH4PVKflie0asu
         s4R4WB+ANn5OFfigDvkWqACWDFYq0borOo+5cLZFEzBiIYJt6v5eu1zPXe5bmKfy7f7n
         N4MTZDcTka8vXbMb690qCX67OMapLl0ek92aY1BRM+2zyzDvegtYxJLA931/TjiSz9Lf
         uXOVh/p7CNKzu5biDjv+JX8b99ye4WlHst1PIrArlt+NTqQY54cFQBtFJIlr2AXeV7gE
         mvjSds2BQQs/KgnIo09pUftz+QJlW0MVj4GQdgzNiEZ8P8vi+LQ52/YNcLLEesgxllxD
         lCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177900; x=1766782700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z2mHPlSnjBcdFaDnCQucul1Ba9bLMUO55RhPO6dSnwA=;
        b=M3XXW+tGhP1VXfswR91ORR5thJdfhFP5QScQ1kcqj1TsMP/2Sk9Fv/d4iaIIxB0s2Z
         Wh8nZA/LTc6HTuyoTrkYRduPExo2TOWUd8rurA5g0dGy+URcEO0Wifo6MlsJhEdDUSyO
         98mrg3T8vetPeoBlt8VXnTLvQVhVTR83aEBndbL+/+DX/0rQp5p3IAZZnCh7ZXk9F6Q4
         ggMgxh7XwZNoDIVgytTkvK5GBIbEIPbkG44DEzn3+8OvzaLfib21QQzStsdh/GCW8axQ
         rC/kIHRbe3P/5q6q77Fpw5z5Rx1kmHou/SJgCLpR74XvBcmvDTQpoXH9G7iBESvcZc6A
         eCrg==
X-Forwarded-Encrypted: i=1; AJvYcCU92akbOVsE7aZWrP0qSsAnNceBD7IESGhNfWD/r3UHw9cqaeOuBUtkhPLTHzc/z1oIbQ3eOoQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFJXv+MQs+8uXjUTtBRZVVRg6KsBectTq8Ks0q011i0SrwTiCO
	/b8YA/7Vmmr6u5X63rdk5F5Rfb0DycVVOXt2Bs7MfVMhM8Eq7yX4K+ufoj3JUMPtbgJ2NvlIKQ9
	qMtRiINp5ygDNHXqEnXYrE7TlSLpqdg==
X-Gm-Gg: AY/fxX6u3wWEmMB6eC+jrzstVkZ22yXWYo7sTgAkyWB5jgs3Mw9/Tt4hw5phE0dAsRG
	EoXPicbQEA79VxGYdEuhRlQwEh5nPc+hE8fz5aCzt1t3mYrKB6Ued6T0gEQPro+j/QcBuMbf0zj
	kFg71nuxnlA2x1868K2o3kHhq5oM2YBqBUE/+boU9bQqaDizj26uHI7iSOMOwP/PvtbcrXocWFd
	P2jz+l/+VuDICEiLHI+6ATRKkbMh/XQugmX3blMccCcshCLtKvipEK/FFX9LkmPcaHpJyHQWpsi
	pHm8/lIh3pBmJkdBSAQv8tSGP04=
X-Google-Smtp-Source: AGHT+IE5zXTwVQxrbaPXQC3VXCOoLJhpKpR4tXpdb/7cIMJryLXfVsLBo2c1bVuuXPFjDhO95WFjskd8XdCTxgQXiZU=
X-Received: by 2002:a05:6214:459f:b0:88a:2ce5:a049 with SMTP id
 6a1803df08f44-88d8491cb3dmr66535756d6.62.1766177899802; Fri, 19 Dec 2025
 12:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-2-7bcf83c1504a@gmail.com> <9c7115b2-9f31-49e1-a2cd-2071b84fb85d@kernel.org>
In-Reply-To: <9c7115b2-9f31-49e1-a2cd-2071b84fb85d@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 19 Dec 2025 21:57:42 +0100
X-Gm-Features: AQt7F2pKwyReFTFBW1AkMHui4zZvwtcdzXVXBUuKjfAtNTDFOhMAD_POvY0snFk
Message-ID: <CA+kEDGGsmANidzkMV4=Dhr_tvTYKYNyrU1TBDja40tZ3MygYag@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
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
X-CRM114-CacheID: sfid-20251219_125821_227435_5FFE5DCC 
X-CRM114-Status: GOOD (  19.05  )
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

Le ven. 19 d=C3=A9c. 2025 =C3=A0 18:38, Krzysztof Kozlowski <krzk@kernel.or=
g> a =C3=A9crit :
>
> On 18/12/2025 23:22, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >
> > For some devices, Wi-Fi is entirely hard blocked by default making
> > the Wi-Fi radio unusable, except if rfkill is disabled as expected
> > on those models.
> >
> > Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> > disabling specific features based on ACPI bitflag") added a way to
> > support features set via ACPI, including the DISABLE_RFKILL bit.
> >
> > Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> > equivalent for devices described by a Devicetree instead of ACPI.
> >
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> You cannot test a binding. Building and other make-steps are not testing.
>
> I don't even get how this appeared - wasn't here before and there is no
> trace on the mailing lists. Can you point to the mailing where this was
> given?

We co-develop and test this patchset with Dale, I missed that Tb:
tags shouldn't be used for a binding, my bad, I will drop this in v5.

> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > ---
> >  Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++=
++
> >  1 file changed, 6 insertions(+)
> >
> Best regards,
> Krzysztof

Thank you for your review,
J=C3=A9r=C3=B4me

