Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5365AC04FFE
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 08:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5cLl7udZXqmR3olquQpCmFNN1J7b1OOt0V9VWSBRDA=; b=IZO2wXy++OQO0urjFi8eYaVZdZ
	h/GM9UtlgkVygFeUnZzhqlkZpEHGOa8kajjpVsj6I3KrEHlrUo2dR26SsT9vlKs3HIi1Y0oCRCNBV
	g8K79bNkQs2RAJ0/roGLGSUJ6rLGHyWkRpb3ieasSdKfxrHi4dq17O3ybwba59gGzBDa2mgC3fhlM
	baywaB6K86pOc8aYK27cGqpUKL9+me4NT9wDPa3ofdbxfdXVTV/VhynKHwY1zIIRBmY2yqPOoV5y6
	/NoGXNpFhFA/tPMve1u4FjwSZZ8tlAgJqV641JBa9cqg7vYtukHHDEg9hNGb7aCiWkbslEoClclJI
	uwaCorIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCbC-0000000GCGy-1R5o
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 08:49:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCZj-0000000GAxI-07Ab
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 08:48:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C2qSt4003950;
	Fri, 12 Apr 2024 08:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=t5cLl7udZXqmR3olquQpCmFNN1J7b1OOt0V9VWSBRDA=; b=fT
	NjKwpnSTUCXhP8Yi8l0DNVGba9Jbf+DbDVi8ycovWvnU+ib3NYykuKPo8D1GoP0K
	BUMbq3U9daGUAn4XuoDvHfx9YatLGAZwHI7OEmwDTfi6l2P+0Uu/UrBJWqF5G6LG
	H+TVNgPN96I5eKe6qXKHJKGEJlL/aKuccf/zFJT/EnSkRwzvagdolBPFQ7hsbizZ
	xTbXX4i4qV1mHPvGr6L+wvuXJ0uHWYpY4N/nCEH7m2Wk2SyoCekO86DHbIepw7ze
	+UJCE7LdLSVTRM/FaQzcmhNfeyXkdUl5yvIqitlQTTVk+80+VA/puAwAD/wyRCCX
	PXq7qFts23T4p1r+Ouxg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xev74rp4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 08:47:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C8ltKB024455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 08:47:55 GMT
Received: from [10.253.34.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 01:47:54 -0700
Message-ID: <6ee5664b-997b-45eb-89f9-5f75708c268a@quicinc.com>
Date: Fri, 12 Apr 2024 16:47:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: add support to handle beacon miss for
 WCN7850
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412025149.1211-1-quic_kangyang@quicinc.com>
 <D0HYXSPMY8JE.17YSACO3ROKKZ@gmail.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <D0HYXSPMY8JE.17YSACO3ROKKZ@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rKVHglC3yMz2N0dQ_6_iIcKQevvAx6gi
X-Proofpoint-ORIG-GUID: rKVHglC3yMz2N0dQ_6_iIcKQevvAx6gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_05,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_014800_059851_FC0A5FD7 
X-CRM114-Status: GOOD (  11.67  )
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



On 4/12/2024 3:33 PM, Nicolas Escande wrote:
> On Fri Apr 12, 2024 at 4:51 AM CEST, kangyang wrote:
> [...]
>> @@ -5986,6 +6055,20 @@ static int ath12k_mac_vdev_create(struct ath12k *ar, struct ieee80211_vif *vif)
>>   	lockdep_assert_held(&ar->conf_mutex);
>>   
>>   	arvif->ar = ar;
>> +	arvif->vif = vif;
>> +
>> +	INIT_LIST_HEAD(&arvif->list);
>> +	INIT_DELAYED_WORK(&arvif->connection_loss_work,
>> +			  ath12k_mac_vif_sta_connection_loss_work);
>> +
> Is there a need to move the following part ?
> Isn't just adding the delay work enough ?


Just checked, you are right, but should add delay work in add_interface().

Will change in v3.


>> +	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
>> +		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
>> +		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
>> +		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
>> +		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
>> +		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
>> +	}
>> +
>>   	vdev_id = __ffs64(ab->free_vdev_map);
>>   	arvif->vdev_id = vdev_id;
>>   	arvif->vdev_subtype = WMI_VDEV_SUBTYPE_NONE;
>> @@ -6316,16 +6399,6 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
>>   
>>   	arvif->vif = vif;
>>   
>> -	INIT_LIST_HEAD(&arvif->list);
>> -
>> -	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
>> -		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
>> -		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
>> -		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
>> -		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
>> -		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
>> -	}
>> -
>>   	/* Allocate Default Queue now and reassign during actual vdev create */
>>   	vif->cab_queue = ATH12K_HW_DEFAULT_QUEUE;
>>   	for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
> [...]
> 
> Thanks

