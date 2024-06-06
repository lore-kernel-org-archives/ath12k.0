Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BD9C27C55
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 13:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BoBiv/oTzAdR1lIG+yWj+SGvl2JhVkHcJoQ9lqvUrc=; b=kQoK4UK2Zux0RGPRFL6LeMVBSB
	2T30hIL/T1iTgdhY/uFwYTgJ6BbSnRusgdbspt7evNdPQat3klbMeY3KgvaRyn4Z+E8jN8DFpGOGC
	ZkY1PBiMp5UkWUG7kMWK7WVaMs1nsPgKZi9/FUaAAh/cD5U59T9DLf5VUshF+RFvSQ3AZQk1O6HhW
	Vcvnok/t9617HY0UxJqwgqqU/FKBlvlQ2klHThIGHILeOLk2LvrvsroigeergGxcLnQ362PKwKq7y
	1HDdLb8/tDzwoltVynViXGZ6MvlgWq+7hDfD1J6OtFsuBojJoTMWf1E7tf+Vy2hH/HECvKhL9tpBT
	TFX7enCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDJU-00000009w6B-17dS
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 13:37:56 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDJQ-00000009w3T-2M8U
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 13:37:54 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so11626441fa.0
        for <ath12k@lists.infradead.org>; Thu, 06 Jun 2024 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717681070; x=1718285870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BoBiv/oTzAdR1lIG+yWj+SGvl2JhVkHcJoQ9lqvUrc=;
        b=cNwC1UBFIyTaCuZg6pP4pBtbXLMdFXibK5lNd3f6GUXYK9qYSZBpGxk9SROqAbnW2s
         +Zpe3KQyH3XyqAlrWCccl6Pa0E532Vp+dlKPb8qr5WaeZ7hWcau8pIiZstA5+wP6zlmj
         pNUOWmyJCZuz+jZ708suYsaY1HGvG96gQblVkj2MM8SvSorshnerMFU3LhDAbxIViUEH
         MMHgbkDIZnRx3km8Lrs1QF0JWbXOvPmu+U3A8DloNWsdvps7hZLmMcXGGk42fdhNpSSq
         /TjGp8jiMtYEPCoPrP4bCXCazA8f8F4flTrL86IhRgMv8Y9s+lBrntH7OLLX/XPKduFf
         Yz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717681070; x=1718285870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BoBiv/oTzAdR1lIG+yWj+SGvl2JhVkHcJoQ9lqvUrc=;
        b=i6ZY66AVspK+uOGNjkO/AKpuMc1TBeU6HfxWV2xIn0Ek5692ZNNm4hv/mDtax3yoQ0
         JVWtT1u4XSvMk8+6yGdhSN10YqgJzJ+SpGr0Ny4PpNGmnqrsPgZiIkSIixMqInn9iTg8
         0CJgCkwL8V+upfdk2aJDJfMDyMd4De2+ybMlDjYd0zRDo7FDEmsnneLeMSm5/IBb6//c
         vElxcDV2WiS2hc3T8XgtI7y6vgZjNh3egXXMAJApEkOc1/KKlqYalkTsEXTZFmpbKhur
         pzNaxZG9p0MavPeBUM9aB5dwGfXRrJq3Mv9KLgjdksaiSURL2UYKVtLf4qggE0UV3pON
         C3Kg==
X-Forwarded-Encrypted: i=1; AJvYcCW/RtcgeY5mCllLRif/jB5QDepJUZBvW9/LmyFGvc2tQooBQM+2FTiKmsYMB6XRy1cgg3p0eyiCWbbqENrBqDYPRV3GOPo3Ar21HA==
X-Gm-Message-State: AOJu0YxWlRZY9SyK04MkAQRGcdPWHwEMJr2rJOX+8dNAA15BdNwjD3C2
	CfBTMMnHPBtFR55JMgrDWE63oeZ74o6ycY2wOcyytq8RLEFW2ivkY5/QMn6qXNEe/hd6SXYB0A9
	DlD82K2MIa0p/SUhweTUEM++pZXYKEZNwr/vSjw==
X-Google-Smtp-Source: AGHT+IGVi6SdXyjqLuNgspGsS7QS0koHqoI5qU5RsxFMIyqlWHAi0Sgl3JgDM1tnD4UfWiI8Hjt8tIufJO2+Xkfj3E4=
X-Received: by 2002:a2e:8802:0:b0:2e5:67bc:739 with SMTP id
 38308e7fff4ca-2eac79f22cbmr31439811fa.2.1717681070058; Thu, 06 Jun 2024
 06:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240605122106.23818-1-brgl@bgdev.pl> <20240605122106.23818-3-brgl@bgdev.pl>
 <87cyouqjou.fsf@kernel.org>
In-Reply-To: <87cyouqjou.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Jun 2024 15:37:39 +0200
Message-ID: <CAMRc=Mdpu=1GFR-KraxCVn4oZr5TwM3ptbY25OHNkGepcsWdcQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] dt-bindings: net: wireless: describe the ath12k
 PCI module
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
X-CRM114-CacheID: sfid-20240606_063752_704819_A7F523DF 
X-CRM114-Status: GOOD (  16.63  )
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

On Thu, Jun 6, 2024 at 3:34=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add device-tree bindings for the ATH12K module found in the WCN7850
> > package.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../bindings/net/wireless/qcom,ath12k.yaml    | 99 +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom=
,ath12k.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k=
.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> > new file mode 100644
> > index 000000000000..1b5884015b15
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2024 Linaro Limited
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies ath12k wireless devices (PCIe)
> > +
> > +maintainers:
> > +  - Jeff Johnson <quic_jjohnson@quicinc.com>
> > +  - Kalle Valo <kvalo@kernel.org>
> > +
> > +description:
> > +  Qualcomm Technologies IEEE 802.11be PCIe devices.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - pci17cb,1107  # WCN7850
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vddaon-supply:
> > +    description: VDD_AON supply regulator handle
> > +
> > +  vddwlcx-supply:
> > +    description: VDD_WLCX supply regulator handle
> > +
> > +  vddwlmx-supply:
> > +    description: VDD_WLMX supply regulator handle
> > +
> > +  vddrfacmn-supply:
> > +    description: VDD_RFA_CMN supply regulator handle
> > +
> > +  vddrfa0p8-supply:
> > +    description: VDD_RFA_0P8 supply regulator handle
> > +
> > +  vddrfa1p2-supply:
> > +    description: VDD_RFA_1P2 supply regulator handle
> > +
> > +  vddrfa1p8-supply:
> > +    description: VDD_RFA_1P8 supply regulator handle
> > +
> > +  vddpcie0p9-supply:
> > +    description: VDD_PCIE_0P9 supply regulator handle
> > +
> > +  vddpcie1p8-supply:
> > +    description: VDD_PCIE_1P8 supply regulator handle
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vddaon-supply
> > +  - vddwlcx-supply
> > +  - vddwlmx-supply
> > +  - vddrfacmn-supply
> > +  - vddrfa0p8-supply
> > +  - vddrfa1p2-supply
> > +  - vddrfa1p8-supply
> > +  - vddpcie0p9-supply
> > +  - vddpcie1p8-supply
>
> Same comment here. To my understanding there are ath12k PCI devices
> which do not need the supplies. But I guess we change this to optional
> later?
>

Sure we can. But "pci17cb,1107" refers to a QCom variant and it always
comes powered by a PMU so these supplies really are required.

Bart

> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

