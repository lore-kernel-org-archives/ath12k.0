Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FB7C3DA41
	for <ath12k@archiver.kernel.org>; Thu, 11 Jul 2024 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNieUMqN0snAT6hrFY7YK5lWcSaIFK4uNYwla/Sy8S4=; b=PTlmEYqtXQ8Dgxfbeb7Ir3KITb
	5uvRVvs0CCOx7sW+ZPxw5FohvCwjnlt/OMx1GklakovHuZ6HyWpk51H6+41GYKwJlnLLiUMzxEVYR
	r34aOXxrcPEw75KpKFUmTGYNHueGERFYkCOlHqO/LQi/p08HKwEK8ijLf/ghA7QzjmjpssOlP4cE2
	Vfm5FDHeCFB/Zf5nF3WpibIr4nv+uMwIG037beHq1ovadri50T+802F25aQ3PX+oCtaXJfcIqwioA
	8a1lY02EHyQL2/hfNwhGdXf7iYWxwpe/o6L03n0uwOGWZDlnr0Q6sxU3DOi9Gxz+tNOR4XZMV0P5v
	DX75Hm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpzF-0000000DKyN-1kIw
	for ath12k@archiver.kernel.org;
	Thu, 11 Jul 2024 09:21:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpzC-0000000DKxp-1r1Q
	for ath12k@lists.infradead.org;
	Thu, 11 Jul 2024 09:21:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4nNlM025894;
	Thu, 11 Jul 2024 09:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNieUMqN0snAT6hrFY7YK5lWcSaIFK4uNYwla/Sy8S4=; b=pvJ+yzwwZLLVgvoF
	PLeV2dPv1KupFq/frFUdm/6HtYI2mNEZ3exjdFt3PODzAnQ26NZ2mUgkex58jXkF
	J8uBJP8Shokarxm+6x9yqZSH+xnIyuzwzAMc4nthiPN0b+OXaFb17U28gaYX41pG
	x8yPTOyHDUUKHQW6KolnNjmFf/jjv5FQ6kqrUpJEvweoGv8vlBu6hULY6J3Q6I3u
	9W/0TRMDDYHHqcTTpNuWbQXLJh4n9kJMxNhAIB7fitEYB63X3B+9Y4Lv5n6+vlTB
	1t/7QPCNe90TElKtnewptLKRJUP2iwrgfgOI7rVTeCf3FQzALsM03KQNES3Kd1+e
	nS6IIA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0tc45g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 09:21:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B9L58b002583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 09:21:05 GMT
Received: from [10.216.36.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 02:21:03 -0700
Message-ID: <76a05021-c5aa-400e-a8d1-517fbce9e314@quicinc.com>
Date: Thu, 11 Jul 2024 14:50:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240709120659.1564434-1-quic_ramess@quicinc.com>
 <20240709120659.1564434-2-quic_ramess@quicinc.com>
 <a04ecf46-39d9-4785-824c-c53c17362abf@quicinc.com>
Content-Language: en-US
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <a04ecf46-39d9-4785-824c-c53c17362abf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kv-eYxZhEAumTK5rAZ2xgUJ9L1qh2agD
X-Proofpoint-ORIG-GUID: Kv-eYxZhEAumTK5rAZ2xgUJ9L1qh2agD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_06,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_022110_721842_6E1307C9 
X-CRM114-Status: GOOD (  13.69  )
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



On 7/11/2024 10:56 AM, Jeff Johnson wrote:
> On 7/9/2024 5:06 AM, Rameshkumar Sundaram wrote:
> ...
>> @@ -4569,12 +4685,17 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>>   				   enum ieee80211_sta_state old_state,
>>   				   enum ieee80211_sta_state new_state)
>>   {
>> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>>   	struct ath12k *ar;
>> -	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
>>   	struct ath12k_sta *arsta = ath12k_sta_to_arsta(sta);
>> +	struct ath12k_link_vif *arvif;
>>   	struct ath12k_peer *peer;
>>   	int ret = 0;
>>   
>> +	mutex_lock(&ah->conf_mutex);
>> +	arvif = &ahvif->deflink;
>> +
>>   	/* cancel must be done outside the mutex to avoid deadlock */
> 
> this is now inside the ah->conf_mutex -- is that ok?
> seems this comment should be updated to explain *which* mutex(es) the cancel
> must be done outside of?
> 
ah->conf_mutex is not acquired in ath12k_sta_rc_update_wk() so cancel 
work will not result is lockup here.
Will update the comment with lock specifics.
>>   	if ((old_state == IEEE80211_STA_NONE &&
>>   	     new_state == IEEE80211_STA_NOTEXIST))
>> @@ -4583,9 +4704,9 @@ static int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>>   	ar = ath12k_get_ar_by_vif(hw, vif);
>>   	if (!ar) {
>>   		WARN_ON_ONCE(1);
>> +		mutex_unlock(&ah->conf_mutex);
> 
> unlock before the WARN -- the WARN is not part of the critical section
> 
Sure, will change this in next version.
>>   		return -EINVAL;
>>   	}
>> -
>>   	mutex_lock(&ar->conf_mutex);
>>   
>>   	if (old_state == IEEE80211_STA_NOTEXIST &&
> 

