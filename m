Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D9AC53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 03:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xLplXp06MskGJnYJTS+C/PUBSsiZL82WCkaiM9odTA=; b=QGfwqfosK/BbnCzHFsPqiP24Qt
	iJg/n1ZpapF1+enN3wguDjp8xUNENIUg2udGnGKJu3T8dAehoKgLEO5upzq/JT6rhPXh3FrS8X44T
	xbHApP6qon4HYXeasSJiLVRdK5E8pGIu2dSNfYpW/6h5Q57PWl8uZokmdeo2cY6WAO1yukvQ3kK2r
	p63O9wxnEVwlAJ2KRqgYXD6d5QGMAEiQO9871SqKoydnddQ/Pr/juLb11OuU90NvnPUMkybGyM31T
	iOtXyEp6I4vt9eDl8RW/etwGgI4XloAj3xGlHR23BZhRLZJ9GmTVrB8fYqVlj1JnHCwwNgfmxEyjZ
	niycM/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovQI-00000006n0I-0uuk;
	Wed, 29 Jul 2026 03:57:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovQG-00000006mzG-0pmB
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 03:57:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HVg3498533
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 03:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xLplXp06MskGJnYJTS+C/PUBSsiZL82WCkaiM9odTA=; b=Q+EV4mdmyLYlcrkA
	XjPTyD20Xx0agRpKXjikjErnK+COidStfjXta+OdPbUvkDFdVIcCZLn9YWBdKSTT
	vIKzAsCSByPCJMYchypqeBajBmRb66uYCWiGvEds/RdgjurLsEazdYXDlJIihYER
	jwLn/7O7JEko+bkZw10y/080TjztYnnrOxo6/aYnMsJoE/CgiWR26atwNVjcTozv
	cZGSM1RgJDvDRtIWIamc+haRY1NLnUIsviKS8HpokoHb7KboQ3pivn7ZcX2/nCDS
	ofnSaXTmKLm1m3zi1apFtKq6oLo26Fh9Cmm0Q5kHe3uZuQFx+iZIJQD7utBMu2Nu
	GOFEcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq10ca0n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 03:57:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7621655eso907647a91.0
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 20:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785297454; x=1785902254; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xLplXp06MskGJnYJTS+C/PUBSsiZL82WCkaiM9odTA=;
        b=bwhGfoQFFRIxzFZIr94/QCYwpXFELsibDAGlqMYkWm0YG5X2nbQkUVJfJzu6deYriW
         Rvnke2/qRvfMmVp2Z4Y8zCQPVl58My/b1mR7SmpXIo/xUS5UE5wZKa/lBZvfguDXioIn
         4e0Q5L3JpEHOT6+z2GbL35XWAwJlc1n/Gb0B0Vl8xK8SyWULt02o4DJAi3kSVTwLdbcm
         CGNI+k5pcVMiyHmWCqNgkHfQjKL81HiML3WQCMLpuYhVVm+Pv/HB61U44xJ+84rNYtio
         k3esZep9ZEqPwzHPEr/IAcbWk4f7BstZzeIkvp4zw9TdKpTKpy0PDS4YcW8Zu4TBpyOa
         IQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785297454; x=1785902254;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xLplXp06MskGJnYJTS+C/PUBSsiZL82WCkaiM9odTA=;
        b=e1H+LQlN8ZrKLgR6KY5Lc/pN4kqTQw1ihyIIqmGbcwe6j9oYx5HAlvSCvO1puzS6Ba
         LsilrIEfaEEPLtoI13QRj9WVH4oaJnrn0weKFINFt+xd7AD2bIdgpsq/qq1on+pTZCwo
         dp8/m8xpwcsi9B7Gsg+qZcDNtsh/aImCCpe85+/Yc8lxSm9qYgyPWGUrplc8bsOY2NLK
         tmkIKVMp4FWCebOBsdB+yC3ZE2Vam/jPMO2s203IIdwJogapFvAIgjmsNck9g18oUyXt
         T6oeANWnq2WRBWQtAI4oYoJdcg076w08fviO+ndRt+7wK8ltqO2D7Gu1CfuHGKjLu1Lz
         lCYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCFN0U0MniinQdQqa6ghcRAv1rQxAeP3r1hqrPaS8UvxtVsHUztqP5yPkDFiVWy9M6bSnHW9M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNQJLPRtmMgfvb0vPsiEB5D/LTH6eaSo76BG/PN9xRM/V/DQgq
	66Wvc5NIvlxDHx2pkyEFZa6M9cJ6bJDRRBAzoL3G37lNFVJTmyvvBZpuR5NMtBv0V9tbRXeHJ1U
	zxwkL1tFNkPxmxhnFEN45gSLw9jIGs5sJwkPwqeQOxzaH1bm5LuKs4fjDgV4QTxDWDnZ8AapF
X-Gm-Gg: AR+sD11C220BZegXv0s5UOaeneEzg1WHBibQgwXFW7vsaD6l5qsSxdWrJLLNJskMwhp
	jEC9jweuBM3NBajV2vHyao1xEFBekck5HUNgDSYdaftfH/0hkX1Icre+rwoJP8PM/udPf+YV7GT
	Zge71jluexB3DcdghyMKhZTWTWIw45CeqF7a8e+eitT0k5RxKB3uyKRaVrbdPmwFteR+RGv3Vu4
	xIMCJA9nYXfR89sdUxsoagmKyEEAVZKjsDY093RlkTl+kwIBYVMNzzjkiBvx1gZzXOd+ysO0D9B
	t4n/qFI5/svvCUWClslJb/e2sPEleMcSozlP+TMb/nYUfA2Ami0U+U/Jev1OGNrXrehb092iH0f
	i8BKMDO9haFZld5tBzR/efbGx7ehRZsAjAZnPL3SI
X-Received: by 2002:a17:90b:3dc3:b0:38e:6bd7:fbbf with SMTP id 98e67ed59e1d1-38f6a46023amr5079603a91.20.1785297454059;
        Tue, 28 Jul 2026 20:57:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc3:b0:38e:6bd7:fbbf with SMTP id 98e67ed59e1d1-38f6a46023amr5079582a91.20.1785297453633;
        Tue, 28 Jul 2026 20:57:33 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm4983518eec.9.2026.07.28.20.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 20:57:33 -0700 (PDT)
Message-ID: <6309c972-0d3e-4b13-a65a-480aa4736095@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 09:27:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vp29M9N68XoWbLLaE2_5adZk6Mjxi82c
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a697a2f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=I08Pv1SOXqSCRlEE_s8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: vp29M9N68XoWbLLaE2_5adZk6Mjxi82c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAyOSBTYWx0ZWRfX8F2NJiDGOI4y
 DRdLqwEEzRvgSVf0N8UM3H4gX6FNoNtAQwvrsygYOQ7qfYJsfJQvATh1MMZUXzaLdfOCO+oLdy1
 2xHDU7FftLxxUEhxhzGY2NbUApmjMko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAyOSBTYWx0ZWRfX5IQ5Lbc7Emfh
 lAHwnnDXTwZ0hw88HGjMkhWUE8qXEMrZhu+/iOhnPp2UGpfPI3qbHO3sc0lmLQ11rZsRryEh8X4
 O/+UeDfqxXsD2FppsRSXJGolkQ+59vzk9pv8QQwDsCNeiglRq9JDtL8oM6EMEMyu1ZJTaMQscDb
 jaBOjEg7Db1QRt09Zjht5euGmRKx0PI7F8CKWWIzo9VyJaCjAKIMS6PAa8yi+CwYjzJNJ0i7lrj
 lcaOrnjRgU3UXTqYmOWqP4zHix2SFwB7hxT2rsSLEgb5r+0imvFiTh2gn4EkGTdRg4FfB1TUU+Y
 mPCOJKMKpliPKqf3BoUYb9bUlqaRpF7bcVbvnH+eQ31x9t1vHkpxicrWpeQe5SbrJdbA6wwABWM
 gNHaE9wGd7xgKKVGagHwGNhbaBa6VmAFBr0c0G8L9rsgh3kz5qfXcQVGH05LHx+fhwfUauuHg02
 Dc1Yact9LPqbYdEyOdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_205736_356744_537C8594 
X-CRM114-Status: GOOD (  10.11  )
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

On 7/29/2026 6:35 AM, Jeff Johnson wrote:
> Both ath11k and ath12k have the same issue.
> 
> ---
> Jeff Johnson (2):
>        wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
>        wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
> 
>   drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
>   drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>   2 files changed, 10 insertions(+), 6 deletions(-)
> ---
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
> change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

