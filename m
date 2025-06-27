Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E61C77B7F
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XiwfjDlNhCnzn40R9UKeB75Ac8R3+fSNwGUvakt5NL8=; b=LGlobsPW5eJjGqbZTC7lzs8/EI
	eGGW1YoWguITj1xa/NSaI+cJEB5YchI1+nFaWRwYURGWB0qWI7lFkKta/YKc0LhfjFXZ2kN32K8qI
	uwq7qbC3PXHPPGNuMjpvyLRE3TA4QywPeSr60EhGLYJBIKSTkYVUA09qj768X8TNMenKvTfY/d5ZH
	fWA85lvfR+gedvqkRLvbbeLRyCBXLVaQfBT5RMlqsMx1Jq5HtpN3rAEvWOn70y5yphH1yxPPJLQR7
	3aI3sy1QYQrTlJchC2QrVldmxl7JUbAb2cXJOEfmpUB160gg/I6SkS7vl+3+1wCVxyvrt1+6OwcCn
	IxXGAsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEvt-0000000FfQy-1SAz;
	Fri, 27 Jun 2025 19:40:21 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEbk-0000000FcR9-027O
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 19:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1751051970; x=1751311170;
	bh=XiwfjDlNhCnzn40R9UKeB75Ac8R3+fSNwGUvakt5NL8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MOAyjngB2cKD2s+XN8cRXURGY5qQR3CHMa94vzhEdgYvKJq55AG5pxCn/c6LqzNuZ
	 7PJOqGeYLoDT6yypzkevfKisNjusnB+5sgH4PYMa/5sRRyU69QHXF2PiY3YZ7k6HAZ
	 cOX7zRcd6QrMDAXjrc2b1jFdibzOQuPI4mp2lShfy8vED4v3lregiHPOwn5aCTE/8a
	 lHXJnKTaeTDcUWkbrKSCliMsaLVsLzHqvBxQRc19Y1PuBp//6WO0IIKzpBJum6UXVy
	 co155zd9Ugo/D5YH7GtEeo4lKBUe4w82ZKFF0yfwpjJkrmi+gjcHhN4kK2G5j8aMWq
	 Emad823po/viA==
Date: Fri, 27 Jun 2025 19:19:26 +0000
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
From: Janek <janekkw@proton.me>
Subject: 6GHz issue QCNCM865 (WCN7850) firmware
Message-ID: <l262t2ImXM_3Szbm3CnRu6PnXIAgw32DZBoz-Oai5GGVy-GbMqeAQLGO8Uu1PU4do9tMF0kpAZ3GFk40Nnq2fPjj2hVwCDmEuao3Xfqq6nQ=@proton.me>
Feedback-ID: 113248985:user:proton
X-Pm-Message-ID: a7369dec5f388f7a5d63eca80461d8f45ec285e4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_121932_633407_EFEFB8C9 
X-CRM114-Status: UNSURE (   7.01  )
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

Hi,

Yesterday, I noticed that I could not "see" or connect to any 6GHz SSID/AP.=
 After some checking, I noticed that my WiFi card was stuck with the reg co=
untry 00, as below:

$ iw reg get
global
country PL: DFS-ETSI
=09(2400 - 2483 @ 40), (N/A, 20), (N/A)
=09(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
=09(5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
=09(5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
=09(5725 - 5875 @ 80), (N/A, 13), (N/A)
=09(5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
=09(57000 - 66000 @ 2160), (N/A, 40), (N/A)

phy#0 (self-managed)
country 00: DFS-UNSET
=09(2402 - 2472 @ 40), (N/A, 20), (N/A)
=09(2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
=09(5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
=09(5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
=09(5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN


I'm not sure what caused this, but I suspect that is the firmware that was =
updated on last Sunday, as part of the Fedora 42 package named atheros-firm=
ware-20250613-1.fc42 (WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ=
-3).

I've tried reverting the kernel to 6.14.9 (that I was running before the 6.=
15.3), it did not help, after manually downloading and installing the previ=
ous known good firmware, I got it to connect to 6GHz networks (both ax and =
be).

Currently installed firmware: atheros-firmware-20250410-1.fc42 (WLAN.HMT.1.=
0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3) 6GHz working.

My system details
WiFi card: QCNCM865 (WCN7850)
Distro: Fedora 42
Kernel: 6.15.3 from Fedora
Affected firmware: WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 =
(from Fedora package atheros-firmware-20250613-1.fc42)

related dmesg output:
[    5.082826] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x90600000-0x907fffff 64=
bit]: assigned
[    5.082844] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    5.083105] ath12k_pci 0000:01:00.0: MSI vectors: 16
[    5.083110] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
[    5.733493] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_i=
d 0xff soc_id 0x40170200
[    5.733499] ath12k_pci 0000:01:00.0: fw_version 0x1108811c fw_build_time=
stamp 2025-05-17 00:21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c=
5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
[    5.733744] ath12k_pci 0000:01:00.0: failed to get ACPI BDF EXT: 0
[    5.958726] ath12k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

Let me know if there is any other info that I could get from my machine.

Thanks in advance,
Janek

