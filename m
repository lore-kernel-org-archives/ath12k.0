Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E19C25B74
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 07:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEP8b/hsY84wxpiBveAujQyFc12u2rwP9ojweMqUTgo=; b=4bbAAJLk999njbAys8Jdy6ZiDv
	25EmpnJHfSTfuYX2zZjlu1J6kepncYRVGxc3QEgA0WrjzxSfVqXwGzAnCfLO6fDP6xvFGVB4bfU5L
	wFyAKMI2kHdeY5scSoogJZdfQwYqJ0WKehrGg1KaziXVj8Z7f3CvV+7CCXh5TLfPCUUPBRYE/4pF8
	nE4BffekZ6sYdcSd8iQce+xUAbxzrWOdkEhERAl4FBBaX3x1cSJi9CgvkM2Z3/ujlHPMhsJ8eshN5
	iGrg8UfFB88/U3g8yH/OvYy1LeyafPHA/ZI9749WzBH3gaJM4GfYiXWTTpj5vzw69QKlC7BBUJzy9
	vRVXCnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JWU-0000000GXbK-0gc2
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 07:02:58 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JWR-0000000GXaV-0DqE
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 07:02:57 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 7760FC4006A;
	Tue, 21 May 2024 07:02:51 +0000 (UTC)
Received: from [10.103.16.75] (unknown [79.137.104.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id C255913C2B0;
	Tue, 21 May 2024 00:02:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com C255913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1716274970;
	bh=YdnXSZJBHsL6fKrsYu0YcJfZRAYreoLlcX1NwLCnyHY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=N2P0u3eJymih/gVVVq0mH5ENV4ZjHwYq91AMbF83bIOzj1GxdiQwZCOkl/tusmtA7
	 lr5PidytBm0mmOTpWkcDRsI0KmFDntg9VTOUN0+775o2tXWYZP8qAgwLgjUqMiIJGs
	 VgE+CqEhgvJ7pAOK4souCE7R1JqF0RNHgQ5nbljc=
Message-ID: <d3aeb02f-4a1e-1388-8206-066e5d352e92@candelatech.com>
Date: Tue, 21 May 2024 00:02:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: board-2.bin
Content-Language: en-MW
To: david Atkins <david@3adesign.co.uk>,
 "pgupta@hindutool.com" <pgupta@hindutool.com>,
 "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <1716180196.ixiafmuo0wckk0ws@mailapp03.register.com>
 <87seycerlh.fsf@kernel.org>
 <1716221937.24ib38wrkkgo8sc4@mailapp03.register.com>
 <1716224337.zi1iti2l1c0cocko@mailapp03.register.com>
 <LO0P123MB40578D0BBD3B6EDDFED084ABD6E92@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <1716242767.t9j0j77jn6sgs4ws@mailapp03.register.com>
 <LO0P123MB405723C63196B6A2D87EAEB0D6EA2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <LO0P123MB405723C63196B6A2D87EAEB0D6EA2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1716274972-1QCc45FIYlAR
X-MDID-O: us5;ut7;1716274972;1QCc45FIYlAR;<greearb@candelatech.com>;5b4c28a914c450e6b13bba89088ac864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_000255_168919_74C4A529 
X-CRM114-Status: GOOD (  39.34  )
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

On 5/20/24 23:20, david Atkins wrote:
> I do not have them working yet, they show up on latest build but do not work, I need to do another update as I have seen many changes go through.
> 
> David

Most likely, you need to get the board file(s) from Compex and then get it added to the board-2.bin file.
In my opinion, this is something that the ath12k folks should be taking care of.

Thanks,
Ben

> 
> 
>> -----Original Message-----
>> From: pgupta@hindutool.com <pgupta@hindutool.com>
>> Sent: Monday, May 20, 2024 11:06 PM
>> To: david Atkins <david@3adesign.co.uk>; ath12k@lists.infradead.org
>> Subject: RE: board-2.bin
>>
>> David,
>>    My three Compex wifi 7 modules are all Waikiki based.  Were you able to get
>> the ath12k driver and firmware to work with them?  If so how?
>> Are you using a custom kernel and custom board?
>>
>>
>> Prashant
>>
>>
>>
>> On Mon, 20 May 2024 18:53:49 +0000, david Atkins <david@3adesign.co.uk>
>> wrote:
>>
>>>> Hi,
>>>>
>>>> We have sourced modules from Qualcomm direct "Hamilton" cards
>>>>
>>>> I also have 2x2 Hamilton equivalents and Waikiki from Codico, these
>>>> are 8devcies or compex modules
>>>>
>>>> They sell sample quantities easily online
>>>>
>>>>
>> https://www.codico.com/en/manufacturers/8devices?pim_brand=8devices#s
>>>> amples
>>>>
>>>> I have 3 setups running, 2 AMD (1 Hamilton 1 WKK) and Intel with
>>>> Hamilton
>>>>
>>>> We are comparing with Intel BE200 as another option
>>>>
>>>> David
>>>>
>>>>> -----Original Message-----
>>>>> From: ath12k On Behalf Of
>>>>> pgupta@hindutool.com
>>>>> Sent: Monday, May 20, 2024 5:59 PM
>>>>> To: kvalo@kernel.org; ath12k@lists.infradead.org
>>>>> Subject: Re: board-2.bin
>>>>>
>>>>> Mr. Valo,
>>>>>
>>>>>
>>>>> Thank you for responding to my email.
>>>>>
>>>>> I purchased a wifi 7 2.4Ghz, 5Ghz, and 6Ghz directly from compex:
>>>>>
>>>>> https://shop.compex.com.sg/products
>>>>>
>>>>>
>>>>> Pair of 6Ghz Wifi 7 (they are only sold as a pair)
>>>>>
>>>>> https://shop.compex.com.sg/product-page/wlw7000e6
>>>>>
>>>>>
>>>>> Pair of 2.4Ghz AND 5Ghz Wifi 7:
>>>>>
>>>>> https://shop.compex.com.sg/product-page/wlw7000e5
>>>>>
>>>>>
>>>>> These are M.2 E-Key and 4x4 MIMO antenna modules, I am building 2
>>>>> routers using Dell R730xd machines. Because I have two 6GHz
>>>>> modules, one will go in each machine. I have some old Compex wifi 5
>>>>> modules that I will put in one of the servers, while the other
>>>>> server will house NEW 2.4, 5, and 6 Ghz Wifi 7 modules.
>>>>>
>>>>> There is no M.2 E-Key connectors on these machines (as it is
>>>>> generic older generation hardware), so I am using an M.2 E-Key to
>>>>> PCIe riser cable from ADT link to convert the M.2 E-Key to PCIe:
>>>>>
>>>>> https://www.adt.link/product/R15V4.html  (I will need three of
>>>>> these, one for each module)
>>>>>
>>>>>
>>>>> This will allow connection of the wifi module to the PCIe bus.  I
>>>>> specifically chose this machine because it has 3 x16 PCIe 3.0, and
>>>>> 3 x8 Pcie 3.0
>>>>>
>>>>> To maximize throughput, these modules need to be connected to a
>>>>> PCIe 3.0 bus per Compex
>>>>>
>>>>> Because these modules only need a x1 connection to the PCIe bus,
>>>>> all three
>>>>> x8 slots will be used for each of the 3 wifi modules.
>>>>>
>>>>> You can purchase a premade board and wifi module bundle from
>> Compex
>>>>> for around $1200, but used my own server hardware because I wanted
>>>>> to customize my WAN and LAN interfaces, and use all three modules
>>>>> in ONE machine (no pre-made board can do this from what I have
>>>>> researched), so I only purchased the modules only instead of a pre-made
>> board and modules.
>>>>>
>>>>> I have pictures of this evolving setup and there are specific
>>>>> reasons for choosing this machine.  Keep in mind these modules
>>>>> require an external 5V power supply which will be supplied by 5V
>>>>> SATA power connectors - I am still trying to figure this out, but
>>>>> these WiFi 7 modules do come with power connectors soldered onto
>>>>> the board unlike the previous generation where you had to solder on
>> power contacts yourself.
>>>>>
>>>>> If you are interested, I can take pictures for you so that you can
>>>>> see first hand how the setup looks.  I can guarantee the cables
>>>>> work since I am able to detect the wireless modules via lspci and
>>>>> lshw commands as it successfully connects to.. and is powered by...
>>>>> the PCIe bus.  I just cannot get the firmware
>>>>> (board-2.bin) to load.
>>>>>
>>>>> Interestingly, I had brief success with the firmware loading on
>>>>> Ubuntu 23.10, during some trials, but it was one time and I have
>>>>> been unable to recreate this.  I'm not sure what I did to get it to work.
>>>>>
>>>>> One final note, this router is using a server platform as it will
>>>>> house 3 wifi modules (2.4/5/6 wifi 7), a 2x 100GBe ethernet LAN, 4x
>>>>> 10GB LAN (for a separate subnet), 2x 10GB WAN inputs, and 100GB
>>>>> Inifinband connectivity to an Inifiniband switch.  It will also
>>>>> house VMs for reverse proxy and VPN so it had 2x Xeon E5-26790 V4
>>>>> and 128GB DDR4 ECC RAM.  This unit is completely modular and any
>>>>> part can be upgraded at any time. This is why I went with this
>>>>> setup.  All of this is contained in one machine, no separate access
>>>>> point - the wifi is built into the router just like a residential
>>>>> router.  The antennas will be connected directly to the server via
>>>>> u.fl to SMA connectors for each card (each card having 4 antennas for a
>> total of 12 antennas connected to the machine).
>>>>>
>>>>>
>>>>>
>>>>> A few more points, the .zst files appear to be some sort of new
>>>>> compression technology that the stock Ubuntu 24.04 ships with.  The
>>>>> files are in this format by default in the WCN directory under
>>>>> /lib/firmware/ath12k.  There are NO .bin files.
>>>>>
>>>>> Also Interestingly, the ath12k driver is also in this format
>>>>> "ath12k.ko.zst" in the modules section and decompressing it to the
>>>>> .ko extension seems to disable the driver. This is confirmed using
>> "modinfo ath12k"
>>>>>
>>>>> Again, sorry for the long winded description.  I work as an
>>>>> Emergency room physician by trade, so I am not always near my
>>>>> machines and can only work on this project in my free time.  This
>> wireless module is the last hurdle.
>>>>>
>>>>> All of this is very confusing compared to the ath10k which seemed
>>>>> so much more straightforward.
>>>>>
>>>>> All the best, and thank you so much for your reply.  I can forward
>>>>> the contacts from compex that I spoke with if you so desire.
>>>>>
>>>>> I wanted to respond to your email as I am grateful you have taken
>>>>> time out of your schedule to reply to my message. I do have some
>>>>> questions regarding the specifics of rebuilding the kernel, but
>>>>> will address that in  a separate email so that noobs like me won't have to
>> go through this.
>>>>>
>>>>> I have been following your github every since ath10k a few years
>>>>> back, and your firmware was instrumental in helping me get my home
>>>>> wired/wifi router project off the ground.  My current wifi router
>>>>> is actually a desktop using mini-pcie wifi modules attached directly to the
>> desktop PCIe bus.
>>>>>
>>>>> Prashant Gupta MD/MPH
>>>>>
>>>>>
>>>>> On Mon, 20 May 2024 12:54:18 +0300, Kalle Valo wrote:
>>>>>
>>>>>>> "pgupta@hindutool.com" writes:
>>>>>>>
>>>>>>>> I have been reading through the various posts, and while I
>>>>>>>> found someone who reported the exact same problem, I was
>>>>>>>> unable to find a response from anyone who could present a
>>>>>>>> solution
>>>>>>>>
>>>>>>>> I have a Compex WLW7000E6
>>>>>>>
>>>>>>> Any recommendations from where it would be easiest to order such
>>>>> board?
>>>>>>> I'm based in Europe and would like to get one.
>>>>>>>
>>>>>>> Is the board otherwise plug&play to an M.2 E-key slot or does it
>>>>>>> need something special?
>>>>>>>
>>>>>>>> and am using the latest kernel version 6.8.0-31-generic
>>>>>>>> (ubuntu
>>>>>>>> 24.04
>>>>>>>> LTS)
>>>>>>>
>>>>>>> BTW in general we don't support distro kernels:
>>>>>>>
>>>>>>> https://linux-regtracking.leemhuis.info/post/frequent-reasons-wh
>>>>>>> y-lin
>>>>>>> ux-kernel-bug-reports-are-ignored/#your-kernel-was-apparently-bu
>>>>>>> ilt-b y-a-linux-distributor-or-hardware-vendor
>>>>>
>>>>>>>
>>>>>>>> Despite having the requisite files in
>>>>> /lib/firmware/ath12k/QCN9274/hw2.0:
>>>>>>>>
>>>>>>>> -rw-r--r-- 1 root root 8241152 May 19 23:47 amss.bin
>>>>>>>> -rw-r--r-- 1 root root 2821564 May 20 00:03 amss.bin.zst
>>>>>>>> -rw-r--r-- 1 root root 382856 May 20 00:03 board-2.bin
>>>>>>>> -rw-r--r-- 1 root root   21517 May 20 00:03 board-2.bin.zst
>>>>>>>> -rw-r--r-- 1 root root  421888 May 19 23:47 m3.bin
>>>>>>>> -rw-r--r-- 1 root root  139662 May 20 00:03 m3.bin.zst
>>>>>>>> -rw-r--r-- 1 root root   10699 May 20 00:03 Notice.txt.zst
>>>>>>>> -rw-r--r-- 1 root root   24310 May 19 23:47 regdb.bin
>>>>>>>> -rw-r--r-- 1 root root    3187 May 19 23:47 regdb.bin.zst
>>>>>>>>
>>>>>>>> I continue to receive the following errors:
>>>>>>>>
>>>>>>>> [    5.885930] ath12k_pci 0000:83:00.0: BAR 0 [mem
>>>>>>>> 0xc8000000-0xc81fffff 64bit]: assigned [    5.886287]
>>>>>>>> ath12k_pci
>>>>>>>> 0000:83:00.0: MSI vectors: 16 [    5.886294] ath12k_pci
>>>>>>>> 0000:83:00.0: Hardware name: qcn9274 hw2.0 [    6.745247]
>>>>>>>> ath12k_pci 0000:83:00.0: memory type 10 not supported [
>>>>>>>> 6.750101] ath12k_pci 0000:83:00.0: chip_id 0x0 chip_family 0xb
>>>>>>>> board_id 0xff soc_id 0x401a2200 [    6.750110] ath12k_pci
>>>>>>>> 0000:83:00.0: fw_version 0x10098b57 fw_build_timestamp
>>>>>>>> 2022-09-19
>>>>>>>> 18:18 fw_build_id
>>>>>>>> QC_IMAGE_VERSION_STRING=WLAN.WBE.1.0-02903-
>>>>> QCAHKSWPL_SILICONZ-1
>>>>>>>> [    6.761065] ath12k_pci 0000:83:00.0: failed to fetch board
>>>>>>>> data for
>>>>>>>> bus=pci,qmi-chip-id=0,qmi-board-id=255 from
>>>>>>>> ath12k/QCN9274/hw2.0/board-2.bin [    6.761212] ath12k_pci
>>>>>>>> 0000:83:00.0: failed to fetch board-2.bin or board.bin from
>>>>>>>> QCN9274/hw2.0 [    6.761247] ath12k_pci 0000:83:00.0: qmi
>>>>>>>> failed to load bdf:
>>>>>>>> [    6.761250] ath12k_pci 0000:83:00.0: qmi failed to load
>>>>>>>> board data file:-2
>>>>>>>
>>>>>>> This means that board-2.bin is missing the board file for your device.
>>>>>>> For AP devices like QCN9274 board files handling is difficult,
>>>>>>> usually Device Tree is the only way to get automatic board file
>>>>>>> loading
>>>>> working.
>>>>>>>
>>>>>>> Did you get any software with your the board? Do you know if the
>>>>>>> board is calibrated or not?
>>>>>>>
>>>>>>> Can you run:
>>>>>>>
>>>>>>> find /lib/firmware/ath12k/ -type f | xargs md5sum
>>>>>>>
>>>>>>> Also read:
>>>>>>>
>>>>>>> https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugrepo
>>>>>>> rt
>>>>>
>>>>>>>
>>>>>>>> but he zst files were copied over from the WCN7850 directory.
>>>>>>>
>>>>>>> I do not know what these zst files are. And don't copy anything
>>>>>>> from
>>>>>>> WCN7850 directory, the files are not compatible. The best is to
>>>>>>> run 'make install' within ath12k-firmware.git repository,
>>>>>>> manually fixing files will end up into problems.
>>>>>>>
>>>>>>> --
>>>>>>> https://patchwork.kernel.org/project/linux-wireless/list/
>>>>>
>>>>>>>
>>>>>>> https://wireless.wiki.kernel.org/en/developers/documentation/sub
>>>>>>> mitti
>>>>>>> ngpatches


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

