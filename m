Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09244C27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 04:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTDhFd+78pMcDuSu6yIkaJahSKZqTdviJjzyFbzHJdI=; b=D1izNHsuQ7UPBGiundW5c+ZOmG
	ohDLjVBSmi2RSgo9BcKTS7Ulh6kcBYjhYbbPuZSb6Du2AWWXjQFU3/v2vHV/AfsS9oqRZ0A1KEDdF
	ZV7qUiKSgJMDIoBPVidAEieJ+3S+8c0I2Ar1S1xPlQl1llAm161RG1r9DnVTpWYVoJ9lYAucxBAqa
	abYsZjYjGOJN/je95SwOWtRaGV37qsV34R22dX65AIOzSDS7tR8nAgwUXWqG7IZOyNMWUuzc9Sj5l
	8U6RaIS1N6SscLrVxENrl1ncYVISAJ1scyiF9KT9zUCZ5xQmlmTwUlStapZdNOhORrGblB0RKurM+
	bd1CU24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRcd-0000000CQAd-2Kr8
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 04:54:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRca-0000000CQ9w-2Odj
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 04:54:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456I1dAI030512;
	Fri, 7 Jun 2024 04:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTDhFd+78pMcDuSu6yIkaJahSKZqTdviJjzyFbzHJdI=; b=Fhvndsuc6Hlzi7N/
	Td2k1bj6y6o0DhgFgOSioNlJ8v+SMr+b4Sc5hBtb4NYcZ6+hPKBQIuSHLuOEIxaF
	qAHDvLFlM3C5bPujjslmAT3dou5UEuUXRlrjlSt27H4SO7AjbAKJO5GX/NDLWSM0
	2yKDhGataeISgZX0eWYtaMuRlsopqbXcVztCjRmChIHToRTUZD8j5shlVGR6z9nH
	+4dK86+hxFG8eEPS5jGka+KoKVqh83j0ueQJq1qQpCHJlNly39eB8eNwhEsdKNQt
	LRTuBVTqZyrYvoHtIdneNf0UdfyZ7NYoeyAEbkXC9+S8KSe2u9RLMgtB1pBfsbf4
	eY3Z3g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yk8tcadr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 04:54:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4574sXcG009855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 04:54:33 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 21:54:31 -0700
Message-ID: <cdf2d06a-4d06-df69-245b-fc9ece0c1f2b@quicinc.com>
Date: Fri, 7 Jun 2024 10:24:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC v3 4/8] wifi: mac80211: add support for DFS with multiple
 radios
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: <johannes@sipsolutions.net>, <quic_adisi@quicinc.com>,
        <ath12k@lists.infradead.org>
References: <cover.386a66ec6a89750d4890f63f0d28582a52b838b5.1717696995.git-series.nbd@nbd.name>
 <7cc3d89225f365c85b363874725cfbc77c9c1db5.1717696995.git-series.nbd@nbd.name>
 <2014e488-b930-43ff-86a6-c5a4801b82f5@quicinc.com>
 <21956735-3a04-4f29-8f13-0f84ed93cda2@nbd.name>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <21956735-3a04-4f29-8f13-0f84ed93cda2@nbd.name>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lRNKnO5T5doTfq00LqmXjlUKbfLytThQ
X-Proofpoint-GUID: lRNKnO5T5doTfq00LqmXjlUKbfLytThQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406070033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_215436_748611_847510FD 
X-CRM114-Status: GOOD (  18.20  )
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



On 6/7/2024 10:05 AM, Felix Fietkau wrote:
> On 07.06.24 06:25, Karthikeyan Periyasamy wrote:
>>
>>
>> On 6/6/2024 11:37 PM, Felix Fietkau wrote:
>>> DFS can be supported with multi-channel combinations, as long as each 
>>> DFS
>>> capable radio only supports one channel.
>>>
>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>> ---
>>>   net/mac80211/main.c | 32 ++++++++++++++++++++++++--------
>>>   1 file changed, 24 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
>>> index 40fbf397ce74..e9c4cf611e94 100644
>>> --- a/net/mac80211/main.c
>>> +++ b/net/mac80211/main.c
>>
>> ...
>>
>>>   int ieee80211_register_hw(struct ieee80211_hw *hw)
>>>   {
>>>       struct ieee80211_local *local = hw_to_local(hw);
>>> @@ -1173,17 +1188,18 @@ int ieee80211_register_hw(struct ieee80211_hw 
>>> *hw)
>>>               if (comb->num_different_channels > 1)
>>>                   return -EINVAL;
>>>           }
>>> -    } else {
>>> -        /* DFS is not supported with multi-channel combinations yet */
>>> -        for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
>>> -            const struct ieee80211_iface_combination *comb;
>>> -
>>> -            comb = &local->hw.wiphy->iface_combinations[i];
>>> +    } else if (hw->wiphy->n_radio) {
>>> +        for (i = 0; i < hw->wiphy->n_radio; i++) {
>>> +            const struct wiphy_radio *radio = &hw->wiphy->radio[i];
>>> -            if (comb->radar_detect_widths &&
>>> -                comb->num_different_channels > 1)
>>> +            if 
>>> (!ieee80211_ifcomb_check_radar(radio->iface_combinations,
>>> +                              radio->n_iface_combinations))
>>>                   return -EINVAL;
>>>           }
>>> +    } else {
>>> +        if 
>>> (!ieee80211_ifcomb_check_radar(hw->wiphy->iface_combinations,
>>> +                          hw->wiphy->n_iface_combinations))
>>> +            return -EINVAL;
>>>       }
>>>       /* Only HW csum features are currently compatible with mac80211 */
>>
>> Are we omitting the "wiphy->iface_combinations" if the radio specific
>> iface combination advertised ?
>>
>> If so, it looks like unused "wiphy->iface_combinations" for radio
>> specific combination advertised.
> 
> This patch series assumes that you have both wiphy->iface_combinations 
> and radio->iface_combinations set. wiphy->iface_combinations applies to 
> the full wiphy, whereas radio->iface_combinations only applies to vifs 
> assigned to the radio.


If radio->iface_combinations is set then always vifs assigned to the 
radio. so wiphy->iface_combinations get avoid for all the use cases.

Ultimately either of one combination only get used by this proposal.

or I am missing something here ?


> 
> - Felix

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

