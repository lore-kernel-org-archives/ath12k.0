Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F3DE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 05:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBLyxeCQ19FwP7e+jJ5DXrk/JRU+KOlh51Lq5aNRTp8=; b=rNUCz9pl3vuUWQmGBN4x4/c+uQ
	qLlsi4H4RcrI1rwljBRuwbADgb0jWJfwVwb4tzCh46ge3q/0TDV9C32cyYDWw42qwE0iAg2i070bf
	vX7fZUB2gdRZrGFxd0DWdFgnvFpzwu94U74Lil9vd8Hk4oN/Rm91vS0B4bqejnWJPnPMgpU3blE74
	5FplYsG7Vw4WW1VFRU2FFmeI+3EVqsNr1s9/qZl41kw21csPw4P9XJnFqIMGuEjZvYApYelxLF194
	v9QFO6M4qNB4sIVZ1FajzqaNmbM8rjkwbu7oFg1W4ABZ4lZiKVB7kLjiFsmtgnMc0zJQOZjM5no2z
	iXkfgW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW83b-0000000E86Y-1XqK
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 05:59:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW83Z-0000000E866-02WK
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 05:59:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3bcpm002618;
	Fri, 10 Jan 2025 05:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBLyxeCQ19FwP7e+jJ5DXrk/JRU+KOlh51Lq5aNRTp8=; b=aSNNbnuz2uum7uhe
	EdeNE3PRPk4q9ujNiO7lL010hGECX8CoOWIGU3HzkVlrxgU7bHKP7Eh52yXurZ4f
	jqd/U7qRglrBM53YliVxW+k73DAud6yt2LGseXon95Sn5CHs55xcvKoWAK81LIHS
	1FuUdP6QyGQQMgq+9Phd+fztMyN3XQXYvrWhaaGhsYhmY1zl4PwmW41CahdFznMN
	s6nfqVDmKvdp32Hwlsm25vjRltVVAIunLFE/ybnZs7BNo7p+RASP9dNMbOMyyv9N
	dOXRUKpeYwpgMbMgKtSsGsmkG6FuxN33tKSTL8kw6ZwJPzRQ5+IV39rgj7f0OSwx
	tH7LdA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442uteg8fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 05:59:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A5xdvU019397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 05:59:39 GMT
Received: from [10.152.193.243] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 21:59:37 -0800
Message-ID: <f90aac76-30e6-48b0-8d0d-1f576ecc6683@quicinc.com>
Date: Fri, 10 Jan 2025 11:29:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] wifi: ath12k: Disable MLO in Factory Test Mode
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
 <20250109183551.1028791-6-quic_aarasahu@quicinc.com>
 <173844c1-b7c6-4aad-b414-d32b761b91df@quicinc.com>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <173844c1-b7c6-4aad-b414-d32b761b91df@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AM8kNcoyPBSs_9oiGifynGvOPIYQz4pY
X-Proofpoint-ORIG-GUID: AM8kNcoyPBSs_9oiGifynGvOPIYQz4pY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_215941_172977_E82D07AD 
X-CRM114-Status: GOOD (  21.45  )
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



On 1/10/2025 10:29 AM, Aditya Kumar Singh wrote:
> On 1/10/25 00:05, Aaradhana Sahu wrote:
>> Factory test mode(FTM) is supported only non-mlo(multi-link operation)
>> mode. Therefore, disable MLO when driver boots in FTM mode.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.c | 5 ++---
>>   drivers/net/wireless/ath/ath12k/qmi.c  | 4 ++--
>>   2 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>> index d0cf82ca6dae..6705e33074aa 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -1630,10 +1630,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
>>               return NULL;
>>           }
>>   -        if (ath12k_core_get_wsi_info(ag, ab) ||
>> +        if (ath12k_ftm_mode || ath12k_core_get_wsi_info(ag, ab) ||
>>               ath12k_core_get_wsi_index(ag, ab)) {
>> -            ath12k_dbg(ab, ATH12K_DBG_BOOT,
>> -                   "unable to get wsi info from dt, grouping single device");
>> +            ath12k_dbg(ab, ATH12K_DBG_BOOT, "grouping single device");
>>               ag->id = ATH12K_INVALID_GROUP_ID;
>>               ag->num_devices = 1;
> 
> Why to even bother and check group list to see if a grp already exist
> and if not then create a grp and then check ftm_mode?
> 
> I think better would be to have something like below?
> 
Sure, Thanks for suggestion.

> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1598,6 +1598,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
>  
>         lockdep_assert_held(&ath12k_hw_group_mutex);
>  
> +       if (ath12k_ftm_mode)
> +               goto invalid_group;
> +
>         /* The grouping of multiple devices will be done based on device tree file.
>          * The platforms that do not have any valid group information would have
>          * each device to be part of its own invalid group.
> 
> 
>>               memset(ag->wsi_node, 0, sizeof(ag->wsi_node));
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index 5c3563383fab..344c12b3b937 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>>   /*
>>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>     #include <linux/elf.h>
>> @@ -2265,7 +2265,7 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>>           goto out;
>>       }
>>   -    if (resp.single_chip_mlo_support_valid &&
>> +    if (!ath12k_ftm_mode && resp.single_chip_mlo_support_valid &&
>>           resp.single_chip_mlo_support)
>>           ab->single_chip_mlo_supp = true;
>>   
> 
> Better place would be to set ag->mlo_capable as false in
> ath12k_core_hw_group_set_mlo_capable() ?
> 
Sure, will address in the next version.


