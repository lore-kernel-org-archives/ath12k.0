Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A285FD70E02
	for <ath12k@archiver.kernel.org>; Fri, 29 Nov 2024 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI0nDHVN2YG8aqCX9puolvFRLtBz+BMZe+/WOT6AGQs=; b=JDdZY04TIah514V/9XgwDncHqi
	/V9OYDqfZlP4lqGwX4EFMOFFFt5WpmbmaQfd2QdyYS1B44hGNl6I1LZP68JOLMv9bIjh1ql5weQD4
	/KukBcS30IqxZ/nXTsuDLbVDqC0Bbq5WxD200ef1rCON3usSiQx/apYNODH8mKHcEPxlrTWt3Gis4
	ADKcWXBXSuUqtMMuGGzCRJPsRiJA2ag1GtJSHTM9/26eFTHQ5VxEw0TjOxso+qF+Zzm4ILwOrHL7F
	q/J2N/9GLhlEQMtLdT2+lASshdLptKHd4KBIetUP6KX9jUSIoxx9qO5v8BmSiLyp22O+q9gnKv8lP
	K5j9tMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGpzW-0000000GgoF-182h
	for ath12k@archiver.kernel.org;
	Fri, 29 Nov 2024 01:40:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGpzT-0000000Ggnq-3jm3
	for ath12k@lists.infradead.org;
	Fri, 29 Nov 2024 01:40:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASNRnV8026932;
	Fri, 29 Nov 2024 01:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BI0nDHVN2YG8aqCX9puolvFRLtBz+BMZe+/WOT6AGQs=; b=SbdQup5OUczSpKQi
	y1gxtna7lIM+lD/nSF0DPYLlqmpsJVwadnjaAy8cjkX01ZgBdI7tmet9kq6mVkYo
	7rEt2V45II6P+FZMGqU2XAmMpNiBkosb/g/XFZXL216SlA3AhecKWUFjvZbef4+2
	LmOTn61w37Zahk4nuVBXjEiD8eHhwOEOUIK4PVP7sVQoDuAx23UehBPB7lKk9pPy
	ejpK2ayAh9ehOJGg/7jv4PLrpP21q4ylRMFkv5wSQI4j0DXDCt+PUsz8+O1d73Za
	o+VcRRFmyBUJI8DtGc1TafTs+RupF63nGjQE4HZsf57lhCzafzMaAjo8PeGMsmiW
	8RjV6Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671ec195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 01:40:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT1eBTi012714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 01:40:11 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 17:40:09 -0800
Message-ID: <c7fe0222-9dea-4a57-8bd3-f51b11eb5f21@quicinc.com>
Date: Fri, 29 Nov 2024 09:40:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] wifi: ath12k: convert struct
 ath12k::wmi_mgmt_tx_work to struct wiphy_work
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
 <20241126171139.2350704-2-kvalo@kernel.org>
 <83b2325e-4d98-49a1-ae32-a69d7962e4a3@quicinc.com>
 <87y113v9uy.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87y113v9uy.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g_zypTBwZJ8WR6eo2J3bp7eaRULO1-U2
X-Proofpoint-GUID: g_zypTBwZJ8WR6eo2J3bp7eaRULO1-U2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=897
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_174015_943587_096F36FD 
X-CRM114-Status: GOOD (  17.05  )
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



On 11/28/2024 8:08 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> On 11/27/2024 1:11 AM, Kalle Valo wrote:
>>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>>
>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>>> @@ -6726,6 +6726,8 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
>>>  {
>>>  	int num_mgmt;
>>>  
>>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>>
>> why would we need wiphy lock protect here? I don;t see anything in this function need it.
>>
>>> +
>>>  	ieee80211_free_txskb(ath12k_ar_to_hw(ar), skb);
>>>  
>>>  	num_mgmt = atomic_dec_if_positive(&ar->num_pending_mgmt_tx);
>>> @@ -6787,6 +6789,8 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
>>>  	int buf_id;
>>>  	int ret;
>>>  
>>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>>
>> and here the same question as above. I know this function is only called from
>> ath12k_mgmt_over_wmi_tx_work() which is under wiphy lock protection. But the function
>> itself doesn't need to assert it if the function does not need its protection.
>>
>>> +
>>>  	ATH12K_SKB_CB(skb)->ar = ar;
>>>  	spin_lock_bh(&ar->txmgmt_idr_lock);
>>>  	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
>>> @@ -6841,7 +6845,7 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
>>>  		ath12k_mgmt_over_wmi_tx_drop(ar, skb);
>>>  }
>>>  
>>> -static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
>>> +static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
>>>  {
>>>  	struct ath12k *ar = container_of(work, struct ath12k, wmi_mgmt_tx_work);
>>>  	struct ath12k_skb_cb *skb_cb;
>>> @@ -6850,6 +6854,8 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
>>>  	struct sk_buff *skb;
>>>  	int ret;
>>>  
>>> +	lockdep_assert_wiphy(wiphy);
>>
>> we are definitely under wiphy lock protection since this is a wiphy_work item, hence no
>> need to assert it explicitly. see also
>>
>> ieee80211_sta_monitor_work()
>> ieee80211_beacon_connection_loss_work()
>> ieee80211_csa_connection_drop_work()
>> ieee80211_teardown_ttlm_work()
> 
> I have deliberately added all these lockdep_assert_wiphy() calls to
> document which functions are called with wiphy_lock() held, otherwise
> doing any locking analysis is much harder. My plan is that once MLO
> support has landed to ath-next my plan is to document ath12k locking
> design properly in the code. I think at that point we can also discuss
> how we should use lockdep_assert_wiphy() in ath12k and should we drop
> the extra calls.
Ah, good to know. thanks for sharing the plan.

> 


