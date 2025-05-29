Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCAAC3ABB2
	for <ath12k@archiver.kernel.org>; Thu, 29 May 2025 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV3OG4YFsa7BwnTHhr6w+ZvKMNrZ6vBv/lrQpY/RujU=; b=JzpfV8Kq/IaEnjFx//i697z2hq
	mcAJY6RtfkKmWzRLFhZXz38fdHXkZdLbjGmpOa3gqNv2iUI88qt39a3rrVDpTO27BBQuPLCLjBnT6
	z8IWoV9lLDLaPiWKscTlKRR1bM88226A/tt5/so/RnLa69VbXTxcCWZ+0GFIIfzJ+kGT3Av40LkKD
	7tpeiC98f1/dL0h6iHLxdwPiWrdZqFciH+5QA66xoxrziZmLm9JUq2Sw3cLkkaqjLr2zdEEoMPAR1
	zADwVH7AzlBBSCAWoVIvawGYrXvY0xSWZy2J5DpY8ACnqCsXEDdv4w8aPxAbDTlT1qy+CepF3L0Ka
	24yM1VIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRAa-0000000EUr4-0bup;
	Thu, 29 May 2025 00:30:52 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRAX-0000000EUqF-3vmw
	for ath12k@lists.infradead.org;
	Thu, 29 May 2025 00:30:51 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e731a56e111so337556276.1
        for <ath12k@lists.infradead.org>; Wed, 28 May 2025 17:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748478648; x=1749083448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV3OG4YFsa7BwnTHhr6w+ZvKMNrZ6vBv/lrQpY/RujU=;
        b=T5ixFB8Un/sU+TroNP0wAO0kqobw9FBVDLepaD67HZDKcyXPEaBiBMFwZFWuqvvZl5
         0u+pECHSYir/l8SrRQHEPaEC0o0q/sWz9bv2rybhS+1KYiEtlC6gJMhRAYkEAYqHFV5I
         a0+kIRogW8bOKb9yIPAtkzkPscdDl8FUDAgktTmTxEcg01mD4odvwFYbAIMjw4wI5VQf
         W+AAFsBULigmpsAwf9ZOFx1NKlENKe9HvhmekCAOO72wAye0XXdrE+n0mtbEIjEIyouQ
         0IU8F6YiPml8/J9eo8R0YH9Y4TfBEkyvifj+hra5UU+sJi6DEuurLOmWKB7BhB8pZic8
         VTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748478648; x=1749083448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV3OG4YFsa7BwnTHhr6w+ZvKMNrZ6vBv/lrQpY/RujU=;
        b=wlaxbkvuJNE/Ikji3gEE5P6ey6ROIbAxNovhFFoYnOyl7bE6eBrwI1gp+l99R6eFxh
         Y+VhxdMksSWkUHSc6v/38CVO5RHRLVH6olwOyIsotLn3YEyniGTlaPKv1PCd5+b2C6te
         jP81GNYjRsgee6QJ5vNbhxTXrnxA1K+Jvy/q3PxGsmADy/GIUj5RaFKXEjJIz1ofjVS3
         q5v/xiHimnUfsjHKmQDQfmgT2MS/U9ycCa+JIjEbBDMykWO6skaGmBV0OKr/lTJjAgNl
         684yx0ySs9EjRFr8oiWRp9uQ8zlYiW4V0JM15FIFibNH/QqEJnWigI5UPuCn15ASkLAz
         VQHg==
X-Gm-Message-State: AOJu0YyfS0bF2bsfUN+WhisXzuZAMGJinHqs6ZeEq/jtuLtfKapSe3jR
	yTEp4RhCHsQGYh0Rv/TgYhMYFtckmjVQyUea7zTQXLozi6RXk+zSJ3oNU2RdIGdv9V8jB5VwVa+
	5Z1dEI2bsBJXv17vr8p2+jdhBI5kkMlc=
X-Gm-Gg: ASbGncsTISKWPySrp9DFVeCLx9qtfd9lv6CHGcCkN2ryh5CzXQWuostyD8UdaxOJccP
	WzwGMOL8+PS43MjOud8zbiSNgZhK/xsJ0N2KJnqHlu0DH62qIg4NmfqgoC8DWBVjVd4XWTBDJs8
	h+XL3C2PW3JznSka0+8WpjrZJgKe8GA6ys4iUWhscc/IE=
X-Google-Smtp-Source: AGHT+IGA2NaPo1Txru+HKsJOYUboopsSbicsqmj+So1/yERxhW/mHvonv5PZ0xcs+hDKpS7rWOYWqZsEMtlBlnAEljc=
X-Received: by 2002:a05:6902:f87:b0:e7d:c5dd:78bd with SMTP id
 3f1490d57ef6-e7dc5dd7d19mr12856690276.43.1748478648553; Wed, 28 May 2025
 17:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
 <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com>
 <9e5fb196-fd6d-4fdf-b970-e239bf1a682b@quicinc.com> <CAG0V13RrWkD=Qu74JNNJQNAPA_JC1HORf_cy9s+a60Bm=BsNag@mail.gmail.com>
 <d8d6327b-3f33-4f1f-8369-db516573eb8c@quicinc.com> <CAG0V13STa+zO2JJyB8+t8Qr-Y3yOa96EEhUAYHbJhraKz3bj7A@mail.gmail.com>
 <e10d6afe-b7ca-425b-99df-5c178a76fca1@quicinc.com>
In-Reply-To: <e10d6afe-b7ca-425b-99df-5c178a76fca1@quicinc.com>
From: Doug Brewer <brewer.doug@gmail.com>
Date: Thu, 29 May 2025 08:30:37 +0800
X-Gm-Features: AX0GCFsjFISJrH8ERBS3VlFWLjjKGnKsCrciWiYyjvgwIBn0kjATYkAXidRf7jk
Message-ID: <CAG0V13RcrgZ0O2w4cVD-yq2o029bwiEuhLYGAt0n-80hqaCwdQ@mail.gmail.com>
Subject: Re: WCN7850 problem on Linux kernel 6.15
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_173049_984676_F0679DCA 
X-CRM114-Status: GOOD (  21.32  )
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

On Wed, May 28, 2025 at 10:36=E2=80=AFPM Baochen Qiang <quic_bqiang@quicinc=
.com> wrote:
>
>
>
> On 5/28/2025 8:55 PM, Doug Brewer wrote:
> > On Wed, May 28, 2025 at 4:02=E2=80=AFPM Baochen Qiang <quic_bqiang@quic=
inc.com> wrote:
> >>
> >>
> >>
> >> On 5/28/2025 3:29 PM, Doug Brewer wrote:
> >>> On Wed, May 28, 2025 at 1:16=E2=80=AFPM Baochen Qiang <quic_bqiang@qu=
icinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 5/27/2025 11:00 AM, Doug Brewer wrote:
> >>>>> On Tue, May 27, 2025 at 9:10=E2=80=AFAM Doug Brewer wrote:
> >>>>>>
> >>>>>> Hello,
> >>>>>>
> >>>>>> After upgrading to kernel 6.15, my ath12k failed to start:ath12k_p=
ci
> >>>>
> >>>> Is this mainline kernel or stable kernel?
> >>>
> >>> It's stable kernel:
> >>> https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.15.tar.xz
> >>>
> >>>>>> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
> >>>>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> >>>>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
> >>>>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> >>>>>> NET: Registered PF_QIPCRTR protocol family
> >>>>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) err=
or message rec
> >>>>>> eived from 0000:00:1d.0
> >>>>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable (N=
on-Fatal), type=3D
> >>>>>> Transaction Layer, (Completer ID)
> >>>>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=3D00=
008000/00010000
> >>>>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> >>>>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x=
00000000 0x000
> >>>>>> 00000
> >>>>
> >>>> Strange there is AER error? Is 0000:00:1d.0 upstream port of WLAN ta=
rget? I guess not
> >>>> because 8086:9d18 seems like an Intel device?
> >>>
> >>> Appending =E2=80=98pcie_aspm=3Doff=E2=80=99 to the kernel command lin=
e will eliminate that error.
> >>>
> >>>> Can you share lspci log:
> >>>>
> >>>> lspci -tv
> >>>
> >>> -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th G=
en Core Pro
> >>> cessor Host Bridge/DRAM Registers
> >>>           +-02.0  Intel Corporation Skylake GT2 [HD Graphics 520]
> >>>           +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 /=
 6th/7th/8
> >>> th Gen Core Processor Gaussian Mixture Model
> >>>           +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Con=
troller
> >>>           +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
> >>>           +-17.0  Intel Corporation Sunrise Point-LP SATA Controller =
[AHCI mode]
> >>>           +-1c.0-[01]--
> >>>           +-1c.5-[02]----00.0  Intel Corporation I210 Gigabit Network=
 Connection
> >>>           +-1d.0-[03]----00.0  Qualcomm Technologies, Inc WCN785x Wi-=
Fi 7(802.1
> >>> 1be) 320MHz 2x2 [FastConnect 7800]
> >>>           +-1e.0  Intel Corporation Sunrise Point-LP Serial IO UART C=
ontroller
> >>> #0
> >>>           +-1e.6  Intel Corporation Sunrise Point-LP Secure Digital I=
O
> >>> Controller
> >>>           +-1f.0  Intel Corporation Sunrise Point-LP LPC Controller
> >>>           +-1f.2  Intel Corporation Sunrise Point-LP PMC
> >>>           +-1f.3  Intel Corporation Sunrise Point-LP HD Audio
> >>>           +-1f.4  Intel Corporation Sunrise Point-LP SMBus
> >>>           \-1f.6  Intel Corporation Ethernet Connection I219-LM
> >>>
> >>>
> >>>>>> mhi mhi0: Requested to power ON
> >>>>>> mhi mhi0: Power on setup success
> >>>>>> mhi mhi0: Wait for device to enter SBL or Mission mode
> >>>>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected cal=
lback)
> >>>>>> pcieport 0000:00:1d.0: AER: device recovery failed
> >>>>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type=
 1),
> >>>>>> will try later with small size
> >>>>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
> >>>>>> soc_id 0x40170200
> >>>>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp =
2025-05-17 00:
> >>>>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-Q=
CAHMTSWPL_V1.0_V
> >>>>>> 2.0_SILICONZ-3
> >>>>>> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
> >>>>>> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event=
: -110
> >>>>>> ath12k_pci 0000:03:00.0: failed to start core: -110
> >>>>>> failed to send QMI message
> >>>>>> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4,=
 err =3D -5
> >>>>>> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off
> >>>>>
> >>>>> Tested on same machine with kernel 6.14.8, ath12k works:
> >>>>
> >>>> This seem like stable kernel, can you try latest mainline kernel?
> >>>>
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> >>>>
> >>>> or latest ath tree?
> >>>>
> >>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
> >>>
> >>> OK, will try mailine kernel, thanks.
> >>
> >> Please also try latest ath tree if issue still seen with mainline kern=
el.
> >
> > Both mainline and stable kernels have the same error.
> > Switched to ath.git, my ath12k works.
> >
> > Seems to me that both mainline and stable kernels have fallout.
>
> Great. So seems some fixes/update not landing in mainline/stable yet.

It's not good that ath12k is broken on the stable kernel 6.15.
Do you know which fixes haven't landed yet?
I'd be happy to help test them, thanks.

> >>>>> ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: a=
ssigned
> >>>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> >>>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
> >>>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> >>>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) erro=
r message rec
> >>>>> eived from 0000:00:1d.0
> >>>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable (No=
n-Fatal), type=3D
> >>>>> Transaction Layer, (Completer ID)
> >>>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=3D000=
08000/00010000
> >>>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> >>>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000
> >>>>> 0x00000000 0x00000000
> >>>>> mhi mhi0: Requested to power ON
> >>>>> mhi mhi0: Power on setup success
> >>>>> mhi mhi0: Wait for device to enter SBL or Mission mode
> >>>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected call=
back)
> >>>>> pcieport 0000:00:1d.0: AER: device recovery failed
> >>>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type =
1),
> >>>>> will try later with small size
> >>>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
> >>>>> soc_id 0x40170200
> >>>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2=
025-05-17 00:
> >>>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QC=
AHMTSWPL_V1.0_V
> >>>>> 2.0_SILICONZ-3

