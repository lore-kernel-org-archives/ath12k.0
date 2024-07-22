Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23538C3DA70
	for <ath12k@archiver.kernel.org>; Mon, 22 Jul 2024 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n79iaVQWrGJCkRvxalAIg3/iTWV+tbTE1z0o07yap70=; b=TOBP+d1mbRYxXmwOnNS4v0cKQi
	ZXkGI0W1w01dzeOxQAe8TyT7LdP6K6Jxg3QM/xnx8Lyh9kNXCdfNhGZ6xQHx+C24/w9TboAVk8fO/
	Vbi279LcKAOlak1vPpJftql3qC0OoK6lxnj0lhkuPNrhxn8KB6f9uFHW1qUS00UmZDXhZk3B+8Yk2
	X+Qgy/PD3RtNW1yZm7+dx7xStbWVywPrtF3TX1Vq6WQzyXFCE+5C8LpWxKOmp4iIQSPdG6tryOpQU
	W3Ij+pFkstCymyYeeRLx1YBxAop47dn4glZdyIJgoaaAA5+mJmagr9HZtpDuWVMkQLv26gfifQRby
	64+znvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn2P-00000008d5B-3IZ6
	for ath12k@archiver.kernel.org;
	Mon, 22 Jul 2024 07:00:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmwK-00000008abG-05ME
	for ath12k@lists.infradead.org;
	Mon, 22 Jul 2024 06:54:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LN0fa7014210;
	Mon, 22 Jul 2024 06:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n79iaVQWrGJCkRvxalAIg3/iTWV+tbTE1z0o07yap70=; b=kQOSttJXZ84MDqh1
	gQvugGHLGR3cAgtI90nYCWKk8tya8lJFQ5dMx7sKheC0vZwqqTU235nXrJXT7OhA
	p0WrWwIlkEwsWzOXS/gXZVfewEsaax2ZirTrwhOhoGCwxNS4CjP07AhEL77f0x38
	cVfDh7BvrwsrBHrHN6T6rDrMyAQyNLtVDGjozUJEDcyoCuLBvhPjXMBE2gmNtdCL
	qSC8EIofHhl0ksop7enjUJ2qc5pE3Aidn/8H64rDurAs+zUnj7HJJULl1lFi9h0C
	x8gMggwOno10Wx+GauPKFRa2ALxZW3f3SmJQUFaXN6wHG6OTlGhR9q2PwYv47EcK
	GagSZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5f2asyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 06:54:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M6sTVp000304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 06:54:30 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 21 Jul
 2024 23:54:26 -0700
Message-ID: <df00b06a-d33b-4df8-8f44-2b7f659cb2f9@quicinc.com>
Date: Mon, 22 Jul 2024 14:54:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit path
 for WCN7850
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kernel@quicinc.com>,
        <netdev@vger.kernel.org>
References: <20240715023814.20242-1-quic_bqiang@quicinc.com>
 <c26af1cb-747a-462d-8e13-af948bbb8171@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <c26af1cb-747a-462d-8e13-af948bbb8171@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H55pVT1mKCUMLNMhcJ5AvPpLFVo-o8ak
X-Proofpoint-ORIG-GUID: H55pVT1mKCUMLNMhcJ5AvPpLFVo-o8ak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_03,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_235432_192115_107AFA53 
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



On 7/19/2024 10:10 PM, Jeff Johnson wrote:
> On 7/14/2024 7:38 PM, Baochen Qiang wrote:
>> In transmit path, it is likely that the iova is not aligned to PCIe TLP
>> max payload size, which is 128 for WCN7850. Normally in such cases hardware
>> is expected to split the packet into several parts in a manner such that
>> they, other than the first one, have aligned iova. However due to hardware
>> limitations, WCN7850 does not behave like that properly with some specific
>> unaligned iova in transmit path. This easily results in target hang in a
>> KPI transmit test: packet send/receive failure, WMI command send timeout
>> etc. Also fatal error seen in PCIe level:
>>
>> 	...
>> 	Capabilities: ...
>> 		...
>> 		DevSta: ... FatalErr+ ...
>> 		...
>> 	...
>>
>> Work around this by manually moving/reallocating payload buffer such that
>> we can map it to a 128 bytes aligned iova. The moving requires sufficient
>> head room or tail room in skb: for the former we can do ourselves a favor
>> by asking some extra bytes when registering with mac80211, while for the
>> latter we can do nothing.
>>
>> Moving/reallocating buffer consumes additional CPU cycles, but the good news
>> is that an aligned iova increases PCIe efficiency. In my tests on some X86
>> platforms the KPI results are almost consistent.
>>
>> Since this is seen only with WCN7850, add a new hardware parameter to
>> differentiate from others.
> 
> I asked for expert opinion on this patch and received the following response.
> Baochen, can you take a look at this suggestion?
> 
>> Aligning headers is sometimes done, but it appears the driver
>> doesn't support scatter gather? I think the author may want to advertise
right, ath12k does not support SG currently.

>> scatter and linearize manually in the driver, to a correct offset.
is there an existing skb API or API combinations which can do that for me? I checked __skb_linearize() and it does not take an 'offset' argument.

>> Because now core is linearizing the skb in validate_xmit_skb()
>> and then the driver moves it a second time..
> 
> 

