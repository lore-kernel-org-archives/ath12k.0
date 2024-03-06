Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F0C54E49
	for <ath12k@archiver.kernel.org>; Wed,  6 Mar 2024 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojQBMD9hihuuk3uM1cvdYtbunFwc0pJqquQHGvd0ZQ0=; b=BXyRt8Ao0tHCfD2RPM6piId0VF
	fvUrAoUkvCri1UFvfYVmaMLmeeNgbTbSyj6kR6Gq7xBauUGCI7juWnRI7ivAQROsHM9jAPcZAsKiN
	1Jc2h2WENCfO5U4L9B/1SHU0os+CYE1WdxskXA/iCyQVEeA0KlPpQ0JvJBFymW2MfFS2wNOYW3aAm
	LOkAGilKddodTiPArLLOLN9A/p9DA/dXjROZ9VAz9ynuRDkfWRkA3dd3QT983GSbLlOgD++SnIxk0
	S30mZh8X3urYU6rTpb+XCZuWWDACgsOjugNHbUFmNGLE7BhSYOX3JdwaLHR7H5Nhpaf8tjHpJifTL
	UNFOVKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhgyf-0000000Fz7E-0ngm
	for ath12k@archiver.kernel.org;
	Wed, 06 Mar 2024 02:25:53 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhgya-0000000Fz6Q-3aNK
	for ath12k@lists.infradead.org;
	Wed, 06 Mar 2024 02:25:51 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5133bd7eb47so4698386e87.3
        for <ath12k@lists.infradead.org>; Tue, 05 Mar 2024 18:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709691944; x=1710296744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojQBMD9hihuuk3uM1cvdYtbunFwc0pJqquQHGvd0ZQ0=;
        b=hCuMrH/bHX/FrqEc2YImke9SQFJKgNuBxvmsBLlnQseALaWeuSJDnLzVmfsYMUk/mZ
         Z8P1ZTqfK1vyESXvw/qeGgNSWtY89FSc1iKKSIdP3W+Q7JcqrsViQriiQk8XwJ44Krc8
         RQ5eAK1YHKxmhaDYtWIvzyh4rmIzn2kEuwObIrb4M+EpXkUUiZyNPXizU9pKfGbYUvQN
         Y/KyKA6I0fgbraIQsIWWEsb9oiwzMsKqn6uVgQwP0KYGzPtZlLOHBvxQkL1RCLUhtj9T
         ZblLscb4pm5PR0dBhgreUyu+SWx16JVC601Vutpeb6PK9NBuOqPJXox7HYFEUd2GIhQ7
         meow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709691944; x=1710296744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojQBMD9hihuuk3uM1cvdYtbunFwc0pJqquQHGvd0ZQ0=;
        b=nbKTJrcv+a6oADBj0Ptj++vJgU7D60WLA0YQheHCmwzdZCUiqKSjgQEUljV/oDihSf
         J/taX7l6chAIQEFld3/zgE+R2LFAYbSNpsrJOsXkX7QaJw5kaqQH3JtCS+tWZgG8FWG6
         Jo83QbblBwbbEFFBio4yXX0b+SqHj/3bedJO8PIdj2LG0niQhPSoN8vJdCJK9MQMQfZq
         FTQpEfssJ/I9DmlVEqSGwGLNpqAKYZxmD8mJmEBeUhzF69/imdSXFYMFUKgy9Wug0uLc
         SsUQ9CVeA/fwoI2WQLr0Fu2O7UvVUQhgdv1dyvRTUN8aKDj/P6DfXZxVqye7PzrYSXHo
         GPUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/pdNWASOTnFBOGemFLwbKEwj9B2fxta/dtQcTXCJX60KWK8x3ga+ahQ2PzY2HGVgedLzJ5rRaLIJBD6ZgqdeVV+Vy7SKluPZHwA==
X-Gm-Message-State: AOJu0YxM0Gh36+vYTheVO3OaOqeFFjFYiQBitExpMjR59Ngua8t7hTpm
	kx7rkyUzoutfLvlQDv085+wcv/P03JqXj+sBswvlDFKxMaRreckG6tZ8FxbLIlLDLUWTdn69Y1y
	Pqa68r8fB+gJJdSHJ6LDERZ5M8x5PAEpwSpUdQQ==
X-Google-Smtp-Source: AGHT+IHvEO6/ztilkYIyIWPuTZ/tPvwCf4civ/q3Ep/pDHoTdqCQEzYqnlmPLpcNCLUv1Y8LK1PGlnrwJAOv8GJqQgY=
X-Received: by 2002:a19:ca03:0:b0:513:172d:5b46 with SMTP id
 a3-20020a19ca03000000b00513172d5b46mr2279644lfg.39.1709691944453; Tue, 05 Mar
 2024 18:25:44 -0800 (PST)
MIME-Version: 1.0
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com> <CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
 <25c22014-bb26-414e-a29f-8ed97c1ef465@quicinc.com> <CABymUCMntFfKPRZyv+PzmNB3WejG7v5Y1-AYhXRK1o++U_xnRQ@mail.gmail.com>
 <aa92159e-d2e3-44d4-8514-2c81591cff31@quicinc.com>
In-Reply-To: <aa92159e-d2e3-44d4-8514-2c81591cff31@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 6 Mar 2024 10:25:33 +0800
Message-ID: <CABymUCM-9a6z-PPYm=HaUREZ4rjxaZtqxZB7Via4h_vM2wK2QA@mail.gmail.com>
Subject: Re: 6GHz AP association failure on WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_182548_976950_CAE57711 
X-CRM114-Status: GOOD (  23.35  )
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

Kang Yang <quic_kangyang@quicinc.com> =E4=BA=8E2024=E5=B9=B43=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=BA=8C 16:30=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 3/4/2024 6:14 PM, Jun Nie wrote:
> > Kang Yang <quic_kangyang@quicinc.com> =E4=BA=8E2024=E5=B9=B43=E6=9C=881=
=E6=97=A5=E5=91=A8=E4=BA=94 19:42=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >>
> >>
> >> On 3/1/2024 5:14 PM, Jun Nie wrote:
> >>> Hi,
> >>>
> >>> I see there is association failure many times when I try to connect m=
y
> >>> 6GHz AP with latest mainline Linux. Does anyone also observe it too?
> >>> Any newer firmware than WLAN.HMT.2.0-01734 is available? Or we
> >>> recommend any specific version firmware?
> >>>
> >>> The issue only happens with this version firmware:
> >>>     [    9.441624] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw=
2.0
> >>>      [   10.058822] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family =
0x4
> >>> board_id 0x3d soc_id 0x40170200
> >>>      [   10.082876] ath12k_pci 0000:01:00.0: fw_version 0x200a06c6
> >>> fw_build_timestamp 2023-09-20 03:43 fw_build_id
> >>> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.2.0-01734-QCAHMTSWPL_V1.0_V2.0_SIL=
ICONZ-1
> >>>
> >>
> >> Wrong firmware.
> >>
> >> We use WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 and
> >> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4,
> >>
> >> https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WC=
N7850/hw2.0
> >>
> >>> I do not see the issue with firmware:
> >>> [    7.896737] ath12k_pci 0000:01:00.0: fw_version 0x1005bc12
> >>> fw_build_timestamp 2022-10-11 12:13 fw_build_id
> >>> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SIL=
ICONZ-1.15378.4
> >>>
> >>
> >> That's it, i recommend you to use
> >> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3. It's new one.
> >>
> >>
> >>
> >>> Detail log can be found at:
> >>> https://www.dropbox.com/scl/fi/jgn1zbnw44i1vypbjxl0v/ath12k-6GHz-asso=
ciation-fail-log.tgz?rlkey=3Dpg2ifnzcttzimz7vaxb7tuc6w&dl=3D0
> >>>
> >>> Jun
> >
> > Hi Kang,
> >
> > I see wlan0 failure with below log with firmware version
> > WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4.
>
>
> Can you check if you completely replaces our upstream version?
>
> It is best not to mix it with other versions
> (board.bin/board.bin/regdb.bin/amss.bin/m3.bin).
>
> Mixed use may also have an impact on throughput.
>
Yeah, tried to replace all binaries from below path, but no help.
https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850=
/hw2.0
https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850=
/hw2.0/WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

What's your test platform? I use sm8650-hdk. Not sure whether there is some=
thing
platform dependent.
These binary was tested OK with Linux mainline on some QCOM platform, right=
?

>
>
>
>
> > Do I need any patch outside mainline? Actually, I add below 2 patches
> > for 6GHz band.
> > afb7a22d9e22 wifi: ath12k: build 6 GHz regd based on vdev type and 6
> > GHz power type
> > 6c60469f0bae wifi: ath12k: add support to select 6 GHz Regulatory type
> >
>
>
> If problem still exist, please revert these patches and check again.

Reverting them does not help as expected.
>
>
>
>
> >
> > [    6.194535] ath12k_pci 0000:01:00.0: setting mhi state: INIT(0)
> > [    6.195067] ath12k_pci 0000:01:00.0: setting mhi state: POWER_ON(2)
> > [    6.195069] mhi mhi0: Requested to power ON
> > [    6.195083] mhi mhi0: Power on setup success
> > [    6.196541] mhi mhi0: Image transfer failed
> > [    6.196559] mhi mhi0: Reg: ERROR_CODE value: 0xef128100
> > [    6.196574] mhi mhi0: Reg: ERROR_DBG1 value: 0xff7fc000
> > [    6.196588] mhi mhi0: Reg: ERROR_DBG2 value: 0x0
> > [    6.196601] mhi mhi0: Reg: ERROR_DBG3 value: 0x1988
> > [    6.196631] mhi mhi0: MHI did not load image over BHI, ret: -5
> >
>
> BTW, is it a probability problem?

It happens 100%.
>
> > Kalle,
> > Thanks for the reminder of attachment size limitation!
> >
> > Jun

