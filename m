Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CFAECE579
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiNp6Bs5OiARYdGamLrScaqZ2kHMNObdVSq851tJm40=; b=N+jO9a3LwMft3O2PK6y+9Y/vE1
	CD8sHjkdVrA6YsllSXOfTrWJuJQkv/t2GcWEar0Owk/lmE+KSnAAF9kXRs1rXkA9qic9FxyxleNO3
	7qA3Y+wji2zb0RoBsrVXxTwHscaTJ+9/UL9JiZ9cE1ADc/nBuE++CusrHBqiwb5FdLflacoABD0Ws
	Qr3bvEdnwRISYuuFqATjlZFB64Z5oc2TirSo/wrmLKBCc/AV9jfcHn92fqCy6AvuFh6xjMSDOirU3
	qAkTgbpsUmjqK1CV/gxwO+Q6YJN6uIeXYOK6QpQsDNZUXB9LLmGFzsnLKSvsLGQWlumJEEbvkR5ps
	zJns1CRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbYo-00000001Uf0-0xjw
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 10:23:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbYl-00000001UeW-1dZM
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 10:23:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso10420715e9.2
        for <ath12k@lists.infradead.org>; Mon, 09 Sep 2024 03:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725877429; x=1726482229; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiNp6Bs5OiARYdGamLrScaqZ2kHMNObdVSq851tJm40=;
        b=SQdnvokNHRJnu2k3ETX9cvA/VZPZnaGNosXCSIHs22qE3NCtn3eNXIL/nciy/i6d4t
         AhXqObTGhpPVMr4/HQ9TookPg+J6ZkSgQofUGO1IvbY7Ctdgy6OEBQdDDFeODXVhxZ1N
         DXdcsEF4XwRPqvpDJl6BbwarBnGt1OMD0Mx/ti/HcqelpXU6xObKvVqX8L7DZHgEmODK
         Ep42mF3lLQk5a0WbDlQDdQ3RbUDmy03h2qZNmCqu82IKSTh+RMU6gFusorODNejj5rsN
         /my6aCKida/pxkWv2qTDAZDNQEo9XgVtjBhcI5n6+ifjrzVuVo/gXZxfgV9O02/JLzeO
         uUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725877429; x=1726482229;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiNp6Bs5OiARYdGamLrScaqZ2kHMNObdVSq851tJm40=;
        b=nStQIUFfWhiRuVrjyA3/IKipzw+5RVfyCeaYRwfabJIarDocNVGiHe6M59kydUvy+O
         d3Dlnh2nOaaNHe395Ou6AETiS9QT2FTY7xPAV+gSJN4RXNg4Il9XtXkuOydJARQ7e85C
         nixMbH/w3M9tq5xYXocne/a0POpCumXmQ3klx7j4IZdAoJ4G8GtV+dqQ/hqqJiSTR9Pi
         or/7K0uZKe9coolBs/NylGFuGI4jDst/8IKZOMuUs5tCdToQr5Xeq1IhKCczisHeUwIS
         nuWKrGEh5wG+0CVkJtxgVzeYCqEOKQZDMfDmhE/dwMJ0QOFScdLUM6qWS//ED0HZGMO5
         +/eA==
X-Forwarded-Encrypted: i=1; AJvYcCVbjbG5Kk/V0744cEusH63dgukl1UoujyF2P7hwRkavl1EjICVdhJbIvVIPyeuIWSAE9K28Jrw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTQdu1GRo8AfXpbT8oroIpZeAMuAmYPR6Z0+ZiakhSiR0/7f96
	Ur3vMmATHuzW3v7sLBtyKR/s2/c3LEm+fmXF0GESolJt3JVVwjva
X-Google-Smtp-Source: AGHT+IFDDHzFypmB0ayJiExvuzqMfUAgm499uUtVMHqaG8+AfQm2YmSU8hxvh56gKCcg1m6keIUmzQ==
X-Received: by 2002:a05:6000:2:b0:374:d254:61b3 with SMTP id ffacd0b85a97d-378922a6603mr5577585f8f.14.1725877429113;
        Mon, 09 Sep 2024 03:23:49 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de3aesm5644202f8f.110.2024.09.09.03.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 03:23:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Sep 2024 12:23:48 +0200
Message-Id: <D41OHKZYZR9E.2JD7SQKZBBYGH@gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Kalle Valo" <kvalo@kernel.org>
Cc: "Santhosh Ramesh" <quic_santrame@quicinc.com>,
 <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 "Sathishkumar Muruganandam" <quic_murugana@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240909073049.3423035-1-quic_santrame@quicinc.com>
 <D41LUTO0MIC3.12475D2J3VNX3@gmail.com> <87mskhgpox.fsf@kernel.org>
In-Reply-To: <87mskhgpox.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_032351_470186_A2350365 
X-CRM114-Status: GOOD (  15.66  )
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

On Mon Sep 9, 2024 at 11:07 AM CEST, Kalle Valo wrote:
> "Nicolas Escande" <nico.escande@gmail.com> writes:
>
> > On Mon Sep 9, 2024 at 9:30 AM CEST, Santhosh Ramesh wrote:
> >
> > [...]
> >
> >> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wirel=
ess/ath/ath12k/mac.c
> >> index 137394c36460..6d7a005d83b4 100644
> >> --- a/drivers/net/wireless/ath/ath12k/mac.c
> >> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> >> @@ -7217,9 +7217,9 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif =
*arvif,
> >>  							chandef->chan->band,
> >>  							arvif->vif->type);
> >>  	arg.min_power =3D 0;
> >> -	arg.max_power =3D chandef->chan->max_power * 2;
> >> -	arg.max_reg_power =3D chandef->chan->max_reg_power * 2;
> >> -	arg.max_antenna_gain =3D chandef->chan->max_antenna_gain * 2;
> >> +	arg.max_power =3D chandef->chan->max_power;
> >> +	arg.max_reg_power =3D chandef->chan->max_reg_power;
> >> +	arg.max_antenna_gain =3D chandef->chan->max_antenna_gain;
> >> =20
> >
> > For what it's worth, I already got a similar patch from QCA a few month=
 ago, and
> > it fixed some tx power problems when scanning so I know there is truth =
in this.
>
> What hardware and what firmware did you use? The firmware branches can
> behave differently so whenever testing something it's good to include
> that info.

Well what I tested was with the additionnal patch provided. So depending on
Santhosh response, I'll either give the proprer tested by tag, or if the pa=
tch
isn't needed. I'll need to find some time to test it :)

