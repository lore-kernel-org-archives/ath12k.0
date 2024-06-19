Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49EDC27C53
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 03:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXVAOMw1KpkcPBNALFhvUh1q5B92hsJFwdBP9PO5TGI=; b=yPsfZtsskTQ3W3mOgeoheZtFdB
	A1kx6RauH3WMhwwRCYWJs6p8u9f+rkto+9PhZCpOrldlOP8tBCXeP/14k/qbKiv4cg+ym24zIy223
	2gtQCdn2WwfM2xkxIUs4ph0d8RktVaz0qpaoR98sW6fYzM4QUDzY29fBRoZI/nVkUbXJUkdRmC0/8
	GNKomy5Ed+EGKx+24h6XPQVZp7sqINlMaLeqxh9hay4tzMpB8jq3ihzj3RKJRZMOi5XkAhkCKoMyM
	iEDV60l1uUHlHLk8O94JUqOeea6lJO9DEza/LlSXXnFOgdP1I6/Kuv18bMFFdLmTTR8uj6HT7PvDe
	P/3psVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJmBe-0000000HIyj-0tdw
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 03:40:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJmBb-0000000HIwG-3IXX
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 03:40:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILb03A027906;
	Wed, 19 Jun 2024 03:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXVAOMw1KpkcPBNALFhvUh1q5B92hsJFwdBP9PO5TGI=; b=WjzSoMpz4YF6mk77
	SDPi0bDMdBwiBDiDl3OA6fradLbQys8KlPk6++3Mj7Z/y2NQSsYXIDIsEtAsRJ0B
	w1JcmTQAnvuSXi6CpFnqqnufEENHtk8tBa/3NP8Mjg6jFjn+StHxarHxmzmBTOwA
	6aZ2gFRsRB9JLlMsxk+pEw4iBJWLNqL9yb1OWw7KMfhXmdVKrKAdC82ynSJq3o9d
	mdQVqrhXoCBOvca/ANfK9ia+4PAxEt7vAgW7K/4vq/mxKFZOfWYrFEKzsRMctggr
	yGSEJhR70QC2DxAiCIxp/Vupu3w0iNtTRgq4Z+F6aol6Kywh+h/tqNVX3Yk+CISe
	2eCYKA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9yrj9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 03:40:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J3eXg0021163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 03:40:33 GMT
Received: from [10.152.193.243] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 20:40:32 -0700
Message-ID: <507c6ea1-388b-45b4-97e4-67f5a55e0bd5@quicinc.com>
Date: Wed, 19 Jun 2024 09:10:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] wifi: ath: create common testmode_i.h file for ath
 drivers
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240617052903.2720292-1-quic_aarasahu@quicinc.com>
 <20240617052903.2720292-2-quic_aarasahu@quicinc.com>
 <255df1aa-8d06-4d6e-82f0-577aff3ebe5f@quicinc.com>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <255df1aa-8d06-4d6e-82f0-577aff3ebe5f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4IgGmr07CzLRYuvj0d5CH7yKK25Uo2tB
X-Proofpoint-GUID: 4IgGmr07CzLRYuvj0d5CH7yKK25Uo2tB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_08,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=644 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_204039_975716_BCC70176 
X-CRM114-Status: GOOD (  13.84  )
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



On 6/18/2024 3:09 AM, Jeff Johnson wrote:
> On 6/16/2024 10:29 PM, Aaradhana Sahu wrote:
>> User space application requires that the testmode interface
>> is exactly same between ath drivers. Move testmode_i.h file
>> in ath directory to ensure that all ath driver uses same testmode
>> interface instead of duplicating testmode_i.h for each ath drivers.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/testmode.c    | 78 +++++++++----------
>>  .../wireless/ath/{ath11k => }/testmode_i.h    | 54 ++++++-------
>>  2 files changed, 66 insertions(+), 66 deletions(-)
>>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
>>
> ...
>> diff --git a/drivers/net/wireless/ath/ath11k/testmode_i.h b/drivers/net/wireless/ath/testmode_i.h
>> similarity index 50%
>> rename from drivers/net/wireless/ath/ath11k/testmode_i.h
>> rename to drivers/net/wireless/ath/testmode_i.h
>> index 91b83873d660..ac852642bde1 100644
>> --- a/drivers/net/wireless/ath/ath11k/testmode_i.h
>> +++ b/drivers/net/wireless/ath/testmode_i.h
>> @@ -1,59 +1,59 @@
>>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>>  /*
>>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> this should be
>  * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> 
>>   */
> 

Sure, will update in the next version.

