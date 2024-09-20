Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301F8CF58CC
	for <ath12k@archiver.kernel.org>; Fri, 20 Sep 2024 04:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:CC:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpRWGD7dSGr/XgSvqmIAk4vXt7jhrYqUrp1WdW/shdY=; b=n29X6SveJ8bjaHagbi9OGpcmX5
	67Mkv6aa1Czx965IDWOa0ygxF6XnBNigGSJoVZnDOdeUJCBF7I3c78tn0eV8viMYHU2Etd6ci4uay
	dND5i5oQWWt8OXWCS9II6Mvo9rtoToUAKflNE8ZL0jDzh++5UwtVsOekkKQTXmfGjAtBt86x5QG3H
	pYsSKAUpve/DDEQ2zZ3qU9LpnTwSroHrRw0YOWYCloWz/Z0FfGaoLIrWf+JfIj940Eq0kBZID1n/j
	kwJjlh1qF+o8TjFYsO/HU2a3Ve+ZHKusIPJEY0Z6U/AYWelYG7/98rrKaWf64bioqeEpX5TI/mlNy
	QoYjmCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srVUr-0000000BR4N-32LB
	for ath12k@archiver.kernel.org;
	Fri, 20 Sep 2024 04:43:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srVUo-0000000BR3s-2Y7W
	for ath12k@lists.infradead.org;
	Fri, 20 Sep 2024 04:43:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJ3rCK022695;
	Fri, 20 Sep 2024 04:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpRWGD7dSGr/XgSvqmIAk4vXt7jhrYqUrp1WdW/shdY=; b=mDfJ2M08+XRVDHQe
	FkK+LnjUNLr3kFsZVY86tLWuDtBdwIqyBm/8mxbjcTuJ+UoeNovFcK95Zs8bHnSt
	VBjJADx+IHMci9A1yS3ZfaCFjogRHQYFceV7R8auG8IjQhNw6dsb47i51705QnFl
	U9qHTJzqwUU0Hn4/XiHv6JEU0J0lEJ6cBn97w6OjHNnRy0PYEhjgkU7LiM/p06uC
	Demnt7ogzzC5TInOqV1iNKNGHwjsVVM41Azy6bZkdt2NAhpQioDKOz34m0CLBmW8
	w69bcWCB/KkZtnEiWsUE2JrI32E5Aq5hht8UcyqWeFobfx+FgloJiyNIgO7umgnD
	8U7jaQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnyqd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 04:43:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K4hnhl026870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 04:43:49 GMT
Received: from [10.216.21.130] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 21:43:47 -0700
Message-ID: <51afbe69-e770-0344-6ca0-0fe5cd721d2d@quicinc.com>
Date: Fri, 20 Sep 2024 10:13:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
Content-Language: en-US
References: <D41LUTO0MIC3.12475D2J3VNX3@gmail.com>
 <93d580b4-cf7a-471f-8f3a-673d456f726f@quicinc.com>
From: Santhosh Ramesh <quic_santrame@quicinc.com>
To: Nicolas Escande <nico.escande@gmail.com>
CC: <quic_santrame@quicinc.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>,
        <quic_murugana@quicinc.com>
In-Reply-To: <93d580b4-cf7a-471f-8f3a-673d456f726f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QpTxwQbQwW6ru8-soRiXoLgkb5DZxSnA
X-Proofpoint-ORIG-GUID: QpTxwQbQwW6ru8-soRiXoLgkb5DZxSnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=638 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_214354_784126_F4A05B3A 
X-CRM114-Status: GOOD (  22.34  )
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

"Nicolas Escande" <nico.escande@gmail.com> writes:
> On Mon Sep 9, 2024 at 9:30 AM CEST, Santhosh Ramesh wrote:
> 
> [...]
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 137394c36460..6d7a005d83b4 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -7217,9 +7217,9 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
>>  							chandef->chan->band,
>>  							arvif->vif->type);
>>  	arg.min_power = 0;
>> -	arg.max_power = chandef->chan->max_power * 2;
>> -	arg.max_reg_power = chandef->chan->max_reg_power * 2;
>> -	arg.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
>> +	arg.max_power = chandef->chan->max_power;
>> +	arg.max_reg_power = chandef->chan->max_reg_power;
>> +	arg.max_antenna_gain = chandef->chan->max_antenna_gain;
>>  
> 
> For what it's worth, I already got a similar patch from QCA a few month ago, and
> it fixed some tx power problems when scanning so I know there is truth in this.
> 
>>  	arg.pref_tx_streams = ar->num_tx_chains;
>>  	arg.pref_rx_streams = ar->num_rx_chains;
>>
>> base-commit: 903aaf66edc97dd5b9e3118d19677291051a9c40
> 
> But there also was more in the patch:
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index a97e1399eeed..87e3ae49afa5 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2563,6 +2563,8 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k *ar,
>  						  WMI_CHAN_REG_INFO1_REG_CLS);
>  			*reg2 |= le32_encode_bits(channel_arg->antennamax,
>  						  WMI_CHAN_REG_INFO2_ANT_MAX);
> +			*reg2 |= le32_encode_bits(channel_arg->maxregpower,
> +						  WMI_CHAN_REG_INFO2_MAX_TX_PWR);
>  
>  			ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
>  				   "WMI chan scan list chan[%d] = %u, chan_info->info %8x\n",
> 
> It seems that ath11k has a similar piece of code in the equivalent function
> ath11k_wmi_send_scan_chan_list_cmd . Isn't this needed ?

This change is in a separate patch, which will be sent for public review soon.

> 
> Also I see that in ath12k/reg.c in ath12k_reg_update_chan_list we also send to
> the firmware:
> 			ch->maxpower = channel->max_power * 2;
> 			ch->maxregpower = channel->max_reg_power * 2;
> 			ch->antennamax = channel->max_antenna_gain * 2;
> 
> As it is in a different wmi message, I guess the units are different. 0.5 dBm
> increment in struct ath12k_wmi_channel_arg right ? Or should we remove the '*2'
> 

Yes, the firmware expects these values in 0.5 dBm increments, so we multiply 
them by 2 in the ath12k_reg_update_chan_list function.

