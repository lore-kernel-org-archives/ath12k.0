Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA59BEC0495
	for <ath12k@archiver.kernel.org>; Tue,  3 Mar 2026 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzHJOcx4tkvTcrLPF6I8Mk3LI9l+AOpi3RUhN+dWY8s=; b=Z42lLP2YWMTSwuJaIgL9Bvfy1X
	LDFml0jIuLpXhLc61BlaNPa7jQipQWBHqU65e1n4z+t5M2PC2qjGIjwGrQVrX6O1LFT5nPdrWKRlD
	ZiUw2sa6dCHtAN27KRKdM+eIOU3J0lk0EMFmcBszteYRIMckiSa4OgCE2gfi41fML1N/A/ahuEqbD
	H2l8oOuwS4+QKzcwkQYNkix3N1z+5u2s4B0ELbHJxV5yHulVZQaptY0776JdUjQzoDqJk8XsK++q0
	Lhsz3HdFSdJ3tC5FpMAfsjZpgCUGJl7i6AzAeMnnkhWSKh0T6MDhkpe4dJNy0TEgbKWsCFLddq89S
	1Ik/DC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMjK-0000000EwUJ-2qth;
	Tue, 03 Mar 2026 10:11:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMjI-0000000EwTe-3Fmm
	for ath12k@lists.infradead.org;
	Tue, 03 Mar 2026 10:11:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mi3B2729645
	for <ath12k@lists.infradead.org>; Tue, 3 Mar 2026 10:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzHJOcx4tkvTcrLPF6I8Mk3LI9l+AOpi3RUhN+dWY8s=; b=dJ8SRry4JF4tFjlp
	OppGf6M4utFnIx9Q7RGwQP8eUAYIWpJ0RMq3sPA7zjn7ng3BmK156XX6vfGdwsO8
	xFOLgwaJB1nVgRRYiH4jVXkZiyezCnK5fdRqBrN3qki/bHvO8nT05Mf/69QvVyac
	y/bFkqRGLMnwrU36KSGLwxCB+N3AzZH+aAVjfDlLejDT/NzF6VyEwxCzHNMj43UO
	7HtYnYY7peKWJsZiMZvubJFH/A5u8jGnDuRaidstPDPY6ZTyONds0voIIElTYzPw
	lDxZdxZ4lSsq2TfF4Ruwq8qfGMlLmtE+s399CkWVFuE2ichcVpHX7KDR+NfX/WDl
	V+17FA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe0v31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 10:11:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4a6bb316so24739795ad.1
        for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 02:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772532711; x=1773137511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzHJOcx4tkvTcrLPF6I8Mk3LI9l+AOpi3RUhN+dWY8s=;
        b=U7qwPfSxpfUDKZIC14HNZiiB9vKe+SRNtovhZ8LPZtNZ6GjegfexjaoqY3biyJygvs
         c5y/dPxeeNOwNZqucn4oAG5Iwa+Z7XKcPccbiCcykTR3lmIWElbsRc9LsLxZ0syEgiDq
         mlBQsyaKQEUy2WH+WWUxPuCdYRZ9v4aIOYDv6yNwK+VB/XyWw9pWVp/UUUqFcPv1WlvP
         cc49XzM+Xhzt5clmhyCRS/J8KQeXk1Mk89dZJuyfjZiI7Q3NXUZp0MwrKK6jYSeUzdcQ
         ElMbDSZPZv6cjdOJ/6SE8tGXLJNDyYzpYNkZR3JIB5zEw7zFNFqNXQcmpNdGi/bxi2ud
         TALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532711; x=1773137511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzHJOcx4tkvTcrLPF6I8Mk3LI9l+AOpi3RUhN+dWY8s=;
        b=rFIPyHR7hFz0ep39h43BtunpQkUdcpLh2AZO73ln07hGvMHClWVUyWK4NVK7nOrqX/
         R/5FZEUeDI6O92yVWvlTY6NdEusC0epcYDO5xIUUHq1mwYBhp9516rRiybgweYR+JDJ8
         oiRivwZe2eaGmapCGnZkALVSWhV2mceSN1cocZGOEdQEI+0iRre2PVm2IRBDzPYM2n3z
         5ZILstKWADPWlSbRXMHN5go9JxEq4gE7jMdmeQqQZMgCAqkOroAoEA+AcNb74VZRcmu1
         0yb/xISslTmhjZvMuwBqlORW8D3TLKXJ7nHfx7sosU7YfB2s9OvjBiDSwcvs4uD6z69N
         S9gw==
X-Forwarded-Encrypted: i=1; AJvYcCUGfm0t59PXpDdKN8GByD7QxmkocuhnPxfBw9oQvXts3nHWZhE/4D+cTe+BWwf1BIZuTZ+Xz30=@lists.infradead.org
X-Gm-Message-State: AOJu0YymS1p3yM2OWxEvX8jdvXmxzH7lg/DbcFBwsK9JLXliyF0zC2oY
	kJgvuSPE+OtpOKfS4RTpT1XHetiJmjkM7dQZWTN1zqFMwfUl6aXfUGcWug0asjpSQQTtUYhxVEs
	gi1Kq/d0pMnd0LYWB6fIB+bIKSGvcVXMswRtzVsbDkojCMSxE5KaWXsTdRGJFKg3I
X-Gm-Gg: ATEYQzwcZl3w7lhL5oJpEW9cyXnCVWoBbm7N6NGBn1BetVKPgHcYtbWOdn/Kfhtc769
	PfW845iu/08w6H9xfG6elUFHa6vAa81ZKDJaVvaZ5ENtlK/UaK0funIfQKZUkfZ63gPr6E+rFVo
	xIEUwJuvt5mxnxVaCU4NHU0XHKgUuWrufT4KNvYl2yybgi1AgDz1zBUAEnNfT2HKMFjuVzehVH4
	bjTqXKxsYP2FypDU11Q8eXliuaMjuJFGIZfWedtesaSQpkKa1UK0RCdLFyllcnaUKPupMqfcLcC
	Qqe16i9xDCPP4rRw7n6SPoryuocNQNmhYBg2pJQw6NJrNuqBpRW/vDzRvoyyRBNU0sp4jC9eaSx
	xVbvbluIMLfLW+sniCVIsx/oOHtS2qZPRcyjdBaYQgFk1S5btwqTyq/YCSu6kfmc=
X-Received: by 2002:a05:6a21:44c8:b0:395:7fb:9352 with SMTP id adf61e73a8af0-395c39e0f72mr15276752637.15.1772532710719;
        Tue, 03 Mar 2026 02:11:50 -0800 (PST)
X-Received: by 2002:a05:6a21:44c8:b0:395:7fb:9352 with SMTP id adf61e73a8af0-395c39e0f72mr15276728637.15.1772532710255;
        Tue, 03 Mar 2026 02:11:50 -0800 (PST)
Received: from [10.152.199.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4d93dsm15372721b3a.3.2026.03.03.02.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:11:49 -0800 (PST)
Message-ID: <2b64bdd1-0bf9-44c7-845b-4c07cefb708c@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:41:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v4 1/2] wifi: UHR: define DPS/DBE/P-EDCA
 elements and fix size parsing
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
 <6cec588857a8fa5866b3aff323c367b0096e613a.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <6cec588857a8fa5866b3aff323c367b0096e613a.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _05HjdikYOeGQXl2m-BjWKfedrzlqWfm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NyBTYWx0ZWRfX/SF9TPQ2EnSb
 p2gy6mVD7J6fQTQHbgMkCs2UiYWgPMv2y7QYQV5BYfxq25elQtC8twTikQDyema4MkBF+UY55jx
 DCcq+xoX9L9xqtLgalgcShhzfgjaC2HJe9Dj9fTVFluUyxMq1jwLP5shCsbx2xeNSddE0z1HvjF
 kXTK0Lllw5jUR4WQ2+lPpe+2WW3BTZ878p+El/H/Jwkv/ucY0L7BUZfX91ynucpQw4xyx+fJc/D
 BHvh5PZxKmY54SoVLh1mw7H5Nm/fdyOkmP3A3hqaWXfaivAgHSS64eX6Pv15M/z+y3Psq9IuAos
 7OVd+0ItYLNVq36+FwhtlPqAjejT9LZNcks3Lnsc9p7vaWNZIB+5918Cgql3A9fk+a/ChwW/z+h
 pewjOiViU+sPRosS0XElKPTHAsmWCK5rTXMMvi90sV9I7UZcziOMhsY89AXSnq2MgQlb3+qnn6Y
 lntBbn9wgVmixGD0oHg==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6b3e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7-Pj4gzqvCTXqnPNP3YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _05HjdikYOeGQXl2m-BjWKfedrzlqWfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_021152_818033_595B8324 
X-CRM114-Status: GOOD (  21.96  )
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



On 2/24/2026 10:02 PM, Johannes Berg wrote:
> On Tue, 2026-02-17 at 11:17 +0530, Karthikeyan Kathirvel wrote:
>>
>> + * Refer to IEEE80211_UHR_P_EDCA*
>> + * @p_edca_ec: The P-EDCA ECWmin, P-EDCA and ECWmax
> 
> that seems unclear?
> 
> 
>> + * @p_edca_params: The AIFSN field indicate the AIFSN value that are
> 
> "indicates", "value that is used"? I think it's one? Or "values that are
> used"
> 
>> + *	used by a P-EDCA STA during P-EDCA contention.
>> + *	The CW DS field indicate the value used
> 
> indicates
> 
>> + *	for the randomization of the transmission slot of the DS-CTS
>> + *	frame. The value 3 is reserved. The value 0 indicate that
> 
> indicates
> 

Will address this grammatical errors in next version

>> + *	randomization not enabled.
>> + *	The P-EDCA PSRC threshold field indicates the maximum number
>> + *	of allowed consecutive DS-CTS transmissions. The value 0 and
>> + *	values greater than 4 are reserved
>> + *	The P-EDCA QSRC threshold field indicates the value of the
>> + *	QSRC[AC_VO] counter to be allowed to start P-EDCA contention.
>> + *	The value 0 is reserved.
>> + */
>> +struct ieee80211_uhr_p_edca_info {
>> +	u8 p_edca_ec;
>> +	__le16 p_edca_params;
>> +} __packed;
>> +
>>   static inline bool ieee80211_uhr_oper_size_ok(const u8 *data, u8 len,
>>   					      bool beacon)
>>   {
>> @@ -47,19 +232,52 @@ static inline bool ieee80211_uhr_oper_size_ok(const u8 *data, u8 len,
>>   	if (beacon)
>>   		return true;
>>   
>> -	/* FIXME: DPS, DBE, P-EDCA (consider order, also relative to NPCA) */
>> +	/* DPS Operation Parameters (fixed 4 bytes) */
>> +	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DPS_ENA)) {
>> +		needed += sizeof(struct ieee80211_uhr_dps_info);
>> +		if (len < needed)
>> +			return false;
>> +	}
>>   
>> +	/* NPCA Operation Parameters (fixed 4 bytes + optional 2 bytes) */
>>   	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_NPCA_ENA)) {
>>   		const struct ieee80211_uhr_npca_info *npca =
>> -			(const void *)oper->variable;
>> +			(const void *)(data + needed);
>>   
>>   		needed += sizeof(*npca);
>> -
>>   		if (len < needed)
>>   			return false;
>>   
>> -		if (npca->params & cpu_to_le32(IEEE80211_UHR_NPCA_PARAMS_DIS_SUBCH_BMAP_PRES))
>> +		if (npca->params &
>> +		    cpu_to_le32(IEEE80211_UHR_NPCA_PARAMS_DIS_SUBCH_BMAP_PRES)) {
>>   			needed += sizeof(npca->dis_subch_bmap[0]);
>> +			if (len < needed)
>> +				return false;
>> +		}
>> +	}
>> +
>> +	/* P-EDCA Operation Parameters (fixed 3 bytes) */
>> +	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_PEDCA_ENA)) {
>> +		needed += sizeof(struct ieee80211_uhr_p_edca_info);
>> +		if (len < needed)
>> +			return false;
>> +	}
>> +
>> +	/* DBE Operation Parameters (fixed 1 byte + optional 2 bytes) */
>> +	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DBE_ENA)) {
>> +		const struct ieee80211_uhr_dbe_info *dbe =
>> +			(const void *)(data + needed);
>> +
>> +		needed += sizeof(*dbe);
>> +		if (len < needed)
>> +			return false;
>> +
>> +		if (dbe->dbe_params &
>> +		    IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP_PRES) {
>> +			needed += sizeof(dbe->dis_subch_bmap[0]);
>> +			if (len < needed)
>> +				return false;
>> +		}
>>   	}
>>   
>>   	return len >= needed;
>> @@ -72,12 +290,15 @@ static inline bool ieee80211_uhr_oper_size_ok(const u8 *data, u8 len,
>>   static inline const struct ieee80211_uhr_npca_info *
>>   ieee80211_uhr_npca_info(const struct ieee80211_uhr_operation *oper)
>>   {
>> +	const u8 *pos = oper->variable;
>> +
>>   	if (!(oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_NPCA_ENA)))
>>   		return NULL;
>>   
>> -	/* FIXME: DPS */
>> +	if (oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_DPS_ENA))
>> +		pos += sizeof(struct ieee80211_uhr_dps_info);
>>   
>> -	return (const void *)oper->variable;
>> +	return (const void *)pos;
>>   }
>>   
>>   static inline const __le16 *
>> @@ -131,6 +352,25 @@ ieee80211_uhr_npca_dis_subch_bitmap(const struct ieee80211_uhr_operation *oper)
>>   #define IEEE80211_UHR_MAC_CAP_DBE_EHT_MCS_MAP_160_PRES	0x08
>>   #define IEEE80211_UHR_MAC_CAP_DBE_EHT_MCS_MAP_320_PRES	0x10
>>   
>> +/**
>> + * enum ieee80211_dbe_bandwidth - DBE Bandwidth
>> + *
>> + * As per spec P802.11bn_D1.3 "Table 9-bb5—Encoding of the DBE Maximum
>> + * Supported Bandwidth field"
>> + *
>> + * @IEEE80211_DBE_BANDWIDTH_40MHZ: Indicate 40 MHz DBE bandwidth
>> + * @IEEE80211_DBE_BANDWIDTH_80MHZ: Indicate 80 MHz DBE bandwidth
>> + * @IEEE80211_DBE_BANDWIDTH_160MHZ: Indicate 160 MHz DBE bandwidth
>> + * @IEEE80211_DBE_BANDWIDTH_320MHZ: Indicate 320 MHz DBE bandwidth
>> + *
>> + */
>> +enum ieee80211_dbe_bandwidth {
>> +	IEEE80211_DBE_BANDWIDTH_40MHZ = 1,
>> +	IEEE80211_DBE_BANDWIDTH_80MHZ = 2,
>> +	IEEE80211_DBE_BANDWIDTH_160MHZ = 3,
>> +	IEEE80211_DBE_BANDWIDTH_320MHZ = 4,
>> +};
>> +
>>   struct ieee80211_uhr_cap_mac {
>>   	u8 mac_cap[5];
>>   } __packed;


