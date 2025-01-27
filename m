Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E5C02188
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhpud+FC+D8ELGj6S/odIa4UunxlGroYpfJFdZNAbFQ=; b=i96rXB1/PfAGBlsW8yjT2/lnt/
	NkvUq9nJxR5jlMUkcU61v8xzGuHmuOuT0MhOChqdEEZp5DB/a/1FY7wTcj5gM3/E9y2f8s0CVTWL2
	LE9FPGqY1BGX1OJwPSjgSiOgLCUFYdHcz1/Ki9mProQmNxB+yA5MlH59j4GuKghknD18IScWGzjku
	91wp29ZEY34Oau8UHBtOX+95z8vBLQl8+z9+ItvOR4Cj+8cW5UKF8xsTl3FatKYun94uramRvMGgO
	k6RbO02lnf0He0U3FxKActOkup9sTtMHn5tNIPcW9TgbkRMs0OemnPLjLCYL+sKTWTjYJOMzSVhG1
	5QYC/iIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPgE-00000002RaU-2EV8
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 14:01:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPgC-00000002RZq-1sPI
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 14:01:33 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so5881711a12.1
        for <ath12k@lists.infradead.org>; Mon, 27 Jan 2025 06:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737986489; x=1738591289; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhpud+FC+D8ELGj6S/odIa4UunxlGroYpfJFdZNAbFQ=;
        b=VeJv9wnahi/7urssHFMC/ML/x5J98z1Uu9UBzknhS8PZdePTh1DxcndwmZqRCZsmmc
         wBUEeocS9K39TX2JCQ6v4Fk2krK6ae3IyJJJMV3J44iLNf90OUetT0kYAfU7q38Lre0R
         CO0qYivCsMsyuNssY3c5yXxKgv+h5DNO1EZ7gqt1D5Xw0E7r1YwaveE1giz6WrWZPi+K
         kAvNGtQsVkKAOFciP8M4rGHfnWTkc8fj4NiAvClwrHRHCmS0LH9N8uTRDudC06WL+yVx
         rxsbWWZJGrDGBZP8y7ZneO6oUYjmV2gM1Dg83EbzfOmkcl9X080BjcYWCcwO3TcXJVPj
         h4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737986489; x=1738591289;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhpud+FC+D8ELGj6S/odIa4UunxlGroYpfJFdZNAbFQ=;
        b=J1qml91X7u7oJt1a1/I2oBnGtllQAkREwzmLLh+fjdXsHlcA94edss8I1VYVsS48YM
         PFixRz2WKPnqA5fHuNXd/Ua+0GhCIBjunoQgEcbQS6rSCZTHvbs2Sug5qQbvoreiIXcx
         eCe15o/fnGz7T3KqISsWm6LiCTkCE87r31s9fbFI9/hOVXE6syYFcMl7vSkZXNQT9Lt5
         RdYj6cWVWdmazKCdD/WawJrCZ0uDf1Sn1qP4r8EaXkJ0z6+IGaax8RrOL0P9Lhiwh9Hk
         D8h9aph67CLAZNEb8vnnp5DON9hZvUqA9nEr7LcSGmllxt7CVausWDtaYM57B3rLoMLs
         arPA==
X-Forwarded-Encrypted: i=1; AJvYcCWdWiL6i91iiaF8cRprfab/4sgaKH0TBAwAuY3zEAERbOehU8Ub2FKx7dfbCcvb/JaLKs+U5gQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWf00cZGNPxlywa72BbD9scBRUIkrqrDDGlk9jRA2z4Yr+x9rE
	IIEBAOv3Pqg97L72BpdT5FEo8fHoa+fSGPNUeJxYc4ODUwC+hdm+wNN+aA==
X-Gm-Gg: ASbGncu+GbQUyAhvaPmRgDet1n9b3ZbHwmtUhyfmWA5omgGN+tdF0fn+d2hcr5RKbxv
	YCUrkYVI5cJwazX2GSlAmBTMYoqQh4pC462lqx6freU3RtO0jwI2IkQwhJzNyzwFQ0XsreRTrWe
	0yvju4gF99gdCyv2/h//wG1ayNw8HaNqAuqEpZ1O/0Zxj5oMs2h9rYobsxv/BO8gTpggN1tLHt1
	fr//XxEWpblmCaRToGIbsCrzQWohi0RGjDK7B4s0LbVxceh/nXeRbsQH2gq0JVN0Ds1GWkTCE35
	KLsLocRLVSl4IWSso/gQ/sGsEezRnZwKlw==
X-Google-Smtp-Source: AGHT+IHQymqqvqWwj1uOFwUoCb0rds8+JEgbNwsddeisa9CKxEf3K3Zahn9eDLmTBwDY/HEyEbgvGQ==
X-Received: by 2002:a17:907:1c8d:b0:aaf:1183:ec2c with SMTP id a640c23a62f3a-ab38b0b7f65mr3845861666b.5.1737986486989;
        Mon, 27 Jan 2025 06:01:26 -0800 (PST)
Received: from [10.0.1.16] (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab69b47f622sm273511066b.39.2025.01.27.06.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 06:01:26 -0800 (PST)
Message-ID: <afe586a1acf458edcfe7cf76f4dcfa8b18ad716a.camel@gmail.com>
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
From: Parth Panchoil <parth105105@gmail.com>
To: "quic_bqiang@quicinc.com" <quic_bqiang@quicinc.com>, 
	"ath12k@lists.infradead.org"
	 <ath12k@lists.infradead.org>
Date: Mon, 27 Jan 2025 15:01:25 +0100
In-Reply-To: <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
	 <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
	 <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_060132_503024_1E3EE26E 
X-CRM114-Status: GOOD (  35.66  )
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

I am currently debugging the ath12k_pci_enable_ltssm start up crash/bug
with the mainline kernel on my system and would like to share my
observations so far:

The ath12k mainline driver gets stuck at this specific line:=20
https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d=
366a/drivers/net/wireless/ath/ath12k/pci.c#L295
in the ath12k_pci_enable_ltssm  which attempts to read
GCC_GCC_PCIE_HOT_RST, particularly
https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d=
366a/drivers/net/wireless/ath/ath12k/pci.c#L1209

Interestingly, within the same function, the line val =3D
ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM) successfully reads the
expected value 0x111 for PCIE_PCIE_PARF_LTSSM.

I am continuing to debug from my end, although my understanding of the
ath12k driver is limited. Any leads, suggestions, or hints to help
resolve this issue would be greatly appreciated.

Thank you.

Regards,
Parth P


On Fri, 2025-01-24 at 10:02 +0000, Parth Pancholi wrote:
> I appreciate your response, Baochen.
>=20
> I have been working on enabling mainline kernel support on my TI
> AM69-
> SK board to test the mainline ath12k driver on my system.
>=20
> Using the mainline kernel repository for the ath drivers [1], I made
> the following observation:=C2=A0
> While the exact crash observed earlier is no longer present, the
> system
> hangs upon loading the ath12k mainline driver, displaying the
> messages
> below.
>=20
> root@am69-sk:~# modprobe ath12k debug_mask=3D0xffffffff
> [ 1121.996554] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x4410200000-
> 0x44103fffff 64bit]: assigned
> [ 1122.004884] ath12k_pci 0000:01:00.0: enabling device (0000 ->
> 0002)
> [ 1122.011818] ath12k_pci 0000:01:00.0: MSI vectors: 16
> [ 1122.016798] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
> [ 1122.040183] NET: Registered PF_QIPCRTR protocol family
>=20
> root@am69-sk:~# uname -a
> Linux am69-sk 6.13.0-rc7-wt-ath-ge7ef944b3e2c-dirty #2 SMP PREEMPT
> Wed
> Jan 22 16:55:17 CET 2025 aarch64 GNU/Linux
>=20
> root@am69-sk:~# lspci
> 0000:00:00.0 PCI bridge: Texas Instruments Device b012
> 0000:01:00.0 Network controller: Qualcomm Technologies, Inc WCN785x
> Wi-
> Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
> 0001:00:00.0 PCI bridge: Texas Instruments Device b012
> 0002:00:00.0 PCI bridge: Texas Instruments Device b012
>=20
> Do you have any insights into what might still be missing or
> incorrect
> in my setup?
>=20
> Regards,
> Parth P
>=20
> On Wed, 2025-01-22 at 15:20 +0800, Baochen Qiang wrote:
> >=20
> >=20
> > On 1/21/2025 10:19 PM, Parth Panchoil wrote:
> > > Hi All,
> > >=20
> > > I am performing tests on the SX-PCEBE Wi-Fi module, which
> > > utilizes
> > > the
> > > ATH12k driver, on the Texas Instruments AM69-SK board.
> > > The board is running the TI Linux Kernel from the ti-linux-6.6.y
> >=20
> > 6.6 is too old, and besides we don;t support customer kernel.
> >=20
> > Could you try latest ath tree [1] or the mainline tree [2]?
> >=20
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
> > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> >=20
> > If the issue is still seen, please enable verbose ath12k log using
> > below command and help
> > collect dmesg logs:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sudo modprobe ath12k de=
bug_mask=3D0xffffffff
> >=20
> > One more thing, the open-WRT patch is overkill, can you narrow down
> > to find which line of
> > code in ath12k_pci_enable_ltssm() is causing this issue?
> >=20
> >=20
> > > branch. During testing, I observed a kernel crash from the ATH12k
> > > driver as soon as the probe is called. The crash log is as
> > > follows:
> > >=20
> > > [=C2=A0=C2=A0=C2=A0 9.492631] Kernel panic - not syncing: Asynchronou=
s SError
> > > Interrupt
> > > [=C2=A0=C2=A0=C2=A0 9.492634] CPU: 7 PID: 222 Comm: (udev-worker) Not=
 tainted
> > > 6.6.58-
> > > 01497-ga7758da17c28-dirty #1
> > > [=C2=A0=C2=A0=C2=A0 9.492638] Hardware name: Texas Instruments AM69 S=
K (DT)
> > > [=C2=A0=C2=A0=C2=A0 9.492640] Call trace:
> > > [=C2=A0=C2=A0=C2=A0 9.492642]=C2=A0 dump_backtrace+0x94/0xec
> > > [=C2=A0=C2=A0=C2=A0 9.492658]=C2=A0 show_stack+0x18/0x24
> > > [=C2=A0=C2=A0=C2=A0 9.492662]=C2=A0 dump_stack_lvl+0x48/0x60
> > > [=C2=A0=C2=A0=C2=A0 9.492669]=C2=A0 dump_stack+0x18/0x24
> > > [=C2=A0=C2=A0=C2=A0 9.492672]=C2=A0 panic+0x320/0x378
> > > [=C2=A0=C2=A0=C2=A0 9.492677]=C2=A0 nmi_panic+0x8c/0x90
> > > [=C2=A0=C2=A0=C2=A0 9.492681]=C2=A0 arm64_serror_panic+0x6c/0x78
> > > [=C2=A0=C2=A0=C2=A0 9.492686]=C2=A0 do_serror+0x3c/0x78
> > > [=C2=A0=C2=A0=C2=A0 9.492692]=C2=A0 el1h_64_error_handler+0x34/0x4c
> > > [=C2=A0=C2=A0=C2=A0 9.492697]=C2=A0 el1h_64_error+0x64/0x68
> > > [=C2=A0=C2=A0=C2=A0 9.492700]=C2=A0 ath12k_pci_read32+0x1bc/0x1e8 [at=
h12k]
> > > [=C2=A0=C2=A0=C2=A0 9.492725]=C2=A0 ath12k_pci_power_up+0xdc/0x340 [a=
th12k]
> > > [=C2=A0=C2=A0=C2=A0 9.492747]=C2=A0 ath12k_core_init+0x2c/0xa8 [ath12=
k]
> > > [=C2=A0=C2=A0=C2=A0 9.492769]=C2=A0 ath12k_pci_probe+0x698/0x908 [ath=
12k]
> > > [=C2=A0=C2=A0=C2=A0 9.492791]=C2=A0 pci_device_probe+0xa8/0x16c
> > > [=C2=A0=C2=A0=C2=A0 9.492800]=C2=A0 really_probe+0x110/0x27c
> > > [=C2=A0=C2=A0=C2=A0 9.492805]=C2=A0 __driver_probe_device+0x78/0x12c
> > > [=C2=A0=C2=A0=C2=A0 9.492808]=C2=A0 driver_probe_device+0x3c/0x118
> > > [=C2=A0=C2=A0=C2=A0 9.492810]=C2=A0 __driver_attach+0x74/0x124
> > > [=C2=A0=C2=A0=C2=A0 9.492813]=C2=A0 bus_for_each_dev+0x78/0xd8
> > > [=C2=A0=C2=A0=C2=A0 9.492819]=C2=A0 driver_attach+0x24/0x30
> > > [=C2=A0=C2=A0=C2=A0 9.492824]=C2=A0 bus_add_driver+0xe4/0x208
> > > [=C2=A0=C2=A0=C2=A0 9.492828]=C2=A0 driver_register+0x60/0x128
> > > [=C2=A0=C2=A0=C2=A0 9.492831]=C2=A0 __pci_register_driver+0x44/0x50
> > > [=C2=A0=C2=A0=C2=A0 9.492835]=C2=A0 ath12k_pci_init+0x2c/0x6c [ath12k=
]
> > > [=C2=A0=C2=A0=C2=A0 9.492858]=C2=A0 do_one_initcall+0x70/0x1b4
> > > [=C2=A0=C2=A0=C2=A0 9.492861]=C2=A0 do_init_module+0x58/0x1e4
> > > [=C2=A0=C2=A0=C2=A0 9.492867]=C2=A0 load_module+0x19bc/0x1a8c
> > > [=C2=A0=C2=A0=C2=A0 9.492869]=C2=A0 init_module_from_file+0x88/0xc4
> > > [=C2=A0=C2=A0=C2=A0 9.492873]=C2=A0 __arm64_sys_finit_module+0x1c0/0x=
2ac
> > > [=C2=A0=C2=A0=C2=A0 9.492877]=C2=A0 invoke_syscall+0x44/0x108
> > > [=C2=A0=C2=A0=C2=A0 9.492882]=C2=A0 el0_svc_common.constprop.0+0xc0/0=
xe0
> > > [=C2=A0=C2=A0=C2=A0 9.492885]=C2=A0 do_el0_svc+0x1c/0x28
> > > [=C2=A0=C2=A0=C2=A0 9.492889]=C2=A0 el0_svc+0x2c/0x84
> > > [=C2=A0=C2=A0=C2=A0 9.492892]=C2=A0 el0t_64_sync_handler+0xc0/0xc4
> > > [=C2=A0=C2=A0=C2=A0 9.492895]=C2=A0 el0t_64_sync+0x190/0x194
> > > [=C2=A0=C2=A0=C2=A0 9.492899] SMP: stopping secondary CPUs
> > > [=C2=A0=C2=A0=C2=A0 9.492908] Kernel Offset: disabled
> > > [=C2=A0=C2=A0=C2=A0 9.492909] CPU features: 0x0,80000200,28020000,100=
0420b
> > > [=C2=A0=C2=A0=C2=A0 9.492913] Memory Limit: none
> > >=20
> > > Upon searching online, I found the OpenWRT patch that appears to
> > > address a similar issue: OpenWRT Patch: Prevent LTSSM Startup
> > > Crash.
> > > https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dpackage=
/kernel/mac80211/patches/ath12k/100-ath12k-prevent-ltssm-startup-crash.patc=
h;h=3Dcd85a0f6aa2652d62bfbea04e9bcca3bcf831b7f;hb=3D935b2b7dcef61b2893ed5df=
f307dd8f8a1156899
> > > With the above patch applied, I do not see the crash anymore.
> > >=20
> > > Could anyone confirm if this issue has been reported before/known
> > > bug
> > > or provide any insights?=20
> > > Any additional information or suggestions would be greatly
> > > appreciated.
> > >=20
> > > Details about the test setup,
> > > TI-AM69-SK board:
> > > https://www.ti.com/tool/SK-AM69?keyMatch=3Dam69%20sk&tisearch=3Dunive=
rsal_search
> > > Silex WiFi card SX-PCEBE:
> > > https://www.silextechnology.com/connectivity-solutions/embedded-wirel=
ess/sx-pcebe
> > > TI Linux Repo:
> > > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=3Dti-linux=
-6.6.y
> > >=20
> > > Thank you.
> > >=20
> > > Regards,
> > > Parth P
> > >=20
> >=20
> >=20
>=20
>=20


