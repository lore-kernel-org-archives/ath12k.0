Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0ADC4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 02:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GybkwAUQe6Jova0Ysj+7bmLjb8nEsWF8SsqRolELs+Q=; b=NY8mvuHWFVeSvgcXgMtDvRgVMZ
	1VAb+fZoZ47b0Nq/+NeEnJkZD9XO3+y4qFHjuImkqKnLh65wWfy4Xl/NERe2cR+ahb4U2HVmleFRo
	TrEGAfZVwHJVSWXYD4gJzfseFi8U8BDuivbeJpnqKYMHIWG9qELLnXv2oPHWDS2LtHy8uhnGNsbvi
	saqNRpWhcya9DRr21FJsIYZbG45dkwdr5EyD3MKjDYTcWxQ/olBFqisIt99UyuWQ1+sy46J4UqlmC
	TSiHvlLy4shw+RSu2f1C7oC1A9rp/Xw6f8aP/FhoLpYK31vkUcQNimN2s/NCoifCYcQTmeqZ1ihhe
	upt/QAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzSmL-00000002GL4-3slf
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 02:54:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzSmI-00000002GKa-3lVL
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 02:54:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O2BwSS020055;
	Wed, 24 Apr 2024 02:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GybkwAUQe6Jova0Ysj+7bmLjb8nEsWF8SsqRolELs+Q=; b=iC
	eDQ/8/WXQpz7mjph7NSVw1H1StHu5/HFjTzaWrcAasfh2+0+zeu1MHfmB3Icn3lg
	9Pl3zE4xvIv9XWSPchhHcqMRGE+SlF9OQbSumjYROr5yhjGvklzskc1B14ghWzpj
	mgxIsy+5fQbf+WJOXLrfqCKLnH039Nn67FlBRWNsZrXYYyu5QgWpZPzHrZHpLMSK
	ZsYp3Mqqvm8Ufr+/zJgjoR67xi1mJa4iWNmM7y3HIIwn43C9aUpqzDQLXf7TtND2
	5iIXGKiXc3XSeo/VfpdAKD2voIk9Pbdw+hyNAG7OkVjeNxBUEogMw4F1b9LD0ksd
	WVC1HTUSKj66Ag4A81rw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xp9aa308a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 02:54:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43O2sWEm029918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 02:54:32 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 19:54:30 -0700
Message-ID: <dab8a1a1-f086-9fe2-5e8a-10c33b620883@quicinc.com>
Date: Wed, 24 Apr 2024 08:24:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/3] wifi: ath12k: Refactor the hardware recovery
 procedures
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130060838.3895599-1-quic_periyasa@quicinc.com>
 <3a38abeb-6c00-434b-9704-8bf955c3b38a@quicinc.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <3a38abeb-6c00-434b-9704-8bf955c3b38a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xy0F4BgnCxelutRzN3SZs8GoEobi6dOL
X-Proofpoint-ORIG-GUID: Xy0F4BgnCxelutRzN3SZs8GoEobi6dOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_20,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=627
 bulkscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404240012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_195435_099229_844E2B17 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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



On 4/24/2024 2:25 AM, Jeff Johnson wrote:
> On 1/29/2024 10:08 PM, Karthikeyan Periyasamy wrote:
>> Currently, hardware recovery procedure supports multi wiphy model. However,
>> to support single wiphy model, we need to refactor the hardware recovery
>> procedure. This patchset allows the logic to work both multi wiphy models
>> and future single wiphy models.
>>
>> Karthikeyan Periyasamy (3):
>>    wifi: ath12k: Refactor the hardware recovery procedure
>>    wifi: ath12k: Refactor hardware recovery synchronous
>>    wifi: ath12k: Refactor the hardware state
>>
>>   drivers/net/wireless/ath/ath12k/core.c | 97 ++++++++++++++------------
>>   drivers/net/wireless/ath/ath12k/core.h | 25 +++++--
>>   drivers/net/wireless/ath/ath12k/mac.c  | 95 +++++++++++++++++--------
>>   drivers/net/wireless/ath/ath12k/reg.c  |  5 +-
>>   4 files changed, 137 insertions(+), 85 deletions(-)
>>
>>
>> base-commit: 17f4b952f067b1f87d14e6df4c8c216fe7a245d1
> 
> since the "[PATCH 0/8] wifi: ath12k: Introduce device group abstraction"
> series depends upon this series, is there a plan to re-spin a new version that
> addresses Kalle's concerns?
> 

yes, will respin the next version.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

