Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F91C77B7F
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 11:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kecgRD7j3uCLg6GXbiUJq8Ia38Zv08YXs38qUfSIWOs=; b=GhkIRH6RsiMc+C/hS4KT0IN2Id
	PbL2uhkFWnXEfEAgsR5Mqy3dEvUJt4DH4z/e3jPwa9O5uh+Nij9pPiD7b4OsP3FTPPGWoRKxbSyxO
	/9kbNZUhy5I7z41ZGuVUqLaBXT88lJ8/qVD424hDTco1QybZF9yGupuRh8Kq3Yi3i3PxFiybpFgtw
	hrU6SZJ5/BKWcD+AkZgPYvBQXGUrC+C5xDxPMDHin6nj9tDILGA9YRn26zFQkEs6oBNuhyMPiml0L
	S6FCiz9omyxrBOWHGT0YUD4+gtQWVIm4fZMTvPQppanTOuBLi35Pu6O5O0teQ8mCQtnmVeGkqFEAM
	vZ5ZVUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7ei-0000000EYxX-3PgN;
	Fri, 27 Jun 2025 11:54:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6Gb-0000000EGXo-2XOE
	for ath12k@bombadil.infradead.org;
	Fri, 27 Jun 2025 10:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kecgRD7j3uCLg6GXbiUJq8Ia38Zv08YXs38qUfSIWOs=; b=EkmWFHslgXf1AYUPWNdxJOR2on
	cKtybnwaFyX20an9LitBamajg93UDYDP6Dbad5uSntUAuDyXv+loIZyxpuJdeZ+4j7//ps/oY7+yX
	hA3zPcCjnEAG4dt2m86B1gsy4406LOGau5tREszNe5IVRoQw7EYF7UMpdFJo+MZDDv2iZJ74yuHVc
	601XHfim8EnrZBKPJlNnbY071jsfWuz5tKldKSe58AKAoUjP1sSVI7/g1eUP3T+NJy18BfNNPQYh5
	LfzM0k38OBN93kCtVrntyVfPjOE7P1nwNJbqH0PfQ0cVs8egq8hcXMAp2yk6IsO1hBsJtnXxR+8uX
	zojutMJQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6GV-00000006IB5-0Zzl
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 10:25:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 452A31A00;
	Fri, 27 Jun 2025 03:24:40 -0700 (PDT)
Received: from [10.57.30.59] (unknown [10.57.30.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A88C33F58B;
	Fri, 27 Jun 2025 03:24:55 -0700 (PDT)
Message-ID: <fd3bd8b1-4108-445a-b65f-4769d73e6e63@arm.com>
Date: Fri, 27 Jun 2025 11:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Matt Mower <mowerm@gmail.com>, Jeff Johnson <jjohnson@kernel.org>,
 will@kernel.org, joro@8bytes.org, Hegde Vasant <Vasant.Hegde@amd.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 1107521@bugs.debian.org, iommu@lists.linux.dev
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
 <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_112503_934707_10963030 
X-CRM114-Status: GOOD (  22.44  )
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

+Vasant

On 2025-06-27 6:39 am, Baochen Qiang wrote:
> [+ IOMMU list]
> 
> On 6/27/2025 12:21 AM, Matt Mower wrote:
>> Dear maintainer,
>>
>> I have been experiencing lost network connection with the ath12k_pci driver
>> in the linux-6.12.y kernel branch. Often, when the issue occurs, the
>> network does not recover until I reboot the computer. A full report of the
>> errors I encounter, the symptoms that arise, and several dmesg attachments
>> are in https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1107521 . I have
>> attached a dmesg from 6.12.34 for convenience. The short summary is:
>>
>> 1. I started noticing log lines like the following soon after boot when I
>> updated from 6.12.22 to 6.12.27. After these events occur, the network goes
>> down and often does not come back up.
>>     ath12k_pci 0000:c2:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
>> domain=0x0010 address=0xfea00000 flags=0x0020]
>> 2. I was able to reproduce this issue very rarely in 6.12.12 and 6.12.22.
>> The issue always occurs soon after boot in 6.12.27, 6.12.30, 6.12.33, and
>> 6.12.34.
>> 3. I have not reproduced the issue in 6.15.2 or 6.15.3.
>> 4. In some cases, when shutting down the computer, a kernel bug caused my
>> computer to hang. I haven't determined whether this is related to the issue
>> above or an independent issue. Search the bug report
>> for PXL_20250611_140820085.jpg to see a picture of the kernel bug on my
>> laptop screen.
>> 5. I have tested two firmware versions:
>>     a. fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:21 fw_build_id
>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>     b. fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:05 fw_build_id
>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Thanks,
>> Matt
>>
> 
> I had a quick test with 6.12.27 kernel on both my Intel desktop and AMD RD but didn't hit
> the issue. And I am using WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3.
> 
> As mentioned in the Debian bug report, since reverting ath12k patches does not fix this
> issue, maybe it comes from the IOMMU subsystem?

Faults are usually still indicative of the client driver/subsystem doing 
something not quite right - racily performing dma_unmap before the 
device has actually finished making accesses; mapping the wrong size 
such that the device accesses off the end of the mapping (this can often 
run into another valid mapping so not necessarily fault); mapping the 
wrong DMA direction such that the device then tries to write to a 
read-only page. However I suppose it's not impossible that some fix to 
amd-iommu in that period might have changed its behaviour in a way that 
exacerbates things - Vasant, does this strike a chord with anything 
you're aware of?

A couple more things I'd try on the ath12k side: firstly, boot with 
"iommu.strict=1" and see if that makes the faults any more 
frequent/reproducible; if a fault is fairly easily reproducible, then 
use the DMA API and/or IOMMU API tracepoints to compare the fault 
address to prior DMA mapping activity - that can usually reveal the 
nature of the bug enough to then know what to go looking for.

I wouldn't put much significance in whatever happens *after* the fault - 
presumably the driver is assuming the blocked DMA write has completed, 
so then goes on to read some incomplete descriptor as if it were valid, 
and thus may fall over in all manner of entertaining ways on bogus data.

Thanks,
Robin.


