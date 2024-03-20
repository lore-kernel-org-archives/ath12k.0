Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1E4C6FD1F
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZGaOMPAFwV3vOMUfAiVh3qlzqrNrilrn5QufIsTwic=; b=DGkcEjQv7X911S3fcO4gGjQSCJ
	KkeoQIjEylgijrVWpIyvyifQaAaDue4fUpomlvYr/SWUvJgUehydSL9Q71DGxfw7nfxommz0Lk5bA
	U3KcTea74EijfHTIrTuVjiplSnwnRDYScxlrsB1PK1x9gN/Z9XVXgT7nOKYK/TAjDGeDM1HRC1luw
	/L+Cd1oau4Ho9lDHwP8FCUgzt7iSwRyDzgVNbfcSrNsMRYO0V9r0OeOL34naVDh7GPBeg0Qx/t7Yj
	7JDgBwIJoDXqwAcjZ8NjC82H9TFh8p80O5VoYJiSahwti0yFpqOGDQVFKaXsxb5x9waW4cB5U4Aju
	3hvoXRUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzyz-00000000X4Q-0zuj
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 17:44:09 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzyv-00000000X3s-3z8u
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 17:44:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5684ea117a3so94463a12.0
        for <ath12k@lists.infradead.org>; Wed, 20 Mar 2024 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710956643; x=1711561443; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZGaOMPAFwV3vOMUfAiVh3qlzqrNrilrn5QufIsTwic=;
        b=HGjSGWGAtx7b5mz7TcUbmns3nmipvDC6LcE4iqnn8AFmCLsfu8eNrRVsMnqbR5+XBR
         p5ok4NxoAUB4jrgaPErHNuRP2YM5Ar55uSvLZ+r4wB0+O7f1B+dcWwAM80gamqF9cIqm
         SMTnA18eTEWe5M3Mr/U9syqM/I8H59288VTSLBLHjrI2XLvrhHXiX4+Z4KaxofgS8t4z
         rG0qhB3EtA4YrygSJgkw9KBDxNd8zVIAlVkHKCFOgY7fbXeb3STFDej2fez0Nnz98Cot
         4hhJdWALSDll93zU+w/gC+c1Fs/xE3o5N7qR06xjS93tk6ATsSpKPW2yxKDUMghfgNfX
         H1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710956643; x=1711561443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZGaOMPAFwV3vOMUfAiVh3qlzqrNrilrn5QufIsTwic=;
        b=VmIrigqpicTxoo+Xq6Hb1BOOLn8DshFUAKLaaxOVnSa9DmZg2eDax3xX6F26CE+EfT
         MYc6gzUQLfGh3p+C7Ku7waqzQkFC6YeKk2rNEUhQtkAy7g3sLAud/72RmY51aGe1/RfS
         8DweiZa52W97N4T9EiDQDUZJbYrY5+XP7kTL0IawR3vDwEx4B/IPmvd73GDGCwQmJoxG
         Njt0dAHk6Us2lbdFFOAeeqzcox46zfduzrz7WEhE1jmYrFG2DJ0S5L48xZR+kUa0A4sd
         fuRcLITPASM7q4NNSzn3FGLPUWBzorBLAw4FHeH4LMWW+EYXAKsng9SsUFrVV1iTyv0f
         5LhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/MRKJrD0NxBUDy4PnOrghj3Iobz0Z/hrgdUqcLPmflQ2TTjHtxDNV5NayZ3Hv/C6HZOrWvdEyMrYz3P/dH/CXlU9Xee9wS4m8wA==
X-Gm-Message-State: AOJu0YyLJMVW9XRrZdsCz7RX+Vc3B09zaWTZHQfKCnqiPsmzBtoGLJBb
	i4XNpoqAYrPP7Gq4Kcz2YBpjHdYh2kDipnb9Hn5npKDSkCDT6cnvFWvvA30GWqr149cyL2BcV6u
	XzCbyJs++2KTSK16ELWD8SCluirLMHb4PDIAvfA==
X-Google-Smtp-Source: AGHT+IFxn6pM2ywqId7rIoiq5xVOCL+uGvBdduOpG7BxjUxA1IPh+JNUiMxR+WHugfZyFyzW2670iqFJC8kM1gONkJk=
X-Received: by 2002:a05:6402:1ccf:b0:566:1952:694c with SMTP id
 ds15-20020a0564021ccf00b005661952694cmr14108119edb.20.1710956643095; Wed, 20
 Mar 2024 10:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
 <87sf0kan7d.fsf@kernel.org> <CAHohoUh9nt06n_eqFwVf3k6vbqJb5akxvgS4i8sNHpadDzUOEA@mail.gmail.com>
 <CAHohoUjMaNfhhDoJtNh=8zpzKvAChw89WocBFGxhP3Pi_i21Hg@mail.gmail.com>
In-Reply-To: <CAHohoUjMaNfhhDoJtNh=8zpzKvAChw89WocBFGxhP3Pi_i21Hg@mail.gmail.com>
From: "Owen Mesh." <owen.mesh@gmail.com>
Date: Wed, 20 Mar 2024 20:43:51 +0300
Message-ID: <CAHohoUgC34=x9Uq5E8a7nnqkGWRjKpir8=ZFC_XCtEF+Cgzcfw@mail.gmail.com>
Subject: Re: ath12k: driver does not show tx bitrate
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_104406_017194_82E90DF5 
X-CRM114-Status: GOOD (  15.69  )
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

Dear Sirs,
FYI
Just tried this patch
https://patchwork.kernel.org/project/linux-wireless/patch/20240219095802.11=
47-1-quic_lingbok@quicinc.com/
iw now shows "tx bitrate: (unknown) 80MHz":
iw dev wlp6s0 link
Connected to d4:da:21:a8:06:7e (on wlp6s0)
    SSID: NETGEAR65
    freq: 5805.0
    RX: 398485 bytes (1661 packets)
    TX: 20994 bytes (192 packets)
    signal: -25 dBm
    rx bitrate: 6.0 MBit/s
    tx bitrate: (unknown) 80MHz
    bss flags: short-slot-time
    dtim period: 1
    beacon int: 100

I believe this is due to a missing 11BE part in the patch.
Something like this:
+    } else if (ts->pkt_type =3D=3D HAL_TX_RATE_STATS_PKT_TYPE_11BE) {
I have a router with a QCN9274 chip and, I believe, I have an 802.11be
connection with it.

=D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 20:08, Owe=
n Mesh. <owen.mesh@gmail.com>:
>
> Dear Sirs,
> I was wondering if it would be possible to add thermal sensor support
> for the arh12k as it's in the ath11k.
>
> Thank you and best regards
>
> =D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:36, O=
wen Mesh. <owen.mesh@gmail.com>:
> >
> > Thanks, great
> > I also noticed that a fix for missing "signal strength" is planned!
> >
> > Regards
> >
> > =D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:21,=
 Kalle Valo <kvalo@kernel.org>:
> > >
> > > "Owen Mesh." <owen.mesh@gmail.com> writes:
> > >
> > > > I found a small bug in ath12k driver with wcn7850 adapter.
> > > > ath12k driver does not show tx bitrate.
> > >
> > > We are working on adding it:
> > >
> > > https://patchwork.kernel.org/project/linux-wireless/patch/20240219095=
802.1147-1-quic_lingbok@quicinc.com/
> > >
> > > --
> > > https://patchwork.kernel.org/project/linux-wireless/list/
> > >
> > > https://wireless.wiki.kernel.org/en/developers/documentation/submitti=
ngpatches

