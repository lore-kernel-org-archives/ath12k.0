Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF0FC3600C
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=; b=o1QpTJ5jgHa85OCTSNr16SCzF8
	S0d8TTCHXlC7iyN/JjE9dgbqDff8b3bPS8ko9ndf6g67Sfm40DcDQB34LAiADkX1iYR+0fGp7a7Gc
	3/Ns7xJ2700iI0RmhqJC0Btdm+YN7pR91hIVlZMNeqQkNJlrFSfkO6vT6rYqw/cNeLjtLWQckbrlC
	z1F08wiyevNWivInBEHIEpT2qjW079efCdqPBYMsbRKTThfrj0A+KIFmJIXPQufLDTcWe3YI4tqe0
	X+KrsE+zdfUZvhnw0JcvdqDMXPiwWKX+kvNpR3FUZpmBtfovvy9jRD3RKi7MFUBRXX1FQR2DcvJ0O
	enWevZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ElF-000000083wp-0EBT
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 07:13:13 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EjP-000000083f7-38vZ
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 07:11:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3061513d353so5758681fa.2
        for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743664278; x=1744269078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
        b=F8Nn1t0kI4zdrHM4jYrcKA1qHWs88R99fkqW6VWB9ZwOgktg3D5fn+wHPNnmsCpT7C
         /Mh1Fmkq2hQTZ0IS1+cXbGuPrDVsfVBqdGcA3UxqVnxjPOg3fl/DB8os0NGdKwcdDu5Z
         Nwdj3NalLFHPaD9B31D7lSJO1moAWCeeDq+lec6ccuenqRhedRYn2JfniUvAGNSeiKfJ
         kQtmUIwITnxYi+0dun/IDkQPqmPdJfIUaNolMQlaBKlxOSSCCjyWMTJrSQSpWTZFRsk0
         yM8yjfczof+ui8hWQ4LG5Prf18NG2Eel3vPUpBcBGWBfLLvZklqerSU8whG4JD6+SJZm
         063g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664278; x=1744269078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
        b=fEbHOlVVGHTEp9bzdKH6xIvzie1fApZB0GMOXEjdlRsC3lKgVhPJ6/XgUbYSrscTb/
         bVdagsQjA9TzaMb26MHjf2FAeF5MKQdSdq3OWS+/JvTqeblmYApbUsLoXqperGeLfBNB
         LO97EPryJ5jca9ZOpLHWrQvHGX34Y1XoMrJNM+FfVsL6zcr+VBSEx9zOamt/Sjgrz+EC
         7LFaeHBhiHp5PEM6tIviLkr1kTcGXQNirgg3FyFE51+zTVuKwDk8TLPMkA4/k1d3oxD2
         pxEVHRxWB5WRgWdTGlutI18PgO4hYlkPxl8JCoqSD/ysR4Wh35uKw9w+QzkemBaVh/ZM
         FjqA==
X-Forwarded-Encrypted: i=1; AJvYcCXRAA09bP8quhyWu/TBr11zllt+y3LSEflFILJL/1ISPIOmRmz6sk217UcCcd7jaD0h5VBfbpE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2O42rcX/mvztM5lrUkaiskubz71/fdqOTAXQ6Mnzcjsq2+3rs
	sJP+GuGJayoOMXqhfGta6abZHkgUyh/KwS+pWwtyziv91NLbHex+KugHc1tbTrAdCDx3SjtxUk9
	Q36iz+smjOolaixFB2uZ7Ies9mNuEnA63CzM3vQ==
X-Gm-Gg: ASbGncsA868bmQmnx5i9l5svR2gy1y7AMzwQ1JbEYFUH9xEELqhwN/MBUCDuI5kIF3H
	nTVXItC0bkr+HPDMQfBiuS1WwsuWPCSkIaURVzqmxr6jCg+vIGvYEDJH6Q1KEpWjhLEGWXnpouI
	2XuqOy4SsWbjN//0IARF8KG7cPAu97RecJvQIkhMU+VolPyin6hSbIuxQ7
X-Google-Smtp-Source: AGHT+IFkpl28huUxLnkOG8+JoZRPAuyoYj8fAmCyXd4tv38/gNFXW7fiJiUp5ulgWcmnVTNmKGEylZ2WlPrLdyIQcMA=
X-Received: by 2002:a05:651c:1475:b0:30c:7a7:e87c with SMTP id
 38308e7fff4ca-30ef91e9c23mr19952681fa.35.1743664277849; Thu, 03 Apr 2025
 00:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250402132634.18065-1-johan+linaro@kernel.org>
In-Reply-To: <20250402132634.18065-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 09:11:07 +0200
X-Gm-Features: AQ5f1JoNoWRTnOEMbH9dyhhofmJuk8_vYCLRQWl_3nQ0kPEBcd2NI2XoNIkV_Zo
Message-ID: <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_001119_795072_9F9758A6 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 2, 2025 at 3:27=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
>
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
>
> Let's rename also the Kconfig symbols before this gets any worse.
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm re-adding the tag here as otherwise b4 will only pick it up for
patch 4/4 on v2 of the series.

Bartosz

