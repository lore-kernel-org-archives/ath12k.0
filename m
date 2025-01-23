Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACCAC02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 17:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/igeLISpBDQb4F0p7vtfCh9x3La1i5T622uQk0rbUE=; b=oBYM5xdoxf+6Zbi6dB4HcH+LQ4
	V5zNsF6Jl3kdgYsKqCkHmFDXBLHNzSjO9kabO8+T0E1SslYIhQAN+LyszXTErU8Jw8pLiLCWY2n5k
	ZC6pclHgixXsifDBCdXroao+3qj0dTkySEnqF7e4k2gsqBNFI1OUE3USlTcdJ2h8bJWR+APyzgJi/
	wpbu4OFMlCvL18B+7OOKo79hwtdRQj7l2enbc+q/DXr3n+T9G5FC4aAHvJ3jozclrZnkT+iUm4LTO
	CRPFWe6wu2G6KizMu1nwRk+0LC0McI7589jTsjAiq0c5oZ9xiXtNt+iXfokr9+rXVM6xuvN9MqHkP
	TBJkMlpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1Lh-0000000Cz8a-2IaP
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 17:50:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1Le-0000000Cz7K-2ODY
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 17:50:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NB6jmd020749
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 17:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/igeLISpBDQb4F0p7vtfCh9x3La1i5T622uQk0rbUE=; b=GyBydaRe71b6TAB6
	b7tEIxn5KkjARv+DP8d0GKNA5ePwT95K4sIEVLtqmOPf3clojUFIEsMp/A6H3S1L
	SZC6to8iMVkLg9N6p3cfIV8rkm/SKizj3YPQWJxLUclSSHG9bhL7J+phlEdnTTmE
	dlH+siDfJP1lz+rsjlqGRvwYnmRndQ65QSqmbpim6V9ji+jlwr+BW0yGColdoEX9
	ng/E/r2ES6uLSZCOOv+s6rRcaVal4Rt8QT31LFZpYQrNi/OOFS04Z3DO5bOfeOa6
	QL9g8htpC4V5WWWi9BujIjZpKV3AcDqv6JT7Y/1c3rQ16fYLXlHWI5hM0n54a33d
	64p6Gg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bmm10yep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 17:50:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef6ef86607so4373214a91.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 09:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737654632; x=1738259432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/igeLISpBDQb4F0p7vtfCh9x3La1i5T622uQk0rbUE=;
        b=gWuNIx6LhUcRCMMQAfLDUSZ82Suu1FV6AERLCb3+Z2Adj1B8cHSdcOyBPfPzuyXqco
         Z30AvsAAbBKi9HjVZDIoLCJ7DCiCvI7UZ/j6celP0FlKxozpRN7XYe7QTOXgNL9/nE9V
         pwgfjaQJVBv245+DzIGxaTFNeq5A3w11w8HMCxlao1cH8Wuzh9HSqozlawy0Tw93As9L
         I6oJQq5vOlgBHlRpEOXixY4KM+bq0j+gVsOmVGI7TeEV4JdKDfJrz/HI/FvXy7e5q+1Q
         g8IJvZIuacCDJX+SBUoimNIIczfg6rfuV9AI4JEkwJWMFBZQhvSUdPVWKZEJqir3EqAl
         s0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+qRwvHEcgtzWYjC+AelNiRrtH1qs7fg7V64UpHmk95/CUPtb0Xl54tfPKmVvb2FW2NJkjMQk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxT/vDOzdBOEFcjhnMLSi9oaaSZy02mHblMZhbJAOC0ypg2ydfh
	sK8Pf/FMtgkQEndPC22MEGFr3JgZ/KbSbrzlmGpUCAJUphxYLMNuYLoSHKkuF3CO2oUMTTp6q9Q
	OrKvF5W9mEgWyV5SNow91i4kLjgSmbEBec1dFyqAOpbqdGcYiO2Uy5/vlTCA0
X-Gm-Gg: ASbGncsCueHmBuA4mUiAghI4SErX2R8MRBcn+MV0pgHX5P3Co+TpR16sd+XgV47HHGQ
	YsNwfUI5oEf3QgTL2Z//uW/1U8qcYw3JxdEH3SXFu16d7kFEuM8c+UDFx3v1c6lQMoAxWDNzKij
	VkLnxUvu/CZHFT7gNEUnnyGy58zngV4S3ybWE7aB2N/Zca/K5prd2tMlRL4rV8db9VbdCAXlg9J
	cFn2Wr+EChQ87/e7ZTGDNgO+eoiSSZozwudXejwMq+kSBiyWa7c0tBvohnZiwAi2z6P5mguy12I
	sh7erOLY9Z91nIAyPVN9olBHE464xkk04779J8jh5HOWwwh93mRVWwt8bYygf8s=
X-Received: by 2002:a17:90b:1348:b0:2ef:2980:4411 with SMTP id 98e67ed59e1d1-2f7ff2f065bmr358728a91.9.1737654632213;
        Thu, 23 Jan 2025 09:50:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAtq08VwqGBJlI3fCc7ZACmqGbCst4C9o8cd6GJLIYjhGxqHzv9xlw9sqKsjcOfoIkjRCNQw==
X-Received: by 2002:a17:90b:1348:b0:2ef:2980:4411 with SMTP id 98e67ed59e1d1-2f7ff2f065bmr358703a91.9.1737654631844;
        Thu, 23 Jan 2025 09:50:31 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a7e039sm4665568a91.17.2025.01.23.09.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 09:50:31 -0800 (PST)
Message-ID: <4629864f-010f-4524-8861-1381f4b18614@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 09:50:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: ath12k: add MLO CSA support
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FhonhdJsDF6jo7Jj45X69z6fUV5gJdcs
X-Proofpoint-GUID: FhonhdJsDF6jo7Jj45X69z6fUV5gJdcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_095034_734748_4A4D2A0E 
X-CRM114-Status: GOOD (  14.91  )
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

On 12/23/2024 8:21 AM, Aditya Kumar Singh wrote:
> Patch 1 and 2 are pre-req fixes (applies to non-MLO as well)
> 
> Patch 3 basically uses arvif->link_id to enable MLO for CSA while adding
> support to update counters throughout the CSA time.
> 
> Patch 4 fixes a potential problem seen when medium is busy. Again this
> applies to both MLO and non-MLO. But this is exposed only when Patch 3 is
> there.
> 
> ---
> Aditya Kumar Singh (4):
>       wifi: ath12k: update beacon template function to use arvif structure
>       wifi: ath12k: fix handling of CSA offsets in beacon template command
>       wifi: ath12k: update the latest CSA counter
>       wifi: ath12k: prevent CSA counter to reach 0 and hit WARN_ON_ONCE
> 
>  drivers/net/wireless/ath/ath12k/core.h |  2 ++
>  drivers/net/wireless/ath/ath12k/mac.c  |  7 ++--
>  drivers/net/wireless/ath/ath12k/mac.h  |  1 +
>  drivers/net/wireless/ath/ath12k/wmi.c  | 61 +++++++++++++++++++++++++++-------
>  drivers/net/wireless/ath/ath12k/wmi.h  |  2 +-
>  5 files changed, 56 insertions(+), 17 deletions(-)
> ---
> base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
> change-id: 20241217-ath12k_mlo_csa-35bd512a05ae

fails to apply to current ath/main

* Applying 20241223_quic_adisi_wifi_ath12k_add_mlo_csa_support.mbx 
Applying: wifi: ath12k: update beacon template function to use arvif structure
Applying: wifi: ath12k: fix handling of CSA offsets in beacon template command
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/mac.h
M       drivers/net/wireless/ath/ath12k/wmi.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.h
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/mac.h'
error: Failed to merge in the changes.
Patch failed at 0002 wifi: ath12k: fix handling of CSA offsets in beacon template command


