Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE3DC5478C
	for <ath12k@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbw+0G/oi4YCCSNdk57A1SMXxRdQU5Z8vIcRhKwpQ2M=; b=ab/yCo/26yqWKyAjvzduXMl2Zj
	CGXBeFhssJRuj7scgsQHXHfGOwkfDfVAhwuzy3SbvPbIrstkh0OGbXSXdeuq3NBAxY5NdUvXVlXwe
	+UryU3m8fHC+MTv+0v9x3xAxc5X1pOdjDyTt2Gkt5O8UK7C5F8YXjeB3N2ziYdKemUF6zKYESEFNG
	sI9dYmsMBbNsGt43IIzT0Xw7IAaPKH7yddkKQI/GYSN/ZrWwgHk87E+Jxi5GSuLvLlddNBVIIEj4n
	ASEffffopj5DE1lhL399ZHyaBlU9TEkjvcXnABRkN5zbFa1wtmplWcMvh3KYMZf3Eq0r1eHOXe2hc
	qqekNBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5bL-00000008czs-2G2o
	for ath12k@archiver.kernel.org;
	Mon, 04 Mar 2024 10:31:19 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Lm-00000008Yg7-3Zmt
	for ath12k@bombadil.infradead.org;
	Mon, 04 Mar 2024 10:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nbw+0G/oi4YCCSNdk57A1SMXxRdQU5Z8vIcRhKwpQ2M=; b=M40wbfwCMj185n/Q651RZNll6d
	jXt1R4qtrXpBY5vDDaFrrAVSYQ79KdJzavM43G3PJtbD5Tko7MuS/Sw2TrtTsS9E93/2jQKHpP31V
	IXQl3wW1AH6RkLZhwIFjAAb4TBUe1a8lUMLsrtFXcAIIN/x/cgh2a89KLMMWnX69+qzmJXI10aq0j
	eVKUQc+ydXrwpb/y7Pk5/ZcEwx2nLa0uRLrEw5dmjBhlb9RLfvt4CktcEtQBCg9whNRLyiaNfLQih
	lN4WeyC6SrWnlNfWm5mDNnmG0d4gEorYUop+ij5eC4RBHyhaaSFbnS5or/4Ndu0s4T6uoJC63MO9D
	yAIsfDwg==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Lj-00000004nJr-24wM
	for ath12k@lists.infradead.org;
	Mon, 04 Mar 2024 10:15:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d228a132acso55555451fa.0
        for <ath12k@lists.infradead.org>; Mon, 04 Mar 2024 02:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709547303; x=1710152103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbw+0G/oi4YCCSNdk57A1SMXxRdQU5Z8vIcRhKwpQ2M=;
        b=or8vcKxoa33insPvkb/3wntBxC5F+U9Ew0oRH54TLbFvzW/vH69vZmh92D01vr4QZb
         u3eNECk4pA+1SJJHBcULiV3oivC2RyaM1zknHHvB+O7OY13bBAhgwm/P2OJHG/UgAxmV
         hHcNCF+qGUFvf6vqfaLpRq4cafgnyyBFPPqlmr7i4+xDblNyfUIvgYAi/fSSa+v8AIrV
         NRuRpGRZDfLSYskPVnMsU/MOUJ5pjJlSnTbNORhclJbof7oKyiwDvbD5/r14olqRrcJq
         OaGvusrhwBgODXuGiSJW042T4WRkeBfeuvQYlFZMt6jfc0hdYwyOfNyViEas9IV0Nxmm
         Fnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709547303; x=1710152103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbw+0G/oi4YCCSNdk57A1SMXxRdQU5Z8vIcRhKwpQ2M=;
        b=SPhTb4dJdaYLaE3vZy7/EXtJKvfc9Zi5hNpyuxWHTxamVFP8IGLABY49B1ZTVMAO1X
         Cf7MO87rKXn57emQ8c5Hbx7wSME4xhPn+vJvKJtFuYiYpyVT4HmSGkPleJb0E1WJLnCV
         QHA7JFYiukhNWOxuhntiNnxuNwyl4j2fDHGXbG82Jhj2n74cMDfXdhi0c/z93FQ5/N0f
         K4npw1SJhp0T1gYtdxyhjHksoqxp2+jMv5yZsrsZJOL9zVxxijP1/snwH2muNj/HDiqV
         qg2mIPvC/+zQ+dieyBbZK42cA1+3on7ETkU9zVC76l+xgm1hh1Djsnl+DnpoTze9es24
         oyBg==
X-Forwarded-Encrypted: i=1; AJvYcCXGiCTIaQOGvlFCbWx6vF0aA7yR+Q5JjCaWICU4Y9hFFnJqQaJc8VnsfqHjU9tHHT4uoMwWnGfz7lbJWMk8OqLzcNRfVAJCXqwapw==
X-Gm-Message-State: AOJu0YyXH46loYZOtzUbnzleWKB1WlcjnYeZ8D5b2qIToFv/v0c44idp
	8Fc8Vz2N7KN7+S0pgrSc+kv+Z9w3UVlQrYe05O8RqBqcL1g5dCGSr2f18viDU1Flh2B1ttwD6Bu
	RyIrrLG2AXKxI9f5jnQy2dcKDxSwtSkPkiBIKdQ==
X-Google-Smtp-Source: AGHT+IEyXehy1ZSIFeyvD70vrO+oZYE5KWhZKEU2B2BgUHpa3vXJaCfk4pvOG2pBjR5o83PbCjQKd01f2J5V8cmNYLo=
X-Received: by 2002:a2e:b041:0:b0:2d3:4b84:bb49 with SMTP id
 d1-20020a2eb041000000b002d34b84bb49mr5461000ljl.10.1709547303573; Mon, 04 Mar
 2024 02:15:03 -0800 (PST)
MIME-Version: 1.0
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com> <CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
 <25c22014-bb26-414e-a29f-8ed97c1ef465@quicinc.com>
In-Reply-To: <25c22014-bb26-414e-a29f-8ed97c1ef465@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 4 Mar 2024 18:14:52 +0800
Message-ID: <CABymUCMntFfKPRZyv+PzmNB3WejG7v5Y1-AYhXRK1o++U_xnRQ@mail.gmail.com>
Subject: Re: 6GHz AP association failure on WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101511_684445_85CF68D6 
X-CRM114-Status: GOOD (  16.31  )
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

Kang Yang <quic_kangyang@quicinc.com> =E4=BA=8E2024=E5=B9=B43=E6=9C=881=E6=
=97=A5=E5=91=A8=E4=BA=94 19:42=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 3/1/2024 5:14 PM, Jun Nie wrote:
> > Hi,
> >
> > I see there is association failure many times when I try to connect my
> > 6GHz AP with latest mainline Linux. Does anyone also observe it too?
> > Any newer firmware than WLAN.HMT.2.0-01734 is available? Or we
> > recommend any specific version firmware?
> >
> > The issue only happens with this version firmware:
> >    [    9.441624] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
> >     [   10.058822] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4
> > board_id 0x3d soc_id 0x40170200
> >     [   10.082876] ath12k_pci 0000:01:00.0: fw_version 0x200a06c6
> > fw_build_timestamp 2023-09-20 03:43 fw_build_id
> > QC_IMAGE_VERSION_STRING=3DWLAN.HMT.2.0-01734-QCAHMTSWPL_V1.0_V2.0_SILIC=
ONZ-1
> >
>
> Wrong firmware.
>
> We use WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 and
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4,
>
> https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN78=
50/hw2.0
>
> > I do not see the issue with firmware:
> > [    7.896737] ath12k_pci 0000:01:00.0: fw_version 0x1005bc12
> > fw_build_timestamp 2022-10-11 12:13 fw_build_id
> > QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILIC=
ONZ-1.15378.4
> >
>
> That's it, i recommend you to use
> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3. It's new one.
>
>
>
> > Detail log can be found at:
> > https://www.dropbox.com/scl/fi/jgn1zbnw44i1vypbjxl0v/ath12k-6GHz-associ=
ation-fail-log.tgz?rlkey=3Dpg2ifnzcttzimz7vaxb7tuc6w&dl=3D0
> >
> > Jun

Hi Kang,

I see wlan0 failure with below log with firmware version
WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4.
Do I need any patch outside mainline? Actually, I add below 2 patches
for 6GHz band.
afb7a22d9e22 wifi: ath12k: build 6 GHz regd based on vdev type and 6
GHz power type
6c60469f0bae wifi: ath12k: add support to select 6 GHz Regulatory type


[    6.194535] ath12k_pci 0000:01:00.0: setting mhi state: INIT(0)
[    6.195067] ath12k_pci 0000:01:00.0: setting mhi state: POWER_ON(2)
[    6.195069] mhi mhi0: Requested to power ON
[    6.195083] mhi mhi0: Power on setup success
[    6.196541] mhi mhi0: Image transfer failed
[    6.196559] mhi mhi0: Reg: ERROR_CODE value: 0xef128100
[    6.196574] mhi mhi0: Reg: ERROR_DBG1 value: 0xff7fc000
[    6.196588] mhi mhi0: Reg: ERROR_DBG2 value: 0x0
[    6.196601] mhi mhi0: Reg: ERROR_DBG3 value: 0x1988
[    6.196631] mhi mhi0: MHI did not load image over BHI, ret: -5

Kalle,
Thanks for the reminder of attachment size limitation!

Jun

