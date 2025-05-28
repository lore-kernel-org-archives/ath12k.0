Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B04EC5AE59
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WePVg9Kl6KwGVumRjqrreir95INw5StxVNJ+KPqpcOs=; b=IRhMTYA3yHBr7eTbdCbjIYpZVs
	sXA3yd5wYIVnmnwTi2NxvSBHw3Tb3bYWUu3qJEyoUhPsdB5EKkfO01H4/ZSJeX+Vlv/Hup8VqVQbw
	IpmezgkGdRqMTDx2VxKSbPKNGb3J/7nxkja4rsrmAmK10rCChyrNSK/aARy5EuubwJ0Ya7+nBPRol
	Atio3oomr156QNpVKF5nmi/NfqBXFpxDdYd2Gd8UItBur2Uw6g2mlpP6NC79s2r+8bJlOYKj69Y1z
	Z/6cY/qTlMNW3rF0fvV5Ghm/SqEtPRiQY/ltK0TYKuwMinky48aiJMwmTKXODcycOr9U+xLWEzb4i
	lDFdY/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBEA-0000000CR1c-0zgk;
	Wed, 28 May 2025 07:29:30 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBE7-0000000CR1B-3e3d
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 07:29:29 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e7dc4e44b47so1405352276.3
        for <ath12k@lists.infradead.org>; Wed, 28 May 2025 00:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748417366; x=1749022166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WePVg9Kl6KwGVumRjqrreir95INw5StxVNJ+KPqpcOs=;
        b=eR2CbJ+R5S1rMUF8yw0SSE/VI3IST4liaRG1l8plfI0oH2ChKdyABKDVaCYyr2sVOv
         JPOpYDDIBWUJtSbwNEsNSiilzf3bAd5/BN75ehqk9Yf/0dQyif5DyjabcMWQWUgqLDNM
         Iu3a/iDDpOCeUXkOVz9oyQOvGOpJWZxHL4832WnrV0mryupg3S8qJh86+mfse00D8Xso
         IWI8Am01vd+zzGAvnwWdb4IfqOClRewDQeWqILrn7SEjAtHwBMt3fK5CKFdey81gmx+R
         l+2cXivSlpeAcN1NgRPNFTkYz5bNQkhFRgct/1H7iZrE9ejZcMMYkzTpc5R0Ue1s5RRH
         FkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417366; x=1749022166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WePVg9Kl6KwGVumRjqrreir95INw5StxVNJ+KPqpcOs=;
        b=LsyykT0E0wyzyzrvRB9SS9UlkgLCFVkJtFuvqQgrZWfhxpFM/BShIQOfvqyLs4cKUY
         cI1am0r5tkbQbB9Cm7nlut+t/+hWhMzHmK8Q3Krua13QZWsY+2UlWtFdSRujElL82vaR
         /IIePzP+DNBRPe9t+1p+bmsC5O6wh0R0uusoFGIuohyy0tAe6P3jogJ8Hv+Yi8NflGnh
         i9fwDYVzrJqNiy49rPsfrta3qd0Z8pUGh6jegSgKodbZ+9xRT83cqJfkQJXKQ2UTdoMk
         i0CPiq8yeFrdE+8jGaCmKYo6BAYdHCGoMxC2Cz9+CWrzj4gdzgSCihZe3NMKwFhDRs2G
         d8Kg==
X-Gm-Message-State: AOJu0YwLbiHqqRWJS1Pcu5MuntVanXHFOHj2oH/H5VRYX3XIBccVzBzh
	WJvGKZ4qLZBQLRpYNHZyuctRVW3u0ClAZrTWE6X2F+eyk2cZaVzEqKq38PfS6hu+XhTxNTcSKnY
	+YsbUeEsiadimuFdCuCH5Ccb/XiAK3Rs=
X-Gm-Gg: ASbGncsE+Ft65A9VmdLD10cXz8zn1LDe/ueBAHH6maHSZMzByORuhaoVssfT6ucabBs
	TiwpRwKnzxWMxtJl+K9NIqjdAHZVaYGyhGyLyUVlxk8YgZ2vB2QIyr06oMysEOR++NuumebawoK
	IcWLsRXYnFfDQxqYwmdo0Ojl+iwyWRRs8W5VlJTv3RH4A=
X-Google-Smtp-Source: AGHT+IGzYaUxmKyY+w53ta4JvD1aLKywthuKJiFqtxWtGu1DxasqQljRbghHj/YstATTr0NYl4hlkf0Yqu9hIdJDNqM=
X-Received: by 2002:a05:6902:18d3:b0:e7d:5e41:a89f with SMTP id
 3f1490d57ef6-e7d9175aca6mr18627180276.6.1748417366401; Wed, 28 May 2025
 00:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
 <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com> <9e5fb196-fd6d-4fdf-b970-e239bf1a682b@quicinc.com>
In-Reply-To: <9e5fb196-fd6d-4fdf-b970-e239bf1a682b@quicinc.com>
From: Doug Brewer <brewer.doug@gmail.com>
Date: Wed, 28 May 2025 15:29:15 +0800
X-Gm-Features: AX0GCFuc7ycAAwZxC2LkqF8q1ti4D6hD1EVau3lT3g8UH9cX7XXJQYUyWH66jUU
Message-ID: <CAG0V13RrWkD=Qu74JNNJQNAPA_JC1HORf_cy9s+a60Bm=BsNag@mail.gmail.com>
Subject: Re: WCN7850 problem on Linux kernel 6.15
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_002927_927097_98F4E7C1 
X-CRM114-Status: GOOD (  17.62  )
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

On Wed, May 28, 2025 at 1:16=E2=80=AFPM Baochen Qiang <quic_bqiang@quicinc.=
com> wrote:
>
>
>
> On 5/27/2025 11:00 AM, Doug Brewer wrote:
> > On Tue, May 27, 2025 at 9:10=E2=80=AFAM Doug Brewer wrote:
> >>
> >> Hello,
> >>
> >> After upgrading to kernel 6.15, my ath12k failed to start:ath12k_pci
>
> Is this mainline kernel or stable kernel?

It's stable kernel:
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.15.tar.xz

> >> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
> >> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> >> ath12k_pci 0000:03:00.0: MSI vectors: 16
> >> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> >> NET: Registered PF_QIPCRTR protocol family
> >> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error m=
essage rec
> >> eived from 0000:00:1d.0
> >> pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable (Non-F=
atal), type=3D
> >> Transaction Layer, (Completer ID)
> >> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=3D000080=
00/00010000
> >> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> >> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x0000=
0000 0x000
> >> 00000
>
> Strange there is AER error? Is 0000:00:1d.0 upstream port of WLAN target?=
 I guess not
> because 8086:9d18 seems like an Intel device?

Appending =E2=80=98pcie_aspm=3Doff=E2=80=99 to the kernel command line will=
 eliminate that error.

> Can you share lspci log:
>
> lspci -tv

-[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Cor=
e Pro
cessor Host Bridge/DRAM Registers
          +-02.0  Intel Corporation Skylake GT2 [HD Graphics 520]
          +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7=
th/8
th Gen Core Processor Gaussian Mixture Model
          +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controlle=
r
          +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
          +-17.0  Intel Corporation Sunrise Point-LP SATA Controller [AHCI =
mode]
          +-1c.0-[01]--
          +-1c.5-[02]----00.0  Intel Corporation I210 Gigabit Network Conne=
ction
          +-1d.0-[03]----00.0  Qualcomm Technologies, Inc WCN785x Wi-Fi 7(8=
02.1
1be) 320MHz 2x2 [FastConnect 7800]
          +-1e.0  Intel Corporation Sunrise Point-LP Serial IO UART Control=
ler
#0
          +-1e.6  Intel Corporation Sunrise Point-LP Secure Digital IO
Controller
          +-1f.0  Intel Corporation Sunrise Point-LP LPC Controller
          +-1f.2  Intel Corporation Sunrise Point-LP PMC
          +-1f.3  Intel Corporation Sunrise Point-LP HD Audio
          +-1f.4  Intel Corporation Sunrise Point-LP SMBus
          \-1f.6  Intel Corporation Ethernet Connection I219-LM


> >> mhi mhi0: Requested to power ON
> >> mhi mhi0: Power on setup success
> >> mhi mhi0: Wait for device to enter SBL or Mission mode
> >> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callbac=
k)
> >> pcieport 0000:00:1d.0: AER: device recovery failed
> >> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
> >> will try later with small size
> >> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
> >> soc_id 0x40170200
> >> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025=
-05-17 00:
> >> 21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCAHM=
TSWPL_V1.0_V
> >> 2.0_SILICONZ-3
> >> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
> >> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event: -1=
10
> >> ath12k_pci 0000:03:00.0: failed to start core: -110
> >> failed to send QMI message
> >> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4, err=
 =3D -5
> >> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off
> >
> > Tested on same machine with kernel 6.14.8, ath12k works:
>
> This seem like stable kernel, can you try latest mainline kernel?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>
> or latest ath tree?
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/

OK, will try mailine kernel, thanks.
>
>
> >
> > ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assig=
ned
> > ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> > ath12k_pci 0000:03:00.0: MSI vectors: 16
> > ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> > pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error me=
ssage rec
> > eived from 0000:00:1d.0
> > pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable (Non-Fa=
tal), type=3D
> > Transaction Layer, (Completer ID)
> > pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=3D0000800=
0/00010000
> > pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> > pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000
> > 0x00000000 0x00000000
> > mhi mhi0: Requested to power ON
> > mhi mhi0: Power on setup success
> > mhi mhi0: Wait for device to enter SBL or Mission mode
> > ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback=
)
> > pcieport 0000:00:1d.0: AER: device recovery failed
> > ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
> > will try later with small size
> > ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
> > soc_id 0x40170200
> > ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-=
05-17 00:
> > 21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCAHMT=
SWPL_V1.0_V
> > 2.0_SILICONZ-3
> >
>

