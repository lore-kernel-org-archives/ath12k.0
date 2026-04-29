Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C49FF8867
	for <ath12k@archiver.kernel.org>; Wed, 29 Apr 2026 03:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CC2b1JwJDu3FmPqmM1uLaNLJ/2DJhLPQJLm2qC9M1vU=; b=m237Y8Vmi7MNd/ctZm6iB+0Yzt
	ycyyvSFrnqeVlASwZH4fZITGMgtfhqIyK18hMe3Rw1XGixffz/lWbgEmjDU5dS4kfljHxfutXnM4G
	o1ti2JGgoLBo9NZxpBSEhMqgwdd1+LkCR40aOvScnKkVFvVVS8MgzTvk+KHjDyWBVtr+39A1sTU1v
	nVJhqC1MxUagJNahpiOmFq18I2TuhkSKlxg+MJuaxo+16xN8XtGaJHV+OmcYr4zCbL0w3nDnvnSH2
	XYgIrlNrZ9TgbNNzi1j+INFITJGfYlHynVnnImTmRIc6JfMACkkJd5qFPGXV7bwYIoqvasNI5hA+6
	z8OkooTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHveG-00000002r4e-3tvJ;
	Wed, 29 Apr 2026 03:31:40 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHveE-00000002r4H-0KVv
	for ath12k@lists.infradead.org;
	Wed, 29 Apr 2026 03:31:39 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7986e538decso124657397b3.1
        for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 20:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777433496; cv=none;
        d=google.com; s=arc-20240605;
        b=juBB9qXtY1UuUxTNFKWGLqrOdGSEjIoHEQwVzlrFOlVm3a1OEOvtoFQV19IfVWdjOD
         KVhY1/m9nCMHCVLHrnnLATvi7kwyuZJx9jrs8jGKyqotM4r2+FEWr/BP50A0exwJYhsm
         49wh+LrYi6dox1L/3Jb8qp7r0hVhyEF117rdxZswnWjrH9kjsba9ncLIrhAmmm3LP55/
         RMBF238WmnUXS7vX2WwyPFL7ogBduvbooQs2KM/ClEnmYg3gqPrqEKv+b2OqRXoNa3pR
         920QLU5Yzw79Vyvesbow6664NQXC8ADY16Af3Kp0qXotxbvX/WDLta+ax0Mqntd6Is2N
         zX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CC2b1JwJDu3FmPqmM1uLaNLJ/2DJhLPQJLm2qC9M1vU=;
        fh=TlUphMiuRQz7y3mzHtd+VfPSgUxyW70hcf+7Supk4wg=;
        b=EirNKfb3YNhRe8LHk086ZnF6tOlgm7p4aoTebqGiMCqvI9TcpJC1kd6xc9TOuGBqnT
         DlcqIYg1wT23DHz6GGJJvrBnTAZ+MrDhJg0Oa2yYREDSLQkZwlBknWXbd709+l5uRKHh
         /3aDeQqF9FmWvHIulRjwbRJNphBDXlQGjt2zZY/+vu5F2kF8Fy1L2/ndl9mGpOSbEIbq
         65lQsf4PrQHwYAv/6AzJhZLMEp4Tt7d2lHQvdUFMKVvtZg4X677Zcrr1zH710q0FVeNm
         27IwaBVtTVVDnBrcIqMPxcZtknKw3NA37DeCLbfRRYG7yL9pw/ad8ikEXhK8GD/XzFFT
         OvLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777433496; x=1778038296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC2b1JwJDu3FmPqmM1uLaNLJ/2DJhLPQJLm2qC9M1vU=;
        b=CmjXNMN9APOJjFHv4Cx/OcM8a3nOUgIQ98ZXgCeKAzLswLeCsxTp4cgwEIKI9seYLj
         4cO8pXzqS9Ua0hp55P3NfjnuJWDLcuQL3/ZRRumsfzBFZTgS1Dosz6N9fjuhqnt3u+mU
         ypEbF8XornsqXnRsuGhSinkAQyu8ulUif3yu8XjKYpzPeWXRu5ZZQ2ZSnLyLoQtQwalp
         qnbhfKbtBdBUPgSasKuvzxaSXWFMc2QGXT5Il093jFNmhxveLe/TJ7YNfef8iouHk104
         ZFZI4m0S/TsuDe3ulTTlaMiCDjLdaE0e1TqPRv5LVWUMaUPrGasg4Ty8ADGgup9kVJDv
         4IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777433496; x=1778038296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CC2b1JwJDu3FmPqmM1uLaNLJ/2DJhLPQJLm2qC9M1vU=;
        b=j7AVfQpsy+BOwxLmKQHnKhbXuruUp+Zh7UhZINbycAoi6e/IZuCOOIHpJ3fzS2fN+V
         wYWG3YQ3oXFE8FkvOgYqujtYIqxKCGgfL8WCSJ7BzoZz10pxA+MAQp7O3iVbCb2AfihH
         ThYPIBn86UaLPcgS+jglIgiTa67Ehg1lFwsao5QQ6sb8Ot5QAnE68IUyOYb4aDB76m65
         ojeFpdJ0lPVVBHNZtchy3C85rkofnBzJUgWWxIw8wASwf/jCKCCoubOiRnqfetZ8fDhj
         4Wj5Ok8f7GNiJqPrf+dVueEQ36iwAurhLdFuz91Cc54XK4CJUxr1qT2ETlEqe7x4bRrf
         TcYg==
X-Gm-Message-State: AOJu0Ywd3SMJd2U0xedUuHYw5yfE/mu4mejvNHFnYbIZfgPAIfKSp621
	My5lE2rW0ywf8EWIo9+Um+WvU6i6IZTEiakOCmMc6MzSQiwiB7EPE8NEalh45UW0feNRKV/V7jb
	77uTpzq4wfd67ugY8r+ystTeXvMS7f8atpfZC
X-Gm-Gg: AeBDiesosv9QrBfq7G9aGYXktTsd6tE4bJzvC+84mgbiK6T40uaO2xLta+PYUHWubcB
	fe2F0lmeESX2FNOURPz5kBxh1882UYlPjgl1LYLhF0BcMgg8YdF4HC85EAaX7HDa5/atI5Bqkei
	vpPULgHQrHSl/DHfIvWbbqyT0G1q54qK3oZQEL2c2KYp5PLy3LSCyUm19m8WYe708fnJH/PHhWT
	CUyWYo/p5E5nxyZg908WS4/A/lTSZQNsoe9KHZRsev9LJfjyXovOE2GXQmXtz6PMPiXh54RmHa7
	gZpJUhOs1GVkKUF2Xw==
X-Received: by 2002:a05:690c:e3ef:b0:79a:b46c:e60a with SMTP id
 00721157ae682-7bcf58b6cc4mr59550197b3.44.1777433495720; Tue, 28 Apr 2026
 20:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0V13REH4kwFq+w_FJBf98NDXbajyZzReWjFu0EVzt0vn-Sxg@mail.gmail.com>
 <e7d86d05-3b10-47bf-ad9a-dae82cff903b@oss.qualcomm.com>
In-Reply-To: <e7d86d05-3b10-47bf-ad9a-dae82cff903b@oss.qualcomm.com>
From: Doug Brewer <brewer.doug@gmail.com>
Date: Wed, 29 Apr 2026 11:31:23 +0800
X-Gm-Features: AVHnY4JhCxDw1j-uBBhaJKCj_4xo0x_jb7oVb1Yk07L4_niFT2Aqyc2q73BhxGc
Message-ID: <CAG0V13QJ1B9ULVEBLvY3mBKB+UnsgwR=YPTovKn01pDsWgWGyg@mail.gmail.com>
Subject: Re: QCN9274 fails to start firmware (-110) on Linux 6.18/7.0
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_203138_150577_C59826EC 
X-CRM114-Status: GOOD (  14.46  )
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

On Wed, Apr 22, 2026 at 10:54=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 4/21/2026 8:14 PM, Doug Brewer wrote:
> > Hello,
> >
> > I'm testing Linux kernel 6.18 and 7.0, and the ath12k driver shows the
> > following errors:
> >
> > ath12k_wifi7_pci 0001:11:00.0: BAR 0 [mem 0xf2200000-0xf23fffff 64bit]:=
 assigned
> > ath12k_wifi7_pci 0001:11:00.0: enabling device (0000 -> 0002)
> > ath12k_wifi7_pci 0001:11:00.0: Wi-Fi 7 Hardware name: qcn9274 hw2.0
> > ath12k_wifi7_pci 0001:11:00.0: MSI vectors: 16
> > ath12k_wifi7_pci 0001:11:00.0: memory type 10 not supported
> > ath12k_wifi7_pci 0001:11:00.0: chip_id 0x0 chip_family 0xb board_id 0xf=
f soc_id
> > 0x401a2200
> > ath12k_wifi7_pci 0001:11:00.0: fw_version 0x160484db fw_build_timestamp=
 2025-12-
> > 09 19:48 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.6-01243-QCAHK=
SWPL_SILICO
> > NZ-1
> > ath12k_wifi7_pci 0001:11:00.0: ignore reset dev flags 0x12
> > ath12k_wifi7_pci 0001:11:00.0: qmi failed set mode request, mode: 0, er=
r =3D -110
> > ath12k_wifi7_pci 0001:11:00.0: qmi failed to send wlan fw mode:-110
> > ath12k_wifi7_pci 0001:11:00.0: failed to send firmware start: -110
> > ath12k_wifi7_pci 0001:11:00.0: failed to start firmware: -110
> >
> > What could be the cause of this issue, and is there any possible
> > solution? Thank you.
> >
> > Regards,
> > Doug
>
> Please create a bug report using the guidance at:
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugrep=
ort.html

Done: https://bugzilla.kernel.org/show_bug.cgi?id=3D221431

> Then I can assign it to the engineering team.

Thank you, Jeff.
>
> /jeff

