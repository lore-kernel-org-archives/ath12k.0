Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BD7C28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy9/NJXhvn4mIwhmDZnkXdRgiPzF0YdRinTdxKRE0Rw=; b=FPJEDDHDM9EAUvlh6Oga61svKP
	k/kyNw1ORlq+QrXUD+DHbJE5b/o+/XKsowXR3W8OE+bkxOHEyIKhv1uDPeokxHLegZMG+dBGcm49E
	TdLOAeHCyEpRZ+L806x8SQr/I9JeNc5TaZnytJBkPRcp0xoXdmaVa2o817JUKd8Lc2vSj/79XFhDd
	xuyEP5c9nDrDrR8jMhU12vJdAtQ0Dlo0qrOr5IhPvdg+m0Kit1MOUMBFP+2kJG3I9uGb0LqD1+1vQ
	FoQOJVyswjh2QkBs/tagKQ0XX39cykX3thWSN/5L+yxQfCbQZygGO9ZELFYAeDvQLAMUu54QpJJDS
	ul+Iud8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwkX-00000005zqG-0YwC
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 11:59:17 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwgC-00000005yzM-1m7P;
	Wed, 02 Apr 2025 11:54:49 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e5dc299deb4so6767222276.1;
        Wed, 02 Apr 2025 04:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743594887; x=1744199687; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vy9/NJXhvn4mIwhmDZnkXdRgiPzF0YdRinTdxKRE0Rw=;
        b=L8ZIreKfIr/4LWDpO+SW3Yxmz5MQyNfcaUyxpeChOOp7vNXcOj5zkAR2M6798r2UAm
         ZCpZNW7gdJjLJLAboZo0R8Kw7+kPTSmGU3HZcedrZkkOvxJ/HXsR517e2cSC6Ih0KAmd
         5TH4mKchwnej3QWAwIJNKBoMuVqtgJiYZf4U23vytHsKHkgxaEmrIST150KmtxiT7SaP
         f03HT1UP8WRYZlqwM8/uoAkN16COxpUt0Yyc0kHyXiAnXwCX9CYQV7BTe4/7xAxAC988
         d4uUXc598nxNbkzcmcdJpD73yCYST8s8BGKCwiEEbBN0wuFOM8a7ZU4QZ0dY2VclOgza
         t32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743594887; x=1744199687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vy9/NJXhvn4mIwhmDZnkXdRgiPzF0YdRinTdxKRE0Rw=;
        b=MAenoZjNerAMZAU+3Ir/lszpwBn3z/QqWXbiT+B77jMktAqsSAPB4J+A9+VQrl/k4D
         2xYZPT5YNRqhIe4oHCQz9RJ0Re9t7KhscBrjlCfZN4QOvO5BrX4hU1cZ564OZTabpdxt
         WqZz+8XM30YgEeEaVOvIRVV86FAlF+4YzRb9hDQQulIigGHGg0Gb0IXfNBLBps/yixzi
         NgiZpyAOuJlEWRUTQLvXOYKj7kMF7nRGWmBog5FvO/8MxVGXyMBbFn9HEou9lEXHyqT6
         xtqxoU/fmGolgwVrUPj0fnEq9UJJykcAHTbSd8MCQILsswFyr4eW4Nmhh3kJf2WFJ1Dr
         HSRw==
X-Forwarded-Encrypted: i=1; AJvYcCUhWG1ajlVO6kWuYSn7++hJ7/iABFBwsI4LlQUXA/92zAe737snuztD3dm01xC2XENYUZe+0Lpz@lists.infradead.org, AJvYcCVVUkXvl/Af11VUqzZJAkzgYPqln6xWGGCMVUoFHV+gk+038zxOf1lbxrJ+B8k3LEBWCojqROc=@lists.infradead.org, AJvYcCWSfgHY78CQI36Gy4IDs76xMbuN4zhHVnRcl1WLx1d+2eCEIEd1ZTbwz2lNrJxBh+cew4/45iVTB5M6p+iDoqJ8Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw69DDmr7bcABaKf+6rw/FuT5PAiYFgtUe0VEwpJHl4M+Veh/Cg
	9yGIc2E/wC6vxprPE7ZfszqcGv9kWCcECrWxe/eE2QufNFb6Tjd9760mpTQJ4CBfb0Jk8EhVA3f
	ffHh4ErGOvCSvT1KxAvbfLPyH99Q=
X-Gm-Gg: ASbGncseRky1Hpb6Voy8zU3QrIKUdTwAL6S6yANEys5xoJ4X/rqngfoN8n4+Fsevo9Z
	8FGdUHEKtc4M/cjqdeEMtKUAWx3+D+48jfmGnXq+F5BQ71nFERKtUqYq6yE+HK+Us52elte9NIy
	2odyoBEB2jtNPTUAiBhhVjbA58
X-Google-Smtp-Source: AGHT+IFNDtBcIAQYO7+mpC5YBdxcpT/tGHFxiQO0PB6nI3IzfmthfCbTHs6kmv4TBqJ5DaKFjmvLCaVtnbat1OZZT2c=
X-Received: by 2002:a05:6902:2289:b0:e69:371d:6861 with SMTP id
 3f1490d57ef6-e6b838d5499mr22764455276.8.1743594886959; Wed, 02 Apr 2025
 04:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250328143646.27678-1-johan+linaro@kernel.org> <20250328143646.27678-2-johan+linaro@kernel.org>
In-Reply-To: <20250328143646.27678-2-johan+linaro@kernel.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 2 Apr 2025 13:54:36 +0200
X-Gm-Features: AQ5f1Joz82s1WEmRV4TLp7DwBdkZ7lMGLaFCty5_AWjWPHUmCYB4oGRiYB1dCkM
Message-ID: <CAOiHx=mo6Qd+7WrO2JvBLhqjGR7oHds14FwFFAVoEkVWLnbhdA@mail.gmail.com>
Subject: Re: [PATCH 1/4] PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_045448_466594_83002791 
X-CRM114-Status: GOOD (  25.39  )
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

Hi,

I have some nitpicks ...

On Fri, Mar 28, 2025 at 3:41=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Commits b88cbaaa6fa1 ("PCI/pwrctrl: Rename pwrctl files to pwrctrl") and
> 3f925cd62874 ("PCI/pwrctrl: Rename pwrctrl functions and structures")
> renamed the "pwrctl" framework to "pwrctrl" for consistency reasons.
>
> Rename also the Kconfig symbols so that they reflect the new name while
> adding entries for the deprecated ones. The old symbols can be removed
> once everything that depends on them has been updated.
>
> The new slot module is also renamed to reflect the framework name and
> match the other pwrctrl modules.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/pci/pwrctrl/Kconfig  | 27 +++++++++++++++++++++------
>  drivers/pci/pwrctrl/Makefile |  8 ++++----
>  2 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index 990cab67d413..62f176e42e33 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -1,19 +1,19 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
> -config HAVE_PWRCTL
> +config HAVE_PWRCTRL
>         bool
>
> -config PCI_PWRCTL
> +config PCI_PWRCTRL
>         tristate
>
> -config PCI_PWRCTL_PWRSEQ
> +config PCI_PWRCTRL_PWRSEQ
>         tristate
>         select POWER_SEQUENCING
> -       select PCI_PWRCTL
> +       select PCI_PWRCTRL
>
> -config PCI_PWRCTL_SLOT
> +config PCI_PWRCTRL_SLOT
>         tristate "PCI Power Control driver for PCI slots"
> -       select PCI_PWRCTL
> +       select PCI_PWRCTRL
>         help
>           Say Y here to enable the PCI Power Control driver to control th=
e power
>           state of PCI slots.
> @@ -21,3 +21,18 @@ config PCI_PWRCTL_SLOT
>           This is a generic driver that controls the power state of diffe=
rent
>           PCI slots. The voltage regulators powering the rails of the PCI=
 slots
>           are expected to be defined in the devicetree node of the PCI br=
idge.
> +
> +# deprecated
> +config HAVE_PWRCTL
> +       bool
> +       select HAVE_PWRCTRL

I'm not sure this will work as intended. This symbol can only be !=3D n
if anything selects it, but there may also be (outdated) config
symbols that depend on its value. E.g. ath1*k has "select
PCI_PWRCTL_PWRSEQ if HAVE_PWRCTL", and if there is nothing selecting
HAVE_PWRCTL, but HAVE_PWRCTRL directly instead, HAVE_PWRCTL will be =3Dn
and the condition will fail.

Since you rename the only one selecting HAVE_PWRCTL in patch 2/4, but
update ath1*k in 3/4 and 4/4, their select PCI_PWRCT(R)L_PWRSEQ use is
temporarily ineffective. Moving the arm64 patch last would avoid that
though, at least for the current state.

The alternative would be split this by config symbol instead of per
tree, so all users would be atomatically updated as well. These
patches need to go through the same tree anyways, so I see no issue
doing it that way.

> +
> +# deprecated
> +config PCI_PWRCTL_PWRSEQ
> +       tristate
> +       select PCI_PWRCTRL_PWRSEQ

Similar issue, but there are no conditionals based on this, so this may be =
fine.

> +
> +# deprecated
> +config PCI_PWRCTL_SLOT
> +       tristate
> +       select PCI_PWRCTRL_SLOT

This one won't work. Its value will be automatically calculated based
on other symbols selecting it, and since there is nothing selecting
it, it will always be n, regardless what any existing .config says.

So unless you make this a user selectable symbol as well, this will
(potentially) break existing .configs since its value will be then
automatically calculated as =3Dn, and the new symbol takes the default
=3Dn (unless explicitly enabled, or selected by ath1*k).

Best regards,
Jonas

