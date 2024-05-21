Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47BEC25B75
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e43fKFWWykcQoN0kfiWxUBlSPYrnotaG5FgX9M2HnK4=; b=otUF/UwwXlJqNFI83tkP1Ayt0V
	FlHkufi1C6WN5HsN7Iq3i2RGqr7c1McCRgTMubkubJRRzLvtGC+Rcpd8e5wNxVrSlTXwEXCGEL+c4
	R5Gf8kk35dcWzHKWmdrdwRJ1zMKnSbRa7mKpfjJra29bGnAbpESiWwkf+XnQgQeLY1P9LKiH/oyx5
	Gwm8pVMfmTRGPtPYHWGLNHHwFatDazXjLo4yUDpzzrOoqEdKCiF8Zw5OuZUcVgEgW2+h0c5nbCcOU
	6H1ztsG6YfrJ3SRaUeSdT3qYMEpMGU0e2MGN7LdAJ+mzS6VmIIUygbKfaMjkrhSHvkCt4L3UIhKaT
	MtGUFiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JyQ-0000000Gc4k-1sUw
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 07:31:50 +0000
Received: from mail545c25.carrierzone.com ([64.29.147.145])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JyM-0000000Gc2b-3Tnr
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 07:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1716276698;
	bh=OUxMI0yCdRbARRzl4IBp85Zo/TM5Y64LHdgTsnY9a2Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:Reply-to:From;
	b=lZBkFBlgYFo/BNJcW0rSP6B4iJod40LtIqgB40ezxsc1luciLRfH9nCdm6rvgbeZO
	 +tDTyb0dQwFn/AKTdNIyX7BLnuYLILLXzC6EJAFW5EKv9OUm6VDxP1hz2GgVqVKQ62
	 5QGqDB7X4i2ryDA14E8s1jbOeijQK+tc4WHkz3LY=
Feedback-ID: pgupta@hindutoo
Received: from mail545c25.carrierzone.com (localhost [127.0.0.1])
	by mail545c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 44L7VbR7102033
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <ath12k@lists.infradead.org>; Tue, 21 May 2024 07:31:37 +0000
Received: (from webmail@localhost)
	by mail545c25.carrierzone.com (8.14.9/8.12.2/Submit) id 44L7VbGt101970
	for ath12k@lists.infradead.org; Tue, 21 May 2024 03:31:37 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: ath12k@lists.infradead.org
CC: 
Subject: RE: board-2.bin
Date: Tue, 21 May 2024 03:31:37 -0400
Message-ID: <1716276697.fqsmqowkhwocwgg0@mailapp03.register.com>
In-Reply-To: <LO0P123MB40579A82B572982CDCFD8372D6EA2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <1716180196.ixiafmuo0wckk0ws@mailapp03.register.com>
 <87seycerlh.fsf@kernel.org>
 <1716221937.24ib38wrkkgo8sc4@mailapp03.register.com>
 <1716224337.zi1iti2l1c0cocko@mailapp03.register.com>
 <LO0P123MB40578D0BBD3B6EDDFED084ABD6E92@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <1716242767.t9j0j77jn6sgs4ws@mailapp03.register.com>
 <LO0P123MB405723C63196B6A2D87EAEB0D6EA2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <d3aeb02f-4a1e-1388-8206-066e5d352e92@candelatech.com>
 <LO0P123MB40579A82B572982CDCFD8372D6EA2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdeiuddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffuvffqrffktedpqfgfvfdpgffpggdqvedvheenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkfgjfhggtgfgrhesthhqredttddtjeenucfhrhhomhepfdhpghhuphhtrgeshhhinhguuhhtohholhdrtghomhdfuceophhguhhpthgrsehhihhnughuthhoohhlrdgtohhmqeenucggtffrrghtthgvrhhnpefhheehjefgjeekvdeugfetkeeihfdtjedufeffueefvdeggefhvddtffevueduhfenucffohhmrghinheptghouggvlhhinhgrrhhordhorhhgpdhgihhthhhusgdrtghomhdptghoughitghordgtohhmnecukfhppeduvdejrddtrddtrddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddphhgvlhhopehmrghilhehgeehtgdvhedrtggrrhhrihgvrhiiohhnvgdrtghomhdpmhgrihhlfhhrohhmpehpghhuphhtrgeshhhinhguuhhtohholhdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrthhhuddvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_003147_211757_71EFB748 
X-CRM114-Status: GOOD (  56.63  )
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

I have reached out to Compex support about board configuration file, once I=
 hear from them I will update everyone with their response.  I am curious t=
hat if such a file exists, why they would not have brought it to my attenti=
on.

One more thing, I think when I was able to get the card recognized by ifcon=
fig, I had all the wireless tools installed, and I think nl80211 may also h=
ave been on the system.=C2=A0

Lastly I have a question.=C2=A0 Which repository should we use?

https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/tree/main?ref=
_type=3Dheads

OR

https://github.com/quic/upstream-wifi-fw/tree/main/ath12k-firmware

and what is the "qdss_trace_config.bin" file located in the upstream-wifi-f=
w repository?

Prashant



On Tue, 21 May 2024 07:09:48 +0000, david Atkins <david@3adesign.co.uk> wro=
te:

>> I have the board files from my supplier, it helped but did not make it w=
ork....
>>
>> > -----Original Message-----
>> > From: Ben Greear
>> > Sent: Tuesday, May 21, 2024 8:03 AM
>> > To: david Atkins ; pgupta@hindutool.com;
>> > ath12k@lists.infradead.org
>> > Subject: Re: board-2.bin
>> >
>> > On 5/20/24 23:20, david Atkins wrote:
>> > > I do not have them working yet, they show up on latest build but do =
not
>> > work, I need to do another update as I have seen many changes go throu=
gh.
>> > >
>> > > David
>> >
>> > Most likely, you need to get the board file(s) from Compex and then ge=
t it
>> > added to the board-2.bin file.
>> > In my opinion, this is something that the ath12k folks should be takin=
g care of.
>> >
>> > Thanks,
>> > Ben
>> >
>> > >
>> > >
>> > >> -----Original Message-----
>> > >> From: pgupta@hindutool.com
>> > >> Sent: Monday, May 20, 2024 11:06 PM
>> > >> To: david Atkins ; ath12k@lists.infradead.org
>> > >> Subject: RE: board-2.bin
>> > >>
>> > >> David,
>> > >> My three Compex wifi 7 modules are all Waikiki based. Were you
>> > >> able to get the ath12k driver and firmware to work with them?=C2=A0=
 If so how?
>> > >> Are you using a custom kernel and custom board?
>> > >>
>> > >>
>> > >> Prashant
>> > >>
>> > >>
>> > >>
>> > >> On Mon, 20 May 2024 18:53:49 +0000, david Atkins
>> > >>
>> > >> wrote:
>> > >>
>> > >>>> Hi,
>> > >>>>
>> > >>>> We have sourced modules from Qualcomm direct "Hamilton" cards
>> > >>>>
>> > >>>> I also have 2x2 Hamilton equivalents and Waikiki from Codico, the=
se
>> > >>>> are 8devcies or compex modules
>> > >>>>
>> > >>>> They sell sample quantities easily online
>> > >>>>
>> > >>>>
>> > >>
>> > https://www.codico.com/en/manufacturers/8devices?pim_brand=3D8devices#=
s
>> > >>>> amples
>> > >>>>
>> > >>>> I have 3 setups running, 2 AMD (1 Hamilton 1 WKK) and Intel with
>> > >>>> Hamilton
>> > >>>>
>> > >>>> We are comparing with Intel BE200 as another option
>> > >>>>
>> > >>>> David
>> > >>>>
>> > >>>>> -----Original Message-----
>> > >>>>> From: ath12k On Behalf Of
>> > >>>>> pgupta@hindutool.com
>> > >>>>> Sent: Monday, May 20, 2024 5:59 PM
>> > >>>>> To: kvalo@kernel.org; ath12k@lists.infradead.org
>> > >>>>> Subject: Re: board-2.bin
>> > >>>>>
>> > >>>>> Mr. Valo,
>> > >>>>>
>> > >>>>>
>> > >>>>> Thank you for responding to my email.
>> > >>>>>
>> > >>>>> I purchased a wifi 7 2.4Ghz, 5Ghz, and 6Ghz directly from compex=
:
>> > >>>>>
>> > >>>>> https://shop.compex.com.sg/products
>> > >>>>>
>> > >>>>>
>> > >>>>> Pair of 6Ghz Wifi 7 (they are only sold as a pair)
>> > >>>>>
>> > >>>>> https://shop.compex.com.sg/product-page/wlw7000e6
>> > >>>>>
>> > >>>>>
>> > >>>>> Pair of 2.4Ghz AND 5Ghz Wifi 7:
>> > >>>>>
>> > >>>>> https://shop.compex.com.sg/product-page/wlw7000e5
>> > >>>>>
>> > >>>>>
>> > >>>>> These are M.2 E-Key and 4x4 MIMO antenna modules, I am building =
2
>> > >>>>> routers using Dell R730xd machines. Because I have two 6GHz
>> > >>>>> modules, one will go in each machine. I have some old Compex wif=
i
>> > >>>>> 5 modules that I will put in one of the servers, while the other
>> > >>>>> server will house NEW 2.4, 5, and 6 Ghz Wifi 7 modules.
>> > >>>>>
>> > >>>>> There is no M.2 E-Key connectors on these machines (as it is
>> > >>>>> generic older generation hardware), so I am using an M.2 E-Key t=
o
>> > >>>>> PCIe riser cable from ADT link to convert the M.2 E-Key to PCIe:
>> > >>>>>
>> > >>>>> https://www.adt.link/product/R15V4.html=C2=A0 (I will need three=
 of
>> > >>>>> these, one for each module)
>> > >>>>>
>> > >>>>>
>> > >>>>> This will allow connection of the wifi module to the PCIe bus.=
=C2=A0 I
>> > >>>>> specifically chose this machine because it has 3 x16 PCIe 3.0, a=
nd
>> > >>>>> 3 x8 Pcie 3.0
>> > >>>>>
>> > >>>>> To maximize throughput, these modules need to be connected to a
>> > >>>>> PCIe 3.0 bus per Compex
>> > >>>>>
>> > >>>>> Because these modules only need a x1 connection to the PCIe bus,
>> > >>>>> all three
>> > >>>>> x8 slots will be used for each of the 3 wifi modules.
>> > >>>>>
>> > >>>>> You can purchase a premade board and wifi module bundle from
>> > >> Compex
>> > >>>>> for around $1200, but used my own server hardware because I want=
ed
>> > >>>>> to customize my WAN and LAN interfaces, and use all three module=
s
>> > >>>>> in ONE machine (no pre-made board can do this from what I have
>> > >>>>> researched), so I only purchased the modules only instead of a
>> > >>>>> pre-made
>> > >> board and modules.
>> > >>>>>
>> > >>>>> I have pictures of this evolving setup and there are specific
>> > >>>>> reasons for choosing this machine.=C2=A0 Keep in mind these modu=
les
>> > >>>>> require an external 5V power supply which will be supplied by 5V
>> > >>>>> SATA power connectors - I am still trying to figure this out, bu=
t
>> > >>>>> these WiFi 7 modules do come with power connectors soldered onto
>> > >>>>> the board unlike the previous generation where you had to solder
>> > >>>>> on
>> > >> power contacts yourself.
>> > >>>>>
>> > >>>>> If you are interested, I can take pictures for you so that you c=
an
>> > >>>>> see first hand how the setup looks.=C2=A0 I can guarantee the ca=
bles
>> > >>>>> work since I am able to detect the wireless modules via lspci an=
d
>> > >>>>> lshw commands as it successfully connects to.. and is powered by=
=2E..
>> > >>>>> the PCIe bus.=C2=A0 I just cannot get the firmware
>> > >>>>> (board-2.bin) to load.
>> > >>>>>
>> > >>>>> Interestingly, I had brief success with the firmware loading on
>> > >>>>> Ubuntu 23.10, during some trials, but it was one time and I have
>> > >>>>> been unable to recreate this.=C2=A0 I'm not sure what I did to g=
et it to work.
>> > >>>>>
>> > >>>>> One final note, this router is using a server platform as it wil=
l
>> > >>>>> house 3 wifi modules (2.4/5/6 wifi 7), a 2x 100GBe ethernet LAN,
>> > >>>>> 4x 10GB LAN (for a separate subnet), 2x 10GB WAN inputs, and 100=
GB
>> > >>>>> Inifinband connectivity to an Inifiniband switch.=C2=A0 It will =
also
>> > >>>>> house VMs for reverse proxy and VPN so it had 2x Xeon E5-26790 V=
4
>> > >>>>> and 128GB DDR4 ECC RAM.=C2=A0 This unit is completely modular an=
d any
>> > >>>>> part can be upgraded at any time. This is why I went with this
>> > >>>>> setup.=C2=A0 All of this is contained in one machine, no separat=
e
>> > >>>>> access point - the wifi is built into the router just like a
>> > >>>>> residential router.=C2=A0 The antennas will be connected directl=
y to
>> > >>>>> the server via u.fl to SMA connectors for each card (each card
>> > >>>>> having 4 antennas for a
>> > >> total of 12 antennas connected to the machine).
>> > >>>>>
>> > >>>>>
>> > >>>>>
>> > >>>>> A few more points, the .zst files appear to be some sort of new
>> > >>>>> compression technology that the stock Ubuntu 24.04 ships with.
>> > >>>>> The files are in this format by default in the WCN directory und=
er
>> > >>>>> /lib/firmware/ath12k.=C2=A0 There are NO .bin files.
>> > >>>>>
>> > >>>>> Also Interestingly, the ath12k driver is also in this format
>> > >>>>> "ath12k.ko.zst" in the modules section and decompressing it to t=
he
>> > >>>>> .ko extension seems to disable the driver.=C2=A0This is confirme=
d using
>> > >> "modinfo ath12k"
>> > >>>>>
>> > >>>>> Again, sorry for the long winded description.=C2=A0 I work as an
>> > >>>>> Emergency room physician by trade, so I am not always near my
>> > >>>>> machines and can only work on this project in my free time.=C2=
=A0 This
>> > >> wireless module is the last hurdle.
>> > >>>>>
>> > >>>>> All of this is very confusing compared to the ath10k which seeme=
d
>> > >>>>> so much more straightforward.
>> > >>>>>
>> > >>>>> All the best, and thank you so much for your reply.=C2=A0 I can =
forward
>> > >>>>> the contacts from compex that I spoke with if you so desire.
>> > >>>>>
>> > >>>>> I wanted to respond to your email as I am grateful you have take=
n
>> > >>>>> time out of your schedule to reply to my message. I do have some
>> > >>>>> questions regarding the specifics of rebuilding the kernel, but
>> > >>>>> will address that in=C2=A0 a separate email so that noobs like m=
e won't
>> > >>>>> have to
>> > >> go through this.
>> > >>>>>
>> > >>>>> I have been following your github every since ath10k a few years
>> > >>>>> back, and your firmware was instrumental in helping me get my ho=
me
>> > >>>>> wired/wifi router project off the ground.=C2=A0 My current wifi =
router
>> > >>>>> is actually a desktop using mini-pcie wifi modules attached
>> > >>>>> directly to the
>> > >> desktop PCIe bus.
>> > >>>>>
>> > >>>>> Prashant Gupta MD/MPH
>> > >>>>>
>> > >>>>>
>> > >>>>> On Mon, 20 May 2024 12:54:18 +0300, Kalle Valo wrote:
>> > >>>>>
>> > >>>>>>> "pgupta@hindutool.com" writes:
>> > >>>>>>>
>> > >>>>>>>> I have been reading through the various posts, and while I
>> > >>>>>>>> found someone who reported the exact same problem, I was
>> > unable
>> > >>>>>>>> to find a response from anyone who could present a solution
>> > >>>>>>>>
>> > >>>>>>>> I have a Compex WLW7000E6
>> > >>>>>>>
>> > >>>>>>> Any recommendations from where it would be easiest to order su=
ch
>> > >>>>> board?
>> > >>>>>>> I'm based in Europe and would like to get one.
>> > >>>>>>>
>> > >>>>>>> Is the board otherwise plug&play to an M.2 E-key slot or does =
it
>> > >>>>>>> need something special?
>> > >>>>>>>
>> > >>>>>>>> and am using the latest kernel version 6.8.0-31-generic (ubun=
tu
>> > >>>>>>>> 24.04
>> > >>>>>>>> LTS)
>> > >>>>>>>
>> > >>>>>>> BTW in general we don't support distro kernels:
>> > >>>>>>>
>> > >>>>>>> https://linux-regtracking.leemhuis.info/post/frequent-reasons-=
wh
>> > >>>>>>> y-lin
>> > >>>>>>> ux-kernel-bug-reports-are-ignored/#your-kernel-was-apparently-=
bu
>> > >>>>>>> ilt-b y-a-linux-distributor-or-hardware-vendor
>> > >>>>>
>> > >>>>>>>
>> > >>>>>>>> Despite having the requisite files in
>> > >>>>> /lib/firmware/ath12k/QCN9274/hw2.0:
>> > >>>>>>>>
>> > >>>>>>>> -rw-r--r-- 1 root root 8241152 May 19 23:47 amss.bin
>> > >>>>>>>> -rw-r--r-- 1 root root 2821564 May 20 00:03 amss.bin.zst
>> > >>>>>>>> -rw-r--r-- 1 root root 382856 May 20 00:03 board-2.bin
>> > >>>>>>>> -rw-r--r-- 1 root root =C2=A0 21517 May 20 00:03 board-2.bin=
=2Ezst
>> > >>>>>>>> -rw-r--r-- 1 root root=C2=A0 421888 May 19 23:47 m3.bin
>> > >>>>>>>> -rw-r--r-- 1 root root=C2=A0 139662 May 20 00:03 m3.bin.zst
>> > >>>>>>>> -rw-r--r-- 1 root root=C2=A0=C2=A0 10699 May 20 00:03 Notice=
=2Etxt.zst
>> > >>>>>>>> -rw-r--r-- 1 root root=C2=A0=C2=A0 24310 May 19 23:47 regdb=
=2Ebin
>> > >>>>>>>> -rw-r--r-- 1 root root=C2=A0=C2=A0=C2=A0 3187 May 19 23:47 re=
gdb.bin.zst
>> > >>>>>>>>
>> > >>>>>>>> I continue to receive the following errors:
>> > >>>>>>>>
>> > >>>>>>>> [=C2=A0=C2=A0=C2=A0 5.885930] ath12k_pci 0000:83:00.0: BAR 0 =
[mem
>> > >>>>>>>> 0xc8000000-0xc81fffff 64bit]: assigned [=C2=A0=C2=A0=C2=A0 5=
=2E886287]
>> > >>>>>>>> ath12k_pci
>> > >>>>>>>> 0000:83:00.0: MSI vectors: 16 [=C2=A0=C2=A0=C2=A0 5.886294] a=
th12k_pci
>> > >>>>>>>> 0000:83:00.0: Hardware name: qcn9274 hw2.0 [=C2=A0=C2=A0=C2=
=A0 6.745247]
>> > >>>>>>>> ath12k_pci 0000:83:00.0: memory type 10 not supported [
>> > >>>>>>>> 6.750101] ath12k_pci 0000:83:00.0: chip_id 0x0 chip_family 0x=
b
>> > >>>>>>>> board_id 0xff soc_id 0x401a2200 [=C2=A0=C2=A0=C2=A0 6.750110]=
 ath12k_pci
>> > >>>>>>>> 0000:83:00.0: fw_version 0x10098b57 fw_build_timestamp
>> > >>>>>>>> 2022-09-19
>> > >>>>>>>> 18:18 fw_build_id
>> > >>>>>>>> QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.0-02903-
>> > >>>>> QCAHKSWPL_SILICONZ-1
>> > >>>>>>>> [=C2=A0=C2=A0=C2=A0 6.761065] ath12k_pci 0000:83:00.0: failed=
 to fetch board
>> > >>>>>>>> data for
>> > >>>>>>>> bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255 from
>> > >>>>>>>> ath12k/QCN9274/hw2.0/board-2.bin [=C2=A0=C2=A0=C2=A0 6.761212=
] ath12k_pci
>> > >>>>>>>> 0000:83:00.0: failed to fetch board-2.bin or board.bin from
>> > >>>>>>>> QCN9274/hw2.0 [=C2=A0=C2=A0=C2=A0 6.761247] ath12k_pci 0000:8=
3:00.0: qmi
>> > >>>>>>>> failed to load bdf:
>> > >>>>>>>> [=C2=A0=C2=A0=C2=A0 6.761250] ath12k_pci 0000:83:00.0: qmi fa=
iled to load
>> > >>>>>>>> board data file:-2
>> > >>>>>>>
>> > >>>>>>> This means that board-2.bin is missing the board file for your=
 device.
>> > >>>>>>> For AP devices like QCN9274 board files handling is difficult,
>> > >>>>>>> usually Device Tree is the only way to get automatic board fil=
e
>> > >>>>>>> loading
>> > >>>>> working.
>> > >>>>>>>
>> > >>>>>>> Did you get any software with your the board? Do you know if t=
he
>> > >>>>>>> board is calibrated or not?
>> > >>>>>>>
>> > >>>>>>> Can you run:
>> > >>>>>>>
>> > >>>>>>> find /lib/firmware/ath12k/ -type f | xargs md5sum
>> > >>>>>>>
>> > >>>>>>> Also read:
>> > >>>>>>>
>> > >>>>>>> https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugre=
po
>> > >>>>>>> rt
>> > >>>>>
>> > >>>>>>>
>> > >>>>>>>> but he zst files were copied over from the WCN7850 directory=
=2E
>> > >>>>>>>
>> > >>>>>>> I do not know what these zst files are. And don't copy anythin=
g
>> > >>>>>>> from
>> > >>>>>>> WCN7850 directory, the files are not compatible. The best is t=
o
>> > >>>>>>> run 'make install' within ath12k-firmware.git repository,
>> > >>>>>>> manually fixing files will end up into problems.
>> > >>>>>>>
>> > >>>>>>> --
>> > >>>>>>> https://patchwork.kernel.org/project/linux-wireless/list/
>> > >>>>>
>> > >>>>>>>
>> > >>>>>>> https://wireless.wiki.kernel.org/en/developers/documentation/s=
ub
>> > >>>>>>> mitti
>> > >>>>>>> ngpatches
>> >
>> >
>> > --
>> > Ben Greear
>> > Candela Technologies Inc http://www.candelatech.com

