Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF848C5AD49
	for <ath12k@archiver.kernel.org>; Thu, 29 May 2025 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZMSl5cmLeaUfE2ZNYwlicFuGr8FAkt+XEZ/t3ulWrA=; b=Q7ZVhceI5liO3M8IXk2nd9pWN2
	BtT9Ub7st/TJgLUgIS/EcnU3Xuf1hwuMPA5wyhKR9aEPOYjKS8ofxXFpiNi6y/35ZnoigVMrPt44J
	8bE2BhSYrJRHEJWkHs64BdYjlPHDuD1UdNe/wJr6aRPaJ3nP+OSja+qY8fvKybpB7QeflYp79zw3A
	0w0Bt0aEldv9s1wQiDbjDe1GgHUyAZTL0xvB9rsqaJEaNDGJ9b3+KHNR4B8iVJRD9V7oAbdHwxZbP
	uLgzPTa1nzSEel0PbI5nkRaqVO3ewOM/tmskJb9EuksrX073YqTyxrFp7nL26RvD9CxvTs/zdtATm
	NDnqjYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXdV-0000000FB6I-2f5B;
	Thu, 29 May 2025 07:25:09 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXdS-0000000FB5q-1wmj
	for ath12k@lists.infradead.org;
	Thu, 29 May 2025 07:25:07 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7b4ba530feso504995276.1
        for <ath12k@lists.infradead.org>; Thu, 29 May 2025 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748503505; x=1749108305; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZMSl5cmLeaUfE2ZNYwlicFuGr8FAkt+XEZ/t3ulWrA=;
        b=NIPq/oDdTDuqGcHA4h9Wmstr9oqn0/s2ABTgm1axLnc0hdLCNJwq7wxgHZb+Csja8m
         t9cgSij6spqIk6d2SqF43Hk9xSkbviOfplEj5JelbYw+xV9QlQeXcR7ZpFZgqaqsiIA4
         4k0H+AfYe14JdU6bcEQ9z+/0WNGIfcLVRBiGUxZxiQYcsEs8T0Whb2cC3hap/nY8EuS4
         j2HnZXSEEUqtPuXMSVT7Nx2H0JskEYFv03Wj2Po+PM2yShiNoLjjWYAT6IhoO35LAPZ6
         RK7gVZfaoEEdRvHKdGx7GQv/hJ44VYQSdxwlTK3++mIT1GbWqqFy8aYhN2174z8oTWI6
         3SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748503505; x=1749108305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZMSl5cmLeaUfE2ZNYwlicFuGr8FAkt+XEZ/t3ulWrA=;
        b=RJZ009xGPvHhlMOp4/EWDMBUxCnHsE/Oi1qMr4kdneHAsCcoA8pMRp+hNvP7Nyiid1
         Km4ZTb2j3czagSYPZt7Xvbng0uF0j0+erBGwdIKt3UpBOaWcJpXVfS1qehwsuHCZVhSX
         DpMrkP4OquxPBWtQB3Z7hNO2gml8jRysIkXl6qJAWYFMD/w56Ew2REqoSsheF0oNGuZL
         +GdvB0nV0LP66pcq1ZicRfJEh0XF3Fyuv9UIEA6t9YKpceJxLpl+0+nucTTjjVA4vt4F
         RqZ9/jvRdpgQ2jbXybSynwVNsYQZbN2GGSmf2hOK8HrplGlPH+Kb0B1xLr9njAQpgk83
         FeUA==
X-Gm-Message-State: AOJu0Yy2YTRKxWQUrGUuGR16+h+E3YFh1v2P9Jtv4y+tJhqPzOzdPoOW
	7JwyW1nEtI7DJu//Wap2FHuLqCE0RErT3aZU6qclZIc8s87ZuDsQ5owaKLFf1jcpvfM9/I1o22Y
	XjfLZGxWiY1dbYCcI6qKBuJy0HU+HF7I=
X-Gm-Gg: ASbGnctq4PZncZkA/80jsw+pUIyNpaTnbfw2EdkKX6ocMiDJGi/Ix2mmZfwWEUK5yC0
	uV/UTVfPYYnOzPTXIOsaQwrCgAfMMxRXAY/ruFPkPWYWqT/GZ90L+j2Ka87PxpF7pEu097gCye0
	GF3+kpKh4DPZ7LTvq2l8Xv1x5TR9MsJRfE
X-Google-Smtp-Source: AGHT+IHbubxSOyZsFhcriK5QsVV/hGlCwxLkyYPNVg/ZaTdTys/mIr2FSsxUbXGzLGLqK+8NBzkt2QDSKFFLc0XQP6Q=
X-Received: by 2002:a05:6902:1501:b0:e7d:b655:8c0 with SMTP id
 3f1490d57ef6-e7db655136cmr15405961276.8.1748503505245; Thu, 29 May 2025
 00:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
 <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com>
 <9e5fb196-fd6d-4fdf-b970-e239bf1a682b@quicinc.com> <CAG0V13RrWkD=Qu74JNNJQNAPA_JC1HORf_cy9s+a60Bm=BsNag@mail.gmail.com>
 <d8d6327b-3f33-4f1f-8369-db516573eb8c@quicinc.com> <CAG0V13STa+zO2JJyB8+t8Qr-Y3yOa96EEhUAYHbJhraKz3bj7A@mail.gmail.com>
 <e10d6afe-b7ca-425b-99df-5c178a76fca1@quicinc.com> <CAG0V13RcrgZ0O2w4cVD-yq2o029bwiEuhLYGAt0n-80hqaCwdQ@mail.gmail.com>
 <ec205009-30d7-4be3-9909-6e86698a5f9d@quicinc.com> <4023c749-b8ec-4f24-ba83-353a2feb59a9@quicinc.com>
In-Reply-To: <4023c749-b8ec-4f24-ba83-353a2feb59a9@quicinc.com>
From: Doug Brewer <brewer.doug@gmail.com>
Date: Thu, 29 May 2025 15:24:52 +0800
X-Gm-Features: AX0GCFsuyhp_ozoOssLCaGczMM39vPM3sXBrfudPCif9sDTeNcMGc5QxPEJGdc0
Message-ID: <CAG0V13QTtGLvqELd90WzV1FF0jgSmA92nkrYR6KL=L1w3mAEYQ@mail.gmail.com>
Subject: Re: WCN7850 problem on Linux kernel 6.15
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_002506_545599_4E5EF618 
X-CRM114-Status: GOOD (  24.60  )
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

On Thu, May 29, 2025 at 1:34=E2=80=AFPM Baochen Qiang <quic_bqiang@quicinc.=
com> wrote:
>
>
>
> On 5/29/2025 1:27 PM, Baochen Qiang wrote:
> >
> >
> > On 5/29/2025 8:30 AM, Doug Brewer wrote:
> >> On Wed, May 28, 2025 at 10:36=E2=80=AFPM Baochen Qiang <quic_bqiang@qu=
icinc.com> wrote:
> >>>
> >>>
> >>>
> >>> On 5/28/2025 8:55 PM, Doug Brewer wrote:
> >>>> On Wed, May 28, 2025 at 4:02=E2=80=AFPM Baochen Qiang <quic_bqiang@q=
uicinc.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 5/28/2025 3:29 PM, Doug Brewer wrote:
> >>>>>> On Wed, May 28, 2025 at 1:16=E2=80=AFPM Baochen Qiang <quic_bqiang=
@quicinc.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 5/27/2025 11:00 AM, Doug Brewer wrote:
> >>>>>>>> On Tue, May 27, 2025 at 9:10=E2=80=AFAM Doug Brewer wrote:
> >>>>>>>>>
> >>>>>>>>> Hello,
> >>>>>>>>>
> >>>>>>>>> After upgrading to kernel 6.15, my ath12k failed to start:ath12=
k_pci
> >>>>>>>
> >>>>>>> Is this mainline kernel or stable kernel?
> >>>>>>
> >>>>>> It's stable kernel:
> >>>>>> https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.15.tar.xz
> >>>>>>
> >>>>>>>>> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
> >>>>>>>>> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> >>>>>>>>> ath12k_pci 0000:03:00.0: MSI vectors: 16
> >>>>>>>>> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> >>>>>>>>> NET: Registered PF_QIPCRTR protocol family
> >>>>>>>>> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) =
error message rec
> >>>>>>>>> eived from 0000:00:1d.0
> >>>>>>>>> pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable=
 (Non-Fatal), type=3D
> >>>>>>>>> Transaction Layer, (Completer ID)
> >>>>>>>>> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=
=3D00008000/00010000
> >>>>>>>>> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> >>>>>>>>> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000=
 0x00000000 0x000
> >>>>>>>>> 00000
> >>>>>>>
> >>>>>>> Strange there is AER error? Is 0000:00:1d.0 upstream port of WLAN=
 target? I guess not
> >>>>>>> because 8086:9d18 seems like an Intel device?
> >>>>>>
> >>>>>> Appending =E2=80=98pcie_aspm=3Doff=E2=80=99 to the kernel command =
line will eliminate that error.
> >>>>>>
> >>>>>>> Can you share lspci log:
> >>>>>>>
> >>>>>>> lspci -tv
> >>>>>>
> >>>>>> -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6t=
h Gen Core Pro
> >>>>>> cessor Host Bridge/DRAM Registers
> >>>>>>           +-02.0  Intel Corporation Skylake GT2 [HD Graphics 520]
> >>>>>>           +-08.0  Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v=
5 / 6th/7th/8
> >>>>>> th Gen Core Processor Gaussian Mixture Model
> >>>>>>           +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI =
Controller
> >>>>>>           +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
> >>>>>>           +-17.0  Intel Corporation Sunrise Point-LP SATA Controll=
er [AHCI mode]
> >>>>>>           +-1c.0-[01]--
> >>>>>>           +-1c.5-[02]----00.0  Intel Corporation I210 Gigabit Netw=
ork Connection
> >>>>>>           +-1d.0-[03]----00.0  Qualcomm Technologies, Inc WCN785x =
Wi-Fi 7(802.1
> >>>>>> 1be) 320MHz 2x2 [FastConnect 7800]
> >>>>>>           +-1e.0  Intel Corporation Sunrise Point-LP Serial IO UAR=
T Controller
> >>>>>> #0
> >>>>>>           +-1e.6  Intel Corporation Sunrise Point-LP Secure Digita=
l IO
> >>>>>> Controller
> >>>>>>           +-1f.0  Intel Corporation Sunrise Point-LP LPC Controlle=
r
> >>>>>>           +-1f.2  Intel Corporation Sunrise Point-LP PMC
> >>>>>>           +-1f.3  Intel Corporation Sunrise Point-LP HD Audio
> >>>>>>           +-1f.4  Intel Corporation Sunrise Point-LP SMBus
> >>>>>>           \-1f.6  Intel Corporation Ethernet Connection I219-LM
> >>>>>>
> >>>>>>
> >>>>>>>>> mhi mhi0: Requested to power ON
> >>>>>>>>> mhi mhi0: Power on setup success
> >>>>>>>>> mhi mhi0: Wait for device to enter SBL or Mission mode
> >>>>>>>>> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected =
callback)
> >>>>>>>>> pcieport 0000:00:1d.0: AER: device recovery failed
> >>>>>>>>> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B t=
ype 1),
> >>>>>>>>> will try later with small size
> >>>>>>>>> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0=
xff
> >>>>>>>>> soc_id 0x40170200
> >>>>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timesta=
mp 2025-05-17 00:
> >>>>>>>>> 21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.=
1-QCAHMTSWPL_V1.0_V
> >>>>>>>>> 2.0_SILICONZ-3
> >>>>>>>>> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
> >>>>>>>>> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready ev=
ent: -110
> >>>>>>>>> ath12k_pci 0000:03:00.0: failed to start core: -110
> >>>>>>>>> failed to send QMI message
> >>>>>>>>> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode:=
 4, err =3D -5
> >>>>>>>>> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off
> >>>>>>>>
> >>>>>>>> Tested on same machine with kernel 6.14.8, ath12k works:
> >>>>>>>
> >>>>>>> This seem like stable kernel, can you try latest mainline kernel?
> >>>>>>>
> >>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/
> >>>>>>>
> >>>>>>> or latest ath tree?
> >>>>>>>
> >>>>>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
> >>>>>>
> >>>>>> OK, will try mailine kernel, thanks.
> >>>>>
> >>>>> Please also try latest ath tree if issue still seen with mainline k=
ernel.
> >>>>
> >>>> Both mainline and stable kernels have the same error.
> >>>> Switched to ath.git, my ath12k works.
> >>>>
> >>>> Seems to me that both mainline and stable kernels have fallout.
> >>>
> >>> Great. So seems some fixes/update not landing in mainline/stable yet.
> >>
> >> It's not good that ath12k is broken on the stable kernel 6.15.
> >> Do you know which fixes haven't landed yet?
> >> I'd be happy to help test them, thanks.
> >
> > Pease pick below series and try
> >
> > https://lore.kernel.org/linux-wireless/20250409-ath12k-wcn7850-mlo-supp=
ort-v2-0-3801132ca2c3@quicinc.com/
>
> forget to mention that there would be conflicts when applying but they ar=
e trivial so
> guess you can handle it.
>
> Anyway please let me know if any help you need.

Indeed, there are three files with conflicts: dp_rx.c, hw.c, and hw.h,
but I can handle them.

This patch is against the stable kernel 6.15:
https://0x0.st/s/yfQHTDVDbzo7M5b6dHswjg/83Xm.15

Anyway, after applying this patch, ath12k works properly.

# dmesg | grep ath12k
ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
ath12k_pci 0000:03:00.0: MSI vectors: 16
ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
will try later with small size
ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
soc_id 0x40170200
ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-1=
7 00:
21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL=
_V1.0_V2.0_SILICONZ-3

Hope 6.15.1 will fix this issue.  Thanks.

