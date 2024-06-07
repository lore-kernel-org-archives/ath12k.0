Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD22C27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 06:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7ffYYgLvNY1C+roSNt5o8PywPtnU5+WPqjtwVn40TU=; b=YYPUzJ0dzuHP3MIJjcoj1x9fEi
	WuO4cgYGlRe6q+A4aAzj6tC1mm7T9tACHbLcWuYtcrDVklJXtvY1bkH3jvbC0qEeMljURdMeI9zYg
	S4SVwmBgp+uiE94bD0o4qwpo2HXievPrD+kSiN1nqtJwvNJsb7A435DznO2eVR4q39ZRDGK9SMNau
	aCD7XC+E/BpI8/1oJPOxbE04tax8odFgrxOg3VV6g3EY+SSDlIGK9Tpy5I0bEHJniSnd3YEjR+htq
	OMKrxx6KLrhg2o7ID84lmrdgbOa/KDcN79HOqNwS+pi2dhI7wjjKh/aBLuKsz9gdgIuQQwMnEfZBu
	I9Frvxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTM0-0000000CkQk-2doe
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 06:45:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTLx-0000000CkQF-2szO
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 06:45:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4574iQmD009744;
	Fri, 7 Jun 2024 06:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7ffYYgLvNY1C+roSNt5o8PywPtnU5+WPqjtwVn40TU=; b=BDQ4o+jPoiSs8s30
	fzWNKJay6gJgj0K3omWDinLwc4lzk7hYnb1uJVeeiiIejrPTq+qk0nKWWGt3+OwP
	drkJEqSSpD50pePVkDbrd7NeaP5zpj6R4RLNsdD87nVnDxDdawhz3cuOftLT4n/C
	QFo3g/PWWoT7ndGDczEW1QCghQE6iypoUWNAft5E7ZrRgHdCbt3NlLjilUWbjtPr
	S00SsiPd7GxsjskDricP63S5U2DqcncEbQCPay09FMP8JuWwt7BegIdQ/bCE33t/
	UbIoDk+XF9nTP3fQgpV3xb7pObjrmGKZp7VVhX/1QsH9XlEOYvQdrZY0klqeLcPy
	7bIX1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rpqkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 06:45:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4576jVY1023278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 06:45:31 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 23:45:27 -0700
Message-ID: <6704d2ba-8ac8-cd33-9d3b-95dae2613d9f@quicinc.com>
Date: Fri, 7 Jun 2024 12:15:24 +0530
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
 <cdf2d06a-4d06-df69-245b-fc9ece0c1f2b@quicinc.com>
 <da6038ed-87f8-40ec-a327-6065334097af@nbd.name>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <da6038ed-87f8-40ec-a327-6065334097af@nbd.name>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7ywB99utMr4VU-DB9pksoKAaoA2vu_dZ
X-Proofpoint-ORIG-GUID: 7ywB99utMr4VU-DB9pksoKAaoA2vu_dZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=962 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_234533_839959_BA6D5D35 
X-CRM114-Status: GOOD (  18.09  )
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



On 6/7/2024 10:33 AM, Felix Fietkau wrote:
> On 07.06.24 06:54, Karthikeyan Periyasamy wrote:
>>
>>
>> On 6/7/2024 10:05 AM, Felix Fietkau wrote:
>>> On 07.06.24 06:25, Karthikeyan Periyasamy wrote:
>>>>
>>>>
>>>> On 6/6/2024 11:37 PM, Felix Fietkau wrote:
>>>>> DFS can be supported with multi-channel combinations, as long as 
>>>>> each DFS
>>>>> capable radio only supports one channel.
>>>>>
>>>>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>>> ---
>>>>>   net/mac80211/main.c | 32 ++++++++++++++++++++++++--------
>>>>>   1 file changed, 24 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
>>>>> index 40fbf397ce74..e9c4cf611e94 100644
>>>>> --- a/net/mac80211/main.c
>>>>> +++ b/net/mac80211/main.c
>>>>
>>>> ...
>>>>
>>>>>   int ieee80211_register_hw(struct ieee80211_hw *hw)
>>>>>   {
>>>>>       struct ieee80211_local *local = hw_to_local(hw);
>>>>> @@ -1173,17 +1188,18 @@ int ieee80211_register_hw(struct 
>>>>> ieee80211_hw *hw)
>>>>>               if (comb->num_different_channels > 1)
>>>>>                   return -EINVAL;
>>>>>           }
>>>>> -    } else {
>>>>> -        /* DFS is not supported with multi-channel combinations 
>>>>> yet */
>>>>> -        for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
>>>>> -            const struct ieee80211_iface_combination *comb;
>>>>> -
>>>>> -            comb = &local->hw.wiphy->iface_combinations[i];
>>>>> +    } else if (hw->wiphy->n_radio) {
>>>>> +        for (i = 0; i < hw->wiphy->n_radio; i++) {
>>>>> +            const struct wiphy_radio *radio = &hw->wiphy->radio[i];
>>>>> -            if (comb->radar_detect_widths &&
>>>>> -                comb->num_different_channels > 1)
>>>>> +            if 
>>>>> (!ieee80211_ifcomb_check_radar(radio->iface_combinations,
>>>>> +                              radio->n_iface_combinations))
>>>>>                   return -EINVAL;
>>>>>           }
>>>>> +    } else {
>>>>> +        if 
>>>>> (!ieee80211_ifcomb_check_radar(hw->wiphy->iface_combinations,
>>>>> +                          hw->wiphy->n_iface_combinations))
>>>>> +            return -EINVAL;
>>>>>       }
>>>>>       /* Only HW csum features are currently compatible with 
>>>>> mac80211 */
>>>>
>>>> Are we omitting the "wiphy->iface_combinations" if the radio specific
>>>> iface combination advertised ?
>>>>
>>>> If so, it looks like unused "wiphy->iface_combinations" for radio
>>>> specific combination advertised.
>>>
>>> This patch series assumes that you have both 
>>> wiphy->iface_combinations and radio->iface_combinations set. 
>>> wiphy->iface_combinations applies to the full wiphy, whereas 
>>> radio->iface_combinations only applies to vifs assigned to the radio.
>>
>>
>> If radio->iface_combinations is set then always vifs assigned to the
>> radio. so wiphy->iface_combinations get avoid for all the use cases.
>>
>> Ultimately either of one combination only get used by this proposal.
>>
>> or I am missing something here ?
> 
> The functions that perform interface combination checks are called both 
> with -1 as radio_idx (meaning per-wiphy), as well as with the assigned 
> radio id. That way, both kinds of combinations/limits are checked and 
> enforced.
> 
In the radio specific iface advertisement, global iface combination 
represent the union or intersection of all radio iface combination ?

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

