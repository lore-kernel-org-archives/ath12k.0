Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3D0CD11BF
	for <ath12k@archiver.kernel.org>; Tue, 19 Mar 2024 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhwONOCVo89AMBkpYVNTSiLDSlYoWdTO9A1OS2Xp3Ao=; b=v+CtQgvJlGPkHzcJm5P19pBK9v
	Gp+7pEfA7vb1zM1mahYK+GOkKQBeb3/9bO45xLHzSDzYTW3XKeoMrh3PlkVHvA8zkHKq7GrPMI+4v
	MQNwtirS5BNNdLLktspIz5weS2dESxt+hwPUQP8Pl+i5mL+1EeUEvat817lZs52jwacRBaffBiHA+
	4NhadVV9vDFkI48azx9CDYiM5RhgG5w2U0NB9HE9NOYDAQJzMdE+6qXzql4ci4ztylfnUSwj2fgwe
	ueflmNC8NUmCbogIjdMteaUxI//mddSpjsk91pPmhrvfSMtrZn6f8PWm+nefUdkby1vrO3A7+CS6B
	gZ6O+sIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmcF1-0000000DMLy-3fff
	for ath12k@archiver.kernel.org;
	Tue, 19 Mar 2024 16:23:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmcEy-0000000DMKB-2vIw
	for ath12k@lists.infradead.org;
	Tue, 19 Mar 2024 16:23:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42JBDvAU018807;
	Tue, 19 Mar 2024 16:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UhwONOCVo89AMBkpYVNTSiLDSlYoWdTO9A1OS2Xp3Ao=; b=dn
	zEI9O7Eg6NT+MvhKvJONxMlZoGpWtrp6izQIM3EFlruATRJSkqJ1dDNcVUg6gwyQ
	1pWI+Ma6GX5uPJGjkv9Xq+A68FLj7/It5n8SlvLzbCaF4q0+vggO4uBd7p6V9eJg
	U/UEZkGVEgvxQJipwAQiTDoEoGXcPoN3ic0M3bLyuUgVG0arZtrXvo6zxmz4yGTk
	ZeGFsxnJ+23+Cc1t/qYWp0nW+DjtvfAPB+QWNXS60qIqJGajiWhlfWSwk5OqnI1/
	354H/sl//KWSl/rvYrgE0TFUkbv1+5XGHTEy4h1HLW3Fix6GxnVuSJaKH2+gOG0b
	EctpMjhOaBvmrpDm2y/Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy4gf9hdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 16:23:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JGN2SL017738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 16:23:02 GMT
Received: from [10.50.62.188] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 09:23:00 -0700
Message-ID: <6989461b-295e-4886-9d39-64f15cc01074@quicinc.com>
Date: Tue, 19 Mar 2024 21:52:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] wifi: ath12k: support get_survey mac op for
 single wiphy
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-13-quic_ramess@quicinc.com>
 <036abbcc-eb90-48db-a82e-5565bcc336ef@quicinc.com>
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <036abbcc-eb90-48db-a82e-5565bcc336ef@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TAo5pE-sRnz6I_9ENKNpybTChxAkkBAB
X-Proofpoint-ORIG-GUID: TAo5pE-sRnz6I_9ENKNpybTChxAkkBAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_05,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=939 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_092304_903530_73250515 
X-CRM114-Status: GOOD (  19.47  )
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



On 3/13/2024 4:55 AM, Jeff Johnson wrote:
> On 3/12/2024 6:55 AM, Rameshkumar Sundaram wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>>
>> The radio for which the survey info needs to be collected
>> depends on the channel idx which could be based on the band.
>> Use the idx to identify the appropriate sband since multiple
>> bands could be combined for single wiphy case.
>>
>> Also use the channel idx and sband to identify the corresponding
>> radio on which the survey results needs to be populated.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 25 ++++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 6123d7db2edc..a31003f8325d 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -7821,7 +7821,6 @@ ath12k_mac_update_bss_chan_survey(struct ath12k *ar,
>>   static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>>   				    struct survey_info *survey)
>>   {
>> -	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>>   	struct ath12k *ar;
>>   	struct ieee80211_supported_band *sband;
>>   	struct survey_info *ar_survey;
>> @@ -7830,12 +7829,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>>   	if (idx >= ATH12K_NUM_CHANS)
>>   		return -ENOENT;
>>   
>> -	ar = ath12k_ah_to_ar(ah, 0);
>> -
>> -	ar_survey = &ar->survey[idx];
>> -
>> -	mutex_lock(&ar->conf_mutex);
>> -
>>   	sband = hw->wiphy->bands[NL80211_BAND_2GHZ];
>>   	if (sband && idx >= sband->n_channels) {
>>   		idx -= sband->n_channels;
>> @@ -7850,6 +7843,21 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>>   		goto exit;
>>   	}
>>   
>> +	ar = ath12k_mac_get_ar_by_chan(hw, &sband->channels[idx]);
>> +	if (!ar) {
>> +		if (sband->channels[idx].flags & IEEE80211_CHAN_DISABLED) {
>> +			ret = 0;
>> +			memset(survey, 0, sizeof(*survey));
>> +			goto exit;
>> +		}
>> +		ret = -ENOENT;
>> +		goto exit;
>> +	}
>> +
>> +	ar_survey = &ar->survey[idx];
>> +
>> +	mutex_lock(&ar->conf_mutex);
>> +
>>   	ath12k_mac_update_bss_chan_survey(ar, &sband->channels[idx]);
>>   
>>   	spin_lock_bh(&ar->data_lock);
>> @@ -7861,9 +7869,8 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>>   	if (ar->rx_channel == survey->channel)
>>   		survey->filled |= SURVEY_INFO_IN_USE;
>>   
>> -exit:
>>   	mutex_unlock(&ar->conf_mutex);
>> -
>> +exit:
> 
> goto should normally only be used when there is centralized cleanup.
> since now there is no cleanup required, all of the goto exit calls should just
> directly return the appropriate error
> 
Sure, this sneaked through while rebasing, thanks for pointing out. Will 
fix it in next version.
>>   	return ret;
>>   }
>>   
> 

