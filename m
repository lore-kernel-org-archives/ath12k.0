Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46119CF6493
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfXsIX7bDiQM0vDoEE1WYLH9iUJupMZDWe5xAN3clH4=; b=jpjAnDUk4YzktH8DEeS5q+8S2n
	3T8/rtgiAZBwWmPoFuO9qgTg2XJJU7+QXqR4PwVIkFpH77hIUIDVHNri6oKw7RMibqpWVbYILUU9/
	GZAwy99zJYN/cnOIpSqAmXKfNiEiXQY4tsZs2LOJ0aAXpMBhoOlHt7IThKEGNsN1wVk83PfGlkrlf
	QUziQdatfpSmVVQkqV2swuVMjWW2UkGCF129WL9tGwF2xaw+ykl3F1PIlPIKIlQuJMiefAjLM7kgq
	MWqPOVFFikJKyUneZrmbEyW/71BZsB2Ee/k/Rsv6+UmarwACzABXwYzMDRih4E10O2tv5DtO7x5T0
	Won8Af7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svX8x-00000001sNd-34Cc
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 07:17:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svX8t-00000001sN9-3bfc
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 07:17:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4911J8P1028034;
	Tue, 1 Oct 2024 07:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfXsIX7bDiQM0vDoEE1WYLH9iUJupMZDWe5xAN3clH4=; b=AhBNNx7Utb3XNFmA
	9kik8xNKd+bWjyWoBcvDDmYGtQtAjOoQQTGsvd2+71ajQ/3q9sbVNbAe1Fh0JCyr
	07UXYJ4oLEEfCKHX96tGYxMw2gCx+VpOEWUpQAh72WlGTDhRVcRRucqWfL8VFeWN
	veaRt6MhBZCyg8nn8/3Rbl/Epo60XeZbGA8s0oMKd0IxQeR56vWn/RWF7xSzcTHB
	kIZ6RNb10Zl+SZrupKVRoC1vCdAikeqkr0o3Czby6fQKJgoWROsIdcDQkGO/M1/K
	DJvOJQgLTKLFmNTOMzKguFzL05DLj061ujw5LXN351ZNaldWhM15EQ4E96aEd+Ur
	2hn3cw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xajff9c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 07:17:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4917Hrd9030654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 07:17:53 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 00:17:51 -0700
Message-ID: <fd731cac-7182-4de3-afd4-0fc5892a9440@quicinc.com>
Date: Tue, 1 Oct 2024 12:47:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
 <0353d31db76afbd5d9bb2e7d42246ae3c8e14044.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <0353d31db76afbd5d9bb2e7d42246ae3c8e14044.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v52bT58tpK4tvN7O4Wok37kzR34qzI28
X-Proofpoint-ORIG-GUID: v52bT58tpK4tvN7O4Wok37kzR34qzI28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_001756_003389_BB5C7EE0 
X-CRM114-Status: GOOD (  22.29  )
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

On 10/1/24 12:01, Johannes Berg wrote:
> 
>> +		/*
>> +		 * inform about the link info changed parameters after all
>> +		 * stations are also added
>> +		 */
> 
> I don't understand that comment - you're not doing anything with the
> stations here? And per the commit log it's explicitly _not_ after doing
> the AP station. I'm not sure we should set up everything before the AP
> station?
> 

Okay let me try to explain the situation here -

In the *if (add)* block, drivers are informed about the new links added 
via drv_change_vif_links(). For drivers like ath12k, we know which link 
is changing, but since the channel contexts for the new links aren’t 
available yet, the driver can’t determine which link the firmware should 
create the interface for. This is because we have more than one firmware 
operating under this interface (grouped multiple hardware under single 
wiphy). Therefore, this notification isn’t very helpful in creating the 
link interface now.

Next, in the loop list_for_each_entry(sta, &local->sta_list, list), 
drv_change_sta_links() is called to notify drivers that the links for a 
given station (STA) have changed. Drivers use this callback to create 
the link stations after the STA has moved to the authorized state.
At this point, the driver knows which ML STA and which link STA to 
create. However, to create a link STA, the corresponding link interface 
must exist first.

Currently, it doesn’t, so the driver can’t add the link STA.

Later, in the loop for_each_set_bit(link_id, &add, 
IEEE80211_MLD_MAX_NUM_LINKS), channels are added. At this stage, the 
driver will actually create the link on the interface at its own level. 
Since here using the channel information, appropriate firmware can be 
picked. For example 2 GHz or 5 GHz or 6 GHz firmware.



>> +						  BSS_CHANGED_HE_BSS_COLOR);
>> +
>> +	}
> 
> You make it look like you just moved code but also snuck in a new blank
> line :)
> 

:) sorry about that. Will fix in next version.

> 
>> +
>>   	for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
>>   		struct ieee80211_link_data *link;
> 
> I also think you put this code too early now - you're now first using
> more channel contexts by way of _ieee80211_link_use_channel() before you
> even release the ones from deactivated ("rem" bitmap in this code)
> links. That doesn't seem like it could work correctly in general.
> 

hmm... yeah true that. May be I will move this once the old links are 
removed?

-- 
Aditya


