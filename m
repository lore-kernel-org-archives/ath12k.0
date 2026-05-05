Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF119CD13DA
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 07:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyJWgyXmwRseHdrQwryzBfjOY6srlu4zgbG/wX8JNGc=; b=qw6QD7z9Sj/5h0X6FsqyZcs3Qk
	dMzWDrTd3aM9OmTnsA8+OUNPZwJEix4PA0RAWXj0eroZsHr6VxreZJ7ywmM5vnPhmojRfdgq0uU1e
	GTD9lUk0rtFepGSrwDx9iZJVyvv/NEBBf8egI5d5B2uv7cXL9YpMZDm/rOiVzUlEK1NJA7jmumr0X
	dyGctb0QxUUKkUtlwLX3ZremHypiVhWSl98FkehSXziXiHkU3MUVPLxp+bue0wQIE4NxnTAMVtoVZ
	vBUW9t5JLSR7M/J6KtEMGjdm1mqe0+SOsylHxElC/OvFGQ7NxtjaFWy5JDCpUlwFeb6CxUqe+rtjh
	uDXag5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9tD-0000000FMJp-1p3C;
	Tue, 05 May 2026 07:08:19 +0000
Received: from mail.mokrynskyi.com ([65.109.39.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9t9-0000000FMHr-4AN6
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 07:08:17 +0000
Message-ID: <f137dcdf-2663-433a-b794-e4c43cd4dd2c@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1777964878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LyJWgyXmwRseHdrQwryzBfjOY6srlu4zgbG/wX8JNGc=;
	b=RKC4aBVq2q4wDQzpxDskc3joYzyO6GDALygSdNe7Lef6rY5nME+ewtNccxjVW9zUvP7Yib
	MV/7reF+lnEKf83UPfynmV4jvZpI68h/J0FQFJlrrgcz6YSYn3P/yrnjyURPSM0HXQabWq
	RSpiQkEtvtj9qOuUyR/iwhdIWiHu+dY+u/k7KjhVmzYsUveeEBPE5YjrFDEp2dOpbwzuFG
	s12wf+KBDVCm69F8AaOJZ8qV4wi2a/tJz414vospeCIzjYXZihkddMSDfQ/6tepikDoVch
	ujmBI/L0yPrlqS0FCitgdZvgTjMLlrm2haLsKtZl8MjMobIdsMu1RqRNE/kZ5w==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Tue, 5 May 2026 10:07:57 +0300
MIME-Version: 1.0
Subject: Re: The whole computer hard resets when trying to load ath12k driver
 in a KVM VM
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
References: <1bd351ec-1ed9-4a01-aae5-0ceb17fbffce@mokrynskyi.com>
 <71416eb9-d313-48de-86b1-40e8044b4076@mokrynskyi.com>
 <bfb8fb5c-ac92-4ebc-8cb6-c46ac2751418@oss.qualcomm.com>
 <2b0d5ae2-efaf-49c1-a748-724b13dfc94c@mokrynskyi.com>
 <711d7c74-eca5-40d6-b3df-278324982fb6@mokrynskyi.com>
 <02e40ced-21b5-46ef-a969-cc83e5160dce@mokrynskyi.com>
Content-Language: en-US, uk, uk-UA
In-Reply-To: <02e40ced-21b5-46ef-a969-cc83e5160dce@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ---
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_000816_421605_57901E86 
X-CRM114-Status: GOOD (  30.97  )
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

Any feedback on the patches, is it upstreamable?

Sincerely, Nazar Mokrynskyi
github.com/nazar-pc

17.04.26 15:08, Nazar Mokrynskyi:
> I've been able to get QCN9274 working under KVM with virtio too with two small patches: https://github.com/openwrt/openwrt/pull/22969
>
> Dealing with mailing lists for sending patches is a huge pain for me, so I kindly request you to take a look and pull them upstream when you have a bit of time.
> The changes are essentially trivial.
>
> I wouldn't mind other hacks becoming unnecessary, but at least with those patches I can work around the rest of bugs as described before.
>
> Sincerely, Nazar Mokrynskyi
> github.com/nazar-pc
>
> 20.09.25 16:09, Nazar Mokrynskyi:
>> Okay, I was able to prevent whole system crashes with `pci=noaer` when booting host kernel (Ubuntu 24.04 6.14.0-29-generic).
>> Would be nice if it was not necessary, any idea why things escalate so much?
>>
>> With older OpenWrt snapshot (r30806-070d8eb4d5) derived from 6.12.40 kernel I was getting these two cases alternating on odd/even boots of the VM:
>>
>>> [    7.393886] ath12k_pci 0000:04:00.0: BAR 0 [mem 0x89400000-0x895fffff 64bit]: assigned
>>> [    7.402838] ath12k_pci 0000:04:00.0: MSI vectors: 16
>>> [    7.407763] ath12k_pci 0000:04:00.0: Hardware name: qcn9274 hw2.0
>>> [    7.542240] ath12k_pci 0000:04:00.0: link down error during global reset
>>> [    7.570471] mhi mhi0: BHI offset: 0xffffffff is out of range: 0x200000
>>> [    7.577614] ath12k_pci 0000:04:00.0: failed to set mhi state: INIT(0)
>>> [    7.578488] ath12k_pci 0000:04:00.0: failed to start mhi: -34
>>> [    7.579312] ath12k_pci 0000:04:00.0: failed to power up :-34
>>> [    7.615653] ath12k_pci 0000:04:00.0: failed to create soc core: -34
>>> [    7.617815] ath12k_pci 0000:04:00.0: unable to create hw group
>>> [    7.655683] ath12k_pci 0000:04:00.0: failed to init core: -34
>>> [    8.123971] ath12k_pci 0000:04:00.0: probe with driver ath12k_pci failed with error -34
>>> [    7.158610] ath12k_pci 0000:04:00.0: BAR 0 [mem 0x89400000-0x895fffff 64bit]: assigned
>>> [    7.172045] ath12k_pci 0000:04:00.0: MSI vectors: 16
>>> [    7.177707] ath12k_pci 0000:04:00.0: Hardware name: qcn9274 hw2.0
>>> [    7.291634] ath12k_pci 0000:04:00.0: link down error during global reset
>>> [    7.320049] mhi mhi0: Requested to power ON
>>> [    7.368077] mhi mhi0: Power on setup success
>>> [    7.538116] mhi mhi0: Wait for device to enter SBL or Mission mode
>>> [    8.036845] ath12k_pci 0000:04:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
>>> [    8.046735] ath12k_pci 0000:04:00.0: memory type 10 not supported
>>> [    8.050328] kmodloader: done loading kernel modules from /etc/modules.d/*
>>> [    8.053813] ath12k_pci 0000:04:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0x401a2200
>>> [    8.063240] ath12k_pci 0000:04:00.0: fw_version 0x150c0673 fw_build_timestamp 2025-04-24 15:13 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
>>> [    8.086352] ath12k_pci 0000:04:00.0: failed to fetch board data for bus=pci,qmi-chip-id=0,qmi-board-id=255 from ath12k/QCN9274/hw2.0/board-2.bin
>>> [    8.087598] ath12k_pci 0000:04:00.0: failed to fetch board.bin from QCN9274/hw2.0
>>> [    8.093428] ath12k_pci 0000:04:00.0: qmi failed to load bdf:
>>> [    8.094398] ath12k_pci 0000:04:00.0: qmi failed to load board data file:-12
>> After upgrading to the current latest OpenWrt snapshot (r31110-41aaebad98) derived from 6.12.47 kernel I got this:
>>
>>> [    7.208812] ath12k_pci 0000:04:00.0: BAR 0 [mem 0x89400000-0x895fffff 64bit]: assigned
>>> [    7.224830] ath12k_pci 0000:04:00.0: MSI vectors: 16
>>> [    7.230381] ath12k_pci 0000:04:00.0: Hardware name: qcn9274 hw2.0
>>> [    7.342952] ath12k_pci 0000:04:00.0: link down error during global reset
>>> [    7.371390] mhi mhi0: Requested to power ON
>>> [    7.417659] mhi mhi0: Power on setup success
>>> [  164.087661] mhi mhi0: Device failed to enter MHI Ready
>>> [  164.090720] mhi mhi0: MHI did not enter READY state
>>> [  164.091615] ath12k_pci 0000:04:00.0: failed to set mhi state: POWER_ON(2)
>>> [  164.093214] ath12k_pci 0000:04:00.0: failed to start mhi: -110
>>> [  164.094584] ath12k_pci 0000:04:00.0: failed to power up :-110
>>> [  164.127713] ath12k_pci 0000:04:00.0: failed to create soc core: -110
>>> [  164.132306] ath12k_pci 0000:04:00.0: unable to create hw group
>>> [  164.167670] ath12k_pci 0000:04:00.0: failed to init core: -110
>>> [  164.632064] ath12k_pci 0000:04:00.0: probe with driver ath12k_pci failed with error -110
>> And now most of the time I'm stuck on the situation like the odd boot before, even after cold boot of the host machine with "mhi mhi0: BHI offset: 0xffffffff is out of range: 0x200000".
>> Very rarely I get above "mhi mhi0: Device failed to enter MHI Ready" hang instead, can't figure out the pattern, maybe it is just racy or something.
>>
>> Unfortunately, I don't really understand what any of this means, so not sure where to go from here.
>>
>> Will soon have a second QCN9472-based module from a different vendor and would appreciate any help in getting both of them to work.
>>
>> P.S. I have checked QCN9074 module with ath11k driver again earlier this week, it still works fine in the OpenWrt VM with the instructions I have mentioned in the previous email despite being "not supported" 🙂
>>
>> Sincerely, Nazar Mokrynskyi
>> github.com/nazar-pc
>>
>> 22.08.25 03:05, Nazar Mokrynskyi:
>>> Thanks for the response, looks like I'm in completely unsupported territory, but I'd love to see that changed 😅
>>>
>>> There were some tricks needed, here is a forum thread with the complete journey: https://forum.openwrt.org/t/qcn9074-doesnt-initialize-on-x86-64/163288?u=nazar-pc
>>> But more specifically, this seemed to be the missing piece: https://forum.openwrt.org/t/qcn9074-doesnt-initialize-on-x86-64/163288/47?u=nazar-pc
>>> For those who don't want to re-read a long thread on the forum, libvirtd domain config needed this piece of configuration:
>>>
>>>> |<features> <ioapic driver="qemu"/> </features> <devices> <iommu model="intel"> <driver intremap="on" caching_mode="on"/> </iommu> </devices>|
>>> Both "intremap" and "caching_mode" were key for device to initialize, and the rest for those two parameters to work at all.
>>> With that, I was able to create AP with QCN9074 on the hardware I mentioned earlier.
>>>
>>> But it certainly didn't crash the whole physical machine with any configuration.
>>> Well, most of the time at least, I did managed to crash the machine a couple of times with either ath11k or ath10k when VM didn't shut down cleanly (hard reset of the VM), etc.
>>>
>>> Sincerely, Nazar Mokrynskyi
>>> github.com/nazar-pc
>>>
>>> 22.08.25 02:46, Jeff Johnson:
>>>> On 8/20/2025 2:47 PM, Nazar Mokrynskyi wrote:
>>>>> Some additional details.
>>>>>
>>>>> The system is x86-64: Gigabyte MZ32-AR0 Rev 1.0 motherboard (with M23_R40 BIOS) and AMD Epyc 7302P CPU.
>>>>>
>>>>> Host OS is Ubuntu 24.04 with HWE kernel 6.14.
>>>>>
>>>>> As guest:
>>>>> * initially tried OpenWrt 24.10.2 with kernel 6.6.93, WiFi backports seem to be from 6.12.6
>>>>> * then tried the latest snapshot (r30806-070d8eb4d5), which uses 6.12.40 kernel and according to the kernel module version carries WiFi backports from 6.16
>>>>>
>>>>>> # lspci -mnn -s 46:00.0
>>>>>> 46:00.0 "Network controller [0280]" "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]" -r01 -p00 "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]"
>>>>> The module is QCN9274 2x2 5G+6G from Commtek (but missing on their website) with M.2 E-key connector.
>>>>> Looks very similar to Compex WLW7002E56 in terms of size and features.
>>>>>
>>>>> This should be most of the details that might be relevant.
>>>>>
>>>>> Sincerely, Nazar Mokrynskyi
>>>>> github.com/nazar-pc
>>>>>
>>>>> 21.08.25 00:15, Nazar Mokrynskyi:
>>>>>> Hi,
>>>>>>
>>>>>> I have a QCN9274-based Wi-Fi module that I want to use with OpenWrt under KVM VM (libvirtd, vfio).
>>>>>> I used various Qualcomm modules this way with ath10k and ath11k in the past successfully, but ath12k seems to be buggy.
>>>>>>
>>>>>> Two cases:
>>>>>> * if host already loaded ath12k, then starting a VM with the PCIe device passthrough triggers immediate hard reset of the machine
>>>>>> * if I bind the device to vfio-pci on the host, I can boot the VM, but it inevitably hard resets the machine when ath12k starts loading (presence of the correct board file does not matter, it doesn't seem reach that stage)
>>>>>>
>>>>>> In the second case, which I'm primarily interested in, the the following lines are the only thing I can capture before host hard resets:
>>>>>>
>>>>>>> 0000:01:00.0: MSI vectors: 1
>>>>>>> 0000:01:00.0: Hardware name: qcn9274 hw2.0
>>>>>> And when machine reboots, BIOS prints:
>>>>>>> Warning: PCI-Express PERR/SERR error detected.
>>>>>> I'm not really sure what this is, but I think it should be trivial to reproduce.
>>>>>> Looks like either driver or onboard firmware issue?
>>>>>> Open to do more testing and provide additional info.
>>>>>>
>>>>>> All information I have so far is on the forum here: https://forum.openwrt.org/t/qcn9274-crashes-the-system-during-driver-load/239491?u=nazar-pc
>>>> Curious how you managed to get this to work in the past with ath11k since that
>>>> is not supported. Some discussions on ath11k here:
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=216055
>>>> https://lore.kernel.org/all/fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com/

