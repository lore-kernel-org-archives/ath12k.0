Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8B3C4345F
	for <ath12k@archiver.kernel.org>; Wed,  1 May 2024 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRpm/sdx8K4n8j1vToaQ8zfiJF4VvppikFnC1BBmYhc=; b=Ly32bUkPfnGv3aPxAenBc66HCK
	GixnIkznFLRVVRp6PdroFz+DI3s7HoirmmIxznsykgZJvts9LWzp3VQ2bdJ9sTHkyecTPs9pDvZpr
	woBmbEIneEKlIgUWltJCQ2Vrd0w98lPB2yaxf8fMn8Vzki6UqYrTHhljalToycnqQKagEgcMe3Lya
	SaaBv48oqwVywuup06VdXgzWbMf7qSg606f9mtY9RcZOEVOhrJxXemN+82OXSWFxb7jrlD3PiR7Bi
	f6daOT9IwVO+dV04TJuupd08h7p9qhqwj3AKXqghztRO6Pxwy6WqYveqRMnXqViPgbWq907j/gwV3
	+B/iQ2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DF5-0000000AESY-1BQQ
	for ath12k@archiver.kernel.org;
	Wed, 01 May 2024 16:55:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DF2-0000000AERF-0Tl3
	for ath12k@lists.infradead.org;
	Wed, 01 May 2024 16:55:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 441Go61Z020952;
	Wed, 1 May 2024 16:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=XRpm/sdx8K4n8j1vToaQ8zfiJF4VvppikFnC1BBmYhc=; b=ZS
	H31iQmRY4scxDiFPwxDu5mRwTv+I0ii1g730E0YluOQsmr6V0VUyRdQCVS4cvXe+
	eyPAbjCwkNpDmSjuNDprEXPBEv3qd9gaNOUoW9TD9nnfKxL41wuNkxDvd3xHFulc
	o8IRIIj5VO/rqje8h/YBGvUzc/JAfzwSyn0wspmPvmNoxdUTN33Ydvv1I4mgtHNE
	JbG69n9qjBfWsyc7ld37Fa9m5BzQzidJ8BfXQH+FI9WqFxXOYL8A7/hi/pID5a7x
	gIByorwn7LK0XIrIh9VreFcR0XTzS24z12yjG7H09onL0U9i82rLWEaxaUdtECym
	DzgjAA1m48fJBYte8l9w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xu71ja0k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 16:55:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 441GtVNq011542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 May 2024 16:55:31 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 1 May 2024
 09:55:30 -0700
Message-ID: <b9fe599c-a0fb-40ad-9cde-0bd311ce17b7@quicinc.com>
Date: Wed, 1 May 2024 09:55:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] wifi: ath12k: Introduce device group abstraction
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240425055759.1181165-1-quic_hprem@quicinc.com>
 <87le4voyka.fsf@kernel.org>
 <824269da-c69d-668b-4e6b-d0453c4572c1@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <824269da-c69d-668b-4e6b-d0453c4572c1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6gbE9shhYxB5viRE32Y36hov9MjMSKw1
X-Proofpoint-ORIG-GUID: 6gbE9shhYxB5viRE32Y36hov9MjMSKw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=621 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2405010119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_095536_194266_EE437700 
X-CRM114-Status: UNSURE (   7.56  )
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

On 5/1/2024 8:34 AM, Harshitha Prem wrote:
> 
> 
> On 4/30/2024 5:24 PM, Kalle Valo wrote:
>> 47] WARNING: possible circular locking dependency detected
>> [  147.211599] 6.9.0-rc5-wt-ath+ #1403 Not tainted
> 
> Thank you, Kalle, for sharing the full logs. Unfortunately, I did not 
> see this warning in my testbed with QCN9274.

I didn't see it in my testing either, which caused me to look at my .config
and notice that I didn't have any of the lock debugging enabled.

Have fixed that now.


