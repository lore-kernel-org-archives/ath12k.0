Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D239CD1283
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHSRlb2kGYwYxC+HiYyMlzPm7sei6bWSFw165Imbl2s=; b=qsTc23U52OSJ3uOEqZTvrfI4iE
	IQ4GpH6l+qYCdSHyAG5JEZS2qB6WxqJir+M6tcBFMXXzjdgVYkc6sFaWvhl4lz4fYwSeIZ73ifwt+
	L0I0iMNdeIrZO3aOH4qSlZneqJ4wI2lKdR4vUUSIq17odpnm4R1vbMzk5sLcKaOu6pfb0O0BTVEBB
	mbSCL/9rgl5NuOgoFJE9DhIJ8zXQKgaK2dbUt72UZwBZDxquEK/FoRuOGEvhHA1HOI+bVPXt1XiKM
	dgkSPgvH47DmN+dkbPJPV2sEtfjOJ+R54Ze8LVCCVKbgnTmbgG15tFACEvkIEhqDyFkl1n0eno5o4
	hDhA27OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEPQ-00000007P3G-3oLB
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 09:56:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEPO-00000007P2j-3rfl
	for ath12k@bombadil.infradead.org;
	Mon, 01 Apr 2024 09:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qHSRlb2kGYwYxC+HiYyMlzPm7sei6bWSFw165Imbl2s=; b=e0wGFnGn/ynIUjuw2WcvDvOTpb
	wUufxJXcvh43mVgZ7ZnF/EmMIsHA/A3mvYUikd1ZKo/T1M8PU6PeTe2lxOwLZQ738njS86cp1ZSN1
	I+8Ltdo9VVPXd9Nzkc1IPnwwL15uNT3W4yriFSpTobJu35nb0QKUJ3ht0+ev//QMi/kVIGui/h64b
	khE09b6waa2Pq2d/4rhXm81ukqXsvaLhyH3ApA7rp271seyfVLMA718CY4vuij8JXkHlRSEc63gtN
	dVpscpUj6yAUNnQURqPPohKpkK+HuMc2JOY5hUxrQSVOI6g4POyupGC6tPBWSq6uTaNNZVvmy/Mbq
	RNz/MTiA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEPL-00000000K3g-2IBj
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 09:56:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4319jg9t016628;
	Mon, 1 Apr 2024 09:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qHSRlb2kGYwYxC+HiYyMlzPm7sei6bWSFw165Imbl2s=; b=CY
	S/rd6469r9MyUAF8F3r6eU+RRLzXddwdB/dz5+R/l9ZCvG3UBeE+vfhuSDQJOC5V
	zO6ncvjPlLO/FcP0nLf9TJNJdhNEMrW8ch1L0P+RKpFL3qxbjzo6gjio8G0Djtra
	sqi24rL2DRhvII0+1MWaArIUwE4cVsB+MiQ4iIUUxDHXW0adXkyqOHVOZbWXRr4D
	8tfMp7NWFIyVC6pg4v/INMf/dVj/8dZk+frL9E6ZeX+VsxJHYezUPFA7ScwERcr/
	31WGBXNNUvpZg4XOCAPzBJ9OcJnpcsw1J3wIQL7dUXCksoTWHpO7zKXW7KCqTmDy
	tyv/pud0Fd/bOB1aR/Qg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7r570agy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 09:56:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4319ujQx024464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 09:56:45 GMT
Received: from [10.152.205.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 02:56:43 -0700
Message-ID: <f5bac583-522f-1593-a1a3-b18e0290f40c@quicinc.com>
Date: Mon, 1 Apr 2024 15:26:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 04/13] wifi: cfg80211/mac80211: extend iface comb
 advertisement for multi-hardware dev
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-5-quic_periyasa@quicinc.com>
 <8e1d403251a8c8e5c9fe34d9dea51b8ea60b6b6b.camel@sipsolutions.net>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <8e1d403251a8c8e5c9fe34d9dea51b8ea60b6b6b.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mURxTNuw5rG1qVQJITCvig8D3irL-RVL
X-Proofpoint-ORIG-GUID: mURxTNuw5rG1qVQJITCvig8D3irL-RVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_06,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=850 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_105651_818324_ED5B79D3 
X-CRM114-Status: GOOD (  20.42  )
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


On 3/28/2024 6:52 PM, Johannes Berg wrote:
> Not sure why this is a combined cfg/mac patch, there doesn't seem to be
> all that much need for that? I'd probably rather see this and patch 6
> squashed, but cfg/mac kept separate.

Sure, will split into the cfg/mac patches.


>
> On Thu, 2024-03-28 at 12:59 +0530, Karthikeyan Periyasamy wrote:
>
>> +static int
>> +ieee80211_check_per_hw_iface_comb(struct ieee80211_local *local,
>> +				  const struct ieee80211_iface_combination *c)
>> +{
>> +	int hw_idx, lmt_idx;
>> +	u32 hw_idx_bm = 0;
> lmt_idx? (also that's only needed in the loop)

sure, will move it local to that block


> bm?


bitmap used for hw_id sanity checks.


>
>> +	if (!local->hw.wiphy->num_hw)
>> +		return -EINVAL;
>> +
>> +	if (local->emulate_chanctx)
>> +		return -EINVAL;
>> +
>> +	for (hw_idx = 0; hw_idx < c->n_hw_list; hw_idx++) {
>> +		const struct ieee80211_iface_per_hw *hl;
> hl?
>
> Could have a bit more evocative names :)
>
> I'd rather see 'i' for some iteration thingie  than "lmt_idx" which
> means nothing on first reading either, but you start thinking it should
> mean something ...

sure.


>> +static bool
>> +cfg80211_hw_chans_includes_dfs(const struct ieee80211_chans_per_hw *chans)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < chans->n_chans; i++) {
>> +		if (chans->chans[i].band == NL80211_BAND_5GHZ &&
>> +		    ((chans->chans[i].center_freq >= 5250 &&
>> +		     chans->chans[i].center_freq <= 5340) ||
>> +		    (chans->chans[i].center_freq >= 5480 &&
>> +		     chans->chans[i].center_freq <= 5720)))
> ???
>
> That's not how this works upstream.


radar_detect_widths itself not sufficient for the radar specific sanity 
check in the multiple hardware iface combination approach. So include 
this helper for the radar sanity check.

This helper used to check the given channel list present in the 5GHz 
band or not.


>
>> +		if (WARN_ON(hl->max_interfaces < 2 &&
>> +			    (!comb->radar_detect_widths ||
>> +			     !(cfg80211_hw_chans_includes_dfs(chans)))))
> No need for extra parentheses.

sure


>> @@ -701,6 +786,13 @@ static int wiphy_verify_combinations(struct wiphy *wiphy)
>>   		/* You can't even choose that many! */
>>   		if (WARN_ON(cnt < c->max_interfaces))
>>   			return -EINVAL;
>> +
>> +		/* Do similar validations on the freq range specific interface
>> +		 * combinations when advertised.
>> +		 */
>> +		if (WARN_ON(c->n_hw_list &&
>> +			    wiphy_verify_comb_per_hw(wiphy, c)))
> Don't need the n_hw_list check here, the function just does nothing if
> it's 0 anyway.

sure, will address all the comments in the next version of the patch


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


