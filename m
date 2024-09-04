Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F129CA0ED3
	for <ath12k@archiver.kernel.org>; Wed,  4 Sep 2024 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAQ1XPeOuW1suoDPDn70c8OJsrNRAiX0NGHVqlphyVc=; b=WQjaPsxKNumjygLC+vUjdj+49J
	+9svaWv/EeheRvnS8qwk3d7KuTRIyMG7Vs/SvOrqp2enkRNrJX7ztuV7+/S8EmpLNud1uuB7U9Vc1
	uIbUKXXS+Y1HZe4UMXpI/p7d3Ew91JvYLi9oR3E8waV4I/CfDrR7PORdkdITUuBzTZ0Ok1hxC5AAE
	WqK98GcGJgQGysoaTL6ItKPVEM19Ka8zHM8nIadZ+puj+UR0hNw4fqYH/5EwtcOdhIceme7xZnmrO
	KX20M9r++jdcOYUJxMYfb/rD4SKA0ZoXQ6DC/h9xuXwi8HDAR2OlV3yOVfU/7Alg7pCHKS2QESxol
	RYMyGw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slk8c-000000037gP-49LL
	for ath12k@archiver.kernel.org;
	Wed, 04 Sep 2024 07:09:10 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slk8a-000000037fX-0uAK
	for ath12k@lists.infradead.org;
	Wed, 04 Sep 2024 07:09:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a86acbaddb4so744355466b.1
        for <ath12k@lists.infradead.org>; Wed, 04 Sep 2024 00:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725433746; x=1726038546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAQ1XPeOuW1suoDPDn70c8OJsrNRAiX0NGHVqlphyVc=;
        b=AzPar3BsmSvX/GSsUQLeMhrGvH9GV1SRKH27sOD4HKFe5LS+UUrG6MNf+rp1JnTN7y
         1cmUUUh7GYGuWVi5jTo4/S884I5eu+60c8YXfeE6YBMcqA5uJJlCCr71aYybXeqmSRJT
         1YxRbBbw9qLNX0vzQl3OOcDahgwUqePXH0tqyDfH/FDmhtbjikfMwwxxG33V+vZz8XJn
         3RaCJESxPCFiOjFaUZn37iztmIIo4sM5DgK6D+Una2WC3tJERNi4fr44FC7x8Zk/XrH0
         mPzwY7nuRF+8iypK5917w7gHC2DzQSXueRUlxgBDEKIbXigA9dwTTKygwYebLKxNHSO+
         2TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725433746; x=1726038546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAQ1XPeOuW1suoDPDn70c8OJsrNRAiX0NGHVqlphyVc=;
        b=UqHOawxvqEvCbOXSa9RpTU6ckcOaeDzDV77p2OJ7eBcsiwz9s2X52/zySDDncBJPgw
         Nt96CQGPnAlqumHBP3GZvzp9IPRYL0SurrajEs43BXgqVMGUeTaqoE6xp/uDYuTznWgS
         EgvYJbdO17miwRrjRGWggdD1iDFuF2w+9avbzv4lWvjgySTZRNEr8Vb5P+dznlF4AOUx
         ryXl+dOlsKKKnMUtpCRAs7uqpUeXA1OebRGwAmtos0+TBwiHGUVEGeLJyb322RKKRpWx
         HxPBrBjhIW6PD4p/ClRIrVLJmKWEDdHP0yfIruq13//Gzth14y4HpGsSiR1MseFrpPQ2
         Z3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX7T8YTjV1EM/H3lA6YSlDdH/cslIYMPvlYiXXYjjOmqUpDomvmcybaIKIAAGMqLD2TKbiCJAw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7TiAX1qz+7gEPRtAgKT9uAeO6KiBb7u3uhRCf/OkLZH2zxRAi
	6rCDJK9+0fGudf/gLsBEWg+oXcwcuB7GNurF6XC4JHjmzRPvXNWrvQ4Y2uW15PwAUazxAw8/Xrg
	wSpn1PT9tS6H/W31uKDkhQGwusaE=
X-Google-Smtp-Source: AGHT+IH8DRIxNELexKn1ec0F9xVaOEcsY/HJn4AZsJ8JApAOePnppTC4rgDGU5L8Z7UGOZNtFZiY9gh3goA8HXOQneE=
X-Received: by 2002:a17:907:6088:b0:a7a:bb54:c858 with SMTP id
 a640c23a62f3a-a897f84d6e0mr1521756766b.26.1725433745986; Wed, 04 Sep 2024
 00:09:05 -0700 (PDT)
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
 <CAFED-jnkQRV-_cfSuuOG5YxhA0O6Pxw7GyNyZ3AYoC+-Txn5yw@mail.gmail.com> <LO0P123MB4057091D9028417A192B0E60D69C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LO0P123MB4057091D9028417A192B0E60D69C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Wed, 4 Sep 2024 09:08:54 +0200
Message-ID: <CAFED-jnOLFp7VVJoscspeb7dYj_3Qxgd25ji78+7gx5uJdiaqQ@mail.gmail.com>
Subject: Re: wcn7850 issues
To: david Atkins <david@3adesign.co.uk>
Cc: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_000908_286668_4A0D5F17 
X-CRM114-Status: GOOD (  26.19  )
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

=C5=9Br., 4 wrz 2024 o 08:04 david Atkins <david@3adesign.co.uk> napisa=C5=
=82(a):
>
> > > > >> > ...
> > > > >> >> >>>         Ext Tag: EHT Operation (802.11be D3.0)
> > > > >> >> >>>             Ext Tag length: 8 (Tag len: 9)
> > > > >> >> >>>             Ext Tag Number: EHT Operation (802.11be D3.0)=
 (106)
> > > > >> >> >>>             EHT Operation Parameters: 0x01, EHT Operation
> > > > >> >> >>> Information
> > > > >> >> Present
> > > > >> >> >>>                 .... ...1 =3D EHT Operation Information P=
resent: True
> > > > >> >> >>>                 .... ..0. =3D Disabled Subchannel Bitmap =
Present: False
> > > > >> >> >>>                 .... .0.. =3D EHT Default PE Duration: Fa=
lse
> > > > >> >> >>>                 .... 0... =3D Group Addressed BU Indicati=
on Limit: False
> > > > >> >> >>>                 ..00 .... =3D Group Addressed BU Indicati=
on Exponent: 0
> > > > >> >> >>>                 00.. .... =3D Reserved: 0x0
> > > > >> >> >>>             Basic EHT-MCS And Nss Set: 0x44444444
> > > > >> >> >>>             Control: 0x02, Channel Width: 80 MHz EHT BSS
> > bandwidth
> > > > >> >> >>>                 .... .010 =3D Channel Width: 80 MHz EHT B=
SS bandwidth
> > (2)
> > > > >> >> >>>                 0000 0... =3D Reserved: 0x00
> > > > >> >> >>>
> > > > >> >> >>> Are you saying the ath12k driver does not support these
> > > > >> >> >>> features? If not can
> > > > >> >> >> you clarify the issue so I can raise with the AP team.
> > > > >> >> >>>
> > > > >> >> >> ath12k/WCN7850 supports EHT, but with NSS only 2. Here the
> > > > >> >> >> AP requires NSS to be no less than 4, that is why EHT
> > > > >> >> >> connection was
> > > > disabled.
> > > > >> >> >
> > > > >> >> > Which field is requiring NSS of 4, I'm only seeing a maximu=
m
> > > > >> >> > of 4, the
> > > > >> >> Qualcomm windows driver will connect to the same AP, we had
> > > > >> >> assumed that that ath12k would do the same.
> > > > >> >> Basic EHT-MCS And Nss Set: 0x44444444
> > > > >> >
> > > > >> > My understanding of the spec is that there are maximum numbers
> > > > >> > of streams though, are you saying the AP has to advertise
> > > > >> > 0x22222222 which would then prevent a 4x4 client (say an
> > > > >> > extender) from connecting with 4 streams? I note that the
> > > > >> > Qualcomm windows driver for Hamilton works with the AP and an
> > > > >> > Intel BE200 also works both of which will be in at most 2x2
> > > > >>
> > > > >> Did you test Intel BE200 with the Windows driver? Johannes
> > > > >> mentioned that ieee80211_verify_sta_eht_mcs_support() in mac8021=
1
> > > > >> checks this so I would assume that iwlwifi also behaves like ath=
12k.
> > > > >
> > > > > Yes, this is AP issue - hostapd fix required - advertise 0x11111 =
...
> > > > > In other case station  < 4nss will drop to HE only.
> > > >
> > > > Thanks. And Johannes pointed out that you had even discussed about
> > > > this
> > > > before:
> > > >
> > > > https://lore.kernel.org/linux-wireless/CAFED-jk8pJheJEViESnE54f-
> > > > K+JgRMiWoiCSa0GBt=3DRKaCn7sw@mail.gmail.com/
> > > >
> > >
> > > So this
> > >
> > > Basic EHT-MCS And Nss Set: 0x44444444
> > >
> > > Should be 0x11111111 ? and it defines the minimum number of streams
> > needed to connect?
> > >
> > > This the defines the max streams ?
> > >
> > >             Supported EHT-MCS and NSS Set
> > >                 EHT-MCS Map (BW <=3D 80MHz): 0x444444
> > >                     .... .... .... .... .... 0100 =3D Rx Max Nss That=
 Supports EHT-MCS 0-9:
> > 4
> > >                     .... .... .... .... 0100 .... =3D Tx Max Nss That=
 Supports EHT-MCS 0-9: 4
> > >                     .... .... .... 0100 .... .... =3D Rx Max Nss That=
 Supports EHT-MCS 10-
> > 11: 4
> > >                     .... .... 0100 .... .... .... =3D Tx Max Nss That=
 Supports EHT-MCS 10-
> > 11: 4
> > >                     .... 0100 .... .... .... .... =3D Rx Max Nss That=
 Supports EHT-MCS 12-
> > 13: 4
> > >                     0100 .... .... .... .... .... =3D Tx Max Nss That
> > > Supports EHT-MCS 12-13: 4
> > >
> > You mix different things:
> >
> > Supported EHT-MCS and NSS set  vs Basic EHT-MCS And Nss Set
>
> So the basic set is the minimum?
>

linux mac80211 check it as minimum - if not pass disable client EHT

OS hostapd set is as 0x00000011 but there is some TODO - so maybe
someone else should describe it more :)
https://w1.fi/cgit/hostap/tree/src/ap/ieee802_11_eht.c#n235

So, eg. OpenWrt/main EHT AP on mt7996e use 0x00000011, and Intel
BE200/WCN7850 connect using EHT

BR
Janusz

