Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1942EC3601E
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=; b=RmTIWO3+Y+QoXMG1Ju+bwYcP+i
	ft6kidWrAhjQulkLcdG0zGPqiA4xlkKAHti5xkYt1dTi1d/SkmNYYLpgIUp4HeMMvVvRZfP1TQgDC
	Vc75kuDmKccEoIu9sjSnTeUQjKw6cN6LmYHybfPYfA54MYwbLvRi+IBaw+OCk4+u2bJftTeBhUOwr
	mWJ5+GQN8jg/QS5bb/c1+SlPBZhtPUcFds5cMPIxGPfpM0uzw8h+Sry5OT3yT7pBY5LSt1idz8VgH
	obfXAjk7TG+Xo/J3zRZKAGZeXwkLRSqFb/BXehX/cUMYl6zAIZymAiD9qrACwTSRTNEBil5l3tWOP
	K26gVCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F9r-000000088pK-3Zfw
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 07:38:39 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F9p-000000088nq-0brM
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 07:38:38 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so5344921fa.2
        for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743665915; x=1744270715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=;
        b=JDp9doqs+dYZhKoYlOV2HBzpAY2J57vF+PE+mdPrxQEnk384Gwn4gGmPg2xY8WBL3k
         UaVl5V1mVCfPrz4hrsKf1baAXST1Yk6TYeutQgOGTGGNwjVxJQsgYTzx1RSqctiomXbS
         1jkcCXu44seBuqW73Lx2cVjDgHhC0k9xFNeGHuPBL8QXyCUBelr6PQGABUU6AMSSJMJ+
         UQK5qxjUNwZ8qmXdDLos9a9cpvyVtx/5mRgsi+CPC6QGLh1PQ6ETKfhCv/I4D+JujO0g
         Tnp/yjogTVqL868AQejjxbrNPrcEOFalUYO+h2PhsUJKanf4y/9/uRPDLsbZUwnCFpsr
         m0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665915; x=1744270715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1+85w+l8mYkuW5ZQ70d0+EsyEP9qhZP9Q1yJFSdZLA=;
        b=NOfCDJ0Es94dwnhAyba8EGiIgWXt6C0e75YRUBPr8S50JflTbyWEMIiOdJ/iKqYNoR
         MaC1ZWM5YWfd/2OJe8kGu0wtzehvvU4baZtW9E8RpfHdLOoMK/Yie5rXXwolJMdUhCtz
         P7HxPoriaHp/bg9b0NkNOebJunLynryWR+k6LMdHJ5kN5oe6XtRq0gnDFumhPUPN8xrh
         al4wKhCwP8BvRyNNgiktnEhgUxem2wW9mZXumeR6P0d569N9dVfDgV3j4eaRUWidVoeo
         AE0FNyzea7Vdhr6hBFDVsszXoQejsYm4fY4jykQn0BPyrfsWH1gHFlIIFkQnGfNYWA9j
         zeag==
X-Forwarded-Encrypted: i=1; AJvYcCWaK1Inmf4Z8zjKdE0mEcRl98nYNE/Y1wpmp9Mtoiq1q2MSZYoJ5A2qU5oTnDrpMnSpNnueY+U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/PwEjriQXOZ+Ehin36GLvEQ9Rl1SamR0vwuq/QzAVbDmAHtL4
	cKl4wRXZbltBGFIY2RJvnLVbIjpYWDc4mYs+rRESX5YlUJzFEJYxnFNd/UShj8PInqK5JI04gQ2
	OFVT1v0Ix69wfGS0uaUDsyAnMcNleFwpuauiy0Q==
X-Gm-Gg: ASbGncvTV9vi14g/kt5bnPlPSlASm5sC0WgQtzD0BcWyCExAVDqLOIYCLQ5XffdCu6o
	ahOrku7Zz2IzGmEwhLdJNGdHCNxSW0LTntX9QTmDk0gJVGrO68IfM/CWzRd6MW4EusvU/Bs2WO/
	IJjPPvixkEGTXBQn5H54qC+7qTs+zX9FYtjgoe7TL2Ic448MjFjA15JV2h
X-Google-Smtp-Source: AGHT+IE+efI2xX/8yZlFAe4Vm/Cxzz+Nax11lqQy3zdclZUZJJhpwXV7c7fhUqN3JwjPrbPY+ZyZGS0ljljrKBqXCe4=
X-Received: by 2002:a2e:be14:0:b0:30b:8f60:cdb7 with SMTP id
 38308e7fff4ca-30f02b985a2mr4363601fa.24.1743665915290; Thu, 03 Apr 2025
 00:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250402132634.18065-1-johan+linaro@kernel.org>
 <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com> <Z-42nVkEZeWHdwAm@hovoldconsulting.com>
In-Reply-To: <Z-42nVkEZeWHdwAm@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 09:38:24 +0200
X-Gm-Features: AQ5f1JoaECCB4Ig-OQoVaRV_IJbeuDbZtSRj286KtUBGCZkrM4_HeX7c4fhC4-E
Message-ID: <CAMRc=Mf3on3TpiPDhtPnp1-3b0ika2GHy6h-NJqcgvYpWMHpoQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_003837_207990_7F67AFCD 
X-CRM114-Status: GOOD (  17.26  )
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

On Thu, Apr 3, 2025 at 9:19=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Thu, Apr 03, 2025 at 09:11:07AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Apr 2, 2025 at 3:27=E2=80=AFPM Johan Hovold <johan+linaro@kerne=
l.org> wrote:
> > >
> > > The PCI pwrctrl framework was renamed after being merged, but the
> > > Kconfig symbols still reflect the old name ("pwrctl" without an "r").
> > >
> > > This leads to people not knowing how to refer to the framework in
> > > writing, inconsistencies in module naming, etc.
> > >
> > > Let's rename also the Kconfig symbols before this gets any worse.
> > >
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I'm re-adding the tag here as otherwise b4 will only pick it up for
> > patch 4/4 on v2 of the series.
>
> I had already added it to the first three patches so it was only
> missing on the last one.
>
> Johan

Indeed, sorry for the noise, I saw b4 only applying it for the last
one and didn't check git log.

Bartosz

