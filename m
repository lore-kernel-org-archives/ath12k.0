Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FFFC4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 04:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nblxhXYkAXAZVwap7pH+eW8JayGCJBu1tUBVT9ImzfA=; b=Re6T9VYsX9T6FmKYePtf8ZmhsI
	SAq9P2mafugCVF4TBW15VzBRfKJa2FiAAEMh8Xe18gYFkTez+uKavtqryNTVS16sT4hV6S5DNXNbk
	ztFrMKlPhhV3b4tySMX+QMCACopImX95tgiLKf2/yr+Gy+DeD7+QrdGHcOo+74MJSCnfKu6wW3CbF
	SnVzh3GLtfgP15LHpQxp5gF+nIZY/pxXtnDLzhMwwoMevJtUP0huLS78xh2Km6WvstS/510J7etE6
	yzSmQZJbhxHN2rLgkX51+ixeu/uMIvWcQ2rzersDGLFANL9V3HMezW/IqpIyhbp2UqsZnPt1wGUKX
	A6VYaw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzUXM-00000002Zme-1Gz6
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 04:47:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzUXJ-00000002Zm3-1U78
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 04:47:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O2Om3W003007;
	Wed, 24 Apr 2024 04:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=nblxhXYkAXAZVwap7pH+eW8JayGCJBu1tUBVT9ImzfA=; b=iK
	Zi0ZT/c6DSDNmf/U2ZbO2/61o81ZboRF46hCAzBT3MUbtIpyLom9SeWxTOB0XpX8
	xMIFOoGm3CTNvDmQaS5WRfH1L5Dlyh1JoWfbnb0sxWeDymdQJyzDrqezUW2mWbO9
	oiUw2P0ErpLv73dnlJu85nrkiQcWASRKlEYUN1MQoOHV1iaclJgd1aA4YbI2GZTb
	uK7UoTEq6jaieBpZ6Kp0mHX42RFvViAXKSU4xjxHK44GgbIFIrvQSfbbxK5it9Ud
	ZagxHuED5yIiTPAntJAUsqxlC1YzHjLAcY8itr38Sj9rOYbJFDdKsfXCHv+lfnh1
	Y+zJL0JmTmYnAvzylUWQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xppn5gfse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 04:47:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43O4l7H0015981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 04:47:07 GMT
Received: from [10.151.41.99] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 21:47:05 -0700
Message-ID: <cf025908-8e88-f60c-6466-9fdf1bccff09@quicinc.com>
Date: Wed, 24 Apr 2024 10:17:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH 0/8] wifi: ath12k: Introduce device group abstraction
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240420083750.1545670-1-quic_hprem@quicinc.com>
 <878r14v2o4.fsf@kernel.org>
 <57002bbf-2c85-4fa7-b249-4bd3f2ba1bcf@quicinc.com>
 <8734rbidcg.fsf@kernel.org>
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <8734rbidcg.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3rtB8pnUaMIBfRkaI4YQUuEQxg7Bq_i3
X-Proofpoint-ORIG-GUID: 3rtB8pnUaMIBfRkaI4YQUuEQxg7Bq_i3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_02,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404240019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_214713_439294_3C20EC64 
X-CRM114-Status: GOOD (  10.16  )
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



On 4/24/2024 10:09 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>>>> Depends-on:
>>>>          [PATCH 0/3] wifi: ath12k: Refactor the hardware recovery
>>>> procedures
>>>
>>> Are you referring to this patchset:
>>>
>>> https://patchwork.kernel.org/project/linux-wireless/list/?series=821155&state=*&order=date
>>>
>>> That was sent three months ago and at least I couldn't find a newer
>>> version. So I'll just drop this patchset for now without even looking at
>>> it.
>>>
>>
>> Yes, I'm stumped as well. the patch specifies:
>>> base-commit: c416602943dd36fbd13af7496430723935c867a3
>>> prerequisite-patch-id: a4d62344b11368fb7e549c03b6a31f7ba4c9e2bb
>>> prerequisite-patch-id: b4a1e18a85d8c1e337fa133c2bd2956c33b11046
>>> prerequisite-patch-id: b16edd310baa35e2500267e338f60c9a2e6594e1
>>
>> but lore is unable to find those prerequisite patch-ids, which leads me to
>> believe that they were rebased internally but never posted.
>>
>> I tried to apply the January series on top of the base-commit:
>> c416602943dd36fbd13af7496430723935c867a3 but it doesn't apply cleanly.
>>
>> So I think we need to have a rebased and updated "Refactor the hardware
>> recovery procedures" first.
> 
> Yeah, it's waste of everyone's time to submit patches like this which
> don't even apply at all due to missing dependencies. Please don't do
> that.
> 
Sure. Sorry Jeff and Kalle, My bad!. yes,the dependent patch should be 
rebased. Will respawn this series after the dependencies are at the latest.

Thanks,
Harshitha

