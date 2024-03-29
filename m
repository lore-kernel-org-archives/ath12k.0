Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE4ECD11DD
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejX7WA6CEulUy4Wyq0+pwMGa6pLxqtQg7gGpn2ixRo0=; b=kJ/7QYZbMfoTmw5TjjwihVZK0/
	YYxfpoxT8HLraPuiUZs2vy+Eb43LbV2uwSTXCVi3f1ukqCnKQGuQoLlogjw7cylg0+KwOcUa2DQsK
	IoGedo12ItFtZNkrSjL5WZq7VDks+CxCQLc7nrUaSOvfwryKg/33giu72M7v0SoNiYjuHs79qtGlJ
	N/RpXlf6G3hVAT1zha+YZ8OEoBal0qUQNIJJigq9gy3aQoDsIUY9IPlBwQiWBHPZJP+2F7J4RzrVh
	Q0i+wnGDzYGCLLQsLiigpVEpGT1EPGoT7o7fms3xzgc4EVcxLGl2n5LeVxwS4l1GTFzIbvdZmoGjk
	L1Mk5R8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqD76-00000000sYV-1JZH
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 14:21:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqD72-00000000sWA-2mcs
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 14:21:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42T9glCL024605;
	Fri, 29 Mar 2024 14:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ejX7WA6CEulUy4Wyq0+pwMGa6pLxqtQg7gGpn2ixRo0=; b=NP
	A6A6TiuHJM4CPFXhLhUMHZHxsKXBI3u7hGWJgMH+RCpnAOaXJRuFmS/8iDeeQ3Cb
	FXxdhgXyu06/X6bYFdID+6OCRnlBauVY/uvvbPPHxIY9tPxm6+gxpvzgyYs85Bc1
	34RqjJuhxD+BVkyloKJF8TMsInfc4bmJ+WeHkRmcX3PFQmt1s3DGkDQVjCvLy/cN
	vMk9a8NGbewoke55k9ONeN0q43rYwiPgC5cz5TOhCXZY7SAGx3AM4qpG9NNiXMMn
	K2kIqHiqZKcEIgdGwgEz5g7TIbsaIkFb/W9EBjDaQt70ZT2ijsX+iknuCn/C02Z5
	dLnmp58YM4J3Gflzj4iw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5u89gprc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 14:21:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TELYNZ005721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 14:21:34 GMT
Received: from [10.216.7.62] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 07:21:31 -0700
Message-ID: <b455f267-9552-be3b-95b0-a036bfa8e14a@quicinc.com>
Date: Fri, 29 Mar 2024 19:51:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
        Jakub Kicinski
	<kuba@kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4LexPhEF2dgILNBJ8m42xD9gLAAI04c8
X-Proofpoint-ORIG-GUID: 4LexPhEF2dgILNBJ8m42xD9gLAAI04c8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403290127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072144_776790_3E41B747 
X-CRM114-Status: GOOD (  15.39  )
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



On 3/28/2024 5:31 PM, Johannes Berg wrote:
> On Thu, 2024-03-28 at 15:48 +0530, Karthikeyan Periyasamy wrote:
>> On 3/28/2024 1:19 PM, Johannes Berg wrote:
>>> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>>>> +/**
>>>> + * nl80211_multi_hw_attrs - multi-hw attributes
>>>> + *
>>>> + * @NL80211_MULTI_HW_ATTR_INVALID: invalid
>>>> + * @NL80211_MULTI_HW_ATTR_IDX: (u8) multi-HW index to refer the underlying HW
>>>> + *	for which the supported channel list is advertised. Internally refer
>>>> + *	the index of the wiphy's @hw_chans array.
>>> Is there a good reason to expose this? Seems pretty internal to me, and
>>> not sure what userspace would do with it?
>>
>> Hostapd use this hw index for the channel switch cmd.
> 
> What, where? I don't see that in this patchset? And why??
> 
> In any case, unless I just missed it and you're going to tell me to look
> at patch N, we don't need it here, and then I'd prefer to keep it an
> internal detail until it's needed.
> 
>> The hw index used as a sanity check to identify whether the user
>> requested channel fall under the different hw or not.
> 
> You mean within hostapd itself? That doesn't make sense, it can derive
> that information differently.
> 
>> In split-phy hardware, 5GHz band supported by two physical hardware's.
>> First supports 5GHz Low band and second supports 5GHz High band.
> 
> In your hardware design anyway, but yeah, I get it.
> 
>> In this case, user space cannot use band vise check here to identify
>> given channel or freq supported in the given hardware.
> 
> No, but it also doesn't need an index assigned by the kernel for that.
> 

The only purpose of hw index is to link hw_chans to per-hardware 
interface combination capability so that each hardware can be
identified during interface combination checks capability vs
current state. Thinking if we can embed the channel list also
into per-hardware interface combination signaling by giving the
pointer?

Vasanth

