Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867EAE77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AomeDFgSGwMC362R7pKEtJlMficun3hyRQoON7UXbyo=; b=YXJTVe2Y60+Gzh8i5rfJgfhGd8
	4JhOqKouwdWGSy2mG4xnMoJm4D4XZW5s9HGCYAt+ijZLZ4+AR342g4V9kRDzl1FSP1ZJXYawxj1os
	3UkQdhJN/rt7sPWbtb9jenRMRdmU02PsvvJiAXTeeaa1LqoAOEus8adHE4bcteL2y0aLQ8qaWgEGO
	aKKVKhSg/MK3nqKKpRJV9lyNJTe9Q773ydkJjKNhuLKur/P/3L5ozzwBsdRDQ81vNMZoQ/E01whxX
	2717ssCeQmo0/t2+Fv4COcvJBvdWLSByT7QvsXwOensN9MRLCmHUIocHdKqFDnq4p7soc8fHB9wyO
	4qlzmj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVl6s-0000000AoHv-0vsS
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 05:29:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVl6p-0000000AoGJ-2P6F
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 05:29:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50903nF5015269
	for <ath12k@lists.infradead.org>; Thu, 9 Jan 2025 05:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AomeDFgSGwMC362R7pKEtJlMficun3hyRQoON7UXbyo=; b=Z7JX46kvBeHvmV9r
	7I/2YCGtC1UGgGJysBRLPMMTj4lH07q37jSvok4GAACEeTHHdz6mzyZ6vifbwI7y
	c7q+TVkFUOWMSNPLyfHq5UQsEoiUPVjAaqRZuSvsi0KGQGpGMeE+Rb7B1lUoYfjt
	1PSCGvLGeLP7CLn1DeRs60wGrY2sLR2nLCTthx6x+sRAB4xIwaSaCvJCZpfOkNj6
	2CBCql7xslpMSAQWRHTrgooB37385M7hOY1xF4AfvCOP80U9f017XEeGsWLx8iWY
	jbfghyv2o2oqv3j/Kk0nvJfOptw9kL1a44+MNTgqbzao5mB8mvbWrKptKtSjr7/w
	dGwOCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4423jsrmdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 05:29:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso1077824a91.0
        for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 21:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736400569; x=1737005369;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AomeDFgSGwMC362R7pKEtJlMficun3hyRQoON7UXbyo=;
        b=cdixjvveiGi77x6VrHc0lXdiTyn8M2pofrWhEaxCjgPDe+SjBZNU+5giWM5CMKAJzG
         GLC0pDLN2I44MOx/AHbiq42l68Bj3Gv9v8cLhxWDRuWh+RZ+eOIk8o6rmvJPefgANHzc
         tOXdWKd4OvoXETfk0gOjvcoF1fG7EY79glzb7zDk+REO9BpZjNeor3VWbR6bNuofZvDN
         H7kLh9Q1Ra6hD9VVzPefHcy7DZxCbClp0SOIEMVjDbYmyqqlrUY+ZckfK2BbcZUWLKA0
         IUMBKpf7ZaKGKyIC46rl5KJ/G7lfFBUvepgG2MLlj3pbuVdRyGzarpQ8s+aAdHu1ca6n
         G5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUfjk02blyzidElS8oytxoI88896obR6sJ62Rq+uxahniLgWE0bFyzOQyhpCZ9R4eqstwbJjZs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9JIX+1FwUEAqp40A/0gaeqPq6QLGRmFtOaAl/jZUoBhsnD0pB
	LIsm9/V3WOBgo+disGM6n0WArplSvQOs/y3RGTruXUCeFveW3QEPmvjGQYASv2P31R9IjbhHQot
	VGfw6liElUm4lEnxE/NTL7Azguzl/ehzTZgw6WVsT+HCs1jAB4JQW47RHRfiN
X-Gm-Gg: ASbGncuN0R//YIoalE5aUJoBElY+aOMzPLDFU9o2//2FfC3elpuOhWVjLHW5HfD9Rms
	3zf0gkggL/Ts8NAG/7NwJgLLB++XnWI3lGPP8nm/iUKyXEzhBYWjE4MCceR94Xtt9YKwDD358ci
	K0f1Q5IlaKlxc3gR1BqGBDB3cP6qg+3Us7XWweskVseqztL8NamlxhnWwRPTy0/zta93SUMp3QB
	/2v3I1a8GNjfx5pYgRr/X47xXBQ/eIUpBkHDwj2fajTwA3gbL9NMZYF0Ewi7phLVnF/AHTiNs6o
	OYa9XF4dHKXxdrrBR/6jJunQEfNPLSfMaa962/83tXMhBaDD6w==
X-Received: by 2002:a05:6a00:9285:b0:725:e499:5b8a with SMTP id d2e1a72fcca58-72d21f55d89mr6401054b3a.15.1736400568845;
        Wed, 08 Jan 2025 21:29:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrCgxuWtbvMdWYVLTNLA/J3knebI2sC8L8gjBe+t3P6abGGWwoViNcMxXvAkjUpDYfeYaxOw==
X-Received: by 2002:a05:6a00:9285:b0:725:e499:5b8a with SMTP id d2e1a72fcca58-72d21f55d89mr6401029b3a.15.1736400568453;
        Wed, 08 Jan 2025 21:29:28 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72b282bae08sm22534428b3a.163.2025.01.08.21.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 21:29:28 -0800 (PST)
Message-ID: <5f05898c-cc5c-4c31-891e-9d5cb9cf5bfa@oss.qualcomm.com>
Date: Wed, 8 Jan 2025 21:29:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] wifi: ath12k: Factory test mode support
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org,
        Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
 <d38ac7f6-3596-4336-bd9d-61e99f3b070c@quicinc.com>
 <b4852e3d-1f9a-40fe-9593-84d5812d25be@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b4852e3d-1f9a-40fe-9593-84d5812d25be@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SYBSQqIO42rLl5Uqrxztzb-3HPiAMska
X-Proofpoint-ORIG-GUID: SYBSQqIO42rLl5Uqrxztzb-3HPiAMska
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_212931_753058_94DD070B 
X-CRM114-Status: GOOD (  19.10  )
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

On 1/8/2025 8:55 PM, Aditya Kumar Singh wrote:
> On 1/9/25 10:13, Aaradhana Sahu wrote:
>>
>>
>> On 6/24/2024 3:23 PM, Aaradhana Sahu wrote:
>>> Device is booted in factory test mode for calibration.
>>> The commands are sent from userspace application, which
>>> is sent to firmware using wmi commands. Firmware sends
>>> the response to driver as wmi events and driver sends
>>> these events to the application via netlink message.
>>>
>>> Also added changes related to correct pdev id access for
>>> fw test cmd.
>>>
>>> Aaradhana Sahu (3):
>>>    wifi: ath: create common testmode_i.h file for ath drivers
>>>    wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>>    wifi: ath12k: add factory test mode support
>>>
>>> Rajat Soni (1):
>>>    wifi: ath12k: Fill pdev id for fw test cmd
>>>
>>> ---
>>> v5:
>>>    -Updated copyright
>>>    -Fixed line length within 90 char
>>> v4:
>>>    -Rebased on latest ToT
>>> v3:
>>>    -Rebased on latest ToT
>>>    -Updated Tested-on Tag
>>>    -Removed second parameter of ath12k_core_start()
>>>    -Updated copyright
>>> v2:
>>>    -Rebased on latest ath ToT
>>> ---
>>>
>>>   drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>>>   drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>>>   drivers/net/wireless/ath/ath12k/core.c        |  22 +-
>>>   drivers/net/wireless/ath/ath12k/core.h        |  13 +
>>>   drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>>>   drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>>>   drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>>>   drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>>>   drivers/net/wireless/ath/ath12k/testmode.c    | 423 ++++++++++++++++++
>>>   drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>>>   drivers/net/wireless/ath/ath12k/wmi.c         |  39 +-
>>>   drivers/net/wireless/ath/ath12k/wmi.h         |  21 +
>>>   .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>>>   13 files changed, 636 insertions(+), 75 deletions(-)
>>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>>>   rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
>>>
>>>
>>> base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37
>>
>> Hi Kalle,
>>
>> Please let me know, if any thing is pending from the developer side, to merge this series into ath.git tree.
> 
> This series does not apply cleanly on latest tip. And base commit is 
> around 6 months old. So may be you would want to rebase and send a new 
> version?
> 
> Applying: wifi: ath: create common testmode_i.h file for ath drivers
> Applying: wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
> Applying: wifi: ath12k: add factory test mode support
> error: patch failed: drivers/net/wireless/ath/ath12k/Makefile:26
> error: drivers/net/wireless/ath/ath12k/Makefile: patch does not apply
> error: patch failed: drivers/net/wireless/ath/ath12k/core.c:42
> error: drivers/net/wireless/ath/ath12k/core.c: patch does not apply
> error: patch failed: drivers/net/wireless/ath/ath12k/core.h:209
> error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
> error: patch failed: drivers/net/wireless/ath/ath12k/debug.h:33
> error: drivers/net/wireless/ath/ath12k/debug.h: patch does not apply
> error: patch failed: drivers/net/wireless/ath/ath12k/mac.c:13
> error: drivers/net/wireless/ath/ath12k/mac.c: patch does not apply
> error: patch failed: drivers/net/wireless/ath/ath12k/wmi.c:7150
> error: drivers/net/wireless/ath/ath12k/wmi.c: patch does not apply
> Patch failed at 0003 wifi: ath12k: add factory test mode support
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> And since you'll be submitting in 2025, don't forget to update
> copyrights.
> 
> 

Make sure to review all the changes that Kalle made locally to the pending
version and incorporate those.

/jeff

