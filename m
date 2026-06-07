Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2579ACD8C89
	for <ath12k@archiver.kernel.org>; Sun,  7 Jun 2026 20:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q+6VfTZ15AESCbaQJYCllYfhTZxQnhP36N+Jh+TDOXk=; b=uPAODP/ZDjmKJP
	qOPdqR/p9saX2DlE5FgbaO7Z2saUF/Po+0R+gF6gs8LE4ZaxQbJwGhPzkdbwrKDEz/Ie3cOhUXO5X
	B9zR4zL0Quv6wqQG/KTJwZF7aaUdWrj7EUvzjJ4xM0uqyhptW86ji0vtEBpwYWaNoGPL2kat3iUfY
	EB2OrjRlTyc/ye6D9qFuRyAi8MtV4NtJ6a6pXdyLiriJDcmGKHK97fvTdZug6V2p2884wnuIQHuM1
	nrcqxLxldudSsys4Lgynggh69AqT2nNpYs5+g+XpAencxqqV3XFTljx2H7qXAvfj2yWm3bDPlNXzb
	Czg+Rj4GD0ueaUcwyQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWJiP-00000002Sow-2XLs;
	Sun, 07 Jun 2026 20:03:25 +0000
Received: from mail214c25.carrierzone.com ([64.29.147.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWJiK-00000002SoC-2Xgj
	for ath12k@lists.infradead.org;
	Sun, 07 Jun 2026 20:03:23 +0000
ARC-Seal: i=1; d=carrierzone.com; s=mailmia; a=rsa-sha256; cv=none;
	t=1780862594;
	b=2GzKKyElinjqbkAnUdwL/Zl4eBcouZtDiobV/XDWAGi/dfp6bIY22Ee4riGaftPFGgzK
	 JldXys1TjWOsze2iC4OMsX9AoB38w5/9AKOvwo2abCuo1dhGNFI6MPjjWsKr/4VxvaOSA
	 MCMk9h0Zo0KEAgh8eMbdyiT2Si2SWQTOaI=
ARC-Message-Signature: i=1; d=carrierzone.com; s=mailmia; a=rsa-sha256;
	c=relaxed/relaxed; t=1780862594;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=Q+6VfTZ15AESCbaQJYCllYfhTZxQnhP36N+Jh+TDOXk=;
	b=0ytfBr99A4grzY4FsDnbAs7UztnkCM3L5jc7jyeZQCyhk0JeNZiMPK5mhYqNKQvFnzhR
	 fPegyztMwkqM1jHnIGmdJndlZNkhVRaxbexVDlgXQ15Q1ZWFlKS/QVPpRqp/ocVIabTtl
	 MMh72EkAjHGigNREzTdL7gshDXcXc8WEsg=
ARC-Authentication-Results: i=1; mail214c25.carrierzone.com; arc=none smtp.remote-ip=127.0.0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1780862594;
	bh=Q+6VfTZ15AESCbaQJYCllYfhTZxQnhP36N+Jh+TDOXk=;
	h=From:To:CC:Subject:Date:Reply-to;
	b=03V7P/4yXr9keLJCpnUvaljqDRH/+mV9KLdnTBxBlWedQ4dorx+s4hHP3jEmX2Q+y
	 AWMth3oqpS8esYbwG6N6OIw/eYcm5KKSDV0MsFoI839KwDqo3j0DKIk9A2aYqwExRc
	 /2JkBh8pl35odRNbNX+HqxsBFSXIzJY/TGYMI2Qc=
Authentication-Results: mail214c25.carrierzone.com;
	 none
Received: from mail214c25.carrierzone.com (localhost [127.0.0.1])
	by mail214c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 657K3Eei1466193
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <ath12k@lists.infradead.org>; Sun, 7 Jun 2026 20:03:14 +0000
Received: (from webmail@localhost)
	by mail214c25.carrierzone.com (8.14.9/8.12.2/Submit) id 657K3DWX1466192
	for ath12k@lists.infradead.org; Sun, 7 Jun 2026 16:03:13 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: ath12k@lists.infradead.org
CC: 
Subject: Compex Model WLE7000Ex (mPCIE) to PCIe on X86_64 Ubuntu 26.04 -
 Confirmed working
Date: Sun, 07 Jun 2026 16:03:13 -0400
Message-ID: <1780862593.558nu0c9ickocswc@mailapp03.register.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: dmFkZTEJXkZLsHFXklte7IvvRViDijUWmqphavzxRmMQqCx3xPQG2iQA0nLRPpzKEJuqFj/x/zdrZIw7n8rVfZB/xXPTreVaqry+myjpjdxHfaIkN7cf+eQZ4a3cosIHvXsGbpzzRDK1Y9rLNqbT1wf1usVbALJwlTwQee+MILyd7NV1qlGmhfmjRfNomefarHCLoMztcfEh5y8ucdMADTzB51NYlVRe8B6zeFmytldQ1hip8UwpxuYVliklDi1zjdIvnx++vcsmMRAy2jA5itXZS3FzINdWHzsGoXi/163tkeuIhQkL33zCmE2FeCnDslLqVZgZAhGZaWib7agMjZxMD3VVBfuudEOs7vTO9gLsmaVo8uljkti7vrQS995MHDSW57b6fFIAqyBePRb6iyqF2ic+E0VY3tioEAFS62Yg9As4CTxhf3jxeAcfRluxTTafW1HwCAU8Q9/3AbzJekM3FlGWGOZk9YWwqgyA4X5qpHZnNWdzXhknPpTzMdEA8qFW6fhozzFdk8hcPfU/HWwqsud3MW3jgSQ1oO4wP+nCgK+jRM7uKNfKXIAO3Mo6pbeDqgfjntKlJZw+5VHTAlpoJLVLJzsAhBzlV56vn+H0cAJVFYqhyrjzffTmanGseLV2yfTPpwZoZ8HAuzVP6O2HiDNocx5TeIJ4ooNN7xVFL5AkzQ
X-VADE-SPAMSCORE: 0
X-Rspamd-Status: No, score=0.90
X-Rspamd-Result: default: False [0.90 / 6.00];
	FROM_DN_EQ_ADDR(1.00)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ONE(0.00)[1];
	SCAN_INIT(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	VADE_SPAMSTATE(0.00)[clean];
	RCVD_TLS_LAST(0.00)[];
	SCAN_DONE(0.00)[1ms];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	HAS_REPLYTO(0.00)[pgupta@hindutool.com];
	LOCAL_OUTBOUND(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_130321_021343_7E25F331 
X-CRM114-Status: GOOD (  11.46  )
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

The following is a step by step guide to diagnose and troubleshoot Compex W=
ifi 7 WLE7000Ex modules connected to the PCIe bus=20
on a plain vanilla Ubuntu 26.04 fresh install on X86_64 hardware.


Things to consider:=C2=A0

1)=C2=A0If using Compex AP modules, you will need to get the board-2.bin an=
d regdb.bin directly from them
2) These are SINGLE band modules (one 2.4, one 5, and one 6GHZ) as and on h=
ave one radio and one MAC
-------This is imporatnt later on as the default ath12k_wifi driver tries t=
o bring up 2 radios per module=C2=A0
-------In my setup, I have three modules (2.4, 5, 6) and each module is con=
nected to its own PCIe slot
via and mPCIe

3) I am posting this in the hopes that this may help enthusiasts like me.=
=C2=A0 Perhaps patches to the driver might
be necessary for those of us with single band radios

This was created with the help of Claude Code - including troubleshooting=
=2E
I am NOT a programmer or kernel specialist by trade, merely a hobbyist.=C2=
=A0 I will try to answer any questions
but keep in mind that this may be above my knowledge/comprehension.

Prashant Gupta MD/MPH

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=C2=A0Ubuntu 26.04 (kernel 7.0) + Compex WLE7000E (Qualcomm QCN9274 hw2.0 /=
 ath12k)
=C2=A0Wi-Fi 7 radios fail to initialize =E2=80=94 full troubleshooting + fi=
x writeup
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Author notes: written after resolving a ~4-month blocker on a Dell R730xd
router (nola-router) running Ubuntu 26.04 "Resolute Raccoon", kernel
7.0.0-22-generic, with THREE Compex WLE7000E single-band Wi-Fi 7 modules
(each a Qualcomm QCN9274 hw2.0 on its own PCIe slot: 2.4 GHz, 5 GHz, 6 GHz)=
=2E
The same setup worked on Ubuntu 24.04 with the HWE kernel; it broke on 26=
=2E04.

This document is deliberately verbose about the REASONING and the DEAD ENDS=
,
not just the final fix, so that someone hitting the same symptoms can follo=
w
the diagnostic logic rather than blindly copy commands. If you only want th=
e
fix, jump to section "10. THE COMPLETE FIX".

---------------------------------------------------------------------------=
-----
A. BASELINE / TEST ENVIRONMENT (compare this to YOUR setup first)
---------------------------------------------------------------------------=
-----
The fix below was developed and verified on the exact baseline described he=
re.
The closer your environment matches, the more directly it applies. The thre=
e
faults are: FIX 1/2 =3D driver (apply on any platform with this driver+firm=
ware);
FIX 3 =3D x86 PCIe + IOMMU specific (may not apply on ARM/AHB or non-IOMMU =
hosts).

HARDWARE (host: "xxxx-router"; an identical second unit "xxxx-router" exist=
s):
=C2=A0 - Server=C2=A0 =C2=A0 =C2=A0 : Dell PowerEdge R730xd, dual Intel Xeo=
n (56 logical CPUs),
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~384 GiB RAM=
 (dmesg "Memory: 402555264K ... available"),
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iDRAC/BMC pr=
esent. Large-RAM is RELEVANT: it makes low-memory
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (<4 GB) cont=
iguous allocation fail more readily (FIX 3).
=C2=A0 - Storage=C2=A0 =C2=A0 =C2=A0: BTRFS RAID.
=C2=A0 - LAN NICs=C2=A0 =C2=A0 : 2x Dell/Mellanox ConnectX-5 dual-port 100G=
bE (bonded+bridged
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -> br0, br1)=
, 1x Intel X710-DA4 quad-port 10GbE SFP+
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (bonded+brid=
ged -> br2). All SR-IOV capable. These are the
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devices whos=
e host-side DMA mode is affected by iommu=3Dpt.
=C2=A0 - WAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: onboard NIC (renamed ; not =
relevant here).
=C2=A0 - Wi-Fi (the subject): 3x Compex WLE7000E, each a Qualcomm QCN9274 h=
w2.0 on a
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIe carrier=
, each used as a SINGLE band:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PCIe 0000:81:00.0 -> wlp129s0=C2=A0 board_id 0x1=C2=A0 2.4 GHz (Slot 1)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PCIe 0000:85:00.0 -> wlp133s0=C2=A0 board_id 0x2=C2=A0 5=C2=A0 =C2=A0GHz=
 (Slot 2)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PCIe 0000:84:00.0 -> wlp132s0=C2=A0 board_id 0x4=C2=A0 6=C2=A0 =C2=A0GHz=
 (Slot 3)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (PCIe bus->i=
fname is hex-derived: 0x81=3D129, 0x84=3D132, 0x85=3D133.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Bus/slot ord=
er is NOT ascending by band; confirm with dmidecode
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -t slot. The=
 interface NAMES are stable across reboots;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phy0/1/2 num=
bering is probe-order and is NOT stable.)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NOTE: "singl=
e-band per card" is the crux of FIX 1 =E2=80=94 the driver
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assumes the =
QCN9274 may be dual-MAC (max_radios=3D2).

SOFTWARE / OS:
=C2=A0 - Distro=C2=A0 =C2=A0 =C2=A0 : Ubuntu 26.04 LTS "Resolute Raccoon", =
server, x86_64.
=C2=A0 - Kernel=C2=A0 =C2=A0 =C2=A0 : 7.0.0-22-generic (Linux 7.0 GA baseli=
ne; no manual HWE).
=C2=A0 - Driver=C2=A0 =C2=A0 =C2=A0 : in-tree ath12k, MODULARIZED form -> a=
th12k.ko (common) +
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ath12k_wifi7=
=2Eko (Wi-Fi 7), binds as ath12k_wifi7_pci. (There
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is NO separa=
te in-tree ath12k_pci fallback on this release.)
=C2=A0 - Firmware=C2=A0 =C2=A0 : stock linux-firmware; ath12k/QCN9274/hw2=
=2E0/firmware-2.bin =3D
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WLAN.WBE.1=
=2E6-01243-QCAHKSWPL_SILICONZ-1 (build 2025-12-09),
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shipped as f=
irmware-2.bin.zst. PLUS a Compex vendor board-2.bin
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 overlaid in =
/lib/firmware/ath12k/QCN9274/hw2.0/ (sha256
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2378f4b8..=
=2E, contains qmi-board-id 1/2/4). Firmware version is
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NOT the vari=
able (see section 6) - this is the as-shipped state.
=C2=A0 - Networking=C2=A0 : systemd-networkd (netplan renderer); LAN bridge=
s br0/br1/br2
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 over bonds, =
plus a wireless bridge "wbr" that the 3 radios join
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 via hostapd=
=2E (Wi-Fi being down does not affect br0/1/2 routing.)
=C2=A0 - Virtualization: KVM/QEMU + libvirt; LAN-resident VMs (e.g. an ngin=
x
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reverse-prox=
y VM, a mail VM) attached via VIRTIO to the host
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bridges (NOT=
 PCI passthrough). This is why removing iommu=3Dpt
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is safe for =
the VMs (see section 8).
=C2=A0 - Secure Boot : DISABLED (mokutil --sb-state). If ENABLED, you must =
MOK-sign
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the DKMS mod=
ules (extra step, see section 9).
=C2=A0 - Kernel cmdline BEFORE the fix (the broken state):
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... ro intel_iommu=3Don iommu=3Dpt crashkernel=
=3D<auto>
=C2=A0 =C2=A0 (intel_iommu + iommu=3Dpt are the relevant tokens; crashkerne=
l comes from
=C2=A0 =C2=A0 =C2=A0kdump-tools and is unrelated.)

ROUTER STATE AT TIME OF FAILURE:
=C2=A0 - The OS had just been REINSTALLED from scratch to Ubuntu 26.04; thi=
s was the
=C2=A0 =C2=A0 FIRST Wi-Fi bring-up on 26.04. The IDENTICAL hardware worked =
previously on
=C2=A0 =C2=A0 Ubuntu 24.04 with the HWE kernel (older, pre-modularization a=
th12k + that
=C2=A0 =C2=A0 era's linux-firmware), which is why the regression was surpri=
sing.
=C2=A0 - All non-Wi-Fi router functions were healthy: interfaces, policy ro=
uting,
=C2=A0 =C2=A0 nftables, DNS/DHCP, FRR, VPN, the KVM VMs - all up. ONLY the =
3 Wi-Fi radios
=C2=A0 =C2=A0 failed, so the box was usable throughout debugging (Wi-Fi is =
not on the boot
=C2=A0 =C2=A0 or management path).
=C2=A0 - Observed failure: `iw phy` returned 0 Wiphy entries; dmesg showed =
the chain
=C2=A0 =C2=A0 in section 1 on all three QCN9274 devices, every boot, determ=
inistically.

REPRODUCIBILITY / SCOPE NOTES:
=C2=A0 - If you are on ARM / an AHB-attached QCN9274 (e.g. IPQ9574 boards) =
you likely
=C2=A0 =C2=A0 need only FIX 1 + FIX 2; FIX 3 is the x86-PCIe + IOMMU cohere=
nt-DMA problem.
=C2=A0 - If your QCN9274 is genuinely dual-band/split-PHY (not single-band =
like the
=C2=A0 =C2=A0 WLE7000E used here), FIX 1's premise differs - test carefully=
=2E
=C2=A0 - The DMA mask fact behind FIX 3 (dma_set_coherent_mask(DMA_BIT_MASK=
(32)) in
=C2=A0 =C2=A0 ath12k pci.c) is driver-wide, so the 28 MB coherent-alloc fai=
lure can appear
=C2=A0 =C2=A0 on any large-RAM x86 host running these cards with iommu=3Dpt=
=2E

---------------------------------------------------------------------------=
-----
0. TL;DR (the answer)
---------------------------------------------------------------------------=
-----
The failure was THREE independent faults stacked on top of each other. All
three fixes are required; none alone is sufficient:

=C2=A0 FIX 1 (driver patch, via DKMS) - htc.c:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cap the WMI endpoint count to the firmware-repo=
rted radio count so the
=C2=A0 =C2=A0 =C2=A0 =C2=A0 driver stops trying to open a WMI control endpo=
int for a second MAC
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (MAC1) that does not exist on a single-band QCN=
9274.

=C2=A0 FIX 2 (driver patch, via DKMS) - wmi.c:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Make the WMI "dma ring caps" parser SKIP dma-ri=
ng entries whose
=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_id the driver doesn't recognize (firmwar=
e WLAN.WBE.1.6 sends
=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_id 2 and 3), instead of returning -EINVA=
L and aborting the whole
=C2=A0 =C2=A0 =C2=A0 =C2=A0 service-ready-ext parse.

=C2=A0 FIX 3 (boot parameter, NOT a code change) - GRUB:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Remove "iommu=3Dpt" from the kernel command lin=
e (keep "intel_iommu=3Don").
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The QCN9274 sets a 32-bit COHERENT DMA mask, so=
 the firmware's 28 MB
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HOST_DDR region needs a physically-contiguous b=
uffer below 4 GB. With
=C2=A0 =C2=A0 =C2=A0 =C2=A0 iommu=3Dpt the coherent allocation goes through=
 dma-direct and fails on a
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fragmented large-RAM x86 box. Full VT-d transla=
tion (no pt) lets the
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IOMMU remap scattered pages into a contiguous 3=
2-bit IOVA, so the
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allocation succeeds.

Firmware version was NOT the cause. Stock Ubuntu 26.04 ships
WLAN.WBE.1.6-01243; both 1.6 and an older 1.5 fail identically. Do NOT wast=
e
time downgrading firmware.

---------------------------------------------------------------------------=
-----
1. SYMPTOMS
---------------------------------------------------------------------------=
-----
- `iw phy` shows ZERO Wiphy entries (no radios enumerated).
- `lsmod` shows the driver loaded (on 26.04 it is the modularized pair
=C2=A0 `ath12k_wifi7` + `ath12k`, binding as `ath12k_wifi7_pci`).
- dmesg shows this chain (per PCIe device, e.g. 0000:81:00.0):

=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: Wi-Fi 7 Hardware name: qcn9274=
 hw2.0
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: qmi dma allocation failed (293=
60128 B type 1), will try later with small size
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: memory type 10 not supported
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: chip_id 0x0 chip_family 0xb bo=
ard_id 0x1 ...
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: fw_version ... QC_IMAGE_VERSIO=
N_STRING=3DWLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: HTC Service WMI MAC1 connect r=
equest failed: 0x1)
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: failed to connect to WMI CONTR=
OL service status: -71
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: Invalid module id 2
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: failed to parse tlv -22
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: failed to receive wmi unified =
ready event: -110
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: failed to start core: -110
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: qmi failed to send mode reques=
t, mode: 4, err =3D -5
=C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0: qmi failed to send wlan mode o=
ff

=C2=A0 (-71 =3D EPROTO, -22 =3D EINVAL, -110 =3D ETIMEDOUT, -5 =3D EIO.)

Useful one-shot diagnostic block:

=C2=A0 =C2=A0 sudo modprobe ath12k
=C2=A0 =C2=A0 sleep 3
=C2=A0 =C2=A0 echo "Module load order:"; lsmod | grep -E '^(ath12k|ath12k_p=
ci|ath12k_wifi7|mac80211|cfg80211)'
=C2=A0 =C2=A0 echo "PHYs detected:";=C2=A0 =C2=A0 =C2=A0iw phy 2>/dev/null =
| grep '^Wiphy' | sort
=C2=A0 =C2=A0 echo "Recent ath12k events:"; journalctl -k -b | grep -iE 'at=
h12k|qcn9274' | tail -20

---------------------------------------------------------------------------=
-----
2. WHY THE INITIAL "OBVIOUS" DIAGNOSES WERE WRONG
---------------------------------------------------------------------------=
-----
The first instinct (and an earlier attempt on this project) was:
=C2=A0 "ath12k_wifi7 is a broken dual-MAC driver; blacklist it / patch the =
dual-MAC
=C2=A0 =C2=A0assumption; maybe downgrade firmware."
Most of that was a misread. Establishing the truth saved a lot of time:

=C2=A0 (a) `ath12k_wifi7.ko` is NOT a broken out-of-tree fork. The mainline=
 ath12k
=C2=A0 =C2=A0 =C2=A0 driver was MODULARIZED in late 2025 into `ath12k.ko` (=
common core) +
=C2=A0 =C2=A0 =C2=A0 `ath12k_wifi7.ko` (Wi-Fi 7 family code). It is explici=
tly "Tested-on:
=C2=A0 =C2=A0 =C2=A0 QCN9274 hw2.0". It is SUPPOSED to bind your card. Blac=
klisting it just
=C2=A0 =C2=A0 =C2=A0 leaves the cards unbound (there is no in-tree fallback=
 driver). DO NOT
=C2=A0 =C2=A0 =C2=A0 blacklist it.

=C2=A0 (b) The "HTC Service WMI MAC1 connect request failed" line is mislea=
ding. It
=C2=A0 =C2=A0 =C2=A0 is NOT proof the card is being treated as dual-band. I=
t is a downstream
=C2=A0 =C2=A0 =C2=A0 symptom; see section 4.

=C2=A0 (c) The exact error quartet (wmi unified ready -110 / start core -11=
0 /
=C2=A0 =C2=A0 =C2=A0 mode:4 err:-5) is widely reported across distros and i=
s commonly "fixed"
=C2=A0 =C2=A0 =C2=A0 by downgrading linux-firmware. That is a RED HERRING f=
or this hardware:
=C2=A0 =C2=A0 =C2=A0 see section 6 =E2=80=94 both 1.6 and 1.5 firmware fail=
 identically here.

Lesson: confirm what a component actually is before theorizing about it. Re=
ad
the driver source and the upstream mailing list, don't pattern-match on the
first error line.

---------------------------------------------------------------------------=
-----
3. KEY REFERENCE THAT UNLOCKED IT (same exact hardware)
---------------------------------------------------------------------------=
-----
OpenWrt forum thread for the Wallys DR9574 board, which is ALSO 3x single-b=
and
QCN9274 hw2.0 (search: "wallys DR9574 IPQ9574 3x QCN9274 hw2.0 mainline ope=
nwrt
boot works wifi blocked by firmware rddm after wmi init"). That thread
identified two host-side ath12k patches for the SAME symptoms:
=C2=A0 =C2=A0- cap the WMI endpoint count to 1 when the OTP dual-mac bit is=
 clear, and
=C2=A0 =C2=A0- warn-and-skip unknown dma-ring module_ids instead of failing=
 the parse.
Those became our FIX 1 and FIX 2.

CRITICAL CAVEAT that cost us extra debugging: the DR9574 is IPQ9574, an ARM=
 SoC
where the radios are on the internal AHB bus and firmware memory comes from=
 a
device-tree reserved-memory region. It NEVER executes the PCIe QMI
dma_alloc_coherent path. So their two patches were necessary but NOT suffic=
ient
on an x86 PCIe host =E2=80=94 the x86 box has a THIRD, platform-specific fa=
ult (the
28 MB coherent DMA allocation, FIX 3). If you are on ARM/AHB you may only n=
eed
FIX 1 + FIX 2.

---------------------------------------------------------------------------=
-----
4. ROOT-CAUSE ANALYSIS (read the source, don't guess)
---------------------------------------------------------------------------=
-----
Get the exact source for YOUR kernel so line numbers/anchors match:

=C2=A0 =C2=A0 sudo sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sou=
rces.list.d/ubuntu.sources
=C2=A0 =C2=A0 sudo apt-get update
=C2=A0 =C2=A0 cd /usr/src
=C2=A0 =C2=A0 sudo apt-get source linux-image-unsigned-"$(uname -r)" || sud=
o apt-get source linux
=C2=A0 =C2=A0 # source lands in /usr/src/linux-<ver>/ ; driver is at:
=C2=A0 =C2=A0 #=C2=A0 =C2=A0/usr/src/linux-<ver>/drivers/net/wireless/ath/a=
th12k/

FAULT 1 =E2=80=94 the bogus MAC1 WMI endpoint
=C2=A0 - wifi7/hw.c: the "qcn9274 hw2.0" hw_params entry sets `.max_radios =
=3D 2`
=C2=A0 =C2=A0 (this exists to support split-PHY/dual-MAC QCN9274 variants)=
=2E
=C2=A0 - htc.c, ath12k_htc_init(): preferred_hw_mode is still WMI_HOST_HW_M=
ODE_MAX
=C2=A0 =C2=A0 at this point ("overwritten when service_ext_ready is handled=
" =E2=80=94 i.e.
=C2=A0 =C2=A0 LATER), so the switch hits `default:` and sets
=C2=A0 =C2=A0 =C2=A0 =C2=A0 htc->wmi_ep_count =3D ab->hw_params->max_radios=
;=C2=A0 =C2=A0// =3D 2
=C2=A0 - wmi.c, ath12k_wmi_connect(): loops i=3D0..wmi_ep_count-1 and calls
=C2=A0 =C2=A0 ath12k_connect_pdev_htc_service(ab, i) for svc_id[] =3D { WMI=
_CONTROL,
=C2=A0 =C2=A0 WMI_CONTROL_MAC1, WMI_CONTROL_MAC2 }. With wmi_ep_count=3D2 i=
t tries MAC0
=C2=A0 =C2=A0 (ok) and MAC1. A single-band card has no MAC1, so the firmwar=
e returns
=C2=A0 =C2=A0 NOT_FOUND (0x1) -> "HTC Service WMI MAC1 connect request fail=
ed".
=C2=A0 - NOTE: that per-endpoint failure's return value is IGNORED by the l=
oop, so
=C2=A0 =C2=A0 strictly it is non-fatal. But it is wrong and has side effect=
s (HTC credits
=C2=A0 =C2=A0 are divided by wmi_ep_count, a dead endpoint is left around)=
=2E FIX 1 caps it.

FAULT 2 =E2=80=94 the fatal TLV parse abort (this is the real WMI-ready kil=
ler pre-IOMMU)
=C2=A0 - wmi.c, ath12k_wmi_dma_ring_caps(): for each advertised dma-ring ca=
p it does
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (le32_to_cpu(dma_caps[i].module_id) >=3D WMI=
_DIRECT_BUF_MAX) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ath12k_warn(ab, "In=
valid module id %d\n", ...);
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto free_dir_buff;=
=C2=A0 =C2=A0 =C2=A0// <-- aborts the ENTIRE parse
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
=C2=A0 - Firmware WLAN.WBE.1.6 (and 1.5) advertise module_id 2 AND 3, which=
 are
=C2=A0 =C2=A0 >=3D WMI_DIRECT_BUF_MAX in the kernel-7.0 enum. The -EINVAL p=
ropagates up
=C2=A0 =C2=A0 through ath12k_wmi_svc_rdy_ext_parse -> ath12k_service_ready_=
ext_event,
=C2=A0 =C2=A0 which logs "failed to parse tlv -22" and `goto err` WITHOUT c=
ompleting the
=C2=A0 =C2=A0 service-ready handshake. The firmware never reaches a state w=
here it will
=C2=A0 =C2=A0 answer WMI_INIT, so you eventually get "wmi unified ready -11=
0".
=C2=A0 - These dma-ring modules are for optional features (spectral scan / =
CFR) that
=C2=A0 =C2=A0 an AP router does not need, so skipping the unknown ones is s=
afe. FIX 2.

FAULT 3 =E2=80=94 the 28 MB HOST_DDR coherent allocation (x86 PCIe only)
=C2=A0 - dmesg: "qmi dma allocation failed (29360128 B type 1), will try la=
ter with
=C2=A0 =C2=A0 small size".=C2=A0 29360128 B =3D 28 MiB. "type 1" =3D HOST_D=
DR_REGION_TYPE.
=C2=A0 - qmi.c, ath12k_qmi_alloc_chunk():
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk->v.addr =3D dma_alloc_coherent(ab->dev, c=
hunk->size, &chunk->paddr,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GFP_KERNEL | __GFP_NOWARN);
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!chunk->v.addr) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chunk->size > A=
TH12K_QMI_MAX_CHUNK_SIZE) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ab->qmi.target_mem_delayed =3D true;=C2=A0 =C2=A0// ask FW to re=
-request smaller
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ... "will try later with small size"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EAGAIN;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // treated as non-fatal (0)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
=C2=A0 - The driver then tells the firmware to re-request the region in sma=
ller
=C2=A0 =C2=A0 segments. The firmware boots far enough on the segmented memo=
ry to send
=C2=A0 =C2=A0 "service ready" (that's why you see the FIX-2 "skipping ... m=
odule id"
=C2=A0 =C2=A0 lines), BUT the segmented HOST_DDR does not satisfy what WMI_=
INIT needs, so
=C2=A0 =C2=A0 unified-ready still times out (-110).
=C2=A0 - WHY the coherent alloc fails on a 400 GB-RAM machine: pci.c sets
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(=
32));
=C2=A0 =C2=A0 A 32-bit COHERENT mask means dma_alloc_coherent must return m=
emory whose
=C2=A0 =C2=A0 physical address is below 4 GB AND physically contiguous (28 =
MiB ~ order
=C2=A0 =C2=A0 13). On a large, fragmented x86 box that contiguous-below-4-G=
B allocation
=C2=A0 =C2=A0 fails.
=C2=A0 - "memory type 10 not supported" is BENIGN and a separate red herrin=
g:
=C2=A0 =C2=A0 qmi.c handles unknown memory types by assigning paddr=3D0/NUL=
L with the
=C2=A0 =C2=A0 comment "FW will handle this without crashing." Do not chase =
it.

---------------------------------------------------------------------------=
-----
5. DEAD END #1 =E2=80=94 blacklisting ath12k_wifi7
---------------------------------------------------------------------------=
-----
Tried: /etc/modprobe.d/ath12k-wifi7-blacklist.conf to fall back to an "olde=
r"
driver. Result: still 0 PHYs. There is NO separate in-tree PCI driver for t=
hese
cards on 26.04/7.0 =E2=80=94 `ath12k_wifi7` registers the only matching PCI=
 driver
(`ath12k_wifi7_pci`). Blacklisting just leaves the QCN9274s unbound. Abando=
ned.

---------------------------------------------------------------------------=
-----
6. DEAD END #2 =E2=80=94 downgrading firmware
---------------------------------------------------------------------------=
-----
The error signature is widely "fixed" elsewhere by rolling back linux-firmw=
are,
so we tested it. linux-firmware history for ath12k/QCN9274/hw2.0/firmware-2=
=2Ebin
(GitLab mirror gitlab.com/kernel-firmware/linux-firmware):
=C2=A0 =C2=A0 WLAN.WBE.1.6-01243=C2=A0 (commit ec76089d, Feb 2026)=C2=A0 <-=
 stock 26.04, FAILS
=C2=A0 =C2=A0 WLAN.WBE.1.5-01651=C2=A0 (commit 7aa2aba3, Aug 2025)
=C2=A0 =C2=A0 WLAN.WBE.1.4.1-00199(commit a3f44afe, Feb 2025)
=C2=A0 =C2=A0 WLAN.WBE.1.3.1-00162(commit a2d650c9, Oct 2024)

How to swap one in (kernel reads firmware-2.bin.zst natively; an uncompress=
ed
firmware-2.bin takes precedence):
=C2=A0 =C2=A0 cd /lib/firmware/ath12k/QCN9274/hw2.0/
=C2=A0 =C2=A0 sudo mv firmware-2.bin.zst firmware-2.bin.zst.disabled
=C2=A0 =C2=A0 sudo curl -fL -o firmware-2.bin \
=C2=A0 =C2=A0 =C2=A0 "https://gitlab.com/kernel-firmware/linux-firmware/-/r=
aw/7aa2aba3/ath12k/QCN9274/hw2.0/firmware-2.bin"
=C2=A0 =C2=A0 strings firmware-2.bin | grep WLAN.WBE=C2=A0 =C2=A0 =C2=A0# c=
onfirm version
=C2=A0 =C2=A0 sudo reboot
=C2=A0 =C2=A0 # restore:
=C2=A0 =C2=A0 #=C2=A0 =C2=A0sudo rm -f firmware-2.bin && sudo mv firmware-2=
=2Ebin.zst.disabled firmware-2.bin.zst && sudo reboot

RESULT: 1.5 failed BYTE-IDENTICALLY (same "Invalid module id 2 / parse tlv =
-22 /
wmi unified ready -110"). Firmware version is not the variable here. We kep=
t the
stock 1.6 and fixed the driver instead. (Note: the QCN9274 needs the
firmware-2.bin CONTAINER; the loose amss.bin/m3.bin in quic/upstream-wifi-f=
w do
NOT load on mainline ath12k for this chip.)

---------------------------------------------------------------------------=
-----
7. DEAD END #3 =E2=80=94 cma=3D512M (and why it didn't help, but pointed at=
 the answer)
---------------------------------------------------------------------------=
-----
Because FIX 3 is a contiguous-DMA problem, the textbook x86 fix is a CMA po=
ol:
=C2=A0 =C2=A0 GRUB_CMDLINE_LINUX_DEFAULT=3D"... cma=3D512M"
This reserved the pool but the 28 MB alloc STILL failed, because:
=C2=A0 - dmesg: "cma: Reserved 512 MiB at 0x0000000100000000" =E2=80=94 i=
=2Ee. AT 4 GB. A
=C2=A0 =C2=A0 32-bit-coherent-mask device cannot reach >=3D 4 GB, so the po=
ol is unusable
=C2=A0 =C2=A0 for this allocation.
=C2=A0 - The kernel-7.0 `cma=3D` early parser only honors a FIXED base (`cm=
a=3DNN@base`);
=C2=A0 =C2=A0 the range form `cma=3D512M@0-4G` is ignored and it places the=
 pool high.
=C2=A0 - A fixed sub-4 GB base (`cma=3D512M@0x40000000`) CAN work but is fr=
agile (must
=C2=A0 =C2=A0 dodge reserved e820 regions) and only matters if you insist o=
n keeping
=C2=A0 =C2=A0 iommu=3Dpt (see section 9). We chose FIX 3 (drop iommu=3Dpt) =
instead.

---------------------------------------------------------------------------=
-----
8. THE INSIGHT FOR FIX 3 =E2=80=94 IOMMU translation vs passthrough
---------------------------------------------------------------------------=
-----
With `intel_iommu=3Don iommu=3Dpt`, host-driver devices use an IDENTITY dom=
ain, so
dma_alloc_coherent goes through dma-direct and needs physically-contiguous =
low
memory (which fails, above).

Remove `iommu=3Dpt` (keep `intel_iommu=3Don`) and devices use a TRANSLATING=
 domain.
dma_alloc_coherent then goes through iommu_dma_alloc_remap(), which:
=C2=A0 - allocates ordinary scattered order-0 pages (no large contiguous bl=
ock
=C2=A0 =C2=A0 needed), and
=C2=A0 - maps them into a CONTIGUOUS 32-bit IOVA window that satisfies the =
device's
=C2=A0 =C2=A0 32-bit coherent mask.
The 28 MB allocation then cannot fail. This is the clean, fragmentation-pro=
of
fix and needs no driver change.

Trade-off: dropping iommu=3Dpt means the HOST's own device DMA (e.g. NICs w=
hile
the box routes packets) goes through VT-d translation instead of identity
mapping =E2=80=94 a small overhead in practice (drivers like mlx5 reuse per=
sistent
mappings, keeping the IOTLB warm). It does NOT affect KVM/libvirt guests:
=C2=A0 - virtio-net VMs (the normal case, e.g. an nginx reverse-proxy VM br=
idged to
=C2=A0 =C2=A0 a host bridge) never touch the host IOMMU; zero impact.
=C2=A0 - PCI/SR-IOV passthrough to a VM uses VFIO, which requires intel_iom=
mu=3Don
=C2=A0 =C2=A0 (still present) and works with OR without iommu=3Dpt.

---------------------------------------------------------------------------=
-----
9. PREREQUISITES / ENVIRONMENT ASSUMPTIONS
---------------------------------------------------------------------------=
-----
- Ubuntu 26.04, kernel 7.0.x (this writeup used 7.0.0-22-generic, x86_64)=
=2E
- 3x Compex WLE7000E (QCN9274 hw2.0) on PCIe, used as single-band APs.
- Stock linux-firmware (WLAN.WBE.1.6-01243) + Compex board-2.bin overlay in
=C2=A0 /lib/firmware/ath12k/QCN9274/hw2.0/ (board-2.bin contains board IDs =
1/2/4).
- Secure Boot DISABLED (check: `mokutil --sb-state`). If Secure Boot is ENA=
BLED
=C2=A0 you must additionally MOK-sign the DKMS modules; dkms can do this bu=
t you must
=C2=A0 enroll the MOK key =E2=80=94 out of scope here, but see `update-secu=
reboot-policy` and
=C2=A0 `mokutil --import`.
- Build tools available; deb-src enabled (section 4).

---------------------------------------------------------------------------=
-----
10. THE COMPLETE FIX
---------------------------------------------------------------------------=
-----
Step 10.1 =E2=80=94 confirm Secure Boot is off and install build prerequisi=
tes:

=C2=A0 =C2=A0 mokutil --sb-state=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=
 expect: SecureBoot disabled
=C2=A0 =C2=A0 sudo apt-get update
=C2=A0 =C2=A0 sudo apt-get install -y build-essential dkms "linux-headers-$=
(uname -r)"

Step 10.2 =E2=80=94 enable source repo and fetch the kernel source (for the=
 ath12k tree):

=C2=A0 =C2=A0 sudo sed -i 's/^Types: deb$/Types: deb deb-src/' /etc/apt/sou=
rces.list.d/ubuntu.sources
=C2=A0 =C2=A0 sudo apt-get update
=C2=A0 =C2=A0 cd /usr/src
=C2=A0 =C2=A0 sudo apt-get source linux-image-unsigned-"$(uname -r)" || sud=
o apt-get source linux
=C2=A0 =C2=A0 # verify the driver source exists (note the linux-<ver> dir n=
ame):
=C2=A0 =C2=A0 ls /usr/src/linux-*/drivers/net/wireless/ath/ath12k/wmi.c

Step 10.3 =E2=80=94 build + install the patched ath12k via DKMS.
Paste the whole block below into a ROOT shell (run `sudo -i` first).=C2=A0 =
It is
heredoc-based, so NO script file is needed and it pastes cleanly over SSH=
=2E=C2=A0 It copies the
ath12k tree, applies BOTH patches (exact-match, aborts if anything doesn't
match), writes dkms.conf, builds against your running kernel's headers, and
installs to /lib/modules/$(uname -r)/updates/dkms/ (which overrides the in-=
tree
modules via depmod precedence). The patches are in the common ath12k.ko; th=
e
wifi7/ subdir is untouched but rebuilt as a matched pair.

# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D BEGIN PAS=
TE (run as root) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
# Build a patched ath12k for single-band QCN9274 hw2.0 on Ubuntu 26.04/kern=
el 7.0
# FIX 1 (htc.c): cap wmi_ep_count to ab->qmi.num_radios (no bogus MAC1 endp=
oint)
# FIX 2 (wmi.c): skip dma-ring caps with unknown module_id instead of -EINV=
AL
set -euo pipefail

PKG=3Dath12k-qcn9274sb
VER=3D1.0
KVER=3D"$(uname -r)"
SRC=3D"/usr/src/linux-${KVER%%-*}/drivers/net/wireless/ath/ath12k"=C2=A0 =
=C2=A0# e.g. linux-7.0.0
DST=3D"/usr/src/${PKG}-${VER}"
KBUILD=3D"/lib/modules/${KVER}/build"

echo "=3D=3D ath12k single-band QCN9274 DKMS build =3D=3D"
echo "=C2=A0 =C2=A0kernel : $KVER"; echo "=C2=A0 =C2=A0source : $SRC"; echo=
 "=C2=A0 =C2=A0dkms=C2=A0 =C2=A0: $DST"
[ -d "$SRC" ]=C2=A0 =C2=A0 || { echo "ERROR: $SRC not found. Run: cd /usr/s=
rc && apt-get source linux"; exit 1; }
[ -d "$KBUILD" ] || { echo "ERROR: $KBUILD missing. Install linux-headers-$=
KVER"; exit 1; }

# 0. clean any prior attempt
if dkms status -m "$PKG" -v "$VER" 2>/dev/null | grep -q "$PKG"; then
=C2=A0 =C2=A0 dkms remove -m "$PKG" -v "$VER" --all || true
fi
rm -rf "$DST"

# 1. copy pristine ath12k tree (includes wifi7/ subdir)
mkdir -p "$DST"
cp -a "$SRC/." "$DST/"
find "$DST" \( -name '*.o' -o -name '*.ko' -o -name '*.mod' -o -name '*.mod=
=2Ec' \
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o -name '.*.cmd' -o -name 'modul=
es.order' -o -name 'Module.symvers' \) -delete 2>/dev/null || true

# 2. apply the two patches (exact-match; aborts if anchors don't match byte=
-for-byte)
python3 - "$DST" <<'PYEOF'
import sys, os
def patch(path, old, new, label):
=C2=A0 =C2=A0 d =3D open(path).read()
=C2=A0 =C2=A0 n =3D d.count(old)
=C2=A0 =C2=A0 if n !=3D 1:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(f"[FAIL] {label}: expected 1 match in =
{os.path.basename(path)}, found {n}")
=C2=A0 =C2=A0 open(path, "w").write(d.replace(old, new, 1))
=C2=A0 =C2=A0 print(f"[ OK ] {label}")
ATH =3D sys.argv[1]; HTC =3D ATH+"/htc.c"; WMI =3D ATH+"/wmi.c"

# ---- FIX 1: htc.c default case ----
A_OLD =3D ("\tdefault:\n\t\thtc->wmi_ep_count =3D ab->hw_params->max_radios=
;\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\tbreak;\n\t}\n")
A_NEW =3D ("\tdefault:\n\t\thtc->wmi_ep_count =3D ab->hw_params->max_radios=
;\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\t/* QCN9274 single-band fix: single-M=
AC cards advertise fewer PHYs\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\t * via QMI (ab->qmi.num_radios) than=
 hw_params->max_radios (2 for\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\t * qcn9274 hw2.0). Opening a WMI end=
point for the absent MAC1 fails\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\t * (\"HTC Service WMI MAC1 connect r=
equest failed\"). Cap to the\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\t * firmware-reported radio count whe=
n it is valid (>=3D1).\n\t\t */\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\tif (ab->qmi.num_radios !=3D U8_MAX &=
&\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\t=C2=A0 =C2=A0 ab->qmi.num_radios >=
=3D 1 &&\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\t=C2=A0 =C2=A0 ab->qmi.num_radios < h=
tc->wmi_ep_count)\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"\t\t\thtc->wmi_ep_count =3D ab->qmi.num_=
radios;\n\t\tbreak;\n\t}\n")

# ---- FIX 2: wmi.c add compaction index + skip unknown module ids ----
B1_OLD =3D ("\tstruct ath12k_dbring_cap *dir_buff_caps;\n\tint ret;\n\tu32 =
i;\n")
B1_NEW =3D ("\tstruct ath12k_dbring_cap *dir_buff_caps;\n\tint ret;\n\tu32 =
i, j;\n")

B2_OLD =3D ("\tdir_buff_caps =3D ab->db_caps;\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\tfor (i =3D 0; i < dma_caps_parse->n_d=
ma_ring_caps; i++) {\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tif (le32_to_cpu(dma_caps[i].module_=
id) >=3D WMI_DIRECT_BUF_MAX) {\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\tath12k_warn(ab, \"Invalid module =
id %d\\n\",\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\t\t=C2=A0 =C2=A0 le32_to_cpu(dma_c=
aps[i].module_id));\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\tret =3D -EINVAL;\n\t\t\tgoto free=
_dir_buff;\n\t\t}\n\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[i].id =3D le32_to_cpu=
(dma_caps[i].module_id);\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[i].pdev_id =3D\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\tDP_HW2SW_MACID(le32_to_cpu(dma_ca=
ps[i].pdev_id));\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[i].min_elem =3D le32_=
to_cpu(dma_caps[i].min_elem);\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[i].min_buf_sz =3D le3=
2_to_cpu(dma_caps[i].min_buf_sz);\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[i].min_buf_align =3D =
le32_to_cpu(dma_caps[i].min_buf_align);\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t}\n\n\treturn 0;\n\nfree_dir_buff:\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\tath12k_wmi_free_dbring_caps(ab);\n\tr=
eturn ret;\n}\n")
B2_NEW =3D ("\tdir_buff_caps =3D ab->db_caps;\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\tfor (i =3D 0, j =3D 0; i < dma_caps_p=
arse->n_dma_ring_caps; i++) {\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tif (le32_to_cpu(dma_caps[i].module_=
id) >=3D WMI_DIRECT_BUF_MAX) {\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\t/* QCN9274 single-band fix: fw WL=
AN.WBE.1.5/1.6 advertises\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\t * dma-ring module ids the host e=
num does not know yet; skip\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\t * them instead of failing the wh=
ole service-ready-ext parse\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\t * (which would block the WMI uni=
fied-ready event).\n\t\t\t */\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\tath12k_warn(ab, \"skipping unsupp=
orted dma ring module id %d\\n\",\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\t\t=C2=A0 =C2=A0 le32_to_cpu(dma_c=
aps[i].module_id));\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\tcontinue;\n\t\t}\n\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[j].id =3D le32_to_cpu=
(dma_caps[i].module_id);\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[j].pdev_id =3D\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\tDP_HW2SW_MACID(le32_to_cpu(dma_ca=
ps[i].pdev_id));\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[j].min_elem =3D le32_=
to_cpu(dma_caps[i].min_elem);\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[j].min_buf_sz =3D le3=
2_to_cpu(dma_caps[i].min_buf_sz);\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tdir_buff_caps[j].min_buf_align =3D =
le32_to_cpu(dma_caps[i].min_buf_align);\n"
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\tj++;\n\t}\n\n\tab->num_db_cap =3D j=
;\n\n\treturn 0;\n}\n")

patch(HTC, A_OLD, A_NEW, "FIX 1=C2=A0 htc.c wmi_ep_count cap")
patch(WMI, B1_OLD, B1_NEW, "FIX 2a wmi.c add index j")
patch(WMI, B2_OLD, B2_NEW, "FIX 2b wmi.c skip unknown dma-ring module id")
print("[DONE] patches applied")
PYEOF

# 3. dkms.conf
cat > "$DST/dkms.conf" <<EOF
PACKAGE_NAME=3D"$PKG"
PACKAGE_VERSION=3D"$VER"
AUTOINSTALL=3D"yes"
MAKE[0]=3D"make -C \${kernel_source_dir} M=3D\${dkms_tree}/\${PACKAGE_NAME}=
/\${PACKAGE_VERSION}/build modules"
CLEAN=3D"make -C \${kernel_source_dir} M=3D\${dkms_tree}/\${PACKAGE_NAME}/\=
${PACKAGE_VERSION}/build clean"
BUILT_MODULE_NAME[0]=3D"ath12k"
BUILT_MODULE_LOCATION[0]=3D"."
DEST_MODULE_LOCATION[0]=3D"/updates/dkms"
BUILT_MODULE_NAME[1]=3D"ath12k_wifi7"
BUILT_MODULE_LOCATION[1]=3D"wifi7"
DEST_MODULE_LOCATION[1]=3D"/updates/dkms"
EOF

# 4. build + install
dkms add -m "$PKG" -v "$VER"
if ! dkms build -m "$PKG" -v "$VER"; then
=C2=A0 =C2=A0 echo "!! build failed; tail of make.log:"
=C2=A0 =C2=A0 find /var/lib/dkms/$PKG/$VER -name make.log -exec tail -n 40 =
{} \;
=C2=A0 =C2=A0 exit 1
fi
dkms install -m "$PKG" -v "$VER" --force
depmod -a "$KVER"

# 5. confirm the patched modules win
echo "=3D=3D install paths (must be under updates/dkms) =3D=3D"
modinfo -n ath12k
modinfo -n ath12k_wifi7
echo "=3D=3D DONE. Next: edit GRUB (remove iommu=3Dpt), then reboot. =3D=3D=
"
# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D END PASTE=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Expected tail:
=C2=A0 =C2=A0 [ OK ] FIX 1=C2=A0 htc.c wmi_ep_count cap
=C2=A0 =C2=A0 [ OK ] FIX 2a wmi.c add index j
=C2=A0 =C2=A0 [ OK ] FIX 2b wmi.c skip unknown dma-ring module id
=C2=A0 =C2=A0 ...
=C2=A0 =C2=A0 /lib/modules/<ver>/updates/dkms/ath12k.ko.zst
=C2=A0 =C2=A0 /lib/modules/<ver>/updates/dkms/ath12k_wifi7.ko.zst

Step 10.4 =E2=80=94 FIX 3: remove iommu=3Dpt from the kernel command line=
=2E
Edit /etc/default/grub. In GRUB_CMDLINE_LINUX_DEFAULT (and GRUB_CMDLINE_LIN=
UX if
present), DELETE the "iommu=3Dpt" token. KEEP "intel_iommu=3Don". Example r=
esult:

=C2=A0 =C2=A0 GRUB_CMDLINE_LINUX_DEFAULT=3D"intel_iommu=3Don"

(If you previously added cma=3D512M it is now harmless/irrelevant; you can =
leave
or remove it.) Then:

=C2=A0 =C2=A0 grep -E '^GRUB_CMDLINE' /etc/default/grub=C2=A0 =C2=A0 =C2=A0=
# sanity check
=C2=A0 =C2=A0 sudo update-grub
=C2=A0 =C2=A0 sudo reboot

Step 10.5 =E2=80=94 VERIFY:
=C2=A0 =C2=A0 cat /proc/cmdline=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # intel_iomm=
u=3Don present, iommu=3Dpt absent
=C2=A0 =C2=A0 iw phy | grep Wiphy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # expect 3 lines: p=
hy0 phy1 phy2
=C2=A0 =C2=A0 iw dev=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# expect wlp129s0 / wlp132s0 / wlp133s0
=C2=A0 =C2=A0 dmesg | grep -iE 'ath12k|qmi dma|wmi unified|start core' | ta=
il -40

SUCCESS looks like:
=C2=A0 - NO "qmi dma allocation failed (... type 1)" line.
=C2=A0 - NO "failed to receive wmi unified ready" / "failed to start core"=
=2E
=C2=A0 - Interfaces renamed, e.g.:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ath12k_wifi7_pci 0000:81:00.0 wlp129s0: renamed=
 from wlan0=C2=A0 =C2=A0(board_id 0x1 =3D 2.4 GHz)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ath12k_wifi7_pci 0000:85:00.0 wlp133s0: renamed=
 from wlan0=C2=A0 =C2=A0(board_id 0x2 =3D 5 GHz)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ath12k_wifi7_pci 0000:84:00.0 wlp132s0: renamed=
 from wlan0=C2=A0 =C2=A0(board_id 0x4 =3D 6 GHz)
=C2=A0 - These remain and are EXPECTED/benign:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "memory type 10 not supported"=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (FW tolerates; paddr=3DNULL)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "skipping unsupported dma ring module id 2/3"=
=C2=A0 =C2=A0(FIX 2 working as intended)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 "module verification failed: signature ... tain=
ting kernel"=C2=A0 (unsigned out-of-tree module; fine with Secure Boot off)

---------------------------------------------------------------------------=
-----
11. OPTIONAL =E2=80=94 keep iommu=3Dpt for max host routing throughput
---------------------------------------------------------------------------=
-----
If you must keep iommu=3Dpt (e.g. you want identity-mapped host NIC DMA on =
a very
high-throughput box), the alternative to FIX 3 is to give dma-direct a
contiguous CMA pool BELOW 4 GB at a fixed base that avoids reserved e820 ra=
nges:

=C2=A0 =C2=A0 GRUB_CMDLINE_LINUX_DEFAULT=3D"... intel_iommu=3Don iommu=3Dpt=
 cma=3D512M@0x40000000"

Then after reboot confirm: dmesg "cma: Reserved 512 MiB at 0x<below 0x10000=
0000>"
and that "qmi dma allocation failed (type 1)" is gone. Validate the base ag=
ainst
your memory map (`dmesg | grep -i e820`) first; a bad base silently fails t=
o
reserve. This path was NOT used in the primary fix (dropping iommu=3Dpt is =
simpler
and fragmentation-proof), but it is the perf-preserving option.

---------------------------------------------------------------------------=
-----
12. PERSISTENCE / MAINTENANCE
---------------------------------------------------------------------------=
-----
- DKMS AUTOINSTALL=3D"yes" means the modules are rebuilt when a new kernel =
is
=C2=A0 installed, PROVIDED matching linux-headers are present (they ship wi=
th the
=C2=A0 kernel meta-packages).
- CAVEAT: the DKMS source is a COPY of the ath12k tree from the kernel you =
built
=C2=A0 against. A future kernel whose ath12k internal API has drifted may F=
AIL to
=C2=A0 rebuild this older source, leaving Wi-Fi down until the patch is re-=
ported to
=C2=A0 the new source (the patch anchors in the build script may need updat=
ing).
=C2=A0 POLICY (this deployment): option (b) =E2=80=94 do NOT pin the kernel=
=2E=C2=A0 Re-run the
=C2=A0 section 10.3 paste block after each kernel bump and fix any patch an=
chors
=C2=A0 that no longer match (the patch step aborts loudly if so =E2=80=94 i=
t never silently
=C2=A0 mis-patches).=C2=A0 Option (a) =E2=80=94 pin via `sudo apt-mark hold=
 linux-image-generic
=C2=A0 linux-headers-generic linux-generic` =E2=80=94 is the alternative if=
 Wi-Fi must
=C2=A0 survive an unattended kernel update, but it also holds kernel securi=
ty
=C2=A0 updates (not chosen for an internet-facing box).
=C2=A0 (In the production router repo this is AUTOMATED =E2=80=94 see Doc 1=
0 PART A0.6: a
=C2=A0 /etc/kernel/postinst.d hook + a boot-time verify/self-heal service, =
both
=C2=A0 driven by a single /usr/local/sbin/ath12k-repatch helper.=C2=A0 A st=
andalone
=C2=A0 reader can replicate that or just re-run the section 10.3 block by h=
and.)
- The GRUB change (FIX 3) persists across kernel updates automatically.
- These two patches are the upstream-pending DR9574 fixes plus a dma-ring
=C2=A0 tolerance fix. If/when they merge into mainline ath12k, you can `dkm=
s remove`
=C2=A0 the package and run the stock driver.

---------------------------------------------------------------------------=
-----
13. QUICK REFERENCE =E2=80=94 the whole fix in one place
---------------------------------------------------------------------------=
-----
1) mokutil --sb-state=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# must be: SecureBoot disabled
2) apt-get install build-essential dkms linux-headers-$(uname -r)
3) enable deb-src; apt-get source linux=C2=A0 =C2=A0 =C2=A0 =C2=A0# provide=
s /usr/src/linux-*/.../ath12k
4) paste the DKMS block in section 10.3 (as root)=C2=A0 =C2=A0# FIX 1 + FIX=
 2 -> updates/dkms
5) edit /etc/default/grub: remove iommu=3Dpt, keep intel_iommu=3Don=C2=A0 =
=C2=A0# FIX 3
6) sudo update-grub && sudo reboot
7) iw phy | grep Wiphy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 3 radios =3D done
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

---------------------------------------------------------------------------=
-----
14. CONFIRMED-WORKING OUTPUT (captured from nola-router AFTER the fix)
---------------------------------------------------------------------------=
-----
The following is the actual post-fix output proving all three Compex WLE700=
0E /
QCN9274 hw2.0 radios initialize and are band-capable. This is the "after" s=
tate
that corresponds to the broken "before" state in section 1.

--- kernel command line (FIX 3 applied: intel_iommu=3Don present, iommu=3Dp=
t gone) ---
$ cat /proc/cmdline
BOOT_IMAGE=3D/boot/vmlinuz-7.0.0-22-generic root=3DUUID=3Ddf03d4bf-8eed-408=
9-a486-f100a9edac93 ro intel_iommu=3Don cma=3D512M crashkernel=3D2G-4G:320M=
,4G-32G:512M,32G-64G:1024M,64G-128G:2048M,128G-:4096M
=C2=A0 (cma=3D512M is leftover from a dead-end test and is harmless; the op=
erative
=C2=A0 =C2=A0change is the ABSENCE of iommu=3Dpt.)

--- patched modules are the ones loaded (FIX 1+2 via DKMS, under updates/dk=
ms) ---
$ modinfo -n ath12k ath12k_wifi7
/lib/modules/7.0.0-22-generic/updates/dkms/ath12k.ko.zst
/lib/modules/7.0.0-22-generic/updates/dkms/ath12k_wifi7.ko.zst

--- three PHYs now enumerate ---
$ iw phy | grep Wiphy
Wiphy phy2
Wiphy phy1
Wiphy phy0

--- dmesg: clean bring-up (NO "qmi dma allocation failed", NO "wmi unified =
ready -110") ---
$ dmesg | grep -iE 'ath12k|qmi dma|wmi unified|start core' | tail -40
[=C2=A0 =C2=A012.542027] ath12k: loading out-of-tree module taints kernel=
=2E
[=C2=A0 =C2=A012.542033] ath12k: module verification failed: signature and/=
or required key missing - tainting kernel
[=C2=A0 =C2=A012.703250] ath12k_wifi7_pci 0000:81:00.0: BAR 0 [mem 0xce4000=
00-0xce5fffff 64bit]: assigned
[=C2=A0 =C2=A012.703316] ath12k_wifi7_pci 0000:81:00.0: Wi-Fi 7 Hardware na=
me: qcn9274 hw2.0
[=C2=A0 =C2=A012.703627] ath12k_wifi7_pci 0000:81:00.0: MSI vectors: 16
[=C2=A0 =C2=A013.512996] ath12k_wifi7_pci 0000:84:00.0: BAR 0 [mem 0xce2000=
00-0xce3fffff 64bit]: assigned
[=C2=A0 =C2=A013.513073] ath12k_wifi7_pci 0000:84:00.0: Wi-Fi 7 Hardware na=
me: qcn9274 hw2.0
[=C2=A0 =C2=A013.513480] ath12k_wifi7_pci 0000:84:00.0: MSI vectors: 16
[=C2=A0 =C2=A014.238316] ath12k_wifi7_pci 0000:85:00.0: BAR 0 [mem 0xce0000=
00-0xce1fffff 64bit]: assigned
[=C2=A0 =C2=A014.238389] ath12k_wifi7_pci 0000:85:00.0: Wi-Fi 7 Hardware na=
me: qcn9274 hw2.0
[=C2=A0 =C2=A014.238702] ath12k_wifi7_pci 0000:85:00.0: MSI vectors: 16
[=C2=A0 =C2=A015.018704] ath12k_wifi7_pci 0000:81:00.0: memory type 10 not =
supported
[=C2=A0 =C2=A015.019946] ath12k_wifi7_pci 0000:84:00.0: memory type 10 not =
supported
[=C2=A0 =C2=A015.021249] ath12k_wifi7_pci 0000:85:00.0: memory type 10 not =
supported
[=C2=A0 =C2=A015.023268] ath12k_wifi7_pci 0000:81:00.0: chip_id 0x0 chip_fa=
mily 0xb board_id 0x1 soc_id 0x401a2200
[=C2=A0 =C2=A015.023275] ath12k_wifi7_pci 0000:81:00.0: fw_version 0x160484=
db fw_build_timestamp 2025-12-09 19:48 fw_build_id QC_IMAGE_VERSION_STRING=
=3DWLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
[=C2=A0 =C2=A015.024491] ath12k_wifi7_pci 0000:84:00.0: chip_id 0x0 chip_fa=
mily 0xb board_id 0x4 soc_id 0x401a2200
[=C2=A0 =C2=A015.024504] ath12k_wifi7_pci 0000:84:00.0: fw_version 0x160484=
db fw_build_timestamp 2025-12-09 19:48 fw_build_id QC_IMAGE_VERSION_STRING=
=3DWLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
[=C2=A0 =C2=A015.025772] ath12k_wifi7_pci 0000:85:00.0: chip_id 0x0 chip_fa=
mily 0xb board_id 0x2 soc_id 0x401a2200
[=C2=A0 =C2=A015.025787] ath12k_wifi7_pci 0000:85:00.0: fw_version 0x160484=
db fw_build_timestamp 2025-12-09 19:48 fw_build_id QC_IMAGE_VERSION_STRING=
=3DWLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
[=C2=A0 =C2=A017.216586] ath12k_wifi7_pci 0000:81:00.0: skipping unsupporte=
d dma ring module id 2
[=C2=A0 =C2=A017.216604] ath12k_wifi7_pci 0000:81:00.0: skipping unsupporte=
d dma ring module id 3
[=C2=A0 =C2=A017.339486] ath12k_wifi7_pci 0000:85:00.0: skipping unsupporte=
d dma ring module id 2
[=C2=A0 =C2=A017.339507] ath12k_wifi7_pci 0000:85:00.0: skipping unsupporte=
d dma ring module id 3
[=C2=A0 =C2=A017.462641] ath12k_wifi7_pci 0000:81:00.0 wlp129s0: renamed fr=
om wlan0
[=C2=A0 =C2=A017.483645] ath12k_wifi7_pci 0000:85:00.0 wlp133s0: renamed fr=
om wlan0
[=C2=A0 =C2=A017.927542] ath12k_wifi7_pci 0000:84:00.0: skipping unsupporte=
d dma ring module id 2
[=C2=A0 =C2=A017.927557] ath12k_wifi7_pci 0000:84:00.0: skipping unsupporte=
d dma ring module id 3
[=C2=A0 =C2=A018.155264] ath12k_wifi7_pci 0000:84:00.0 wlp132s0: renamed fr=
om wlan0
=C2=A0 (The only remaining messages are the EXPECTED/benign ones: the unsig=
ned-module
=C2=A0 =C2=A0taint, "memory type 10 not supported", and the FIX-2 "skipping=
 ... module id
=C2=A0 =C2=A02/3". The fatal lines from section 1 are all gone.)

--- the three net interfaces exist (one per radio) ---
$ iw dev
phy#2
=C2=A0 =C2=A0 Interface wlp132s0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifindex 16
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wdev 0x200000001
=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr 04:f0:21:cd:3b:3b
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type managed
phy#1
=C2=A0 =C2=A0 Interface wlp133s0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifindex 15
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wdev 0x100000001
=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr 04:f0:21:c9:e0:fe
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type managed
phy#0
=C2=A0 =C2=A0 Interface wlp129s0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifindex 14
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wdev 0x1
=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr 04:f0:21:c9:e0:84
=C2=A0 =C2=A0 =C2=A0 =C2=A0 type managed

--- per-radio band capability (each card on its own band, HE/VHT/EHT presen=
t) ---
$ for p in 0 1 2; do echo "=3D=3D phy$p =3D=3D"; iw phy phy$p info | grep -=
iE '^\s*Band|MHz \[|EHT|VHT|HE ' | head -5; done
=3D=3D phy0 =3D=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 # wlp129s0=C2=A0 -> Band 1 =
=3D 2.4 GHz
=C2=A0 =C2=A0 Band 1:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HE Iftypes: managed
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HE MAC Capabilities (0x000b9a1810=
40):
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +HTC HE Supported
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HE PHY Capabilities: (0x026040890=
fc39f1c110e00):
=3D=3D phy1 =3D=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 # wlp133s0=C2=A0 -> Band 2 =
=3D 5 GHz
=C2=A0 =C2=A0 Band 2:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VHT Capabilities (0x338bf9f6):
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VHT RX MCS set:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VHT RX highest supported: 0 Mbps
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VHT TX MCS set:
=3D=3D phy2 =3D=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 # wlp132s0=C2=A0 -> Band 4 =
=3D 6 GHz
=C2=A0 =C2=A0 Band 4:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HE Iftypes: managed
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HE MAC Capabilities (0x000b9a1818=
40):
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +HTC HE Supported
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HE PHY Capabilities: (0x0c634089f=
fdb9f1c110e00):

RESULT: 3/3 radios up and band-capable.
=C2=A0 phy0 / wlp129s0=C2=A0 Band 1 (2.4 GHz)=C2=A0 MAC 04:f0:21:c9:e0:84=
=C2=A0 board_id 0x1=C2=A0 PCIe 0000:81:00.0
=C2=A0 phy1 / wlp133s0=C2=A0 Band 2 (5=C2=A0 =C2=A0GHz)=C2=A0 MAC 04:f0:21:=
c9:e0:fe=C2=A0 board_id 0x2=C2=A0 PCIe 0000:85:00.0
=C2=A0 phy2 / wlp132s0=C2=A0 Band 4 (6=C2=A0 =C2=A0GHz)=C2=A0 MAC 04:f0:21:=
cd:3b:3b=C2=A0 board_id 0x4=C2=A0 PCIe 0000:84:00.0
Radios come up in "managed" type; hostapd then switches them to AP mode.
Captured on Ubuntu 26.04, kernel 7.0.0-22-generic, 2026-06-06.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

