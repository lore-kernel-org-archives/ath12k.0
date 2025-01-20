Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C541C02185
	for <ath12k@archiver.kernel.org>; Mon, 20 Jan 2025 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey6PskYUd2im3bJ0UAn9xxNTl6O6OydZp86J8GorTpM=; b=yJFvEQu9xpuRDVzwvcTub93jRr
	plSjDQqz0D0ry1LIUKFwSslPBBN8DlLv/AXOiuxDj2NSA6aMt2jDEXRo1JlaQI6SRMd76OpE3mbUJ
	GHp0JYuIyR7pL9tAk1ZLwlu6An3YRjWn3z1ecbqwlOOPYXQrM8aGHqSAquN+YCOh82uPOl4uQFwzW
	oRXOZtfUODj5fbvy+ezBHW4jBQ9Zxyp34R4qqUrcq46ohm6bajE90qj8n31S1H+QfHNYsZJ/X3HB4
	3gUXStLNv28HLHvQTsjREMH4crwi4BEOhxix5h/qVSkbTz90MU+/GL82om2khptUY83hOE0Z7ZEco
	Ei+Amycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnIy-000000052gA-0EhS
	for ath12k@archiver.kernel.org;
	Mon, 20 Jan 2025 08:38:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnIv-000000052fj-3ftQ
	for ath12k@lists.infradead.org;
	Mon, 20 Jan 2025 08:38:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K4sqqd007382;
	Mon, 20 Jan 2025 08:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ey6PskYUd2im3bJ0UAn9xxNTl6O6OydZp86J8GorTpM=; b=nB20fUGfijkBHuOS
	UMve+pq3KSdL3jomGVgStZFieT2mbn5CL8hEVL4ZHBvsvF4G9ZMstdSXXBNNG2d6
	QNmjRVerj035KCSDb5DOVdNzxGbRWQxY2p39bsSMTqDZdgbkTxltWRnaxKnLOPB6
	UJBmgweXn6y1mK/mzUgUx+9L5ikVUquyy+wbr39RFtqecMuIjz68btF2L5nURfbu
	LN5tYxlFqvrFytC4Adqx2DZJkczhwD4dI7vGPxWS/KT/hQz9lBt6CfzjyaJFTbch
	Kjs2Ui+3so8PR9Q2VjknxyElEY3f8shK0traNorzc25VSi1fDtRdNRhwa9a3SGaR
	6i8Kzg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449fvj0ja3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 08:38:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K8ccbt017017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 08:38:38 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 00:38:35 -0800
Message-ID: <086df6fc-c601-4e06-8433-f87e2bd01ec5@quicinc.com>
Date: Mon, 20 Jan 2025 14:08:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] wifi: ath12k: fix SLUB BUG - Object already free in
 ath12k_reg_free()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kalle Valo
	<kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        "Karthikeyan
 Periyasamy" <quic_periyasa@quicinc.com>,
        Harshitha Prem
	<quic_hprem@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-5-fb39ec03451e@quicinc.com>
 <22fdc80a-7ad9-4305-8435-0422d201b1ce@oss.qualcomm.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <22fdc80a-7ad9-4305-8435-0422d201b1ce@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bMtLEp0tqgMdjyMmg47Asdki387G_m9H
X-Proofpoint-GUID: bMtLEp0tqgMdjyMmg47Asdki387G_m9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=873 suspectscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_003841_947011_A1F07D2E 
X-CRM114-Status: GOOD (  14.05  )
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

On 1/14/25 00:51, Jeff Johnson wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
>> index 439d61f284d89222e79c05d6cff8e85d0d315aad..b4d7fa1a04ca0e72728e8989c29b82d089171fc2 100644
>> --- a/drivers/net/wireless/ath/ath12k/reg.c
>> +++ b/drivers/net/wireless/ath/ath12k/reg.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>>   /*
>>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   #include <linux/rtnetlink.h>
>>   #include "core.h"
>> @@ -777,8 +777,14 @@ void ath12k_reg_free(struct ath12k_base *ab)
>>   {
>>   	int i;
>>   
>> +	if (ab->regd_freed)
>> +		return;
>> +
>>   	for (i = 0; i < ab->hw_params->max_radios; i++) {
>>   		kfree(ab->default_regd[i]);
>>   		kfree(ab->new_regd[i]);
>> +		ab->default_regd[i] = NULL;
>> +		ab->new_regd[i] = NULL;
>> +		ab->regd_freed = true;
> since it is loop invariant, should this last assignment be outside the loop,
> either before or after the loop?
> 
> but then again, why is a flag needed since setting the pointers to NULL should
> already show they are freed, and any race conditions with those pointers would
> also exist with the new flag (which you have addressed with the locking change).

Well, looks like, this flag is not needed. I will remove this in next 
version. Thanks for pointing it out!

-- 
Aditya

