Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2B2CA0EE0
	for <ath12k@archiver.kernel.org>; Wed, 13 Aug 2025 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s83pdXKyGS1ULNnIN66HYn82JBGsLABNXDPosACaD0=; b=DNqqU4Dn8C6wLdFC+fil+iSHQi
	njjbOEYdoXrOIJtkb59gH3TKdrQGlPFTvXhO11i/g2KAKPe9regAaqpkQjck2hrgysSNjs5kXYQS3
	USM2ih1VZN90iSKYi4p0N9GijS8qjQxEss3BGChz2/Bg64kLeIxBs7SlcMVx1M6SvjYj9CmeY+YYo
	zQUlvIxjAxEzD1LZJ0+g5XxxlLXO/9rs9ESKNpky29zjhk97gyH5qdAqCUO9jP2ZPLPx9soY+HgZ0
	ZOPFjAqb0+UcN37fsO+K6Vosxl3JonbsIen4RsP3Md9L6UGfzmuIkrYA6A7Erh0+e8vp/VeK4qHQd
	SNtOKjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7Ik-0000000D9t1-0GcJ;
	Wed, 13 Aug 2025 08:57:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7Ii-0000000D9sk-2aUl
	for ath12k@bombadil.infradead.org;
	Wed, 13 Aug 2025 08:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=8s83pdXKyGS1ULNnIN66HYn82JBGsLABNXDPosACaD0=; b=ge6OJgF0msDFdBAJHO1JPPuTVW
	zcUq7ZV7b6gpsoIxezWiZlIx32QNyIpkbu1UnRHj717y52zOHDb/SIoPbRdk1TUJ+iSFwzr39aV/S
	QRtHoZc062RW50U+8T24prfApDHmkFKeQfTjJ5uID7I1uMhxPh7bQ891a/M2USz+DbkW31rytHeD4
	/9yBlBeqoi3UZUVKGtg55/5MyHCs6TeKJ7fP1xdgH9x28gguFGinM1upJIlgJ76C7JwXRHLuktoWV
	ZthZCLVwwVa1/UpF5CZs8u+Zg3BcUYmuI9o6Q0deN1xjAJ5c/BkVKTpIEf2k407GtBk7UKUrgW23S
	l33Pa6ug==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7If-0000000G1eT-0jlw
	for ath12k@lists.infradead.org;
	Wed, 13 Aug 2025 08:57:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mUGV002784
	for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 08:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8s83pdXKyGS1ULNnIN66HYn82JBGsLABNXDPosACaD0=; b=ejFD1DBiImUbhWqi
	BLneZpjaXvbsd9WuPr0zRW7tWRtbdJbf34tNp1anRtXuxLwDlPtHAXiepPYL8rDk
	BX+mGm32UUs1riLHiwSgYTgzMpAKUZsu1kYYvEWoEv8YMwra0up6y20Fy28Of6MI
	Oj3qoFxqr3FdKq3l9BHr7lyIhjNIkaU7NANS/26WQBcxUKINft2uiVtKqAtRqO4k
	kWrkXoq9otOKDxFyMHr+06bNxDxuknuge0wB5uONPwGYugdL1NQvy2v7qVQ+PlW5
	R/YI2bVWwI5LGpcIXGuzaxt3CEXsoDWqw5iLdH+NSfbKTjKEJoorzJms3xT93+o7
	XpOBQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjpyf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 08:57:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2424aaa9840so69667145ad.1
        for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 01:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755075451; x=1755680251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8s83pdXKyGS1ULNnIN66HYn82JBGsLABNXDPosACaD0=;
        b=Ii4u5oG70cEHS3V+2WeB9uuwxQdyjEAQ2dbfiQwKoLTCxRaMTjy9jQFU42POoC+Wgf
         jqDpm0x3I3Adhi1Xq8CO8L9Wdehj2JVDX1dch75Mrjzo0Z0HkWK8k/MYYoKMtijeN536
         tykZuqO1IQVKELT5aY0c22d55AdcRy/Jj4Ag4c271q8YjzIKz03dNKDv9IvmWBNFnLVO
         I0CppggT6/tGzwUUXpVpPBzYs7OvvLTZWLJIlUK0DQAy7USevE97yuKjfpp3r6vsq50Y
         C1mZjyTlLkTQ+yDCPIvv7s8V4ZR5Qbck+XUi/QaLWwgXqNyaPa37UauegT0K7CPAce2d
         LFpg==
X-Forwarded-Encrypted: i=1; AJvYcCVjhRDq5EDixjJPLG4NuJKUFJ8+iQhpYO2080BmCSMn7srAlsAWJV1+d/ibsmNGYLxxnrmZ++s=@lists.infradead.org
X-Gm-Message-State: AOJu0YziWU/EQbFn9Kcmid2aW1HxNn3Dz20R5cn5zPS47bPTUO7q4ecg
	GcFV1gRdymYjvNP/0NRG4ZaH3i4M3JCdGnJm9PC+P8873Q2pq+ITHa0uvusJTR9zjomRwM98j/9
	geRRc38P59knLFo5E5pvn76M46iq8lrjlsA6QRJNvFbUTZXonKX30UzQtmeZ4B3JfWLGTs7+w
X-Gm-Gg: ASbGncthfmJ6E+3pBkp5Ecu2lMyFpiyTi0J6W2yCsDHTTK3hAI3A0WMEDkKpg70rXe5
	i/LIEaON1v2CpNEkbAXForXcIwbkrs4grc+MCFVV2wOrw38sNNziCFNSU2w5vwbsMZuhrMau8Ag
	cqOC3+0Iq6ah7x0EaWv+dcDXx5wndzIrdUo80f4eVqy20aCoIEtbN4oHD4wkrHo/Q3y0hayY72t
	5f6QMzcJkQHi1r4yMJTM39rr2HfgP+g519BqX56xT178U1vJdomlcGIHh9R/ORke4auiYzhrzuL
	UTyjCb3TYeZ25CknR2AGtjkFRaCbF2KLk7VJfkq04p6Tj6++LLX1RaPwKI5eXdOJYupi97aa3sP
	P2mtVI+XK98C5c3IOX+ESs+bygVsr2aM=
X-Received: by 2002:a17:902:ec92:b0:240:a889:5563 with SMTP id d9443c01a7336-2430d1103b5mr40394235ad.24.1755075450938;
        Wed, 13 Aug 2025 01:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEytKsVN0Q3C0SFet/9CpVxrBe5UgzGy40dQouaKttv/65oU9KQOUIqJpTRXS7mJX+xcWhijA==
X-Received: by 2002:a17:902:ec92:b0:240:a889:5563 with SMTP id d9443c01a7336-2430d1103b5mr40393955ad.24.1755075450379;
        Wed, 13 Aug 2025 01:57:30 -0700 (PDT)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976a06sm320072985ad.81.2025.08.13.01.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 01:57:30 -0700 (PDT)
Message-ID: <08fcf779-bac5-4630-add6-5f7d439b65e7@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 16:57:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Enabling 6 GHz band in WCN785x
To: Petros Christopoulos <petros.christopoulos@gmail.com>,
        ath12k@lists.infradead.org
References: <6492c438-7cff-400a-80f2-cf17e298569f@gmail.com>
 <7d934313-6062-4165-b001-853b1a66e2bc@oss.qualcomm.com>
 <b5ba0e58-92e7-456f-96bf-f5921df2ae21@gmail.com>
 <3ae5fcec-bfa4-4d41-8ee6-2c26ce0e4f51@oss.qualcomm.com>
 <b0169ce8-3a9c-482b-a99c-d8bde8be2980@gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <b0169ce8-3a9c-482b-a99c-d8bde8be2980@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfXzSnc8kIpSKNh
 O4GwBVV/PNejfD6k55J6QELS63Ol6bJIxlS4weom4dRHYFIvrpEamMfpG8Il7/S8N1fh79MeCTZ
 ob95SQMS/hjaMzMxXFghAo9tMtUAGIb/DWHN41EcwUQnMT5iDub0XGwFwMPsB+0XIC0JVsAv1pE
 dPmeo/e722Bk8hdDlS8B88mzGinOJAQn8v9p422VlV+4UvhisPfS6deVLW82NG1zfBweUOOMooV
 7N4ns9sdorlB5B7awcVTekfXDf94cot4M4RoH21pL6d3Q20ZAaOc1gA5M1Ssfry6Ea/8uusAulJ
 gIaGLqazL+EsQbvaXIYOF0QoFoyEqj2wrWS7hn7AW0zBs5NtGJCIQMgdoJwSCuHUoJSOxncXfSP
 v5jWPlmD
X-Proofpoint-GUID: zUNfjx5nJ7V0eFLFVat1pJSFA6VwExji
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c537c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=o6LyBT3OLWpG7mj2jbYA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=z2U-W3hJrleVIN9YIjzO:22 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zUNfjx5nJ7V0eFLFVat1pJSFA6VwExji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_095737_532736_A1A2C560 
X-CRM114-Status: GOOD (  31.01  )
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



On 8/13/2025 2:50 PM, Petros Christopoulos wrote:
> Dear Baochen,
> 
> great, thank you very much for the prompt and clear reply.
> 
> Indeed with the new kernel (6.16.0) when I connect to an AP in DE, the Wifi module
> switches to DE

By manually setting country code to DE? or driver detects it automatically?

> and keeps the DE region even after disconnection and reboot.
> 
> This was not possible with the previous kernel 6.15.9 (I had already tested it with the
> same AP as now, but no success).
> 
> Thus, my basic problem is solved, and I also now know how to enable manual switching.
> 
> Thanks a lot for the advice and above all for the excellent developer work behind
> implementation!

glad to help :)

> 
> Best wishes,
> 
> Petros
> 
> 
> global
> country DE: DFS-ETSI
> (2400 - 2483 @ 40), (N/A, 20), (N/A)
> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
> (5725 - 5875 @ 80), (N/A, 13), (N/A)
> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
> (57000 - 66000 @ 2160), (N/A, 40), (N/A)
> 
> phy#0 (self-managed)
> country DE: DFS-ETSI
> (2402 - 2482 @ 40), (N/A, 20), (N/A)
> (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
> (5250 - 5330 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
> (5490 - 5590 @ 80), (N/A, 30), (0 ms), DFS, AUTO-BW
> (5590 - 5650 @ 40), (N/A, 30), (600000 ms), DFS, AUTO-BW
> (5650 - 5710 @ 40), (N/A, 30), (0 ms), DFS, AUTO-BW
> (5735 - 5855 @ 80), (N/A, 14), (N/A), AUTO-BW
> (5855 - 5875 @ 20), (N/A, 14), (N/A), AUTO-BW
> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
> 
> 
> 
> 
> On 13.08.2025 05:13, Baochen Qiang wrote:
>>
>> On 8/13/2025 6:22 AM, Petros Christopoulos wrote:
>>> Dear Baochen,
>>>
>>> I tried the kernel 6.16.0 today (kernel-6.16.0-200.fc42.x86_64.rpm; it is Fedora kernel
>>> test week now) which contains the commit dcfebfd4c8dc0bec9b6649104cecc09f5978c4cb
>>> (=revision v6.16-rc1~132^2~157^2~16^2~62)
>>>
>>> but the behavior regarding the Wifi module WCN785x has not changed:
>>>
>>> despite  sudo iw reg set DE,
>>> phy#0 remains self managed (see below at the end)
>>>
>>> However, the option CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS is not enabled in the Fedora
>>> kernel, and I have asked the maintainers if this could be enabled (everything is of course
>>> simpler if I do not have to recompile every kernel myself, https://bugzilla.redhat.com/
>>> show_bug.cgi?id=2387486)
>>>
>>> I noticed this option is relevant inside the ath12k code, e.g.
>>>
>>> $ grep -r CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS drivers/net/wireless/ath/ath12k/
>>> drivers/net/wireless/ath/ath12k/reg.c:  if (!
>>> IS_ENABLED(CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS)) {
>>>
>>> Could you please let me know:
>>>
>>> 1. whether having this option enebled in the kernel is absolutely necessary for the
>>> ability to change the region or there are also alternatives?
>> The option is only necessary if you want to manually set the country code. Normally the
>> driver/firmware should be able to detect automatically the country from AP's frames using
>> 11D feature.
>>
>> 11D feature takes some time to detect country info, so please wait, say at least 1 minute,
>> before you make conclusion. If still fail, please help collect verbose ath12k log with
>>
>>     modprobe ath12k debug_mask=0xffffffff
>>
>>> 2. whether if this option is enabled with kernel 6.16.0 (with the commit above), I should
>>> be able to change the region of the WCN785x module with a simple sudo iw reg set DE, or
>>> whether still another special method will be necessary?
>> Enabling CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS will let you be able to set country code
>> using iw. There is no alternative for this purpose.
>>
>>> Thank you very much and kind regards
>>>
>>> Petros
>>>
>>>
>>> global
>>> country DE: DFS-ETSI
>>>          (2400 - 2483 @ 40), (N/A, 20), (N/A)
>>>          (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>>>          (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>>>          (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
>>>          (5725 - 5875 @ 80), (N/A, 13), (N/A)
>>>          (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
>>>          (57000 - 66000 @ 2160), (N/A, 40), (N/A)
>>>
>>> phy#0 (self-managed)
>>> country 00: DFS-UNSET
>>>          (2402 - 2472 @ 40), (N/A, 20), (N/A)
>>>          (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>>>          (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>          (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>          (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> On 12.08.2025 05:21, Baochen Qiang wrote:
>>>> On 8/10/2025 9:56 PM, Petros Christopoulos wrote:
>>>>> Dear all, I have a Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2
>>>>> [FastConnect 7800] [17cb:1107] (rev 01) Wifi controller
>>>>> with Fedora 42 KDE, latest kernel 6.15.9-201.fc42.x86_64 and recent firmware 0x1108811c
>>>>> fw_build_timestamp 2025-05-17 00:21 fw_build_id
>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SI
>>>>> LICONZ-3
>>>>>
>>>>> The 6 GHz band is disabled, I suspect that the problem is the 00 region setting in
>>>>> phy#1,
>>>>> however as this is "self-managed" I have not managed to change this (iw reg set or an /
>>>>> etc/modprobe.d/ath12k.conf file with "options ath12k country=DE" have no effects).
>>>> Try with CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS enabled.
>>>>
>>>>> $ iw reg get
>>>>> global
>>>>> country DE: DFS-ETSI
>>>>> (2400 - 2483 @ 40), (N/A, 20), (N/A)
>>>>> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>>>>> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>>>>> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
>>>>> (5725 - 5875 @ 80), (N/A, 13), (N/A)
>>>>> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
>>>>> (57000 - 66000 @ 2160), (N/A, 40), (N/A)
>>>>>
>>>>> phy#1 (self-managed)
>>>>> country 00: DFS-UNSET
>>>>> (2402 - 2472 @ 40), (N/A, 20), (N/A)
>>>>> (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>>>>> (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>> (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>> (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>>
>>>>> I have searched extensively the web, found some relevant articles (e.g. https://
>>>>> patchwork.kernel.org/project/linux-wireless/patch/20250401020840.357-5-
>>>>> quic_kangyang@quicinc.com/, which should be integrated into 6.15.9 if I understand
>>>>> correctly), but still no solution.
>>>> Do you mean with the whole 11D support series merged the issue is still seen?
>>>>
>>>>> I would be grateful for some help.
>>>>>
>>>>> Thank you very much.
>>>>>
>>>>>
>>>>



