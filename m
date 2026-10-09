Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020E5CA6012
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85qlNPdEkcYw8yOFY5LRdai4t8d5MyM6OvjxC0Qsdug=; b=XzBhgWWxIXSFJAjQznp/fG8Fgw
	iyFnVcykMcbtamTuOTpzcYHZ+viNSw93ly1Yy99QtaxwU13ek7yNDWeFLp2k2x2gvyjR8k52jG2fK
	UqKr1g7kPjonSAxLZNlcKIZvR63gLIgBaiv0paoNovaMLhiTIX/RWXgEpksUA555gTKKEab9JkefM
	wwt+rCEWexcfa2C2hyES5wZsZHpFM70vfbR1CmRSNiazTYVYwrSvy9ql7wpHPOsOIqaDtkiW5HVKW
	+gHvINnozFYK2mMqcDsMU/fG5faEPd2idtcun5rupV0U+WLQbSru/9uXrnFBB+BIg3jj2hU+IrJkJ
	sGnGnb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF71R-00000005vuF-1SOG;
	Fri, 09 Oct 2026 09:36:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF71O-00000005vtt-2XqX
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 09:36:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIO8404357
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 09:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85qlNPdEkcYw8yOFY5LRdai4t8d5MyM6OvjxC0Qsdug=; b=eu8AIJwPvLjTmR6M
	xNWZl5w6mNhU0iZInYiIkylr0WMcnC+5+9zvY+it1UI4VbBUQ9lHllZRb2LJdFrg
	DgQrijrOb/+HAq+xejf0B1tfXiRmzW4VjRalGTbf+lIfSwG9eXpVkTO4k5JFwMGv
	PWTkfO4AdF/fiINg2kaiGoLdqIVLX7yB+6ldbp9e4QxMDNFejjfMObfVHFX6kRGt
	oXg/H061y7Ht7YieKyCBkAWwaz/OPfM/e/Ug9Mc9mGHv5hB2C3hFJw0F57e6WWCo
	hsMhSt1d4jAtAlVJdloeq8pNZNDJeiDFIXJOFGPrlLNc64qh02JCcgSjqCXTYfm4
	n+KIeQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk2xp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 09:36:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so60611595ad.1
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791538569; x=1792143369; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85qlNPdEkcYw8yOFY5LRdai4t8d5MyM6OvjxC0Qsdug=;
        b=j0Wer4pTtHqVvW/ENu4MqSwKVQhiGAiZ59kb6XB+K+x/Bqu4NPDgWHqGCQI8l4501m
         LUgOJJM3mbv429qi4Dm9Kfi4NF6M2WZPetMp/2Z9zf0BHvAud1RwwYJpx3IvuB7Y9RM+
         GyeVZx4lMFy1J24WU22SyG3eRzq73pQwNpVge6IPcjqU0MYwbG7dj9/saLQZ8axgb7Dh
         RIAg0amd8h+Afnn5myPzJNb07CeJ9XmTajGpHwP6nACsYhS8ZwlPuc0wJ97AbDHl49uj
         zWJXQ+v+IlF5UNP2gDK32CwVTZXNEBEjXgiQqmePZ5V5k7KFQCgtxOZU4ch/kBVx4vhw
         /xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538569; x=1792143369;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85qlNPdEkcYw8yOFY5LRdai4t8d5MyM6OvjxC0Qsdug=;
        b=RZXxBq9mM4vrx1Sx+GhPMmZgz7g3Nd9ybxQ0r2+imu4wHtDlnBWL7WZ3FvMy5TYA36
         qBM05wwN+cSsNdRigrR6gVBcsexrmVahjHeqJyLwiXBZ84qK3ta9YGdPVb61elHwxoup
         zllwWjG+4G0o5EpdECTgLHJ+ODcim0xw4JO/+XqE72mugp/JIJ1sAXhj4pSucNPCu0JN
         +lg6mMV/IPPOpmKnBvx8GK1G193Ieyz+Cb7YAIxqiN+L52W8Hr1d11AGNhEzmCbyhM1b
         4B1z1mTw9aT9cbVrFbjQWeb9wG5xwurYsjuy+pBBLQ5ho2upLpSvUJ5EWxjbgfZxUN4k
         AyFA==
X-Forwarded-Encrypted: i=1; AKwUvBykw0fCCHfx0uS8Vpx5uSJ/l8HKF0Efjf2s57ZqQWQaFLTjDV1HPni1XHcxuAQeJiAB0XhPfa0=@lists.infradead.org
X-Gm-Message-State: AFq9FYLG/oTMnh/S4qbE/t8ezv0E4OAn/2quJeS5hUhU0PFqOPqpsPvh
	FLk/6ZvyQhr8crTN7BTywNMLwe726SgGefRGyxcfJCuDPkckO89BrpBPIZqk25IC4sxMb2redkr
	+Maned2nGN0Sy2574Hzod5WwtHVH+KSwJ3vJT1ylFqZRxmHqwJkQaXV3ke36OHlDZ
X-Gm-Gg: AYBFou3ZCPYds1OA2zqP9UwwLH1jEybnp08UmPYXAaAqE2fw6p2qNASq9DiluYgsZW3
	e1P4kZfVnVUUtO+g6mf/RtADA4d6rF+aJdu1Q4ZSclmUtdCfS2tqv8mZKGavIt826Y4NCdSGboz
	HIEGjxzLi+CpYvgt70mSrFtb9tv6y+WVLg0MY1HJJaCJMnFFaU4NUAOh2Q5iJhMPAi8DnvTFK7A
	uI3gfI/IO+bDIUnPYNoUJO8BP+58dWTPsqcG75KgJhYfUz+3MUxe4SWQq0QUN28WRTMOOERWnUR
	winJ5wbMdqqa/sdORYWd2Nf9jnduRbuyspDljqnB04Y5cF5rMz9gVpe8jFEgnRvqR40rMSrMzio
	+NzfgMFwL65xZXR9iKYoew1k0mYzYKjoX0Q==
X-Received: by 2002:a17:902:e545:b0:2e7:f0ba:244d with SMTP id d9443c01a7336-2e842bcd14dmr10477875ad.36.1791538568911;
        Fri, 09 Oct 2026 02:36:08 -0700 (PDT)
X-Received: by 2002:a17:902:e545:b0:2e7:f0ba:244d with SMTP id d9443c01a7336-2e842bcd14dmr10477695ad.36.1791538568346;
        Fri, 09 Oct 2026 02:36:08 -0700 (PDT)
Received: from [10.152.202.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421a1de9sm5869695ad.26.2026.10.09.02.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:36:07 -0700 (PDT)
Message-ID: <443818dc-5555-4f65-88d3-6876505baae6@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:06:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: inconsistent regdb for QCN9274
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-firmware@kernel.org
References: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
 <70e4a7fa-6595-46da-8465-38906a41a6f3@oss.qualcomm.com>
 <art3FqNHatt7zjLZ@FUE-ALEWI-WINX>
Content-Language: en-US
From: Thirusenthil Kumaran J <thirusenthil.j@oss.qualcomm.com>
In-Reply-To: <art3FqNHatt7zjLZ@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8b589 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KmqpvK4wijeBTWolkK4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ChmOGax2IabvGqwgCEqMocqGPmsII_TS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzOCBTYWx0ZWRfXx/kE59emEJw9
 X3jqwXgsOmRlV2okrb9qt4NCYCTJ46dhRraW1bP+gi4/ocP0nYlDLMYX3zchwpNvlB0/6SfIW6a
 LFag3Yj2ImZQTHXYqg6SqTxLcKEK/xs=
X-Proofpoint-ORIG-GUID: ChmOGax2IabvGqwgCEqMocqGPmsII_TS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzOCBTYWx0ZWRfX4nfEKmCfPGio
 loT8LcicMzgPP8kE2m66unOktUTfXPi5L2bq12b+ge7d9C96VojG59N5iwBA6RbtBprPKDndPdO
 4Ai+fSj1ycCc0Q9FZJWY7/FspjiDYpQEyzepYwncTr3hpF+3ZmLbkzxhOToTMrlh+DQxt4UuewO
 cJqCYzXfJo76Qm4Bo4QjHlnZYaZgCMHiCf54zaWWi8ibtW3/y3zb+BtOFH30pJyaBkq4Sw+AXuG
 eM8KvykAwiFKrI4xZBI0h1dPfiIObWVmOJ7zpIVdewLxPtyQp0NbugHdev04VDoAZAHyVW3+FdY
 o2adrhNPzrASmS9+N+kKmfvxt6is+6AMTi+99nSzEOsdUzTiZQMRWGNjLntYNXdsVcCyPi2RgjE
 SkNtq+1LCjl95+YUfO5m/c/cDM0AcjCxF0OZbLcqjQQOhLysMpNHJb5D7o4Gquq3j0sL2FWwf3H
 cpCAx2WTkF2fYeSryvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_023610_667386_E6D59A52 
X-CRM114-Status: GOOD (  31.64  )
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

On 9/29/2026 2:00 PM, Alexander Wilhelm wrote:
> On Fri, Sep 25, 2026 at 01:36:39PM +0530, Thirusenthil Kumaran J wrote:
>> On 9/8/2026 12:16 PM, Alexander Wilhelm wrote:
>>>
>>> Hello Developers,
>>>
>>> I am using QCN9274 chipsets with the `ath12k` driver on my devices. As far as I
>>> can tell, the driver uses the regulatory database from the `board-2.bin` file.
>>> However, some country definitions do not appear to be fully implemented, as the
>>> values differ from those in Linux's standard `wireless-regdb` repository. I even
>>> downloaded the latest `linux-firmware-20260810.tar.xz` and do not see any
>>> related changes there.
>>>
>>> For example, when switching to DE, I see the following values:
>>> * Channels 52-64: 23 dBm; I would expect 20.0 dBm
>>> * Channels 100-140: 30.0 dBm; I would expect 26.0 dBm
>>> * Channels 144-173: (disabled); I would expect 13.0 dBm
>>>
>>> US also appears to be inconsistent:
>>> * Channels 36-48: 30.0 dBm; I would expect 23.0 dBm
>>> * Channels 169-173: (disabled); I would expect 30.0 dBm
>>>
>>> I am aware that `wireless-regdb` is intentionally restrictive in some cases. For
>>> example, there are rules where 26.0 dBm is used instead of 30.0 dBm because it
>>> is implicitly assumed that TPC is not supported. Therefore, some differences may
>>> be expected.
>>>
>>> However, the values above still appear to be incorrect. Could someone at
>>> Qualcomm please investigate this and fix the regulatory information if it is
>>> indeed wrong? If the current behavior is intentional, I would appreciate an
>>> explanation of how these limits are derived, as they do not seem to match either
>>> the `wireless-regdb` entries or the applicable regulatory requirements. Thank
>>> you in advance.
>>>
>>>
>>> Best regards
>>> Alexander Wilhelm
>>>
>>
>> Hi Alexander,
>>
>> Our internal regulatory team is reviewing the source and rationale for
>> these values. We would also like to confirm which BDF was selected on
>> your platform during boot.
> 
> Hi Thirusenthil,
> 
> Thank you for your response. I am using a WLE7002Exx cards from "Compex Systems"
> and have also received the corresponding custom BDFs. I then added them to
> board-2.bin using qca-swiss-army-knife. For the regdb, I am using the default
> version that comes with the kernel (the one with ID 255).
> 
>> Could you please share the following details from the affected platform?
>> - The exact platform/board model, or RDP number if applicable which is
>> used with the QCN9274.
>> - The complete dmesg output from the affected boot.
>>
>> In particular, please include the ath12k QMI target-capability messages
>> containing information similar to:
>>
>> chip_id, chip_family, board_id, soc_id, fw_version,
>>
>> These messages are printed from the 'ath12k_qmi_request_target_cap()'
>> function. They will help us identify the chipset, board ID, SoC, and
>> firmware version, and correlate the selected BDF with the regulatory data.
>>
>> For a quick filtered view, you may also run:
>>
>> dmesg | grep -i -E 'ath12k|board|bdf|chip_id|fw_version|fw_build|soc_id'
>>
>> With these details, we can verify whether the reported channels are
>> included in the selected BDF and continue investigating the regulatory
>> limits.
> 
> The wireless modules are running on our in-house board based on a PowerPC64
> T1023 platform. I am using OpenWrt v25.12.5 with wireless driver backports from
> v6.18.26. The board-2.bin currently originates from v6.12.94. The dmesg output
> (without debug messages) is provided below:
> 
>     user@host-A:~# logread -e ath12k
>     ath12k_pci 0001:01:00.0: BAR 0 [mem 0xc00000000-0xc001fffff 64bit]: assigned
>     ath12k_pci 0001:01:00.0: MSI vectors: 1
>     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0002:01:00.0: BAR 0 [mem 0xc10000000-0xc101fffff 64bit]: assigned
>     ath12k_pci 0002:01:00.0: MSI vectors: 1
>     ath12k_pci 0002:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0001:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
>     ath12k_pci 0001:01:00.0: memory type 10 not supported
>     ath12k_pci 0001:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1005 soc_id 0x401a2200
>     ath12k_pci 0001:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>     ath12k_pci 0002:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
>     ath12k_pci 0002:01:00.0: memory type 10 not supported
>     ath12k_pci 0002:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1008 soc_id 0x401a2200
>     ath12k_pci 0002:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>     ath12k_pci 0001:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
>     debugfs: File 'ath12k' in directory 'phy0' already present!
>     ath12k_pci 0002:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
>     debugfs: File 'ath12k' in directory 'phy1' already present!
> 
> 
> Best regards
> Alexander Wilhelm


Hi Alexander,

Thank you for providing the platform details and dmesg output.
The logs help us identify the two QCN9274 devices and their reported
board IDs. They also confirm the firmware being used.

As mentioned earlier, our internal regulatory team is checking the
reported TX power restrictions against the regulatory database and
reviewing the source and rationale for the DE and US entries.

Since you mentioned that you are using custom BDFs from Compex Systems
and added them to board-2.bin, having the exact final board-2.bin or the
corresponding custom BDF files would be very helpful. This would allow
us to inspect the hardware-specific frequency and channel limits and
rule out any issue specific to the custom BDF.

If possible, could you also let us know whether the same behavior is
observed with the unmodified default BDF? If so, we can continue the
analysis from our side without requiring the custom BDF.

Please share the dmesg output from the default-BDF run as well,
including the board_id and firmware-information messages.

Best regards,
Thirusenthil



