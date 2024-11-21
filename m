Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA7BD75BA7
	for <ath12k@archiver.kernel.org>; Thu, 21 Nov 2024 03:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaYMoYxnGRA6YNHgnvWk2AVoYTu+FEc7aPAWZBWd1Bc=; b=10d+st2RbHkDwPmlvrZAxUVY0u
	RXNNf5lXt76Oted6fv4xiqqantaozjxY9RfbCYhF/07pV4thk+gIv6O3cbav3lKwCRtC9SriOfKAG
	jJBbHnqUo3Rl5Tu+DAXOGAwk1kdZcEnSOOCmoqoTYylmVAc4HYXhxkH7tdY96cxXv/pSvJHeVLdgi
	ly8HQJrKkfamuBgFUN/h5CLKqy99iAJIDOPPz9gnvx/LhQspECoGwZ5kAFbxSESmswCgzUq/8bjjd
	4wcUhTRjbhTWgqc3cnmbcvCctL4j9GOPtnoE8WY1vjjXw3+DAP2PmbUIWqRvycShJChBTJAl+irtl
	sjo+hR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxyq-0000000Gi2P-2iop
	for ath12k@archiver.kernel.org;
	Thu, 21 Nov 2024 03:35:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxyn-0000000Gi1j-1VDM
	for ath12k@lists.infradead.org;
	Thu, 21 Nov 2024 03:35:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKNtHdI020236;
	Thu, 21 Nov 2024 03:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uaYMoYxnGRA6YNHgnvWk2AVoYTu+FEc7aPAWZBWd1Bc=; b=LdptRzoAfDqYDYlu
	hkY1vDOG8/kBt2Jp592H/K1l9/Nb21JwJYcJvOuOeB8c1UAmRnfqdDrvXB8M4pRg
	C5CQsEX9DntuLgVWPahDBYi+74pW7dk5mm3AzIgmFe38to0AquBa8asJqal9MKJ6
	60fCwlKZ2j9vBT1JpcdOq8wZ9xFXUxWDvsvf0EW/vmWVa4D5c8i/5o+ufbOiXhX3
	QKyL80gVp0TjQfYCZ8EyIjxoh6eSPc/sW3wRvuUJyV6WUSr/OPb6CEnV/g5pNMP9
	UL/iOkavM1sUdz8zTwUO0PgqePr29L0afW+kebQDlXavG4PD8LD+s9NKNhggkJql
	6P7EMg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2gd20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 03:35:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL3ZYl1013981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 03:35:34 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 19:35:33 -0800
Message-ID: <d7a0d62c-4723-4e9f-a362-2ea51aaba3ed@quicinc.com>
Date: Thu, 21 Nov 2024 11:35:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-2-kvalo@kernel.org>
 <2e706d58-5d83-4867-9963-c62441cdd4da@quicinc.com>
 <87y11o2x9h.fsf@kernel.org>
 <97f3f465-6ebd-4ca1-b672-4c8c7f42220d@quicinc.com>
 <87bjy9zonx.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87bjy9zonx.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3xKTtRPcvfTI5lpF338KOlyKuMoSNQPp
X-Proofpoint-ORIG-GUID: 3xKTtRPcvfTI5lpF338KOlyKuMoSNQPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=771 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_193541_532454_3C928E0B 
X-CRM114-Status: GOOD (  15.04  )
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



On 11/21/2024 3:32 AM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>>>>> +static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
>>>>> +					      struct ath12k_sta *ahsta,
>>>>> +					      u8 link_id)
>>>>> +{
>>>>> +	struct ath12k_link_sta *arsta;
>>>>> +
>>>>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>>>>> +
>>>>> +	if (WARN_ON(link_id >= IEEE80211_MLD_MAX_NUM_LINKS))
>>>>> +		return;
>>>>> +
>>>>> +	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
>>>>> +
>>>>> +	if (WARN_ON(!arsta))
>>>>> +		return;
>>>>> +
>>>>> +	ath12k_mac_unassign_link_sta(ah, ahsta, link_id);
>>>>> +
>>>>> +	arsta->link_id = ATH12K_INVALID_LINK_ID;
>>>>> +	arsta->ahsta = NULL;
>>>>> +	arsta->arvif = NULL;
>>>>
>>>> if arsta is not deflink and would be freed, can we avoid these
>>>> cleanup?
>>>
>>> I think that's something we can cleanup later if needed. Sure, it's
>>> extra assignments but it's not really doing any harm.
>> exactly, but ideally we should avoid unnecessary effort if possible.
>>
>>>
>>>>> +	if (arsta != &ahsta->deflink)
>>>>> +		kfree(arsta);
>>>>
>>>> I know the actual free happens here, but why split them?
>>>
>>> You mean why have a separate function ath12k_mac_unassign_link_sta() and
>>> instead just have all code the in
>>> ath12k_mac_free_unassign_link_sta()?
>>
>> yes. such that we can have synchronize_rcu() and kfree() located together.
> 
> Ok, I think I now get what you mean. Does this look better:
> 
> static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
> 					      struct ath12k_sta *ahsta,
> 					      u8 link_id)
> {
> 	struct ath12k_link_sta *arsta;
> 
> 	lockdep_assert_wiphy(ah->hw->wiphy);
> 
> 	if (WARN_ON(link_id >= IEEE80211_MLD_MAX_NUM_LINKS))
> 		return;
> 
> 	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
> 	if (WARN_ON(!arsta))
> 		return;
> 
> 	ahsta->links_map &= ~BIT(link_id);
> 	rcu_assign_pointer(ahsta->link[link_id], NULL);
below synchronize_rcu() should be moved to here, such that any change to arsta can happen only AFTER all existing RCU readers finish accessing it.

> 
> 	if (arsta == &ahsta->deflink) {
> 		arsta->link_id = ATH12K_INVALID_LINK_ID;
> 		arsta->ahsta = NULL;
> 		arsta->arvif = NULL;
> 		return;
> 	}
> 
> 	synchronize_rcu();
> 	kfree(arsta);
> }
other than that this change looks good to me.

> 
> BTW your lines are really long, please check your settings:
sure, will check.

> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20241106142617.660901-2-kvalo@kernel.org/
> 


