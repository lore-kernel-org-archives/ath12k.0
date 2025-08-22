Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF0BCA0EFF
	for <ath12k@archiver.kernel.org>; Fri, 22 Aug 2025 05:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuDhj/oSKknF8tFqw/E3PX1YJJ/+nQqKf9FHwPrq/+w=; b=BQItwyMvjBA/y4rNAU3iBicrcu
	8PEx5RE/F2m3BTZkozHSgWAH9ouOZVDJmdsGQAfK+Fs9YzbbBCyDzO8dqzcMkeTlo4FqcDenz+miX
	F+20PJeocfCix8B7hUj3ET9w31IESuEKtDfP/Jj1MnUmKux2L75z9gBR9XhUdWUJesAiOVyEKEQQB
	k+Hk0MStQ171+cQx8tj+mSR5TWFOuVqooTPqA5Kl3EeFLLGmcoHOJ4aHGWtAPFaUNZ/3M/PR5SNjH
	yWnP4u6j4g7gvYLF6QN82MdcuixztCteMeQZ7XoBabQpvQCLv8+4DNL3J3aVg7VTlbfkNlELVFKzv
	5wZH+JnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKPk-00000001asm-2L9Z;
	Fri, 22 Aug 2025 05:34:12 +0000
Received: from mail.mokrynskyi.com ([65.109.39.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFHR-00000000zWc-2mYA
	for ath12k@lists.infradead.org;
	Fri, 22 Aug 2025 00:05:19 +0000
Message-ID: <2b0d5ae2-efaf-49c1-a748-724b13dfc94c@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1755821112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nuDhj/oSKknF8tFqw/E3PX1YJJ/+nQqKf9FHwPrq/+w=;
	b=G3NCk2Ol8FVjNVEcC+pyAJ2SWEhPWOP7Zx2T+UxYruXgGiILGpCQVHB65AfWAJQvdqQBxE
	DS3GBBXlsw93T0ZMrVCaMCYVPxI3M8hrEMQIqbE7zu3VoY7MhAqnWt+zaHFpaXqO6obMFn
	uqEEn8kHXro+Ywn3+PPpE2SUmLj2jcMY04myyYpnWXgW+QloiC4qmbp8m+cREALfc7tr0Y
	lp835ff35OmrrhqXrFs3DMpeJKZxmVAOTyK2PgFKSvQ1xKCsQv5vn3CvCOyadAMJVgBgXR
	f3RVb/iv9fIhRcnypmPMGGg1Bber5aBFJHdzrxJz1YAA6RONaqEdqbJqLvas2w==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Fri, 22 Aug 2025 03:05:10 +0300
MIME-Version: 1.0
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: Re: The whole computer hard resets when trying to load ath12k driver
 in a KVM VM
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
References: <1bd351ec-1ed9-4a01-aae5-0ceb17fbffce@mokrynskyi.com>
 <71416eb9-d313-48de-86b1-40e8044b4076@mokrynskyi.com>
 <bfb8fb5c-ac92-4ebc-8cb6-c46ac2751418@oss.qualcomm.com>
Content-Language: en-US, uk, uk-UA
In-Reply-To: <bfb8fb5c-ac92-4ebc-8cb6-c46ac2751418@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ---
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_170517_852720_BDA2C070 
X-CRM114-Status: GOOD (  20.28  )
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

Thanks for the response, looks like I'm in completely unsupported territory, but I'd love to see that changed 😅

There were some tricks needed, here is a forum thread with the complete journey: https://forum.openwrt.org/t/qcn9074-doesnt-initialize-on-x86-64/163288?u=nazar-pc
But more specifically, this seemed to be the missing piece: https://forum.openwrt.org/t/qcn9074-doesnt-initialize-on-x86-64/163288/47?u=nazar-pc
For those who don't want to re-read a long thread on the forum, libvirtd domain config needed this piece of configuration:

> |<features> <ioapic driver="qemu"/> </features> <devices> <iommu model="intel"> <driver intremap="on" caching_mode="on"/> </iommu> </devices>|
Both "intremap" and "caching_mode" were key for device to initialize, and the rest for those two parameters to work at all.
With that, I was able to create AP with QCN9074 on the hardware I mentioned earlier.

But it certainly didn't crash the whole physical machine with any configuration.
Well, most of the time at least, I did managed to crash the machine a couple of times with either ath11k or ath10k when VM didn't shut down cleanly (hard reset of the VM), etc.

Sincerely, Nazar Mokrynskyi
github.com/nazar-pc

22.08.25 02:46, Jeff Johnson:
> On 8/20/2025 2:47 PM, Nazar Mokrynskyi wrote:
>> Some additional details.
>>
>> The system is x86-64: Gigabyte MZ32-AR0 Rev 1.0 motherboard (with M23_R40 BIOS) and AMD Epyc 7302P CPU.
>>
>> Host OS is Ubuntu 24.04 with HWE kernel 6.14.
>>
>> As guest:
>> * initially tried OpenWrt 24.10.2 with kernel 6.6.93, WiFi backports seem to be from 6.12.6
>> * then tried the latest snapshot (r30806-070d8eb4d5), which uses 6.12.40 kernel and according to the kernel module version carries WiFi backports from 6.16
>>
>>> # lspci -mnn -s 46:00.0
>>> 46:00.0 "Network controller [0280]" "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]" -r01 -p00 "Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]"
>> The module is QCN9274 2x2 5G+6G from Commtek (but missing on their website) with M.2 E-key connector.
>> Looks very similar to Compex WLW7002E56 in terms of size and features.
>>
>> This should be most of the details that might be relevant.
>>
>> Sincerely, Nazar Mokrynskyi
>> github.com/nazar-pc
>>
>> 21.08.25 00:15, Nazar Mokrynskyi:
>>> Hi,
>>>
>>> I have a QCN9274-based Wi-Fi module that I want to use with OpenWrt under KVM VM (libvirtd, vfio).
>>> I used various Qualcomm modules this way with ath10k and ath11k in the past successfully, but ath12k seems to be buggy.
>>>
>>> Two cases:
>>> * if host already loaded ath12k, then starting a VM with the PCIe device passthrough triggers immediate hard reset of the machine
>>> * if I bind the device to vfio-pci on the host, I can boot the VM, but it inevitably hard resets the machine when ath12k starts loading (presence of the correct board file does not matter, it doesn't seem reach that stage)
>>>
>>> In the second case, which I'm primarily interested in, the the following lines are the only thing I can capture before host hard resets:
>>>
>>>> 0000:01:00.0: MSI vectors: 1
>>>> 0000:01:00.0: Hardware name: qcn9274 hw2.0
>>> And when machine reboots, BIOS prints:
>>>> Warning: PCI-Express PERR/SERR error detected.
>>> I'm not really sure what this is, but I think it should be trivial to reproduce.
>>> Looks like either driver or onboard firmware issue?
>>> Open to do more testing and provide additional info.
>>>
>>> All information I have so far is on the forum here: https://forum.openwrt.org/t/qcn9274-crashes-the-system-during-driver-load/239491?u=nazar-pc
> Curious how you managed to get this to work in the past with ath11k since that
> is not supported. Some discussions on ath11k here:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=216055
> https://lore.kernel.org/all/fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com/

