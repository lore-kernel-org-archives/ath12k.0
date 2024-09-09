Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14D6ECE579
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJFjo702X8q5uVDM9Y/osr1tGRyblMgk3zX0Xjg/pSU=; b=mBjBD8JAWVgvJn8byxjieH5IrS
	2bNjonXVra4gDJ/xnlxg7Y2S/cI6oxNOL6bu8iHd61q9KUcBNaOKqzB1aKB2787lb54BkuzZLGHRh
	whtF6dGADgE4g8QM4I2pSdOa5GKQ8hKVMbSxkjvxiqdfrs48wVLaiCfnGNbrskNLdpKODfDDIPAIw
	s99VFYh7GhYzdsQ4XFz5qznUiYX008zbnmtTkdNzfbMOM5hCU8zZJAUpbXwMIaeb3yRZwMOTXVLeC
	6XWUTFwFJpzKWxGzm3LCIT2KvmIB1IyPASjd2zKiyBhEW6QT3c1aEvssrAA3tYcqtoCSXjreuX3/k
	Zq1Rdarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne3J-00000001ywF-2Z3A
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 13:03:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndvo-00000001xHQ-0K9H
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 12:55:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42bb6d3e260so38544515e9.1
        for <ath12k@lists.infradead.org>; Mon, 09 Sep 2024 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725886547; x=1726491347; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJFjo702X8q5uVDM9Y/osr1tGRyblMgk3zX0Xjg/pSU=;
        b=f/tqFuw3vRz/p8M3KND+6NBaD7zZW9QhpK5dcBb9gqDmTPlxox+ZE4Cn2dNfVmB3Jq
         H0cSnVCoO1Ow4KK/8CWPC8p26Gr/EbXDSnz3klFWHjFrBzSGZspgAogUw390EYLjyGXu
         iEBU8nEGkFboyelQky0E4DbrTvF578Ee43SIWQqTXz70zobsBV/b2DlNUph/b86ucfKa
         3uUsVpIFX7cL80e73QUykEbiMnnMicv5bWRqJLyxs8KVGRKT2LpHgw7U0njwfPRCKA3O
         c0yPIGhUMfq7wIFRzlsH4pvM8sVuZWcAT+uyktUbZOoaDu3YEYLXmPA0WxoQaICHGaYs
         XBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886547; x=1726491347;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bJFjo702X8q5uVDM9Y/osr1tGRyblMgk3zX0Xjg/pSU=;
        b=Cl7wX2ueR33sB2lIKe/q76OyNvuVLIwqAA8GKa9EqqDrMULuJkvBhQCr18943spRfW
         hggbW8rbj2R59FVXQvJRi1hFxp0ehhf/zij1VrYlqhhqT2HWKmqhsQjKMiIdgkfn36uc
         4Gs1tZLS8NYJ3AKCcL4pz9AxXzYeQx4CTXLF1E6kgjl9QzfNbLmFz+SQMUtusllauVgJ
         JIusd0YzzJk+E9cSNprsJqjSL1+ZSarbB5h9XUteRqSEe3TghhG8edBC3rw3aDBR40p0
         YuyRNhAmKgGsHDwZqDe1LTRgYUCjieQHl8hJksplgz64jLb7oMl4sb1grtLPNzQD8NuC
         Tc2A==
X-Forwarded-Encrypted: i=1; AJvYcCURTqZzYrRqvKug37C1sZphNYJj2TbHAJ7nCPCwuGtG2k5d0PEEWCZSqTlqux0eTeTluUnOkBg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLzotcy8S72kyvj6iU4qQx2HaIQoks7DOOKIPQAsMrzvUC1VbD
	HilgjViAEVf2CnlHoEL7TDiWAjX+Sovo4vJNMK0hBdwwm+xQadcWWopAeQ==
X-Google-Smtp-Source: AGHT+IFZfbmxw+BnVpvwUdEZamnT0ZP+IITsxoBFnGgcY8roL1Q8w/9wir5QSnvYZl53hXGSNi+XcA==
X-Received: by 2002:a05:600c:1d10:b0:42c:bae0:f066 with SMTP id 5b1f17b1804b1-42cbae0f268mr9608425e9.13.1725886546251;
        Mon, 09 Sep 2024 05:55:46 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb32318sm75389955e9.17.2024.09.09.05.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:55:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Sep 2024 14:55:45 +0200
Message-Id: <D41RPXAVWZRY.39N9OHG07XAS2@gmail.com>
Cc: "Santhosh Ramesh" <quic_santrame@quicinc.com>,
 <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 "Sathishkumar Muruganandam" <quic_murugana@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Kalle Valo" <kvalo@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240909073049.3423035-1-quic_santrame@quicinc.com>
 <D41LUTO0MIC3.12475D2J3VNX3@gmail.com> <87mskhgpox.fsf@kernel.org>
 <D41OHKZYZR9E.2JD7SQKZBBYGH@gmail.com> <87a5ghgjrl.fsf@kernel.org>
In-Reply-To: <87a5ghgjrl.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_055548_138754_C54D3D88 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon Sep 9, 2024 at 1:15 PM CEST, Kalle Valo wrote:
> "Nicolas Escande" <nico.escande@gmail.com> writes:
>
> > On Mon Sep 9, 2024 at 11:07 AM CEST, Kalle Valo wrote:
> >
> >> "Nicolas Escande" <nico.escande@gmail.com> writes:
> >>
> >> > On Mon Sep 9, 2024 at 9:30 AM CEST, Santhosh Ramesh wrote:
> >> >
> >> > [...]
> >> >
> >> >> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wi=
reless/ath/ath12k/mac.c
> >> >> index 137394c36460..6d7a005d83b4 100644
> >> >> --- a/drivers/net/wireless/ath/ath12k/mac.c
> >> >> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> >> >> @@ -7217,9 +7217,9 @@ ath12k_mac_vdev_start_restart(struct ath12k_v=
if *arvif,
> >> >>  							chandef->chan->band,
> >> >>  							arvif->vif->type);
> >> >>  	arg.min_power =3D 0;
> >> >> -	arg.max_power =3D chandef->chan->max_power * 2;
> >> >> -	arg.max_reg_power =3D chandef->chan->max_reg_power * 2;
> >> >> -	arg.max_antenna_gain =3D chandef->chan->max_antenna_gain * 2;
> >> >> +	arg.max_power =3D chandef->chan->max_power;
> >> >> +	arg.max_reg_power =3D chandef->chan->max_reg_power;
> >> >> +	arg.max_antenna_gain =3D chandef->chan->max_antenna_gain;
> >> >> =20
> >> >
> >> > For what it's worth, I already got a similar patch from QCA a few mo=
nth ago, and
> >> > it fixed some tx power problems when scanning so I know there is tru=
th in this.
> >>
> >> What hardware and what firmware did you use? The firmware branches can
> >> behave differently so whenever testing something it's good to include
> >> that info.
> >
> > Well what I tested was with the additionnal patch provided. So dependin=
g on
> > Santhosh response, I'll either give the proprer tested by tag, or if th=
e patch
> > isn't needed. I'll need to find some time to test it :)
>
> Can you say what hardware (QCN9274 or WCN7850) you are using? I'm not
> asking for Tested-on tag, just some extra information to help the
> review.

Sure, I tested it with a QCN9274, in 2*2x2 (2.4GHz + 5GHz) in station mode =
with
a special firmware WLAN.WBE.1.2.1-00148.1-QCAHKSWPL_SILICONZ-8.
Without this, all probe requests sent by the firwmare during a scan (both b=
ands)
were send with around 15/20 dBm less power that the data frames.

