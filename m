Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F28CE7B04
	for <ath12k@archiver.kernel.org>; Sat,  7 Sep 2024 02:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/rVcphyRWPHNMXS/l6u3PEVuLaLqPLJT4gWG0gfIR8=; b=fB6L5Ym2exSPeyt39AWB1j89za
	DvvnbEgea24inDkOV0dK/l4h9ixJ3jVbAZbhx6Gwj0NDO/JX/WigE3zEC+ZbAAOmNgxU/+hTC5GeM
	neiHVHub6+mAtUE/dhwlJ5x/2gpBZdPSw+n++TKRvkvBmgwIvlszmdBUjO9abFGOIMrmQAZPuxFwU
	+QGfVqzSh9M7BACEgsnzTLGm2ksVM/xnvfnnprDeGe+/+PjbN8K2eysqQ/15uk/388zQiQQtHbbbI
	aqV9/xAck6dVLkGepuqWj1LNv+s9gMqCJRNQnW0fEvpBGf8o060xAZ4TeesEvDBVrc3YSqnp9/sCk
	0TUckPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smlMH-0000000E7mU-2LR4
	for ath12k@archiver.kernel.org;
	Sat, 07 Sep 2024 02:39:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smlMD-0000000E7lp-34T4
	for ath12k@lists.infradead.org;
	Sat, 07 Sep 2024 02:39:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4871pmHq014966
	for <ath12k@lists.infradead.org>; Sat, 7 Sep 2024 02:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/rVcphyRWPHNMXS/l6u3PEVuLaLqPLJT4gWG0gfIR8=; b=iC7VFL5goaYZ6dos
	13REWFJxplMvbZXewIVQgv061XkP1er6Np98cDF2ZObo/t7kYTLYIghKARSaenN0
	sXa9Gc/Iv6/RsgUsfgsMBL2Agtr3SME2pB1+uMpJ70T0GKUtFDiGumVciNGmZEob
	PIr4jgAlaxeWnCzfi5cnRoGfRAKAH/e8YOC8ZU2XW3/jivjUaPP7vZD6sxJNHteO
	AlIB/Rhpsq4INgIWEbKtYuD5SDWdfcp6RiB+kOD6NCvNNL9hwuC13++s4/xZccLQ
	qfcMFwDMKcl9dGNf/mPMPYBCQtRBiguvIEn3U5h1UUCkPLkC19rzo/VOcTVXtyuv
	7Rq81Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gdgqr1rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 07 Sep 2024 02:39:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4872dLXs031632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 7 Sep 2024 02:39:21 GMT
Received: from [10.50.53.45] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 19:39:20 -0700
Message-ID: <9d6b7eb0-89c3-006b-cd05-15c072f45b33@quicinc.com>
Date: Sat, 7 Sep 2024 08:09:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Allocating more RX descriptors that can fit in their related
 rings
To: <ath12k@lists.infradead.org>
References: <ZtigjqSbAWZYU_KQ@pilgrim>
 <daa579b2-c98a-5c7d-1bee-68c305e058b6@quicinc.com>
 <8c83ec2e-6461-394c-2bc1-f4d2db37cc71@quicinc.com> <ZtspUm079-A1WTHw@pilgrim>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <ZtspUm079-A1WTHw@pilgrim>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: StzMcLOeiwKdGc4qznDuzWBuIbKqb62u
X-Proofpoint-GUID: StzMcLOeiwKdGc4qznDuzWBuIbKqb62u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=988 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409070019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_193925_933979_56B8AD12 
X-CRM114-Status: GOOD (  26.68  )
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



On 9/6/2024 9:39 PM, Remi Pommarel wrote:
> On Fri, Sep 06, 2024 at 09:30:33AM +0530, Karthikeyan Periyasamy wrote:
>> On 9/6/2024 9:27 AM, Karthikeyan Periyasamy wrote:
>>>
>>>
>>> On 9/4/2024 11:31 PM, Remi Pommarel wrote:
>>>> Hello,
>>>>
>>>> As far as I understand a bunch (ATH12K_RX_DESC_COUNT) of rx descriptors
>>>> gets allocated, then CMEM is configured for those descriptors cookie
>>>> conversion and is kept available in dp->rx_desc_free_list pool.
>>>>
>>>> Those descriptors seem to be used to fed two different rings, the
>>>> rx_refill_buf_ring ring via ath12k_dp_rx_bufs_replenish() and the
>>>> reo_reinject_ring one with ath12k_dp_rx_h_defrag_reo_reinject(). While
>>>> the former is kept fully used if possible the latter is only used on
>>>> demand (i.e. reinjection of defragmented MPDU).
>>>>
>>>> It seems that the number of RX descriptors ATH12K_RX_DESC_COUNT (12288)
>>>> is higher than what those two rings can fit (DP_REO_REINJECT_RING_SIZE +
>>>> DP_RXDMA_BUF_RING_SIZE = 4096 + 32 = 4128).
>>>>
>>>> My question is why are we allocating that much (12288) buffer if only a
>>>> small part (4128) can be used in worst case ?
>>>>> Wouldn't it be ok to only allocate just enough RX descriptors to fill
>>>> both ring (with proper 512 alignment to ease CMEM configuration) as
>>>> below ?
>>>>
>>>>    #define ATH12K_RX_DESC_COUNT   ALIGN(DP_REO_REINJECT_RING_SIZE + \
>>>>                                         DP_RXDMA_BUF_RING_SIZE, \
>>>>                                         ATH12K_MAX_SPT_ENTRIES)
>>>>
>>>> Or am I missing something and this is going to impact performances ?
>>>>
> 
> ...
> 
>>
>> Yes, it will impact performance.
>>
>> Host replenish RxDMA buffers to the HW and after processing it given
>> back to Rx path (REO, WBM Error, Rx Error). So it cannot be relate to
>> one-to-one direct mapping. HW consume in-progress Rx buffer depend on
>> Data rate mode. If RxDMA buffers not available then it impact
>> performance due to Out-of-order Rx error due to RxDMA buffer unavailable.
> 
> Thanks for the clarification.
> 
> I think I do see your point, I though the only way to fill descriptors
> to HW was in ath12k_dp_rx_process() by giving back the rx desc after it
> has been used. In that case having extra buffer wouldn't be needed as it
> wouldn't be possible to refill faster that processing those descriptors.
> 

Explicit hw irq request is there to refill the Rx buffer, processed by 
host2rxdma[grp_id] under ath12k_dp_service_srng().

Whenever HW need refill it raise explicit hw irq.

> But it seems that there is a disctinct irq group (i.e. pci*_wlan_dp_3)
> that is used to process RE0, WBM Error, Rx error but also to replenish
> buffers if the refill ring is 3/4 empty (called host2rxdma).

above one

> 
> So hypothetically here, if you isolate this irq to a specific CPU (e.g.
> having more that 4 CPU one for each RX data rings and an extra one for
> error and host2rxdma refill) you could have scenarios where the data
> ring processing ath12k_dp_rx_process() could lag enough to be needed
> this extra buffer refilling, is that correct ?

Depends on the data rate traffic you pump.

But you can experiment the reduced count Rx buffer and see the behavior 
and conclude the performance impact. Also consider the small size frame 
traffic with highest data rate, here more Rx descriptors used for the 
traffic.

> 
> If this is right then that would explain why I didn't see any
> performance difference as with only 4 CPUs (one RX ring processing per
> CPU) the extra buffer refilling couldn't be faster than just giving the
> used descriptor back.
> 
> Thanks
> 

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

