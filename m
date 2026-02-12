Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A16EE36B3
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 17:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkTTp52mJ6DXf9gr79/0dYtfSZzxQH+y7ktaIbvrwkY=; b=ahaAnSBKjVMovZjViZxscYbw66
	IdXbudM58TCA9qX+2PV0gspA37oEZI6PsT1nCjrOsiRTqj/88D03ldfMU/mBZbnV5+4eZ70Fnexqx
	kGAgAiQOBGV86nDngUSXoTms1i5Tb3kZBjp0lBBzrXX5RaeSqaO+K3qaDY/af9UXD5WVsVreaTGkr
	hrJ/dBjT2m8uDMbNXKTkZ172+cZ7Rc8ieZapLMmDOcv3lNiNMiaA33r2oTG2ZJP3ucKcr/s2gGkEF
	uhQmgkUE81WWZpYpgvsCDzO1EqD+azU5oQU7kS+UgOU0hS/Sg21EYVCuIU5ygiabAs4JUpojI+EUV
	QK6f4STQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqasS-00000002Tpn-41yW;
	Thu, 12 Feb 2026 17:53:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqasO-00000002Toy-3sfH
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 17:53:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CHHjGh1844944
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 17:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IkTTp52mJ6DXf9gr79/0dYtfSZzxQH+y7ktaIbvrwkY=; b=HqkDQBOA90wvv0eO
	BpIJ9KLOzdseO60LuJosEiv6m0fu/ujT5eKp5UZonYG62DEXM7nMe1jvfOQAD9o3
	VXz5AT0i8hvfrZuxYlBlUQyw7k3OFsbHbJvHjo4GZZ0zAhaMyYLlV7xSGAc7HMML
	AO/GZfqX3cpv981W2EIaFQThbPPINRuYRDgQBBD7ATWq6VLUi5zrB28CzFKhxOcY
	jjSTJEUZqABY6GJoKvMZ0A4cwsJi2OI6zWzQNp/DiJLHGW1XxeToCoq5ak5xDn3Z
	fA+xck0yPCLm5Z3iCKuoiei5wsX9aSPEnqrwWP8SQJey8T9EJjmzNL0ULbRcqxDe
	P7K+nA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k4w855t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 17:53:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824bf5fe8cbso51555b3a.1
        for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770918795; x=1771523595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkTTp52mJ6DXf9gr79/0dYtfSZzxQH+y7ktaIbvrwkY=;
        b=CKbeq6wKbFzt0dbCblQr01K7IaIuLwbYvEHUT78unmOUMhKNomBTr5WvX/1RCEb/d4
         DrF+Rfnwf8AG1fdnZpn3K0t3ONSpT01KXB4cBPsHPjcApLPrIwBVyKLm9Ijqx1mi6hVS
         5pUJ1gRN2v0CT9bVb+TdcdSMu2yOAheC4WYyTpyXxbdSPnfj77a5l0DO1VXWQWSgSqo5
         y/TMJoadoeNvGhF5f5gcH8U14PZmQN/bpmwW8TwP0abYPQfRkWM3R0Tv18irFhrsHMSh
         b9xYvQe5ufAEQrtkvcHgy1qB7cVOYrfZFski1KDNXVcSJ2k2RrU3U40GlsI1WSN7Z8ic
         T1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770918795; x=1771523595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkTTp52mJ6DXf9gr79/0dYtfSZzxQH+y7ktaIbvrwkY=;
        b=pOcgKRPR/HNqFm2oIZDnBinBD8dckXRfeYIYCcssuxDWNJBJB8sskZH76llUU5gFmM
         AIo7rjTFguq+eRhUhIkxp5x55RJMyp5wypEvPHgZ1oMlHmshP/mTksM0MXiC0b7g/GDi
         6kj3ib4Wjb/C+1KZtJSb9TjfOz/w4u2fO1rxvuZjWoVQiOamqWMH9hexfopKlwok+jeF
         vs9aawaASuJPKWutqXzEaPOgzD9zVsqSs3Vu/5y3KasOODxQkBu8jBJ/Fu8gODqAUfnr
         snkdWO4CD3XzlcwlDZD/ccJR2cIx5d/B3JnpsmxYnNT91bduvw/UGWgMHzsftnwqaIkm
         XBOA==
X-Forwarded-Encrypted: i=1; AJvYcCW/mSp1XjZMKkCZF4LL8K1JzVfX1+bovnnoLE+sTeA4a2yrUrpBHwzYNFsQe0glf3Pl5Dg7Mfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyWJs806U4aQ39d6S+AMHiMu5P4B2y5Us6zR9fgIYonfvpH6ty
	moFD9SuD9FX9bwJF8BxzpszzVdZJts48YoYiGRRmRKBnGCtI7U7hT2QSlkHCaS7zqQfq8MM8xXf
	Fx6Ti8CVH0TVkk3np+C6DTjtGbCS7KnHxiSsPhJ1F1c0HKxc9+snNLQ1vp6oHYsZQ/DKaFOsg
X-Gm-Gg: AZuq6aJCc7zMqzAXespk/BjTYoUP3SK8jnMeH2e70ABiGjnnuoB54yIHskO9jkYQoYP
	J2tHYPm/8k38tkxcq9IUpQAyq8RyX5UxhElptMeAwAyJciQUOR5ZLS0mBs8AqTuEdaSed5JZyYP
	h60cWGvr/9FBN9FHzUJAjb4SwvcayFjW/w3JLMREgK2l0u20GchZ19vS6kvkS8b/EEjScm+ugzZ
	v5pvABfhbaZmhSb6/MsocXa4Xau6SkF3Q/P7sTVwwDRNbLlh040xtDS0E8IzUIIxKxgmk5K9qya
	KVMpvQleDaDJFCpG7T05JTKALjmtOCLdYRTw0ttuMO8tgu5BMtOtIDfc74UFkj6D/cUrZ/QxPF4
	tZ7b52TLF8wVQJQlvhOUUfGtJhqtndAP6EvT2iQg08PHJkl/MHAdvXIFoc2dt6DdvyIF2P4ZnAa
	HiBDZqOtqiblzhEyimyO+/h45laZtEEGTHlR7luRoVG3vs4+wghA==
X-Received: by 2002:a05:6a00:ae0f:b0:823:652:d2a8 with SMTP id d2e1a72fcca58-824b2e3586bmr2213508b3a.5.1770918794998;
        Thu, 12 Feb 2026 09:53:14 -0800 (PST)
X-Received: by 2002:a05:6a00:ae0f:b0:823:652:d2a8 with SMTP id d2e1a72fcca58-824b2e3586bmr2213489b3a.5.1770918794408;
        Thu, 12 Feb 2026 09:53:14 -0800 (PST)
Received: from [10.50.42.130] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e82fd32sm5514804b3a.53.2026.02.12.09.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 09:53:14 -0800 (PST)
Message-ID: <1012eecc-3bfd-4c81-949a-9db8a1b31777@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 23:23:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2 1/2] wifi: UHR: define DPS/DBE/P-EDCA
 elements and fix size parsing
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260212172401.234059-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <20260212172401.234059-2-karthikeyan.kathirvel@oss.qualcomm.com>
 <7ac00be5cfa6a31b91d72db027030b89195f25a2.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <7ac00be5cfa6a31b91d72db027030b89195f25a2.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LOgmMoSACSCjJgdOsuRFwdWZMWikLoFQ
X-Authority-Analysis: v=2.4 cv=bfZmkePB c=1 sm=1 tr=0 ts=698e138c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Ug5BrCXmp09cZfeqHW0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOCBTYWx0ZWRfX4zO5xKN8KHtS
 bLthBpmo3OmZ4udLS945c794JU2kadlEfQSOGyGjEJjdiY0Tfat6gO9faxjQ5Tz1wyewveu4pzQ
 eP8ptWYwpH/w07XV8K75n5ftIHG2zc7F2392NLfRv/hCmUjMXOdpeIUKSLK7FQHsVnKvSel6Z2I
 OeMgVty6EbH3WiiYa7+naegTV21pT9HYgRPlwg9TMl9ufUM0qCYqwaOFNiwzrjcKPYGJlH5lf9M
 CZWYnnEtN659Lq6rGMoD3iSMWEyfhCMSM3OmR8EwsaAozMoH8Bxu36BLlisLFJMbmVCOLLfYoP/
 e5zbpUmkCY7WHR6N/v5UXps0HmHtD6OxFh63V0ZhdJ4K4cfo//+OyZWKolyNHNbkaOAm+CE/DpR
 +LDY6KjV6Neg+/S42QJrEJ5cK9wGymO6phq1T/2BrP2wphJHDOhcla9MsdzafDtWMIsgyp2BrZ+
 i7L8ca7FOYSqLvCHmZQ==
X-Proofpoint-GUID: LOgmMoSACSCjJgdOsuRFwdWZMWikLoFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_095316_971306_43FFEDF5 
X-CRM114-Status: GOOD (  16.58  )
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



On 2/12/2026 11:04 PM, Johannes Berg wrote:
> Hi,
> 
> Nice, thanks for sending this.
> 
>> + * subclause 9.4.1.87. Refer Figure 9-207u.
> 
>> + * Please refer IEEE80211_UHR_DPS*
> 
> "refer to"? Or "See Figure ..."?
> 

I will use "See Figure" and "Refer to IEEE80211_UHR_DPS*"

>> +#define IEEE80211_UHR_DPS_PADDING_DELAY			0x0000003F
>> +#define IEEE80211_UHR_DPS_RESERVED1			0x000000C0
>> +#define IEEE80211_UHR_DPS_TRANSITION_DELAY		0x00003F00
>> +#define IEEE80211_UHR_DPS_RESERVED2			0x0000C000
>> +#define IEEE80211_UHR_DPS_ICF_REQUIRED			0x00010000
>> +#define IEEE80211_UHR_DPS_PARAMETERIZED_FLAG		0x00020000
>> +#define IEEE80211_UHR_DPS_LC_MODE_BW			0x001C0000
>> +#define IEEE80211_UHR_DPS_LC_MODE_NSS			0x01E00000
>> +#define IEEE80211_UHR_DPS_LC_MODE_MCS			0x1E000000
>> +#define IEEE80211_UHR_DPS_MOBILE_AP_DPS_STATIC_HCM	0x20000000
>> +#define IEEE80211_UHR_DPS_RESERVED3			0xC0000000
> 
> Not sure I'd defined the ..._RESERVED* ones at all? There's no way we'd
> ever use them really unless they get defined to something else.
> 

Sure will remove those

>> + * subclause 9.4.1.87. Refer Figure 9-207u.
>> + *
>> + * Please refer IEEE80211_UHR_DPS*
> 
> Also here as well.
> 

Will take care

>> +#define IEEE80211_UHR_DBE_OPER_BANDWIDTH			0x07
>> +#define IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP_PRES	0x08
>> +#define IEEE80211_UHR_DBE_OPER_RESERVED				0xF0
> 
> same comment about reserved
>

Will take care

>> +#define IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP		0xFFFF
> 
> And this ... I think should just not be there? When would we ever mask a
> 16 bit value with an all 16 bits mask?
> 

Oops!!! Agree, will remove it

>> +#define IEEE80211_UHR_P_EDCA_RESERVED		0x7800
>> +/**
> 
> reserved again, don't think it makes sense - and probably should have a
> blank line before the /**
> 

Sure, will modify and remove it

>>   static inline const struct ieee80211_uhr_npca_info *
>>   ieee80211_uhr_npca_info(const struct ieee80211_uhr_operation *oper)
>>   {
>> +	const u8 *pos;
>> +
>>   	if (!(oper->params & cpu_to_le16(IEEE80211_UHR_OPER_PARAMS_NPCA_ENA)))
>>   		return NULL;
>>   
>> -	/* FIXME: DPS */
>> +	pos = oper->variable;
> 
> I'd probably have directly put 'const u8 *pos = oper->variable;', but
> doesn't really matter.
> 
Will initialize during declaration in next version
> johannes

/KK

