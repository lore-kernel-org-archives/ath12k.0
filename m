Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A23E6688D
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3Vnb75W8CfJzDnDxCk3fIRFIT3WDMCJ1BDdD071/aU=; b=g/MbkoD9UHNHtJ/QteHeRVOj6+
	QFfvcnszTzUYVsiBIaGlxwQEhx/P5/yRX1WSkFhrNTd3QLc/qgUfGCTD+DOjMuZDgzyepvF+ZZWUI
	ydGvwTIKXvEDrvklUIqwzfOsBBKlRg9uFnQPxrQ20Gpa+nSlDDGo0a/CBEWhV3OwdIJ66UKScxoWj
	kBE+QPxwmbG3BG2l55bF8QHF7F9opXpQLiwtNEzXbeQ8B3LPQfHvisIgjDICHWWGxLn8EVwYB6wPV
	o75vHTAwmFer4aTuXRXT5LzO+PnqLfvN63R6NOYaJXQp6WRrO34IfVPff/JBoxj01seQarQr76fLC
	4eQKBTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhWV-0000000Aymz-4B5I;
	Fri, 19 Dec 2025 20:56:27 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhWT-0000000Aymb-0NLn
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 20:56:26 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-88a35a00506so31526446d6.2
        for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766177784; x=1766782584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3Vnb75W8CfJzDnDxCk3fIRFIT3WDMCJ1BDdD071/aU=;
        b=hEZv+jpi77h4qMc+k+ITAh+mWpD1XAAE6MqIJKKedg0LLs4ngXyGGPJBHuUDugbCBL
         9/lE/qb+dJkSx4oPoMZstQoiGzRm1Q0er/kvIpR3nTaM98V+mGolcM4gSfyMEmmOTZk7
         0UgM4Hptgvun4+XFzAbOLnegUI5MW27AX+QwS5SwBCw1V0ErMsem2Dm2J7j+IVYPgZiJ
         p4wi59V1LNuW2/P6TyRv5R7+r6WaHKHf9GCQzyP7VQG1c4kBqc5NPvNRGwh8z8sl7QWP
         nlSQ2Id9L9y+ZpFoyrJMcyvGeue3XF2LevCXT/XiMkjiQp0MthMPFDOTbf/xECYa46xw
         4fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177784; x=1766782584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3Vnb75W8CfJzDnDxCk3fIRFIT3WDMCJ1BDdD071/aU=;
        b=Av5I1FNbEoga923aU9exKKbZnNIvGy4yfxy+gQ1GEhY5VLYOVPL3PNxva8RYAOMKmr
         rz/kwMDm2D/53/uk7xEjksLWY1L7zH9L8fXvSRCfw/sJsHxQdK5nHC5dYQBkBtLdws9x
         bDdS68BgoftLwzMBnJIbUBb0Iz3+X+VEwXMlUFIFf6Q4H7Gb8kqc2/ol+Nugjqcl759m
         HqyZzH9AZ8NDWoDlgmGAMvc/4DrPPVIEGk/8LwIucZ/tVmOH6q2MFFEfmUP0Ybtl7OM8
         x6WYeYXihS/vPzf47lYtafGqwC6EB6ybkJE2u7nEnQMgf1W69gZZWAVPlS19bycoG2TQ
         RhWw==
X-Forwarded-Encrypted: i=1; AJvYcCXt1nNQd7lXU3qKtaih32E9VCIqBP047kUR4SKBURlYkgo/a0SYHBqq1Nhx4yxMFR5r5Jiamd8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl+oDfldPh3yljqhroSv+KSBUoSKqpmO+VxyljjQ5Cdh4cgFCN
	PijHRiumMMyHtYLPCcHTjLlCKGdTy+NwYlyLhmkO7AZHgN29N74JPqiIA3EutyUV1IKPD9klRFF
	FQU2iAvfiFSt87J3AOSE6TrQUhhA8dA==
X-Gm-Gg: AY/fxX6va8ig+rN/u9EhGCLTnNCVpznteGqyO1TQCVbuFBiW/hekU4hZlB+EofvTp0S
	FBcRNT6uuCF+o5ip/EsO9QRdr65c6PVrrXN2+SMemzVV5qWgGm1Eff8wQyTymGnlzjxPg+sr7Ko
	xRUmHKaseM9Hm0Ompv4iTq4at0wFOS1xENPk2ppZ+/lgXZ+sbGX37yqSGe4SqLwJmZo4rBVllAC
	dmzw1O6k2qkcstYRt729693UxhY1OYM3EOrrpP56+hchcSPXbfEpXZUE3/cttSBRIxje5ZVFkV9
	GfacItgiWcggtrVK+KnVzNq5ANE=
X-Google-Smtp-Source: AGHT+IGQH6VIaRGaIEOqpyUgjkUaKG66oDPn1z9oy8qj+n60mmZ/JwdsKN6CJzkL/LLNCeXKogbMXa71ZR0FC4qCU1E=
X-Received: by 2002:a05:6214:4e85:b0:880:47e0:19e8 with SMTP id
 6a1803df08f44-88d83792f32mr72964826d6.42.1766177783822; Fri, 19 Dec 2025
 12:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-5-7bcf83c1504a@gmail.com>
 <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org> <d4a87f75-92a3-4c09-9f9c-e906f0b7ae70@gmail.com>
In-Reply-To: <d4a87f75-92a3-4c09-9f9c-e906f0b7ae70@gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 19 Dec 2025 21:55:48 +0100
X-Gm-Features: AQt7F2qYuzcLI8NAKl_7FuywvK75_EKSOb3h7eO67Yd-AWYZh8w_fOHJFdfFDTk
Message-ID: <CA+kEDGGbfXYXwkQcouLJHF3uBv+sPKdG8BE8PEGvVzgwWn_nYw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: Dale Whinham <daleyo@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_125625_138628_D0EDBCDC 
X-CRM114-Status: GOOD (  15.43  )
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

Le ven. 19 d=C3=A9c. 2025 =C3=A0 20:27, Dale Whinham <daleyo@gmail.com> a =
=C3=A9crit :
>
> On 19/12/2025 17:47, Krzysztof Kozlowski wrote:
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights res=
erved.
> >
> > How exactly is this copyrighted by Qualcomm? I don't think Qualcomm eve=
r
> > prepared DTS for this, so can you point us to the original work?
>
> As mentioned in the commit message, this device is very similar to
> Microsoft Romulus (Surface Laptop 7).
>
> Its associated device tree (x1e80100-microsoft-romulus.dtsi) was used as
> a starting point for SP11, and so I felt it would be courteous to keep
> the original copyright notice there.
>
> If this isn't appropriate, then that's fair enough and we can remove it.

Dale answered for the denali.dtsi file but your quote was for one of
the 2 .dts files.

For those 2 .dts files, it was kept when splitting our initial single
DT into 3 files. Thank you for pointing this out, I will only keep
the Copyright from Dale for them in v5 (if I understood correctly).

> --
> Best regards,
> Dale

Thank you,
J=C3=A9r=C3=B4me

