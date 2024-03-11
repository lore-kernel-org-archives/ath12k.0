Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D935C5475B
	for <ath12k@archiver.kernel.org>; Mon, 11 Mar 2024 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpUQxwBTnZDQfcOX+Oo9aGF8jSCpbH8XaaCaA85BWBA=; b=mnIUZdaqp29AGMKERAYKItNBlo
	+Gx8BdR5D+m6ac9Xc7rJe5QHBgK+hki9CBMki/kHGVB7xbcNTOUYsvaqf+9cWGa2aX3fohDCcdQTD
	x64Y66+GUMp7qUT1ol6xZPVvwJAvnJqPJb2dDwytoy0i1SBpXnP23sm4xwwfRBjuOZ+i5Eb1vRPXo
	EtmUQoMGEGR42JWngj89dzR8kwY2b5N5WDmbF9y1IfIBmiKsDeU7XNwZ9Xgg48vAWd7KG9ipSjZnb
	M/wUVJniB9bPgyoEXOGOMUTzYy5U04SeJEJCsK5ahq3mofUTr1dsgOod/kFbzbCJhzcthGrluw/1v
	u69+lBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjboq-00000000o81-3eHJ
	for ath12k@archiver.kernel.org;
	Mon, 11 Mar 2024 09:19:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbok-00000000o57-1meZ
	for ath12k@lists.infradead.org;
	Mon, 11 Mar 2024 09:19:36 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-513b022a238so344711e87.0
        for <ath12k@lists.infradead.org>; Mon, 11 Mar 2024 02:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148770; x=1710753570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpUQxwBTnZDQfcOX+Oo9aGF8jSCpbH8XaaCaA85BWBA=;
        b=adSgMWyZQAxI0FTawMjQX0fMSyYoohkEktXBAogNvZrImVBHa6/2G+cT9dD9XVsAK5
         O1oG4cfv9b3uEvG+jkNovWBQPrCAu0YtLcmD/8dERIR9Its/IWfA5JMhLQ4ooZd6ZoQd
         idQzR05JUdmqonXQU3rrH7cZZv7FXMMRMbqqc4qbvsUuCy75OOH8zsZ0mBvUWwgbxUrw
         jYpYrEiEzQ+NAvPL3F3wl2ftrwDqSiuCpd6BfFCsPHNTUELQC8lzBWmzuppZtzeE3S/J
         s6iI9D4S/PDGzeOexrZTC0q/YkHAs1mOhFavB3wJxWKdITd7z7RbGlseyptuuA4wU6dm
         Icdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148770; x=1710753570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpUQxwBTnZDQfcOX+Oo9aGF8jSCpbH8XaaCaA85BWBA=;
        b=iZ022bTXOSSOReMPjop2fWaYE/cB0EB8lkH/5E9CHrSsHpygpiE0yxaXVva2kSBrCy
         JNJLh0thCJ1rSttkCfx4QO1U8u1wLUNMi2ZeY1eFPnfK2eghMQvgCrzy0NULxviuEmok
         1yW307S6mRzSwNDCvY4macuZ9WcBwooKCu1QrFvXnQPSI1L0AV9iaNkxW8j6gX5hDhc9
         2vX45f7xrvuJLb8d617whtntAJ0OAM/3E2bsMODMrWd1J6HFSCQGncm465edp1Invu/p
         QQ/2TiPjI6nUf5X8JNvzhp671isZqVxejnmaXeBG8xWUzCjhWHqDZ/lVdlZGQ+TnBqLS
         hd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1A86QCrx3TvRLAYVVIvdAqRqzR0opn2VociBGjvZdeTyyQ1DOCO8GvzQQwgFtkB5ve83QLh6lq8HX2zuBwC1umqjzKhCIUJoWYg==
X-Gm-Message-State: AOJu0YxaDw9nmSS+DWgjMQOswqEl5MyzKGYhPga2oDIiqp1n3yZjKmoj
	nw6r8aMaGoHMIOiP5NcqNfcHBoSNwZUpzZ3BFbTC8fujDpiJ7Vt0GOQazVMlRj//I+60NNdQJhK
	kTdct3jQosyo3HE+gSqRohwGWRbZMpHHtWRBbBUBxk+lVCTWhc6w=
X-Google-Smtp-Source: AGHT+IHTt/de6L0hXwKuI3CZiXJNCh3/lcxpVg+d58aFmcBt+SvPHICjZs0KYt1uDFjCLNR6+EZc/yp42aMo/W4Q60U=
X-Received: by 2002:a05:6512:31c5:b0:513:a91c:69f0 with SMTP id
 j5-20020a05651231c500b00513a91c69f0mr1923085lfe.67.1710148769954; Mon, 11 Mar
 2024 02:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com> <CABymUCN0c9HK3vC3ZFxfXkV9Ezcqwq41J4vGSkpsz09sMDL8rw@mail.gmail.com>
In-Reply-To: <CABymUCN0c9HK3vC3ZFxfXkV9Ezcqwq41J4vGSkpsz09sMDL8rw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 11 Mar 2024 17:19:18 +0800
Message-ID: <CABymUCMsHDViQ=qfyamdkpTutrXoRuhto88iQsRo6TcgDKnWZQ@mail.gmail.com>
Subject: Re: Performance of WCN7850
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kvalo@kernel.org, quic_periyasa@quicinc.com, quic_kangyang@quicinc.com, 
	ath12k@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_021934_511440_517ACE8A 
X-CRM114-Status: GOOD (  18.81  )
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

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2024=E5=B9=B43=E6=9C=881=E6=97=A5=E5=
=91=A8=E4=BA=94 16:15=E5=86=99=E9=81=93=EF=BC=9A
>
> Jeff Johnson <quic_jjohnson@quicinc.com> =E4=BA=8E2024=E5=B9=B42=E6=9C=88=
29=E6=97=A5=E5=91=A8=E5=9B=9B 23:53=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On 2/27/2024 5:54 AM, Jun Nie wrote:
> > > Hi,
> > >
> > > I am trying to maximize the bandwidth of WCN7850. Does anyone know th=
e
> > > performance status of WCN7850 in mainline? It's about 160Mbps in 6GHz
> > > band and ~600Mbps in 5GHz band on sm8650 platform in my test. The
> > > firmware is from below links:
> > > https://github.com/kvalo/ath11k-firmware/raw/master/ath12k-testing/WC=
N7850/hw2.0/board.bin
> > > https://github.com/kvalo/ath11k-firmware/raw/master/ath12k-testing/WC=
N7850/hw2.0/regdb.bin
> > >
> > > While it is ~940Mbps in both 5GHz and 6GHz band with
> > > Android/linux6.1.25, . But the firmware names are different per log,
> > > amss20.bin on Android. Not sure whether the driver is totally
> > > different for Android/linux6.1.25 and mainline.
> > >
> > > Do you have any idea that the low performance on mainline is due to
> > > driver difference or TX/RX power configuration, or firmware version?
> >
> > To debug this issue the development team has asked:
> > #1) Please change ath12k debug_mask to 0xffffffff
> > #2) trigger association to 5G AP
> > #3) reproduce throughput low issue with 5G AP
> > #4) trigger association to 6G AP
> > #5) reproduce throughput low issue with 6G AP
> >
> > Then share the logs with me (redacting anything personal) and I'll pass
> > them on to the developers.
> >
> > Thanks
> > /jeff
> >
Hi Jeff,
The latest finding is that 6GHz TX performance of wcn7850 is as we talked a=
bout.
But the RX performance wcn7850 is better than 5GHz case. So the direction
impacts a lot. Not sure whether the bottoleneck is in scheduling side, or a=
ny
configuration on TX power.

> Jun

