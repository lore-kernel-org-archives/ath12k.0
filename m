Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5A0C5AD49
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 12:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mATwyIXbgdYua6fYdzPoX+zuXNfrwPwM4o1LooIQr3U=; b=NJrLyoh93tt4EQSJfRRMb9mBoV
	jMqr1MtWOg2iBZxWQG0WCKB6iVgeMdnqneSCE646IlDZe7pqIPzJn0SV1VvGUTHSgTqQf5NhioCgd
	tOCUGtj7jIBiDqL1BebiJkFWBIMarRHFfIA3JCGC+aMScTQcGiD/WGuEqJ9SUAnO4VJR1Ul7QrMCW
	5WJNR70xJThirZowmBCO5RooUgls4WZD0dk+jBxBmdyQa830aJNAlMA2yPGIaoeaxheXttGROKs5R
	+HF3GwDlou8PY/qnim0Rll7hJjac0VGFkFjy8V0vKgarxU28sy72XXcBkODNPlTLgtZIjh205K5Sy
	kBIBhRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGJj-0000000DB7F-2Q3C;
	Wed, 28 May 2025 12:55:35 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGJh-0000000DB6R-0336
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 12:55:34 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso1475211276.3
        for <ath12k@lists.infradead.org>; Wed, 28 May 2025 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748436932; x=1749041732; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mATwyIXbgdYua6fYdzPoX+zuXNfrwPwM4o1LooIQr3U=;
        b=dloRbPCfvcUzwg1ciTVCz4/D84Mlvew7joNIbomiEnmgdMziKwgQfxwsY8k8rFvBXH
         NTZ6uawqReB89raBjEcH4WwVrww8q2a8Aow+nVg7qPBXL5PGOG4pxCaZ7x0/J2RerM2K
         6zCWMd/lZtcMmvuX4mqVejqI8+H6Rz63OL2NSD7/EqDOPtSzAd9SlXptmcg9qhSGR2vn
         9SEVTdrmoKX6fwkHbWdgW/ki3MLa7bLb7Jo0aqJhuCgbiMHe7P6PQyLT2ApYYT1e6y9Q
         TEkO+xEw7vULIwVRCCHr9cyZK2dXqcRaviVBXjXqG6M+60GgAB+1Z/CYGsxJB5yRf5ZL
         YKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436932; x=1749041732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mATwyIXbgdYua6fYdzPoX+zuXNfrwPwM4o1LooIQr3U=;
        b=Eek0J4b8gtccKcA96ahF/hoXAHyvX2s87GYkwdD8aXryihkWwi1zMCmpOP9hJ0k5iL
         5+IjkJCCddapdfpAdUFeiJD1Rao2c8gyTnlDWTW6JJXZHCljToZW1SqROiEFIcF3e2RY
         AjneEg34YYibr/pxZ+91Ebt5oDjUxPsDBdSMNkRmY+40bk2XN92uo+QQT/DVgN4LKjx0
         PffBcvmTx3otMGcDgLROC/Xgj1dP1/8aaLwnjNOVybAWgkh+EFjk1y31ZfWf6CdIIowX
         X8Tr9FEJx7E2hcjuiKmsXNyYzmYMVEOb5KOgw2L6jM27ltM+KOvlqmDSrs63pfOHKcjQ
         sXaw==
X-Gm-Message-State: AOJu0YwYosteP5CkqvuQUOFusuqoLdAKp8QkzLAD3rztZu8SNeqwqoqR
	PWLV/FBGD+oPhE9/51BRntnmL4M4C5qD6MVcVsdL9kUSLIfg1rLgUQKfxHDLesJ6oAay2hCir5J
	7Q+5+XqkFtIKH9U7ejpKKywT4iDOZLTrhANgf
X-Gm-Gg: ASbGncuBv2MRPaz/jKqBmCTjadRJa9fy0dltnMtxPu0iReRdxBXn3iI3/zmzSh5Yp6w
	TJAwT+repdJ/FfbSm7LypexXperi93ZLmhzUdpKTp/FZFJ74hkWurmgUjyf2XvlK7/WeNqGRYup
	zRux6naYfIxYpthksO8F9TVVgGLxUSQvjQqg==
X-Google-Smtp-Source: AGHT+IH4iksCzr9711IjPS7A1j8DusLWZVKEZiWJNVzXgvorlt5D/Qfc4JOlymBpkLQZEeweErMpYgJvZJgpfQxSpFM=
X-Received: by 2002:a05:6902:1b10:b0:e7d:6b43:2446 with SMTP id
 3f1490d57ef6-e7f5ddcf700mr2380252276.10.1748436931906; Wed, 28 May 2025
 05:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
 <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com>
 <9e5fb196-fd6d-4fdf-b970-e239bf1a682b@quicinc.com> <CAG0V13RrWkD=Qu74JNNJQNAPA_JC1HORf_cy9s+a60Bm=BsNag@mail.gmail.com>
 <d8d6327b-3f33-4f1f-8369-db516573eb8c@quicinc.com>
In-Reply-To: <d8d6327b-3f33-4f1f-8369-db516573eb8c@quicinc.com>
From: Doug Brewer <brewer.doug@gmail.com>
Date: Wed, 28 May 2025 20:55:20 +0800
X-Gm-Features: AX0GCFtrwailbyraS2MjUmy8Om3sdWDjakBRK94xCy5TDrWqHy59xRjlh-K92j0
Message-ID: <CAG0V13STa+zO2JJyB8+t8Qr-Y3yOa96EEhUAYHbJhraKz3bj7A@mail.gmail.com>
Subject: Re: WCN7850 problem on Linux kernel 6.15
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_055533_061087_D3F89E8D 
X-CRM114-Status: GOOD (  19.38  )
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

On Wed, May 28, 2025 at 4:02=E2=80=AFPM Baochen Qiang <quic_bqiang@quicinc.=
com> wrote:
>
>
>
> On 5/28/2025 3:29 PM, Doug Brewer wrote:
> > On Wed, May 28, 2025 at 1:16=E2=80=AFPM Baochen Qiang <quic_bqiang@quic=
inc.com> wrote:
> >>
> >>
> >>
> >> On 5/27/2025 11:00 AM, Doug Brewer wrote:
> >>> On Tue, May 27, 2025 at 9:10=E2=80=AFAM Doug Brewer wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> After upgrading to kernel 6.15, my ath12k failed to start:ath12k_pci
> >>
> >> Is this mainline kernel or stable kernel?
> >
> > It's stable kernel:
> > https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.15.tar.xz
> >
> >>>> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
> >>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> >>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
> >>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> >>>> NET: Registered PF_QIPCRTR protocol family
> >>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error=
 message rec
> >>>> eived from 0000:00:1d.0
> >>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable (Non=
-Fatal), type=3D
> >>>> Transaction Layer, (Completer ID)
> >>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=3D0000=
8000/00010000
> >>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> >>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x00=
000000 0x000
> >>>> 00000
> >>
> >> Strange there is AER error? Is 0000:00:1d.0 upstream port of WLAN targ=
et? I guess not
> >> because 8086:9d18 seems like an Intel device?
> >
> > Appending =E2=80=98pcie_aspm=3Doff=E2=80=99 to the kernel command line =
will eliminate that error.
> >
> >> Can you share lspci log:
> >>
> >> lspci -tv
> >
> > -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen=
 Core Pro
> > cessor Host Bridge/DRAM Registers
> >           +-02.0  Intel Corporation Skylake GT2 [HD Graphics 520]
> >           +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6=
th/7th/8
> > th Gen Core Processor Gaussian Mixture Model
> >           +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Contr=
oller
> >           +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
> >           +-17.0  Intel Corporation Sunrise Point-LP SATA Controller [A=
HCI mode]
> >           +-1c.0-[01]--
> >           +-1c.5-[02]----00.0  Intel Corporation I210 Gigabit Network C=
onnection
> >           +-1d.0-[03]----00.0  Qualcomm Technologies, Inc WCN785x Wi-Fi=
 7(802.1
> > 1be) 320MHz 2x2 [FastConnect 7800]
> >           +-1e.0  Intel Corporation Sunrise Point-LP Serial IO UART Con=
troller
> > #0
> >           +-1e.6  Intel Corporation Sunrise Point-LP Secure Digital IO
> > Controller
> >           +-1f.0  Intel Corporation Sunrise Point-LP LPC Controller
> >           +-1f.2  Intel Corporation Sunrise Point-LP PMC
> >           +-1f.3  Intel Corporation Sunrise Point-LP HD Audio
> >           +-1f.4  Intel Corporation Sunrise Point-LP SMBus
> >           \-1f.6  Intel Corporation Ethernet Connection I219-LM
> >
> >
> >>>> mhi mhi0: Requested to power ON
> >>>> mhi mhi0: Power on setup success
> >>>> mhi mhi0: Wait for device to enter SBL or Mission mode
> >>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callb=
ack)
> >>>> pcieport 0000:00:1d.0: AER: device recovery failed
> >>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1=
),
> >>>> will try later with small size
> >>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
> >>>> soc_id 0x40170200
> >>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 20=
25-05-17 00:
> >>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCA=
HMTSWPL_V1.0_V
> >>>> 2.0_SILICONZ-3
> >>>> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
> >>>> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event: =
-110
> >>>> ath12k_pci 0000:03:00.0: failed to start core: -110
> >>>> failed to send QMI message
> >>>> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4, e=
rr =3D -5
> >>>> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off
> >>>
> >>> Tested on same machine with kernel 6.14.8, ath12k works:
> >>
> >> This seem like stable kernel, can you try latest mainline kernel?
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> >>
> >> or latest ath tree?
> >>
> >> https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
> >
> > OK, will try mailine kernel, thanks.
>
> Please also try latest ath tree if issue still seen with mainline kernel.

Both mainline and stable kernels have the same error.
Switched to ath.git, my ath12k works.

Seems to me that both mainline and stable kernels have fallout.

> >>> ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: ass=
igned
> >>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> >>> ath12k_pci 0000:03:00.0: MSI vectors: 16
> >>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> >>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error =
message rec
> >>> eived from 0000:00:1d.0
> >>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable (Non-=
Fatal), type=3D
> >>> Transaction Layer, (Completer ID)
> >>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=3D00008=
000/00010000
> >>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> >>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000
> >>> 0x00000000 0x00000000
> >>> mhi mhi0: Requested to power ON
> >>> mhi mhi0: Power on setup success
> >>> mhi mhi0: Wait for device to enter SBL or Mission mode
> >>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callba=
ck)
> >>> pcieport 0000:00:1d.0: AER: device recovery failed
> >>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1)=
,
> >>> will try later with small size
> >>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
> >>> soc_id 0x40170200
> >>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 202=
5-05-17 00:
> >>> 21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCAH=
MTSWPL_V1.0_V
> >>> 2.0_SILICONZ-3
> >>>
> >>
>

