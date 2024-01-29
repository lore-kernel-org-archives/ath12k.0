Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59503C47DB3
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXR3P2ZZLGkL0xEiJlvG33ms0PgELeJ161B0XbDc1ko=; b=0z3qTn4FPYm3nQaWikeTC+26oh
	OsvPUdQU45yJE6VSVWeoBw0IFq65c/jruS+SRqylBrCTrjDJv5P4bJsv0s0OXyvaYPR1QiSUzZP8P
	/e52UoiwSTWnl364/fZeY5VonNquH7soVP+zpQLd52ym3tGX26EStmtZjYW2w7bh9t+ZXRDJPdySN
	qx7Sfvjo34N8HJWB3DLxe0zLaNZOY2KBAAHbYMjdz/jI8GaJVtfJb320VTEklRsgeE0ym3DfVPuu1
	NqLVhCycQ1yYQyqwKsKsJssCymOeJws5c+UJscodqnA6dvIsqifVC2kgISFvV6fRV4zKO/0ezZM/Q
	7lxUV7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTGk-0000000DCgW-0HlE
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 15:09:54 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTGh-0000000DCfK-0sAN
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 15:09:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2906dffd8ddso2194968a91.3
        for <ath12k@lists.infradead.org>; Mon, 29 Jan 2024 07:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706540989; x=1707145789; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXR3P2ZZLGkL0xEiJlvG33ms0PgELeJ161B0XbDc1ko=;
        b=h13xI4h9+owBwttv5z829CkVV2BaN9R4SbMJCh2BnLFiY90l9nevFo3m248rUcllgY
         ae1ZMlBNALpKpSnLy/RtYkPUFxuOmAXWFVUWZJlJmoxHMM5RQkCR6DTMo2lotwwKk0X6
         46O48t7X+5JNnrD40OsLgROibeSa2T/su49+MbShUyUvj94zUCrFKZnTmLYJyCbt05Sm
         6FdY3LWcJ5sQFmZduaY0DWxxsNKS+ITflM5N5zTzq17PANVpQIdULPgEQ4usIMyxhmv2
         kNRbvzACRhY58lNXc45fPHmFVciVjC5RttC+VWcgN2fK8sltlGLfwMKUY4gdi3l2G6Md
         3hyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706540989; x=1707145789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXR3P2ZZLGkL0xEiJlvG33ms0PgELeJ161B0XbDc1ko=;
        b=Ip0xAIskem7KA90eVhZCFfuHGyEGUWylvRWDUzAaxaZVwsa6F7ANSMCzLtdFlPMwag
         +u4D//It6VuygDK0WlDeQnrfUyMIgienX7prnoH2q3JTADnXmMEhh5l/nHMZCsdV6RFD
         He9Yn3oJvtygiryykd1kWJVmMmwMt67akP7U20Gfx633Hq+4tQRttbV3esoQJwYdYuIV
         YAim8zf4J9k7DpeaSQGKnSsbFLWY2DhUnWbOUuGrhoNMDv5X2wJpTjvAXQwNdg1j2CUk
         B6onBUCfSwOFK+IiVXozGrgUZXViAZLVF0bs0+aJ0E30zKW0C5d5ZBsiy4IF6bIo2yXX
         h3jQ==
X-Gm-Message-State: AOJu0Yxqnu74+HSwa+D6qH5B8cU1YBAHevpG3xVIGsGGL8XdLFZRUtBD
	13W6+tRLfVZ+71h3EK/orvrDQ1sKnVOYg2mHPiRnEWKzAMlkkkqD3Jb+UFs0XMgIwY/lbq1e4b0
	AxuJrmuCQt3MU/OmQ37e4MPrf8rQ=
X-Google-Smtp-Source: AGHT+IH/ZV1/GVTZ2Ki3j6mHDZrB4m2/4hNbkNF9Cmm38M7xBGf4wnzL2uHMdkJB1u7aAvtfhJSVeuCNdiGh6n6gYQ4=
X-Received: by 2002:a17:90a:b398:b0:290:f7a7:333d with SMTP id
 e24-20020a17090ab39800b00290f7a7333dmr3442286pjr.36.1706540989179; Mon, 29
 Jan 2024 07:09:49 -0800 (PST)
MIME-Version: 1.0
References: <CAFED-jma7ZB17Rcgx9H+eVZ=N6Pty4__gz3B+O2V34XtcEzOGg@mail.gmail.com>
 <87o7d4wasb.fsf@kernel.org>
In-Reply-To: <87o7d4wasb.fsf@kernel.org>
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Mon, 29 Jan 2024 16:09:37 +0100
Message-ID: <CAFED-jmEt2BarCzNkPnECMn6X1j1nmQOrFfTrRgBaQHfTHRYoA@mail.gmail.com>
Subject: Re: qcn9274 hw2.0 in banana pi r64 - LTSSM read fail
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_070951_274668_368CA493 
X-CRM114-Status: GOOD (  11.24  )
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

pon., 29 sty 2024 o 14:04 Kalle Valo <kvalo@kernel.org> napisa=C5=82(a):
>
> Janusz Dziedzic <janusz.dziedzic@gmail.com> writes:
>
> > I have this card in bpi-r64 board. Need to hash: ath12k_pci_enable_ltss=
m()
> > While board hang here (next board restart):
> >
> > val =3D ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM);
> >
> > Is it a 12k bug/MTK pci controller bug?
> > When hash it works correctly.
> >
> > root@OpenWrt:~# lspci -nn
> > 00:00.0 PCI bridge [0604]: MEDIATEK Corp. Device [14c3:3258]
> > 01:00.0 Network controller [0280]: Qualcomm Device [17cb:1109] (rev 01)
> > root@OpenWrt:~#
>
> Sorry, I'm not following you. What do you exactly mean with "hash it"?
>
Have to remove ath12k_pci_enable_ltssm() call.
In other case

ioread32(ab->mem + window_start + PCIE_PCIE_PARF_LTSSM) hang the system.

window_start was 0
PCIE_PCIE_PARF_LTSSM - 0x1e081b0
No idea why this ioread32() fail/hang on bpi-r64

Did smth like this:
static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
{
        if (power_on) {
                //ath12k_pci_enable_ltssm(ab);
                ath12k_pci_clear_all_intrs(ab);
                ath12k_pci_set_wlaon_pwr_ctrl(ab);
        }

After that works correctly.


root@OpenWrt:~# dmesg |grep -e ath -e mhi
[  123.056248] ath12k_pci 0000:01:00.0: assign IRQ: got 0
[  123.061704] ath12k_pci 0000:01:00.0: BAR 0: assigned [mem
0x20000000-0x201fffff 64bit]
[  123.069764] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[  123.076103] ath12k_pci 0000:01:00.0: enabling bus mastering
[  123.089329] ath12k_pci 0000:01:00.0: MSI vectors: 1
[  123.094226] ath12k_pci 0000:01:00.0: Hardware name: qcn9274 hw2.0

   < if ltssm - hang here>

[  123.151406] mhi mhi0: Requested to power ON
[  123.155622] mhi mhi0: Power on setup success
[  123.300815] mhi mhi0: Wait for device to enter SBL or Mission mode
[  123.864188] ath12k_pci 0000:01:00.0: qmi dma allocation failed
(29360128 B type 1), will try later with small size
[  123.893962] ath12k_pci 0000:01:00.0: memory type 10 not supported
[  123.905655] ath12k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb
board_id 0xff soc_id 0x401a2200
[  123.914441] ath12k_pci 0000:01:00.0: fw_version 0x10098b57
fw_build_timestamp 2022-09-19 18:18 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
[  125.997541] ath12k_pci 0000:01:00.0: leaving PCI ASPM disabled to
avoid MHI M2 problems
root@OpenWrt:~#

BR

