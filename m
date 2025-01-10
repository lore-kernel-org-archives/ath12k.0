Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30DEE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 04:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R6Ch1hWLTkLnfTiUEzZv4VOwoBlFF/FhiZgJvr0gOs=; b=fc5NDujkC8uABL2mg2ogKVKk3b
	YW38on9rJllBtpBxB+7tOjBeDi2VdQKlpakY4CG441rYvSfv8gjkNFnOtS1saIdFlQL+ESpOWM4Vq
	MKMwIbPchSr1AIDmXCMA6B7t12XXbhd2Tckir9+JS0FcXcAafU4kuXsb9AEaF84yGutRmKl9k5g3y
	5cQuyu48va5cie/oGIX/tFPv2w4GR53QvN8bS3QAPeMtiBcIgVunU3oGaCcvtSyrkgOGMF2LMwjut
	aYJkqczFajyMvV4B3EyRK3w7e/WS2GqI/dtEMbGo3g+WFVIoEnHIxG/7LNgSinEn1AU+FjyCGK+X3
	33l5Oipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW77O-0000000E0R9-1v2V
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 04:59:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW77L-0000000E0Qi-3Qie
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 04:59:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3vRoG016198;
	Fri, 10 Jan 2025 04:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R6Ch1hWLTkLnfTiUEzZv4VOwoBlFF/FhiZgJvr0gOs=; b=c/Ulaug/TAiy1dOH
	mtjzauB8VXPXkXVIINXGszz62s/mANzu+TKlkmbFn0AmFBX+eDwx5DQHjH/x9a6C
	UXGidmqW7bERwtSZsqe+0unQxybn6l3VPXiFesf7bgiz74Ox8CvJ2ZATT3Um3r0J
	w212QoBjRxjo6NPptz0HN3MVF52gF3JP1jl6jko423cKySiG7yoplrPixPwEjwYT
	UK68oCrIf4hItIL1DuZBfjQ+X17BjWLxHl51Q4B52e49Btt0TIu9S60CdEBQsc9Q
	GW/ojGZUplCap0Zl28h9dNPRXgelmavQijcx/QsbR1q/uXTNqX8Vaf7+vK39Yoa2
	wIv9dQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442v3rg3hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 04:59:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A4xSX7022907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 04:59:28 GMT
Received: from [10.216.28.93] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 20:59:27 -0800
Message-ID: <173844c1-b7c6-4aad-b414-d32b761b91df@quicinc.com>
Date: Fri, 10 Jan 2025 10:29:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] wifi: ath12k: Disable MLO in Factory Test Mode
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
 <20250109183551.1028791-6-quic_aarasahu@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250109183551.1028791-6-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d2eSDs7-2FoVOOu1_iGGEZDmkpAOl7uS
X-Proofpoint-ORIG-GUID: d2eSDs7-2FoVOOu1_iGGEZDmkpAOl7uS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=837 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_205931_868204_6016B21C 
X-CRM114-Status: GOOD (  19.77  )
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

On 1/10/25 00:05, Aaradhana Sahu wrote:
> Factory test mode(FTM) is supported only non-mlo(multi-link operation)
> mode. Therefore, disable MLO when driver boots in FTM mode.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c | 5 ++---
>   drivers/net/wireless/ath/ath12k/qmi.c  | 4 ++--
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index d0cf82ca6dae..6705e33074aa 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1630,10 +1630,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
>   			return NULL;
>   		}
>   
> -		if (ath12k_core_get_wsi_info(ag, ab) ||
> +		if (ath12k_ftm_mode || ath12k_core_get_wsi_info(ag, ab) ||
>   		    ath12k_core_get_wsi_index(ag, ab)) {
> -			ath12k_dbg(ab, ATH12K_DBG_BOOT,
> -				   "unable to get wsi info from dt, grouping single device");
> +			ath12k_dbg(ab, ATH12K_DBG_BOOT, "grouping single device");
>   			ag->id = ATH12K_INVALID_GROUP_ID;
>   			ag->num_devices = 1;

Why to even bother and check group list to see if a grp already exist
and if not then create a grp and then check ftm_mode?

I think better would be to have something like below?

--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1598,6 +1598,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
  
         lockdep_assert_held(&ath12k_hw_group_mutex);
  
+       if (ath12k_ftm_mode)
+               goto invalid_group;
+
         /* The grouping of multiple devices will be done based on device tree file.
          * The platforms that do not have any valid group information would have
          * each device to be part of its own invalid group.


>   			memset(ag->wsi_node, 0, sizeof(ag->wsi_node));
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 5c3563383fab..344c12b3b937 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <linux/elf.h>
> @@ -2265,7 +2265,7 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>   		goto out;
>   	}
>   
> -	if (resp.single_chip_mlo_support_valid &&
> +	if (!ath12k_ftm_mode && resp.single_chip_mlo_support_valid &&
>   	    resp.single_chip_mlo_support)
>   		ab->single_chip_mlo_supp = true;
>   

Better place would be to set ag->mlo_capable as false in
ath12k_core_hw_group_set_mlo_capable() ?

-- 
Aditya

