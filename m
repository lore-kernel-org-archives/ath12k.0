Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88147C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 09:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WK4hlBESstsIUX+zMhngFDheN5gnJTFx66i5y0Tzm4=; b=yhsFGolBHiFDjYWbreCPCrwINg
	TN35AiIqSL95V7XcNmlKyTztjI4SlEER/Mpu+OMvU3vtML03T+fcMRyg499NPFMR2PmyvmzaEaUPl
	4IPNXPBP2h8Ep97XdwauCvRbEuppA/XIehvvLHGWeTwnGsF5WcA9963NCyXzyb/D2hvaCQrQUyD3j
	uAxSIHuWiHIvsOmS/trjJ89K7Nz10DkZE20iIh7rgwNYu/SqJ0cty/ExjhXVALORyvGu3NcfPbQ3f
	Ulqz38LM4NnXDGNbn74oI3EIYLfLNkLTZH+ekoVvRKGWURPacNJcA5oeZzto+J6yKyWBVAqRBj8y4
	QmbRZytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvD8Q-0000000GQky-129t
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 09:23:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvD8M-0000000GQj8-3AEA
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 09:23:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-417c5aa35f6so5443775e9.3
        for <ath12k@lists.infradead.org>; Fri, 12 Apr 2024 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913824; x=1713518624; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WK4hlBESstsIUX+zMhngFDheN5gnJTFx66i5y0Tzm4=;
        b=CsoybkspunJxaqaXvn3LLAizcQtOxFe5XF+hJsfMiWzRRi63Qib+i2jfA4k6K6v6QZ
         ljaxvwx5QpvNmviau7P7xBBiQvypgbzA2oYxxA6F2tz1R0R76EWPjFc3aQGdW8ffKg8T
         i35kWT7UVUhdIcpoh8bqjIhSQAdZU3bDa1Bema29ZqZSqouQjSqs82PMlVPIWX3d17KD
         WGPavOmWZUWWQt/Dl/QRV+bfza8SPseAvTmOIs8cyQVN3TZM5dFDNvX+XXYdx1xJgmUb
         5cIasta3iG4XWIOcnb5Qsqv9qbqylz+zl+IBOM8wuHNLDk/ZnwbX2jsydyJv3zLtudMj
         PxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913824; x=1713518624;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5WK4hlBESstsIUX+zMhngFDheN5gnJTFx66i5y0Tzm4=;
        b=MXC8JUCk89R5SKnn8tPasWJkDL44bOD7AwOHWq6ftVFqrjZofwskUZhQg5eGGIwCj1
         VHmulrkWH93ipxvDnVtdeuorCxiUB0k8aiSApPgSn9/b+xlSWEVE+FX40FyMClhtZZ93
         QTrYzc24Ji7tRAW25O8C5cBEAIEKGRzQhebsBp06DsGaT8/f11d4nqIQr7UYhdDRn/p0
         Dn8flwBfF3jM7QpfoiYoZgYB3Lx3gXjJF4J03xiZ97H/7RV1QgDkiyDaz2pxhz312wel
         nj0PQnYhONzxIbg/Nhxvg2UC/adaake3VuVPfEx1dmYSHy1oN/iSaV+BqXrfbw2kxqAd
         6Njg==
X-Forwarded-Encrypted: i=1; AJvYcCVEzB/WBk7umBJunKVY7WZDG7g2G3HlH2DaDPQZtH0zHyQU5s/qejNcX5BUiAEMBARi6UYbVjH3EB2XIJCsoLvJpiZQLG45JNJh3w==
X-Gm-Message-State: AOJu0YzkT0aJXxZN9eGbPxn+DXKngfDHYRMc+aH0GFV+0Lbmz0sURCb8
	bXytHBYvwxKhOQMYffZvcPRe2swaLXi5rjdek5f/l8OS60U9m4nI
X-Google-Smtp-Source: AGHT+IEfd/dQCgUdBpBoWhvCRuRFjBhFLkkyqmM/3BxuR9AAjM3dJ0VKTDcop11fx5p2PgRYfU9Tjg==
X-Received: by 2002:adf:e2c8:0:b0:343:6e18:5f09 with SMTP id d8-20020adfe2c8000000b003436e185f09mr1261070wrj.12.1712913823801;
        Fri, 12 Apr 2024 02:23:43 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ea15-20020a0560000ecf00b003438cc1d2b4sm3812598wrb.59.2024.04.12.02.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 02:23:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Apr 2024 11:23:43 +0200
Message-Id: <D0I19V0104BZ.IN8THB2XCFLV@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: add support to handle beacon miss for
 WCN7850
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Kang Yang" <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240412025149.1211-1-quic_kangyang@quicinc.com>
 <D0HYXSPMY8JE.17YSACO3ROKKZ@gmail.com>
 <6ee5664b-997b-45eb-89f9-5f75708c268a@quicinc.com>
In-Reply-To: <6ee5664b-997b-45eb-89f9-5f75708c268a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_022346_816191_68C84DDE 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri Apr 12, 2024 at 10:47 AM CEST, Kang Yang wrote:
>
>
> On 4/12/2024 3:33 PM, Nicolas Escande wrote:
> > On Fri Apr 12, 2024 at 4:51 AM CEST, kangyang wrote:
> > [...]
> >> @@ -5986,6 +6055,20 @@ static int ath12k_mac_vdev_create(struct ath12k=
 *ar, struct ieee80211_vif *vif)
> >>   	lockdep_assert_held(&ar->conf_mutex);
> >>  =20
> >>   	arvif->ar =3D ar;
> >> +	arvif->vif =3D vif;
> >> +
> >> +	INIT_LIST_HEAD(&arvif->list);
> >> +	INIT_DELAYED_WORK(&arvif->connection_loss_work,
> >> +			  ath12k_mac_vif_sta_connection_loss_work);
> >> +
> > Is there a need to move the following part ?
> > Isn't just adding the delay work enough ?
>
>
> Just checked, you are right, but should add delay work in add_interface()=
.
>
> Will change in v3.
>
>
> >> +	for (i =3D 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
> >> +		arvif->bitrate_mask.control[i].legacy =3D 0xffffffff;
> >> +		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
> >> +		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
> >> +		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
> >> +		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
> >> +	}
> >> +
> >>   	vdev_id =3D __ffs64(ab->free_vdev_map);
> >>   	arvif->vdev_id =3D vdev_id;
> >>   	arvif->vdev_subtype =3D WMI_VDEV_SUBTYPE_NONE;
> >> @@ -6316,16 +6399,6 @@ static int ath12k_mac_op_add_interface(struct i=
eee80211_hw *hw,
> >>  =20
> >>   	arvif->vif =3D vif;
> >>  =20
> >> -	INIT_LIST_HEAD(&arvif->list);
> >> -
> >> -	for (i =3D 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
> >> -		arvif->bitrate_mask.control[i].legacy =3D 0xffffffff;
> >> -		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
> >> -		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
> >> -		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
> >> -		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
> >> -	}
> >> -
> >>   	/* Allocate Default Queue now and reassign during actual vdev creat=
e */
> >>   	vif->cab_queue =3D ATH12K_HW_DEFAULT_QUEUE;
> >>   	for (i =3D 0; i < ARRAY_SIZE(vif->hw_queue); i++)
> > [...]
> >=20
> > Thanks

Yeah, I wasn't clear enough, I meant adding the INIT_DELAY_WORK without mov=
ing
the rest of the code around.=20

Thanks

