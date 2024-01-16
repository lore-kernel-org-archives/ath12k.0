Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18D9C47077
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 05:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPj6Qmum6HRcUm8rlQRyFSpjx0CiJ/Kh9MlB52eqJEg=; b=DIOuA9hrJWfHTxbvpI1SRAvkhK
	xiN8kvaFlKsxU4zxhgEThYbgdbjy5W0yvkMAdHPvW1lv4yhmT1l3GhGvLc5OUc+fYT3cUnuibtZ/L
	qHErwejlb0rJLTb7CWtG9qtgeHGJJSAeFKosHkblu/xckhURGJxR/NgoVnV1R4GlqVt7FeZIx228j
	r5QTGuaZqAAbpfyi01Whu6LuV4W8qIceF2FFeZQ9S9lD1pH+C+3ieBO7CAUGgHlAJs3VuPnjyYGLV
	O/Dryjud9sy5yfncOEOUCK3exob8eAopXJAQ0cg83IDHNYJOj4r0v4W6ojWCoBaQNgd/26+9ocuUX
	3x0ieXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPbmt-00B0l8-0f
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 05:14:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPbmo-00B0ki-2b
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 05:14:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40G3reu2000644;
	Tue, 16 Jan 2024 05:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=BPj6Qmum6HRcUm8rlQRyFSpjx0CiJ/Kh9MlB52eqJEg=; b=gF
	IfkHf3Zatgpbws+xd2tnYSYXszKTD0astt2mzG9wOQGrL9itFZ5fD4lgRx2yrQ9f
	/XCVgzT841Bj5jCEsHHO83gHa9aKk++zRV9WpytlWVNtqBPeFQjFohOrbTHJVbDT
	hKZ405rTfb/k4U28fV6NPo4x0lsIaC0VZXKld8p+aIrQwUwm7x0Jw0wnWglPCibh
	YrtI0l5pnnokqJV9WLYvbKwInsybDIuWQmzcC8zxsr18PZ8F9xhJR5WwFA5NEbIT
	bdsVR4mqhxv5/msElbnczWdZOmRD0VaV886c75ADV94YE2cXjr9jJpr2ju4zWB7T
	qgkZBn+NUFHRbMMhbUNA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vngm58bn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 05:14:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40G5EpsJ001230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 05:14:52 GMT
Received: from [10.50.41.2] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 15 Jan
 2024 21:14:50 -0800
Message-ID: <839b56fa-9ce8-47f3-768d-b4f32a2041f1@quicinc.com>
Date: Tue, 16 Jan 2024 10:44:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Introduce the container for mac80211
 hw
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240112024214.3481840-1-quic_periyasa@quicinc.com>
 <20240112024214.3481840-3-quic_periyasa@quicinc.com>
 <87bk9m7f5g.fsf@kernel.org>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <87bk9m7f5g.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: swiRe-rco6q3X3GvdV3uagto5QPrTuCj
X-Proofpoint-ORIG-GUID: swiRe-rco6q3X3GvdV3uagto5QPrTuCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=708 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401160038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_211454_849377_9F63053C 
X-CRM114-Status: GOOD (  13.86  )
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


On 1/15/2024 9:38 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>
>> To support multi link operation, we need to combine all the link/pdev
>> under a single wiphy. This avoids the overhead of synchronization
>> across multiple hardware instances in both the cfg80211 and mac80211
>> layers. Currently, each link/pdev is registered as separate wiphy,
>> tightly coupled with link/pdev/radio (ar) structure. To enable single
>> wiphy registration within the chip, we decouple the wiphy data entity from
>> the link/pdev/radio (ar) structure and move it under the chip (ab)
>> structure with a new data container (ath12k_hw) structure. This approach
>> improves scalability for future multi link operation support.
> What about struct ath12k_pdev? Do we need it still or should it be removed?


ath12k_pdev still holds the pdev related information within the SoC/chip 
(ab). I dont want it be remove.


>
>>   static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
>>   					 struct ieee80211_vif *vif)
>>   {
>> -	struct ath12k *ar = hw->priv;
>> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +	struct ath12k *ar;
>> +
>> +	mutex_lock(&ah->conf_mutex);
>> +
>> +	ar = ath12k_ah_to_ar(ah);
>>   
>>   	mutex_lock(&ar->conf_mutex);
>>   	ath12k_scan_abort(ar);
>>   	mutex_unlock(&ar->conf_mutex);
>>   
>> +	mutex_unlock(&ah->conf_mutex);
>> +
>>   	cancel_delayed_work_sync(&ar->scan.timeout);
>>   }
> Do we really need two mutexes? I don't see any analysis about that. And
> even if we do, I feel that it should be added in a separate patch.


Yes, ah->conf_mutex protect the concurrent mac80211 operation. But there 
is other places like radio/link specific synchronous operation (ie MGMT 
tx wait for the vdev deletion) is needed. To fulfill this need, we also 
need radio/link specific (ar) mutex instead of all link (ah) mutex for 
efficient lock/unlock.


Thanks,

Karthikeyan


