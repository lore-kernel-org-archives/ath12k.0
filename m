Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3626BC3ABAC
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2061bEl1csLnksK0JRW35eNhPvRK/Xk495AWAIZiW/c=; b=w/mfWjsfezKkEOmAhPfeag/o6Y
	6SPCX+ShGx726NFlFjG7z/OqfH/8RnQVkuxI/099o+OPBE2AAjhTGJfykOtfr6f4Kxm2cZLKp+sum
	j7qyuWqhyBfeW+8XOQ7XMiD9DRbDrhkIy55G9X2atKQUCVbUPmsf62xlfev7BEzm34ognTWlPwYUZ
	Q5c/UF8nD5+miSuFrGRbtwqgbkrEUB4+Xd3ByzVDrPJ2pX1M12Z1j9fCSileWuvADNqGs3cjzVSLn
	L+ZpkbbesY0o/We8GZe5pg+QsBEJ5U2jcZqW1KtGrxYcVM+aEtzy3QLeMzrb9fgpOLfc6ijlLKTXs
	booigIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIKn-0000000C6ui-42VW;
	Tue, 06 May 2025 13:27:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG0r-0000000BeFQ-31On
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 10:59:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AdBU1015425
	for <ath12k@lists.infradead.org>; Tue, 6 May 2025 10:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2061bEl1csLnksK0JRW35eNhPvRK/Xk495AWAIZiW/c=; b=RrHS5ZQ9zZ4tpPjJ
	QCH4YGAHmH8v458X9rw7DKXdheiM4Qwtnn6+0CgN2Xn+lzloPi9HEaiWr0C5pp3h
	E2F0s4zkxWMsXk15kVRNCEdTcfset1WZCP7ii0onaduaJMyhGiVzzLEo5htnjz7G
	CNlWK0XyKGTFvfS+3Di6h3lKJ8nHvVGvxwRz0DsMCo7HVrbdM4iknVE7quRknDLY
	UzERHNbNTvIdYAbNJ9bXG34HmoMT7Oj+GaAxlUo/Wn2826pOj2gjUecPUP6G1tzy
	TO8efJae5nsWB4X69BNynroRsUNvlsk6xv+wV4r8H87uCTA/IYsrkVvvma6fmrDD
	xS5dPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fguug1hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 May 2025 10:59:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-229668c8659so35168845ad.3
        for <ath12k@lists.infradead.org>; Tue, 06 May 2025 03:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746529140; x=1747133940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2061bEl1csLnksK0JRW35eNhPvRK/Xk495AWAIZiW/c=;
        b=Tpj1f5pSfpj3KyMGFPstHh75xN3gA4XMXlBIFPaPAGeUCA9CJplrRZl0tRhe40of5S
         uMq88SmGn2VZHqIs2J0XX0HwQbPlTYHlahD5uBkp8VUa1UrGGY5sR83FZWSGq5d13Tgo
         CDltXGJDAIgH+/kjyHa2eI1mLwdC6i68K0r7XhvOwy8fHvzvDfhLwZcKXaQar5F7n6Ql
         rYsDBQS4Oy0zRbWXijHwIET9MrQ1MuJnHJffw20ARqrDeQOWKjBvgBOBaPiHswE8oN5j
         qYyyVxz3HeF82tmeXsrGqTiD2zmms9aLdCpvl0SN//Cs/0J6SU8YikRQEKNVwGFNK3rn
         nN1g==
X-Forwarded-Encrypted: i=1; AJvYcCWUPEd5NWORNbunD0F23KxO4GlMVhciBTWA6wAJRrazobDvWecqMzD30hX0K+yjUaOt2NSDdX0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtIZ2xcFjrhK3yQV6I3ieMybOc8XHoFJ3tl9X9ISAqDfsAn/3Z
	/9YpuhSaWngFq9z1Mr7Ec4Vy5hkv/uk4dgAN/NCfJt4MiUCxP1ZvHbHqYop0V3WPO34kwekkD/s
	+pf6eW20mj44dsqhJ1oRieDM7pT3uU+3ec/cFqjUWBlA7UaR1AfEoUsHuP4P+
X-Gm-Gg: ASbGncsj9LXVskNtlhHE317rFM8Dy4EGzHNZvA1JPhJgijAg53HIrLnPHcqEGhj90Bh
	GPW5G10t4MxKtoYH1Ns+hKohX4Py2sVRlEVp3bWr4ttQYm1BpPXWtZiYtLIjSZ6LZLTQdEd+gBX
	B5CSIA//PUFGR1Fr7r0HO3ePkfRnqU4u3vppisI6u+IZ/jOvAQqhoJWouAOw1K4VlA+yDALW17O
	pCmkfSLmBjpV/UL1cP0GqQrVXELaYmGMj8dEMmJYNgZz0p0Ak15JEFFqGMxIC+QnsfWwvITiUZd
	elyA8cU8luOyCJjTkSJ2Aemy9G827tHNHyU+Z+Rk8FtkJJRDEUAM
X-Received: by 2002:a17:902:ecc1:b0:224:a74:28d2 with SMTP id d9443c01a7336-22e1e91a300mr138664825ad.26.1746529140039;
        Tue, 06 May 2025 03:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9hKdv8WhmblBPJFWUbCI2w+Asxgw5LONkcDr6kztSSUnlhsuIWt4AuaOUxFxXGaZWIVLFzA==
X-Received: by 2002:a17:902:ecc1:b0:224:a74:28d2 with SMTP id d9443c01a7336-22e1e91a300mr138664605ad.26.1746529139584;
        Tue, 06 May 2025 03:58:59 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e998bsm70749135ad.67.2025.05.06.03.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:58:59 -0700 (PDT)
Message-ID: <40cb5219-9324-46fd-9ded-34d151f13a61@oss.qualcomm.com>
Date: Tue, 6 May 2025 16:28:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] Add split-phy scan support in single wiphy
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250428151927.1169783-1-rameshkumar.sundaram@oss.qualcomm.com>
 <de8d2a84-6b10-4166-97b5-13ea2544fd46@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <de8d2a84-6b10-4166-97b5-13ea2544fd46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UJPdHDfy c=1 sm=1 tr=0 ts=6819eb75 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=61KrlExVhF2ann4TZ64A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: VuFgtkq5izdTbo74AN6-FSIUDakBXAyO
X-Proofpoint-GUID: VuFgtkq5izdTbo74AN6-FSIUDakBXAyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwNSBTYWx0ZWRfXytTTJ/6ufkLH
 fv68FKPjJLF4ZK6eQQUchmQdlvTEC955U8+aFv/ZtG4ARmrerY9ynyaJb+lRA9THV/GMwsQA9bg
 EIKSKJC3MdIpIHqgoSedrxXuaVoOa0zvYmbEscxzcX3nIrWDv6tA8WGsB96Ku5VF4pD1fV0LEx6
 Y7mIUsxowqhwYUNnp21nioXCoRAlLMHqxrcAQdt1W++7zoaiPCrMPgfMWH2+t5eZANi/QmcKE32
 KVCx1NBbgljWOQWcMnOyY7ZsNC38NOVSQHDXgoQD72WVIs6rkcCgdbIEzVsdFqUi0nEWQOEPPfY
 doCAsMSMShbsUWw9J1Ppc6SUtN5P/Hsgt0uMj6r0soVtIR11fVrav4VzaFrqptWI2q65PNn9BzF
 LJn+oyv9Xu/LNnA5rTdHoyLU3/P0HBRC6yoEONIqESRdkOF3PDHV0LRiqT2i/DX0NoFLWA+I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_035901_767535_A439C87A 
X-CRM114-Status: GOOD (  17.75  )
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



On 5/3/2025 2:25 AM, Jeff Johnson wrote:
> On 4/28/2025 8:19 AM, Rameshkumar Sundaram wrote:
>> When two split-phy devices having supported frequency range in same band
>> (as mentioned below) are combined into an ath12k HW group, they will be part
>> of same wiphy and hence the channel list (wiphy->bands[]) will be common
>> for all of the radios (ar).
>>
>> 1 - 2.4 GHz + 5 GHz Low band
>> 2 - 5 GHz High band + 6 GHz
>>
>> When a scan is triggered with frequency list containing frequencies of
>> both  5 GHz low and 5 GHz high, mac80211 generates a single scan request
>> to driver with both the frequencies. This is because mac80211 splits the
>> the scan request based on band.
>> This results in driver scheduling scan for both frequencies in same radio,
>> as driver always assumes that the scan request frequency list from
>> mac80211 only contains frequencies for one radio.
>> Split the scan request frequency list based on the supported frequency
>> ranges of radios in a band and schedule scan to corresponding radios.
>>
>> Since the scan request is split in ath12k driver internally, wait for
>> all radios to complete their scan and report the same to mac80211.
>>
>> Depends-on: https://lore.kernel.org/linux-wireless/20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com/
>> Depends-on: https://lore.kernel.org/linux-wireless/20250417073954.632994-1-rameshkumar.sundaram@oss.qualcomm.com/
>>
>> Rameshkumar Sundaram (2):
>>    wifi: ath12k: Prepare ahvif scan link for parallel scan
>>    wifi: ath12k: Split scan request for split band device
>>
>>   drivers/net/wireless/ath/ath12k/core.h |   4 +-
>>   drivers/net/wireless/ath/ath12k/mac.c  | 197 +++++++++++++++++++------
>>   drivers/net/wireless/ath/ath12k/mac.h  |   7 +-
>>   3 files changed, 160 insertions(+), 48 deletions(-)
>>
>>
>> base-commit: 21346cd925c2567d5f56cdb1421c94815ac10221
>> prerequisite-patch-id: 621a0dbeb6269fcaf27c808f951d9e2a2c3ac8f7
>> prerequisite-patch-id: a9eebd8a3cc3b1ed9ed3574ce9fee088af9c5798
> 
> While this series applies cleanly on top of ath-next + the dependencies, it
> does not apply cleanly on the pending branch (which already contains the
> dependencies).
> 
> Can you please rebase on ath/main-pending, and post a v2 with ath-pending as
> the destination branch tag? Don't worry if the patchwork bot ignores it due to
> an unknown branch tag.
> 
> /jeff


Sure, will rebase on ath/main-pending and post it.

-- 
--
Ramesh


