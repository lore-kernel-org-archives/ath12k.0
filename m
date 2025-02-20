Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4DC021B1
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDFhrNsdY1kx0kPJdMeAswDsNzYeQpnI4+da35acGnw=; b=k6a4EyDSKQPJNJr56cJD5oR5Q1
	EB73m8bUTV7YS0uvoh7Us0KGB0uEDrCJFfNvtCAL1gUeFv97qsLjNEhiDbXdksu2LRqYvhztbgCjp
	Dcs6U8+upuqxuRFzJyeLWseEzKBUlJxpLKURojPXm/qYISaHalluAp3eXPb+U55FONVnz3ceQSe6p
	hHpOntDKmScZZ68qtpIq3ywa92NcSvaOXaY9F7dZjmcDGwA41QCoUYArrSQHPIPo1+wV9CfDp5wmN
	pbeBlLlVUW6ES/Tq8o8vXn9Be+pRbGgGhdeKRRomfIHj5uowa02rJQPdQFAD2BQ6GRQvieye+yGJd
	mO0r9CUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Jr-00000001Wjd-1t8X
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 15:18:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Jo-00000001WiN-2JtN
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 15:18:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KAWu1O026008
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 15:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDFhrNsdY1kx0kPJdMeAswDsNzYeQpnI4+da35acGnw=; b=c1a9rDLu/S6atHUN
	2dcIDMFXWsWoxuboAfhNvheZhOeMKWaICbCtciAG0fV8nbkV2DEAgJqh9hvIgUsp
	sDuYs5IPv3snQe5FN/B6aFJvxtoxAZI+drI6u6XZthDp83vPc9KK+XD+YNUIOsTr
	2y7Atpr+nsKBNfH28Y2xnn1maNDt8LOwbuhyPfmJJUFlWNVtqDw+G5VqcZJG+eif
	3LFBvIm5ybzRyvJXy+T/ZYITVcOSwrucdDgxQcNN5V9d18orEBJgjjfpjQK+g6hm
	j9eu6Ygkijf7RRSX6FL70HvwffI1gXXFeaYmhlHxUliysLJU4gUxLXq1Vrdg0hpy
	RyWXkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2r3rqpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 15:18:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2217a4bfcc7so24175555ad.3
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 07:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740064707; x=1740669507;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDFhrNsdY1kx0kPJdMeAswDsNzYeQpnI4+da35acGnw=;
        b=R9dgWEeQa0vm4Zb4X/ywq0DKT1We9veQsCJVqySvpjxQBeg3u95jHcQ2yzSD36TWaR
         J2WnKQi5BaQRS7oZ7EcihlHcJZcvIq9xox/x1rCi9rmLpb9Wrl3i1yhHz7I3xawo807g
         LShVG4u9RFZk/5CICxrvsyhA09S2tWpEN/nfbLBiT59v8DYWjn4ayySFN2L2q/0OchkP
         dohauIwfLPf8nJoNLuraubtzh5n2GDLbiV4MGMzDYLSj6X6HeQOTMaLeRgev1/H/QBZy
         gkOxeRD0DyJyNU68dXNmynFyVUTQIb/WFrfi+SouET1pTOz8PhLwU0lEM4KvheV85xUw
         owSw==
X-Forwarded-Encrypted: i=1; AJvYcCVwDLbC6xXOCt0EECwt2rZfGKWuJO/+/OzMqTxxKkRAaRNq2/31l8ITgjk8/XBcnqkeAzvLw98=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx0+jwLOvzQhQXy07kVRdrUBd4313Hy7snFq2mx2ZFInumieMI
	DSLqLXavAuSEFcnGcpYdHov3LY3IVqX6JE0vsGQFBJtMVRcspCMv6F4kcnYH6pGpdSeopJQfT6l
	L+mCE5HSpnJ7+ZCIzpLHVhPRSZ9S7tgB1Dn3t8lDMDNpjZsSzCl+5a27+crEV
X-Gm-Gg: ASbGncuHHyDoGcl8fCGBLGWeJ7zkrKRs9xNauPlzxTsqvfmaHlzgCyFHhXVU+EcwTkk
	stiyJXxid8je4iFwOxxVEpdsuky2sU1Kvkbo9xdMBWJhqKsYgp384n+7s+wZrbuUoLPBIzHFLaZ
	aJzt/l1nUOuJpAB3CzQobS9Qlm016Zsc6i2H6nLHuJvhQJF7iWWARMVvWxJ9mugRK1Yci9b9Wgp
	FRHOZYO4Vj8Fn1uhCstATEX+Ds797mkCsradufpbe21TAPSs4Fc2t+vZrhyYePNja/+9aE1aEKC
	HtbT6C89gu8gvxFI7wln1nhlWBA58fXXlAxkptNRcmaUP9jjDH2vPbrwIiqCfkyzKnQZolKxDw=
	=
X-Received: by 2002:a17:902:f54e:b0:220:c63b:d93c with SMTP id d9443c01a7336-221040d75a0mr399578225ad.44.1740064706857;
        Thu, 20 Feb 2025 07:18:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRuCuRj5I/H6dKxpVvuX1bbiDAhyHGQI8dPrQ1MVrrYoRNze6OQUGFftyobfkpahCEox2BVQ==
X-Received: by 2002:a17:902:f54e:b0:220:c63b:d93c with SMTP id d9443c01a7336-221040d75a0mr399577855ad.44.1740064706451;
        Thu, 20 Feb 2025 07:18:26 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73250dd701bsm12547000b3a.131.2025.02.20.07.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 07:18:25 -0800 (PST)
Message-ID: <532a73b1-1a46-45b2-aa06-9696edad8c0e@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 07:18:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124113331.93476-1-nico.escande@gmail.com>
 <7e120d90-bbe6-47f5-bf72-c1ee681c97a0@oss.qualcomm.com>
 <D7WMZ4TCZKPB.2GBOWXBN8WKF9@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D7WMZ4TCZKPB.2GBOWXBN8WKF9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gnhyq5ZlUtY8CP78DA0CF278MWq8GCYL
X-Proofpoint-GUID: gnhyq5ZlUtY8CP78DA0CF278MWq8GCYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502200109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_071828_600009_323ACE1F 
X-CRM114-Status: GOOD (  17.33  )
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

On 2/19/2025 10:33 AM, Nicolas Escande wrote:
> On Wed Feb 19, 2025 at 6:58 PM CET, Jeff Johnson wrote:
>>
>> checkpatch complains:
>> WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5e8a373c8699', maybe rebased or not pulled?
>>
>> And I don't see such a change in kernel.org
>>
>> Perhaps this is an out-of-tree change that should be referenced in a different
>> way?
>>
>> /jeff
> 
> Indeed I didn't realize that was not mainline, but just in our internal tree.
> My bad. Honestly surprised this has never been pushed upstream.
> 
> So the corresponding patch I was refering to is this one:
> https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0.r24/patches/ath11k/207-ath11k-Add-support-for-dynamic-vlan.patch
> 
> How would you like to proceed ? I can respin it without this wrong reference if
> need be. But if one of you guys has a better fix or something we can drop it too

Let me fix this up in the 'pending' branch

/jeff

