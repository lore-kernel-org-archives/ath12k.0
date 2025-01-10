Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9CAE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 05:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FohUmCBokbEDlnJcY4WnBpdH9kOFvCR+lNyHv7qoNY=; b=J6WoZ1lZEQY8ck+rmRajv/SILb
	P6mgOoktT5UjbADDJ+Xx+8Qy4IMmBGDXd7qBMOuwJ+XInhEXncbDRl7hBKRttxg4wn4do5j6m/nwn
	bHoe85NAVUzBXPLIPTq/UQPlrNqKPfMw+tqyobCQCVd60z5HfcNVj56Vljs9b+h0gBMwwo0uy/k4u
	3yi2uEy2HRsj4ZqHMvEls1m4dnfqtIihfyItJqWYAsPc5+aMUo0mF1MjVIqhG5X4vk4pBzN1j0LKK
	33zF/f0NiFJKWVH9JOzPv4Wu/YfPqRLk1Klzdl/6UMZTk7qGa808J0Sq0FHsMBK5k0qj5IWtYgbUF
	9ZTEDrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW82Z-0000000E7y1-0Xwj
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 05:58:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW82V-0000000E7xX-478J
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 05:58:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A0qwYS004132;
	Fri, 10 Jan 2025 05:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FohUmCBokbEDlnJcY4WnBpdH9kOFvCR+lNyHv7qoNY=; b=WKOmNy3OjAXQkEP2
	WXzROVFqGYQ1iUN9bz7kVptUd4MEQFKrnmWPClBlOsgXCbvGbmUmoqF9bjK7HBnl
	BZV8MKLbYHRdK3mRjUVpQn34yA90cZvH++3mGto+RM3p1SvZ4OWvViZOeersMrlL
	LZ/2pdddAaROKw3IWHY/JkKd+6ciPCpk2TZWtiqnpuJVzThhZ23p1u19zUq6lKK0
	JqGPrxzWzrejM5OnFk7Lf+a6SINMxAB/Io1bJYW9RU0aMF00hpCRbbONUObjSJOP
	U/c84Nzrx1nNvzu0PAqWePGly2+c/YBA0Zr41NXPVfAg+WQZFXToyWHFs1G38AW3
	3bzfrQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442sd90jfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 05:58:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A5wWjD018175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 05:58:32 GMT
Received: from [10.152.193.243] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 21:58:30 -0800
Message-ID: <3fcec012-49cc-4408-9f9b-a4eadd253c8d@quicinc.com>
Date: Fri, 10 Jan 2025 11:28:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] wifi: ath: create common testmode_i.h file for ath
 drivers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
 <20250109183551.1028791-2-quic_aarasahu@quicinc.com>
 <70242ecc-c353-4973-bc04-e85b89a1aabb@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <70242ecc-c353-4973-bc04-e85b89a1aabb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OiPapjZWg2NYNPHH5VXXpLKPywB949FR
X-Proofpoint-ORIG-GUID: OiPapjZWg2NYNPHH5VXXpLKPywB949FR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=700 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_215836_162322_34E1D24D 
X-CRM114-Status: GOOD (  14.40  )
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



On 1/10/2025 2:23 AM, Jeff Johnson wrote:
> On 1/9/2025 10:35 AM, Aaradhana Sahu wrote:
>> User space application requires that the testmode interface
>> is exactly same between ath drivers. Move testmode_i.h file
>> in ath directory to ensure that all ath driver uses same testmode
>> interface instead of duplicating testmode_i.h for each ath drivers.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/testmode.c    | 80 +++++++++----------
>>  .../wireless/ath/{ath11k => }/testmode_i.h    | 54 ++++++-------
>>  2 files changed, 67 insertions(+), 67 deletions(-)
>>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
>> index 302d66092b97..9d1613723601 100644
>> --- a/drivers/net/wireless/ath/ath11k/testmode.c
>> +++ b/drivers/net/wireless/ath/ath11k/testmode.c
>> @@ -1,7 +1,7 @@
>>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>>  /*
>>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023, 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> should be 2023-2025 to account for the patches posted but not merged in 2024
> 
Sure, will address in the next version.

>> diff --git a/drivers/net/wireless/ath/ath11k/testmode_i.h b/drivers/net/wireless/ath/testmode_i.h
>> similarity index 50%
>> rename from drivers/net/wireless/ath/ath11k/testmode_i.h
>> rename to drivers/net/wireless/ath/testmode_i.h
>> index 91b83873d660..b8fa5092e6ca 100644
>> --- a/drivers/net/wireless/ath/ath11k/testmode_i.h
>> +++ b/drivers/net/wireless/ath/testmode_i.h
>> @@ -1,59 +1,59 @@
>>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>>  /*
>>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> should be 2023-2025 for the same reason
> 
Sure, will address in the next version.

> 


