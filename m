Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E95C02180
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQK6wvnZB1E+geozWcWMafIkL6YXB+ODUC84pVAObfM=; b=kyyGlapWuSKxTNUVzFAc1PLRzW
	Z7tq6MpTParW1uhTIciL/0tyNWwHJRJ+Ew4yLboYuCpoEGclQZ0/27zuSxWUUZqa+hP0+LLDF5/O2
	V2LIyntbI/yrecVwnwv0yZo5aTObOB9qGvJ/4VfHRT5yLwShGDitAhZJ/ZNQkj4yLga0zgc+5Zfpe
	xxugvVckE3Qg//AKHdbIq827puD8we/UUZXIESncW2bn5TDDTzjiIj4K0m7PxZJFNvBbXO58PxCXh
	P1lBtIYx5vlB/79jNKC96768F9jXwBYPs6dTAnOAhjU9FqObXU6DxH1kmKvLOYVwvBxRIOrXdoqRg
	M3NZWMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXx5S-0000000ApXI-1eLX
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 06:41:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXx5O-0000000ApWj-26c5
	for ath12k@lists.infradead.org;
	Wed, 15 Jan 2025 06:41:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F2ihZm011368;
	Wed, 15 Jan 2025 06:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQK6wvnZB1E+geozWcWMafIkL6YXB+ODUC84pVAObfM=; b=c532LagFsCfmLsg6
	h0TuLEI6q7lxz3M3HETG2z6mtDX+JCqdw/v+AsjxHe4q9hfXLw14SQ02P+bX015J
	XrBn2E6TgE+ZlJEmYIVGNc73gJkI8UOgT+gsjdhgnArvJsU+Fp2wO/rhhYJYxOBJ
	FMiG3LBpGcQBPgx40vFJ4KRJFFrxZhlM9U3yhW+nEkKQPJwzZ1nQhbkDvdNq33jp
	/Rs+VGvXorDUhme3m8OrKsdfshMYI3K1YM8G3oDqt09mR5H8GUIPgLQaStZQLBvQ
	3TB2/9VJ9w+iXzCOjUM/Oqffdij1ndnzm64wfwbpW4CwIYmilgOoya/H3wnFQu2t
	4o5SnQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4464gp8fan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 06:41:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F6f4kv007645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 06:41:04 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 22:41:02 -0800
Message-ID: <50547012-1679-4ce6-a457-f16ce58484e4@quicinc.com>
Date: Wed, 15 Jan 2025 12:10:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] wifi: ath12k: Fill pdev id for fw test cmd
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
References: <20250115042532.1509956-1-quic_aarasahu@quicinc.com>
 <20250115042532.1509956-5-quic_aarasahu@quicinc.com>
 <d2b317e0-dccc-4683-8964-3878ef61d4fb@quicinc.com>
 <c51886be-3f4e-45b6-a7c6-19596ce9b24d@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <c51886be-3f4e-45b6-a7c6-19596ce9b24d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vqOW33gUspdjGMTCG1OStkXUro9aWTSJ
X-Proofpoint-ORIG-GUID: vqOW33gUspdjGMTCG1OStkXUro9aWTSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_224106_665586_FB7D61E8 
X-CRM114-Status: GOOD (  19.64  )
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

On 1/15/25 11:11, Aaradhana Sahu wrote:
> 
> 
> On 1/15/2025 10:56 AM, Aditya Kumar Singh wrote:
>> On 1/15/25 09:55, Aaradhana Sahu wrote:
>>> Currently pdev id is not set properly. That can cause a crash
>>> if pdev id is not equal to the pdev id when firmware test
>>> command is run during AP bring up or ping.
>>>
>>> Set pdev id in function ath12k_tm_cmd_wmi to resolve this
>>> issue.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>>
>>> Co-developed-by: Rajat Soni <quic_rajson@quicinc.com>
>>> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
>>> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
>>> ---
>>>    drivers/net/wireless/ath/ath12k/testmode.c | 11 +++++++++--
>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>
>> Previous patch "[PATCH v9 3/5] wifi: ath12k: add factory test mode support" only added testmode.c file isn't it? So can't we squash this patch in that?
>>
>> Let's not introduce a bug in patch X and then in same series fix it at patch Y.
>>
> 
> This patch does not address any issues related to Factory Test Mode (FTM).
> Instead, it focuses only on the ath11k-fwtest command, which is used for
> certification testing and is distinct from FTM.
> 
> Initially, this patch was submitted independently as '[PATCH v2] wifi: ath12k: Fill pdev id for fw test cmd'
> during the internal review.
> However, Kalle suggested incorporating this patch with the FTM patches.

That is good. But that comment does not mean it needs to be a *separate* 
patch? It should be in this series that's what Kalle wanted to ensure.

> 
> As this patch addresses ath11k-fwtest command issue, that's why this is not merge with [PATCH v9 3/5].
> 

That is fine, but you are adding the file in 3/5 so why not have this 
part as well in same patch only? And let me ask this way, if you don't 
apply 3/5, will your issue exist? Probably No? Since ath12k/testmode.c 
file itself is not there before 3/5. So if you know something is 
incorrect, why introduce it in the first place?


-- 
Aditya

