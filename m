Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C024EC2BD09
	for <ath12k@archiver.kernel.org>; Mon, 15 Jul 2024 05:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkcWapdn2bZfVxgpoE+uWQcegYMmX5sJF8m6MUMcXco=; b=fpErWu26eNRhCKUP6yCYBcCfzQ
	1SqTakqgr4PqCOPON/Wuc/VVOkUwbOLuJtpF5z1xMhoNrOQO7A9atKo0RaCoDKMQNU015kGYVFeEL
	tDkh3Se0QDwKGJRQwEW3rijZWbpZ020WrPwgewBvVfAmRj73+8rS2fP3LUn5TgRz9izJ10E8Jqfc/
	dzVnX+plF1EjSf8YikeGvpvynEulHauXf8c9KS5L5TbJ7zVvfGANjy1+XdqrMlDDgqgEMMZrcZ0/a
	oZFSQ4K+2Li93pk4GI+UqQgguMfiDNml5fd651+PXV7px66Q1nlWsWe1digkTFYbSCN/vd8uicqr2
	ItervZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTEYd-00000005x9i-1pl2
	for ath12k@archiver.kernel.org;
	Mon, 15 Jul 2024 05:47:31 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTEYa-00000005x7q-0Pvu
	for ath12k@lists.infradead.org;
	Mon, 15 Jul 2024 05:47:29 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a77dc08db60so453501266b.1
        for <ath12k@lists.infradead.org>; Sun, 14 Jul 2024 22:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721022446; x=1721627246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkcWapdn2bZfVxgpoE+uWQcegYMmX5sJF8m6MUMcXco=;
        b=VZeqLlMCI7p7MHuYdDXyP5PQ6RadXN9UGc/3b6MBqAWZKszejCxLwu+3nl+sO6Siie
         XoKQ4Oi6emLXVA0Gkg9WyoMuDJGTOzUTfDYlTS+bcLX0TrXyr6ahy1sLlfU5QV3dLSgw
         Q3w6fRG8S8rmQbVRnfBnqzmOHDyRsSLxq+IHpE7mkVsCZhG8+/KenpZVu6ZjqfKO8EKf
         ipXK4mm1fa+/Xe8WMbe8TbWdnuQSVsGxUohUUJaHHTWTLThxgqh9pKC+crnt2jJpSXLK
         WG2xnYFeqVBHi9kvt07ogs0H5Z1JS/kKUHeQtCVtWVpd8ADs882MViVCc2zjZVvuuZ9h
         LrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721022446; x=1721627246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkcWapdn2bZfVxgpoE+uWQcegYMmX5sJF8m6MUMcXco=;
        b=PTlKRq+5ql2mtGGfngwwSMHc+/FjfGp+VOO2WwHn0LgAwwU5Y6II8dY8kJozfuydtZ
         jsSJ34XMsIWii77lgk09vFAo4c7+AKyKEHC2LsUOqBYKxVHi/VOO9RGjC7sx8GfU+PuI
         mEishyk7/qh2zPQYqVxf2ANm2uN4IRfnE64qxZMhqjTJJMjJuSN72FJgC3pUnu/vJh8e
         Y6ANmB3eVVxbmb35zSkGOxSuUHTm39VxHZwtkn7eu+teTWxO5T0j7YUM2MNYEaLBaBM0
         ok8uqBzlvEThOgnN8jICdU/efTusO+SzIXLFxtYY5M65kdeIpbEkejIrhmeN16mX3wP3
         a/Gg==
X-Gm-Message-State: AOJu0YyC5Vcu3V9WCsfmN3yGEYQ09EX3VTrHdHBDWOa74GngE9iUXXzY
	1ZXrGrcmBY1+fGbDMrqEFBfjRGZrXTZIIMZaHE9oY2CXOeYzPtG4ySB+CbXrNvpe9cSy7ck476+
	N2tkL6pNcUlYD+hqy9gORLWU0A+c=
X-Google-Smtp-Source: AGHT+IEDyx7evdXVWNoMoROZ93eatG1mcQI72xy1qx8bzuYiBK9tHiTCSiq+5dKhDUuCzDWfbVjWjAFXMI4cquAvE70=
X-Received: by 2002:a17:906:c154:b0:a72:455f:e8b with SMTP id
 a640c23a62f3a-a780b5057b4mr1647242366b.0.1721022445656; Sun, 14 Jul 2024
 22:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAFED-jma7ZB17Rcgx9H+eVZ=N6Pty4__gz3B+O2V34XtcEzOGg@mail.gmail.com>
 <87o7d4wasb.fsf@kernel.org> <CAFED-jmEt2BarCzNkPnECMn6X1j1nmQOrFfTrRgBaQHfTHRYoA@mail.gmail.com>
 <CAFED-j=fi5h_3G4W4v=ixWFG1-ouC1FuM8NhScduW94JONfusg@mail.gmail.com>
In-Reply-To: <CAFED-j=fi5h_3G4W4v=ixWFG1-ouC1FuM8NhScduW94JONfusg@mail.gmail.com>
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Mon, 15 Jul 2024 07:47:14 +0200
Message-ID: <CAFED-jnSKEkw5b4Ce_zM_h9wNnv0p89Q7yhDRq7aMcQDXR=+HA@mail.gmail.com>
Subject: Re: qcn9274 hw2.0 in banana pi r64 - LTSSM read fail
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_224728_184085_C4991998 
X-CRM114-Status: GOOD (  21.03  )
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

=C5=9Br., 31 sty 2024 o 18:08 Janusz Dziedzic <janusz.dziedzic@gmail.com> n=
apisa=C5=82(a):
>
> pon., 29 sty 2024 o 16:09 Janusz Dziedzic <janusz.dziedzic@gmail.com>
> napisa=C5=82(a):
> >
> > pon., 29 sty 2024 o 14:04 Kalle Valo <kvalo@kernel.org> napisa=C5=82(a)=
:
> > >
> > > Janusz Dziedzic <janusz.dziedzic@gmail.com> writes:
> > >
> > > > I have this card in bpi-r64 board. Need to hash: ath12k_pci_enable_=
ltssm()
> > > > While board hang here (next board restart):
> > > >
> > > > val =3D ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM);
> > > >
> > > > Is it a 12k bug/MTK pci controller bug?
> > > > When hash it works correctly.
> > > >
> > > > root@OpenWrt:~# lspci -nn
> > > > 00:00.0 PCI bridge [0604]: MEDIATEK Corp. Device [14c3:3258]
> > > > 01:00.0 Network controller [0280]: Qualcomm Device [17cb:1109] (rev=
 01)
> > > > root@OpenWrt:~#
> > >
> > > Sorry, I'm not following you. What do you exactly mean with "hash it"=
?
> > >
> > Have to remove ath12k_pci_enable_ltssm() call.
> > In other case
> >
> > ioread32(ab->mem + window_start + PCIE_PCIE_PARF_LTSSM) hang the system=
.
> >
> > window_start was 0
> > PCIE_PCIE_PARF_LTSSM - 0x1e081b0
> > No idea why this ioread32() fail/hang on bpi-r64
> >
> > Did smth like this:
> > static void ath12k_pci_sw_reset(struct ath12k_base *ab, bool power_on)
> > {
> >         if (power_on) {
> >                 //ath12k_pci_enable_ltssm(ab);
> >                 ath12k_pci_clear_all_intrs(ab);
> >                 ath12k_pci_set_wlaon_pwr_ctrl(ab);
> >         }
> >
> > After that works correctly.
> >
> >
> > root@OpenWrt:~# dmesg |grep -e ath -e mhi
> > [  123.056248] ath12k_pci 0000:01:00.0: assign IRQ: got 0
> > [  123.061704] ath12k_pci 0000:01:00.0: BAR 0: assigned [mem
> > 0x20000000-0x201fffff 64bit]
> > [  123.069764] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> > [  123.076103] ath12k_pci 0000:01:00.0: enabling bus mastering
> > [  123.089329] ath12k_pci 0000:01:00.0: MSI vectors: 1
> > [  123.094226] ath12k_pci 0000:01:00.0: Hardware name: qcn9274 hw2.0
> >
> >    < if ltssm - hang here>
> >
> > [  123.151406] mhi mhi0: Requested to power ON
> > [  123.155622] mhi mhi0: Power on setup success
> > [  123.300815] mhi mhi0: Wait for device to enter SBL or Mission mode
> > [  123.864188] ath12k_pci 0000:01:00.0: qmi dma allocation failed
> > (29360128 B type 1), will try later with small size
> > [  123.893962] ath12k_pci 0000:01:00.0: memory type 10 not supported
> > [  123.905655] ath12k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb
> > board_id 0xff soc_id 0x401a2200
> > [  123.914441] ath12k_pci 0000:01:00.0: fw_version 0x10098b57
> > fw_build_timestamp 2022-09-19 18:18 fw_build_id
> > QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> > [  125.997541] ath12k_pci 0000:01:00.0: leaving PCI ASPM disabled to
> > avoid MHI M2 problems
> > root@OpenWrt:~#
> >
>
> More logs:
> root@OpenWrt:~# insmod ./ath12k.ko debug_mask=3D0xffffffff
> [   60.936142] ath12k_pci 0000:01:00.0: assign IRQ: got 0
> [   60.941605] ath12k_pci 0000:01:00.0: BAR 0: assigned [mem
> 0x20000000-0x201fffff 64bit]
> [   60.949676] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [   60.955987] ath12k_pci 0000:01:00.0: enabling bus mastering
> [   60.961599] ath12k_pci 0000:01:00.0: boot pci_mem 0x00000000063f9f64
> [   60.967957] ath12k_pci 0000:01:00.0: pci probe 17cb:1109 17cb:1109
> [   60.974132] ath12k_pci 0000:01:00.0: ath12k_pci_read32 called with
> offset 0x1B00000
> [   60.981792] ath12k_pci 0000:01:00.0: ath12k_pci_read32 before
> ioread32() (window_start =3D=3D WINDOW_START) offset 0x1B00000
> window_start 524
> 288
> [   60.994398] ath12k_pci 0000:01:00.0: pci tcsr_soc_hw_version major 2 m=
inor 0
> [   61.001672] mtk-pcie 1a143000.pcie: msi#0 address_hi 0x0 address_lo
> 0x44e5d0c0
> [   61.009028] ath12k_pci 0000:01:00.0: request MSI one vector
> [   61.014594] ath12k_pci 0000:01:00.0: MSI vectors: 1
> [   61.019496] ath12k_pci 0000:01:00.0: msi base data is 0
> [   61.024714] ath12k_pci 0000:01:00.0: Hardware name: qcn9274 hw2.0
> [   61.030813] ath12k_pci 0000:01:00.0: Assign MSI to user: MHI,
> num_vectors: 3, user_base_data: 0, base_vector: 0
> [   61.040901] ath12k_pci 0000:01:00.0: Number of assigned MSI for MHI
> is 3, base vector is 0
> [   61.049700] ath12k_pci 0000:01:00.0: Assign MSI to user: CE,
> num_vectors: 1, user_base_data: 0, base_vector: 0
> [   61.059832] ath12k_pci 0000:01:00.0: Assign MSI to user: DP,
> num_vectors: 1, user_base_data: 0, base_vector: 0
> [   61.069873] ath12k_pci 0000:01:00.0: irq:155 group:0
> [   61.074841] ath12k_pci 0000:01:00.0: irq:155 group:1
> [   61.079811] ath12k_pci 0000:01:00.0: irq:155 group:2
> [   61.084771] ath12k_pci 0000:01:00.0: irq:155 group:3
> [   61.089739] ath12k_pci 0000:01:00.0: irq:155 group:4
> [   61.094701] ath12k_pci 0000:01:00.0: irq:155 group:5
> [   61.099676] ath12k_pci 0000:01:00.0: irq:155 group:6
> [   61.104637] ath12k_pci 0000:01:00.0: irq:155 group:7
> [   61.109613] ath12k_pci 0000:01:00.0: pci after request_irq msi_ep_base=
_data 0
> [   61.116839] ath12k_pci 0000:01:00.0: ath12k_pci_read32 called with
> offset 0x1E081B0
> [   61.124492] ath12k_pci 0000:01:00.0: ath12k_pci_read32 before
> ioread32() (window_start !=3D WINDOW_START) offset 0x1E081B0
> window_start 0
>
> F0: 102B 0000
> F5: 480A 0031
> F5: 480A 0031
> F3: 0000 0000
> V0: 0000 0000 [0001]
> 00: 0000 0000
> BP: 0400 0041 [0000]
> G0: 1190 0000
> T0: 0000 02ED [000F]
> Jump to BL
>
> NOTICE:  BL2: v2.9.0(release):OpenWrt v2023-10-13-0ea67d76-1 (mt7622-emmc=
-2ddr)
>
> And from my laptop I see:
> [  814.942643] ath12k_pci 0000:01:00.0: BAR 0: assigned [mem
> 0xf6400000-0xf65fffff 64bit]
> [  814.942944] ath12k_pci 0000:01:00.0: Hardware name: qcn9274 hw2.0
> [  814.968821] ath12k_pci 0000:01:00.0: pci ltssm 0xffffffff
> [  814.968844] ath12k_pci 0000:01:00.0: pci pcie_hot_rst 0xffffffff
>
> So, seems PC in case of ioread32() fail (not mapped) report 0xffffffff
> - while MTK on bpi-r64 just hang.
> Anyway, guess PCIE_PCIE_PARF_LTSSM is not correctly mapped?
> Please check.
>

See the same on banana PI R4/R64 with WCN7850:
 - Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2
[FastConnect 7800] (rev 01)

Using:
 - Loading modules backported from Linux version v6.9.9-0-g28fdf4518483
 -
root@bpi-r4-92bab365400b:~# dmesg |grep ath12
[   11.053570] ath12k_pci 0001:01:00.0: assign IRQ: got 0
[   11.058877] ath12k_pci 0001:01:00.0: BAR 0: assigned [mem
0x38200000-0x383fffff 64bit]
[   11.066846] ath12k_pci 0001:01:00.0: enabling device (0000 -> 0002)
[   11.073206] ath12k_pci 0001:01:00.0: enabling bus mastering
[   11.220499] ath12k_pci 0001:01:00.0: MSI vectors: 16
[   11.225472] ath12k_pci 0001:01:00.0: Hardware name: wcn7850 hw2.0
[   12.349947] ath12k_pci 0001:01:00.0: qmi dma allocation failed
(7077888 B type 1), will try later with small size
[   12.372349] ath12k_pci 0001:01:00.0: chip_id 0x2 chip_family 0x4
board_id 0x10e soc_id 0x40170200
[   12.381234] ath12k_pci 0001:01:00.0: fw_version 0x100301e1
fw_build_timestamp 2023-12-06 04:05 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICO=
NZ-3

Any hint which patch could I apply to 6.9.9 to fix this ioread32/iowrite32?

BR
Janusz

