Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC41ECE57B
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYxQL+AwWPUpkZIR0+trIt2GDXuzD4IQQ4A284hhb9I=; b=wwwpxx1r2zhR/lIH7+6FwzPjh1
	EyZrpwcHgPq+o7ArnKFANEHybbBLsDKDidgax4LPVbaRqlnD8V/B6x+UGjQFvrGWh/pwodz1F6KNz
	dTCRoB/5+BgVDIqJcLS978TwQpytiAAiIbJVQ3wjZ4bffhVzH5P9rHze4jaEliTCvKhlOC3AMuq9O
	WhYOhh3lu+s62jMWz6qHtP0uKS9yip3E5AKRloT/8t3WT/5ApOUO2CB7BQ42AHaVYinuuj84GUuIH
	PNb7b3Y3rDEJ3LDXaNdimfq0TbwQVMKkOhi7ZYV7L5H9joCxLk4I3AAzfccq9SY3DGM+0/F7OlXQ8
	08pRRNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZdH-000000013Oo-2YqL
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 08:20:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZd0-000000013G0-12PK
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 08:20:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-374bd0da617so2477177f8f.3
        for <ath12k@lists.infradead.org>; Mon, 09 Sep 2024 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725870003; x=1726474803; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYxQL+AwWPUpkZIR0+trIt2GDXuzD4IQQ4A284hhb9I=;
        b=Q/dYJPTIyYioYx/ThgBQRLnBklza1Vqs7GEMz1qLd0ZwnGmpzytN5E+lgZtJ7QCcO6
         Idsn1vg2bAI9WzFt9WkqIdYpXp5DJ3soIhrHQs9Ryq8Y5u5/e9vK1K02ICM5nDQhRaNv
         LzUnggcUcPcL6vZOhYHDwmclRD1p4sf2mce8C9AVjd3PK598uUtTCpth1We0ypxKQ92v
         QNqef7Y6J12XOYGDy0vyw/7JObWJ3WlV+kEVQplu6CKDsYZ+zHPdDSEG5CaFRUzHN6Dw
         bii7/HrxvXqxYJe/YgSMZNTChNF+gzS+gU56h/6fCNiAqAROkxpYCPByi0BrZWL8VFt0
         08CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725870003; x=1726474803;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kYxQL+AwWPUpkZIR0+trIt2GDXuzD4IQQ4A284hhb9I=;
        b=tVJBIjoC045J90Eul+BpW8Q2BM+S+BkClRHVe/SrZlmw3i+hiGf5ScNH9+JDmm3Lnn
         UoGoPcbzgUiSaSUGq9HrU3XOt3/Hi3/gVe+4zd0qBQZP+rZtFhO9SROYfqKU3KkaAwe6
         OLCPtCEI/Ae2UNmcPm6W/Um9PMy7imIxgD6xqGhftcZzg3fGrW08fU04H4KPPcd6W+zo
         PazU3ykssbWDmpTcqahCw6OAaBFyB98DnR0uGpRzQXNWcGmnKeF67tcA7vpsLFiqtwXh
         kvrwTIW/vdPl8h9KrVcQf8YOBQte65h7r0ORNI9rfKRK8Q0IVm96SaOyYXKihbp89GdY
         S/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWyudPejBXpqcD8kXeTU+Ida/6hIbouPeLOan8AhEfnyzFqklJNKFRbVb2miKNVGcKWJShbQtk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJOPfcUAHKaFoNdlUyBgVRLmzL2oiPJgdBH0cByv+d4uLidF73
	clf+mKjwATRHHtWBhSV1tfVcRKTtaniMfDgTo3SdZ2Hoxic/++vj
X-Google-Smtp-Source: AGHT+IGN+BoofNmMeHUz9Lq2MtQ6Am0gVi84ik5ZQiHHf/w/yaIaOq4INjY2jim5cYBYLFEzOAsV7w==
X-Received: by 2002:a05:6000:128c:b0:378:7dc1:b22 with SMTP id ffacd0b85a97d-378895c5b75mr6870691f8f.12.1725870003233;
        Mon, 09 Sep 2024 01:20:03 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb32b0csm69033015e9.18.2024.09.09.01.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:20:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Sep 2024 10:20:02 +0200
Message-Id: <D41LUTO0MIC3.12475D2J3VNX3@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Santhosh Ramesh" <quic_santrame@quicinc.com>,
 <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>, "Sathishkumar Muruganandam"
 <quic_murugana@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240909073049.3423035-1-quic_santrame@quicinc.com>
In-Reply-To: <20240909073049.3423035-1-quic_santrame@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_012006_313355_36CCD928 
X-CRM114-Status: GOOD (  14.89  )
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

On Mon Sep 9, 2024 at 9:30 AM CEST, Santhosh Ramesh wrote:

[...]

> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless=
/ath/ath12k/mac.c
> index 137394c36460..6d7a005d83b4 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -7217,9 +7217,9 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *ar=
vif,
>  							chandef->chan->band,
>  							arvif->vif->type);
>  	arg.min_power =3D 0;
> -	arg.max_power =3D chandef->chan->max_power * 2;
> -	arg.max_reg_power =3D chandef->chan->max_reg_power * 2;
> -	arg.max_antenna_gain =3D chandef->chan->max_antenna_gain * 2;
> +	arg.max_power =3D chandef->chan->max_power;
> +	arg.max_reg_power =3D chandef->chan->max_reg_power;
> +	arg.max_antenna_gain =3D chandef->chan->max_antenna_gain;
> =20

For what it's worth, I already got a similar patch from QCA a few month ago=
, and
it fixed some tx power problems when scanning so I know there is truth in t=
his.

>  	arg.pref_tx_streams =3D ar->num_tx_chains;
>  	arg.pref_rx_streams =3D ar->num_rx_chains;
>
> base-commit: 903aaf66edc97dd5b9e3118d19677291051a9c40

But there also was more in the patch:

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/a=
th/ath12k/wmi.c
index a97e1399eeed..87e3ae49afa5 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2563,6 +2563,8 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k =
*ar,
 						  WMI_CHAN_REG_INFO1_REG_CLS);
 			*reg2 |=3D le32_encode_bits(channel_arg->antennamax,
 						  WMI_CHAN_REG_INFO2_ANT_MAX);
+			*reg2 |=3D le32_encode_bits(channel_arg->maxregpower,
+						  WMI_CHAN_REG_INFO2_MAX_TX_PWR);
=20
 			ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
 				   "WMI chan scan list chan[%d] =3D %u, chan_info->info %8x\n",

It seems that ath11k has a similar piece of code in the equivalent function
ath11k_wmi_send_scan_chan_list_cmd . Isn't this needed ?

Also I see that in ath12k/reg.c in ath12k_reg_update_chan_list we also send=
 to
the firmware:
			ch->maxpower =3D channel->max_power * 2;
			ch->maxregpower =3D channel->max_reg_power * 2;
			ch->antennamax =3D channel->max_antenna_gain * 2;

As it is in a different wmi message, I guess the units are different. 0.5 d=
Bm
increment in struct ath12k_wmi_channel_arg right ? Or should we remove the =
'*2'

