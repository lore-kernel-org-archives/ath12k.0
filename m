Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302C9C7EE31
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFPPqTu7MXA+vyY2s6jE+8VmboVurKBM4dXe7ELAAi4=; b=JwcDrnCcYJ8Shpngtdi7IOytpy
	2eC9At9u/9dZQ8DasEbz8EHbcGa8Vw6u/Fd9o7B1qW/OCEp8n1blWggM0TPssEeklFFKpdXzW/O7h
	j5gpInCF1eJLxDl1mUvhHZyhLEBHgc9VlzWwfvUaG4ewBRkWjbj5NH9cUxR5tl9NLyuki7hh+XUoC
	kkPCCoHMUVr7caWXJjtg3WNJCBpaDHxAKnAFMqH2XZNDkGsm8h2hCd2ubt2UqFJhl4qVgo+KfRBVH
	QXgb+2L+TJQ7oAz4TSxs8VIoEf2NUr5JYD2vE28F3ul8s4OMpa6Juo+JCIjOTdw1Sxntr47p9INpv
	dzmGnPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpwJ-0000000CKZc-3RP3;
	Thu, 26 Jun 2025 16:59:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpwI-0000000CKZC-1wch
	for ath12k@bombadil.infradead.org;
	Thu, 26 Jun 2025 16:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IFPPqTu7MXA+vyY2s6jE+8VmboVurKBM4dXe7ELAAi4=; b=qU9hAhXAx6lzMsZxWgSuSGOcxO
	So5TvvRK8SjsdU3hhBeW5b0MJpjTtvi8cJ7IMO4NVWBGiGR13YvNCNbYDDEkE8mOuFJkOAaiGohJh
	v0shmedjaSRxkeVe8DpzgajD3zb/0UmwGanzJZ8o1OvjoYbj3Ce86RlkRxMTbUQGG9cHRbx6eWfAr
	ILZeCHYRcbIc4J/vYrThOD581BHXRRv8aQ94KU2UrQKrnMUcNmPYpBHyRtK6D3Pj42UjROe6HdZzV
	xM1Sn6VIWHi/8RuTMdc914Hw5MYCi3LKXAPIuHVwwHff5dMkH6dlbIaJQnAbPHaDoW9KmS5suuH0h
	HGlBKkXA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpwE-00000006AGC-2rXP
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 16:59:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA0Ovj008315
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFPPqTu7MXA+vyY2s6jE+8VmboVurKBM4dXe7ELAAi4=; b=f8deDrJ0pdWBJwzu
	KRooBqZTRkvta3YcV7jEhkrDITXu/O9awSvIhho4e3PcsDq5gKOk8aNE0Ti/jVnC
	Az6bAgBjyoyom0ZkFORwQ+hG5qDcG7eHFZRsQybx435lb1OrQaZIvwRzKpci9Ds1
	b1Lv16j6xO83WFO/7mdNanU51UJTDFhwC389RE4BIKAzR5NnJ4QQG6gSgzlxht5r
	FMBEJ01LMfIxIBxqCh3yNJlgn0IWEvKCD64B8wxj8KbIGB4EN6+LjgF37rxiP/aj
	xGeLQWC+dkTTmLroyVQSbA2piM1gHLexnO3d77YwkOk5GSF/eXwxFAv/mz3h4HW+
	SlATZw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqtgg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:58:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso1146984a91.1
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 09:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957136; x=1751561936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFPPqTu7MXA+vyY2s6jE+8VmboVurKBM4dXe7ELAAi4=;
        b=Wf6ZMkZ7kWQf7Qlae7ua5TAcSBM6DnEn4jrt5Oecu9AABtxKrCrh6SDz96F9ZPrurn
         BiJVz0dtiphI7OvENNWTmDCdw8TltBbI+Kjlgd5Y3n+OfEJG9xA8NhmRdeDFJusoEUkW
         jtOs/WF5etdgjhmja7FEDVAC3anBliO23mLwHve3FYFV5DBpH/wswCAJQ+5IFaYuwSVf
         EaD0vDuMA4FdJiHYlaSrUJq+jH+96dxp00TV668mbv7pJfW3ANTRAY95lsibHiBYyE0d
         qKmGmpp14f4C1KkY3bZLQQmaCxAJX0d1vIX1jpMf7jhhjZnXzI8usKqbGsLASg1T7oZy
         pjPw==
X-Forwarded-Encrypted: i=1; AJvYcCWlG7uvSxeITl9S/G4W4W+9Y3x6HFGGKGnCgbd08JJzLGes5oT+cnVEM679HIbrxizkvYEvibE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRzGxqf3/A4SUIJ+F/PaGZnm+el5pZvRssHeHHpOQ9UVKyepDy
	dqB53WRgecPNZTMTR9weIfx7AyuUZAnddxbeTKpE2UcVyvjwyZsQqlxLTR4H22G4k7hcWmlQ/zc
	ZtQT+eZyOtj44mxTLO023y0aNc4fj4tTA+XnV0t5SX5KfewbpCG/qgtk85/WQsNNf
X-Gm-Gg: ASbGnctLONqPPC8bX2fBn8ENHFz8+mWN6Vd5kwz94ozpo1+yPtDvueDRy6AWn60NRRD
	YTqoDdMqFx3Znqz1O1ukXSQAbTCvWP7vRc3gNU14YrxiJqYHOhKs9O+9BoLwBIKchTWULU8yvBc
	b/Q8fEM/EQ92/5cTMRZ53peayLf0HSYDNgMzrIu+1RTjkR4QQ27IfjMQdjHYJHnlXE0KYg2CPi/
	hQhh2lem5Bk4s2cx1Ju1K2W31G88I1SqZ8UCZwqFen2jazgAA3isZxUtzTQ+IO5j5o2GkjwoDSx
	WPLr9+VMTHooI/l+I430YeswBdIkrvVBBBd0g8HG57BIA/EB6fOBWQqiSCdu4x2nGuiBxiw=
X-Received: by 2002:a17:90b:582c:b0:313:1a8c:c2d3 with SMTP id 98e67ed59e1d1-315f26896dfmr9569156a91.22.1750957136303;
        Thu, 26 Jun 2025 09:58:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDpfopUuG4hU2Yb0y46Ll3Pqz+c1+9LjOPXninqakgris97nlpW0Y2qwrsu8JaSPMiEtOk7g==
X-Received: by 2002:a17:90b:582c:b0:313:1a8c:c2d3 with SMTP id 98e67ed59e1d1-315f26896dfmr9569125a91.22.1750957135783;
        Thu, 26 Jun 2025 09:58:55 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.255.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5428ae2sm4932845a91.28.2025.06.26.09.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 09:58:55 -0700 (PDT)
Message-ID: <27c788ee-b12d-cfe6-3543-f320c4b7fd72@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 22:28:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: use real noise floor value
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
References: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D_CRMLqWEJpNwgf_K0XmsY0npWJ4HbSy
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685d7c51 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=/xG1ZwzdjF5UbGEDupzz2A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-iIeHy2jdy7NZ5vI0E0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: D_CRMLqWEJpNwgf_K0XmsY0npWJ4HbSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0MyBTYWx0ZWRfXyBGsldiAlHGC
 6GZHd2L8nhuoQHgWZ54iBE80sbp+yIaoIadAoaqsB1DdOfqbaZv63Sx/KiUSmc4RAgxrea+YPis
 7epJ/uVAV5mMael+APoKAp6UiZmpXORDGe1gm8//s4iHkDG/39EdYrDVVOTq3aViVYZACbfzzoU
 ixms23GDM98v2RS3jIaUTet70EPBu2NS1Vad6JeRuRq+Kg/upi7UqP2zi4vfwyJ5d3Vs90bd3hD
 SkiFsYCY7nwtI+Wunwa2RXv47jyMRpesqwxHw533b6/HdYR9oipIVgG+ubHhJjZJdwoE5j6Uwpe
 /zaVOlnlKgOgl4pmnmx6BmMr3qbHg0FoxtwqkXRwzAfVphJuRC5ayEtStBZIk4bPZ8SXbtBr2tt
 0mEMtedcoGRaBSKeut3GAaG+WqNlLzRbGEOcIIGk2yUtB0AzN9sIvmWn5FNTQSzM2X9mKrql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_175903_138046_C9547FAF 
X-CRM114-Status: GOOD (  16.21  )
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



On 6/23/2025 9:19 PM, Aditya Kumar Singh wrote:
> At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
> value, providing an estimated noise floor value. Consequently, the RSSI
> value is also approximate. This works but however, using actual noise floor
> value will enable the reporting of the true RSSI value.
> 
> The firmware possesses the necessary data to determine the actual noise
> floor. This data is provided to the host via the WMI event
> WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
> runtime parameters needed for calculating the real noise floor in dBm. This
> event is triggered by the firmware during channel changes, temperature
> offset adjustments, and hardware chainmask modifications.
> 
> Add support to handle and parse this WMI event. Use the received values to
> calculate and store the noise floor value and use at the required places.
> 
> ---
> Changes in v2:
> - Rebased to latest main. Simple conflict was only in wmi.h. No other changes.
> - Link to v1: https://lore.kernel.org/r/20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com
> 
> ---
> Raj Kumar Bhagat (2):
>        wifi: ath12k: handle WMI event for real noise floor calculation
>        wifi: ath12k: use real noise floor instead of default value
> 
>   drivers/net/wireless/ath/ath12k/core.h   |  17 +++
>   drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
>   drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
>   drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
>   drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
>   6 files changed, 324 insertions(+), 9 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

