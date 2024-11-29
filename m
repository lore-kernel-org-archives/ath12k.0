Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACAFD70E02
	for <ath12k@archiver.kernel.org>; Fri, 29 Nov 2024 01:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVElr7IbIf0QnIfUpYRPia6I8P75pkU+MLI1xl3ZsAI=; b=A54ElUTYJgEfY5h2Vq6qodcvHd
	GjjLphz9HpD4h6nec40xWSv6dtK5U0nT5aT2Lt4Q6rcvPengFRdJv2+VZOVOfUWQTPfKcXGwQj74z
	8zRJhHRv/lUw7KmGV7+kygTix1OWj3KoHdFPcqqAGgmrRt0fWvKqe71uwUNIyTAAujDTF4Bj8HM0O
	Sp1c3U/YRp4txofOUkF2xNd+G49rOjreTswa/903KQ6B2jr+yDV0cJtbva9ll4XdjSjp59ahvrtLq
	kfth+iJibPZCuqKhxcFGE5S7tCg9w3S5UMtY48SMhh5mSOuw+nOy9S/iTAy4WmH7FzuysFspuYZiS
	2sIjoQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGq4G-0000000Gh5Q-1Rlm
	for ath12k@archiver.kernel.org;
	Fri, 29 Nov 2024 01:45:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGq4D-0000000Gh4o-0qLd
	for ath12k@lists.infradead.org;
	Fri, 29 Nov 2024 01:45:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLZ9U6011887;
	Fri, 29 Nov 2024 01:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVElr7IbIf0QnIfUpYRPia6I8P75pkU+MLI1xl3ZsAI=; b=ZiafERQEGGOEtheP
	0SNnj2QHA89OM971MVZADxWtnDToybDwf8kZavwsChGYOqLHu3IOX2/J3aHcWnqL
	jrtekR5WhxLaC6D0BgQZreJ8OrZFA1qN6AP54GhM7LPxesTsUQD8lsBYHNhSyZvn
	BC/fpoC/A9RZGajZyTqSdGZA2xsqnhYw7dNelkT2WE2Xk1onD5skrsPyXwWKzyOO
	fPBkw5IkRN0IgpsvHyfbRUxeNiKdQS/1PcJqfO6uk/j/aa6CWBRI+gfvYSRs9ayN
	Yf25G0cbv/mywGkTt7c2DI+rQSCFZErkAnQrC8gB5QuFnxzxpZXB+Vr5Fh6dw0bs
	kDw1QA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xxm54n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 01:45:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT1j4lO025984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 01:45:04 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 17:45:03 -0800
Message-ID: <8da34c5c-2a7b-436f-b9ed-2835396a7e65@quicinc.com>
Date: Fri, 29 Nov 2024 09:45:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] wifi: ath12k: ath12k_mac_op_tx(): MLO support
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
 <20241126171139.2350704-3-kvalo@kernel.org>
 <28bdb726-a7cf-40e7-8bc4-f7602bba1e93@quicinc.com>
 <87ttbrv8rs.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87ttbrv8rs.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IeIU6JNxGVNiLOjzbomTYu6QZl_3keRv
X-Proofpoint-ORIG-GUID: IeIU6JNxGVNiLOjzbomTYu6QZl_3keRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=746 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_174509_364946_A2B5BFEE 
X-CRM114-Status: GOOD (  16.70  )
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



On 11/28/2024 8:32 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> On 11/27/2024 1:11 AM, Kalle Valo wrote:
>>> From: Sriram R <quic_srirrama@quicinc.com>
>>>
>>> @@ -6848,6 +6848,7 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
>>>  static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
>>>  {
>>>  	struct ath12k *ar = container_of(work, struct ath12k, wmi_mgmt_tx_work);
>>> +	struct ath12k_hw *ah = ar->ah;
>>>  	struct ath12k_skb_cb *skb_cb;
>>>  	struct ath12k_vif *ahvif;
>>>  	struct ath12k_link_vif *arvif;
>>> @@ -6865,7 +6866,15 @@ static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work
>>>  		}
>>>  
>>>  		ahvif = ath12k_vif_to_ahvif(skb_cb->vif);
>>> -		arvif = &ahvif->deflink;
>>> +		if (!(ahvif->links_map & BIT(skb_cb->link_id))) {
>>> +			ath12k_warn(ar->ab,
>>> +				    "invalid linkid %u in mgmt over wmi tx with linkmap 0x%X\n",
>>
>> s/0x%X/0x%x/ ?
> 
> Fixed.
> 
>>
>>> +				    skb_cb->link_id, ahvif->links_map);
>>> +			ath12k_mgmt_over_wmi_tx_drop(ar, skb);
>>> +			continue;
>>> +		}
>>> +
>>> +		arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[skb_cb->link_id]);
>>>  		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id)) {
>>>  			ret = ath12k_mac_mgmt_tx_wmi(ar, arvif, skb);
>>>  			if (ret) {
>>> @@ -6875,9 +6884,10 @@ static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work
>>>  			}
>>>  		} else {
>>>  			ath12k_warn(ar->ab,
>>> -				    "dropping mgmt frame for vdev %d, is_started %d\n",
>>> +				    "dropping mgmt frame for vdev %d link_id %u, is_started %d\n",
>>>  				    arvif->vdev_id,
>>> -				    arvif->is_started);
>>> +				    arvif->is_started,
>>> +				    skb_cb->link_id);
>>
>> swap 'arvif->is_started' and 'skb_cb->link_id'.
> 
> Good catch! Fixed as well.
> 
>>> +/* Note: called under rcu_read_lock() */
>>> +static u8 ath12k_mac_get_tx_link(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
>>> +				 u8 link, struct sk_buff *skb, u32 info_flags)
>>> +{
>>> +	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
>>> +	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>>> +	struct ieee80211_link_sta *link_sta;
>>> +	struct ieee80211_bss_conf *bss_conf;
>>> +	struct ath12k_sta *ahsta;
>>
>> better to assert RCU read lock here?
> 
> You mean something like WARN_ON(!rcu_read_lock_held())? I'm not really a
> fan of that, I think it's better that we discuss this also once we
> document locking design properly.
> 
>>> +/* Note: called under rcu_read_lock() */
>>>  static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>>>  			     struct ieee80211_tx_control *control,
>>>  			     struct sk_buff *skb)
>>> @@ -6945,13 +7054,16 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>>>  	struct ieee80211_vif *vif = info->control.vif;
>>>  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>>>  	struct ath12k_link_vif *arvif = &ahvif->deflink;
>>> -	struct ath12k *ar = arvif->ar;
>>>  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
>>>  	struct ieee80211_key_conf *key = info->control.hw_key;
>>> +	struct ieee80211_sta *sta = control->sta;
>>>  	u32 info_flags = info->flags;
>>> +	struct ath12k *ar;
>>>  	bool is_prb_rsp;
>>> +	u8 link_id;
>>>  	int ret;
>>>  
>> better to assert RCU read lock here?
> 
> Same comment here as above.
> 
>>
>>> +	link_id = u32_get_bits(info->control.flags, IEEE80211_TX_CTRL_MLO_LINK);
>>>  	memset(skb_cb, 0, sizeof(*skb_cb));
>>>  	skb_cb->vif = vif;
>>>  
>>> @@ -6960,6 +7072,27 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>>>  		skb_cb->flags |= ATH12K_SKB_CIPHER_SET;
>>>  	}
>>>  
>>> +	/* handle only for MLO case, use deflink for non MLO case */
>>> +	if (vif->valid_links) {
>>
>> better to use ieee80211_vif_is_mld() helper?
> 
> Indeed, fixed.
> 
> I did all the changes directly in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=57ee27f3b3aa13c63978f03ce544c2f4210a9cd7

LGTM

> 
> BTW when you reply please include an empty line between the quote and
> your reply, this improves readability.

sure, will keep in mind.

> 


