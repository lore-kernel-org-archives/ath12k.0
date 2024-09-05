Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4EECD5BC0
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 13:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLm+Ida1UR6l9oGpXZYKEpk5pxLUBdRkErAEBQguDS4=; b=0YHxjzdDtz6i4Xcm3FgH93BR5w
	02HrNGKuKXfhrZO8nAXHMPY8mJCSm6DV6d9/J46TAD760kRs5e4uKXOD/qru/oOKwAzipSTElr5v5
	NIgWTsIdb6i2+teq0YyuVSXSpY/lWlfwMwNR5PH578MGiJzdPjXmFa80fs0yW8qX/Dcu7V3KbRXHv
	9nvti8eTout2ZQq+lkw2ZOQs8SRZM9NwSLz4wAkaX1/0M1J+Tj2qtxM21RGX3BeCgFV+rPAXyFndt
	6chfzVlqrHelKCaoa59bAHeqwGJvH8bpw88VupHYQwn4cfM5Qcb6nvdyIxqedJcgkcCFqgbrgOBFK
	tQfr2NFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCBx-00000008THe-2le3
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 13:06:29 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCBu-00000008TF8-0NSg
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 13:06:27 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5356ab89665so881149e87.1
        for <ath12k@lists.infradead.org>; Thu, 05 Sep 2024 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725541583; x=1726146383; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLm+Ida1UR6l9oGpXZYKEpk5pxLUBdRkErAEBQguDS4=;
        b=iH82gfQ1HZKtGp9AljbFWVYAduvEl2xMijnBTitIjMBuV1Vb5F57gILoaBTkCNsrKJ
         ob9OJ/lOJNpFjnNvsgzYYje9B9bmklDtp8q73ajP4QRBvK8+FlUizcTeKr5s675lKHIa
         gv809PL3+JFU3y2LgFLHptboTCWvoT8FGXBL9AGP7QMexL8hQK0bQF7C2shdYb8XfkCO
         xhJTPQXkVjYNPPRRy6G/GQMojRQBqwUOU92nnn2dnG92F33JIB2WuicHGN+Zzybfc1Ft
         aHg3g1uq+rDfFYEVTasmm4J0y6eAVOnhTDOav+IKFil/mg95aT9T+kv6caZEW6uUmgxC
         /FkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541583; x=1726146383;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sLm+Ida1UR6l9oGpXZYKEpk5pxLUBdRkErAEBQguDS4=;
        b=M0lPy/St31IHGEWyDlyUfEPTBfA20cRyZUQBdRZnwk9g9pZsRTPJX8yftp1VfjndSb
         fF1qXJ+QW1r9hv+EZFaUEswxZkRlqygPfHMaThe0lJAkMVK6buEU4ncrCbwsvFNrzSW+
         F0E8wO79NdyErQdpeg0/K9Wm9AgI7TdmZVBxcHn1TNYbJJhaklGHsyJobXYNPJMh71AY
         AiyXWJP1MNJ3toHHkK4Gtkq/XPZe3EZDdmaBCsdXcfZOeOAYv0Jq56eU2TjkIJxbwydP
         tpTnQV8jaQpk4L/EBJNa/HR871Uqbc5+GFEYB9tCVl/BXTCkgL0bFIOVsF+rm8S4KOvU
         Jx1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTkTUG8KNdUfbCK9sCLOFyFt033f7O4M2e1aXeiHSqFqZ3RhpeT5T2fmv3hoII3g4/LFf9Hh0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/nC3gclmvxQEiocK1OocHacLFU+fC0Mf12+4CERHs7VYjFy+6
	0OM+wkpnr9QWYXHsk9frXFFS2kKkk0ikJQGLR7VR+VDn0ioO2vlW
X-Google-Smtp-Source: AGHT+IFEyk/jXuHMa6X9gmcnjTDZzZfYeJGq/gyAFlSaRY5yz+MTkbcwhz3tO1OGIAI3W/EA4voQVg==
X-Received: by 2002:a05:6512:6404:b0:535:6cca:9453 with SMTP id 2adb3069b0e04-5356cca94cfmr2183081e87.12.1725541582925;
        Thu, 05 Sep 2024 06:06:22 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7b628dd4sm168643195e9.11.2024.09.05.06.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 06:06:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Sep 2024 15:06:21 +0200
Message-Id: <D3YDFV83HICP.3605AE2L7PIE9@gmail.com>
Subject: Re: Weird layout of struct hal_rx_desc_qcn9274
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <D3XL7VMHE62Y.3JJPEKV07MJAS@gmail.com>
In-Reply-To: <D3XL7VMHE62Y.3JJPEKV07MJAS@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_060626_164895_F92C872B 
X-CRM114-Status: GOOD (  20.00  )
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

On 2024-09-05 4:53, Karthikeyan Periyasamy wrote:

[...]

> >=20
> > So it seems without the quadword registration, even though qcn9274 & wc=
n7850
> > appears to have similar layout, the __le64 msdu_end_tag is present in t=
he struct
> > hal_rx_desc_wcn7850 but not in struct hal_rx_desc_qcn9274. That seems w=
eird.
> > Would this mean that firmware always sends 8bytes of msdu_end_tag in wc=
n7850 but
> > not on qcn9274 ?
> >=20
>=20
> yes, qcn9274 not packed with __le64 tag.
> wcn7850 expect the __le64 tag packed in the msdu_end and mpdu_start.

So in the full form, we just do not have the _le64 tag on qcn9274 but not i=
n
wcn7850, right ?=20

>=20
>=20
> > It seems unlikely as when using the compact layout on qcn9274 (the defa=
ult now)
> > we use QCN9274_MSDU_END_WMASK with QCN9274_MSDU_END_SELECT_MSDU_END_TAG=
 (bit(0))
> > which seems to indicate that this 8bytes tag is part of the optional da=
ta that
> > we can select (or not) to be received from the firmware.
> >=20
> > Am I missing something ? Did that even worked before switching to compa=
ct layout
> > for qcn9274 ?
>=20
> Yes, tag tlv is configurable in the compact word subscription mode.
> Before compact mode, qcn9274 full mode is worked without any issue.
>

So that means that setting all bits in the tlv subscription mode *is not* t=
he
same as not using the subscription and receiving the full desciptor. Settin=
g all
bits will get you the __le64 tag, but not using the registration at all wil=
l not
get it right ?=20

> >=20
> > And if it's not working as intended, what's the layout style we actuall=
y want to
> > use for struct hal_rx_desc_XXX, do we want the __le64 msdu_end_tag insi=
de the
> > struct hal_rx_desc_XXX or inside the struct rx_msdu_end_XXX ?
> >=20
>=20
> Either way, __le64 msdu_end_tag is part of the msdu_end because=20
> ath12k_hw_wcn7850_rx_desc_get_msdu_end_offset() tells the=20
> offsetof(struct hal_rx_desc_wcn7850, msdu_end_tag) not the=20
> offsetof(struct rx_msdu_end_wcn7850 msdu_end) in the=20
> ath12k_dp_rxdma_ring_sel_config_wcn7850() configuration.
>=20
Yep I saw this part, for me it accentuates the fact that the msdu_end_tag i=
s not
something that can subscribed out of in wcn7850, as it is out of the struct=
,
but can in qcn9274.

