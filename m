Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5E0C02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrQFLyIdh+flfNgP74gz4jh045Jz2p5sDUGhO3KBB+E=; b=yKnOlJDWY9Z5H/xXV97edFrF/w
	IXMKfv1ajxDedx7+E9UDoik3KIjY2iM3O1omtNQJ1m2WAgniywT7j5dhrR6ascK5dzbaBL5iBOjkG
	q5PEd1HrgQxsz2v4WXEeBNT8DuEGC14Z9c9UzcShJli86W6xAZPMjrK3V1KL/W3fQ7anYN4M5DSjC
	nhAbGDtLAbxm2iUwEIqb1SXlt8iQDzzoUsMxqS9UzytkOLFH6c2m7IbY1bfq4mRAJtsZcD91iQ1J3
	P7MwW/SVY9W274bEjp8UoRoQaJmIOKpboWYf474TVQLVYA0zama/qgeQTPb30bicP0ZALh3r8izup
	jhWYfdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1J7-0000000CyYL-43h6
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 17:47:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1J4-0000000CyXv-3L6a
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 17:47:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NFrp5S000356
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 17:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrQFLyIdh+flfNgP74gz4jh045Jz2p5sDUGhO3KBB+E=; b=bP5wsDZUtD5K2tvV
	hGV32/mgiSEkTcbnVGrgDcWdG5AEsaa9r0SJJtpFhokusQq1yEgpM2reyYP5lV0S
	2MOrf6PvRnRv2rb62zJx5DdrkPrFc9u9KYntUJGr7tdStxvXEX2tq5STJByOgj6/
	kfi2e2CLIcKJerc8l9rSybHHbehFQPM15b0YXKv3wNlWU6UbYDFoV3n9KDk2bBnx
	fZjiChos0nselhVzZ+1Nq4REC0QTlNK7ozWQPI9zzhPOUHniLMC5BX2/7aNc8nJ4
	3MVNrwSCQsrnPFzs6q7na6p6PwNl5w6hphUu0YeCcDnIYoGadazUr6kqpwIjdM20
	ukB4pw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44brsyg9xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 17:47:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ee6dccd3c9so2453889a91.3
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 09:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737654472; x=1738259272;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrQFLyIdh+flfNgP74gz4jh045Jz2p5sDUGhO3KBB+E=;
        b=Dbc4KjJX2C0y21gPJpb+IP0T4HImix7/byznF3Q4QGGmB+H1douMoVPoU4FeuK1rbZ
         bUkYCHUCRPw8BdkvH13jGnTFrFbgRo4xHJZvKaQ8xlyHCa+kALkXw6N6RZnEwyMebgT9
         9FT/YEMPC2vJt4zsZ5e1OGX56wefoxzAILzmB/6QazdHvJKzmxzQ7aAl4nAUEaCQWc2g
         GCHJbnKU7bAETY8Y88x2XG/ti8795TanrVxy1q0DJTDqva/+JPORbM4ahwebNfIHfhUm
         QTqa4AS4rSCb6Y/tBZXR+xRJB7dEwHpv5XjyuM9stB8aw2KuHccpiIDyuGJUul9bmyIq
         GyRA==
X-Forwarded-Encrypted: i=1; AJvYcCVVEoTML2bxcXaP9C+WyzeUesMqQP8wOckcQsWSutp5uWYyiqGQdYac18AX/Kg+kzwvNhKeSSw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlusAnMNj5Q/p0mwnAV8d4gwMPB6SAIBWEZOcExuRM/CYB/+D4
	F0QRkr385WQCDI87KBAE9HqUf3JkjBAzuxpT5kTFIpB+4RqF/hnhHF5sDU9RdUXjJHYHHo9Bl39
	/csRGPHBsJNoMdnV4tq6F4WIFjSNtgQTbjUsT9whlNCmZKe9EW891cjBAPkZE
X-Gm-Gg: ASbGnctx4HCAdWetNiKhTcY6ZtxqdFjFzAoJBpX3aS0LTt/NRUdTSQfdZmoUmwuTn0n
	XU7j3JlexbzMQ2jsavBqdqOX8Qdcxj4HPxNCg9dJfez4Jgx/QK8TRczoOptqFcsOTwwYFgzwgiz
	7jGuGzPG6J4+AKy8fKmt5O5pK+IQxs4hNVw9mgFS3pTQOvYj/kBZPt+3OLcMD6AXrqshklVzVOp
	PLR5pTt0J8iV1DvLqBKlqqZWQq5XK9NbtemlMUVkxntns40mHUn0wOBs22JbIg/PCwyocxHAkOc
	j4CGneAY/U4DjNfdZ3MjApUB1SqtgtcmPR2xBuglrpLHrunpRCX5txHRuCaD/Jg=
X-Received: by 2002:a05:6a00:1804:b0:725:9f02:489a with SMTP id d2e1a72fcca58-72dafa8382cmr34506767b3a.17.1737654471851;
        Thu, 23 Jan 2025 09:47:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2JhzpFubtHNvs+TS/dk2pw0IDu/um/xcIf8+0HRFPSeJMUAs3ed8/zHm4eve2Y7QP7XHFDQ==
X-Received: by 2002:a05:6a00:1804:b0:725:9f02:489a with SMTP id d2e1a72fcca58-72dafa8382cmr34506731b3a.17.1737654471423;
        Thu, 23 Jan 2025 09:47:51 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b3f86sm215890b3a.67.2025.01.23.09.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 09:47:51 -0800 (PST)
Message-ID: <c9c9dfb7-7198-4575-a576-d5e184ba2cba@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 09:47:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] wifi: ath12k: fixes for rmmod and recovery
 issues with hardware grouping
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250120-fix_reboot_issues_with_hw_grouping-v2-0-b7d073bb2a22@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250120-fix_reboot_issues_with_hw_grouping-v2-0-b7d073bb2a22@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fq_B4-kgCoGXi0QYWuEbEXpv2FZg8Mq3
X-Proofpoint-ORIG-GUID: Fq_B4-kgCoGXi0QYWuEbEXpv2FZg8Mq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_094754_962591_D8F334D1 
X-CRM114-Status: GOOD (  17.87  )
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

On 1/20/2025 1:48 AM, Aditya Kumar Singh wrote:
> With hardware grouping, there is a kernel crash with signature -
> 
> $ rmmod ath12k.ko
> Unable to handle kernel paging request at virtual address 000000000000d1a8
> [...]
> Call trace:
>  ath12k_reg_free+0x14/0x74 [ath12k] (P)
>  ath12k_core_hw_group_destroy+0x7c/0xb4 [ath12k] (L)
>  ath12k_core_hw_group_destroy+0x7c/0xb4 [ath12k]
>  ath12k_core_deinit+0xd8/0x124 [ath12k]
>  ath12k_pci_remove+0x6c/0x130 [ath12k]
>  pci_device_remove+0x44/0xe8
>  device_remove+0x4c/0x80
>  device_release_driver_internal+0x1d0/0x22c
>  driver_detach+0x50/0x98
>  bus_remove_driver+0x70/0xf4
>  driver_unregister+0x30/0x60
>  pci_unregister_driver+0x24/0x9c
>  ath12k_pci_exit+0x18/0x24 [ath12k]
>  __arm64_sys_delete_module+0x1a0/0x2a8
>  invoke_syscall+0x48/0x110
>  el0_svc_common.constprop.0+0x40/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x30/0xd0
>  el0t_64_sync_handler+0x10c/0x138
>  el0t_64_sync+0x198/0x19c
> Code: a9bd7bfd 910003fd a9025bf5 91402015 (f968d6a1)
> ---[ end trace 0000000000000000 ]---
> Segmentation fault
> 
> This series aims to fix this stability issue. With this now, 100+ iteration
> of rmmod and insmod works perfectly.
> 
> Also, firmware recovery with grouping is not working fine. Randomly, some
> NULL pointer crash or another firmware assert is seen. This series aims to
> fix that as well.
> 
> With this in place now, 100+ iteration of firmware recovery with one 3 link
> AP MLD up works fine.
> 
> ---
> Changes in v2:
> - Rebased on ToT.
> - No changes in 1-4, 6-10.
> - Removed regd_freed flag in 5.
> - Link to v1: https://lore.kernel.org/r/20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com
> 
> ---
> Aditya Kumar Singh (10):
>       wifi: ath12k: prevent race condition in ath12k_core_hw_group_destroy()
>       wifi: ath12k: add reference counting for core attachment to hardware group
>       wifi: ath12k: fix failed to set mhi state error during reboot with hardware grouping
>       wifi: ath12k: fix firmware assert during reboot with hardware grouping
>       wifi: ath12k: fix SLUB BUG - Object already free in ath12k_reg_free()
>       wifi: ath12k: fix ath12k_core_pre_reconfigure_recovery() with grouping
>       wifi: ath12k: fix ATH12K_FLAG_REGISTERED flag handling
>       wifi: ath12k: handle ath12k_core_restart() with hardware grouping
>       wifi: ath12k: handle ath12k_core_reset() with hardware grouping
>       wifi: ath12k: reset MLO global memory during recovery
> 
>  drivers/net/wireless/ath/ath12k/core.c | 115 ++++++++++++++++++++++++++++++---
>  drivers/net/wireless/ath/ath12k/core.h |  15 +----
>  drivers/net/wireless/ath/ath12k/mac.c  |   6 --
>  drivers/net/wireless/ath/ath12k/pci.c  |  28 +++++++-
>  drivers/net/wireless/ath/ath12k/qmi.c  |  24 ++++++-
>  drivers/net/wireless/ath/ath12k/qmi.h  |   4 +-
>  drivers/net/wireless/ath/ath12k/reg.c  |   4 +-
>  7 files changed, 163 insertions(+), 33 deletions(-)
> ---
> base-commit: e7ef944b3e2c31b608800925e784f67596375770
> change-id: 20241218-fix_reboot_issues_with_hw_grouping-0c2d367a587b
> 

Fails to apply to current ath/main

* Applying v2_20250120_quic_adisi_wifi_ath12k_fixes_for_rmmod_and_recovery_issues_with_hardware_grouping.mbx 
Applying: wifi: ath12k: prevent race condition in ath12k_core_hw_group_destroy()
Applying: wifi: ath12k: add reference counting for core attachment to hardware group
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.c
M       drivers/net/wireless/ath/ath12k/core.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/core.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/core.h
Auto-merging drivers/net/wireless/ath/ath12k/core.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/core.h'
error: Failed to merge in the changes.
Patch failed at 0002 wifi: ath12k: add reference counting for core attachment to hardware group


