Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC606C83F1A
	for <ath12k@archiver.kernel.org>; Tue, 15 Jul 2025 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cWUdw/XWL0wKty/4mlXjtObOvYTaL5gOM763vl3Zdc=; b=stQ+sX+Bdl9eVMgkUD9OWDhMl4
	IzRdWeRO2OflNngV1Jk8oWJMT286+Eq9eVupu+uM5CDVwgANa+W+hVXnACfil7HuUWk8ELXqYQx5C
	vtkt8npGShZfoVFOTfxLtRwmOP5SJvdlDcv67Ea1d9gz0ye1tJ6qAPdDXpiuKDgFPguKop46lqRNq
	KXe5HyQodTCck6048t7HsPfQgXfvROEeBT6SRaQ5WWtEnc9il+WPHO+UYRpNxJBEhIUFWL9QpV+mC
	iZpQjDbtfA4E1FnIzIwhG+yd8fxjUDgZSyoWoPaf3kR6+4WpMmKNc3w2e3oWlERHYwztZfIcpX1He
	Xvu6PyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTMP-00000003cOk-242M;
	Tue, 15 Jul 2025 00:17:29 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSZy-00000003XZ8-1vAx
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 23:27:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so9187073a12.1
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 16:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752535644; x=1753140444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cWUdw/XWL0wKty/4mlXjtObOvYTaL5gOM763vl3Zdc=;
        b=DkgZOHtbclSDUq+O6Knnzfg1Cz+CnDJFH1YNdBeqBLP+xDoLFMpvJ1SrXqqMp9/nGb
         r0DR5P11l8nWJzOuJI0tNnj+mIruo/CaW7SyA+i/Glr+k+rnM24tObNiTDEd5SsHZypC
         6PTNo6rBrKIvCfPtHYHzT4AUk3bpQI+ZTk+bRD7Oh1dvJi6gUYv7tZSkyBrplaVArHRG
         aWF326fcBrr0lRrt3m8lb8LS3fuMcm2kq/uqw/Q5mIuDV5KiXX05/7QwMFfcm8HNINB9
         l7bw13Yh/kAEn/M9Pjw/vQSxqwKkCuPKgbAv5JS0hQ9NVO6wOdSFIgipnSUTxn8K7v7T
         tlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752535644; x=1753140444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cWUdw/XWL0wKty/4mlXjtObOvYTaL5gOM763vl3Zdc=;
        b=Xm3FR3Saxj93GoM2p3pCW515QEsqyfySzvrg55z6/lejeejaTFIIPIaAvluiNeo3sy
         jM2XNoIty10hWFRRGfCa+JDPqzUAtmubZZ6UBeXWnzxjfSSai0uLVxhtP2Q5wwam3v1A
         KpT06Zm1U4TDfej5NRQFBgR8NLa5rR8+7r5EUjRQfivgc1IQ8rPLVdhK9H4qexkbB65V
         RADL/pf5nRKyjc8n4zc/eGHfea2cPA6Wv1udwaJ4wknk606zBVkIDt2MO/5jtuyaQmjz
         I/hNGlfe7MPf28vtrxZVkFlP7XgoGgBtVUmBiGTdKb5E/lMaSMHqQ2juaTtXDlsaGd2l
         sFaw==
X-Forwarded-Encrypted: i=1; AJvYcCVW85VtNVv/frDGGpjnoDczsJajd0rZuw0B+KO+GqZ9/I11nXrsbz7YnWK8wLK3QtlFW6rwFfI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ7RbByYJJU9Y9Y8lWbY0fjacihRpzg7TKUebCT8syZC+HrhiS
	IH9ABraunVdVOfCu2OqqOoGj65lJMIEjVoAvGwd7L5Pe37zQp5RqON4Qe4OQ+zCkl0f8gfPnObJ
	rgt+ryww4Va69iEqzXH9Hn93J4c5pKA==
X-Gm-Gg: ASbGncukM+kghjOhsvQh2W9hYd31EjWwgDYw/s2QLYMn51P0M26FnFIHowB4IfIjs+N
	93GnsYe3Qqpk7qalcYTdIGi5XN7oWIlzYBN3yTMvjEJQNAOKgNg5nkHAUk/XtLyvXkPD13sOqHF
	T7BcGyHJvzKWdsrvLkby5yexTagDtMd+i0TnxZMyd5rWatyzD0oPNZE24s+kgFI+R4NnBKdoY09
	oMo7LGtlCHE6Q2pFoPY6iz080vHZr8oSbHoohtJZAvNV/GwXg==
X-Google-Smtp-Source: AGHT+IE1PoTMFQT9rN7uOrNQbjO/MTvhGrGizKsF8Ga/T1DM3Q0YSP9nliT/80O/sEv8vzCBNVnaHRdoGdRfcsiVDlc=
X-Received: by 2002:a05:6402:5202:b0:608:50ab:7e38 with SMTP id
 4fb4d7f45d1cf-611e7c21fa9mr14227624a12.14.1752535644154; Mon, 14 Jul 2025
 16:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com> <20250714173554.14223-8-daleyo@gmail.com>
 <prrra3lon2p4pugkgeytf5ow5wls62lfdnwcdykztw3qzwity2@d26aqh6wdyln>
In-Reply-To: <prrra3lon2p4pugkgeytf5ow5wls62lfdnwcdykztw3qzwity2@d26aqh6wdyln>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Tue, 15 Jul 2025 01:26:48 +0200
X-Gm-Features: Ac12FXyokWE3P9WfHcZydzKzoz6l-6OPJ8mBLmVCv-L78yLEYDKASAdX8sAOtqw
Message-ID: <CA+kEDGFR3FB=ead50kFBAL23-1dXo-LOMqhT7f=WecNMf_MaNg@mail.gmail.com>
Subject: Re: [PATCH 7/9 RFC] dt-bindings: wireless: ath12k: Add disable-rfkill property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dale Whinham <daleyo@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Lingbo Kong <quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_162726_546621_CCDD7F2D 
X-CRM114-Status: GOOD (  16.97  )
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

On Mon. Jul 15, 2025 at 00:33, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote :
>
> On Mon, Jul 14, 2025 at 06:35:43PM +0100, Dale Whinham wrote:
> > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >
> > Document the disable-rfkill property.
>
> Why? What does it mean? Why are you describing Linux driver firmware in
> the DT?

rfkill should be disabled according to the Surface Pro 11's DSDT.

https://lore.kernel.org/all/20250113074810.29729-3-quic_lingbok@quicinc.com=
/
has added support to read the ACPI bitflag when ACPI is supported.

The idea was to expose one specific feature (DISABLE_RFKILL_BIT) for
devices described with a DT, so that the feature can be disabled.



> >
> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > ---
> >  .../devicetree/bindings/net/wireless/qcom,ath12k.yaml          | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k=
.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> > index 9e557cb838c7..f15b630fb034 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> > @@ -48,6 +48,9 @@ properties:
> >    vddpcie1p8-supply:
> >      description: VDD_PCIE_1P8 supply regulator handle
> >
> > +  disable-rfkill:
> > +    type: boolean
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.50.1
> >
>
> --
> With best wishes
> Dmitry

