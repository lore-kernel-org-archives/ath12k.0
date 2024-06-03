Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E970C25B75
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deGssg183ZCrpccPm/B9J68lLaxpGMT56NuhV3wYCVM=; b=ZeUMogZkq11cz9qPkFc1z0kh0o
	bDxFEeEJ+cGvofQ2SG2Uv/6b8YBIfqPwJ8pmFCWR5UIOb7LBB18LwMQDC433HXzJiLYC1j99CzdgD
	at0l7bfkyWzpms5R0Wq/VdiX8ZDjBX+sbl2ou/wjGMnYxNsro2A8hhqUEmYOCQcwCLjgWJDmco6iF
	PiV/Rxl4cKHWVP/e+ARFojQ5kY4TnHTKrB4eq2WgJFa1PzCj9RzwT9njMzMq7lvSU64Whxz/4N/ib
	onekmTp/bI5/Xaq7KLOYMc95c+1vEolw2vKIOvNLYGNL9A+IeKvgzR5cW2ArwYUA3DTRYldKSTH1i
	leZ8TYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE8Zh-0000000H337-3Cr8
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 14:22:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE8Zf-0000000H321-07QG
	for ath12k@lists.infradead.org;
	Mon, 03 Jun 2024 14:22:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453AL2Hx001255;
	Mon, 3 Jun 2024 14:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	deGssg183ZCrpccPm/B9J68lLaxpGMT56NuhV3wYCVM=; b=FrEL90mEx5JAG4hq
	JIUXEq0fXb2Ym5MGbPnGk9zdiNyi8ymNeoNSsuiFhGzvvzv9azW0wGI4kxZdaP2e
	jfOBZ7kSi4j7n4bWk8hpY6oWiofz/AnyDW93QYZb+01YEBpDyDYN3mgp4AAcOtZ8
	1asMBzW8cWskMXZf5e0mrAXQUCkY79IhGSm4lx77Hp72a0lObLoAERar+2iQZYrF
	HR9fFo0G6iVrZ61M4g8O6Ek9W01klnuWn1k1dPb428frweeDhllrNFyHLQcheBF6
	E7/u8JFo0hxss6rqZpd5vei5B0eWxmY0ygEwr+u2rdnh9LYSnRQxbAdek5t6n1MX
	Lqi97A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wm434-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 14:22:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453EM8Xv029402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 14:22:08 GMT
Received: from [10.48.241.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 07:22:07 -0700
Message-ID: <991e7861-0c6e-4c77-a866-4295d775df35@quicinc.com>
Date: Mon, 3 Jun 2024 07:22:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] wifi: ath12k: support ARP and NS offload
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240530072714.25671-1-quic_bqiang@quicinc.com>
 <20240530072714.25671-7-quic_bqiang@quicinc.com>
 <ccf9791b-e050-4844-8c37-35873fb3fcaf@quicinc.com>
 <17721436-19fb-4337-9058-b20f4df2792c@quicinc.com>
 <af326e49-df6e-4574-9562-44b6aee10abd@quicinc.com>
 <29f1a482-2ead-474a-93a1-00616bcf06f8@quicinc.com>
 <0a386734-5796-4d99-ad4b-ee0a5653a25e@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <0a386734-5796-4d99-ad4b-ee0a5653a25e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HjqLcgd7FzlruVjyGB9-JypXonw18dNB
X-Proofpoint-ORIG-GUID: HjqLcgd7FzlruVjyGB9-JypXonw18dNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_11,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=940 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_072211_139938_AF38F220 
X-CRM114-Status: GOOD (  14.51  )
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

On 6/2/2024 7:48 PM, Baochen Qiang wrote:
> 
> 
> On 6/1/2024 1:26 AM, Jeff Johnson wrote:
>> On 5/30/2024 10:11 PM, Baochen Qiang wrote:
>>>
>>>
>>> On 5/31/2024 11:42 AM, Baochen Qiang wrote:
>>>>>> +static void ath12k_wow_prepare_ns_offload(struct ath12k_vif *arvif,
>>>>>> +					  struct wmi_arp_ns_offload_arg *offload)
>>>>>> +{
>>>>>> +	struct inet6_dev *idev = arvif->idev;
>>>>> as noted above does it make more sense to get the netdev associated with the
>>>>> arvif and then use in6_dev_get(net_device) to get the inet6_dev rather than
>>>>> caching the pointer from the ipv6_addr_changed() callback?
>>>> Ah.. I didn't note that we can get inet6_dev in such a way, just thought the only way is to cache it in ipv6_changed() callback.
>>>>
>>>> will get it using the following in next version:
>>>> 	struct ieee80211_vif *vif = container_of(arvif)
>>>> 	struct ieee80211_sub_if_data *sub_if_data = container_of(vif)
>>>> 	struct net_dev *ndev = sub_if_data->dev
>>>> 	struct inet6_dev *idev = in6_dev_get(ndev)
>>> Just found that ieee80211_sub_if_data is internal to mac80211, so not possible to get netdev in this way.
>>>
>>> any other ideas on how to get netdev?
>>
>> Thinking about this some more, it seems like you'd want to send these down to
>> firmware immediately so that they'd be available for NS offload. Does firmware
>> support NS offload even when host is awake (I think the downstream Android
>> driver supports that)?
> And really curious about the use case in Android scenario.

It's all about saving power. The application processor consumes way more power
than the firmware processors, so any work that can be performed by firmware
extends battery life.

A laptop running on battery would presumably benefit from this as well.

But let's get basic functionality in place using ieee80211_vif_to_wdev()

