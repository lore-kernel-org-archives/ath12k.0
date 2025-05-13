Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C6FC3ABCC
	for <ath12k@archiver.kernel.org>; Tue, 13 May 2025 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlijgUu2FcphuspsSPDdKNmaAcH0tLD5zseZVDFHvqs=; b=A6lSI950EEV9CTSZW6QW6FZjd4
	VnekbY5cvkcR4NoWNNsU3yQBbV3juaNlhPrfqsXEA9XiHbZGNDfu+uWYSR10zV4M4t2AMi/hhrCUZ
	RdOllI7U7NVfwU9+Gx85OYDeJHbjd0zcLQsN/MRpLRa89cU5V80+dIY+8gYprhv2Up7kj/CAE43rx
	TCIwce44VLO2RNB7EWXEaO44PRWESNrV3yM3L5tCzs3XsNPkq6BOTDX8RYS806ua6amtKUcBnGCUS
	YS9PwgopIpHiSM9b7bZfTcWuEC22TJDukCx3qTCMJgS841qrBhfFZP9GhFzQFL4uEXoO/Cj2qrDqT
	rgSZW7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpbt-0000000CTgA-3srW;
	Tue, 13 May 2025 13:23:53 +0000
Received: from mail215c25.carrierzone.com ([64.29.147.109])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpbr-0000000CTdw-1EJd
	for ath12k@lists.infradead.org;
	Tue, 13 May 2025 13:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1747142623;
	bh=tlijgUu2FcphuspsSPDdKNmaAcH0tLD5zseZVDFHvqs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:Reply-to:From;
	b=TW1OuQunmEGWZpEixMs248a5ZuZEw7IAa5sZo0qNOG4Q995dTcepXqOHtf5toClG0
	 iVXLGSg93oxB2B4lkp4YsWPD2Nt1ufyQY2MCzcAVebcjN6asW523qUCiKWuT9J+FYB
	 YX6wOPw/AOeybLPGRg4fbFdrWjtirZdxPuI1qTeQ=
Feedback-ID: pgupta@hindutoo
Received: from mail215c25.carrierzone.com (localhost [127.0.0.1])
	by mail215c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 54DDNcCO3862042
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 13 May 2025 13:23:39 +0000
Received: (from webmail@localhost)
	by mail215c25.carrierzone.com (8.14.9/8.12.2/Submit) id 54DDNcHW3862041;
	Tue, 13 May 2025 09:23:38 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: sidiqbakti@gmail.com
CC: ath12k@lists.infradead.org
Subject: Re: Missing board ID 4634 in board-2.bin for QCN9274
Date: Tue, 13 May 2025 09:23:38 -0400
Message-ID: <1747142618.erfw9u56sgw080w8@mailapp03.register.com>
In-Reply-To: <CAKyS+CbUeRgwv=cjp7Y_ngP9HMDn1BjmqfKENaPGSAtA6vYpqA@mail.gmail.com>
References: <CAKyS+Cbdy25Y2ii+=DLA1EWkvCySYEOmSkBrrcHhy5mXGJ5ksQ@mail.gmail.com>
 <1747054535.59hkitnoow40o44g@mailapp03.register.com>
 <CAKyS+CbUeRgwv=cjp7Y_ngP9HMDn1BjmqfKENaPGSAtA6vYpqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: dmFkZTGHuFfdhSFcIVrYvJXdnpD2+Qdfl0Zq4+u91oeMqT9f+C0KQjSsw3exaO1qGfUemWvyrXduH6BXzUWpp19ZDeUjgTKG0Sl62iswc8gEeZxxoYCL52AV1Q4oSfaWbLm0Sm+w3vWs7a9Nup2DOhKjqd2py7Xi58BCvDtKouNszcpD7YJlAVh7p1mm1ShPcEU+lId7v8/QoQrSOGppr68ZDDToAWjgB/34TZKk4w6oZNl0Fd8WtObmpefkKGdKk7LglZ1NqRnsn16L3h87h9NN4Pvl6U3SmF255T4oIo6qkXfwF/CSaKh+7Q6lmI1uAVyPHjxABthP/DOfdBB3hOWNJjsTnJ5BGZI6FzHzWneXGVuKU20DcAC5XZamTDBvNprE0v+IUjGOnDv0LSlJSIV0fu62cpEe3qOF8zcP39Agd7EPCfGGUvqUPx6YTYNpNeL6+cVVwW2E0qvEZmi9RBKFgWognJdJwMkA1bcCTKlF4YHsrW5RQgFD/l996sJ6St+s0dbXOWxg+o7YrlRtyD+yUNlIWIzfYoZK0rK/gfRBZ+8GKremrGvWlqpCwkF4/TkW3yi+DNiw7/hF2Pg5sw8Baw3pq9Z5ONIF0zdJPT31DflHldtuEqBSLh8l8ZvctOS7X0PkrXIZZT+nAvKd7GPz7o8wi+N/coXt+oD4De8bKOaeRw
X-Rspamd-Result: default: False [0.90 / 6.00];
	FROM_DN_EQ_ADDR(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	HAS_REPLYTO(0.00)[pgupta@hindutool.com];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Rspamd-Status: No, score=0.90
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_062351_610709_343E7A22 
X-CRM114-Status: GOOD (  25.20  )
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
Reply-To: pgupta@hindutool.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wonderful!


Prashant



On Tue, 13 May 2025 19:27:26 +0700, SIDIQ BAKTI <sidiqbakti@gmail.com> wrot=
e:

>> Hi all
>>
>> Just wanted to follow up =E2=80=94 I had contacted Compex for support bu=
t
>> haven=E2=80=99t received a reply yet. Thankfully, Matt shared a modified
>> board-2.bin with the proper board ID (4634), and it worked perfectly
>> on my setup.
>> As I'm based in Indonesia, returning the module to Singapore wasn=E2=80=
=99t
>> really a feasible option =E2=80=94 so this fix was a huge help.
>>
>> Wireless is now fully functional using:
>> - board-2.bin from Matt
>> Firmware from:
>> - WLAN.WBE.1.3.1-00217-QCAHKSWPL_SILICONZ-1
>> (https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/blob/main=
/QCN9274/hw2.0/1.3.1/WLAN.WBE.1.3.1-00217-QCAHKSWPL_SILICONZ-1/firmware-2=
=2Ebin)
>>
>> System log shows the card initializing correctly, and both 2.4GHz and
>> 5GHz radios are operational.
>>
>> [ 0.562172] pcieport 0002:20:00.0: AER: enabled with IRQ 32
>> [ 6.823914] ath12k_pci 0002:21:00.0: BAR 0: assigned [mem
>> 0xf0200000-0xf03fffff 64bit]
>> [ 6.824656] ath12k_pci 0002:21:00.0: BAR 0: error updating
>> (0xf0200004 !=3D 0xffffffff)
>> [ 6.825402] ath12k_pci 0002:21:00.0: enabling device (0000 -> 0002)
>> [ 6.826550] ath12k_pci 0002:21:00.0: MSI vectors: 16
>> [ 6.827017] ath12k_pci 0002:21:00.0: Hardware name: qcn9274 hw2.0
>> [ 7.667959] ath12k_pci 0002:21:00.0: qmi dma allocation failed
>> (29360128 B type 1), will try later with small size
>> [ 7.686944] ath12k_pci 0002:21:00.0: memory type 10 not supported
>> [ 7.693387] ath12k_pci 0002:21:00.0: chip_id 0x0 chip_family 0xb
>> board_id 0x121a soc_id 0x401a2200
>> [ 7.694215] ath12k_pci 0002:21:00.0: fw_version 0x131800d9
>> fw_build_timestamp 2025-03-16 15:58 fw_build_id
>> QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.3.1-00217-QCAHKSWPL_SILICONZ-1
>> [ 10.663409] ath12k_pci 0002:21:00.0: Invalid module id 2
>> [ 10.664037] ath12k_pci 0002:21:00.0: failed to parse tlv -22
>> root@LoliskWrt:~# lspci
>> 0002:20:00.0 PCI bridge: Rockchip Electronics Co., Ltd RK3568 Remote
>> Signal Processor (rev 01)
>> 0002:21:00.0 Network controller: Qualcomm Technologies, Inc
>> QCN62xx/92xx Wireless Network Adapter (rev 01)
>> phy#2
>> Interface phy2-ap0
>> .......
>> ssid ImmortalWrt_5G
>> type AP
>> channel 149 (5745 MHz), width: 80 MHz, center1: 5775 MHz
>> txpower 10.00 dBm
>> .......
>> phy#1
>> Interface phy1-ap0
>> .......
>> ssid ImmortalWrt
>> type AP
>> channel 1 (2412 MHz), width: 20 MHz, center1: 2412 MHz
>> txpower 10.00 dBm
>> .......
>> root@LoliskWrt:~# iw dev phy2-ap0 station dump
>> Station cc:47:40:xx:xx:xx (on phy2-ap0)
>> root@LoliskWrt:~# iw dev phy1-ap0 station dump
>> Station 4a:3f:0b:xx:xx:xx (on phy1-ap0)
>>
>>
>> Thanks again to everyone involved, and especially to Matt for
>> providing the working board file!
>>
>> Best regards,
>> Siddiq
>>
>>
>>
>>
>> Pada Sen, 12 Mei 2025 pukul 19.55 pgupta@hindutool.com
>> menulis:
>> >
>> > You may need to contact Compex. I have three boards each are single ba=
nd (6, 5, 2.4) in order for linux to recognize, the required re-programming=
=2E There is also a software solution with a new .bin file they have, but I=
 opted for hardcoding and sent the modules back to them. I would reach our =
to their support.
>> >
>> >
>> > Hope this helps someone,
>> >
>> > Prashant
>> >
>> >
>> >
>> > On Mon, 12 May 2025 17:29:20 +0700, SIDIQ BAKTI wrote:
>> >
>> > >> Hi ath12k devs,
>> > >>
>> > >> I'm having an issue with chip ID 4634 which is currently not listed=
 in
>> > >> board-2.bin.
>> > >>
>> > >> I recently purchased a WLE7002E25 board from Complex, which uses th=
e
>> > >> QCN9274 chip in a DBDC configuration with a diplexer. I initially
>> > >> assumed the chip ID would be the same as other QCN9274 variants, bu=
t
>> > >> it turns out mine uses a higher board ID (4634), whereas the latest
>> > >> board-2.bin only includes IDs up to 4121.
>> > >>
>> > >> This setup is mainly for hobby purposes. Here are the specs of my p=
latform:
>> > >>
>> > >> **Board**: Photonicat (Ariaboard)
>> > >> - Rockchip RK3568
>> > >> - 4GB LPDDR4 / 64GB eMMC
>> > >> - Renesas RA2E1 Cortex-M23 ultra-low power MCU
>> > >> - Dual M.2 (B+E Key) PCIe via converter to mPCIe
>> > >>
>> > >> **OS:**
>> > >> - ImmortalWrt SNAPSHOT r33919-09241815a1
>> > >> - Kernel: 6.6.87
>> > >> - Unpatched, using latest firmware from [CodeLinaro ath12k-firmware
>> > >> repo](https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware)
>> > >>
>> > >> in the dmesg logs
>> > >>
>> > >> root@LoliskWrt:~# uname -a
>> > >> Linux LoliskWrt 6.6.87 #0 SMP Thu May 1 14:33:10 2025 aarch64 GNU/L=
inux
>> > >> root@LoliskWrt:~# lspci -mnn
>> > >> 0002:20:00.0 "PCI bridge [0604]" "Rockchip Electronics Co., Ltd
>> > >> [1d87]" "RK3568 Remote Signal Processor [3566]" -r01 -p00 "" ""
>> > >> 0002:21:00.0 "Network controller [0280]" "Qualcomm Technologies, In=
c
>> > >> [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]" -r01 -p00
>> > >> "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network
>> > >> Adapter [1109]"
>> > >> root@LoliskWrt:~# find /lib/firmware/ath12k/ -type f | xargs md5sum
>> > >> 25e7a02febd6d419594d074f8d5d6788 /lib/firmware/ath12k/QCN9274/hw2=
=2E0/board-2.bin
>> > >> 3616c32d0e0b8c131b3e0e42e030d82d
>> > >> /lib/firmware/ath12k/QCN9274/hw2.0/firmware-2.bin
>> > >> 08e77df7b9ab5e4c78bfee1c9f025672 /lib/firmware/ath12k/QCN9274/hw2=
=2E0/Notice.txt
>> > >> root@LoliskWrt:~# dmesg | grep ath12k
>> > >> [ 6.822644] ath12k_pci 0002:21:00.0: BAR 0: assigned [mem
>> > >> 0xf0200000-0xf03fffff 64bit]
>> > >> [ 6.824009] ath12k_pci 0002:21:00.0: MSI vectors: 16
>> > >> [ 6.824482] ath12k_pci 0002:21:00.0: Hardware name: qcn9274 hw2.0
>> > >> [ 7.638688] ath12k_pci 0002:21:00.0: qmi dma allocation failed
>> > >> (29360128 B type 1), will try later with small size
>> > >> [ 7.659500] ath12k_pci 0002:21:00.0: memory type 10 not supported
>> > >> [ 7.665751] ath12k_pci 0002:21:00.0: chip_id 0x0 chip_family 0xb
>> > >> board_id 0x121a soc_id 0x401a2200
>> > >> [ 7.666595] ath12k_pci 0002:21:00.0: fw_version 0x141580c7
>> > >> fw_build_timestamp 2024-11-11 11:03 fw_build_id
>> > >> QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>> > >> [ 7.697939] ath12k_pci 0002:21:00.0: failed to fetch board data for
>> > >> bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4634 from
>> > >> ath12k/QCN9274/hw2.0/board-2.bin
>> > >> [ 7.699116] ath12k_pci 0002:21:00.0: failed to fetch board data for
>> > >> bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255 from
>> > >> ath12k/QCN9274/hw2.0/board-2.bin
>> > >> [ 7.700276] ath12k_pci 0002:21:00.0: failed to fetch board.bin from
>> > >> QCN9274/hw2.0
>> > >> [ 7.700940] ath12k_pci 0002:21:00.0: qmi failed to load bdf:
>> > >> [ 7.701442] ath12k_pci 0002:21:00.0: qmi failed to load board data =
file:-12
>> > >>
>> > >>
>> > >> forget the QMI dma, can skip =F0=9F=98=85
>> > >>
>> > >> i already tested using this latest firmware
>> > >> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
>> > >> but still can't find the ID,
>> > >> I tried modifying `board-2.bin` on `board.json` by mapping 4634 to
>> > >> 4121 (closest match) just to test:
>> > >>
>> > >> {
>> > >> "names": [ "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4634" ],
>> > >> "data": "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4121.bin"
>> > >> }
>> > >>
>> > >> This made the device show up in iw dev, but instead of showing 2.4G=
Hz
>> > >> and 5GHz, it shows two 5GHz interfaces. So clearly it's the wrong
>> > >> board file.
>> > >>
>> > >> Would it be possible to add support for board ID 4634 to board-2.bi=
n?
>> > >>
>> > >> Happy to provide further logs or test patches if needed.
>> > >>
>> > >> Thanks in advance =F0=9F=99=8F
>> > >> Regards,
>> > >> Siddiq

