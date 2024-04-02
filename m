Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16993CD1284
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 16:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ye6MxSnP2ek+/dcKDWR/B0/5zxA72cUH+3LyrCvWCU=; b=ZUOC8xOgd3ohbWFiBdP7jm7dly
	bHGgG9C3A5Kvn9x12MFhf+afGFPDG+m+yWjW0dTqiC/gJs3Hg6w5T2VNVM/18AWMQjHTvGoaViFY6
	IHMU6oVEfwkmtxifDWCXjhjV11YkdOLsVAwFsGuJkR9nYc0oQCUr0KaEkYKhK2DYh2zCcR2qwhUom
	C3qkfYnHQtZdNVe/vBZVV6zgNRKeV2Al7x0PEQwLFKtan0oJoJ9kkB9bSHhXoyE33tTIzBy4pLTUe
	hpDNyLfYUXNIZYvS2sqYtuRjdkFHe6osJXYvX8EQ+ZN9cpUkVzKFfDD+6mUWkEI7uVna0hqTW7a/F
	ORPL3kUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrh6b-0000000C41o-17UZ
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 16:35:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrh6X-0000000C41N-3MxW
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 16:35:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432AqMlg028541;
	Tue, 2 Apr 2024 16:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7Ye6MxSnP2ek+/dcKDWR/B0/5zxA72cUH+3LyrCvWCU=; b=j1
	gJyvjBv2b2I7INCvpNVjW4NjVvBiwClbCcIDlIgym1NYxLy8Qln0VGI7OZ8u9V40
	+Egj0uoFreBKP1EmPYhERVPQ7nFiTgKW4CLK/cCQfpTsDAc1Q+FiuojExOM65W+W
	ZfS2MgYzESyTWS0tw1bA1uP1td+ZR/fNAsEUa2VGXPC+cD3qcARhwAg1S3XnfEx2
	Zh+qthGY2WSHn3tqDMAQ5UP7M7Ks39g4Hawolv+sQbnoAOhMe9MYHFfz4u7mn/W3
	nDzzm/v+fImZ3Zkmas6n3wyx9HGm5CKgo2qIR+i7OlyOv9AE0YtrJ6Wrr17v5q2S
	maJwNLXjffGEmOk2Zg+w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8gn5h113-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 16:35:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432GZGix013068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 16:35:16 GMT
Received: from [10.50.4.154] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 09:35:14 -0700
Message-ID: <25b78e30-4f70-7836-cb73-a2ff2584700b@quicinc.com>
Date: Tue, 2 Apr 2024 22:05:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 08/13] wifi: cfg80211: Refactor the iface combination
 iteration helper function
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-9-quic_periyasa@quicinc.com>
 <e2c5f81882f86b26be4d9bcf3c9d4b1fd6001b22.camel@sipsolutions.net>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <e2c5f81882f86b26be4d9bcf3c9d4b1fd6001b22.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gMsuaMKUcZkMadaX_r-SGMeQph5Iyh8G
X-Proofpoint-ORIG-GUID: gMsuaMKUcZkMadaX_r-SGMeQph5Iyh8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_10,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=886
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_093522_089852_AAE1B643 
X-CRM114-Status: GOOD (  17.96  )
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



On 3/28/2024 7:13 PM, Johannes Berg wrote:
> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>>
>> +static int
>> +cfg80211_validate_iface_comb_limits(struct wiphy *wiphy,
>> +				    struct iface_combination_params *params,
>> +				    const struct ieee80211_iface_combination *c,
>> +				    u16 num_interfaces, u32 *all_iftypes)
>> +{
>> +	struct ieee80211_iface_limit *limits;
>> +	int ret = 0;
> 
> That initialization is useless.

sure

> 
>> +
>> +	if (num_interfaces > c->max_interfaces)
>> +		return -EINVAL;
>> +
>> +	if (params->num_different_channels > c->num_different_channels)
>> +		return -EINVAL;
>> +
>> +	limits = kmemdup(c->limits, sizeof(limits[0]) * c->n_limits,
>> +			 GFP_KERNEL);
>> +	if (!limits)
>> +		return -ENOMEM;
>> +
>> +	ret = cfg80211_validate_iface_limits(wiphy,
>> +					     params->iftype_num,
>> +					     limits,
>> +					     c->n_limits,
>> +					     all_iftypes);
>> +
>> +	kfree(limits);
>> +
>> +	return ret;
>> +}
>> +
>> +static u16 cfg80211_get_iftype_info(struct wiphy *wiphy,
>> +				    const int iftype_num[NUM_NL80211_IFTYPES],
>> +				    u32 *used_iftypes)
>> +{
>> +	enum nl80211_iftype iftype;
>> +	u16 num_interfaces = 0;
>> +
> 
> This should probably set *used_iftypes = 0.

sure

> 
>> +	for (iftype = 0; iftype < NUM_NL80211_IFTYPES; iftype++) {
>> +		num_interfaces += iftype_num[iftype];
>> +		if (iftype_num[iftype] > 0 &&
>> +		    !cfg80211_iftype_allowed(wiphy, iftype, 0, 1))
>> +			*used_iftypes |= BIT(iftype);
> 
> and that could really use a rewrite like
> 
> 		if (!iftype_num[iftype])
> 			continue;
> 
> 		num_interfaces += ...
> 
> 		if (!allowed...)
> 			*used_iftypes |= ...;
> 
> I'd say.
> 
>>   	for (i = 0; i < wiphy->n_iface_combinations; i++) {
>>   		const struct ieee80211_iface_combination *c;
>> -		struct ieee80211_iface_limit *limits;
>>   		u32 all_iftypes = 0;
>>   
>>   		c = &wiphy->iface_combinations[i];
>>   
>> -		if (num_interfaces > c->max_interfaces)
>> -			continue;
>> -		if (params->num_different_channels > c->num_different_channels)
>> +		ret = cfg80211_validate_iface_comb_limits(wiphy, params,
>> +							  c, num_interfaces,
>> +							  &all_iftypes);
>> +		if (ret == -ENOMEM) {
>> +			break;
>> +		} else if (ret) {
>> +			ret = 0;
>>   			continue;
> 
> Seems that 'break' is equivalent to just 'return ret'? And that setting
> ret = 0 seems ... strange.
> 

sure, will address above comments in the next version of the patch

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

