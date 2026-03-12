Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19C21067043
	for <ath12k@archiver.kernel.org>; Thu, 12 Mar 2026 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ya238d2ohp10iFYuWnPLzqnu0MMHEfPVLrPGoAibNs=; b=s0Vz4PW9dDgCCcSs7GSDKs5nOk
	zADsEHawZ7wcWaP8yoerzlNpP6CT7oCDtAmPK5v4s/5ZkAODBVxz2ZzyQcjsSOzOJ6LhdIQ8Hd/dE
	HIIxShske9lm6f41v4gNfzhSSff+swwYPqw95ZlwSbVIOezbbjsF/fdOUQXl1pwF93tp+mvAdTudo
	d4V+F9HWMkUn7IK1rTAXCWZIakHFJLTkJNvnPTko7Tscu4eG0bFWASEONh/Lb4FMjAiyphrNDmDzg
	D+LDmBFlIoRkgMoS0C92WFi1J3vSjxYYJ9M21MqRYFJpZlGAHEHikRa6tJvSFsfd6nY0Lx75lj+oB
	DgPDeCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hzg-0000000EO5b-2Y07;
	Thu, 12 Mar 2026 15:30:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hze-0000000EO4d-281A
	for ath12k@lists.infradead.org;
	Thu, 12 Mar 2026 15:30:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48532925a4bso6394205e9.1
        for <ath12k@lists.infradead.org>; Thu, 12 Mar 2026 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329432; x=1773934232; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ya238d2ohp10iFYuWnPLzqnu0MMHEfPVLrPGoAibNs=;
        b=ODInkmEMSK13ShoMEL2H33g1BxtUaRScYFYiTF65NvWfn1oKiv1/GFcfWF2dVftLWv
         hGj1J76aIU5K2CSbQruud3DzSuTvGl/RU/ofycWg4l6rt0THVcR4EkgLRMpZv725BxeM
         WhByVmHKRTCfSYfaUIRik0JpEcwaRbTAdhoYZqQldEP/QAiTVxacmIHweBENvdSMnTni
         Fkk3SxWAlUWaPRMhyKx3xbEVCMxgyksAHfHZaZVvl8C5SqVPCM+IYT01I/XYZbF3t941
         VUAuMnMc2uB71nuUc0MoHxKks6xebjOfBLo9OkekMzD03tzy0OqewhcOfRldXbtfVx3I
         jpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329432; x=1773934232;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ya238d2ohp10iFYuWnPLzqnu0MMHEfPVLrPGoAibNs=;
        b=Gex71qSzSVuNslA6PJAmVselkK6E8EOwYLgsFWpjZ8miYtxA7AnVHaWw1H31Jrks0i
         wlt6ONccgYJxTd+mHpTQ3Vfemd/JD0sqCB5NjuHTND9qMmU+d3lbrEQiLUhcQZ7PZYJo
         kyHclJEv0f+/11q//efJrD6/I3x0Pa+6FPPfwDnifEyOglpFW07rc3TfyVBlYamBgDF0
         UcMceZZUu5XCP7LuhAXpv+MoNbVORQ8yC0keywLJeebZ/wxOb3KwCV5wNgKRAYA02U4R
         ZhDQw52XXD/5VaC6EcYDQDZa8DleiF01OZaHHc0RqRgOqsRZeDWm8Fkasit0c45U5osR
         mmVw==
X-Forwarded-Encrypted: i=1; AJvYcCXhOfu/63/kAxWyIkRPkxIEKrCHkArt2lBYXJdOtondZKNy4U5Hzt/zG+yirCBqo738PNWfDDU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyK8xsrnSJQtRmg2bhxyy0gTqWSqOoIv4bttY7BJuMnu66TVSH
	tEQsH1o8vvrQjLHyQm49JZqgKQPkmpotX7uaZm7wGaToS7qgS/ULcRdA
X-Gm-Gg: ATEYQzw/ntVsF9k21XUedTus2b6L5iH0xusT4jKsB2dpxOk2/rVTJLMBJ7qZu3FIN/I
	61h+DRKPcc/gD7U+g2IgXtLZVlxJJgOpEv6QHHYdZXxQnpzVIt6f3QT4GWUDM9UrGR/QU4YIA2C
	FJxPpx07wzfjr+yhtqxbJEKwAgUt35eVnah8LuFI8G6IWAOg0/PY5t1WqoncPZr+bpLcyBeJ3ul
	1m2nvB2kUKA/Wpay1Jo5dGjFlfZz7hpvg6wpwPkhGBnnj0K5Vn3zNTEX2g/BKYXpwIBrrmNfhWj
	0nltxtS4szcvVMA2KK6XrAfZX4wOlRCYKJnE3Afh6/InDxr4JmmNpxoLojIukWhqR2loXfUjBam
	rOUJRS7kb8s0aOonmw/gSrpDbJDesP1uxwd6AL+cLU2mEnf7glTEBpsAqEwrkuXJjB//Pc5M6VC
	tzy48AGuVdpRr+Fo+kbM5gn5ipl6kEiOz8W5LximO4Vg==
X-Received: by 2002:a05:600d:6450:10b0:485:38fc:7069 with SMTP id 5b1f17b1804b1-4854b1b1a61mr86890415e9.23.1773329432326;
        Thu, 12 Mar 2026 08:30:32 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm265726375e9.14.2026.03.12.08.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 08:30:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 16:30:31 +0100
Message-Id: <DH0WTI7WT7H4.3TVAG9RAB1QX0@gmail.com>
To: "Nicolas Escande" <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309152050.191820-1-nico.escande@gmail.com>
In-Reply-To: <20260309152050.191820-1-nico.escande@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_083034_969033_4DFD5746 
X-CRM114-Status: GOOD (  16.43  )
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

On Mon Mar 9, 2026 at 4:20 PM CET, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary arra=
y
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. Thi=
s
> alloc can fail when memory pressure in the system is high enough.
>
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time
>
> So instead lets move to a per cpu allocated array, stored in the struct
> ath12k_base, that is reused accros calls. The ath12k_wmi_tlv_parse_alloc(=
)
> is also renamed into / merged with ath12k_wmi_tlv_parse() as it no longer
> allocs memory but returns the existing per-cpu one.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> changes from RFC:
>   - rebased on ath-next 8e0ab5b9adb7
>   - converted missing call sites ath12k_wmi_obss_color_collision_event()
>     & ath12k_wmi_pdev_temperature_event()
>   - changed alloc order & cleanup path in ath12k_core_alloc() as it seems
>     it confused people

And I just realized that this part did not make it to the actual commit
but stayed in the stage area. I'll add it in the v2

>   - used sizeof(*tb) in ath12k_wmi_tlv_parse()
>
> Note I did try to move to a DEFINE_PER_CPU() allocated array but the modu=
le
> loader complained about the array size. So I stuck to the per ab alloc.=
=20

