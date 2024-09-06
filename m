Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF86BC54FC6
	for <ath12k@archiver.kernel.org>; Fri,  6 Sep 2024 04:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUoG6A4IofdxHvhdvlVmr7RWja6gyJ5ExgPr+sv5u30=; b=GozIgQB1ognqCLbnmeX4x8AZKJ
	qt4WFRY3iPPOdP709XqOm3zpfDHcNuQ+PdAzFjb1w0WXx10pZy3oCBTAl1VVRnQoQayP4XIth6yg6
	nNLtprRM9npPEyz0DmxK/w0FSBmkB2xGwX6NA0Mmm0PwCrs4EKTqj80GsnQaGdkvUWX1Y4cnjfg0n
	93HcUDupKDM0Z7zeuUn6T+OREw7gmACDdLnRs0c7Ib6mavbU250MBV5d2APpdNFivkchgmh+OR4Eb
	cqhfojsQHf8jN8Br/h8rvQ+kIOUgG/jhn7l6hjerIgRa9BoH6aIOuwv5rG44cKEhFvA3uC87Y7oSl
	/Luajdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smQ9N-0000000Aa70-2pnq
	for ath12k@archiver.kernel.org;
	Fri, 06 Sep 2024 04:00:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smQ9K-0000000Aa6Y-1QOf
	for ath12k@lists.infradead.org;
	Fri, 06 Sep 2024 04:00:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQWqN008673
	for <ath12k@lists.infradead.org>; Fri, 6 Sep 2024 04:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUoG6A4IofdxHvhdvlVmr7RWja6gyJ5ExgPr+sv5u30=; b=O/W7WJ5260Z6tJ1K
	Olizt6ZVHV5pGJWjeUE7sKghWXzrh0JjBfGAqdSgTf9Xw7HTIIxemYaEJFTOz4nV
	rlTW1N/MCFe9tdvxhXY09yAOHcs0HsL6dJx5RgRKrc7jMpACeFnar870VfOLg+SS
	3+DWV/6Yg8nNFTGBDCU0riR2wJP6XbfbYbS//iOHU0eOtKuEoCV6dr0xAubkHXNj
	P2iabepihEWkJlHHP1400/y5diSdOudFt7W8hwntOeW+TrxnyQofW+WvyuWR2X4f
	bd9XSAj27QjZ16qDum8bA9kM6sxlFJWSWzwAe8FrcbVnxXtzmyJz/My99oA8UyN8
	h40v8A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhx210t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Sep 2024 04:00:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48640dOa008324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 6 Sep 2024 04:00:39 GMT
Received: from [10.50.0.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 21:00:38 -0700
Message-ID: <8c83ec2e-6461-394c-2bc1-f4d2db37cc71@quicinc.com>
Date: Fri, 6 Sep 2024 09:30:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Allocating more RX descriptors that can fit in their related
 rings
Content-Language: en-US
To: <ath12k@lists.infradead.org>
References: <ZtigjqSbAWZYU_KQ@pilgrim>
 <daa579b2-c98a-5c7d-1bee-68c305e058b6@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <daa579b2-c98a-5c7d-1bee-68c305e058b6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FB4yf0DnC8XOzEzqqJiKdG1cAMKjbHiS
X-Proofpoint-GUID: FB4yf0DnC8XOzEzqqJiKdG1cAMKjbHiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=647 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_210042_537202_DEBB8984 
X-CRM114-Status: GOOD (  16.72  )
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

corrected the statement below

On 9/6/2024 9:27 AM, Karthikeyan Periyasamy wrote:
> 
> 
> On 9/4/2024 11:31 PM, Remi Pommarel wrote:
>> Hello,
>>
>> As far as I understand a bunch (ATH12K_RX_DESC_COUNT) of rx descriptors
>> gets allocated, then CMEM is configured for those descriptors cookie
>> conversion and is kept available in dp->rx_desc_free_list pool.
>>
>> Those descriptors seem to be used to fed two different rings, the
>> rx_refill_buf_ring ring via ath12k_dp_rx_bufs_replenish() and the
>> reo_reinject_ring one with ath12k_dp_rx_h_defrag_reo_reinject(). While
>> the former is kept fully used if possible the latter is only used on
>> demand (i.e. reinjection of defragmented MPDU).
>>
>> It seems that the number of RX descriptors ATH12K_RX_DESC_COUNT (12288)
>> is higher than what those two rings can fit (DP_REO_REINJECT_RING_SIZE +
>> DP_RXDMA_BUF_RING_SIZE = 4096 + 32 = 4128).
>>
>> My question is why are we allocating that much (12288) buffer if only a
>> small part (4128) can be used in worst case ?
>> > Wouldn't it be ok to only allocate just enough RX descriptors to fill
>> both ring (with proper 512 alignment to ease CMEM configuration) as
>> below ?
>>
>>   #define ATH12K_RX_DESC_COUNT   ALIGN(DP_REO_REINJECT_RING_SIZE + \
>>                                        DP_RXDMA_BUF_RING_SIZE, \
>>                                        ATH12K_MAX_SPT_ENTRIES)
>>
>> Or am I missing something and this is going to impact performances ?
>>
> 
> Yes, it will impact performance.
> 
> Host replenish RxDMA buffers to the HW and after processing it given 
> back to Rx path (REO, WBM Error, Rx Error). So it can be relate to 
> one-to-one direct mapping. HW consume in-progress Rx buffer depend on 
> Data rate mode. If RxDMA buffers not available then it impact 
> performance due to Out-of-order Rx error due to RxDMA buffer unavailable.
> 

Yes, it will impact performance.

Host replenish RxDMA buffers to the HW and after processing it given
back to Rx path (REO, WBM Error, Rx Error). So it cannot be relate to
one-to-one direct mapping. HW consume in-progress Rx buffer depend on
Data rate mode. If RxDMA buffers not available then it impact
performance due to Out-of-order Rx error due to RxDMA buffer unavailable.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

