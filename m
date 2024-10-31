Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE0DE68953
	for <ath12k@archiver.kernel.org>; Thu, 31 Oct 2024 05:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZbHqhAtVNaRTpXHYfnvIVeJgfq4BLTmO8eh4DybdHs=; b=XchiePSCHSTVyFt5fi/2qOB7IU
	pbIZUpQTj3fh1Fk04+dYi0pSld7ET/nl0O2yQYpXq17byhMFjYqy2HBLb967gjzNlEfz5h5Gmr/kA
	mog8MMfqDjRmfnWImAkC2HkOSUk3iOhOc1j3Tg6bzuK1fsLs3n04TKJHPd4V6sbxAct5BNSsQRWBs
	EeOFklH+NozATAo+hS+6QonVnJtcdyYOtaWHQFHGDpzEccPsTG4krLXAd6oULUjsCKwpgzSPyrUXW
	LoA27sTdmYFMldu6OwBWhESIM3/238H1nMLXi4alsFBB4HHt3Dfe9fOaMK6EbZ1NYoBTA1SrIacVT
	vSLIbB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6NeX-00000002bR2-23RX
	for ath12k@archiver.kernel.org;
	Thu, 31 Oct 2024 05:23:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6NeU-00000002bQJ-2Dek
	for ath12k@lists.infradead.org;
	Thu, 31 Oct 2024 05:23:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V2FwCD002338;
	Thu, 31 Oct 2024 05:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZbHqhAtVNaRTpXHYfnvIVeJgfq4BLTmO8eh4DybdHs=; b=VtHmv0XKwwKD9k8e
	Kg50xZXPgmg+Vuf6hNjqTdoyaT68iEhcbeHa+DzXP2lbCV1rMwDNpHx1dC8yH7UH
	3P00yOhNMCzutEByYqQmpLzTcYlMwXIlQpbKr3U4FBI1FQgh7G9Lm7J1DR5b7X2a
	GpXIvB5p/HncXW4b8KsmWsxkDE5qB9qWwvQkmMj8ETFAUSYJ723qyboYqcmynsWi
	yvooxCQFAZARnbv1MArwRpjA60b7B1/IpS9JSvpaS8go2lmqit8pkdbINscbGaW4
	VOnldZ4SskVS1ehULRq3h1QMaTFdlgk+A44VyDT3x/JhdRNlX+MgTM/2i/Zqkcfy
	zLBXKA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5aanh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 05:23:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49V5NJ4r029088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 05:23:19 GMT
Received: from [10.111.174.200] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 22:23:17 -0700
Message-ID: <3a74f2f1-fd9f-46a5-87c1-fdc0235a50e5@quicinc.com>
Date: Thu, 31 Oct 2024 13:23:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: cfg80211: Correctly handle Medium Synchronization
 Delay
To: Benjamin Berg <benjamin@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241030025515.16004-1-quic_lingbok@quicinc.com>
 <e56621b7a8b229f726d644ffde7b98ba0c11b06b.camel@sipsolutions.net>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <e56621b7a8b229f726d644ffde7b98ba0c11b06b.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O_dmT4C5a3O-IbEswGVzs3q8u4y40wAR
X-Proofpoint-GUID: O_dmT4C5a3O-IbEswGVzs3q8u4y40wAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_222322_729020_A947CFDA 
X-CRM114-Status: GOOD (  40.93  )
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



On 2024/10/30 18:23, Benjamin Berg wrote:
> Hi,
> 
> On Wed, 2024-10-30 at 10:55 +0800, Lingbo Kong wrote:
>> Currently, when the driver attempts to connect to an AP MLD with multiple
>> APs, the cfg80211_mlme_check_mlo_compat() function requires the Medium
>> Synchronization Delay values from different APs of the same AP MLD to be
>> equal, which may result in connection failures.
>>
>> This is because when the driver receives a multi-link probe response from
>> an AP MLD with multiple APs, cfg80211 updates the Elements for each AP
>> based on the multi-link probe response. If the Medium Synchronization Delay
>> is set in the multi-link probe response, the Elements for each AP belonging
>> to the same AP MLD will have the Medium Synchronization Delay set
>> simultaneously. If non-multi-link probe responses are received from
>> different APs of the same MLD AP, cfg80211 will still update the Elements
>> based on the non-multi-link probe response. Since the non-multi-link probe
>> response does not set the Medium Synchronization Delay
>> (IEEE 802.11be-2024-35.3.4.4), if the Elements from a non-multi-link probe
>> response overwrite those from a multi-link probe response that has set the
>> Medium Synchronization Delay, the Medium Synchronization Delay values for
>> APs belonging to the same AP MLD will not be equal. This discrepancy causes
>> the cfg80211_mlme_check_mlo_compat() function to fail, leading to
>> connection failures. Commit ccb964b4ab16
>> ("wifi: cfg80211: validate MLO connections better") did not take this into
>> account.
> 
> The specification confuses me a bit and I am probably missing
> something.
> 
>> To address this issue, add a u16 type member to the struct cfg80211_bss to
>> store the Medium Synchronization Delay. When the driver receives a probe
>> response with the Medium Synchronization Delay set, update this member’s
>> value; otherwise, do not update it. Additionally, modify the parameter list
>> of cfg80211_mlme_check_mlo_compat() so that this member variable can be
>> directly accessed within the cfg80211_mlme_check_mlo_compat() function viaq
>> a pointer to the struct cfg80211_bss. This will allow checking whether the
>> Medium Synchronization Delay values from different APs of the same AP MLD
>> are equal.
> 
> This feels like a recipe for failures. Whether or not an ML-Probe
> Response is seen should not generally affect the validity of a BSS.
> Which means that the validity check itself may be incorrect.
> 
> Maybe we should only compare the values if the subfield has been
> included?
> 
> 
> That said, do you understand when exactly the subfield should be
> included? It seems that it may be carried in the "(Re)Association
> Response", in which case it would be consistent anyway.
> 
> The ML probe response part seems a bit specific. Could it be that this
> is intended to be used by NSTR APs only, in which case there would not
> be a beacon on the secondary AP. If that is the case, then there
> wouldn't be much of an inconsistency (though we would still need to be
> a bit careful).
> 
> Benjamin
> 

hi，benjamin,

regarding your comment, I believe removing this validity check might be 
the easiest solution. As for the scenarios where this subfield would be 
included, I referred to the IEEE 802.11be specification. According to 
section 35.3.16.8, it states:

A STA shall not start a MediumSyncDelay timer unless the STA is one of 
the following:
— a non-AP STA affiliated with a non-AP MLD operating on an NSTR link 
pair or
— a non-AP STA affiliated with a non-AP MLD operating on an EMLSR link or
— a non-AP STA affiliated with a non-AP MLD operating on an EMLMR link or
— an AP affiliated with an NSTR mobile AP MLD operating on the 
nonprimary link of an NSTR link pair.

Regarding the statement “Could it be that this is intended to be used by 
NSTR APs only,” I did not find any explicit indication in the spec that 
the multi-link probe response carrying the medium sync delay subfield is 
solely applicable to NSTR APs.

Additionally, do you have any suggestions on how to address this issue?🙂

/lingbok

>>
>> Fixes: ccb964b4ab16 ("wifi: cfg80211: validate MLO connections better")
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> ---
>>   include/net/cfg80211.h |  4 ++++
>>   net/wireless/mlme.c    | 11 +++++++----
>>   net/wireless/scan.c    | 15 +++++++++++++++
>>   3 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
>> index 27acf1292a5c..ebeb305c1d0c 100644
>> --- a/include/net/cfg80211.h
>> +++ b/include/net/cfg80211.h
>> @@ -2956,6 +2956,8 @@ struct cfg80211_bss_ies {
>>    * @cannot_use_reasons: the reasons (bitmap) for not being able to connect,
>>    *	if @restrict_use is set and @use_for is zero (empty); may be 0 for
>>    *	unspecified reasons; see &enum nl80211_bss_cannot_use_reasons
>> + * @med_sync_delay: Medium Synchronization delay as described in
>> + *	IEEE 802.11be-2024 Figure 9-1074q.
>>    * @priv: private area for driver use, has at least wiphy->bss_priv_size bytes
>>    */
>>   struct cfg80211_bss {
>> @@ -2986,6 +2988,8 @@ struct cfg80211_bss {
>>   	u8 use_for;
>>   	u8 cannot_use_reasons;
>>   
>> +	u16 med_sync_delay;
>> +
>>   	u8 priv[] __aligned(sizeof(void *));
>>   };
>>   
>> diff --git a/net/wireless/mlme.c b/net/wireless/mlme.c
>> index 4dac81854721..ae00c36779d2 100644
>> --- a/net/wireless/mlme.c
>> +++ b/net/wireless/mlme.c
>> @@ -326,7 +326,9 @@ void cfg80211_oper_and_vht_capa(struct ieee80211_vht_cap *vht_capa,
>>   }
>>   
>>   static int
>> -cfg80211_mlme_check_mlo_compat(const struct ieee80211_multi_link_elem *mle_a,
>> +cfg80211_mlme_check_mlo_compat(const struct cfg80211_bss *bss_a,
>> +			       const struct cfg80211_bss *bss_b,
>> +			       const struct ieee80211_multi_link_elem *mle_a,
>>   			       const struct ieee80211_multi_link_elem *mle_b,
>>   			       struct netlink_ext_ack *extack)
>>   {
>> @@ -340,8 +342,7 @@ cfg80211_mlme_check_mlo_compat(const struct ieee80211_multi_link_elem *mle_a,
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (ieee80211_mle_get_eml_med_sync_delay((const u8 *)mle_a) !=
>> -	    ieee80211_mle_get_eml_med_sync_delay((const u8 *)mle_b)) {
>> +	if (bss_a->med_sync_delay != bss_b->med_sync_delay) {
>>   		NL_SET_ERR_MSG(extack, "link EML medium sync delay mismatch");
>>   		return -EINVAL;
>>   	}
>> @@ -426,7 +427,9 @@ static int cfg80211_mlme_check_mlo(struct net_device *dev,
>>   		if (WARN_ON(!mles[i]))
>>   			goto error;
>>   
>> -		if (cfg80211_mlme_check_mlo_compat(mles[req->link_id], mles[i],
>> +		if (cfg80211_mlme_check_mlo_compat(req->links[req->link_id].bss,
>> +						   req->links[i].bss,
>> +						   mles[req->link_id], mles[i],
>>   						   extack)) {
>>   			req->links[i].error = -EINVAL;
>>   			goto error;
>> diff --git a/net/wireless/scan.c b/net/wireless/scan.c
>> index 1c6fd45aa809..6ad935475484 100644
>> --- a/net/wireless/scan.c
>> +++ b/net/wireless/scan.c
>> @@ -1899,6 +1899,13 @@ cfg80211_update_known_bss(struct cfg80211_registered_device *rdev,
>>   	 */
>>   	if (signal_valid)
>>   		known->pub.signal = new->pub.signal;
>> +
>> +	/* update medium synchronization delay when its value is not
>> +	 * the default.
>> +	 */
>> +	if (new->pub.med_sync_delay != IEEE80211_MED_SYNC_DELAY_DEFAULT)
>> +		known->pub.med_sync_delay = new->pub.med_sync_delay;
>> +
>>   	known->pub.capability = new->pub.capability;
>>   	known->ts = new->ts;
>>   	known->ts_boottime = new->ts_boottime;
>> @@ -2224,6 +2231,7 @@ cfg80211_inform_single_bss_data(struct wiphy *wiphy,
>>   	int bss_type;
>>   	bool signal_valid;
>>   	unsigned long ts;
>> +	const struct element *ml;
>>   
>>   	if (WARN_ON(!wiphy))
>>   		return NULL;
>> @@ -2267,6 +2275,7 @@ cfg80211_inform_single_bss_data(struct wiphy *wiphy,
>>   	tmp.pub.use_for = data->use_for;
>>   	tmp.pub.cannot_use_reasons = data->cannot_use_reasons;
>>   	tmp.bss_source = data->bss_source;
>> +	tmp.pub.med_sync_delay = IEEE80211_MED_SYNC_DELAY_DEFAULT;
>>   
>>   	switch (data->bss_source) {
>>   	case BSS_SOURCE_MBSSID:
>> @@ -2321,6 +2330,12 @@ cfg80211_inform_single_bss_data(struct wiphy *wiphy,
>>   		break;
>>   	case CFG80211_BSS_FTYPE_PRESP:
>>   		rcu_assign_pointer(tmp.pub.proberesp_ies, ies);
>> +		ml = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_MULTI_LINK,
>> +					    ies->data, ies->len);
>> +		if (ml)
>> +			tmp.pub.med_sync_delay =
>> +				ieee80211_mle_get_eml_med_sync_delay(ml->data + 1);
>> +
>>   		break;
>>   	}
>>   	rcu_assign_pointer(tmp.pub.ies, ies);
>>
>> base-commit: e7e2957f403ba4655199f2ba9920c1a015a7be44
> 

