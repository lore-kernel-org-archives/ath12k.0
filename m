Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F239C54E67
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93YM5qXrGBXdDNyLUklgisAaCVZ+0WF+yRUbnOKQ9iA=; b=I7+fp9+4qFmylDpSNs8NSBLuC2
	sXRcbHVRTSGuh1EqShoAltMV8q1BCmgTRjKZSz7uZeQ9rq7AYQ5vdUzTZsgzxHep45IxY6beFrxP1
	fdY/iAq9yuTX/s8219pa80F5K6MQ/rLRF0cnE/Dnv8UteQUlFxD3kjjtPEBU+jJD5W3L6J6BaigXH
	i8OSxFBmIcjc14JNRpQSFg5KUaEfjTbb3JAnA/KmKVVd4khNjVMnoBcrjYti6G4M2Ug3KBsyWP8dq
	PEXoVeqv+8XFr//sjRN3BuOwnw97R8Ut0BG6wPLk2u1jM01QoMEtsM5iVoP0YtejUfvbahdTp2Iok
	m0gqbznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprPQ-0000000ETRn-0P0r
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 15:11:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprPK-0000000ETOC-2mSu
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 15:11:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42SEt1gl003007;
	Thu, 28 Mar 2024 15:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=93YM5qXrGBXdDNyLUklgisAaCVZ+0WF+yRUbnOKQ9iA=; b=DC
	1mmQlsjBD2WIZMJVE0CMMWz/4XCpSxvcUaRLY8KHQyqtJEgS+1pf9beJOB5BnEE8
	AaVHYp8AyP1/g0oYMfVCcyzFrB5y+hy0DS6+SNvwmDPbo1mHnGSYha8d1FE2A0Kp
	cgirEkINQ0E7ecJkGKy5HX6YjwQrjeaQ/HAFR4pZ3z6LQ8OF35iQoxXWgZx5qSc4
	Qegn1q3grt4K5ecZswKg+LuEzOEfuu4KUjbxBO6iYXAjifbdyvq3KrophEgIsyfB
	7nJ8D2Ji3waiKWtzmznQgiVNsWM5PgI7q3yJTz0oBrhpelqPBbXDto9HWQFbWRxK
	qI0ojZyjxcEXhYDQ+bYA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5aqug1je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 15:11:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42SFB5Pn024319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 15:11:05 GMT
Received: from [10.50.27.20] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 08:11:02 -0700
Message-ID: <14b739c9-18da-0d58-b58d-cccebc505950@quicinc.com>
Date: Thu, 28 Mar 2024 20:40:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>,
        <netdev@vger.kernel.org>, Jakub Kicinski
	<kuba@kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rIhQfC8DJ_4OyzryFmkwTIs1-_dnuRQd
X-Proofpoint-GUID: rIhQfC8DJ_4OyzryFmkwTIs1-_dnuRQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_15,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1011 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403280104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_081110_953484_F275A7C8 
X-CRM114-Status: GOOD (  24.98  )
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
>> Hostapd use this hw index for the channel switch cmd.
> What, where? I don't see that in this patchset? And why??
>
> In any case, unless I just missed it and you're going to tell me to look
> at patch N, we don't need it here, and then I'd prefer to keep it an
> internal detail until it's needed.
>
>> The hw index used as a sanity check to identify whether the user
>> requested channel fall under the different hw or not.
> You mean within hostapd itself? That doesn't make sense, it can derive
> that information differently.
>
>> In split-phy hardware, 5GHz band supported by two physical hardware's.
>> First supports 5GHz Low band and second supports 5GHz High band.
> In your hardware design anyway, but yeah, I get it.
>
>> In this case, user space cannot use band vise check here to identify
>> given channel or freq supported in the given hardware.
> No, but it also doesn't need an index assigned by the kernel for that.

Yes


>>>> +	for (i = 0; i < wiphy->num_hw; i++) {
>>>> +		hw_mac = nla_nest_start(msg, i + 1);
>>> And you kind of even have it here already ...
>> Then user and kernel have to make an assumption that implicit index used
>> in the life cycle.
> Agree that's maybe not a great idea, for all we care this could just use
> 0 as the index anyway.
>
> Which reminds me ...
>
> Right now, the way you have it, we have the following structure:
>
> NL80211_ATTR_MULTI_HW
> - 1
>    - NL80211_MULTI_HW_ATTR_IDX: 0
>    - NL80211_MULTI_HW_ATTR_FREQS
>      - 0: 2412
>      - 1: 2417
>      ...
> - 2
>    - NL80211_MULTI_HW_ATTR_IDX: 1
>    - NL80211_MULTI_HW_ATTR_FREQS
>      - ... as above with 5 GHz etc.
> ...
>
>
> Netlink is kind of moving away from nested arrays though:
>
> https://kernel.org/doc/html/latest/userspace-api/netlink/specs.html#multi-attr-arrays
> https://kernel.org/doc/html/latest/userspace-api/netlink/genetlink-legacy.html#attribute-type-nests
>
> This talks about families, but maybe we shouldn't read that literally
> and do the new style for new arrays in existing families as well, not
> just new families.
>
> If we do that, including NL80211_MULTI_HW_ATTR_IDX for illustrative
> purposes though I think it should be removed, we'd end up with:
>
> NL80211_ATTR_MULTI_HW
>   - NL80211_MULTI_HW_ATTR_IDX: 0
>   - NL80211_MULTI_HW_ATTR_FREQ: 2412
>   - NL80211_MULTI_HW_ATTR_FREQ: 2417
>   ...
> NL80211_ATTR_MULTI_HW
>   - NL80211_MULTI_HW_ATTR_IDX: 1
>   - NL80211_MULTI_HW_ATTR_FREQ: 5180
>   - NL80211_MULTI_HW_ATTR_FREQ: 5200
>   ...
>
> which _is_ a lot more compact, and removes all the uninteresting mid-
> level indexing.

Can you point to any attribute constructed in this way from kernelspace 
for the reference to explore more ?

-- 

Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


