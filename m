Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A098EC4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 05:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhzCg0f/m73RTIcZoevrprYpqoQnHTLMp7llDi7X6pg=; b=EpZT7xhfvBO/eqMEQJTPuFiu6F
	B732zsn5Jl4Q7m0N8K2JhRrl7dbjHwTYmls5hcBIyatKVVwMTPQzzDZms/ZA6Kcb+p8v1uW7mh1KD
	O/VjrLrOI2UwfpSsvkvL/KxoorlTcUzC9Lb603yGGLnx+ko045h30+GK7ijSWA15WZrs+Oa5PcIMW
	APXHK4gVPVH1c5DzXJRdt3m/bTCTRQ4z41+tGnpdFVh5lk0VfOCSI7IvC4mmC57KbG2ZRjyJnbVg4
	5Lkt9T4I4Q3CyWn3267PKtAqJFFilrQ1kwPZPIsEKRqv1KGDbkACs+uNsLfMJOA+DTYHAwa0gFDsC
	cnErYu2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9Rr-0000000FOtq-1Mq0
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 05:27:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9Rp-0000000FOsM-0i27
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 05:27:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C3ZMC8025391;
	Fri, 12 Apr 2024 05:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hhzCg0f/m73RTIcZoevrprYpqoQnHTLMp7llDi7X6pg=; b=Yp
	hMap/eF6kzKho8xlU/g07BhXKHTLK9wENSXk6gj1o6cZWMk14VIyPdAlh1rVhvv/
	T2AL5u/UEZyhZ3YSmC8pltEDnaZsNcI7TlA31+h0i052nreszQF/Za2+V/w7rD65
	STOqqNkNgqwscq6gur0K885Y8zP3WoxoIjDGQCyk4jCqAmgCzalM9wY9WKx6FAi+
	kiF8aOPFVgMEepXZXneDvr4aJ+hjoW3W2pdipx5F1tF589nX0TKXy00zOn6N6Ovh
	qGPaBOCFCjCmSQHJNU8csYqFtsx3R0sEobq/9ZNGnJ86M9H09QfbgdthR9bBMkA7
	E3byywVR7vgxbCkO2vag==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xer1trpey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 05:27:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C5RUES002110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 05:27:30 GMT
Received: from [10.50.27.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 22:27:28 -0700
Message-ID: <6147ac95-a572-62df-619d-33078d51ccc3@quicinc.com>
Date: Fri, 12 Apr 2024 10:57:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 06/13] wifi: nl80211: send iface combination to user space
 in multi-hardware wiphy
Content-Language: en-US
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-7-quic_periyasa@quicinc.com>
 <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
 <14909268-53de-a686-eecd-443ce153c756@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <14909268-53de-a686-eecd-443ce153c756@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qq5Oa47bwlQEBJiGAnAPvE56_ibxJF8t
X-Proofpoint-GUID: qq5Oa47bwlQEBJiGAnAPvE56_ibxJF8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=450 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_222737_376148_6E98F278 
X-CRM114-Status: GOOD (  19.94  )
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



On 3/29/2024 8:04 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 3/28/2024 7:03 PM, Johannes Berg wrote:
>> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>>>
>>> + *    When describing per-hardware combinations in multi-hardware in
>>> + *    one wiphy model, the first possibility can further include the 
>>> finer
>>> + *    capabilities like below
>>
>> Not sure I'd say "below" rather than e.g. "like this:"
>>
>>> + *    hw_chan_idx = 0, numbers = [ #{STA} <= 1, #{AP} <= 1 ],
>>> + *    channels = 1, max = 2
>>> + *    => allows a STA plus an AP interface on the underlying 
>>> hardware mac
>>> + *       advertised at index 0 in wiphy @hw_chans array.
>>> + *    hw_chan_idx = 1, numbers = [ #{STA} <= 1, #{AP} <= 2 ],
>>> + *    channels = 1, max = 3
>>> + *    => allows a STA plus two AP interfaces on the underlying 
>>> hardware mac
>>> + *       advertised at index 1 in wiphy @hw_chans array.
>>
>> Have you checked the rst output for this? Seems likely that's not going
>> to be great with that formatting, but I haven't checked.
>>
>>> + * @NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX: u8 attribute specifying 
>>> the index
>>> + *    to the wiphy @hw_chans list for which the iface combination is 
>>> being
>>> + *    described.
>>
>> "@hw_chans" doesn't make sense here, this is nl80211, it should refer to
>> some attribute
>>
>> but why didn't you just _say_ in the patch 2 discussion that it's used
>> here ...
>>
>>> + * @NL80211_IFACE_COMB_PER_HW_COMB_LIMITS: nested attribute 
>>> containing the
>>> + *    limits for the given interface types, see
>>> + *    &enum nl80211_iface_limit_attrs.
>>> + * @NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM: u32 attribute giving the 
>>> maximum
>>> + *    number of interfaces that can be created in this group. This 
>>> number
>>> + *    does not apply to the interfaces purely managed in software.
>>> + * @NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS: u32 attribute 
>>> specifying the
>>> + *    number of different channels that can be used in this group.
>>> + * @NUM_NL80211_IFACE_COMB_PER_HW_COMB: number of attributes
>>> + * @MAX_NL80211_IFACE_COMB_PER_HW_COMB: highest attribute number
>>> + */
>>> +enum nl80211_if_comb_per_hw_comb_attrs {
>>> +    NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
>>> +    NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX,
>>> +    NL80211_IFACE_COMB_PER_HW_COMB_LIMITS,
>>> +    NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM,
>>> +    NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS,
>>
>> Almost all these attributes duplicate - including their docs -
>> attributes from enum nl80211_if_combination_attrs. Is it really worth
>> doing that, rather than adding NL80211_IFACE_COMB_HW_IDX and documenting
>> the different uses of the attribute set?
>>
> 
> I agree, more duplication. So we have to have the per_hw_comb_attrs
> defines like below?
> 
> enum nl80211_if_comb_per_hw_comb_attrs {
>      NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
>      NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX =
>              NL80211_IFACE_COMB_NUM_CHANNELS + 1,
>      /* keep last */
>      NUM_NL80211_IFACE_COMB_PER_HW_COMB,
>      MAX_NL80211_IFACE_COMB_PER_HW_COMB =
>              NUM_NL80211_IFACE_COMB_PER_HW_COMB - 1
> };
> 

I agree this approach. Instead of NUM_NL80211_IFACE_COMB_PER_HW_COMB, 
shall we have MAX_NL80211_IFACE_COMB like below so that hw_idx attribute 
value will not get conflict to any IFACE combination attributes

  enum nl80211_if_comb_per_hw_comb_attrs {
       NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
       NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX =
               MAX_NL80211_IFACE_COMB + 1,
       /* keep last */
       NUM_NL80211_IFACE_COMB_PER_HW_COMB,
       MAX_NL80211_IFACE_COMB_PER_HW_COMB =
               NUM_NL80211_IFACE_COMB_PER_HW_COMB - 1
};


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

