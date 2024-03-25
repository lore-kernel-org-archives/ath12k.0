Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C6DC54E64
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znZHaLOLRC7Gxira/Kxuyrf6Ed63u0+G81ppnj1sNxk=; b=g0wpMgCrrR5arumEI1Ub0W2NSk
	7jnH1rquucN55xI6O5R08MTqYjQ6O78TSrzeFRPTcUjeIAo9ZZBNVHZ5KybqG6UoSNfkAu3QaSZu4
	ORmIjh01SnwbgxOvrzKxKzmPsBIFS80hvQhGUdwCRtn3JD6uji5tEcwBefR1O6IIWvniKLwetbmWC
	KAcFe++jitufQImDnyvvtb4iTzRa+kjLHtrp6NFhlsHM9Xmskyg9gITvHrLhv08crJ93UGZDZIWcf
	dPoeAE8zhJmcR02hYkjXzKYE3n3CU7SIRmIe2MZ+9DgBParkT1QZpI0TzUso9sc2Fwv/qjduhR93A
	rwIdedpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rolwB-00000000P3E-1P2G
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 15:08:35 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rolw8-00000000P2M-2Ypy
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 15:08:34 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-513e6778112so4087528e87.1
        for <ath12k@lists.infradead.org>; Mon, 25 Mar 2024 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711379309; x=1711984109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znZHaLOLRC7Gxira/Kxuyrf6Ed63u0+G81ppnj1sNxk=;
        b=f+gLuA3wESEAq2ymLKBPN3ncV3oMgbSNUiYE4SaWpBpPlHdfjeeeYrSURTQUr13zw4
         dKwYi4Rwzm1SJHqTHrlWwJSUHVbLKXKX/aRorCTgh4tJ/LgMteufs6cFWViYeiSliy/R
         fmnQ6qTF8QBiko+g+EoNa18XtDkU8im9Ssi5kJE/L/H4Y5RFYfADxP66u1HzIwXO5Xnd
         unhPGL2dhI87RSkZARMB39JqWiC1jBue4QnIKxoywYkbVPES72gGfnbaTW12GoLkJgjL
         5aVXwUjOJ3NRagRtQAAMbZC0LQWU9Ohb4MiF/g2rs+dVf+0M/AFBSI+uHfmO2ioHxBFx
         URpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711379309; x=1711984109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znZHaLOLRC7Gxira/Kxuyrf6Ed63u0+G81ppnj1sNxk=;
        b=wbEOz2p/4dwVeBSOGiFAHrjaUMmeDWZQbGRKNTjFJO7QJNTNg4zu1ItpjKcv1zz4IR
         3ylcyfYdsguqFm+AUcJrtVkGbkJzhCBfktBpH2RFyXv952J8lN5DgyIKR/2nkpH0tPp3
         bFRtoQEQ6VF78xSvL7SEBFBhvP/kRq470InAOu+7igKQZe22+lzgglKj7TXy4BjfiXvr
         HNo2ty8/CFRR+n1Ii560IvkS0tSEia6VXeQE+JXl97LY0LJuPC6bzswUO2xXrmdoutxk
         ub5LIpLpGFS/g6WFfflySeSJNiEAsnHOGPyDuVXruk6chLOrYO92B3RehjO6CGJdj+Ro
         r77w==
X-Forwarded-Encrypted: i=1; AJvYcCXCWh26FfRCxXof3cB8V4QJZ6Oqo43tZpwpmcEhp4f2co6IOGyZB7ymPHsj1nzjdttC1ppxbOVdeiOixEe7d/p/3hCASs7Kf/eaXg==
X-Gm-Message-State: AOJu0YxBNMRf26cStWdXafKgnbAwU6Nh1y12qd3uXBNi/OaMUSWN1ZH2
	ia8S2ka/iaO5n6XojFkByObpW/kxLfi2b6065vt49dRska/eWSQC89GX/biPi4dZEssYpaxIonZ
	1+zqwUpEKQ4I4lTd+oEbDGquP9+N2HK50g2PBCw==
X-Google-Smtp-Source: AGHT+IFKhA4zzmMPppSkHUYWQNC6V+YPITuTresML+CCzLpkPfVRtOJNgu2LLjO8l0Fgj/nRGBOKP0bG1x5EvoYqtcM=
X-Received: by 2002:a05:6512:224b:b0:513:d7c5:9bc8 with SMTP id
 i11-20020a056512224b00b00513d7c59bc8mr2549524lfu.30.1711379309327; Mon, 25
 Mar 2024 08:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com> <CABymUCN0c9HK3vC3ZFxfXkV9Ezcqwq41J4vGSkpsz09sMDL8rw@mail.gmail.com>
 <CABymUCMsHDViQ=qfyamdkpTutrXoRuhto88iQsRo6TcgDKnWZQ@mail.gmail.com> <91902c69-6a51-43f9-8124-7b19c4265b22@quicinc.com>
In-Reply-To: <91902c69-6a51-43f9-8124-7b19c4265b22@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 25 Mar 2024 23:08:17 +0800
Message-ID: <CABymUCM9fSG=Mh1AFiAy-sWqtUH8_spnY=x6FiSTK3MbWPc32A@mail.gmail.com>
Subject: Re: Performance of WCN7850
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kvalo@kernel.org, quic_periyasa@quicinc.com, quic_kangyang@quicinc.com, 
	ath12k@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_080832_692905_31E001C0 
X-CRM114-Status: GOOD (  11.87  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> =E4=BA=8E2024=E5=B9=B43=E6=9C=8812=
=E6=97=A5=E5=91=A8=E4=BA=8C 01:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On 3/11/2024 2:19 AM, Jun Nie wrote:
> > The latest finding is that 6GHz TX performance of wcn7850 is as we talk=
ed about.
> > But the RX performance wcn7850 is better than 5GHz case. So the directi=
on
> > impacts a lot. Not sure whether the bottoleneck is in scheduling side, =
or any
> > configuration on TX power.
>
> There is at least one 6 GHz patch in the pipeline that should be posted t=
his week.
>
> /jeff
>
Hi Jeff,
What's the performance data with the patch in the pipeline? Is it
possible to have a
early test with my hardware?

Jun

