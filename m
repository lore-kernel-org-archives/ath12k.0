Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AF6E7717D
	for <ath12k@archiver.kernel.org>; Fri, 13 Dec 2024 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9iFadcKV7NOuGMDoiou+96S+djlE3jUoskL0WXWoC0=; b=SdwXd6rEtZVrEKRrT0h4CC1GJP
	50gQUR+Mh8pNBjeNhkjB7Athw9NwDBUMzEL40S9vs2W3IYdQfE0TOPWLGqU7GqSL9RstX/ymivP+p
	QU5hf2IuntO9CiAl2uQRChB8JkQN6TSCwWxepvdy9FfGp/J298+Al1sHRZLMplMoL38w8LVfBIW6+
	6le1gZtBKaYvFGl5YKfPD9ZrbMT3psfVC6jBl2jOTq4fdHzTDUSRA5iSpwxKvAVsD7sVnFgcrto2l
	mBdJH3HWQUZMJzpnTJ/DOxpNE4mFcZPeUtEcLh4Uw8is3y8GoNfAy83eS46gMemuR5cBMHTqb40Pf
	0r2CXYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1GB-000000037qQ-1R3H
	for ath12k@archiver.kernel.org;
	Fri, 13 Dec 2024 08:42:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1G9-000000037py-3GxA
	for ath12k@lists.infradead.org;
	Fri, 13 Dec 2024 08:42:54 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862d6d5765so946721f8f.3
        for <ath12k@lists.infradead.org>; Fri, 13 Dec 2024 00:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734079371; x=1734684171; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9iFadcKV7NOuGMDoiou+96S+djlE3jUoskL0WXWoC0=;
        b=WoOOtjH29o/2+uW6MIxSzPguBMI+zfAHpm87V277XIeMK8x44iC3htNZXIQp1R2q56
         82UglCHwfwRcfjzWt9RNi9KBL7Of0M28N9ZU0HnXe9OBXWN0psdhHdmTZpBqgvqYj9hW
         +z7Z+xSeWzgzfcmFavHWaGc3kSOIePecsm4xpsYwmowp/mSNkqo5fYeJkZ6ty+MfZuIA
         O/0QRGbTuU+F/sMFGYcUpskxUzzwEmwogyp90pvDt0lvAA6mD25lWNdCT7j5cOpwTjgx
         hFPO2nuq+kK4bbE+TgU+wO6bYsioXDxdZZwXc14fgbFzPqWdODW30imZSvEXTZW9s6UW
         spAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734079371; x=1734684171;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y9iFadcKV7NOuGMDoiou+96S+djlE3jUoskL0WXWoC0=;
        b=C01A6rcDLuuiMm5geJzdFEGEQhN0BntORMCHQ5l8b7LAvTF8gIriLqxT47lyPLuK8g
         MJ8Jit+M6yPLstr/UrzPsJ0mfyxQG5Z0bHBMVEgbg3VGwFa7Oi3CFVBoaeWlZ5hOJLcz
         KJw0xuakcXJ3442xN3yjX+DwxU4RR4MjevDidu4pyZ94xtlsfDaHrbjb0kuCol6a/KDl
         FnJwrssNylazmVMv8zzF4ue+hodlCGXP9Yup4YbqRsUduk9XiYg7x9LqdveOwqTJBaf6
         fujoine+2cVhcWF2TXYix1qXOLPAVHTj2L6urW9W9w5I7QdQc+Kob+1L9oSOMDSweKJD
         TI1w==
X-Gm-Message-State: AOJu0YwcPNm2R9Q65sQ79i8gD50KqzmSvV6gZWaxwbOSmVsS5dBDIWnM
	8vHsXvdu+It/lU2SjSY5wGkOv5xzZY8Nf42C5YX1CJk6xEexOvkE316itg==
X-Gm-Gg: ASbGncs12oH1O71lY2sBHmoYgZ1W70DWv3uQHchEBjNfcWMwbtyhOI3ECswvqQt8ZkJ
	i6T+2WXwhYQwwWqw5moChQ67fjOZPPOIFbNKNavqVzZ/pF46TUdMvtFJgezNLCsxSp6Vv0CRdUS
	T4P/VTpmG2Ptql+g9t6cP1AV+XxKs0/CtWlS+UrAQrmIvoSFXNgKIndvBPmq6H9eahXc0EiDt+I
	1bp++hf/3dUQ6PzLZu0yRWctR9tuS07OFwJ8XqS7q02pELWJyrvvzOeIau4qcxiWq7HXhzxfHA=
X-Google-Smtp-Source: AGHT+IHWsvo9dkmgwdOTmI63/EvBCpV3mLlUvHDKrTxRlil6MeXplgqo4OSHVVx8B/x/waUcP2yoPA==
X-Received: by 2002:a5d:5f8f:0:b0:385:e5d6:130c with SMTP id ffacd0b85a97d-3888e0bf8bcmr1027733f8f.51.1734079371282;
        Fri, 13 Dec 2024 00:42:51 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c8a6esm6363509f8f.59.2024.12.13.00.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 00:42:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Dec 2024 09:42:50 +0100
Message-Id: <D6AFU1A3PRGK.1I5GCZJV2BQ14@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Santhosh Ramesh" <quic_santrame@quicinc.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 <quic_murugana@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <D41LUTO0MIC3.12475D2J3VNX3@gmail.com>
 <93d580b4-cf7a-471f-8f3a-673d456f726f@quicinc.com>
 <51afbe69-e770-0344-6ca0-0fe5cd721d2d@quicinc.com>
In-Reply-To: <51afbe69-e770-0344-6ca0-0fe5cd721d2d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_004253_821210_F231215D 
X-CRM114-Status: GOOD (  16.49  )
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
> "Nicolas Escande" <nico.escande@gmail.com> writes:
[...]
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

Hey Santhosh,

Unless I'm mistaken (which is very much possible) I didn't see any patch po=
sted
to fix that. Weren't you guys supposed to have done it by now ?

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

Thanks

