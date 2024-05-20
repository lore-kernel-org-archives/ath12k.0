Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BB6C04FFE
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSQ4HfK4tpueihQS7WfBKkz9MuxEaPC221F40Iuww2Y=; b=iT9vNV5Tf93oRSNzwnvoCnT3Pr
	EtESNXf5XEKXE5WuHLtxLvmGiM7pmlvu2xw5NqozH32yFvlJfmZWW3FPVV0yMKoQHyXymzpmUkpn9
	/TFxX6XAjLi+rh+yGbDZabM735gC8pekWoFQqOfFGDlCnVH07g9G6KrY6b1tuaWXMz6pd0pGZ5gwg
	dYkrOFtUKXvulpRIXE2aJ1wo3tuBhi25CsX2906j79ArccYzBS+ri6wREBSnqkV9hNhnBcLPUX+be
	5a33I9b+OTTX8ON9i9dUlJwmJKY/lIuE9kUUMBTpABcaneacOBM/EaL4CemsAyGl66oFa1oDA/+2E
	dGHq1SGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s96Lw-0000000F48x-2g2a
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 16:59:12 +0000
Received: from mail545c25.carrierzone.com ([64.29.147.145])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s96Ls-0000000F483-0Ni7
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 16:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1716224338;
	bh=dSQ4HfK4tpueihQS7WfBKkz9MuxEaPC221F40Iuww2Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:Reply-to:From;
	b=DCZxHna9FRhdpimUWEXDcnM9L6P1VrazvU2Lz20Y1ZvbFQwEEern5SaNc87U/ueit
	 y/QkrNf902U4biKhjLfWibicZFBb1hN3ysCrHrp8HIh7glbc2sohnVMXrHdEF13v8m
	 uqBRqmRn7evRVYQFwFIX+0wVFUDaJgklopZrS7tU=
Feedback-ID: pgupta@hindutoo
Received: from mail545c25.carrierzone.com (localhost [127.0.0.1])
	by mail545c25.carrierzone.com (8.14.9/8.13.1) with ESMTP id 44KGwwDq067277
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 May 2024 16:58:58 +0000
Received: (from webmail@localhost)
	by mail545c25.carrierzone.com (8.14.9/8.12.2/Submit) id 44KGwvsE067276;
	Mon, 20 May 2024 12:58:57 -0400
From: "pgupta@hindutool.com" <pgupta@hindutool.com>
To: kvalo@kernel.org, ath12k@lists.infradead.org
Subject: Re: board-2.bin
Date: Mon, 20 May 2024 12:58:57 -0400
Message-ID: <1716224337.zi1iti2l1c0cocko@mailapp03.register.com>
In-Reply-To: <1716221937.24ib38wrkkgo8sc4@mailapp03.register.com>
References: <1716180196.ixiafmuo0wckk0ws@mailapp03.register.com>
 <87seycerlh.fsf@kernel.org>
 <1716221937.24ib38wrkkgo8sc4@mailapp03.register.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Image-Url: https://mailapp03.register.com/api/storage/pgupta@hindutool.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 0
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdeitddgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffquffvqffrkfetpdfqfgfvpdfgpfggqdevvdehnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkjghfgggtgfhrsehtqhertddttdejnecuhfhrohhmpedfphhguhhpthgrsehhihhnughuthhoohhlrdgtohhmfdcuoehpghhuphhtrgeshhhinhguuhhtohholhdrtghomheqnecuggftrfgrthhtvghrnhepvdfhueelfeegtdegjefguefgudfhgfehffffgfetvedvhedvhefhfefhuedtvefhnecuffhomhgrihhnpegtohhmphgvgidrtghomhdrshhgpdgrughtrdhlihhnkhdplhgvvghmhhhuihhsrdhinhhfohdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddphhgvlhhopehmrghilhehgeehtgdvhedrtggrrhhrihgvrhiiohhnvgdrtghomhdpmhgrihhlfhhrohhmpehpghhuphhtrgeshhhinhguuhhtohholhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrthhhuddvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkvhgrlhhosehkvghrnhgvlhdrohhrgh
X-Origin-Country: Unknown
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_095908_450466_1992AD08 
X-CRM114-Status: GOOD (  34.61  )
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

Mr. Valo,
=20

Thank you for responding to my email.

I purchased a wifi 7 2.4Ghz, 5Ghz, and 6Ghz directly from compex:

https://shop.compex.com.sg/products


Pair of 6Ghz Wifi 7 (they are only sold as a pair)

https://shop.compex.com.sg/product-page/wlw7000e6


Pair of 2.4Ghz AND 5Ghz Wifi 7:

https://shop.compex.com.sg/product-page/wlw7000e5


These are M.2 E-Key and 4x4 MIMO antenna modules, I am building 2 routers u=
sing Dell R730xd machines. Because I have two 6GHz modules, one will go in =
each machine.=C2=A0 I have some old Compex wifi 5 modules that I will put i=
n one of the servers, while the other server will house NEW 2.4, 5, and 6 G=
hz Wifi 7 modules.

There is no M.2 E-Key connectors on these machines (as it is generic older =
generation hardware), so I am using an M.2 E-Key to PCIe riser cable from A=
DT link to convert the M.2 E-Key to PCIe:

https://www.adt.link/product/R15V4.html=C2=A0 (I will need three of these, =
one for each module)


This will allow connection of the wifi module to the PCIe bus.=C2=A0 I spec=
ifically chose this machine because it has 3 x16 PCIe 3.0, and 3 x8 Pcie 3=
=2E0

To maximize throughput, these modules need to be connected to a PCIe 3.0 bu=
s per Compex

Because these modules only need a x1 connection to the PCIe bus, all three =
x8 slots will be used for each of the 3 wifi modules.

You can purchase a premade board and wifi module bundle from Compex for aro=
und $1200, but used my own server hardware because I wanted to customize my=
 WAN and LAN interfaces, and use all three modules in ONE machine (no pre-m=
ade board can do this from what I have researched), so I only purchased the=
 modules only instead of a pre-made board and modules.

I have pictures of this evolving setup and there are specific reasons for c=
hoosing this machine.=C2=A0 Keep in mind these modules require an external =
5V power supply which will be supplied by 5V SATA power connectors - I am s=
till trying to figure this out, but these WiFi 7 modules do come with power=
 connectors soldered onto the board unlike the previous generation where yo=
u had to solder on power contacts yourself.

If you are interested, I can take pictures for you so that you can see firs=
t hand how the setup looks.=C2=A0 I can guarantee the cables work since I a=
m able to detect the wireless modules via lspci and lshw commands as it suc=
cessfully connects to.. and is powered by... the PCIe bus.=C2=A0 I just can=
not get the firmware (board-2.bin) to load.

Interestingly, I had brief success with the firmware loading on Ubuntu 23=
=2E10, during some trials, but it was one time and I have been unable to re=
create this.=C2=A0 I'm not sure what I did to get it to work.

One final note, this router is using a server platform as it will house 3 w=
ifi modules (2.4/5/6 wifi 7), a 2x 100GBe ethernet LAN, 4x 10GB LAN (for a =
separate subnet), 2x 10GB WAN inputs, and 100GB Inifinband connectivity to =
an Inifiniband switch.=C2=A0 It will also house VMs for reverse proxy and V=
PN so it had 2x Xeon E5-26790 V4 and 128GB DDR4 ECC RAM.=C2=A0 This unit is=
 completely modular and any part can be upgraded at any time. This is why I=
 went with this setup.=C2=A0 All of this is contained in one machine, no se=
parate access point - the wifi is built into the router just like a residen=
tial router.=C2=A0 The antennas will be connected directly to the server vi=
a u.fl to SMA connectors for each card (each card having 4 antennas for a t=
otal of 12 antennas connected to the machine).



A few more points, the .zst files appear to be some sort of new compression=
 technology that the stock Ubuntu 24.04 ships with.=C2=A0 The files are in =
this format by default in the WCN directory under /lib/firmware/ath12k.=C2=
=A0 There are NO .bin files.

Also Interestingly, the ath12k driver is also in this format "ath12k.ko.zst=
" in the modules section and decompressing it to the .ko extension seems to=
 disable the driver.=C2=A0This is confirmed using "modinfo ath12k"

Again, sorry for the long winded description.=C2=A0 I work as an Emergency =
room physician by trade, so I am not always near my machines and can only w=
ork on this project in my free time.=C2=A0 This wireless module is the last=
 hurdle.

All of this is very confusing compared to the ath10k which seemed so much m=
ore straightforward.

All the best, and thank you so much for your reply.=C2=A0 I can forward the=
 contacts from compex that I spoke with if you so desire.

I wanted to respond to your email as I am grateful you have taken time out =
of your schedule to reply to my message. I do have some questions regarding=
 the specifics of rebuilding the kernel, but will address that in=C2=A0 a s=
eparate email so that noobs like me won't have to go through this.=C2=A0

I have been following your github every since ath10k a few years back, and =
your firmware was instrumental in helping me get my home wired/wifi router =
project off the ground.=C2=A0 My current wifi router is actually a desktop =
using mini-pcie wifi modules attached directly to the desktop PCIe bus.

Prashant Gupta MD/MPH


On Mon, 20 May 2024 12:54:18 +0300, Kalle Valo <kvalo@kernel.org> wrote:

>> "pgupta@hindutool.com" writes:
>>
>> > I have been reading through the various posts, and while I found
>> > someone who reported the exact same problem, I was unable to find a
>> > response from anyone who could present a solution
>> >
>> > I have a Compex WLW7000E6
>>
>> Any recommendations from where it would be easiest to order such board?
>> I'm based in Europe and would like to get one.
>>
>> Is the board otherwise plug&play to an M.2 E-key slot or does it need
>> something special?
>>
>> > and am using the latest kernel version 6.8.0-31-generic (ubuntu 24.04
>> > LTS)
>>
>> BTW in general we don't support distro kernels:
>>
>> https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-=
kernel-bug-reports-are-ignored/#your-kernel-was-apparently-built-by-a-linux=
-distributor-or-hardware-vendor

>>
>> > Despite having the requisite files in /lib/firmware/ath12k/QCN9274/hw2=
=2E0:
>> >
>> > -rw-r--r-- 1 root root 8241152 May 19 23:47 amss.bin
>> > -rw-r--r-- 1 root root 2821564 May 20 00:03 amss.bin.zst
>> > -rw-r--r-- 1 root root 382856 May 20 00:03 board-2.bin
>> > -rw-r--r-- 1 root root =C2=A0 21517 May 20 00:03 board-2.bin.zst
>> > -rw-r--r-- 1 root root=C2=A0 421888 May 19 23:47 m3.bin
>> > -rw-r--r-- 1 root root=C2=A0 139662 May 20 00:03 m3.bin.zst
>> > -rw-r--r-- 1 root root=C2=A0=C2=A0 10699 May 20 00:03 Notice.txt.zst
>> > -rw-r--r-- 1 root root=C2=A0=C2=A0 24310 May 19 23:47 regdb.bin
>> > -rw-r--r-- 1 root root=C2=A0=C2=A0=C2=A0 3187 May 19 23:47 regdb.bin=
=2Ezst
>> >
>> > I continue to receive the following errors:
>> >
>> > [=C2=A0=C2=A0=C2=A0 5.885930] ath12k_pci 0000:83:00.0: BAR 0 [mem
>> > 0xc8000000-0xc81fffff 64bit]: assigned
>> > [=C2=A0=C2=A0=C2=A0 5.886287] ath12k_pci 0000:83:00.0: MSI vectors: 16
>> > [=C2=A0=C2=A0=C2=A0 5.886294] ath12k_pci 0000:83:00.0: Hardware name: =
qcn9274 hw2.0
>> > [=C2=A0=C2=A0=C2=A0 6.745247] ath12k_pci 0000:83:00.0: memory type 10 =
not supported
>> > [=C2=A0=C2=A0=C2=A0 6.750101] ath12k_pci 0000:83:00.0: chip_id 0x0 chi=
p_family 0xb
>> > board_id 0xff soc_id 0x401a2200
>> > [=C2=A0=C2=A0=C2=A0 6.750110] ath12k_pci 0000:83:00.0: fw_version 0x10=
098b57
>> > fw_build_timestamp 2022-09-19 18:18 fw_build_id
>> > QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
>> > [=C2=A0=C2=A0=C2=A0 6.761065] ath12k_pci 0000:83:00.0: failed to fetch=
 board data for
>> > bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255 from
>> > ath12k/QCN9274/hw2.0/board-2.bin
>> > [=C2=A0=C2=A0=C2=A0 6.761212] ath12k_pci 0000:83:00.0: failed to fetch=
 board-2.bin or
>> > board.bin from QCN9274/hw2.0
>> > [=C2=A0=C2=A0=C2=A0 6.761247] ath12k_pci 0000:83:00.0: qmi failed to l=
oad bdf:
>> > [=C2=A0=C2=A0=C2=A0 6.761250] ath12k_pci 0000:83:00.0: qmi failed to l=
oad board data file:-2
>>
>> This means that board-2.bin is missing the board file for your device.
>> For AP devices like QCN9274 board files handling is difficult, usually
>> Device Tree is the only way to get automatic board file loading working=
=2E
>>
>> Did you get any software with your the board? Do you know if the board
>> is calibrated or not?
>>
>> Can you run:
>>
>> find /lib/firmware/ath12k/ -type f | xargs md5sum
>>
>> Also read:
>>
>> https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugreport

>>
>> > but he zst files were copied over from the WCN7850 directory.
>>
>> I do not know what these zst files are. And don't copy anything from
>> WCN7850 directory, the files are not compatible. The best is to run
>> 'make install' within ath12k-firmware.git repository, manually fixing
>> files will end up into problems.
>>
>> --
>> https://patchwork.kernel.org/project/linux-wireless/list/

>>
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingp=
atches

