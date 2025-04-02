Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293C2C36014
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5bKkMRbKxlSUJHVqMm4hUmrEWQcNn5FC/pLkQqhEAk=; b=Ldl9dMwGvALwgkPiaSNxF9PE54
	KHnpPnmTlKwKJaH8GZArrH8AxFuo2WWTdl/nRZ/B3t+lTMxgNQDvyBx2Eu4swmBiQDg1krP2/4QOP
	gTsFRfmwISzCc1QF4mMCSJh78n+43rHwW+dSv5YMXR1H65qiqEw5GE2sbyavtPtvrCS7mXLZr98Jg
	ZnQ8QPqNusAuYVQNP4m4KrVjr21voK4ehQc8Di9s10XwxUpmW02shWq84KXfmP54DgfjL1sau+ZRK
	vE08Cobr5y9Ny99yGbzyFSwzV9LHH7fAT6VHnJ7gigPSEWauZXjT8qH1k0Q4kH6RVPHeVCCQDsRWd
	HvTLn1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztDr-00000005Ukq-3qJT
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 08:13:19 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztDo-00000005Uid-46UQ
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 08:13:18 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so44152431fa.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743581595; x=1744186395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5bKkMRbKxlSUJHVqMm4hUmrEWQcNn5FC/pLkQqhEAk=;
        b=HxiTBykiBzrk6loFUQl7dWHZjpGpZYP2CXbwkEWxQ9Ya1kHMA5b+YzyRQyxi6TaaV3
         erkJU0A/De0VLuxbc0+FTrN/Qk6V35Huw+8jOr66LilpsMKYsrr14Oheu3h/hhlVwV+z
         WljWtvbxWOp5GCP9JJNs4ThDfokuVHQ1GqaWcc2De1F3f8Sa0/8MgpkGvTgOCIJcLrzU
         3SuWK6ShLnCNbB7brzXrqzoa3W9nwo/5n2mRlWGMaJnbUNg00emedUCZOkgLKqnTIhjs
         T4d+Jzal3h5dWlgd3hRwXEJdZZ7B48wIW54FdpNUEI5FMPInF5z9TtQobKDQYdRqbbx3
         IUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581595; x=1744186395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5bKkMRbKxlSUJHVqMm4hUmrEWQcNn5FC/pLkQqhEAk=;
        b=w3B0sEFjxgnaqdGxqjalsw/pXBQGa8bv7O3OpF9n7uaZBOjasV8qCaP0KaEQdjpVml
         w8qkWFv354pBzXJDundXLh2/K/10Ntn3kWVHKhkeNni23ZM40TG+Ll5WIhcQh+k5xWT6
         qQ+tkjvqszZTXkeLhrEcpvY6yyDoNO6a60wiHrFk+8eoyGusGjujspHhd+JCtk/pRb2O
         QnTOuJ1RpAqVWnQbckmWV6GyWF4EID/G5DN3SpxLEo44zuEA8HJjI4o0+gZqnE/2irC9
         ou0Mxmiwv0fiS/Ge4oJllSld220Nx4sRcZ+65MIRxvwMfBegqm649bMPdvhV4wTrzm32
         QQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCU3p5g8CVsyo0hf0LDFpdvtf18mv+b1f3Kf6obrMD/VC6DuHbp0oi2hXJGjyRCHeqNGVivmwFY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsKJDJemK+EsyB86INAL07VmncExteygyGTEfypF8kCG8NF8IL
	C2TGFaQK5o8YSpfuh1+fNAvopFg/8PxIueqrMUa6BtuXL6cNMV/bZ1ynEh4YwwjZbHNSgkfHd8h
	0LlahgcL2g7GYCWpffyeX8m6HoxOTw3AKJ3ijRQ==
X-Gm-Gg: ASbGnctUrJIV9ki8Oqc6jtd/qjv72ancdI35l1e+PgjMseJdaLd9hFbpQC4arcdk3Ax
	YvLKroqtKZkq0OqDdPHqjyHGArSjWFTZAc8Zfojc8235EC0X1G8NKsccwAEI2ZNHKjZhfcx3FhN
	XsCygeTW9pfq/nsEcBWQIM9opCTJ/tVRCVxGMqdmOFQszD1zqJV18B01IQRg==
X-Google-Smtp-Source: AGHT+IFkSOGGYa3V9WycrY+gu8XDZN3eeiEk30gJ0tR1xS7OpisGKyrqxHEtle04WwZppsgW2yf3BQ5HfqnjWB9F/Gs=
X-Received: by 2002:a05:651c:904:b0:30b:ee81:9622 with SMTP id
 38308e7fff4ca-30de035019cmr53207541fa.31.1743581594610; Wed, 02 Apr 2025
 01:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250328143646.27678-1-johan+linaro@kernel.org>
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Apr 2025 10:13:03 +0200
X-Gm-Features: AQ5f1JoGfVJ9ts98vDCtSYScI8e3HIFmZAN4o5AGXV0GNmnQTKivDH_VGXOT9Xk
Message-ID: <CAMRc=McRPmWu4q9EqYC_3wDCKoniu7Rf308SsKrbCk5rbopFwA@mail.gmail.com>
Subject: Re: [PATCH 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_011317_354005_D963505A 
X-CRM114-Status: GOOD (  18.09  )
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

On Fri, Mar 28, 2025 at 3:41=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
>
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
>
> Let's rename also the Kconfig symbols before this gets any worse.
>
> The arm64, ath11k and ath12k changes could go through the corresponding
> subsystem trees once they have the new symbols (e.g. in the next cycle)
> or they could all go in via the PCI tree with an ack from their
> maintainers.
>
> There are some new pwrctrl drivers and an arm64 defconfig change on the
> lists so we may need to keep deprecated symbols for a release or two.
>
> Johan
>
>
> Johan Hovold (4):
>   PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
>   arm64: Kconfig: switch to HAVE_PWRCTRL
>   wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
>   wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
>
>  arch/arm64/Kconfig.platforms            |  2 +-
>  drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/pci/pwrctrl/Kconfig             | 27 +++++++++++++++++++------
>  drivers/pci/pwrctrl/Makefile            |  8 ++++----
>  5 files changed, 28 insertions(+), 13 deletions(-)
>
> --
> 2.48.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

