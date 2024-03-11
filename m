Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91660C5475B
	for <ath12k@archiver.kernel.org>; Mon, 11 Mar 2024 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7Dp36XIRZci1e5RvL9nsj3SXLGUWZgJu26vBQO0YQ4=; b=3e6etp8b0cRW2tFt/Y2p6WAR69
	wDJHOz/TYf+FL9hVKU64Z0lTvEOP34fDo5qH8GPLGE4Eq4BJRw/JT65WvT53jA2d72ILtzzdbqHHK
	wybNWEpyLEK0G74rSTMCx0otVHR+1+gMj9oOuCRIrwLf7iEVCGwNmUYTiBt3xD+PgHF/tF7sOiWRH
	RL9D7L2LRkNtGcfPnDTQ/MsH+Wp+QXwJnMNVsOw360alkYTCKip8akI2CJgsMU9jZ4L6OxNu1MIMW
	Vq812t75S9RUgd2xPCsW138AF2gH2TLVQGgPMI+YRd5mJRK9Q7DdRiWZNOxUHcZQ/LY5Ct52DfuSj
	WMuv/S1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjg7h-00000001hBk-0Vkt
	for ath12k@archiver.kernel.org;
	Mon, 11 Mar 2024 13:55:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjg7c-00000001h9X-12Gu
	for ath12k@lists.infradead.org;
	Mon, 11 Mar 2024 13:55:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42BCtKXI024967;
	Mon, 11 Mar 2024 13:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=g7Dp36XIRZci1e5RvL9nsj3SXLGUWZgJu26vBQO0YQ4=; b=ad
	2+F4TyJTezO/DR52wZ530QsgT5ah+krOzYE0mHjwAqS4J8lOFgFW/PW7yq14BB6I
	hSLDBNjDYFOZLNfdun/pFYmM/pndf2VtDfeExKLZ/Z+z3GEVkbIh9+UDOGAi8MAU
	cj14t2eYPRAESBmeh+CcytC+1RhRc/7mosztAYoIYa3zhIkswmfEhrbDLAFMbbRH
	PYuJ6GQUwZRNNCe5pv6Mm1ONG3w1dpvCVz0aZvf5txtoOQBvEteiGHtetZfIGJeN
	6haJnAvmSEjMoOR7NeHYXHYCCz8LOVGMcSu5KTRu+EFvxpmBJPKN61u4oBDdP5ZR
	PQhXjfoyenSP5yz1wHaw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wt2b0r7xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:55:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BDtEAi022757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 13:55:14 GMT
Received: from [10.201.208.160] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Mar
 2024 06:55:13 -0700
Message-ID: <33d25f11-d54d-6161-383d-d3823d5f6d19@quicinc.com>
Date: Mon, 11 Mar 2024 19:25:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] wifi: ath12k: Optimize the lock contention of used
 list in Rx data path
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
 <20240226162310.629162-3-quic_periyasa@quicinc.com>
 <87msr4gbps.fsf@kernel.org>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <87msr4gbps.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4x8byH98DiIZEpUSEPuUd2R14j4gjUjF
X-Proofpoint-GUID: 4x8byH98DiIZEpUSEPuUd2R14j4gjUjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=499
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_065520_326966_3CC58A87 
X-CRM114-Status: GOOD (  11.68  )
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


On 3/11/2024 6:35 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>
>> When a packet arrives in Rx rings, the RX descriptor moves from the used
>> list to the free list. Then, the rxdma ring gets replenished, where the Rx
>> descriptor again moves from the free list to the used list. At the end, the
>> descriptor came to the used list with unnecessary list movement. The
>> descriptor used list is maintained in the Rxdma ring structure, which
>> creates lock contention for the list operations (add, delete) in the Rx
>> data path. Optimize the Rx data path by removing the used list from the
>> common Rxdma ring and maintain as a local variable in the Rx ring handler
>> itself, which avoid lock contention. Now, to find the used list descriptor
>> during descriptor cleanup, we need to check the in_use flag for each Rx
>> descriptor.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Before looking at this in detail: When optimising something it would be
> good to have before and after numbers showing the improvement. Otherwise
> it's just wishful thinking.

I don't have numbers. Like you said, Its just a wishful think.

-- 

Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


