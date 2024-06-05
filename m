Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA83C25B76
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 09:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3c4YFpd8Fm+Esjyb3eXLbvb26s9zAJBJ0sBTmfOcoOQ=; b=FabFbQCple/J1z7MaoSaZM//Si
	oyNMtyuzj8jBT9ah+f1Ppx7ew4UmDg8kVaoBnGUAFyg6ixI6y0M1exYfAyOcEwXeLWLfmw2d/F2fU
	R410Rt2PHH8yMNkyY4Mo1uOU0fFfLLECEPhEZMs4yzhZzFOFoOO+2LFzzMmT8apE11v24VKvLOtFA
	y83HnDrdOwjM7oJGqwXOFIhBmuE7B0JkmcNiHfmLEv6/Eu4GO7ObvztfrfAFxwBQelB6UmKMOtbMo
	5uPs/JKYMygqmRtCamIozdRuA2VgWLXW69DjPEm6jmE9Yv+XyczjZ9SfaGf0BsqtsWZE7pJzI5stN
	r/+v85Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmhv-00000005LJv-1wAO
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 09:13:23 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmhr-00000005LHb-0XN8
	for ath12k@lists.infradead.org;
	Wed, 05 Jun 2024 09:13:21 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2e72224c395so58350981fa.3
        for <ath12k@lists.infradead.org>; Wed, 05 Jun 2024 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717578796; x=1718183596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c4YFpd8Fm+Esjyb3eXLbvb26s9zAJBJ0sBTmfOcoOQ=;
        b=u+OLW/c7WYP6ThDuPggYys1TBr5NlK99DsgY8fX8ZGP0+Mzp4MnJ/BWQ1rrhqUXeo9
         GRrqjZkbIfZykTsTwKxU+ec+1rnDcdilEU+NDFVd8IyMF1CrYzvlUGqXjHLXEj3I1JaD
         KkA3TITcue8NaNxtuquWOOY/0oECjulUPqpSKRWmdlYKAb+9+tbOagCu2blrEGmTUwgq
         4omlM3KgYCtuM83ZwFb8mDS4mq0UQWtuORVkIerDVGRWACSGClOLhtxYUW7srV6Y8gsZ
         ohtNiJNwTkDSbbHGrB7BEHqqhn34I+R6wl0bjM0Mcw3KMpTYs+NZj5stNUG7U7yeRyrf
         nYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717578796; x=1718183596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c4YFpd8Fm+Esjyb3eXLbvb26s9zAJBJ0sBTmfOcoOQ=;
        b=H5C10+Y2vh6cgm1EFckIC8sAHR6uR11nfz2jsVRvWBgmeEi6VcBtlBTZC/r8BnEwcJ
         yryyU4JqFilFWoRoETjjNxIVi19OGB0LZw9+FL7oQP45EaDgi+nel7zBUiHnG6sS4gfV
         cweZrPSBkxYrJrgbDShO1Vtxkqon7E7deKYkjPZB+AUWQ0/YM60xUPvU+5gFQ9VffrtC
         94MG+WVJEH9RaKZIFf2vSWTzAk0kvsfOleArQUHgANoT9l4NRBxSM38mHzl8di8k2Ubb
         ZqkeXJfbbBS7c0q0DTRB1SqP0CiNr/25dE0JMKFQ0n4/TSgEDOZ7upRoTzX/WwX/MEzf
         janw==
X-Forwarded-Encrypted: i=1; AJvYcCUSJQN+4Hs6VViTyho3XpV0tBPcACu2Blt+5rj4BBRNl5iRenLeQqI6RzOQOgxrb9NZtY+wtZdqzsxKh34oAC6hwOVq8UR/tLSufQ==
X-Gm-Message-State: AOJu0YyGA+YwCemRozMrI4JXkGssG7MI1SApHtrjjNc+E1MDHL0ZnCuK
	GxRABUfBKYJ6va01XaC2wVZwYOtKveYHMgtkSdfLZt3D244p930169y4cflCclFQ2mmPHy//cV2
	EDfYlVD2WFFBfrrfqLtVQ57b1chk683LnWVXbRw==
X-Google-Smtp-Source: AGHT+IE63vGTd6+j21cBJUHSJYSLK2xCKb5rCCgsCKhs4EXyLEAsob0AZ/LylbrE5cvmoYjm+qi2nvoKP8Y3gZgS3f0=
X-Received: by 2002:a05:651c:30f:b0:2ea:7e50:6c94 with SMTP id
 38308e7fff4ca-2eac79c1bbdmr8705551fa.16.1717578795960; Wed, 05 Jun 2024
 02:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240528-pwrseq-v8-1-d354d52b763c@linaro.org> <20240604173021.GA732838@bhelgaas>
In-Reply-To: <20240604173021.GA732838@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Jun 2024 11:13:04 +0200
Message-ID: <CAMRc=MeNPvZUyu6rtsWtdvXFmOOpmjKCEpkoc5zBfJy6qBpxrg@mail.gmail.com>
Subject: Re: [PATCH v8 01/17] regulator: dt-bindings: describe the PMU module
 of the QCA6390 package
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_021319_232794_F99CB8E3 
X-CRM114-Status: GOOD (  11.96  )
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

On Tue, Jun 4, 2024 at 7:30=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Tue, May 28, 2024 at 09:03:09PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The QCA6390 package contains discreet modules for WLAN and Bluetooth. T=
hey
>
> s/discreet/discrete/
>
> > are powered by the Power Management Unit (PMU) that takes inputs from t=
he
> > host and provides LDO outputs. This document describes this module.
>
> LDO?  Again below, but maybe this is obvious to everybody.
>

Yes, this is an acceptable abbreviation to use, it's all over the
bindings and regulator drivers.

> "This document describes this module" seems possibly unnecessary.
>
> > +description:
> > +  The QCA6390 package contains discreet modules for WLAN and Bluetooth=
. They
>
> s/discreet/discrete/
>
> > +  are powered by the Power Management Unit (PMU) that takes inputs fro=
m the
> > +  host and provides LDO outputs. This document describes this module.
>
> > +  vddpcie1p3-supply:
> > +    description: VDD_PCIE_1P3 supply regulator handle<S-Del>
>
> s/<S-Del>// ?

Eek, bad copy-paste.

Bart

