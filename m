Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AB5C47DD9
	for <ath12k@archiver.kernel.org>; Wed, 28 Feb 2024 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5XsmweTKP3louEzKDIUjl5CVChzRxSYXk5moF7z7FA=; b=Sa2f8z3qsbZzOS5eddbil5v2MP
	IeEZ4NQlu0zhQsc45hJ+FKd+fbm6oM50lPyNaxXH4PScWFIild0EvOr0rDszQNXpMIg3FAJb8PrYm
	h4vf1e4RSIxldrkCEoJVFZyuslKUK4WmTrVdC9aA9vKa6/uTI8pSpfLQrBjGMt3B3wTvGNWXiYbxW
	RkbxaIRP6WUHDC+r0f6dmAFs6Nd96gdYznci4WuIzfBPrEzIBqa24oTrIPv3qp5u/d7iPQ0eBR0fn
	dlOMetSmlNEe1OygSEk2u/k5RtPUOTKIk/IWiBJ3C3wmjbkQnekMrc5p5nCO+rt1CTKUtWckipm+r
	L4xaK3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFfu-00000008YKq-0F39
	for ath12k@archiver.kernel.org;
	Wed, 28 Feb 2024 08:52:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFfq-00000008YJq-3ltQ
	for ath12k@lists.infradead.org;
	Wed, 28 Feb 2024 08:52:24 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-512b3b04995so5258480e87.3
        for <ath12k@lists.infradead.org>; Wed, 28 Feb 2024 00:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709110341; x=1709715141; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5XsmweTKP3louEzKDIUjl5CVChzRxSYXk5moF7z7FA=;
        b=VFw+maPOwG4PfM+D6a6BOrsxAJi7nMmDFhlUoYJTNd2F3fiqvHjhDIlen7afbpgLRC
         NG0cU0rDc+OdPdekPl5S/NCLQ4gZf7yGzc8Eiqa+kV1r9vRkQDqdI+NLcfV5qPCwSeZJ
         zU6NUViaDAJVmWrNLayLKWghjxJFqNN+CYjLyEi8EEJrqd+sdygLtL+uVk48cu9utH/l
         GPgiDhr2xSt0g5munQpQ2HnKMuf0S12wkkJAc9h854zqHDoIZymwOjUZHF5CU2mRqcQX
         +py+EJhmjNoPHNzSMkmOzuC2mhsHHvN3q6UOVSpoVGTHKzgD1exwsPZ+mj6TYkkuH7Bx
         IHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709110341; x=1709715141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5XsmweTKP3louEzKDIUjl5CVChzRxSYXk5moF7z7FA=;
        b=CZMvedBbeWB6ZLAzicEjn1k395Ys+2cbcbymrdDC2r9cwyr0++hbYU2TVoSwTOxoWT
         ctmCvXE2Kjdbg37tKaCrs7sB493K9Ibx33nQ4NcUta9GV+9MyXYkvX3yspmeUVcAxYvU
         693zVjLextWbQAaTePkxtRmrnODgA+PgcLUdKNSe5baIhcZb+ALyBFvQKfABF1eAlDvj
         qVmHTl9qVhpmsyv6CU4u1RLMGnGBPajyilaOBpd8+rbptyggbWIFth5JTxVvvZxvd6SW
         YaA1FvhXzoKDKgytEOQI13ZiOOhEcrhugXaKSWGTWuPFhYPjCZ93/zQKU+S113BmmrK4
         5Hqg==
X-Forwarded-Encrypted: i=1; AJvYcCV/MFqWRUv6oIUYt2L0Beb3kWYNz0PjDRJHmvwgwujOEGus8l8Txq53//MD3Mpkt82AuyioJOtPtUzvonDLLTaLCa98gIgrnf/N6A==
X-Gm-Message-State: AOJu0Yz9aOv7hf+PPe5Ny7sAvDC9kP92USIRwFsq0cOdq8L3IhL3lD0o
	TWqyaRtjcHLoTn3HSA+PNcztHi8gYThjTuZ8AwhIVlN+QMm7XKpvoMi/qIjrww299yxqnhUwA7M
	djkiK2IeLQlT5B4/WQXy1UfiuypjdYuNR/81Uag==
X-Google-Smtp-Source: AGHT+IFONBoMo5U6Y1TN1/8sRPOE1CyDtMfitsBZhK3NpY8PN5fTGSfv6YlgWqeGu3dUmk5zVNDh9iKPPeVfuJqs7tA=
X-Received: by 2002:a05:6512:4005:b0:512:b3f8:81d2 with SMTP id
 br5-20020a056512400500b00512b3f881d2mr9914038lfb.12.1709110340890; Wed, 28
 Feb 2024 00:52:20 -0800 (PST)
MIME-Version: 1.0
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <6a5b62d3-d807-4fa0-91e8-fde93d114b36@quicinc.com>
In-Reply-To: <6a5b62d3-d807-4fa0-91e8-fde93d114b36@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 28 Feb 2024 16:52:09 +0800
Message-ID: <CABymUCNYBMxzQ_BUObU+mKaDVo0uYpH8pkVn9=Rry6L+FA6TRA@mail.gmail.com>
Subject: Re: Performance of WCN7850
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kvalo@kernel.org, quic_periyasa@quicinc.com, quic_kangyang@quicinc.com, 
	ath12k@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_005222_963979_4517346B 
X-CRM114-Status: GOOD (  21.02  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> =E4=BA=8E2024=E5=B9=B42=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=BA=8C 23:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2/27/2024 5:54 AM, Jun Nie wrote:
> > Hi,
> >
> > I am trying to maximize the bandwidth of WCN7850. Does anyone know the
> > performance status of WCN7850 in mainline? It's about 160Mbps in 6GHz
> > band and ~600Mbps in 5GHz band on sm8650 platform in my test. The
> > firmware is from below links:
> > https://github.com/kvalo/ath11k-firmware/raw/master/ath12k-testing/WCN7=
850/hw2.0/board.bin
> > https://github.com/kvalo/ath11k-firmware/raw/master/ath12k-testing/WCN7=
850/hw2.0/regdb.bin
> >
> > While it is ~940Mbps in both 5GHz and 6GHz band with
> > Android/linux6.1.25, . But the firmware names are different per log,
> > amss20.bin on Android. Not sure whether the driver is totally
> > different for Android/linux6.1.25 and mainline.
>
> The drivers are different. Android uses the out-of-tree qcacld-3.0 driver=
.
>
> > Do you have any idea that the low performance on mainline is due to
> > driver difference or TX/RX power configuration, or firmware version?
>
> My expectation is that the upstream mac80211 datapath will never achieve
> the same throughput as a custom datapath. That said, the ath12k driver
> is still under very active development, and performance tuning will
> occur in the future.
>
> /jeff
>

Hi Jeff,

Thanks for your input! Do you know where I can find a tool to tune the powe=
r
level of 6GHz? Seems that below patch supports it. But I am not familiar wi=
th
WiFi software actually.
342527f35338 wifi: ath12k: Add support to parse new WMI event for 6
GHz regulatory

I suppose performance of 5GHz can be aligned with 6GHz, even they are worse
than custom datapath in Android. Is this the right expectation?

Thanks!
Jun

