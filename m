Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBED5C3DA70
	for <ath12k@archiver.kernel.org>; Mon, 22 Jul 2024 07:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BW3f9GIsvtIUK90wLhUHer5+7DZ0w/N1HRpFgXktSg0=; b=rAjwXQnwo6hQb7P94PagurDsmL
	FncORpHlBAXC+fTnSRwfrEQYDR3Ik4140fsa4zepBQ91bzDUXvdiw5wZbwQ2420lDZJilfnxy8Ys1
	Vrm79VHBEbFPIQlcC2rxOtVXamWjlb9y3UIfK5g/acg7wOdacJldR6aeuOwq4GvGAh3RQyAIP+O99
	eVpfII7M/G1Yz2y/m1OBdQkcTlHT+VLD9iuf0evWzuh9OoGGt1Yxei5hMxpCEbybvKrJJCEotht4B
	atQzTzbC2vtviZZ1nlvSz3xRiJXK/LmwQNbbn6spdTs7Jdfa0MgpWEnrC5gXFN70zVpZOd8wbu6v2
	43l+pJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn4S-00000008dZf-1pEk
	for ath12k@archiver.kernel.org;
	Mon, 22 Jul 2024 07:02:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn4O-00000008dYl-3zS9
	for ath12k@lists.infradead.org;
	Mon, 22 Jul 2024 07:02:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LLxcLk022838;
	Mon, 22 Jul 2024 07:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BW3f9GIsvtIUK90wLhUHer5+7DZ0w/N1HRpFgXktSg0=; b=XTLfJGoyuNFixsnZ
	JywC9fgz1ImImhVBf3QF607eBe/CuJFwzRDuUOMe7qlUjDOIvTP9K4GTr9KSGyZu
	JYLO2SOfCGPCUu3c4RfmHRC0OBSQSTYuk5fT1ByYhp7dK2tkufeAfEozZ/2IXdjy
	LYvnZZjtqtaJEGzwpU56RdoQvzYbyO2RSeso8tbby9P1qbzjtJ9+HxZQb00+csPB
	7z9+ig/8MB7TiyePa5M9/5WYwtR32kGjT1kyXtJpWcbd5Ql5tELtS1ScvGgyeltL
	gr/786w7WIrghrNgkobSVzueoefjvNUqR0MG2zP4nXGHRRRzoWGlJCgGdktMRmxn
	sQDaGg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2kmu2fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 07:02:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M72n0Z013861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 07:02:49 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 00:02:46 -0700
Message-ID: <1aad7e68-c2d4-4b77-b526-5580860d7e3e@quicinc.com>
Date: Mon, 22 Jul 2024 15:02:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit path
 for WCN7850
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kernel@quicinc.com>,
        <netdev@vger.kernel.org>
References: <20240715023814.20242-1-quic_bqiang@quicinc.com>
 <c26af1cb-747a-462d-8e13-af948bbb8171@quicinc.com>
 <df00b06a-d33b-4df8-8f44-2b7f659cb2f9@quicinc.com>
Content-Language: en-US
In-Reply-To: <df00b06a-d33b-4df8-8f44-2b7f659cb2f9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fKrrrrMkKq6NicoQgubtJ-RkyOPgY0ow
X-Proofpoint-GUID: fKrrrrMkKq6NicoQgubtJ-RkyOPgY0ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_03,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_000253_158530_3F2FAFC0 
X-CRM114-Status: GOOD (  19.56  )
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



On 7/22/2024 2:54 PM, Baochen Qiang wrote:
> 
> 
> On 7/19/2024 10:10 PM, Jeff Johnson wrote:
>> On 7/14/2024 7:38 PM, Baochen Qiang wrote:
>>> In transmit path, it is likely that the iova is not aligned to PCIe TLP
>>> max payload size, which is 128 for WCN7850. Normally in such cases hardware
>>> is expected to split the packet into several parts in a manner such that
>>> they, other than the first one, have aligned iova. However due to hardware
>>> limitations, WCN7850 does not behave like that properly with some specific
>>> unaligned iova in transmit path. This easily results in target hang in a
>>> KPI transmit test: packet send/receive failure, WMI command send timeout
>>> etc. Also fatal error seen in PCIe level:
>>>
>>> 	...
>>> 	Capabilities: ...
>>> 		...
>>> 		DevSta: ... FatalErr+ ...
>>> 		...
>>> 	...
>>>
>>> Work around this by manually moving/reallocating payload buffer such that
>>> we can map it to a 128 bytes aligned iova. The moving requires sufficient
>>> head room or tail room in skb: for the former we can do ourselves a favor
>>> by asking some extra bytes when registering with mac80211, while for the
>>> latter we can do nothing.
>>>
>>> Moving/reallocating buffer consumes additional CPU cycles, but the good news
>>> is that an aligned iova increases PCIe efficiency. In my tests on some X86
>>> platforms the KPI results are almost consistent.
>>>
>>> Since this is seen only with WCN7850, add a new hardware parameter to
>>> differentiate from others.
>>
>> I asked for expert opinion on this patch and received the following response.
>> Baochen, can you take a look at this suggestion?
>>
>>> Aligning headers is sometimes done, but it appears the driver
>>> doesn't support scatter gather? I think the author may want to advertise
> right, ath12k does not support SG currently.
> 
>>> scatter and linearize manually in the driver, to a correct offset.
> is there an existing skb API or API combinations which can do that for me? I checked __skb_linearize() and it does not take an 'offset' argument.
or do I need to implement it myself from a very low level basis? like (if required) allocating skb structure, allocating/aligning payload buffer, copying/freeing paged frag/frag list, etc..

> 
>>> Because now core is linearizing the skb in validate_xmit_skb()
>>> and then the driver moves it a second time..
>>
>>
> 

