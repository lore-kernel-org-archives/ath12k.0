Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F92C54E58
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 06:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edG4WW6prbTS5bCMDeXInm5ViRsgpMRWepuAO8MIFjI=; b=kMD45NekXBoK5kz1xZt5zV52Pe
	tMsfudyPfFvjKX+iHZaE1DylxoRmlIdwqPE6dvh1WRPHNLOqbtMIslrHsYXYhh2q21vJkq+Blm23w
	7MeeZc5w0ge+6HRSpSPfrRmYDnW4eYxYfbYxrFd7nV1QTrEcMrBOcs3n5aucPouZUYHtMmOcXSGIh
	xzLUtjqT1hRZRvRC5DerTKiB42eqYbdsn2NMvDlNwY+FcNneFftRQWzOEAJhmFOgKU1LoZZY8n2by
	4RgujCEfaM21XSzn0qNu6gGMPp7xuke5oJ7c3ho7mI1iWpTFus7b/PTPF3Tpb9tzzebk1To+n/GeM
	dD4IHN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnBzm-000000023Jh-3UYx
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 06:33:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnBzk-000000023J6-0DpZ
	for ath12k@lists.infradead.org;
	Thu, 21 Mar 2024 06:33:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56b93b45779so651523a12.1
        for <ath12k@lists.infradead.org>; Wed, 20 Mar 2024 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711002820; x=1711607620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edG4WW6prbTS5bCMDeXInm5ViRsgpMRWepuAO8MIFjI=;
        b=cc7EjGrE9TEnTPBloykjGwlGKTFpjaRPaguS7btwxwTsqBT+10RLpN3Ib0E5yqXokl
         0UAkZN+PwiZ4tMugXzUgEiJw1M1FnHih08C8lKQOKzu97fZaNfYjHLCoKB/FGtHmmoCs
         odrww5K9GgIEx1YtIQOPIuNCGmE8UrHocDJd3G9ZP/72zF4ohQeQiNeUI8IQEkjNB4RW
         nN/StoeONbc+XbdnNoI0KYxcCIR2/sa1kpqpVpuFVDgij6gRsxX2itdQzeTk/r5/F5cW
         l0yrzZtRCjeurkvi3+07fhzVvFwBcPNB9v8y9iJgMdSWRU+emTsNE+x6eq4NCQXfs76o
         rF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711002820; x=1711607620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edG4WW6prbTS5bCMDeXInm5ViRsgpMRWepuAO8MIFjI=;
        b=dI6iDm/A5MYa0JsSD6Xdie80t2JMZXcGLZqR+Vz6r8wjDEhUekTz6fpivOKPrGxYZc
         FCgcpoXBjv/2tvWLyugD6kjLfP4krLWSTOyDmt7Zhd2KGU8yA7s86jfausfO9jP2Gn4Y
         oGsU1KVg7y+sugT/HUySTiFQvfBF1oQdH9L7CgsrppD0XI/wcuQ3XvboxbjtnsVtEMxf
         ZSYjO6JTj1fZ/H+Am7aoWNtijK4PJYS0AB8sYG0BixlUvPsSQCXZP9Y53gJ5UfXWiHUl
         o3fieXiVMCtDTGVyIvbTGM9xC2IEI6+1kjMlNQ0rshKNnDitjOWv5XoSREngYNpRspCW
         sEDw==
X-Forwarded-Encrypted: i=1; AJvYcCUehQvf/5oDRTHmIeFHoAurLTUSXBMMCE6Mf8HmYhOTrIhPuHKzv6I6whDrFOwpb7RkUN8Dqqy5eZLjl+czpuvRFGYN9rPQghXL9A==
X-Gm-Message-State: AOJu0YzTnYVdTtr61gH0LqDkLEejz4u09O+67PRgZnCLZlCJrGDUW/Hh
	xl4EDMTaN4LYQvKqdc23xQa0yx7RbASs/3w2nzv1x2CB8rgj8N8l/Thb+8yeWF4ab2BEP/O0wy9
	ilXESyoicDaK1D9pCOJiZyS8yW78=
X-Google-Smtp-Source: AGHT+IHsvZtBZTo+BtORsQ3VP5w856TgwRgyotmcloZoNmBVVyFOtNGCHKBnoIzzO8ugVJ0GQPP/mQ5W1K5Z8WuphFI=
X-Received: by 2002:a05:6402:28c8:b0:568:32f7:6c53 with SMTP id
 ef8-20020a05640228c800b0056832f76c53mr16445568edb.3.1711002819461; Wed, 20
 Mar 2024 23:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
 <87sf0kan7d.fsf@kernel.org> <CAHohoUh9nt06n_eqFwVf3k6vbqJb5akxvgS4i8sNHpadDzUOEA@mail.gmail.com>
 <CAHohoUjMaNfhhDoJtNh=8zpzKvAChw89WocBFGxhP3Pi_i21Hg@mail.gmail.com>
 <CAHohoUgC34=x9Uq5E8a7nnqkGWRjKpir8=ZFC_XCtEF+Cgzcfw@mail.gmail.com> <158ebe88-2394-4b1c-8d32-9d8509c11a90@quicinc.com>
In-Reply-To: <158ebe88-2394-4b1c-8d32-9d8509c11a90@quicinc.com>
From: "Owen Mesh." <owen.mesh@gmail.com>
Date: Thu, 21 Mar 2024 09:33:27 +0300
Message-ID: <CAHohoUjSQdLYt+tSBzNO6LzGgEZcz5E-3WB=xYngE5URveX0XA@mail.gmail.com>
Subject: Re: ath12k: driver does not show tx bitrate
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org, 
	Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_233344_119106_8DA0812C 
X-CRM114-Status: GOOD (  21.69  )
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

Thanks!

I applied this patch.
It looks great for my configuration/platform!

iw now shows 802.11be tx and rx bitrates:

iw dev wlp6s0 link
Connected to d4:da:21:a8:06:7e (on wlp6s0)
    SSID: NETGEAR65
    freq: 5805.0
    RX: 36791 bytes (185 packets)
    TX: 9111 bytes (73 packets)
    signal: -27 dBm
    rx bitrate: 1801.4 MBit/s 80MHz EHT-MCS 11 EHT-NSS 3 EHT-GI 0
    tx bitrate: 1200.9 MBit/s 80MHz EHT-MCS 11 EHT-NSS 2 EHT-GI 0

    bss flags: short-slot-time
    dtim period: 1
    beacon int: 100

Best regards

On Thu, Mar 21, 2024 at 5:32=E2=80=AFAM Lingbo Kong <quic_lingbok@quicinc.c=
om> wrote:
>
>
> The patch of tx bitrate of 11be, we're working on add it:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20240104032202.=
19472-1-quic_lingbok@quicinc.com/
>
> Best regards
> Lingbo Kong
>
> On 2024/3/21 1:43, Owen Mesh. wrote:
> > Dear Sirs,
> > FYI
> > Just tried this patch
> > https://patchwork.kernel.org/project/linux-wireless/patch/2024021909580=
2.1147-1-quic_lingbok@quicinc.com/
> > iw now shows "tx bitrate: (unknown) 80MHz":
> > iw dev wlp6s0 link
> > Connected to d4:da:21:a8:06:7e (on wlp6s0)
> >      SSID: NETGEAR65
> >      freq: 5805.0
> >      RX: 398485 bytes (1661 packets)
> >      TX: 20994 bytes (192 packets)
> >      signal: -25 dBm
> >      rx bitrate: 6.0 MBit/s
> >      tx bitrate: (unknown) 80MHz
> >      bss flags: short-slot-time
> >      dtim period: 1
> >      beacon int: 100
> >
> > I believe this is due to a missing 11BE part in the patch.
> > Something like this:
> > +    } else if (ts->pkt_type =3D=3D HAL_TX_RATE_STATS_PKT_TYPE_11BE) {
> > I have a router with a QCN9274 chip and, I believe, I have an 802.11be
> > connection with it.
> >
> > =D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 20:08,=
 Owen Mesh. <owen.mesh@gmail.com>:
> >>
> >> Dear Sirs,
> >> I was wondering if it would be possible to add thermal sensor support
> >> for the arh12k as it's in the ath11k.
> >>
> >> Thank you and best regards
> >>
> >> =D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:36=
, Owen Mesh. <owen.mesh@gmail.com>:
> >>>
> >>> Thanks, great
> >>> I also noticed that a fix for missing "signal strength" is planned!
> >>>
> >>> Regards
> >>>
> >>> =D1=81=D1=80, 20 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:2=
1, Kalle Valo <kvalo@kernel.org>:
> >>>>
> >>>> "Owen Mesh." <owen.mesh@gmail.com> writes:
> >>>>
> >>>>> I found a small bug in ath12k driver with wcn7850 adapter.
> >>>>> ath12k driver does not show tx bitrate.
> >>>>
> >>>> We are working on adding it:
> >>>>
> >>>> https://patchwork.kernel.org/project/linux-wireless/patch/2024021909=
5802.1147-1-quic_lingbok@quicinc.com/
> >>>>
> >>>> --
> >>>> https://patchwork.kernel.org/project/linux-wireless/list/
> >>>>
> >>>> https://wireless.wiki.kernel.org/en/developers/documentation/submitt=
ingpatches
> >

