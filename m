Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889ECC02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41X9z30fJ7KnWKzvOWk5e9WEygJH+p4mFkvRN5ff5CQ=; b=l1P2j3jZT6QNV+JNapCbMevD+S
	jmLQOiTXLOY1lwpjuhuuXxtR888hM8qrqeYPt46mXSNORKDHEqPLZOzytMw8WSaPc7+YlKnueL8zY
	gzR4ZyhJ/jfg7NBB+OLq7HWPqQghIQfXhmnBjJJheAntCYcevJs4UhcoFZ/T+Azc+2QFJDtzDNxKA
	P7Zl3NUjU9lG7sO9dD0B7fPBt/GnQjcW39ocTqBB24GjZ2ktRcofnWHSxf7zlfKwrELJJHpah4AzT
	6w5flTSftAflHacUEdzOanA8L6ZwE30wIaBdfX8fYcHwRaPBqmDE/x1Of3gvzBoVZaRAcq+rqvWV1
	BmXA428g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbRi1-0000000FaVl-0qO2
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 21:59:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbRhy-0000000FaUt-0VbW
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 21:59:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OLSoo7003958;
	Fri, 24 Jan 2025 21:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41X9z30fJ7KnWKzvOWk5e9WEygJH+p4mFkvRN5ff5CQ=; b=SGNfqvEtL13sSuLh
	1D3a2fI95kb/kes1/YDGw84++x7b3dw9EaUhFw2o+qPuidlmIkcWBJEthF3bSV8M
	hRFNZYoIN3oEu+ie+TANmGvKKHrpLbe0DR5eXs/hxKKOLYcPFpgyZlXb5S6a1AVm
	/s39r9WODz74Wz6SpTknyzJFn3Yz/pIm7GXCG23T4twrbLTfBqPlsZIYeXqfHpVz
	/umbIJgLshr8uPVfz8KHfsRN+XSfgMIxWctGWoChqGW+1SHmP8/Edq1SzFKsva/f
	heRN+FQF+9yQVdQJlQT+D0HpvK/qiFM+SxSVqUep0iK5x6aPlZUYUiHAU3cgqLuo
	VkfEVQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44chfug5sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 21:59:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OLxI6l031257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 21:59:18 GMT
Received: from [10.38.243.10] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 13:59:17 -0800
Message-ID: <0e2feb8f-79dd-19af-3ad9-e61d3f25e9a6@quicinc.com>
Date: Fri, 24 Jan 2025 13:59:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 2/2] wifi: ath12k: Add support for MLO Multicast handling
 in driver
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250109184932.1593157-1-quic_bmahalin@quicinc.com>
 <20250109184932.1593157-3-quic_bmahalin@quicinc.com>
 <D7AA0SSICNT4.3GU5SHWIXWH94@gmail.com>
From: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
In-Reply-To: <D7AA0SSICNT4.3GU5SHWIXWH94@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nOonKJ4xO5WVyV5LR1a0mpBUe5eZoVlF
X-Proofpoint-GUID: nOonKJ4xO5WVyV5LR1a0mpBUe5eZoVlF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_09,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_135922_303598_8323855F 
X-CRM114-Status: GOOD (  13.98  )
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



On 1/24/2025 3:45 AM, Nicolas Escande wrote:
> On Thu Jan 9, 2025 at 7:49 PM CET, Balamurugan Mahalingam wrote:
> [...]
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
>> index 76626d925adf..9d05fe7a870c 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
>> @@ -217,7 +217,7 @@ static int ath12k_dp_tx_align_payload(struct ath12k_base *ab,
>>   }
>>   
>>   int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
>> -		 struct sk_buff *skb)
>> +		 struct sk_buff *skb, bool gsn_valid, int mcbc_gsn)
>>   {
>>   	struct ath12k_base *ab = ar->ab;
>>   	struct ath12k_dp *dp = &ab->dp;
>> @@ -290,13 +290,24 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_link_vif *arvif,
>>   		msdu_ext_desc = true;
>>   	}
>>   
>> +	if (gsn_valid) {
>> +		ti.meta_data_flags =
>> +			u32_encode_bits(HTT_TCL_META_DATA_TYPE_GLOBAL_SEQ_NUM,
>> +					HTT_TCL_META_DATA_TYPE) |
>> +			u32_encode_bits(mcbc_gsn, HTT_TCL_META_DATA_GLOBAL_SEQ_NUM);
>> +	}
>> +
> Hello,
> 
> As ti is zeroed initilised isn't safer to do 'ti.meta_data_flags |='
> instead of 'ti.meta_data_flags ='. This way if we add another flag in
> meta_data_flag in the same func for another reason, we will have less risk of
> overriding the said flags ?
> 

Hello Nicolas,
In this case, this is an intentional reset of any previous residual 
value in ti.meta_data_flags field.
The meta_data_flags bit definition is different depending upon the 
META_DATA_TYPE bit's value.

>>   	ti.encap_type = ath12k_dp_tx_get_encap_type(arvif, skb);
>>   	ti.addr_search_flags = arvif->hal_addr_search_flags;
>>   	ti.search_type = arvif->search_type;
>>   	ti.type = HAL_TCL_DESC_TYPE_BUFFER;
>>   	ti.pkt_offset = 0;
>>   	ti.lmac_id = ar->lmac_id;
>> -	ti.vdev_id = arvif->vdev_id;
>> +	if (gsn_valid)
>> +		ti.vdev_id = arvif->vdev_id +
>> +			     HTT_TX_MLO_MCAST_HOST_REINJECT_BASE_VDEV_ID;
>> +	else
>> +		ti.vdev_id = arvif->vdev_id;
>>   	ti.bss_ast_hash = arvif->ast_hash;
>>   	ti.bss_ast_idx = arvif->ast_idx;
>>   	ti.dscp_tid_tbl_idx = 0;

