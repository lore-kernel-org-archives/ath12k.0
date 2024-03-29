Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAF5C6FD1F
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWl53/V4jFKzvKS2gdsunApD5QYSywlJNEcB5eRW1OU=; b=kUOCglfINWuwpMUpdwqFHyETJK
	u1yYPsiJhBDcOTWPC8KyyIxd+6fUjsMRZ9Dta7cRn81REowRtvrEh1ysRvU8MlgPbNTBGkUtt+3S4
	74a+YxTvw2MVN23Gs55p/meBx8YE4euvt9VgPidsPsr2Gnn5sou5JP2aWEEyEgMWJ+B1locjr7D8r
	eNzYZ2S6voFCmW2jOeXAqyFukdEXyoLYllHTFtDr8jJ/8L49eCOSniv++o/H5l+ZWKKE63tSE/VeW
	7cVnlhCnQQwyDZgSqFZ1Ku95WBXfRAwIK5EuQM+a6WC+hRcSsPUwBr9QgAbWx3oFGUa5pHWqPa4NU
	6+hzhHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqDJj-00000000vih-2fIh
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 14:34:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqDJg-00000000vhH-0GvR
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 14:34:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42TBswHW006517;
	Fri, 29 Mar 2024 14:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=nWl53/V4jFKzvKS2gdsunApD5QYSywlJNEcB5eRW1OU=; b=gR
	z2ShmKxpsmFr8et6K5BHmutuM6pzJAD/wCvDsiUJtY73r3R6nLixgX+f6BeNz7wK
	k2Ap29K3yInTJO32OHhobp9ABIsGl72q5A5EHZ9+fHLajTYR6nJFzEbpOtIyEQ1w
	N1squX8jNK821LeGlcrDgagUvyJ7hwm39ThYHHkuEtRQJqs/6+Z6S0lv9PaJADPM
	K5d/DOTNhVv2i6JbNGH36VjpVSgDBz+Isc0vT1wekfJEtWedBp9tx9zlmeKHDslF
	Y8iJA5V2t9SAKz2oVBS7m0bKxQg5R64cDk8MGDNFe9wMQESkACugTr3Flg6Iiyps
	Gr/6ZyALFGBlSnfhBoEw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5w6g0anv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 14:34:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TEYjb5024566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 14:34:45 GMT
Received: from [10.216.7.62] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 07:34:43 -0700
Message-ID: <14909268-53de-a686-eecd-443ce153c756@quicinc.com>
Date: Fri, 29 Mar 2024 20:04:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/13] wifi: nl80211: send iface combination to user space
 in multi-hardware wiphy
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-7-quic_periyasa@quicinc.com>
 <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <29fc2719d6814a8e84f5db9ad81c76116a52828b.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vDAiKnPZzWoHCEHpfI7GaLkUzBVOgyGa
X-Proofpoint-ORIG-GUID: vDAiKnPZzWoHCEHpfI7GaLkUzBVOgyGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=541
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_073448_151581_486A823C 
X-CRM114-Status: GOOD (  20.55  )
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



On 3/28/2024 7:03 PM, Johannes Berg wrote:
> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>>
>> + *	When describing per-hardware combinations in multi-hardware in
>> + *	one wiphy model, the first possibility can further include the finer
>> + *	capabilities like below
> 
> Not sure I'd say "below" rather than e.g. "like this:"
> 
>> + *	hw_chan_idx = 0, numbers = [ #{STA} <= 1, #{AP} <= 1 ],
>> + *	channels = 1, max = 2
>> + *	=> allows a STA plus an AP interface on the underlying hardware mac
>> + *	   advertised at index 0 in wiphy @hw_chans array.
>> + *	hw_chan_idx = 1, numbers = [ #{STA} <= 1, #{AP} <= 2 ],
>> + *	channels = 1, max = 3
>> + *	=> allows a STA plus two AP interfaces on the underlying hardware mac
>> + *	   advertised at index 1 in wiphy @hw_chans array.
> 
> Have you checked the rst output for this? Seems likely that's not going
> to be great with that formatting, but I haven't checked.
> 
>> + * @NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX: u8 attribute specifying the index
>> + *	to the wiphy @hw_chans list for which the iface combination is being
>> + *	described.
> 
> "@hw_chans" doesn't make sense here, this is nl80211, it should refer to
> some attribute
> 
> but why didn't you just _say_ in the patch 2 discussion that it's used
> here ...
> 
>> + * @NL80211_IFACE_COMB_PER_HW_COMB_LIMITS: nested attribute containing the
>> + *	limits for the given interface types, see
>> + *	&enum nl80211_iface_limit_attrs.
>> + * @NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM: u32 attribute giving the maximum
>> + *	number of interfaces that can be created in this group. This number
>> + *	does not apply to the interfaces purely managed in software.
>> + * @NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS: u32 attribute specifying the
>> + *	number of different channels that can be used in this group.
>> + * @NUM_NL80211_IFACE_COMB_PER_HW_COMB: number of attributes
>> + * @MAX_NL80211_IFACE_COMB_PER_HW_COMB: highest attribute number
>> + */
>> +enum nl80211_if_comb_per_hw_comb_attrs {
>> +	NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
>> +	NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX,
>> +	NL80211_IFACE_COMB_PER_HW_COMB_LIMITS,
>> +	NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM,
>> +	NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS,
> 
> Almost all these attributes duplicate - including their docs -
> attributes from enum nl80211_if_combination_attrs. Is it really worth
> doing that, rather than adding NL80211_IFACE_COMB_HW_IDX and documenting
> the different uses of the attribute set?
> 

I agree, more duplication. So we have to have the per_hw_comb_attrs
defines like below?

enum nl80211_if_comb_per_hw_comb_attrs {
	NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
	NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX = 			
			NL80211_IFACE_COMB_NUM_CHANNELS + 1,
	/* keep last */
	NUM_NL80211_IFACE_COMB_PER_HW_COMB,
	MAX_NL80211_IFACE_COMB_PER_HW_COMB =
			NUM_NL80211_IFACE_COMB_PER_HW_COMB - 1
};

Vasanth

