Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284AAC282C5
	for <ath12k@archiver.kernel.org>; Mon,  3 Mar 2025 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+v6RowI8p2XaEBSOcUfqm4BSxcSsncMZw0XrVYG3wnY=; b=vt5GgM/uLyiL+PM8Aptwz5Q6GG
	3fdATOa3IMSuCVTVUzn4QobRqQMgNNb53zcAtg8ZrVTcy2vjyqEWWafm9+aO2A2rKtd8leSknPTw9
	SMzqL0kM9EJmZjaynujaYa9nddxdGz/3eGInNj8XEe94LJvb5jFLZ9PKceDNf0szj5OzQNJ/u52lu
	pnnUSK/S7n7PMAw/diIkYa/rEc7hgKiTkiZq9sZylyriJ8SwEMgDBL7eWYNHNjGDgXQWu3/hD+DAs
	ZwQyjtLFIf8PxnpE8pxRRY/dlqgXDKAlkBAZYVXqZYWa30obEhpZgYODInmOFgAsKYOCRzZBxQvmK
	RECDd7Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3IL-00000000NWW-3rON
	for ath12k@archiver.kernel.org;
	Mon, 03 Mar 2025 10:45:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp35E-00000000Ks1-32MV
	for ath12k@lists.infradead.org;
	Mon, 03 Mar 2025 10:31:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522NKbDo007785
	for <ath12k@lists.infradead.org>; Mon, 3 Mar 2025 10:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v6RowI8p2XaEBSOcUfqm4BSxcSsncMZw0XrVYG3wnY=; b=TlM1zWui0kGdYUQq
	GdgqrtvYhn9MwOnN1uAl6q2n+77SPtV6l3hRLSmAZoF5Snx744Y/rihxFmccz8P1
	dHBkqTbAmlFRV7tAwVivs91xZ5H05qNmXgQ2houscA6EnVokSOv4zxZb77HH8M09
	dLCDuBu20xZ07IPeoUBFyRt3g+iGUoUbTs/NZT0GacjRPwruqXmc2OqW7fP9ZURO
	8TT3J1gLb69kggD0GVPn9nnZ2002qLJa03DcWuB6ZkoU95soWbJItS4EBTcK6jJ4
	aENI61bq800d9qh1Xgp6pCZOaiau39V1WHszmt45jnPois10RCg4m4mav7utf8f3
	gnpyMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453u0d49xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 10:31:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-223725a1e76so48950325ad.0
        for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 02:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997894; x=1741602694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+v6RowI8p2XaEBSOcUfqm4BSxcSsncMZw0XrVYG3wnY=;
        b=tHDJs9cWk5K/yWWIbCtDHZ+BK9uZKRwK/0bgchoTeMtrUpPCplux72g62HERoJ0+1s
         p2Q+JeFjoOw3zOnpEy3u1h6uu0CVmK6xwrmOPMR6yKrCyLELO0aHf0ICZOAlHIMroTbO
         T2YPMjoRkGjRBxs/0ymMi/WA7Fi9AVNVfg0OoGuJtRwHmNILfJDJrMlx8xtlZS4bM8s2
         QYKB3Bt6a5hXYl5lF/bUloGvAkIQbIo2fe/mHjx/C6xEBbqU5jEQjJcDUMJGWArjY1Cr
         hqN0IuQS5QC7JXCgMGPYumYBliUeqGGUp/2g3qfjCFnaCngPFdAUwShEpdGD9HPno3fy
         nJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXu+3rli+i5AyuzNCdHLcLLSsGV/e0m5/nVTQ99lUmHAimjX+oBo2MtPqVo7qOq9G4SkBP/ed4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcLpIJpF/7yaQCZv9xLlTUh89yJXPw/9p47wcjFnBJfW+UhvkV
	wXT5bBFDi2Oa3mJdYQQa+KcVIb2ls2189jL03ERXbiCNlP5qwpOj0snMN8mHc+7TJfbh+MqM7Rr
	+sAlYSzaoPXaaCyBPx1ZaJ6P0h/C1HOE+iSjHjdTqimtIA0wj2xEbTxRKG0qW
X-Gm-Gg: ASbGncuCV7GgxdgglYTabTqTpClmt3LA0luzvuyoJK0vv2YdLD8xcRHw6ioCp4uZYo0
	hqQpBJCn4VbzMT2gCSRaaYz24Av1Hd8RG4mDJftkQASuEoyqjwFroAAtPn1gsFHXS1SolknBR3S
	4NEHJwQ1aYa6PgZ3DBuETfPUIrvDvINPT8U4FJPIKdD/g8NlUsPLhDmjMmQvESeycIHzDBOfX4s
	Y7CvmwROwhuPSGeaStPvJZHnUCnEv0oXpuGdzdrta/rXl8SggKe9KYl/rjrB7rhFmJ8F7zdR+O1
	nW7TdWGjG//3/SvBdJxFVUy99oirmbFbxOVGY/Ein2ZR+sQtqBKb21jS
X-Received: by 2002:a17:903:18f:b0:223:5577:3a41 with SMTP id d9443c01a7336-22368fa57a3mr173980605ad.9.1740997893842;
        Mon, 03 Mar 2025 02:31:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNVI4JlkpIfWLH6f4/0kTgkrFwnIJf8hpggfr8EaVfdEdEmG/5VJfWu8//Xgzvy6/7LQ7iqw==
X-Received: by 2002:a17:903:18f:b0:223:5577:3a41 with SMTP id d9443c01a7336-22368fa57a3mr173980345ad.9.1740997893500;
        Mon, 03 Mar 2025 02:31:33 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d529fsm74683445ad.48.2025.03.03.02.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 02:31:33 -0800 (PST)
Message-ID: <3721748d-a260-4088-a606-e851c417a0c3@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 16:01:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: cfg80211: Add support to get EMLSR
 capabilities of non-AP MLD
To: Johannes Berg <johannes@sipsolutions.net>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
References: <20250117170416.2907530-1-quic_ramess@quicinc.com>
 <20250117170416.2907530-2-quic_ramess@quicinc.com>
 <66e4ec1984c816bd8e0a95a8bced753d780e30fe.camel@sipsolutions.net>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <66e4ec1984c816bd8e0a95a8bced753d780e30fe.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: diG3lp9oZOGo4ruiYa_lTXvkfTvCVK84
X-Proofpoint-GUID: diG3lp9oZOGo4ruiYa_lTXvkfTvCVK84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_04,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxlogscore=945
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_023136_768967_708B56C3 
X-CRM114-Status: GOOD (  22.69  )
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



On 2/28/2025 6:02 PM, Johannes Berg wrote:
> On Fri, 2025-01-17 at 22:34 +0530, Rameshkumar Sundaram wrote:
>>
>>   include/net/cfg80211.h |  5 +++++
>>   net/wireless/nl80211.c | 12 ++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
>> index 363d7dd2255a..7a80dbf37881 100644
>> --- a/include/net/cfg80211.h
>> +++ b/include/net/cfg80211.h
>> @@ -1756,6 +1756,9 @@ struct cfg80211_ttlm_params {
>>    * @supported_oper_classes_len: number of supported operating classes
>>    * @support_p2p_ps: information if station supports P2P PS mechanism
>>    * @airtime_weight: airtime scheduler weight for this station
>> + * @eml_cap_present: Specifies if EML capabilities field (@eml_cap) is
>> + *	present/updated
>> + * @eml_cap: EML capabilities of this station
>>    * @link_sta_params: link related params.
>>    */
>>   struct station_parameters {
>> @@ -1780,6 +1783,8 @@ struct station_parameters {
>>   	u8 supported_oper_classes_len;
>>   	int support_p2p_ps;
>>   	u16 airtime_weight;
>> +	bool eml_cap_present;
>> +	u16 eml_cap;
>>   	struct link_station_parameters link_sta_params;
>>   };
> 
> OK, I get that this is the minimal change that actually makes this work,
> but it seems a bit lazy to me. Allow me to explain: You don't actually
> _want_ - nor even implement in patch 3 - this changing at any point in
> runtime. OTOH, you _do_ need it to change after the station is
> allocated, because in auth frame exchange you don't have the information
> yet, and that's when the MLD is added.
> 
> So I really think this ought to be accompanied with a change to
> cfg80211_check_station_change() that disallows changing this while the
> station is already associated?
> 

Yes, That's correct thanks for pointing it out, will add changes to 
disallow modification if STA is already associated (i.e. if != 
CFG80211_STA_AP_CLIENT_UNASSOC)

> johannes
> 

-- 
--
Ramesh


