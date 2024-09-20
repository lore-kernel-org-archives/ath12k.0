Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21591CF58DD
	for <ath12k@archiver.kernel.org>; Fri, 20 Sep 2024 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6izsneD2lGdAkFmb0KW0msuxjusdUXdIU29WvalOzw=; b=2T3G0aD1WffaipU0uQ2P13YumT
	oEdOgNns5nL6QojHIO1HHeU7edk1O11w8pulmg0xrUrr8Ixd5cgQmDaCiI0FjHtfU8qIReSvje3EU
	RLIY7FzZGS9Y0tWm7So25VQFrmUrK82C2kztLm7PKUdhLhCWZWS1v+JBIsrMkr4Xsvs7cNGMdUyLR
	bEdXKyP7x7omIFIpabkinBg6GQy2XdE8CrCsn3/1jIw+Bpclno8uRbhnbr/89mF7lukXOTuvm6rtt
	xYik1zVQQ2zARQHKGd01sk72ul4Dbsm4ZzbXEZg9qZz/1iOhUnRbncDnf1WdEDfyMWL1eh2MqRB8E
	dn8DSQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srXrw-0000000Bbqw-3JUH
	for ath12k@archiver.kernel.org;
	Fri, 20 Sep 2024 07:15:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srXrt-0000000BbqW-3GcL
	for ath12k@lists.infradead.org;
	Fri, 20 Sep 2024 07:15:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-374b25263a3so1038180f8f.0
        for <ath12k@lists.infradead.org>; Fri, 20 Sep 2024 00:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726816552; x=1727421352; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6izsneD2lGdAkFmb0KW0msuxjusdUXdIU29WvalOzw=;
        b=g+V13Xx8Am0NqMZJeAwI4cLm/yI/WzQS0HBN4nP+urNaO2bNFkQ+HGzd6k6ChIbOxN
         2dn85kTZfmv4ykZdyA/tVCmdHPmFOUvoED/HU1C+Q5RXXTu4MRCNNSMat3k1uMi+7Tiq
         hk/baBUtAfqDYOeY8PISbSgsI00pETcJ3QkpShKx1AZTKt/p01PJQjXBQt1LmqiImmp+
         GbYKZhF+fIrbTUldZPKcvSRmp3eeuAuaF85ithpqOWoiGUlSYQTlKnURfrZCQJ4x4vS1
         IG27nyX8Nmihh3muCMlnqQ6A/8L/e0vYh8wYglo/HEQXGx3pEN5V1MDJpi81bk+XydRL
         Lrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726816552; x=1727421352;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6izsneD2lGdAkFmb0KW0msuxjusdUXdIU29WvalOzw=;
        b=Jx+1O+PpTg5eMvG7p1+OrUDuAmXwj/qYVNqmepbhUbs48ox9DoGaLP34Bp2nWvR6YN
         rKUtzCIPXFkcwP/jxpnnbbg8C75QWyxIFpK2A2C1cvdbsP6PLJaduv/jIoC6hxwQaoIy
         lnPNmClwtrO9+bU2CCQz0ZOPoE6WdT8PN9F9vDCK3NtWobP//BTD2VQH2bjasI7pYQzD
         3hhGQplzVdcHyPHqWl8AKWRu7xxPc7ePOrUfxPgk5EM+2pFBQOG1OQwdJbypcNVzOIEB
         AdmP5CYH6cz0zmBliL3jspetdQgLz7+1pz6Mb/WRPQEs8QSnxRtuNHlruNo0EdUbrQva
         Mxcg==
X-Gm-Message-State: AOJu0YzmbOa5XRemr9e9QXCgEX/SGKvpXIRpRmig7kjAfa3tLRxbGabE
	RexrKSpm2LiKvDWjGCzzzbSxw1c6YyybBV95cpxHZg/3rpTs+E04Tqsrsw==
X-Google-Smtp-Source: AGHT+IGKePSXh6HEhx5zysP1kcrf+8Jrq/9dNUeumETuu0ZNZwjbd+E+88QpLrjwhofA0h7AUHaUcw==
X-Received: by 2002:a5d:434b:0:b0:374:b6f4:d8d1 with SMTP id ffacd0b85a97d-37a4226543amr847180f8f.13.1726816551524;
        Fri, 20 Sep 2024 00:15:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:0:2100:375e:67e3:3e7b:d99d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afe38e6sm14313365e9.34.2024.09.20.00.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 00:15:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Sep 2024 09:15:50 +0200
Message-Id: <D4AXDNUEYII0.P1ZRMOBR4EPS@gmail.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 <quic_murugana@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Santhosh Ramesh" <quic_santrame@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <D41LUTO0MIC3.12475D2J3VNX3@gmail.com>
 <93d580b4-cf7a-471f-8f3a-673d456f726f@quicinc.com>
 <51afbe69-e770-0344-6ca0-0fe5cd721d2d@quicinc.com>
In-Reply-To: <51afbe69-e770-0344-6ca0-0fe5cd721d2d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_001553_846554_C8EA61CB 
X-CRM114-Status: GOOD (  22.76  )
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

On Fri Sep 20, 2024 at 6:43 AM CEST, Santhosh Ramesh wrote:
[...]
> >=20
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
> >=20
> > For what it's worth, I already got a similar patch from QCA a few month=
 ago, and
> > it fixed some tx power problems when scanning so I know there is truth =
in this.
> >=20
> >>  	arg.pref_tx_streams =3D ar->num_tx_chains;
> >>  	arg.pref_rx_streams =3D ar->num_rx_chains;
> >>
> >> base-commit: 903aaf66edc97dd5b9e3118d19677291051a9c40
> >=20
> > But there also was more in the patch:
> >=20
> > diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wirele=
ss/ath/ath12k/wmi.c
> > index a97e1399eeed..87e3ae49afa5 100644
> > --- a/drivers/net/wireless/ath/ath12k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> > @@ -2563,6 +2563,8 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath=
12k *ar,
> >  						  WMI_CHAN_REG_INFO1_REG_CLS);
> >  			*reg2 |=3D le32_encode_bits(channel_arg->antennamax,
> >  						  WMI_CHAN_REG_INFO2_ANT_MAX);
> > +			*reg2 |=3D le32_encode_bits(channel_arg->maxregpower,
> > +						  WMI_CHAN_REG_INFO2_MAX_TX_PWR);
> > =20
> >  			ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
> >  				   "WMI chan scan list chan[%d] =3D %u, chan_info->info %8x\n",
> >=20
> > It seems that ath11k has a similar piece of code in the equivalent func=
tion
> > ath11k_wmi_send_scan_chan_list_cmd . Isn't this needed ?
>
> This change is in a separate patch, which will be sent for public review =
soon.

OK

>
> >=20
> > Also I see that in ath12k/reg.c in ath12k_reg_update_chan_list we also =
send to
> > the firmware:
> > 			ch->maxpower =3D channel->max_power * 2;
> > 			ch->maxregpower =3D channel->max_reg_power * 2;
> > 			ch->antennamax =3D channel->max_antenna_gain * 2;
> >=20
> > As it is in a different wmi message, I guess the units are different. 0=
.5 dBm
> > increment in struct ath12k_wmi_channel_arg right ? Or should we remove =
the '*2'
> >=20
>
> Yes, the firmware expects these values in 0.5 dBm increments, so we multi=
ply=20
> them by 2 in the ath12k_reg_update_chan_list function.
Good

Then good news this gets mainlined by the way, but it's a shame it takes th=
is
long (like 10 months or so...)

Reviewed-by: Nicolas Escande <nico.escande@gmail.com>

