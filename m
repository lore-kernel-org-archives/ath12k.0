Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8B9C7EE30
	for <ath12k@archiver.kernel.org>; Wed,  2 Jul 2025 07:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCA3laQUQgLfr4d3l5ToyQ/eRvjHKHLDwpnt3NLlado=; b=JXY7j835H61rgtnAPvC6V0KXxY
	7dSj6geDtryI6EEgVZIH8zcVsP2hSg0RGYtlVgKpI2CdcU/M8U6tqfgi5418/4K/firy5O6rFFNKv
	NQeDDB8fo+PCxDYYnPcmPnLAU3rE419iDuIQFzDpla3ZLG+mauniUpaDr7QzkemRS49mNGzBqR+dl
	Z0tk+PfKvsMvqkAnnLSpEvE6iYZehNDxu4cx7XB6mcJSBrPaWTX7PTetSkv6a/Go63CyUleKU0MRP
	I5TKnibaRpvtG/WjNorlvFhiKI7qHPzGE9aq6m5dZiJ2YS9pkhV/r7LMiC4OHBQnNLk2r6jwvCZ8g
	hA8mUQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrcB-00000007T87-32Ot;
	Wed, 02 Jul 2025 07:10:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrc9-00000007T7m-0Qex
	for ath12k@lists.infradead.org;
	Wed, 02 Jul 2025 07:10:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625vZCh002651
	for <ath12k@lists.infradead.org>; Wed, 2 Jul 2025 07:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCA3laQUQgLfr4d3l5ToyQ/eRvjHKHLDwpnt3NLlado=; b=KeAvkgy7miYsdzsE
	076/VOy1kJ3L98Gd5ihfqHoKdRQ/AYP8yI3ee9KhynregnxtjLo3AJYMAR02gAix
	RuwjdIKO39fyJZJsvOedZe/KOAs9qzlu6Hcs3mSu1OKYKzdaLjwZVtyHInEWJj2j
	WAOsZb3sNlPKuCU8WgGNEM6XuKuO16v+g18wo/AB3ddyDYUHeCeJXNq/GRIVjddp
	1cC5PWoWGvIjYjba7ggfjlrfWuo0f3n3fbW8DoQdzVqf9Zk7BB71f5OSuJXXV8Xp
	X662SA3//wsU5iDyZ055lwbjiCLmFNCzZE8xK3+pTF5qE/7YSyeW1dol+G9NXXeW
	qpTgLw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcue8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 07:10:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74927be2ec0so6573948b3a.0
        for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 00:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440239; x=1752045039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCA3laQUQgLfr4d3l5ToyQ/eRvjHKHLDwpnt3NLlado=;
        b=GwPXMPSZUMzF/mmfiMKHzS9ubTZOT4xC3EhlkNmdvJlAorGz2On7/K1g0EZNqYNEBq
         3cMp1HwzbHj7wq8IK9mCB5Rh+E0yzylAMzpthIz4Z6PMiZtNbX+2s4II/WsNM0EwZB5N
         P7272/3uGJbnFyn/wbZKYo54Nd7iD2fV/ttXZRjbGTapJx73kR9MmmSxboToueEEAnKs
         yekCf5nHD+n1IW2vQwyJPOwS6ubCJEpQQJt2V2uw9uQnTp+ZL/7A1Otp/eG43GTqlMaQ
         h0w6ZZ5Glcs743D1pVGduwqIh81zi58uKL0+HcykKoipJMpHPPEmkwEW988iGSgaz+BX
         c1BA==
X-Forwarded-Encrypted: i=1; AJvYcCUrGEmD0/X52ql7oc2NE2u2Mm8boEhb4nMs9dpmsn+Cpa3tSH7vEiuKsRPIaGQNGehr1jP7y9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnFA3wcn2dX7IfofdI6aNJ1JcpoUK5P9GUP/kDykwaWf5z3aIE
	kxfQAliaJ/aradPw5TWjltV1qxIaMtPAhyGBWxLyhYWzNLk2XCNNwgf2ROpsxg4Yf82dRx2Eh/b
	m6VEvnqUk0qDlNnogdaZy2RQ5YBkxrExUEMjYm0va7o3YdwmXmTfoF4Xl6OcjHlZs
X-Gm-Gg: ASbGncssMo/EKMTVHKzh7kDM4UQRN+7nq7rRhkyR93uGcXHzH4OUdGnhvKr1u/Tti7D
	Qq5dV3o+GNC7QUODthY4t+4LWhhTFFgzwvSH3YTxtS5X62sA8kAUz/HM2ohj90g9WQKFJDfb8L5
	YMx0fv6K6rd8vOURYeTZ1p6+W7Gw98hAiZnSc3bTceB7rfcGizEdHkqte6QT7IJcK46KXgHRoCd
	mZfcS+DnPfGZby+IRfzTTCMvjh4kwHZUwtEcP8g34inqRjUtnPa+wV+MZZSboR7eILWWTajdWLf
	vmXtd/B707w5R9BAjIUwmZBJxBq/hUp7N9Ot0At8hQ6Xf50GI5kbj30ffB100wX0Xw7eiLcFDta
	WjLIQZ78ZGkP7Is0=
X-Received: by 2002:a05:6a00:1a8e:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-74b51513b5bmr2503478b3a.24.1751440239067;
        Wed, 02 Jul 2025 00:10:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuPtEnawlGMpCtfFrj4XZgsJyOlvmqGRqt3CEEGBVF1/+L6vgFtb/yE1jQDvC02NOyWgzA9A==
X-Received: by 2002:a05:6a00:1a8e:b0:748:2ac2:f8c3 with SMTP id d2e1a72fcca58-74b51513b5bmr2503447b3a.24.1751440238639;
        Wed, 02 Jul 2025 00:10:38 -0700 (PDT)
Received: from [10.133.33.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ed353sm13034533b3a.153.2025.07.02.00.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 00:10:38 -0700 (PDT)
Message-ID: <e008afed-819d-43eb-8895-2c7aaf24ec13@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 15:10:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: Matt Mower <mowerm@gmail.com>, Vasant Hegde <vasant.hegde@amd.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Jeff Johnson <jjohnson@kernel.org>,
        will@kernel.org, joro@8bytes.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, 1107521@bugs.debian.org,
        iommu@lists.linux.dev
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
 <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com>
 <fd3bd8b1-4108-445a-b65f-4769d73e6e63@arm.com>
 <4a13d862-1bbb-4a98-bc1d-219bf78f7c0d@amd.com>
 <CAPDiVH-kVCUY8DKexT9OqAZsvkZ5_CGo8d8nENYA-kD=s_x8wA@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <CAPDiVH-kVCUY8DKexT9OqAZsvkZ5_CGo8d8nENYA-kD=s_x8wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yYV2rJb2ZLfAM2DdAIBiQiS18ctLja82
X-Proofpoint-ORIG-GUID: yYV2rJb2ZLfAM2DdAIBiQiS18ctLja82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1NiBTYWx0ZWRfX3fTVlZgNex5Q
 9KixBBp9UgmbUFRqy2ZGYEGnyFXc6PPCNQ6keNoTX6K1QBiliJPbol4U4D2BdZK5Dt060KEJVkO
 f7HdQV2zDLTSmVrNJhUj/8OTWTL/ryMU4Wl6zYGv24AlshgKm/x1xZyYuCxMHu+oCdGM3rxB1on
 FlN0eiYqTVssG9NrT2oZtAVGQqo4rse6aNWCk2RkG2kf2OS5w65mrI2Vh662WUdz0D8IGFziSdK
 V8WsYBAbfO37Rd1DV5CQXvPtPhHoilHTN5rpCW0n1DsoBSuMDkMkPGVusLgVX1DxMzcd3dmA/Dx
 69J2Wr+igckNPJgJkweqQA6yz2Q0BXtQLeBnqt3O/rXnZfSJGo8YGKHivZKcEXewGHJVWav6+nN
 RFtu9oArippJ9fV3KeqV0aGdo7vGhVeekHQaqzWPfCq9lBWLD7TCM1uo+wJKmgjEmCEtjmV4
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6864db70 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=1xDctz_ZAAAA:8 a=PsUJ3HgR6tW1sV_hUDoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=1a1P4aADmYxDp9Cj9Seq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_001041_171023_123BCF61 
X-CRM114-Status: GOOD (  25.24  )
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



On 7/2/2025 1:17 PM, Matt Mower wrote:
>> A couple more things I'd try on the ath12k side: firstly, boot with
>> "iommu.strict=1" and see if that makes the faults any more
>> frequent/reproducible;
> 
> The issue is easy enough to reproduce in 6.12.27 onward and I may be
> mistaken about the rarity in 6.12.22; I reproduced it relatively
> quickly in .22 today, so if this was the primary purpose for setting
> iommu.strict=1, then testing with or without strict works. FWIW, I did
> test iommu.strict=1 with 6.15.3 and still have not reproduced this
> issue there.
> 
>> if a fault is fairly easily reproducible, then
>> use the DMA API and/or IOMMU API tracepoints to compare the fault
>> address to prior DMA mapping activity - that can usually reveal the
>> nature of the bug enough to then know what to go looking for.
> 
> This is unfamiliar territory for me, so I hope the following is at
> least close to what you requested. If not, happy to provide more test
> results based on a set of instructions. Here's what I did:
> 
> 1. Set CONFIG_DMA_API_DEBUG=y
> 2. Set kernel command line to: iommu.strict=1 log_buf_len=100M
> dma_debug_driver=ath12k_pci trace_event=dma:*,iommu:*
> 3. Booted and waited for page fault, then cat'd
> /sys/kernel/tracing/trace to a file.
> 
> Additionally, though I'm pretty sure this is irrelevant now, I added
> logging after each dma_map_single() in the ath12k driver to print the
> function name and resultant address to the kernel log.
> 
> Comparing the addresses of several io_page_fault lines in the trace
> and in the kernel log, they line up. So, I'm hopeful this is on the
> right track.
> 
> DMA/IOMMU trace: https://cmphys.com/ath12k/iommu_dma_trace-20250701.log
> Kernel log with additional logging:
> https://cmphys.com/ath12k/dmesg-6.12.35-20250701.log
> Diff showing extra logging added to v6.12.35:
> https://cmphys.com/ath12k/ath12k-extra-logging-6.12.35-20250701.diff

Thanks, the log is helpful.

So the whole thing is:

#1 ath12k allocates/maps it at a very early stage:
   (udev-worker)-532     [010] .....     4.878076: map: IOMMU: iova=0x00000000fe980000 -
0x00000000fea00000 paddr=0x000000010ec80000 size=524288
   (udev-worker)-532     [010] .....     4.878079: dma_alloc: 0000:c2:00.0
dma_addr=fe980000 size=524288 virt_addr=000000006cadbcb1 flags=GFP_KERNEL attrs=

#2 here it is unmapped/freed
   kworker/u64:0-12      [011] .....   327.747763: dma_free: 0000:c2:00.0
dma_addr=fe980000 size=524288 virt_addr=000000006cadbcb1 attrs=
   kworker/u64:0-12      [011] .....   327.747766: unmap: IOMMU: iova=0x00000000fe980000 -
0x00000000fea00000 size=524288 unmapped_size=524288

#3 then the page fault
irq/26-AMD-Vi-154     [006] .....   327.753942: io_page_fault: IOMMU:ath12k_pci
0000:c2:00.0 iova=0x00000000fe980000 flags=0x0001

#4 here seems ath12k is recovering
[  327.849022] mhi mhi0: Requested to power ON

This gives me the impression that the IOMMU page fault is caused by misbehaved firmware
which crashes. The sequence is, first firmware crashes, then host gets that event and
begins to recover, during which some DMA buffer is freed/unmapped. However the firmware
does not know that and continues to access it, and hence the page fault.


Matt, could you help enable verbose ath12k log to verify my guess?

modprobe ath12k debug_mask=0xffffffff

note this would make ath12k throws lots of logs. Here the purpose is to check whether
firmware crash happens before the page fault. You may monitor

	ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset starting\n");

in ath12k_core_reset(), which is the entry of ath12k recovery process.

And one more thing, the issue buffer is handled by dma_alloc/free_xxx API family, so
adding logs to dma_map/unmap_xxx API does not help here.

> 
> Thanks,
> Matt


