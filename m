Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5C0CA0ED3
	for <ath12k@archiver.kernel.org>; Wed,  4 Sep 2024 05:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avL8mOO62vjNFMqqKGoxcJZeevfPDxVOotwDzcMmWcw=; b=G41m1tXVdNsJtAROOgJReqaKtv
	Fs/w4WAl5t3a1lIyEOixhg62SrXALUYMnfom0IFW9k5DeSnT/+KwWU58wJNuQlhI8Wl59meEsLXmB
	4LKwPEgnpXde1x/s0MU+bBC+4lAhPTfr1ZWhr2k5t8aO/yHiPKV1O+FGJMTF6MC7zq723nXWtwiVC
	veQyk8WvZ1qlBxrRAYs3IUiBeq52wt/TJ++L8cMLhBTWVB9QqTpW/tfmIhV/mEOujJizjpIhYvz6L
	Fe8ud/8f/eXyh/o1MSl6YmpSf7q9CXcR2U+34Jbj+LNgTsFBXZVLjcRFRIA39Sxb1wYXFeXqnSfBk
	g9MyAtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sliGB-00000002sRW-0EYL
	for ath12k@archiver.kernel.org;
	Wed, 04 Sep 2024 05:08:51 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sliG8-00000002sQx-0ng8
	for ath12k@lists.infradead.org;
	Wed, 04 Sep 2024 05:08:49 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a86883231b4so747330366b.3
        for <ath12k@lists.infradead.org>; Tue, 03 Sep 2024 22:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725426526; x=1726031326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avL8mOO62vjNFMqqKGoxcJZeevfPDxVOotwDzcMmWcw=;
        b=db3r3OMUzBhlQaihj0Oznk/TxErcIk4I/5FFQ1Xh3jf8qO9jqDcrHM0fwwVr4IjSFM
         kf6MX814OqZrsbcg8n+FSqHN728nXitqwmSSZ1aRFXuKUFX1ML0zn0oF56zlJtbgBp0C
         dMQz9EiWJELqAAZFJoHGZMix21MkA2Lo6bY8iyS7VljROXkNlf0Byya6A4DXK8Q8u8id
         1XuzL1VRfrrT0H9+xAQoswrcg2lMsT2ubEjqt4r9FjwqpX76sR3xozbbx9cbOzk0foJe
         0zr7JQjkPkaoU0GIcrHxCR+OZIhxMM/w9eH8ivm0cI6mnEOyKi2Q1ocsMykXPPIsNapF
         xX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725426526; x=1726031326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avL8mOO62vjNFMqqKGoxcJZeevfPDxVOotwDzcMmWcw=;
        b=T9O/I0UJYrNsR30RySkRjUCGK+rD4HqomIRikPF6j83j1yrJBwzBsKCs2oWaRNVi0f
         fzYZySTmg8IpWYng2YpGfMADuQPRzDxLxCPPM+6IQY5aK1BsDI4ixPdiTHE991QGE0GH
         fL8VbyCCvIBxSQ8Z2VM1VzK1TF+rQKzBG0zLpFf/3Shoov+qD09O/FjnFL2joTnDBlPl
         4mN+d4eHK5bo+lXTnK6nxyO7Zsfk1Q4Hz5hI7Ss3fw1QHYpm6aJ6z9HlUNR0gduqbPAw
         2dhU1lPgkBg3y/zoH7EFrzyE+OcyeikC6MwnZC2kvbE/JSi6AfkqfeyXDCVeV2egvzAu
         fzYw==
X-Forwarded-Encrypted: i=1; AJvYcCV5NGPMKB8oOs8leozVdcYgCLy0ekeycsBOCYyLlS/73so4HxNgzOF/JhkqsuCepl91zbPz9mA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvUsWC5Q5aGDJSUcEiws/RsL/7RoAU+5ZdwXBm1C7nJbTj6FHz
	/X3BxUO4fI9ATvyjbTfAffKRZ2i7h1BK+ckT4wZ8tOx53T8PUIZPVXu9XpSI6sgKJT/TjFnDZ4g
	XXqlKTWOrmH26lSf3mNJHrnZVegQ=
X-Google-Smtp-Source: AGHT+IGXqNAJ9aXtoywYwJuAXbJLTkD+p2ntac6RUSI7KpEbTsKXg98pZgtoHmMOAFLsPuTQh+j+qO63AixkNGi38uw=
X-Received: by 2002:a17:907:12cd:b0:a89:f171:8dc0 with SMTP id
 a640c23a62f3a-a89f171926fmr477284566b.11.1725426526087; Tue, 03 Sep 2024
 22:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com> <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com> <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com> <LO0P123MB405769E063E48B0F7AE18C5FD68C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com> <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <86bc1623-8845-43fa-9aad-a8a6066b1448@quicinc.com> <LO0P123MB4057266AFF389FA69FDC84B8D6922@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <fb455a66-b29b-4eb0-984c-254f9a1c5626@quicinc.com> <LO0P123MB40578B26075CD4C9C66D144BD6932@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <871q21kwk8.fsf@kernel.org> <CAFED-j=i+jZwtFVzoiqXrVAubmDdxhqqVpAPSCRPMPoa6G_chQ@mail.gmail.com>
 <87seuhjbfn.fsf@kernel.org> <LO0P123MB4057552A6B51BCC3C75A0013D6932@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LO0P123MB4057552A6B51BCC3C75A0013D6932@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Wed, 4 Sep 2024 07:08:35 +0200
Message-ID: <CAFED-jnkQRV-_cfSuuOG5YxhA0O6Pxw7GyNyZ3AYoC+-Txn5yw@mail.gmail.com>
Subject: Re: wcn7850 issues
To: david Atkins <david@3adesign.co.uk>
Cc: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_220848_255965_B21E0DD0 
X-CRM114-Status: GOOD (  24.69  )
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

wt., 3 wrz 2024 o 23:15 david Atkins <david@3adesign.co.uk> napisa=C5=82(a)=
:
>
> > > wt., 3 wrz 2024 o 09:47 Kalle Valo <kvalo@kernel.org> napisa=C5=82(a)=
:
> > >>
> > >> + linux-wireless
> > >>
> > >> david Atkins <david@3adesign.co.uk> writes:
> > >>
> > >> > ...
> > >> >> >>>         Ext Tag: EHT Operation (802.11be D3.0)
> > >> >> >>>             Ext Tag length: 8 (Tag len: 9)
> > >> >> >>>             Ext Tag Number: EHT Operation (802.11be D3.0) (10=
6)
> > >> >> >>>             EHT Operation Parameters: 0x01, EHT Operation
> > >> >> >>> Information
> > >> >> Present
> > >> >> >>>                 .... ...1 =3D EHT Operation Information Prese=
nt: True
> > >> >> >>>                 .... ..0. =3D Disabled Subchannel Bitmap Pres=
ent: False
> > >> >> >>>                 .... .0.. =3D EHT Default PE Duration: False
> > >> >> >>>                 .... 0... =3D Group Addressed BU Indication L=
imit: False
> > >> >> >>>                 ..00 .... =3D Group Addressed BU Indication E=
xponent: 0
> > >> >> >>>                 00.. .... =3D Reserved: 0x0
> > >> >> >>>             Basic EHT-MCS And Nss Set: 0x44444444
> > >> >> >>>             Control: 0x02, Channel Width: 80 MHz EHT BSS band=
width
> > >> >> >>>                 .... .010 =3D Channel Width: 80 MHz EHT BSS b=
andwidth (2)
> > >> >> >>>                 0000 0... =3D Reserved: 0x00
> > >> >> >>>
> > >> >> >>> Are you saying the ath12k driver does not support these
> > >> >> >>> features? If not can
> > >> >> >> you clarify the issue so I can raise with the AP team.
> > >> >> >>>
> > >> >> >> ath12k/WCN7850 supports EHT, but with NSS only 2. Here the AP
> > >> >> >> requires NSS to be no less than 4, that is why EHT connection =
was
> > disabled.
> > >> >> >
> > >> >> > Which field is requiring NSS of 4, I'm only seeing a maximum of
> > >> >> > 4, the
> > >> >> Qualcomm windows driver will connect to the same AP, we had
> > >> >> assumed that that ath12k would do the same.
> > >> >> Basic EHT-MCS And Nss Set: 0x44444444
> > >> >
> > >> > My understanding of the spec is that there are maximum numbers of
> > >> > streams though, are you saying the AP has to advertise 0x22222222
> > >> > which would then prevent a 4x4 client (say an extender) from
> > >> > connecting with 4 streams? I note that the Qualcomm windows driver
> > >> > for Hamilton works with the AP and an Intel BE200 also works both
> > >> > of which will be in at most 2x2
> > >>
> > >> Did you test Intel BE200 with the Windows driver? Johannes mentioned
> > >> that ieee80211_verify_sta_eht_mcs_support() in mac80211 checks this
> > >> so I would assume that iwlwifi also behaves like ath12k.
> > >
> > > Yes, this is AP issue - hostapd fix required - advertise 0x11111 ...
> > > In other case station  < 4nss will drop to HE only.
> >
> > Thanks. And Johannes pointed out that you had even discussed about this
> > before:
> >
> > https://lore.kernel.org/linux-wireless/CAFED-jk8pJheJEViESnE54f-
> > K+JgRMiWoiCSa0GBt=3DRKaCn7sw@mail.gmail.com/
> >
>
> So this
>
> Basic EHT-MCS And Nss Set: 0x44444444
>
> Should be 0x11111111 ? and it defines the minimum number of streams neede=
d to connect?
>
> This the defines the max streams ?
>
>             Supported EHT-MCS and NSS Set
>                 EHT-MCS Map (BW <=3D 80MHz): 0x444444
>                     .... .... .... .... .... 0100 =3D Rx Max Nss That Sup=
ports EHT-MCS 0-9: 4
>                     .... .... .... .... 0100 .... =3D Tx Max Nss That Sup=
ports EHT-MCS 0-9: 4
>                     .... .... .... 0100 .... .... =3D Rx Max Nss That Sup=
ports EHT-MCS 10-11: 4
>                     .... .... 0100 .... .... .... =3D Tx Max Nss That Sup=
ports EHT-MCS 10-11: 4
>                     .... 0100 .... .... .... .... =3D Rx Max Nss That Sup=
ports EHT-MCS 12-13: 4
>                     0100 .... .... .... .... .... =3D Tx Max Nss That Sup=
ports EHT-MCS 12-13: 4
>
You mix different things:

Supported EHT-MCS and NSS set  vs Basic EHT-MCS And Nss Set

