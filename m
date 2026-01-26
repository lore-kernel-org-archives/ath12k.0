Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68683CF65CE
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvc4mcNxQ2S7z08pggxNBkVI5iQmFZjLgi5JVTmtGX0=; b=p2D+hqtI4ltG4J0lEs+gwmJ3FV
	An5cSL14oep4T1Z8RYDjuUGtBJdVr4gf5WLqydvmmQIqrtgB9XqMZaOtF3hGof/19eWK3XuuTzGC2
	v5MHulkC5ROEoANpXHvOA/yH6saoOjw3o5XBsqmw27sTUH2FgCMpG+z7tEiW6V4kbCrMOUrKqtEN+
	zEycd8prbiSUnmITTIYv3NCI959tpK1T+nULaITU7JitoiUnz9IhMH4tzegmhEie6ebiTi54ZCeCZ
	6ivJRIS7kLGrZo0miRFMEdB5P3Kc6Q/4STKDl9C82ieArmzQaaV3r5R8VtiacodSPIrxDEGw+SeQB
	lb35j/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJZK-0000000CFrq-0fId;
	Mon, 26 Jan 2026 10:11:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJZH-0000000CFrU-020X
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 10:11:36 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b87003e998bso932143366b.1
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 02:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422292; x=1770027092; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvc4mcNxQ2S7z08pggxNBkVI5iQmFZjLgi5JVTmtGX0=;
        b=bWjMoYMd1XprB92hAWlrfeUAjY6SkjtyC/7SbbLiJqxrlIr7aW79s3SzOfud806isJ
         V4gCdlc4EG/dnlYMD4tpomb20gVQMRCyHQjqaG6Va3XWCl3jZil6PGXq29W7Y0oRcfjV
         70/vF159bHtU2DNkACFc/KndZKTaQunk78zPLV/8UDXISJJdIx33e/uOqtF3exAnmHEv
         sECfRYP32oFoC8EqXIBm5+Czx/oQ7BMpiuD7pUufn/HGCULMoA0qNkQaBrO4hqE/x+j+
         qOXOgK/1436UoDwT0LoJwdsrlKaSSyRzYrKYF6ZxjqIU/71yvHiOiYPtCygz5F/Ohzg5
         gceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422292; x=1770027092;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvc4mcNxQ2S7z08pggxNBkVI5iQmFZjLgi5JVTmtGX0=;
        b=lwCcjZ5EigfNWHBHSuaNM3Zx4PFTuSQj4zSvd+F2KtCwZDTf59s+0Wwj0nlkbqMwYz
         qWEBJ+DquooKGaEEIn5e+dFg7H7PzxrrN3SlLo6p9zLrLz0W6q2uCu0u2yN0Jh3901cn
         bsOg/njZJ0eimng0od+idU5lb1cnbnJz815M6gBi0txXaXPSWWsNBK9r1pBt3TG4+xRl
         CAV/L9Zv6WNzjkwSRu4357tZLpTUkrTBjH5DL4oSh2nHDb7KvGbsP0/DYlk1WVu0k7Ki
         7Uo8gyA1gZsizKoqgGh8YVw2rxrYvhURV6vlH8qhlf5nLAjHoSYztaqu2ih+KjbJVXtf
         tmjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxci9Com0NdnOKv5IXdqdBl7XYuAPXSRr2X9pL4yl8LnSEQXSpCVuRJiOzIUxLsCn4g7XPdqU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQKIUs5paexfwnDGa/QSvxyYZlqi1L3+OKQXU8wu9tTfc7iMyQ
	/TpjbEyzYtixa3qqegaHIbU5bUGzEP7E72AK88/JOvVwmFsqO9VjGvAt
X-Gm-Gg: AZuq6aLgTETOci8FwYgeJF/73DZ/5jSF6RwSKNCZpSJyEP1PHOzhjzfw1QziKJtZ0vT
	FhL2fKlAMwrscDM2QJp+hrbty+ucr3Gqp0MK/ZHDCxqNuV3MlJfLl7tbJ96vtb4yT6NDJC1T2Y8
	waN8DVhgvGtL8LExkbcffuD+UBZ6gAHyZunsVUeuhUBdnh/KzQ2RsbjXrm0Zv86+DppwjZpW0zI
	R8FSVmYdycVV39Fm4LJ31SP+BVaX0C/iCDqfTLSpeF3aqO9YJUFfGWenWZhS2GrVU/nn9xm5ZqW
	pplhJZnjBEA1A0u5nCBBWkX22Mi6tHd/xnyALuajKJIKCYL4whRSbNIEF50J8Jw85kc/JFtGPRb
	PxPxT3pfljqaQAP4WqsjSzORu8mI7OfK4+rfkLvVjmGNdJUmkPNt8Y22TnsoxPcRgB6QsNQMfxI
	cvNA0T63nZffzAr6h7dJGapH3JAJ2WIA==
X-Received: by 2002:a17:906:6a0b:b0:b80:40ea:1d65 with SMTP id a640c23a62f3a-b8ceefeb05fmr315527566b.31.1769422291853;
        Mon, 26 Jan 2026 02:11:31 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7b1a7fsm597126266b.58.2026.01.26.02.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:11:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 11:11:30 +0100
Message-Id: <DFYFUQNL5YRY.24VJC5QJMQFVF@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Johannes Berg" <johannes@sipsolutions.net>, "Pablo MARTIN-GOMEZ"
 <pmartin-gomez@freebox.fr>, "Nicolas Escande" <nico.escande@gmail.com>,
 <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid setting 320MHZ support on
 non 6GHz band
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260123144224.2216923-1-nico.escande@gmail.com>
 <d26ee979-b5d5-4f50-b423-f8783122f603@freebox.fr>
 <bfed10db742d29f0609acb04d3354695f87b24e2.camel@sipsolutions.net>
 <b0e79f6c-36d7-4e49-9d43-8e305a598201@freebox.fr>
 <26bfd810c1dabc9ed86d4ba68cd20f6434c1d3a2.camel@sipsolutions.net>
In-Reply-To: <26bfd810c1dabc9ed86d4ba68cd20f6434c1d3a2.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_021135_084097_BB792210 
X-CRM114-Status: GOOD (  21.11  )
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

On Fri Jan 23, 2026 at 8:29 PM CET, Johannes Berg wrote:
> On Fri, 2026-01-23 at 20:21 +0100, Pablo MARTIN-GOMEZ wrote:
>>=20
>> > > > +	} else {
>> > > > +		phy_cap[0] &=3D ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
>> > > > +		phy_cap[1] &=3D ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MA=
SK;
>> > > > +		phy_cap[2] &=3D ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MAS=
K;
>> > > > +		phy_cap[6] &=3D ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
>> > > > +	}
>> > > If you want to clear all 320 MHz fields, you'll also have to clear
>> > > IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ and
>> > > IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ (not sure why it is not =
done
>> > > in mac80211)
>> > >=20

If the QCA guys are interrested I can post a v2 with the additionnal bits a=
lso
cleared.

>> > This is, effectively, a firmware workaround. It doesn't belong into
>> > mac80211. All other drivers just have their capabilities managed in th=
e
>> > driver anyway.
>> >=20
>> > johannes
>>=20

Yep you made me realize that. So I tracked how to fix it in the underlying
driver and posted this patch.

>> I wasn't talking about putting this patch in mac80211 (I've seen the=20
>> discussion on the patch Nicolas sent on linux-wireless), I'm talking=20
>> about the function `ieee80211_put_eht_cap` clearing the Beamformee SS=20
>> and Sounding Dimension fields but not the Non-OFDMA UL MU-MIMO and MU=20
>> Beamformer fields for each bandwidth.
>
> Ah, you're asking why mac80211 doesn't clear those bits ... I guess it
> just doesn't matter. If you're not on 320 MHz I'd guess the bits are
> never checked, so it's not really relevant at all, although then could
> argue that you only need the first line here as well.

I you want Johannes, I can post a patch that also clears those bits in mac8=
0211
>
> johannes

Nico,

