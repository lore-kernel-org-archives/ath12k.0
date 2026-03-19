Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13A9108E1E9
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHDw3sqYCoQIpa9CGSywX3G6kMIJy12pGWh/ccVzB98=; b=iJ/nCX/NP4oLlb98du6IB+Eu6p
	adco/zbYCKJ8HwEzlE0MGM4JRdhJrdZW9ucdm+/sswRSy0cNBC+vB5vA1wziC/5o5ryOp7um5iGDe
	kjGfGfknfQBHqFPhCKNn6NB2sea7L0u4Cs8zpnteF8B/YApxkf9fzq/SYkScg9HcxWGbFc7J8E3DB
	LkibOQ9PSPJEBvlEaZ8scMI9LmDq5AUeP2PMhuSrPX6u0o7X7lJ6a42SYI+gBXm5566NPl7Bh/nlH
	9iCTH88OWj87APk0MAXdshct+sCt9TW2MxHgcw3Qcd1lRz0bUTpdJrPujGlXHepf3jrXzp7Ux8Cms
	/p4PL6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BEx-0000000AUdW-2bLT;
	Thu, 19 Mar 2026 11:08:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BEu-0000000AUdB-3LzT
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 11:08:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73x5p1998773
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 11:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHDw3sqYCoQIpa9CGSywX3G6kMIJy12pGWh/ccVzB98=; b=NTBdNZ9KJA6+a+Ii
	nu6mLTp9zkiPZBD+QBNpLAwf+TIALo2wcysYARZirIAENFVhZkAURy8+a3MiQxBm
	KLfbgV3p6aZW6+IS3sQ4Ynp8snd080/31wBA7I5RaVJ8OF2Th4qVsX2CC9+jC+xg
	GLcwIXkbSUiaZ9Ux2/pb+RXVdx+2rT7KztF2ut/3C5yEY/SbDPjeFdzNKwDUVhq4
	bHmr7ktZDqaRu+TuInH1xjci+DZOGvqMFrFI+8o70GAJFtETF5hbpPPHeWnTPYpP
	t/eYTWECL2hr/jmBnEtOg8Y8IlceoZs1QZey7aHqijmWGDon19QZUtrsf9r+4dcP
	YaBZQg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb4r28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 11:08:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73a4983fc0so453733a12.3
        for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773918510; x=1774523310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHDw3sqYCoQIpa9CGSywX3G6kMIJy12pGWh/ccVzB98=;
        b=JhxiKnmjtMB2TEG/IBqtD692uIkLqd8jLT3NyYCcYR1FsBND7pYSqUPvYDtNlZR41C
         jE504ZrnXmYL8intMJU1qRAi7/KcVYxLqEZKTBL3HEqFQ0FgjroreQjH08TGm2TK/nBu
         hRMr7JqL3YhOSPtvVsryI/XnpQcYLCqovwZwZGZRYiXTWWAJaBzIgKJbObqCjLI+Ntuz
         3m+5M2B6jgOrrydiFj0ubKtPbkPbWChbO4EflKVTFxdNeACS+NAjCx7WS3et9qiJm4CU
         T5gWmoDajceevwIjIQCqzuM395Y++ldqcBbmOw7yEn7oHx9VI384qfy/YxVj5EyVLsEO
         Pcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918510; x=1774523310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHDw3sqYCoQIpa9CGSywX3G6kMIJy12pGWh/ccVzB98=;
        b=FjZ9ULNxKoFd9gkCzSfHBZcjI4RgpBMAqYTkhEymAdbGHecc6ZrKZ3VZViHRdU47BI
         oHgDcx2ZLBzFOC3t1aPaN/kXI00Djy4KQ9qVuxQXsLHiC9km4mK8Ot0eiKmRBQjpu+16
         XVZlyXK1J1XKcsq9rk+yQVZ243LvveGPnVWsIeQvFtiwXgD+n/T4cgEiEGHfOAn4847D
         tMNaBDNq5ZO+RSQgXCr5vkCPSNzkUQtgmto9PZXd3XDMS7NaXiVc0def5EfKpuVRATLV
         i9Xd5DkLocr0qjqjGqLkp0Ss4iumECTPPpsqhuYlhscYWwERNqRYC3hNwcZKnmOvsE3H
         qkIw==
X-Forwarded-Encrypted: i=1; AJvYcCVVreVnAcGhwALGc6DDYos3t+yY4zBib5LIm284v1f9JKtBnPwELsPNYDtr5mOv9jUe1w5Gafo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy47fIafq3eHmN4EWCxqJoncM+IYEFIS9JQVE0TYY3pxN1FLRQR
	Ck3UmWJEmySMRHGDaLZC107THkB3ObPUFr97+lQwnNgYBsgCix7HNn4fKJ6eRzdWd0iH6VgCmQ+
	oi9t51HXN3+KguCVI2EuSBgJOPB/az2cMyPaDmxoAc8/D8ArcI+DtCWzUAWeFpntYt9j/y27u
X-Gm-Gg: ATEYQzzFISZumdmdfxUAw/eBLR2LH/a+6moWTtFccy3J4vmOB3G6h9YKUN/X3V3fQYS
	/lTVS+cuctN0ic4YtKkm3xj4Ld3xHLWJnQy/MCV2ZMYxoncjS2De2AB9FExEPerf/EKKzLYyC0k
	tz95VmYFRgQmQkB/fKHepoCAgxrSZvqDEqma4o2jLOID5//kxIjdDOMr1tT09/mBtpniiEO3Bw/
	7w119deQ60QvvHH6mxPwVa4MdkmpXrD0bmHMF09DXHjg6awvsvQNVPh/ETIEcH9LNKq0Ot8SkYp
	tWe+26SkvvLD5ye75yg52i60/DEMMaZP/EhYX9IxIiQUCJ4rrlg6kUCOt8hq+5dVerWbia0zNTZ
	gi5wx5ENUGvBtqPdoAlTCZUujoS1cTs10Nf3O8+UHvC7UBMGoPY3xblUwkSerpA==
X-Received: by 2002:a05:6a00:4648:b0:823:1276:9a86 with SMTP id d2e1a72fcca58-82a6aee1e65mr6183420b3a.39.1773918510133;
        Thu, 19 Mar 2026 04:08:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:4648:b0:823:1276:9a86 with SMTP id d2e1a72fcca58-82a6aee1e65mr6183396b3a.39.1773918509548;
        Thu, 19 Mar 2026 04:08:29 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b5308fcsm6838567b3a.9.2026.03.19.04.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 04:08:29 -0700 (PDT)
Message-ID: <36c1cae8-d6c0-4432-bc8e-57216c5ea3fd@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 16:38:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260317084740.3756880-1-nico.escande@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260317084740.3756880-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZcTUCqmVv66HZM6dTWi8l5kaZ3Z5Ld54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4OCBTYWx0ZWRfX74NuBVmB2Go8
 uRHs2azmTSlgGaQgoP2BPt0VGNYCp+c03j7P2JjhBEEg1RWqKdj3byuZP/ilPpYYKLb/qBSL2CY
 4dOD5rNZ+ppVdSDTCB0++e1AWz3bsfOEbXqw4TwsBBlJ8icqlRyWh5SbbpkSW6n6frOP8FphxSM
 8HejvPtlG+f5KN+mcqX8sOzrGvO4lUcnDjP6+Hl5zgxda88IDkrQFI0J+a4z4MNsgg4t12PA5Ja
 Eg4jKNC2GoI7XE7g6oIHPv9OY17q1mVFsztZmEfUNuvr9Ld5aOUH6GVFxrF0AOn2WG8k39jcq/J
 eFkOLSFcC3S/0evepx9W5U74UAzA0PJInsVPQVmKSj0Z/9vcNkqfQDn8M59QE7hSP52/dLgzzez
 1YJBnq9Ug8bqjrVNVg5NLia47di377JbZrPsC4xI22e6pUjDEbXYxgZmZf0Zze0AODWjkRgfzR6
 ZW+YDLieWBH96xntGfQ==
X-Proofpoint-GUID: ZcTUCqmVv66HZM6dTWi8l5kaZ3Z5Ld54
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bbd92f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=YMnrxt29I6OX4gW8josA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_040832_995970_699B72AD 
X-CRM114-Status: GOOD (  28.23  )
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



On 3/17/2026 2:17 PM, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time.
> 
> So instead lets move to a per cpu allocated array, that is reused across
> calls: ath12K_wmi_tb that lives in wmi.c of the ath12K module. To alloc &
> free we added two new module_init/exit functions for the module and two
> new wmi functions to alloc/free this memory.
> 
> ath12k_wmi_tlv_parse_alloc() and ath12k_wmi_tlv_parse() are merged
> together as it no longer allocs mem but returns the existing per-cpu one.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> changes from v3:
>    - simplified ath12k_core_init() with a single statement
>    - move perpcu.h include directly to wmi.c
> 
> changes from v2:
>    - removed now superfluous return in ath12k_wmi_event_teardown_complete()
>    - moved ath12k_wmi_tb declaration to wmi.c & added two functions to
>      alloc / free it
>    - removed useless error message on memory allocation failure
> 
> changes from v1:
>    - rebased on ath-next 27401c9b1432
>    - changed wording according to Jeff's comment
>    - moved alloc/cleanup to new module_init/exit functions in the
>      ath12k module as per Baochen's comment
> 
> changes from RFC:
>    - rebased on ath-next 8e0ab5b9adb7
>    - converted missing call sites ath12k_wmi_obss_color_collision_event()
>      & ath12k_wmi_pdev_temperature_event()
>    - changed alloc order & cleanup path in ath12k_core_alloc() as it seems
>      it confused people
>    - used sizeof(*tb) in ath12k_wmi_tlv_parse()
> ---
>   drivers/net/wireless/ath/ath12k/core.c |  13 ++
>   drivers/net/wireless/ath/ath12k/wmi.c  | 201 ++++++++-----------------
>   drivers/net/wireless/ath/ath12k/wmi.h  |   3 +
>   3 files changed, 78 insertions(+), 139 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c31c47fb5a73..6c034071cc6d 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2321,5 +2321,18 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>   	return NULL;
>   }
>   
> +static int ath12k_init(void)
> +{
> +	return ath12k_wmi_alloc();


Since CONFIG_ATH12K is tristate, a built-in boot can continue past a 
failed ath12k_init() and still run ath12k_wifi7_init().

Please ensure that later initialization path is guarded against 
allocation failure.

Or may be have this allocated on first device probe and free it on last 
device deinit ?


> +}
> +
> +static void ath12k_exit(void)
> +{
> +	ath12k_wmi_free();
> +}
> +
> +module_init(ath12k_init);
> +module_exit(ath12k_exit);
> +
>   MODULE_DESCRIPTION("Driver support for Qualcomm Technologies WLAN devices");
>   MODULE_LICENSE("Dual BSD/GPL");
--
Ramesh


