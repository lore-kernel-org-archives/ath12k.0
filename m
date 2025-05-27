Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72841C5AE59
	for <ath12k@archiver.kernel.org>; Tue, 27 May 2025 03:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgvfQKT8giEMdFNnxwwXzYXjvNPlfKykMIt6fKjnc5Q=; b=spOeddTQoMtiiVYJBOCxmefvpp
	bZcxnZWFMqyMC+RKpSoawLeRh9rwG4k4Z4ppL1oCjWWDJzxy0jKs1Lq3vHQggedkUHli0GaaMOBnX
	DDpdEeERo4Ux70oPVmYYMwauPpVEQJFkfXJ7Nc+EXMO9Lbr2A+yuqrDqwVZZ71DcmDg3qxkhfUeT6
	m3XopBmhd2LQTRkADS+M6bBEJfs4WogedmnZDGb1F2/muxFg6zRNmeyYoJxTli0wTKO4ph53RQXue
	Tqv6IAbE7G6IEZyS55YyD9zxVWdxnEbIReZJLoiDrC9COCr3LgnI5KuLXOR+bnhMSbV/DZVgLgznG
	anzxXQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJkYT-00000009nwF-49xw;
	Tue, 27 May 2025 03:00:41 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJkYR-00000009nvs-21y5
	for ath12k@lists.infradead.org;
	Tue, 27 May 2025 03:00:40 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e7dc8910882so107384276.3
        for <ath12k@lists.infradead.org>; Mon, 26 May 2025 20:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748314838; x=1748919638; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgvfQKT8giEMdFNnxwwXzYXjvNPlfKykMIt6fKjnc5Q=;
        b=WKKKePoPBKJ5DhR4ZoOX7jxScV1iX6emrKt48tmrGU+g/p/EPaRsEBHMRq5ty/uJ6I
         uKeFk8XnNfR0H2Md+ptPcRieEoJu5Q95obc5Vs1BPUl3ssO6ccrcwhaLwjj7ewSB3SQ8
         p0uvizptb0cFq+jrWqq9QEXjyUA1brigad29wu1rL/sLeCvjOslSWoaVZNffJ15fW0gf
         w+/b54OmovpxlBQwU3nOU6vmeXUqzzn9gH7aSKYv9lWlRUp3MnfavPThsEjjfofy7EXi
         Dq0+ctTBa5m2332p+AHzCx3vQsFrSg1z9mV6NrDZJAoRdh4xWmwDZOb9JKiw6y/P8G4F
         zV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748314838; x=1748919638;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgvfQKT8giEMdFNnxwwXzYXjvNPlfKykMIt6fKjnc5Q=;
        b=c1nRxqywdJOGbfC1QLwpTj9h/78JTa7jmfZ5D00/mm8K00WGqjOUEcfIfUBhx99Ljb
         md0IAnlUvCdFVi3aDB8iHu3sfVv/Yec/y6Vi4Wc3Hbs6ebxbXb6tDmeEzBQMMqY/DiMj
         DFv3ll8WBD5YBFsAPi+kR7rjS3LsNagEuYj3TfvNbDHBTzkwdicTfEzwjJK0A0/OLD6Q
         0SBZADPwZTl3TTJR6y01hk+NFTXpL2lxgmcmWcHtw/tntyfRVttIdOxa6Pk8ZBw39g7h
         csO2RQc82UVqjir/7UYidIjG9YxYpsh1wWGTPL/3NQyDbcb/SDXX32JIghiX4fi1rXuo
         9qEg==
X-Gm-Message-State: AOJu0Yxphng3C2bxaP4xs+kaeSDtvHRilG6y5Df07C+gKW2mfYktnQ1J
	D+HUVyddnOXhtIYfPEuQSJjoUvCpL+ruxtqJBT5FN72DODIYjwt2hDLkmXk2xjRxjQRKBiAd1l0
	rarNnPz9cf6XNN5lF1TzVkqetU9PWvoTXNwAZ
X-Gm-Gg: ASbGnctK/gI3dHYZ9mFOVBe+pqOpBeVBMHrApOKhBolKTqihASl6Z6NSRAQeO0r6dxb
	JPBz0R3z3RlVZ6h2jNK5EYeyEyP06Bh64y+a2q3+AYDrHs4RRP21cYnsWEQWAnaxzGyVKeFmm+A
	AuznLTDd2LvtZRwQ/Sq3YZOCkVRyq0Njnx
X-Google-Smtp-Source: AGHT+IG1JrYOvg8JyVWikxBTWUjiFOdxqfXFTFc6m3uBlQuJK6rrGnaExurZmudUpV9IJek0ljEwyjJNbwUIChSpGFU=
X-Received: by 2002:a05:6902:18cb:b0:e7c:3db3:9ae2 with SMTP id
 3f1490d57ef6-e7d918a5073mr11419522276.17.1748314837970; Mon, 26 May 2025
 20:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
In-Reply-To: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
From: Doug Brewer <brewer.doug@gmail.com>
Date: Tue, 27 May 2025 11:00:26 +0800
X-Gm-Features: AX0GCFuzz5y7eKpl2xbYLs9IoUYuvSEm0nIDGX2w4aCe3sBW1ZMPuGsCzilyhwU
Message-ID: <CAG0V13SVbBuNXytgW5_NfxKc5T=E+SGScf+Q_ctS5hAeRYgoQg@mail.gmail.com>
Subject: Re: WCN7850 problem on Linux kernel 6.15
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_200039_526401_0AD28A06 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

On Tue, May 27, 2025 at 9:10=E2=80=AFAM Doug Brewer wrote:
>
> Hello,
>
> After upgrading to kernel 6.15, my ath12k failed to start:ath12k_pci
> 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> ath12k_pci 0000:03:00.0: MSI vectors: 16
> ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
> NET: Registered PF_QIPCRTR protocol family
> pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error mess=
age rec
> eived from 0000:00:1d.0
> pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable (Non-Fata=
l), type=3D
> Transaction Layer, (Completer ID)
> pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=3D00008000/=
00010000
> pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
> pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x0000000=
0 0x000
> 00000
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
> pcieport 0000:00:1d.0: AER: device recovery failed
> ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
> will try later with small size
> ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
> soc_id 0x40170200
> ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05=
-17 00:
> 21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCAHMTSW=
PL_V1.0_V
> 2.0_SILICONZ-3
> ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
> ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event: -110
> ath12k_pci 0000:03:00.0: failed to start core: -110
> failed to send QMI message
> ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4, err =
=3D -5
> ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off

Tested on same machine with kernel 6.14.8, ath12k works:

ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
ath12k_pci 0000:03:00.0: MSI vectors: 16
ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error messag=
e rec
eived from 0000:00:1d.0
pcieport 0000:00:1d.0: PCIe Bus Error: severity=3DUncorrectable (Non-Fatal)=
, type=3D
Transaction Layer, (Completer ID)
pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=3D00008000/00=
010000
pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000
0x00000000 0x00000000
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
mhi mhi0: Wait for device to enter SBL or Mission mode
ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
pcieport 0000:00:1d.0: AER: device recovery failed
ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
will try later with small size
ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
soc_id 0x40170200
ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-1=
7 00:
21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL=
_V1.0_V
2.0_SILICONZ-3

