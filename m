Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7333C369D9
	for <ath12k@archiver.kernel.org>; Wed, 30 Apr 2025 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONydG510Fm8KwhA5DQVNVbqo5t6hzEwRLRhcQgwsF7c=; b=eeVsUwjvC4kpnf6NgzVxjzyEpM
	s/jxI24TdfXcjosYUTrkIrcji7fk+vS4BwsPU7+OJct5shO3ad6cu7agyFofCaSq067L6YqXFnA5R
	C2PJh4ZCCgV/z4/BMwtCM7C4PfFwKKYj1oCnXV871VJYffw4Uu2xUdEK+X/2/Jz1FGOnTTR8FSKZI
	z9QC6w9lKo4izMh3MIN7s36JtMl/bq8sBiLjkUjUPzRXIEr2RL8ykQ4HrlbuJQLb2i5/LCeo/XgtU
	koEsn/8Ogwj+76BO3nSAdTcsuDEbpXFWm0EPrikuqdEYp7OE2mAVvYMyFzOEzD1wsXyu2ZNEYbvrv
	yRy/FGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6ty-0000000CsXY-2Osc;
	Wed, 30 Apr 2025 12:51:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6tw-0000000CsVL-1EG5
	for ath12k@lists.infradead.org;
	Wed, 30 Apr 2025 12:51:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so65351935e9.3
        for <ath12k@lists.infradead.org>; Wed, 30 Apr 2025 05:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746017458; x=1746622258; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONydG510Fm8KwhA5DQVNVbqo5t6hzEwRLRhcQgwsF7c=;
        b=bEFyjyqZfiQ2vuEOdFN+H54DGikn547SjcvvOe3HSfT2vbIoYOp35sEXLYfap4rT4i
         rpZx0wgS7V+p3pX/K9lzvKgT8dQXCXQqUJgIxLXn1qwCw30MTMqhXeGT4t0qByqXwKiH
         bcjazR8oae6JDIgK3UQzfrhOwz96TQV/kmZ88TTA5cl3SlAbaYJoMhlieurM63idjhgY
         k8V3gSVyyeHYWH3j8G4X3/N1zaFIAinuYIyngwmz7dNTjw/fT2GCsk0AMrXUcp41ZyU3
         UdOUhiC0C3OtxNmhqN3BTATrDXViIS4AXV2XLfq+rIU5GRkn/2m9QXxrOqzdBusC9sDp
         Aqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746017458; x=1746622258;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ONydG510Fm8KwhA5DQVNVbqo5t6hzEwRLRhcQgwsF7c=;
        b=EJG4KPvtWHaR8corZBXlme839FN2FBPbAucXJZXVb1vI0oMKpz5B4jBXw1/BlrSSHc
         xf0V/9Ewgk8Y5dktY2DAZstpZ0Ww1xiHyZCzGJo+xJtUERwHt/v9VpWDO8Zms/wjWceR
         7eGKfXT3SgZlRfDVbGEWXZn7kYK5YkNJ6hWp89gLWLLRXgFgtwW29kdGHSBJaQ8DaxoN
         z2q2kdTqQcEC968/OM5nwCJQI1LFQ3Sv7zakkSeaDihsWKEr2ELN6KwA8CK2oCWFNwkk
         oYL0u3np5DZqphqn2wkDPKqqPjKmBGK6EahVSAA27hLcvWmtXyscYHmKRRRKmA3YZLL8
         xXfw==
X-Forwarded-Encrypted: i=1; AJvYcCUFB9mtx6/Gpbg2qU0l8z0fjonU0QDlVXFuVCAFZM4TdxwbNLs6c5pbaZftSqvPe3XJxyEPmWs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgvglp5ojq6MJctMJYLvW7F8ZL4T6Gv+mc10LLXWx7Ds/nYsmV
	mrS/yXWB1mmFTtza8wxYyj9xmFgoUKx5lV6gq4Ujc3cWH8J8fMAj
X-Gm-Gg: ASbGncvBeIedXy7KtSdvReXXlfuWBW4fDhCS65jfRl2Jj1qdO/mFfNwcu0xq/qzK/Cz
	IywU2aL6+6nW9/89MWUDwLZVrmsTwafnUqremVH+pSkAUZIAmygtUHrxboBAC2Um159OWz+9ilG
	vVUnLGuwx2vYixaM7RT+raoMPHkLciaxbqg8A30DQldEyv1KCnXN2j+eosw/IhaJzw9n/KBiYw2
	cqEMCMrqLa2JJMepZB8AqGb/umG0bhil7eXbPFR1hJElASaE9SjAytwGwO3o/ELN07wWexo4hqS
	5GUcuPhlabiQ7JYRsUAF2Lp4nEB22oT2GT2WJ1x1kPYmL5ROvJXFczjS5EjMwOuoZ/VEzw==
X-Google-Smtp-Source: AGHT+IGAmAO0YS+5m3w8Dxq3J8vduZjTybzuoiEG6nMmJ+L3NIfjpgJaYQvPA3AEuiKCrq3ZgEH9/w==
X-Received: by 2002:a05:600c:a4e:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-441b1f30682mr30378905e9.5.1746017457597;
        Wed, 30 Apr 2025 05:50:57 -0700 (PDT)
Received: from [10.0.1.16] (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a8dsm24025305e9.13.2025.04.30.05.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:50:56 -0700 (PDT)
Message-ID: <479bd0f6ef7fbb5f0e0d0d8f71a804002e6b5f6b.camel@gmail.com>
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
From: Parth Panchoil <parth105105@gmail.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>, "ath12k@lists.infradead.org"
	 <ath12k@lists.infradead.org>
Date: Wed, 30 Apr 2025 14:50:55 +0200
In-Reply-To: <6aa877c8-322d-44eb-a8ca-5d00ffa63d8f@quicinc.com>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
	 <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
	 <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
	 <afe586a1acf458edcfe7cf76f4dcfa8b18ad716a.camel@gmail.com>
	 <28b5436a-556b-4b0e-a66c-eec453f4f5b8@quicinc.com>
	 <6aa877c8-322d-44eb-a8ca-5d00ffa63d8f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_055100_337665_F58FD4AC 
X-CRM114-Status: GOOD (  49.38  )
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

On Wed, 2025-02-19 at 18:18 +0800, Baochen Qiang wrote:
>=20
>=20
> On 2/5/2025 10:20 AM, Baochen Qiang wrote:
> >=20
> >=20
> > On 1/27/2025 10:01 PM, Parth Panchoil wrote:
> > > Hi,
> > >=20
> > > I am currently debugging the ath12k_pci_enable_ltssm start up
> > > crash/bug
> > > with the mainline kernel on my system and would like to share my
> > > observations so far:
> > >=20
> > > The ath12k mainline driver gets stuck at this specific line:=20
> > > https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebe=
f5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L295
> > > in the ath12k_pci_enable_ltssm=C2=A0 which attempts to read
> > > GCC_GCC_PCIE_HOT_RST, particularly
> > > https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebe=
f5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L1209
> >=20
> > thanks for the narrow down, really helpful.
> >=20
> > We internally have observed this issue, although at a different
> > line:
> >=20
> > https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5=
519d366a/drivers/net/wireless/ath/ath12k/pci.c#L298
> >=20
> > For now I am suspecting that GCC_GCC_PCIE_HOT_RST is not a valid
> > register on WLAN target
> > side, I will check internally and get back.
>=20
> Parth, could you do below change and try again?
>=20
> -#define GCC_GCC_PCIE_HOT_RST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x1=
e38338
> +#define GCC_GCC_PCIE_HOT_RST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x1=
e40304
>=20
Hi Baochen,

Thanks for the hint regarding the change.
I tested this change on top of the ath-202504172310 tag on the TI AM69
platform and can confirm that the startup crash no longer occurs.=20
Interestingly, this issue was not observed on other platforms like the
NXP iMX8MP.

If I understand correctly, the change is related to a WLAN target
register.=20

Could you help clarify why this issue only affects certain platforms
(hosts)?

Regards,
Parth P

> >=20
> > >=20
> > > Interestingly, within the same function, the line val =3D
> > > ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM) successfully reads
> > > the
> > > expected value 0x111 for PCIE_PCIE_PARF_LTSSM.
> > >=20
> > > I am continuing to debug from my end, although my understanding
> > > of the
> > > ath12k driver is limited. Any leads, suggestions, or hints to
> > > help
> > > resolve this issue would be greatly appreciated.
> > >=20
> > > Thank you.
> > >=20
> > > Regards,
> > > Parth P
> > >=20
> > >=20
> > > On Fri, 2025-01-24 at 10:02 +0000, Parth Pancholi wrote:
> > > > I appreciate your response, Baochen.
> > > >=20
> > > > I have been working on enabling mainline kernel support on my
> > > > TI
> > > > AM69-
> > > > SK board to test the mainline ath12k driver on my system.
> > > >=20
> > > > Using the mainline kernel repository for the ath drivers [1], I
> > > > made
> > > > the following observation:=C2=A0
> > > > While the exact crash observed earlier is no longer present,
> > > > the
> > > > system
> > > > hangs upon loading the ath12k mainline driver, displaying the
> > > > messages
> > > > below.
> > > >=20
> > > > root@am69-sk:~# modprobe ath12k debug_mask=3D0xffffffff
> > > > [ 1121.996554] ath12k_pci 0000:01:00.0: BAR 0 [mem
> > > > 0x4410200000-
> > > > 0x44103fffff 64bit]: assigned
> > > > [ 1122.004884] ath12k_pci 0000:01:00.0: enabling device (0000 -
> > > > >
> > > > 0002)
> > > > [ 1122.011818] ath12k_pci 0000:01:00.0: MSI vectors: 16
> > > > [ 1122.016798] ath12k_pci 0000:01:00.0: Hardware name: wcn7850
> > > > hw2.0
> > > > [ 1122.040183] NET: Registered PF_QIPCRTR protocol family
> > > >=20
> > > > root@am69-sk:~# uname -a
> > > > Linux am69-sk 6.13.0-rc7-wt-ath-ge7ef944b3e2c-dirty #2 SMP
> > > > PREEMPT
> > > > Wed
> > > > Jan 22 16:55:17 CET 2025 aarch64 GNU/Linux
> > > >=20
> > > > root@am69-sk:~# lspci
> > > > 0000:00:00.0 PCI bridge: Texas Instruments Device b012
> > > > 0000:01:00.0 Network controller: Qualcomm Technologies, Inc
> > > > WCN785x
> > > > Wi-
> > > > Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
> > > > 0001:00:00.0 PCI bridge: Texas Instruments Device b012
> > > > 0002:00:00.0 PCI bridge: Texas Instruments Device b012
> > > >=20
> > > > Do you have any insights into what might still be missing or
> > > > incorrect
> > > > in my setup?
> > > >=20
> > > > Regards,
> > > > Parth P
> > > >=20
> > > > On Wed, 2025-01-22 at 15:20 +0800, Baochen Qiang wrote:
> > > > >=20
> > > > >=20
> > > > > On 1/21/2025 10:19 PM, Parth Panchoil wrote:
> > > > > > Hi All,
> > > > > >=20
> > > > > > I am performing tests on the SX-PCEBE Wi-Fi module, which
> > > > > > utilizes
> > > > > > the
> > > > > > ATH12k driver, on the Texas Instruments AM69-SK board.
> > > > > > The board is running the TI Linux Kernel from the ti-linux-
> > > > > > 6.6.y
> > > > >=20
> > > > > 6.6 is too old, and besides we don;t support customer kernel.
> > > > >=20
> > > > > Could you try latest ath tree [1] or the mainline tree [2]?
> > > > >=20
> > > > > [1]
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
> > > > > [2]
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/
> > > > >=20
> > > > > If the issue is still seen, please enable verbose ath12k log
> > > > > using
> > > > > below command and help
> > > > > collect dmesg logs:
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sudo modprobe ath=
12k debug_mask=3D0xffffffff
> > > > >=20
> > > > > One more thing, the open-WRT patch is overkill, can you
> > > > > narrow down
> > > > > to find which line of
> > > > > code in ath12k_pci_enable_ltssm() is causing this issue?
> > > > >=20
> > > > >=20
> > > > > > branch. During testing, I observed a kernel crash from the
> > > > > > ATH12k
> > > > > > driver as soon as the probe is called. The crash log is as
> > > > > > follows:
> > > > > >=20
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492631] Kernel panic - not syncing: Async=
hronous
> > > > > > SError
> > > > > > Interrupt
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492634] CPU: 7 PID: 222 Comm: (udev-worke=
r) Not
> > > > > > tainted
> > > > > > 6.6.58-
> > > > > > 01497-ga7758da17c28-dirty #1
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492638] Hardware name: Texas Instruments =
AM69 SK
> > > > > > (DT)
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492640] Call trace:
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492642]=C2=A0 dump_backtrace+0x94/0xec
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492658]=C2=A0 show_stack+0x18/0x24
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492662]=C2=A0 dump_stack_lvl+0x48/0x60
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492669]=C2=A0 dump_stack+0x18/0x24
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492672]=C2=A0 panic+0x320/0x378
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492677]=C2=A0 nmi_panic+0x8c/0x90
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492681]=C2=A0 arm64_serror_panic+0x6c/0x7=
8
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492686]=C2=A0 do_serror+0x3c/0x78
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492692]=C2=A0 el1h_64_error_handler+0x34/=
0x4c
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492697]=C2=A0 el1h_64_error+0x64/0x68
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492700]=C2=A0 ath12k_pci_read32+0x1bc/0x1=
e8 [ath12k]
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492725]=C2=A0 ath12k_pci_power_up+0xdc/0x=
340 [ath12k]
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492747]=C2=A0 ath12k_core_init+0x2c/0xa8 =
[ath12k]
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492769]=C2=A0 ath12k_pci_probe+0x698/0x90=
8 [ath12k]
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492791]=C2=A0 pci_device_probe+0xa8/0x16c
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492800]=C2=A0 really_probe+0x110/0x27c
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492805]=C2=A0 __driver_probe_device+0x78/=
0x12c
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492808]=C2=A0 driver_probe_device+0x3c/0x=
118
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492810]=C2=A0 __driver_attach+0x74/0x124
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492813]=C2=A0 bus_for_each_dev+0x78/0xd8
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492819]=C2=A0 driver_attach+0x24/0x30
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492824]=C2=A0 bus_add_driver+0xe4/0x208
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492828]=C2=A0 driver_register+0x60/0x128
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492831]=C2=A0 __pci_register_driver+0x44/=
0x50
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492835]=C2=A0 ath12k_pci_init+0x2c/0x6c [=
ath12k]
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492858]=C2=A0 do_one_initcall+0x70/0x1b4
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492861]=C2=A0 do_init_module+0x58/0x1e4
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492867]=C2=A0 load_module+0x19bc/0x1a8c
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492869]=C2=A0 init_module_from_file+0x88/=
0xc4
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492873]=C2=A0 __arm64_sys_finit_module+0x=
1c0/0x2ac
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492877]=C2=A0 invoke_syscall+0x44/0x108
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492882]=C2=A0 el0_svc_common.constprop.0+=
0xc0/0xe0
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492885]=C2=A0 do_el0_svc+0x1c/0x28
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492889]=C2=A0 el0_svc+0x2c/0x84
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492892]=C2=A0 el0t_64_sync_handler+0xc0/0=
xc4
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492895]=C2=A0 el0t_64_sync+0x190/0x194
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492899] SMP: stopping secondary CPUs
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492908] Kernel Offset: disabled
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492909] CPU features: 0x0,80000200,280200=
00,1000420b
> > > > > > [=C2=A0=C2=A0=C2=A0 9.492913] Memory Limit: none
> > > > > >=20
> > > > > > Upon searching online, I found the OpenWRT patch that
> > > > > > appears to
> > > > > > address a similar issue: OpenWRT Patch: Prevent LTSSM
> > > > > > Startup
> > > > > > Crash.
> > > > > > https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dp=
ackage/kernel/mac80211/patches/ath12k/100-ath12k-prevent-ltssm-startup-cras=
h.patch;h=3Dcd85a0f6aa2652d62bfbea04e9bcca3bcf831b7f;hb=3D935b2b7dcef61b289=
3ed5dff307dd8f8a1156899
> > > > > > With the above patch applied, I do not see the crash
> > > > > > anymore.
> > > > > >=20
> > > > > > Could anyone confirm if this issue has been reported
> > > > > > before/known
> > > > > > bug
> > > > > > or provide any insights?=20
> > > > > > Any additional information or suggestions would be greatly
> > > > > > appreciated.
> > > > > >=20
> > > > > > Details about the test setup,
> > > > > > TI-AM69-SK board:
> > > > > > https://www.ti.com/tool/SK-AM69?keyMatch=3Dam69%20sk&tisearch=
=3Duniversal_search
> > > > > > Silex WiFi card SX-PCEBE:
> > > > > > https://www.silextechnology.com/connectivity-solutions/embedded=
-wireless/sx-pcebe
> > > > > > TI Linux Repo:
> > > > > > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=3Dti=
-linux-6.6.y
> > > > > >=20
> > > > > > Thank you.
> > > > > >=20
> > > > > > Regards,
> > > > > > Parth P
> > > > > >=20
> > > > >=20
> > > > >=20
> > > >=20
> > > >=20
> > >=20
> >=20
> >=20
>=20


