Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF9CC6FD1F
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 17:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYlXtQhS3uUW+uXWomj3PANjtY3Qz54AyiLg0b/GD4I=; b=Omey+ZKCBobo9pf4utE1tlV7qs
	m3UWSbKPXVQPwwLsrFc/NBzzOjBWmGE0FbE6QJbKNqiejKk+X+H5gV7wThf8rRy9aIg4xY7StnPpN
	gkkKzCvQyefSLVTfJmGZu9yCdY0eF3ecOiykl0BVsTGu5XlTUe9P0EFk/qr0B1gsM/SnMEup58HBb
	0AZlEtEG603AtlupqkinUAeJCKbegp+e6Cj4jnRmGyCWphl/wsuq5k+i5xDvKv1b5NmvHJx1QU51Z
	RuUKjQmjLRpdUR5/RkSBGIjW2FDeM1G7IEwRu/ANpuiE85O9l3FCJBZKlsUS0moORmInqACx5Htg8
	2M9rxuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzQe-00000000Qmb-3XQB
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 17:08:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzQb-00000000Qm2-1jdP
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 17:08:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso7096566b.2
        for <ath12k@lists.infradead.org>; Wed, 20 Mar 2024 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710954514; x=1711559314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYlXtQhS3uUW+uXWomj3PANjtY3Qz54AyiLg0b/GD4I=;
        b=as3AxY6bvFdA4Y7uPyf2OcEkwrV8cTsPeC/t6W/+FFt+h3jt0UvbJAauKYa0C7yWG7
         YExdFpAf/buI8kjAYRrTxjxpQHiMXTkIFjnJjlinHN+lZaNWzBaVeY2x/UgqX7RuwUjm
         CWFck/kfEop0BarmviVqCsM5U/S1egAqVVh2F/hiyg2X5HJ/7y2Pb43JSo5PVJTheInM
         Dwq2ogTvXvEv1s4A+qp0hawI0/eB+eI2xVmc6damI3NME2CPmdSjpx7x/wSYUYhuolvL
         jCuTKgQlbKG9CfmgFmNhX6/RYc1h3ixacpro7JZj4+mJN5TvBwlyD2ytDSC7gJqRdFn0
         /ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710954514; x=1711559314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYlXtQhS3uUW+uXWomj3PANjtY3Qz54AyiLg0b/GD4I=;
        b=JZFTWmjqzIoKT4hzCXHownQvFen9SbC61xK0nhcKmTQHt4+oY+9vu35PBcMvAv9qLC
         O3dcveN2qb1xoCOAWMY63WbcreHW9wZa7WcOmT4L08OMzGK2vQDCM/wyFzTjlAp5675T
         dWdFXq/xFXso7a2+zsQeVjPaOHeLpzeV9/sCAB1DXzzQ6XKZzGI6ytEL32+in55HNdKN
         2ho+cUdUbAafaGSI4FCtc4dAyQWNPrubVsh9aJcdYdGb45O2aQYvnh7ZvslzOi9Uqslf
         8vxxCONK6BiRlPlRvRwZURzfIsfyjHzkTvavUrXuJayOyp0dWkv0r8FZVgmP2VGOjzmY
         5i5g==
X-Forwarded-Encrypted: i=1; AJvYcCXtBOKlTuheXxAuYSIo9SJtHT6WRQblJ8YXSUPs96w1GxxHPaqVH/Jy+oiCsIdbOW7TXh5x8+fFhdjHl6IPEdM/XZG350Ac9xwBCQ==
X-Gm-Message-State: AOJu0Ywpz0mtTiD8J9LSzRBzAHACA8+WO6pWXaKOaDDepki8OPJwXCg9
	9+ZqJ1Qa6Mwpec7wZeYdfYevByUkeZBgQR0XmWvYlxMXpKsyIMEbsNgTDVeO4nzfdJfEYiz1vL7
	mmU4mQiuKS22uSQ3qzk4KnsuDJj8=
X-Google-Smtp-Source: AGHT+IFami3nyNXYOBgNlad4+eh1nbBqJtvfb9bZGimNQ0aK5XFtCGPxKVm5m57ykLFwHvLzDbe6vfUMtTWBF+lfw+c=
X-Received: by 2002:a17:907:9411:b0:a46:dfe1:d4f3 with SMTP id
 dk17-20020a170907941100b00a46dfe1d4f3mr4322693ejc.59.1710954514383; Wed, 20
 Mar 2024 10:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
 <87sf0kan7d.fsf@kernel.org> <CAHohoUh9nt06n_eqFwVf3k6vbqJb5akxvgS4i8sNHpadDzUOEA@mail.gmail.com>
In-Reply-To: <CAHohoUh9nt06n_eqFwVf3k6vbqJb5akxvgS4i8sNHpadDzUOEA@mail.gmail.com>
From: "Owen Mesh." <owen.mesh@gmail.com>
Date: Wed, 20 Mar 2024 20:08:22 +0300
Message-ID: <CAHohoUjMaNfhhDoJtNh=8zpzKvAChw89WocBFGxhP3Pi_i21Hg@mail.gmail.com>
Subject: Re: ath12k: driver does not show tx bitrate
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_100837_474051_C84BA17A 
X-CRM114-Status: GOOD (  11.20  )
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
I was wondering if it would be possible to add thermal sensor support
for the arh12k as it's in the ath11k.

Thank you and best regards

=D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:36, Owe=
n Mesh. <owen.mesh@gmail.com>:
>
> Thanks, great
> I also noticed that a fix for missing "signal strength" is planned!
>
> Regards
>
> =D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:21, K=
alle Valo <kvalo@kernel.org>:
> >
> > "Owen Mesh." <owen.mesh@gmail.com> writes:
> >
> > > I found a small bug in ath12k driver with wcn7850 adapter.
> > > ath12k driver does not show tx bitrate.
> >
> > We are working on adding it:
> >
> > https://patchwork.kernel.org/project/linux-wireless/patch/2024021909580=
2.1147-1-quic_lingbok@quicinc.com/
> >
> > --
> > https://patchwork.kernel.org/project/linux-wireless/list/
> >
> > https://wireless.wiki.kernel.org/en/developers/documentation/submitting=
patches

