Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E12BC35FFA
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mIeomPLPedDRzmXiIuauhMKXkTwEh7EaY68qsi9Cqc=; b=Jg5I/uMcWvY6kNrs0C33sMZTDJ
	aBR5gMRfNFt8TBYpY/gT3j+B/coxL7oWcioH+e1mzjeWW4P6jWymMXZ1Ti4Q3nqSCvBQ3N2gyzrmW
	bL75sQK20ZI7sf8ynEOEuWsNy5+WJRlMafOn5/5UsRZVARLTfrvyVwrWBbnpqI8gq7OJNioyHKeE9
	SKis9Q+oG62RhwMWon6UMaaExa+AD+nJrVUthETf6PIozdnxbrmXKv5ZjOVJKiGQoUGgsRm1Vtvua
	Zu3Ukn84LU1mnJYv9gW3nK3/nMpZq3wWYHTyGqeG9HqyYCKUE6a2v71eK3sg89i3gQdYR9L5nndWd
	5tHzlWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyDn-00000009qU9-4Acq
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 18:32:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyDl-00000009qTo-349Z
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 18:32:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JE0coP009916
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 18:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mIeomPLPedDRzmXiIuauhMKXkTwEh7EaY68qsi9Cqc=; b=boMvUTr+dwrK0kJ/
	CJ7DtB9DBjlL4nMgK+gGgSaXIZArWimf+vDP7HbTW5vuJZqzKx5gDU1NxLq/ENra
	Pq/Je0cpGd0X5AUsi6N/a/Z30/YggwWW7MKjq8oz6COA+Nj9quuMP6IErudDiCES
	syxVYygKonntqDmOPUrYO/Pj7k6UM9qEql5q3j6BSZHO+oQttQeIGO++avOtOMFP
	JPZPzeHDqBScCaSupGg9M+z6Y7pmwY07oodhWv7sxcpci0Prkvgpg6EHP4bKh1Up
	RUV2RhdM7s7GuKoxrjiKxMujMLM2THf3lSZMlV+l+kvsk90c/LojtYqrr24I7+tJ
	Rp/zOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdvxkj2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 18:32:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2233b764fc8so126408145ad.3
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409171; x=1743013971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mIeomPLPedDRzmXiIuauhMKXkTwEh7EaY68qsi9Cqc=;
        b=IJd47FXE42IVt3Ci8nKRHimDyZqhTsELo4EldMh9Nps85026bA7Vx3cXUimdEWkQes
         EClRncuiq09r/+LUyzXnexXN0Mc4dBtZkRMUGhsx2GAhHVsiDXMm/SM3p+1qtsUmBUlW
         oCaoRm4VA+vxa4WOwHbQ88EZ+CvhE8dstLBRavegXBe/v8ncuvL6122fL3yyQ8Qf9cJT
         B2F5m/W+1W3Piyj2RI089Fh4yElViUoqawNu5Kl1rikl+V6cSALU5gjp5J9unKGqBOwZ
         H2+SgJmqUk5ChbGTahiISpFKi/UCM0Qi2LDxvm5sNFKH9bURBh04xu3mN6OYI6colYbV
         sWVg==
X-Forwarded-Encrypted: i=1; AJvYcCX/MWueSMuGrNZKEWnHExyyajVf1/nTTO+h4XwGN+IPu0WMYTVMn/GVkI5AKb7lzXrHM3JcYCE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzC8mDZAVYqnJG5GMWEx4hPy648bWh/xWHwBqwCh+IfdZkB6mnr
	hBIYW8Ba8/bSDz8E108+bSEckNkuqHUDpwOlCXqgTk3zzQa3PcaN+BNMHNiHmVuCycje5zNPaio
	fyUcF2RdU+y1FVBkUk0Hg7de/96Lfv9XsIRWJAuKZL4CN6p3ZmHNwEb6ZTCfA
X-Gm-Gg: ASbGnctHLF6MiUWM/ebnYcavapWrGhl9nbIuS954KZPK1XQEMxUlpfvabKDpJdWNCPH
	VZEduuQwkkHUwQ4juKi9wrHCC1ALkKbjOviCYPRvQNsU28O7/jxf+hXrWp8tg0Yx8Sz10zzZbpy
	vxEMcuHhplrQjV1KmVOrnh1mLOhPH1vjobNevhHOmZ7dOwAW/ObUBjjFoZ+RW5Liapzm+6KYfpO
	tUsxn+BEQO8d6mqwJ2ak7im9NC4QEP8z2SI3LmE7VUAT4g0n0QmEfyF03SzPh9jr6IL7VPdtcP1
	3BMwjqWRWIf5jGN2yzqbHpSje2ZT7bLmOX5Vu1Oy5y/Sn1NRpCdkFpvYyQnHvD+xJeAjZNM=
X-Received: by 2002:a17:902:ea07:b0:223:26da:4b8e with SMTP id d9443c01a7336-2264981b58fmr71235835ad.4.1742409170997;
        Wed, 19 Mar 2025 11:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGazHPV9+2UyMKutqyNnaqlMLBrR+fcmmqZeYlBjWXfurgn8y0zm40TDXmtXT1NFf0ZNxc+8w==
X-Received: by 2002:a17:902:ea07:b0:223:26da:4b8e with SMTP id d9443c01a7336-2264981b58fmr71235405ad.4.1742409170628;
        Wed, 19 Mar 2025 11:32:50 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe890sm117378585ad.188.2025.03.19.11.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 11:32:50 -0700 (PDT)
Message-ID: <770daf27-ae9c-4ed5-87d0-aadcc3b74bbd@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 11:32:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        neil.armstrong@linaro.org, Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=67db0dd4 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=xnwWoSdEmYegiN_xJ5oA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: NPKhM8kgf5wJdzq9-O57Elb6JEg6ebG5
X-Proofpoint-GUID: NPKhM8kgf5wJdzq9-O57Elb6JEg6ebG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_113253_899861_DA4F5AF6 
X-CRM114-Status: GOOD (  15.81  )
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

On 3/19/2025 3:27 AM, Krzysztof Kozlowski wrote:
> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>>> ---
>>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>>
>>>>> Best regards,
>>>>
>>>> NAK since this will break QCN
>>>> There is a series under internal review to address MLO issues for WCN chipsets
>>>
>>> ???
>>>
>>> The original commit is wrong, this fixes the conversion, nothing else.
>>
>> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
>> Setting the mlo capability flag without having required driver changes
>> for WCN chipset will likely result in firmware crash. So the recommendation
>> is to enable MLO (in WCN) only when all the necessary driver changes
>> (in development, public posting in near future) are in place.
> Really, these are your answers? There is regression and first reply is
> upstream should wait for whatever you do internally. Second answer is
> the same - public posting in near future?
> 
> Can you start working with the upstream instead?

There is a lot going on in this thread. I want to address the big picture. It
is no secret that Qualcomm has historically focused on downstream drivers, and
upstream was mostly an afterthought. But that mindset has changed. Qualcomm is
fully embracing upstream kernel development, and has actively recruited (and
is still recruiting!) experienced upstream Linux Kernel engineers. And in
places where there are shortcoming, Qualcomm has partnered with companies like
Linaro to bring in needed support. So Qualcomm is very much "working with the
upstream." We may not be working well sometimes, but many of us are still
inexperienced with working with the upstream. We are coming up to speed.
Specifically for Wi-Fi, we have a large number of engineers who have primarily
worked on downstream code who are now working on upstream (including me!). And
we still have the issue that many of the products we are shipping now still
have a lot of downstream DNA, especially when it comes to firmware interfaces.
So please bear with us as we learn and evolve.

Please keep the constructive feedback coming. And remember, the more detailed
the feedback, the easier it is to incorporate the feedback.

Thanks!
/jeff


