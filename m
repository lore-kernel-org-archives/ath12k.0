Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61B7C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9vVDbIRWymnD5eeoVU7r9SArOy7Qyw7Q1Uof2y9aIk=; b=GYpQbSorS23tBUb7pOcr29yjXV
	oAIhJb1zC/P2fVjyzr2KK+YlewQ4wg0y/2q+317Xnn08iYz/EdgEwuqelQoKW3Zbgfi4UX6ycZflt
	naEZ9LcndiPzIlN6lFYNirUlTRVBcbLRUfFaZTsURqSA7ACSlJ3sj99tU+gDhf10eCIZ6IeIGZq0s
	b3M266fGLe3cFUgmFMD+fH5It2n1QyaQx18qlH4b/xRTxsfErW7ojVFOGb+Z7q4bxOAIf7g+WCbee
	7jVArlMferfamRfTti0UJGRUfX7xwlPCEHNPeAesZGjh1MZfKojbNVz32FLQ1hy8LasKg1EBzyqkw
	6gA6vZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ0E-00000006MEd-1ucf
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:21:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ0B-00000006MEA-3ii6
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:21:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDWU9c007199
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9vVDbIRWymnD5eeoVU7r9SArOy7Qyw7Q1Uof2y9aIk=; b=lHa+jbQHj32XaQP3
	y9PR1+Qn/pOs5//ynAN/93aer4TZvT87AWS/71YLHNV5oFCPT8uM7c+jo9WiGyWo
	d5+GsfyuN6OAlApXbhkVAHpl1ZH7HvWGc1M2fiiJQolFR+MSWvlhIhVRmgO6RdEg
	2e2m/mpibSLRyF9mHVFAM2OQVkkzMfe4vW6WalpWMXjcR0IEsHaOZVLixm9/1k7h
	gdDJADrKounNMAL2Bidm/ZeQOIHZU7BRCAd8hA/zeZ3IFwbMT5nbDhr+6sQSbbJE
	4HrrF4SOc+U+fTSEi+A3FJHSka3XguTJ9ZlHo/vsU9YtBo2jwYluMgnHRxhxm0Bi
	/9Foxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4453tarv07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:21:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166855029eso85243895ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796090; x=1737400890;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9vVDbIRWymnD5eeoVU7r9SArOy7Qyw7Q1Uof2y9aIk=;
        b=rwMngc37stzSometdof5kV3pnBCrHRmJGPkifmIAcKs0JuaQVRpCL9LlIhe4cQenRM
         vcYv9QgrGJH2CcWPKcT3Xy1kwb1RSRNWB9t/OxKFLdA9NoWXM9w/altcCr2mvweIwQUX
         QYn/dtMwYhvIqdMvxOePuo/zelV/HQB38f4KiEDUcZDIoGk67I412y5s1Cl/aIxMTo9b
         4wc6q0KeEwsKTXycJAWe+s3mQFF5hSkFyfV/2BdBGhuCnoTgMmojwpPHZ9jHYxbvT5D2
         3SI26luUsYot5NFqQFn+SklKHrspCjcKuPAeo7HiVoKYZJkD7LaFjUgpp3I3LVLQnLtF
         TneQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaH+g40re4Ha5VSESbb9mmIOLIes5TvwJ+9e4yK+OieDOBYvJWLlL41xAadmMRSIgg/+SkQ/Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeIvT05Q98HyYqbvbcnv4zfaRIMDfvWY68ZJm0mcMBob1aopaP
	pEYeJSF5Cs5vFvg40oEEWJ+N+g4RjRbUIIkn6BoYC2eIKWHC0eTH4YMyJsqGUC33e1KFG1qt+F0
	OQ9YNN4qmjfLAf9bF1nb4DUvTZkjeTonU06jSPw1n7mYxFB0yKEfHfMO0aFxp
X-Gm-Gg: ASbGncs7Qya9IAxPJY406q0xCHr/9THnrFjeMQJTHPJc7EKX8xR40R0TWDdgbU+AfOB
	nOnPGp4lqc4CaHcPOIhl6vFqiXhPMpEffDxvSxF1dyRKYFVFd/YH2C/8zXSA4U+UBPTkg7Yz4Ck
	7ETB8AwbuHX2fBZQGLLxcQcXniSvCUxR2SyM2FuHZm2I80vf8D8cI2w5orPUtDZNXtD8S07+2Rb
	WOEi0jYZOMVUUFx36xVUoSJN11limLrFYyTA553dBXIsCj53XiKqBB+c8bHSEE3jvoM2XHdG+3N
	hRA9jKOxRwjXC12dk+xuz5v2a5P4aPEWwObTMOG9LwFYZ/lGIQ==
X-Received: by 2002:a17:902:e5ce:b0:215:8ca3:3bac with SMTP id d9443c01a7336-21a83f4e46fmr293950895ad.16.1736796090374;
        Mon, 13 Jan 2025 11:21:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoRfY9+/565KAx7ktGhzlpZoEHUY4KiHXTYSSmODFBQOK5p4BjNwZRLI83gbTChHxacB3Hhw==
X-Received: by 2002:a17:902:e5ce:b0:215:8ca3:3bac with SMTP id d9443c01a7336-21a83f4e46fmr293950495ad.16.1736796089934;
        Mon, 13 Jan 2025 11:21:29 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f4d7sm56074695ad.10.2025.01.13.11.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:21:29 -0800 (PST)
Message-ID: <22fdc80a-7ad9-4305-8435-0422d201b1ce@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:21:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] wifi: ath12k: fix SLUB BUG - Object already free in
 ath12k_reg_free()
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-5-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-5-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8I9h_6C2aDvbnbT-yg-GxISNrPD0TWyz
X-Proofpoint-GUID: 8I9h_6C2aDvbnbT-yg-GxISNrPD0TWyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112131_941882_7E9408BB 
X-CRM114-Status: GOOD (  27.61  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> During rmmod of ath12k module with SLUB debug enabled, following print is
> seen -
> 
> =============================================================================
> BUG kmalloc-1k (Not tainted): Object already free
> -----------------------------------------------------------------------------
> 
> Allocated in ath12k_reg_build_regd+0x94/0xa20 [ath12k] age=10470 cpu=0 pid=0
>  __kmalloc_noprof+0xf4/0x368
>  ath12k_reg_build_regd+0x94/0xa20 [ath12k]
>  ath12k_wmi_op_rx+0x199c/0x2c14 [ath12k]
>  ath12k_htc_rx_completion_handler+0x398/0x554 [ath12k]
>  ath12k_ce_per_engine_service+0x248/0x368 [ath12k]
>  ath12k_pci_ce_workqueue+0x28/0x50 [ath12k]
>  process_one_work+0x14c/0x28c
>  bh_worker+0x22c/0x27c
>  workqueue_softirq_action+0x80/0x90
>  tasklet_action+0x14/0x3c
>  handle_softirqs+0x108/0x240
>  __do_softirq+0x14/0x20
> Freed in ath12k_reg_free+0x40/0x74 [ath12k] age=136 cpu=2 pid=166
>  kfree+0x148/0x248
>  ath12k_reg_free+0x40/0x74 [ath12k]
>  ath12k_core_hw_group_destroy+0x68/0xac [ath12k]
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
> Slab 0xfffffdffc0033600 objects=10 used=6 fp=0xffff000000cdcc00 flags=0x3fffe0000000240(workingset|head|node=0|zone=0|lastcpupid=0x1ffff)
> Object 0xffff000000cdcc00 @offset=19456 fp=0xffff000000cde400
> [...]
> 
> This issue arises because in ath12k_core_hw_group_destroy(), each device
> calls ath12k_core_soc_destroy() for itself and all its partners within the
> same group. Since ath12k_core_hw_group_destroy() is invoked for each
> device, this results in a double free condition, eventually causing the
> SLUB bug.
> 
> To resolve this, a new member regd_freed is introduced in the ath12k_base
> object. Once regd is freed, regd_freed is set to true. This ensures that
> in the removal context of other devices, regd is not freed again if
> regd_freed is already true. And since there could be a race condition to
> read this member, guard ath12k_core_soc_destroy() with the mutext lock.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 2 ++
>  drivers/net/wireless/ath/ath12k/core.h | 1 +
>  drivers/net/wireless/ath/ath12k/reg.c  | 8 +++++++-
>  drivers/net/wireless/ath/ath12k/wmi.c  | 4 +++-
>  4 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 299d7686616b78752164d9cb064c1805af9a1155..72e6e3a0cf7be03b20b7421866c479dfcb8038ff 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1757,7 +1757,9 @@ static void ath12k_core_hw_group_destroy(struct ath12k_hw_group *ag)
>  		if (!ab)
>  			continue;
>  
> +		mutex_lock(&ab->core_lock);
>  		ath12k_core_soc_destroy(ab);
> +		mutex_unlock(&ab->core_lock);
>  	}
>  	mutex_unlock(&ag->mutex);
>  }
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 58ebc56991af99de08e8ed783e98f742a687eddf..cc1bfcc1e65c87e30d86dad4c0bcd1905e6a2f51 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -961,6 +961,7 @@ struct ath12k_base {
>  	 * This may or may not be used during the runtime
>  	 */
>  	struct ieee80211_regdomain *new_regd[MAX_RADIOS];
> +	bool regd_freed;
>  
>  	/* Current DFS Regulatory */
>  	enum ath12k_dfs_region dfs_region;
> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
> index 439d61f284d89222e79c05d6cff8e85d0d315aad..b4d7fa1a04ca0e72728e8989c29b82d089171fc2 100644
> --- a/drivers/net/wireless/ath/ath12k/reg.c
> +++ b/drivers/net/wireless/ath/ath12k/reg.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  #include <linux/rtnetlink.h>
>  #include "core.h"
> @@ -777,8 +777,14 @@ void ath12k_reg_free(struct ath12k_base *ab)
>  {
>  	int i;
>  
> +	if (ab->regd_freed)
> +		return;
> +
>  	for (i = 0; i < ab->hw_params->max_radios; i++) {
>  		kfree(ab->default_regd[i]);
>  		kfree(ab->new_regd[i]);
> +		ab->default_regd[i] = NULL;
> +		ab->new_regd[i] = NULL;
> +		ab->regd_freed = true;

since it is loop invariant, should this last assignment be outside the loop,
either before or after the loop?

but then again, why is a flag needed since setting the pointers to NULL should
already show they are freed, and any race conditions with those pointers would
also exist with the new flag (which you have addressed with the locking change).

>  	}
>  }
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 4dd6cdf84571d3652cd03281ffa6486e3d340c42..1de6ed6cceaee3a22de63a2369358fe53fb0d638 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  #include <linux/skbuff.h>
>  #include <linux/ctype.h>
> @@ -5950,6 +5950,8 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
>  		/* This regd would be applied during mac registration */
>  		ab->default_regd[pdev_idx] = regd;
>  	}
> +
> +	ab->regd_freed = false;
>  	ab->dfs_region = reg_info->dfs_region;
>  	spin_unlock(&ab->base_lock);
>  
> 


