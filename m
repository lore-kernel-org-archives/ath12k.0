Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9639C3ABC3
	for <ath12k@archiver.kernel.org>; Tue, 13 May 2025 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlYjP9lfTkBRIh2QtJInIT2CrUfLmag/Ux84DQGJ0rc=; b=t2XNKywWSXcpGBRG7Hlyviw6k+
	rwUAtz0Z/h0JdcV5km0dcVTWi8CDyqTCGUYxb/Xl0VdpCeFdVNiUwFZM8bITD1KMhMlvcu3qZ7nD+
	GcPKd8uAgnXhxrSSZHH7K8xb1+IblhPJe6fYwd9lUht5yMmi+vnvKHXPPmh4USR/a+3nLwYcTMk1n
	CSsl4nYkNi0Omkz7Z+GHWeYGhBsCytwrY5RL3HJ95sIwJ/C4KbLMWzcRlpuxoH1j/e1cBkxwqCpwN
	u4xrdCgYFtirz1shqSWNYp6Sz/MUYn4z2wA8EPmA/2g2bEFtPdPYPHy14EdsikWyYTFQQ0TWGVdNd
	z8ikBIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEolR-0000000CMJ1-2EXP;
	Tue, 13 May 2025 12:29:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEojV-0000000CM8x-1nlq
	for ath12k@lists.infradead.org;
	Tue, 13 May 2025 12:27:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a108684f90so3389248f8f.1
        for <ath12k@lists.infradead.org>; Tue, 13 May 2025 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747139259; x=1747744059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlYjP9lfTkBRIh2QtJInIT2CrUfLmag/Ux84DQGJ0rc=;
        b=W5mugeuFRE2JNkNZuKVPMlscSHcnO0UwWjbGj/TKXK/rby/6oIvMA+RbLuweRFAzKo
         aTFH6lH0AFAX9Bwvbnju2vFjQ6RIkgFvUlAZfL8bPBt32KGrpFnrn2n62h2s1qrthyDi
         ey0Z8RwiXL931tHanSPi58AQRNqWojGvSdCklLEkjak0r5NAA/2bjN83trWw4CccuZkU
         bQbqvjQocpG2dUOFe8a7hcnEW3G+3x/ZB11vzEWu7l3mKxwaXQ4bgw351E/qoqLg2SVh
         0f1Ow5Bt8TfvPjYLT1ZQQT3V49fRLtnhSWZTe5GfaygV9+T4baJv9PQSh8wvmGXQSWZx
         KlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747139259; x=1747744059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlYjP9lfTkBRIh2QtJInIT2CrUfLmag/Ux84DQGJ0rc=;
        b=wJAXzK6P+Mn8j4FJPpmeVN/kkzr99iUnSPY9Dv5cMEYTt6/O/8Os5LHH/8kVTOz1t1
         UBo5M68iBkplLWQ/QFVGf64Fji3OShD0HD7ZO/p6KgXhrfk3SVCWIKn/qkTewtTjTkq7
         ozCISveLRlZiJldh2MXfVnzWdtDQpUDxRgZxyk8CPyxOl+BPqq73kHRRS9MjgY2QpAJE
         zTDIYoeo1uU5KnYoe3VkmFrtI8TvnegGTL1oyIVa7Y+bgk/Qlni5j4By1bS7J49Eu0WI
         i3cT66aQ60dwE4+TetNGcdhNUdtfKA4/23OFesqLl/EKSXHnrhoaj1Cd8mXPaStX201W
         UQbg==
X-Gm-Message-State: AOJu0YyhdMpr/GJzUckfMxtSlAi8mZ6MlxZRW3EpXxHwkMlcAj5ZjOap
	o8T7C9DAfG99WWHs/d3vTlm5CN/t+XwgCpB3us5b45/MuEV/qg31tXPBduGfhWnC8fyeLj87R1W
	rZETPeE7jTipW8SGGatR0Cy4U5nz7d6asb4s=
X-Gm-Gg: ASbGncs85xGd+Nro3HTSSYnDZli0RIN9ZDSxeJm/fWCUx5mIUZAB73dCi30GAttfGAS
	gD+qRap8jFw06sJt60dxcLPSTGWRj/DdBX6l5qdy+5GAgJ7oZh+4rtO0E4gP7duEkrCM73RQ7vn
	vQvziEsFqV5NelXYkoe4ker3IVgsxQKUSc
X-Google-Smtp-Source: AGHT+IFoII0T7eEHgOJSrPpMLQSKDM7kIGA3UGOhVsWNaqaRqslXq9T/J+YYHp5w0+h3Ym9QkgDQocljxqHdwI+XhUI=
X-Received: by 2002:a5d:47a5:0:b0:3a2:ffbe:3676 with SMTP id
 ffacd0b85a97d-3a2ffbe367emr3147852f8f.49.1747139259020; Tue, 13 May 2025
 05:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAKyS+Cbdy25Y2ii+=DLA1EWkvCySYEOmSkBrrcHhy5mXGJ5ksQ@mail.gmail.com>
 <1747054535.59hkitnoow40o44g@mailapp03.register.com>
In-Reply-To: <1747054535.59hkitnoow40o44g@mailapp03.register.com>
From: SIDIQ BAKTI <sidiqbakti@gmail.com>
Date: Tue, 13 May 2025 19:27:26 +0700
X-Gm-Features: AX0GCFu7b9FUFuaP9TRiUdlD3L-R_p3E4k5glWlmkCNsqJnThDrLVS1QDaD4-a4
Message-ID: <CAKyS+CbUeRgwv=cjp7Y_ngP9HMDn1BjmqfKENaPGSAtA6vYpqA@mail.gmail.com>
Subject: Re: Missing board ID 4634 in board-2.bin for QCN9274
To: pgupta@hindutool.com
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_052741_475521_ADD75E64 
X-CRM114-Status: GOOD (  30.32  )
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

Hi all

Just wanted to follow up =E2=80=94 I had contacted Compex for support but
haven=E2=80=99t received a reply yet. Thankfully, Matt shared a modified
board-2.bin with the proper board ID (4634), and it worked perfectly
on my setup.
As I'm based in Indonesia, returning the module to Singapore wasn=E2=80=99t
really a feasible option =E2=80=94 so this fix was a huge help.

Wireless is now fully functional using:
- board-2.bin from Matt
Firmware from:
- WLAN.WBE.1.3.1-00217-QCAHKSWPL_SILICONZ-1
(https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/blob/main/QC=
N9274/hw2.0/1.3.1/WLAN.WBE.1.3.1-00217-QCAHKSWPL_SILICONZ-1/firmware-2.bin)

System log shows the card initializing correctly, and both 2.4GHz and
5GHz radios are operational.

[    0.562172] pcieport 0002:20:00.0: AER: enabled with IRQ 32
[    6.823914] ath12k_pci 0002:21:00.0: BAR 0: assigned [mem
0xf0200000-0xf03fffff 64bit]
[    6.824656] ath12k_pci 0002:21:00.0: BAR 0: error updating
(0xf0200004 !=3D 0xffffffff)
[    6.825402] ath12k_pci 0002:21:00.0: enabling device (0000 -> 0002)
[    6.826550] ath12k_pci 0002:21:00.0: MSI vectors: 16
[    6.827017] ath12k_pci 0002:21:00.0: Hardware name: qcn9274 hw2.0
[    7.667959] ath12k_pci 0002:21:00.0: qmi dma allocation failed
(29360128 B type 1), will try later with small size
[    7.686944] ath12k_pci 0002:21:00.0: memory type 10 not supported
[    7.693387] ath12k_pci 0002:21:00.0: chip_id 0x0 chip_family 0xb
board_id 0x121a soc_id 0x401a2200
[    7.694215] ath12k_pci 0002:21:00.0: fw_version 0x131800d9
fw_build_timestamp 2025-03-16 15:58 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.3.1-00217-QCAHKSWPL_SILICONZ-1
[   10.663409] ath12k_pci 0002:21:00.0: Invalid module id 2
[   10.664037] ath12k_pci 0002:21:00.0: failed to parse tlv -22
root@LoliskWrt:~# lspci
0002:20:00.0 PCI bridge: Rockchip Electronics Co., Ltd RK3568 Remote
Signal Processor (rev 01)
0002:21:00.0 Network controller: Qualcomm Technologies, Inc
QCN62xx/92xx Wireless Network Adapter (rev 01)
phy#2
        Interface phy2-ap0
                .......
                ssid ImmortalWrt_5G
                type AP
                channel 149 (5745 MHz), width: 80 MHz, center1: 5775 MHz
                txpower 10.00 dBm
                .......
phy#1
        Interface phy1-ap0
                .......
                ssid ImmortalWrt
                type AP
                channel 1 (2412 MHz), width: 20 MHz, center1: 2412 MHz
                txpower 10.00 dBm
                .......
root@LoliskWrt:~# iw dev phy2-ap0 station dump
Station cc:47:40:xx:xx:xx (on phy2-ap0)
root@LoliskWrt:~# iw dev phy1-ap0 station dump
Station 4a:3f:0b:xx:xx:xx (on phy1-ap0)


Thanks again to everyone involved, and especially to Matt for
providing the working board file!

Best regards,
Siddiq




Pada Sen, 12 Mei 2025 pukul 19.55 pgupta@hindutool.com
<pgupta@hindutool.com> menulis:
>
> You may need to contact Compex.  I have three boards each are single band=
 (6, 5, 2.4) in order for linux to recognize, the required re-programming. =
 There is also a software solution with a new .bin file they have, but I op=
ted for hardcoding and sent the modules back to them.  I would reach our to=
 their support.
>
>
> Hope this helps someone,
>
> Prashant
>
>
>
> On Mon, 12 May 2025 17:29:20 +0700, SIDIQ BAKTI <sidiqbakti@gmail.com> wr=
ote:
>
> >> Hi ath12k devs,
> >>
> >> I'm having an issue with chip ID 4634 which is currently not listed in
> >> board-2.bin.
> >>
> >> I recently purchased a WLE7002E25 board from Complex, which uses the
> >> QCN9274 chip in a DBDC configuration with a diplexer. I initially
> >> assumed the chip ID would be the same as other QCN9274 variants, but
> >> it turns out mine uses a higher board ID (4634), whereas the latest
> >> board-2.bin only includes IDs up to 4121.
> >>
> >> This setup is mainly for hobby purposes. Here are the specs of my plat=
form:
> >>
> >> **Board**: Photonicat (Ariaboard)
> >> - Rockchip RK3568
> >> - 4GB LPDDR4 / 64GB eMMC
> >> - Renesas RA2E1 Cortex-M23 ultra-low power MCU
> >> - Dual M.2 (B+E Key) PCIe via converter to mPCIe
> >>
> >> **OS:**
> >> - ImmortalWrt SNAPSHOT r33919-09241815a1
> >> - Kernel: 6.6.87
> >> - Unpatched, using latest firmware from [CodeLinaro ath12k-firmware
> >> repo](https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware)
> >>
> >> in the dmesg logs
> >>
> >> root@LoliskWrt:~# uname -a
> >> Linux LoliskWrt 6.6.87 #0 SMP Thu May 1 14:33:10 2025 aarch64 GNU/Linu=
x
> >> root@LoliskWrt:~# lspci -mnn
> >> 0002:20:00.0 "PCI bridge [0604]" "Rockchip Electronics Co., Ltd
> >> [1d87]" "RK3568 Remote Signal Processor [3566]" -r01 -p00 "" ""
> >> 0002:21:00.0 "Network controller [0280]" "Qualcomm Technologies, Inc
> >> [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]" -r01 -p00
> >> "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network
> >> Adapter [1109]"
> >> root@LoliskWrt:~# find /lib/firmware/ath12k/ -type f | xargs md5sum
> >> 25e7a02febd6d419594d074f8d5d6788 /lib/firmware/ath12k/QCN9274/hw2.0/bo=
ard-2.bin
> >> 3616c32d0e0b8c131b3e0e42e030d82d
> >> /lib/firmware/ath12k/QCN9274/hw2.0/firmware-2.bin
> >> 08e77df7b9ab5e4c78bfee1c9f025672 /lib/firmware/ath12k/QCN9274/hw2.0/No=
tice.txt
> >> root@LoliskWrt:~# dmesg | grep ath12k
> >> [ 6.822644] ath12k_pci 0002:21:00.0: BAR 0: assigned [mem
> >> 0xf0200000-0xf03fffff 64bit]
> >> [ 6.824009] ath12k_pci 0002:21:00.0: MSI vectors: 16
> >> [ 6.824482] ath12k_pci 0002:21:00.0: Hardware name: qcn9274 hw2.0
> >> [ 7.638688] ath12k_pci 0002:21:00.0: qmi dma allocation failed
> >> (29360128 B type 1), will try later with small size
> >> [ 7.659500] ath12k_pci 0002:21:00.0: memory type 10 not supported
> >> [ 7.665751] ath12k_pci 0002:21:00.0: chip_id 0x0 chip_family 0xb
> >> board_id 0x121a soc_id 0x401a2200
> >> [ 7.666595] ath12k_pci 0002:21:00.0: fw_version 0x141580c7
> >> fw_build_timestamp 2024-11-11 11:03 fw_build_id
> >> QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> >> [ 7.697939] ath12k_pci 0002:21:00.0: failed to fetch board data for
> >> bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4634 from
> >> ath12k/QCN9274/hw2.0/board-2.bin
> >> [ 7.699116] ath12k_pci 0002:21:00.0: failed to fetch board data for
> >> bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255 from
> >> ath12k/QCN9274/hw2.0/board-2.bin
> >> [ 7.700276] ath12k_pci 0002:21:00.0: failed to fetch board.bin from
> >> QCN9274/hw2.0
> >> [ 7.700940] ath12k_pci 0002:21:00.0: qmi failed to load bdf:
> >> [ 7.701442] ath12k_pci 0002:21:00.0: qmi failed to load board data fil=
e:-12
> >>
> >>
> >> forget the QMI dma, can skip =F0=9F=98=85
> >>
> >> i already tested using this latest firmware
> >> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
> >> but still can't find the ID,
> >> I tried modifying `board-2.bin` on `board.json` by mapping 4634 to
> >> 4121 (closest match) just to test:
> >>
> >> {
> >> "names": [ "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4634" ],
> >> "data": "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4121.bin"
> >> }
> >>
> >> This made the device show up in iw dev, but instead of showing 2.4GHz
> >> and 5GHz, it shows two 5GHz interfaces. So clearly it's the wrong
> >> board file.
> >>
> >> Would it be possible to add support for board ID 4634 to board-2.bin?
> >>
> >> Happy to provide further logs or test patches if needed.
> >>
> >> Thanks in advance =F0=9F=99=8F
> >> Regards,
> >> Siddiq

