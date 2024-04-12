Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04214C04FF9
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 05:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rehZ5wX6XnxTNUf0MzWldzUd2fOo55k0qGrteCiML2E=; b=XxqOZgHtPPPCkZqz8ixvs2TH9F
	2cSmhZ0Ochu9B+Qm4S4hvwtLgop5eYK4xHX5HzG3JVTN3usiYYI2o26pZHwaOTgnpwOZrULEcKbXv
	IlRC4/ZFWbxh9YqKXQZI49hxgG/u8Pqt14iBHUcmN9HvY2fV76jtPeMvP5L29ugQus/MupJ0YK5lf
	UpX6YVZrhcKPbSWmdlMNwfvmdFVuodO5yCADOy2ilYk6+vVHQJqrRwObJMtYgGBe/NoEnWP70JOMB
	t76UTq0pDizbO/+rER4FNT6If/fQ6gnQ+En8eGTAFkVHvwXwkfxdM8/JZ8nJtWmhQwlgqO847m3qV
	/DcDQ7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9js-0000000FS0W-34GG
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 05:46:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9jp-0000000FRzj-3nPR
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 05:46:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C1g5Yq006959
	for <ath12k@lists.infradead.org>; Fri, 12 Apr 2024 05:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rehZ5wX6XnxTNUf0MzWldzUd2fOo55k0qGrteCiML2E=; b=bb
	v+AQ1UR3F+fKYT/CXC31SFyf/3qPyGMDL7OB8fAZiDq2jU9ERWYvaarNINYCxcUV
	21Z7QzE7lAYz5uVj/nSbtnNf1Idad/6MZqhAXEeoF2P3skcvsslRwWIEAwk7t81I
	RPdZDk240V1nCJFMEUncv6Kwe90yUJM/zfvmoYJJtQt9M7EaNwxF5sZUdRpCoMcf
	dtyD4N97+Q++YRrqRaByyPtjw0ScvYslFUkB8RZu7Y4wsoiIz/6hIQJH3wouN1Np
	hGaV/fIHkLe+Uh3QuhRqN1urxA3v6Iv0H9BFl78qqDO78X2mzHxLUDu/uX39oxOT
	fJ1uEqF2trMBeme9qvmw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xer1trr3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 12 Apr 2024 05:46:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C5kASA032765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 12 Apr 2024 05:46:10 GMT
Received: from [10.50.27.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 22:46:09 -0700
Message-ID: <424a5533-7cef-91cc-2cbd-5cacc22d367b@quicinc.com>
Date: Fri, 12 Apr 2024 11:15:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 06/13] wifi: nl80211: send iface combination to user space
 in multi-hardware wiphy
Content-Language: en-US
To: <ath12k@lists.infradead.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-7-quic_periyasa@quicinc.com>
 <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
 <14909268-53de-a686-eecd-443ce153c756@quicinc.com>
 <6147ac95-a572-62df-619d-33078d51ccc3@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <6147ac95-a572-62df-619d-33078d51ccc3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pHnOld8gEnACkcWKFQXk_yJWffUVLL_n
X-Proofpoint-GUID: pHnOld8gEnACkcWKFQXk_yJWffUVLL_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=462 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_224614_093428_567EDBAD 
X-CRM114-Status: GOOD (  18.03  )
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



On 4/12/2024 10:57 AM, Karthikeyan Periyasamy wrote:
> 
> 
> On 3/29/2024 8:04 PM, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 3/28/2024 7:03 PM, Johannes Berg wrote:
>>> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>>>>
>>>> + *    When describing per-hardware combinations in multi-hardware in
>>>> + *    one wiphy model, the first possibility can further include 
>>>> the finer
>>>> + *    capabilities like below
>>>
>>> Not sure I'd say "below" rather than e.g. "like this:"
>>>
>>>> + *    hw_chan_idx = 0, numbers = [ #{STA} <= 1, #{AP} <= 1 ],
>>>> + *    channels = 1, max = 2
>>>> + *    => allows a STA plus an AP interface on the underlying 
>>>> hardware mac
>>>> + *       advertised at index 0 in wiphy @hw_chans array.
>>>> + *    hw_chan_idx = 1, numbers = [ #{STA} <= 1, #{AP} <= 2 ],
>>>> + *    channels = 1, max = 3
>>>> + *    => allows a STA plus two AP interfaces on the underlying 
>>>> hardware mac
>>>> + *       advertised at index 1 in wiphy @hw_chans array.
>>>
>>> Have you checked the rst output for this? Seems likely that's not going
>>> to be great with that formatting, but I haven't checked.
>>>
>>>> + * @NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX: u8 attribute specifying 
>>>> the index
>>>> + *    to the wiphy @hw_chans list for which the iface combination 
>>>> is being
>>>> + *    described.
>>>
>>> "@hw_chans" doesn't make sense here, this is nl80211, it should refer to
>>> some attribute
>>>
>>> but why didn't you just _say_ in the patch 2 discussion that it's used
>>> here ...
>>>
>>>> + * @NL80211_IFACE_COMB_PER_HW_COMB_LIMITS: nested attribute 
>>>> containing the
>>>> + *    limits for the given interface types, see
>>>> + *    &enum nl80211_iface_limit_attrs.
>>>> + * @NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM: u32 attribute giving 
>>>> the maximum
>>>> + *    number of interfaces that can be created in this group. This 
>>>> number
>>>> + *    does not apply to the interfaces purely managed in software.
>>>> + * @NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS: u32 attribute 
>>>> specifying the
>>>> + *    number of different channels that can be used in this group.
>>>> + * @NUM_NL80211_IFACE_COMB_PER_HW_COMB: number of attributes
>>>> + * @MAX_NL80211_IFACE_COMB_PER_HW_COMB: highest attribute number
>>>> + */
>>>> +enum nl80211_if_comb_per_hw_comb_attrs {
>>>> +    NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
>>>> +    NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX,
>>>> +    NL80211_IFACE_COMB_PER_HW_COMB_LIMITS,
>>>> +    NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM,
>>>> +    NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS,
>>>
>>> Almost all these attributes duplicate - including their docs -
>>> attributes from enum nl80211_if_combination_attrs. Is it really worth
>>> doing that, rather than adding NL80211_IFACE_COMB_HW_IDX and documenting
>>> the different uses of the attribute set?
>>>
>>
>> I agree, more duplication. So we have to have the per_hw_comb_attrs
>> defines like below?
>>
>> enum nl80211_if_comb_per_hw_comb_attrs {
>>      NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
>>      NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX =
>>              NL80211_IFACE_COMB_NUM_CHANNELS + 1,
>>      /* keep last */
>>      NUM_NL80211_IFACE_COMB_PER_HW_COMB,
>>      MAX_NL80211_IFACE_COMB_PER_HW_COMB =
>>              NUM_NL80211_IFACE_COMB_PER_HW_COMB - 1
>> };
>>
> 

Corrected typo

  I agree this approach. Instead of NL80211_IFACE_COMB_NUM_CHANNELS,
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

