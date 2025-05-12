Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4A7C3ABC3
	for <ath12k@archiver.kernel.org>; Mon, 12 May 2025 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiBuYsu24PWFpZzl5PryEnD2vsEyUsDIOea1vuC2rBA=; b=W+bj1TjADX+aVUz+iVihep6g7k
	0rRAj3XNzD5s5iQVlQ5M0NzPPyHebOJ89SiR09nAPXmX9GREjV+euI4+2lYmEWhApOXUd9DZqLoYR
	ajgEy8h1SEyCrdaQcgM2by9hi27Dsrm01z4FYzWit/BdktYBqoydSxLACcSWMF1VVe2B45455KkDv
	A0LEC6U2zFGy4XdZFhs39Sdm1hwL1Nl3kfffZpzEuSBvmkgkUoXEZB2CMGlv0NH/vLNb5VlmW2T6t
	E23fcCUTOWZNq98OdVrkS9Z62eNI+DmPSwUrPNwaqXO9pOejgoNvWbIuj5sVM3Sv/2qs4EyY0sT/w
	2iRH3ueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETCQ-00000009YH7-2Ly7;
	Mon, 12 May 2025 13:28:06 +0000
Received: from mail215c25.carrierzone.com ([64.29.147.109])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESh6-00000009SRX-339B
	for ath12k@lists.infradead.org;
	Mon, 12 May 2025 12:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1747054541;
	bh=LmLNNz4Gy4IeZMk/hLlx+k+Lvn2erB1qt9EcKQFI2ic=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:Reply-to:From;
	b=QSSwHcVWBzgLaew8oLsGwRNMJyG6n5lRiXJfBzwRs2fkvcAXyBLyEywMT1dReNb0E
	 8sLyePEFfG1B6cHDtRLGILYbV5HOYFzEtfW3fweTiEvgJfEbD+ul+ddFAt6Gl5QS2P
	 VqyRXK+O+AFcRjILtpPxgqMewXxe7M3jjrVCfrAU=
Feedback-ID: pgupta@hindutoo
Received: from mail215c25.carrierzone.com (localhost [127.0.0.1])
	by mail215c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 54CCtaiR2369382
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 12 May 2025 12:55:36 +0000
Received: (from webmail@localhost)
	by mail215c25.carrierzone.com (8.14.9/8.12.2/Submit) id 54CCtZvY2369377;
	Mon, 12 May 2025 08:55:35 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: sidiqbakti@gmail.com, ath12k@lists.infradead.org
Subject: Re: Missing board ID 4634 in board-2.bin for QCN9274
Date: Mon, 12 May 2025 08:55:35 -0400
Message-ID: <1747054535.59hkitnoow40o44g@mailapp03.register.com>
In-Reply-To: <CAKyS+Cbdy25Y2ii+=DLA1EWkvCySYEOmSkBrrcHhy5mXGJ5ksQ@mail.gmail.com>
References: <CAKyS+Cbdy25Y2ii+=DLA1EWkvCySYEOmSkBrrcHhy5mXGJ5ksQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: dmFkZTGKAru76KymTqsCb3eTtqs/JPuDC9tkI1/wrFx9x/bqoZN11IlfvkNBzNGUCIhm5crm1iVrDYujfMPZ4wU2rGFTFmaGD10B0T1Tbr7o22OcCs8bifTrh+88AJeBQS7ncjWZ6Qa3ZyT/QM8qd81gDWSoe0Z+847nAH9rbU1tRA9z4ws0gjuWurTy0EiTmiB7+uN6T7r5juhZHoo04LzY4Zq/OFEUawpH/kIwdc/EYfrXkPxIsuC6PKIvJPPY7eGom0vgbK3ssLMCRoKwY1tUd1v3WbhD/IFU7r0YunQYHWQQajoDyUFA4eY3jF6xbx0qRrpqbnaR8vXD3iY0QRfOflHgLlYx9THZCJLdZHXziJivWPY9TV3WRtLBhMhUIccyc82H2jMdf5AdslWeGFNGUcWj2OxhJVNkAeWKj6rLdmsschL1G29jrQbST6u9bKeLRwHQLcifZDzjmfGMw8FdFXfxIKqBmw9xbQpERRrG02a6rOvAiKibUHzZdMjjm4Gf4vvlSIgmvKt85iAsdKR7UH8eJvlPET3iwqcMf7l3iPeTCcCv3/vdlYtiu+0abcBhTf5Uj9HmUUSacmrrlzrowgQweAOFmdoyS2m+F8umIr0G3CucJ7odFJhWrTTbgVxTrBroleAw+1DTteN8TF2kHKpL0pMD+ZkxZzM+hTmEr0ycCw
X-Rspamd-Result: default: False [0.90 / 6.00];
	FROM_DN_EQ_ADDR(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
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
X-CRM114-CacheID: sfid-20250512_055545_060620_DD75A669 
X-CRM114-Status: GOOD (  14.32  )
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

You may need to contact Compex.  I have three boards each are single band (=
6, 5, 2.4) in order for linux to recognize, the required re-programming.=C2=
=A0 There is also a software solution with a new .bin file they have, but I=
 opted for hardcoding and sent the modules back to them.=C2=A0 I would reac=
h our to their support.


Hope this helps someone,

Prashant



On Mon, 12 May 2025 17:29:20 +0700, SIDIQ BAKTI <sidiqbakti@gmail.com> wrot=
e:

>> Hi ath12k devs,
>>
>> I'm having an issue with chip ID 4634 which is currently not listed in
>> board-2.bin.
>>
>> I recently purchased a WLE7002E25 board from Complex, which uses the
>> QCN9274 chip in a DBDC configuration with a diplexer. I initially
>> assumed the chip ID would be the same as other QCN9274 variants, but
>> it turns out mine uses a higher board ID (4634), whereas the latest
>> board-2.bin only includes IDs up to 4121.
>>
>> This setup is mainly for hobby purposes. Here are the specs of my platfo=
rm:
>>
>> **Board**: Photonicat (Ariaboard)
>> - Rockchip RK3568
>> - 4GB LPDDR4 / 64GB eMMC
>> - Renesas RA2E1 Cortex-M23 ultra-low power MCU
>> - Dual M.2 (B+E Key) PCIe via converter to mPCIe
>>
>> **OS:**
>> - ImmortalWrt SNAPSHOT r33919-09241815a1
>> - Kernel: 6.6.87
>> - Unpatched, using latest firmware from [CodeLinaro ath12k-firmware
>> repo](https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware)
>>
>> in the dmesg logs
>>
>> root@LoliskWrt:~# uname -a
>> Linux LoliskWrt 6.6.87 #0 SMP Thu May 1 14:33:10 2025 aarch64 GNU/Linux
>> root@LoliskWrt:~# lspci -mnn
>> 0002:20:00.0 "PCI bridge [0604]" "Rockchip Electronics Co., Ltd
>> [1d87]" "RK3568 Remote Signal Processor [3566]" -r01 -p00 "" ""
>> 0002:21:00.0 "Network controller [0280]" "Qualcomm Technologies, Inc
>> [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]" -r01 -p00
>> "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network
>> Adapter [1109]"
>> root@LoliskWrt:~# find /lib/firmware/ath12k/ -type f | xargs md5sum
>> 25e7a02febd6d419594d074f8d5d6788 /lib/firmware/ath12k/QCN9274/hw2.0/boar=
d-2.bin
>> 3616c32d0e0b8c131b3e0e42e030d82d
>> /lib/firmware/ath12k/QCN9274/hw2.0/firmware-2.bin
>> 08e77df7b9ab5e4c78bfee1c9f025672 /lib/firmware/ath12k/QCN9274/hw2.0/Noti=
ce.txt
>> root@LoliskWrt:~# dmesg | grep ath12k
>> [ 6.822644] ath12k_pci 0002:21:00.0: BAR 0: assigned [mem
>> 0xf0200000-0xf03fffff 64bit]
>> [ 6.824009] ath12k_pci 0002:21:00.0: MSI vectors: 16
>> [ 6.824482] ath12k_pci 0002:21:00.0: Hardware name: qcn9274 hw2.0
>> [ 7.638688] ath12k_pci 0002:21:00.0: qmi dma allocation failed
>> (29360128 B type 1), will try later with small size
>> [ 7.659500] ath12k_pci 0002:21:00.0: memory type 10 not supported
>> [ 7.665751] ath12k_pci 0002:21:00.0: chip_id 0x0 chip_family 0xb
>> board_id 0x121a soc_id 0x401a2200
>> [ 7.666595] ath12k_pci 0002:21:00.0: fw_version 0x141580c7
>> fw_build_timestamp 2024-11-11 11:03 fw_build_id
>> QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>> [ 7.697939] ath12k_pci 0002:21:00.0: failed to fetch board data for
>> bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4634 from
>> ath12k/QCN9274/hw2.0/board-2.bin
>> [ 7.699116] ath12k_pci 0002:21:00.0: failed to fetch board data for
>> bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255 from
>> ath12k/QCN9274/hw2.0/board-2.bin
>> [ 7.700276] ath12k_pci 0002:21:00.0: failed to fetch board.bin from
>> QCN9274/hw2.0
>> [ 7.700940] ath12k_pci 0002:21:00.0: qmi failed to load bdf:
>> [ 7.701442] ath12k_pci 0002:21:00.0: qmi failed to load board data file:=
-12
>>
>>
>> forget the QMI dma, can skip =F0=9F=98=85
>>
>> i already tested using this latest firmware
>> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
>> but still can't find the ID,
>> I tried modifying `board-2.bin` on `board.json` by mapping 4634 to
>> 4121 (closest match) just to test:
>>
>> {
>> "names": [ "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4634" ],
>> "data": "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4121.bin"
>> }
>>
>> This made the device show up in iw dev, but instead of showing 2.4GHz
>> and 5GHz, it shows two 5GHz interfaces. So clearly it's the wrong
>> board file.
>>
>> Would it be possible to add support for board ID 4634 to board-2.bin?
>>
>> Happy to provide further logs or test patches if needed.
>>
>> Thanks in advance =F0=9F=99=8F
>> Regards,
>> Siddiq

