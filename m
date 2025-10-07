Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C8ECCA470
	for <ath12k@archiver.kernel.org>; Tue,  7 Oct 2025 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKo4XAQ/YejZpDeOnyRcLxlYrhxvye+avHHVh8CYdEY=; b=P5o8vVyFUHmO3dwI0hTHalV9tK
	InKvY8RBOMeKl84bRZ1DcPApSi27sO1VKoNOIr3sY5FDFLX8bfyoU8fXaIt1bok/3Yq+eIwdkjDcG
	mr3JkeW1lcKqc8sZ5mZBcLGqMwXKYCSUQBnFnuV4X79iqlbZ1YHjvnGoJaLxSBV6GWpJkB3KvTtT6
	NoA0Vn0rRKccCHHysE64Hp9gbvEjau9H5Xlx7nVTcsIuokzaJYpPVKOcAGHmctKCAKURas7M9PYkN
	1sIZx3sUIoB0iQ7kf887kpoTvIKeKeLj5n28VW8ZxlDw7WX3PMybwe7wSqquwR3SGZi3LFfAmRtHh
	rRLloxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65IB-00000001ons-0IGL;
	Tue, 07 Oct 2025 10:51:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65I8-00000001onV-0dB8
	for ath12k@lists.infradead.org;
	Tue, 07 Oct 2025 10:51:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59723sGL024045;
	Tue, 7 Oct 2025 10:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKo4XAQ/YejZpDeOnyRcLxlYrhxvye+avHHVh8CYdEY=; b=nlBExechTz8ctr4m
	grCzJjL4AelsHNjRw/PT01aSqrFRmLxR2POWMo5aSqE70F9QVnhIHEz3CjXS+sA9
	gf2mv3BMu/I/d6ug1Y/vvYAJvd0fX0J5NU7+yTT1dk8PNcxBjNdLaxOLRsHzrCxO
	Z4DngsoSviv4pYvrylQJlYWcyS4Eb8O0y3s/QNuG/VafCc3xoDoxWEy8V2u7k/YB
	YF//ReRySq2z/Gav3tvNuLRHW+gOLETG9f30RrK/HI1GfjgtNcQ3SC6F1AlLsXmr
	XG8CGAtlAXrs1xsMD+vsW4s6qi+DTVKesrEUph7s91BcTBF+ldPyansZuL5kXbEm
	kjn/yg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhps8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 10:51:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 597ApY42005898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Oct 2025 10:51:34 GMT
Received: from [10.79.125.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 7 Oct
 2025 03:51:32 -0700
Message-ID: <9039c05a-8ba1-4bb4-946c-956583586dba@quicinc.com>
Date: Tue, 7 Oct 2025 16:21:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 1/2] wifi: ath12k: Refactor data path pdev
 struct
Content-Language: en-GB
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250930181848.3386271-1-quic_rdeuri@quicinc.com>
 <20250930181848.3386271-2-quic_rdeuri@quicinc.com>
 <b3c4ab9c-317c-4b68-b00a-d91c1d47b0d6@oss.qualcomm.com>
From: Ripan Deuri <quic_rdeuri@quicinc.com>
In-Reply-To: <b3c4ab9c-317c-4b68-b00a-d91c1d47b0d6@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfX2A/doRSsmhPU
 tw49EjYVxU9Bto3V8FVdKUH3RPH1GICnzdgkmM1g27lSnwkUH9yJ2qFP9CXdHT6KRkALrIvLhA4
 gAXs+cdM5CtxcH54o9ZRl5ycRa+dwaoux+MB9YC2yMElFEa/Yvs5/Bi/nG7OYx5t7itfNJxBl27
 nnyMHfMj5UZXi6OaqHSHvcY9SF1/g08d/p3FUKY6S8QL+eCJt8ebudAWs+2JoQ1CCg11LhRGwMP
 10yIn7pcyV3d0l8z9ANpzAuiq8DA9paliHAftdeddLbpJot++KntvxzgvgXnw/dxpgK3EC3xgUo
 v7XjIBaZEDaHrPm7OUa4d/6nxTJtn9GajbHlgour6o8hyQm4HvxpWmw93fjDXJBtr4toj0F7imM
 3QO6h/S5Hg34lwLmzZ87bBxjzaeDRQ==
X-Proofpoint-GUID: e4Q3LDy24F4vxgHP_WZP1va94xXENbHC
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e4f0b6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=5ZzUHON1g4zuXFNfCSEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: e4Q3LDy24F4vxgHP_WZP1va94xXENbHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_035136_218063_CF2C4D7D 
X-CRM114-Status: GOOD (  10.66  )
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



On 10/1/2025 10:02 PM, Jeff Johnson wrote:
> On 9/30/2025 11:18 AM, Ripan Deuri wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
>> index 1bca998117b7..98af9a17dea2 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> ...> +struct ath12k *ath12k_pdev_dp_to_ar(struct ath12k_pdev_dp *dp)
>> +{
>> +	return container_of(dp, struct ath12k, dp);
>> +}
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
>> index 546f73e46c41..084e0a3c1bbb 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp.h
>> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> ...> +struct ath12k *ath12k_pdev_dp_to_ar(struct ath12k_pdev_dp *dp);
> 
> is there a reason this isn't a static inline?
> 
> the implementation is trivial and this seems like an example where inlining
> would always produce a "better" executable.

It’s not static inline right now is to avoid introducing a core.h
dependency in dp.h (and prevent potential circular dependencies between
headers).  Ideally, it can reside in dp_cmn.h, but struct ath12k_pdev_dp
depends on monitor-related structures, which will be refactored in a
later series. That said, it can be made static inline in core.h for now;
I’ll make this change in the next revision.

