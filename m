Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0011EC87FCF
	for <ath12k@archiver.kernel.org>; Thu, 14 Aug 2025 02:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWxpkFt7v/U5vmSVWYXIQxPnE4tzLIwqev7w1qqxC88=; b=nTaqxjiNZxxGVN9BlfNVAjex9R
	erpfBswe58RDFAlXypdcm1MyYCRjr2hn6GGA5lIQHv3TcY9eDGd72hTZiROcNfOceCYGm7ng3klv/
	w2kYIi/WG+BPAv+K/VKAn9QXozzgCSo80fnpp2mxiGbTVLpdfAhmNpCkfKsOHTgINf3MAza26+YXi
	V2EmDZ/cyJUCIf0zHCOTW6T+pXgr/wD4vMOw5z7gp0EOzl1cKK1RFJ4I2h00Xbm1gXpQbjNsBr7CZ
	O4FGl1mQKeW7RdKG70c7eZ5xyVrc/EVWcxnS4/0U1wz1CwWKom3tAlOgFMsOFQestazwWPRG0EejY
	qQAN09rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umO4m-0000000FbtU-2jXJ;
	Thu, 14 Aug 2025 02:52:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umO4k-0000000Fbt8-0hBs
	for ath12k@lists.infradead.org;
	Thu, 14 Aug 2025 02:52:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMhFDu011176
	for <ath12k@lists.infradead.org>; Thu, 14 Aug 2025 02:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWxpkFt7v/U5vmSVWYXIQxPnE4tzLIwqev7w1qqxC88=; b=QDRwKVC5u2jwjZm9
	zkal6p4VsU90t380+2rQY3H1h87gvidoezBHg4U9pZXiVcG/70WlMRc3m0XImEH0
	pCT7f915A/XtViNWOCvSFr5sjx0lWEV5odpZ5L8GL9JQOo/uHsI/BzXUAgzJD7Tq
	7jiBzQA0W0n5lue8waaP0JXJMhbhTNLMd9Inwcjg6IZXDyGpdj3fZBTc+xUYPcxJ
	UhWWXkMJiGOMvhcoAGdbSKtAtHAdXKJNMaEisnLUruaygbrUkLnNSB7At3PO08d1
	Vs3A29SvJmlvV9slMP4MMZBP72364EXV2ko3gDysKKhYazbzrKYg2P9rFgZrECFl
	M4/s8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbh5y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 14 Aug 2025 02:52:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24457efb475so5323455ad.0
        for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 19:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755139940; x=1755744740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWxpkFt7v/U5vmSVWYXIQxPnE4tzLIwqev7w1qqxC88=;
        b=hYxkgIsGZeFhFjwUFd5uWxRJ28Jd1Mq+EyTWmXyxts5NKdoP47H5VnXyDyZr1LYyJj
         phiEwY4DEeCG4zwb8VEVJDZb39JCMbqShV8FTJmdeaoQgPb71hi3IudrELI5fW6NYw3a
         WYhC8d3VcARXc8XHMf6REzL7IDweTE4idTBQaqJg7weZGIn4zV0dSvw63nCzRNuqFmHh
         w1R/XNYYv9aRSfVdpiA7jQPro0awZNBc1+PrSFhK91m4wDNbf2M79NdxM/ah6ndqc0mK
         cK2AWQCaR/WTeFrFjKN9QJXHQYhTgqgYhHuAfhdZzb3m7Cuc8mh62TooueK8XZTbVNvD
         F52A==
X-Forwarded-Encrypted: i=1; AJvYcCWjG/xNplrnq6H36zkw1RDwz38NhiostaC9QF2lbweAN3h7OagDlOAWq5SqQ59Oajv5oUnOVoQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy49BjXMZnKMlwiWLL5nxNr1K/gaP8ZNGr2PchaE4/sj7BB5sJp
	5EKt5d2nS0LL4lieONsbqTSuQ4W0YQsrawUJsVVvFdr4CbgAA763yVEadw6w9uMejGnm9zvYCV+
	o2JsgElKNOL5w8nPTZU5uLxQ5C8NWIHCAWwT3iu63EkDsMRAtkonpevzSOK4r5lFlH/ALVNFy+b
	8=
X-Gm-Gg: ASbGncsD5V6GwReGolkAexATVyARsd6XItoOLJzQCaY60b8+a6cqIuEItzE9R0qPwAQ
	exB8NdNypy+dBoR+axUkA59WfSq4cmVFhDKsM1vh61poBewPa+h5C31snw4ldP7JHUOMy37u5CA
	/78tLIzcDFODSDi+F3Ssqk6ui97ycr3ANsLGjo3SUfm6JnPdLwgL7NqSo0/wiwpJjk/bi0dRO1g
	leTFlHI+AckmSkSU75uCI4aHvlS0oqA2mpRXaswCGbBK2cDFeZ05Kz7sor31ZTYvUxkBzmYR6Sc
	VAL44whBY2zd3USIphD9q7FvNaUBLQ2ag4su1FdSQ+2L8qKffowNnczRJ3To1WVYF6NV6ouRV+Y
	uEL3n+wQsyrmRQYQmzJ0i+04+0itQE2A=
X-Received: by 2002:a17:903:2285:b0:240:cd3e:d860 with SMTP id d9443c01a7336-24458b5546bmr17352415ad.41.1755139940250;
        Wed, 13 Aug 2025 19:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb4lqlQKp/EA/RKM3UVLtWBCDOpYaEY3JR8+j6/K7URJntzQpjfS37mzAe+cDmiOgTHEAAbg==
X-Received: by 2002:a17:903:2285:b0:240:cd3e:d860 with SMTP id d9443c01a7336-24458b5546bmr17352085ad.41.1755139939664;
        Wed, 13 Aug 2025 19:52:19 -0700 (PDT)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b5f2sm337320285ad.125.2025.08.13.19.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 19:52:19 -0700 (PDT)
Message-ID: <6044d211-d3dd-4dc1-a57f-b12bb60e645f@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 10:52:13 +0800
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
 <08fcf779-bac5-4630-add6-5f7d439b65e7@oss.qualcomm.com>
 <8031fa9f-5d1f-4550-ba98-abd680ebd3dc@gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <8031fa9f-5d1f-4550-ba98-abd680ebd3dc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689d4f65 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=fkiQ5OGw7grRa48XxOIA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=z2U-W3hJrleVIN9YIjzO:22 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX2Ef+EF0TiDRW
 MgUAnBy31OxSwRvWKr69rH12P/+9sFZToxd6ejS9ONtBNypv4m68TE1qc6TZDqXE6CTz+h64EgT
 1PkpvwUZYRqIJ2lqxoztczUFnPziJL7/Up4qgPYJ4BnqRO0NKT/8ZwGrfPdZoe3MsBSarwns0IW
 rQUIYIxqqGGlSIJnsXJoZiskMmZ857ZKp2K5PTtwIgW7F08nK1DK8o3V+ZjzujqKvNO1K3R3AnS
 onTWJWHuCpzTIoa1aYtnvDvuICBtVBbSwM0U42TeJ+7XgzTkbKgyhuh3Au5eChGAWZ1Bgbe0qrA
 J2Hc6mf/VAPP2WCg1yRFXruAiL9PNOAVDl9ErlxGFHqgiko3rRPHOBzKjjWpH7sChMxnAzdzs98
 FGy6Zdc5
X-Proofpoint-ORIG-GUID: QPocCcHUnzAzUSGgpppQV9o0fV2EGEhT
X-Proofpoint-GUID: QPocCcHUnzAzUSGgpppQV9o0fV2EGEhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_195222_241157_0BB042AD 
X-CRM114-Status: GOOD (  32.84  )
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



On 8/13/2025 5:43 PM, Petros Christopoulos wrote:
> The module changed to DE automatically a few seconds after I connected to an AP that
> advertised DE (using kernel 6.16.0, the same did not work with kernel 6.15.9 a couple of
> says ago, i.e. the module remained in region 00 despite connecting to the same AP).

Yeah, the 11D support does not land in 6.15.9 kernel.

> 
> Manual change does not work. Before connecting to the AP (and while the module was set to
> 00) I issued sudo iw reg set DE
> but this had no effect.
> 
> Of note, the option CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS is not enabled in the Fedora
> kernel I am using, so this now all makes perfect sense to me after your explanations.
> 

Great!

> Thank you very much!
> 
> 
> On 13.08.2025 10:57, Baochen Qiang wrote:
>>
>> On 8/13/2025 2:50 PM, Petros Christopoulos wrote:
>>> Dear Baochen,
>>>
>>> great, thank you very much for the prompt and clear reply.
>>>
>>> Indeed with the new kernel (6.16.0) when I connect to an AP in DE, the Wifi module
>>> switches to DE
>> By manually setting country code to DE? or driver detects it automatically?
>>
>>> and keeps the DE region even after disconnection and reboot.
>>>
>>> This was not possible with the previous kernel 6.15.9 (I had already tested it with the
>>> same AP as now, but no success).
>>>
>>> Thus, my basic problem is solved, and I also now know how to enable manual switching.
>>>
>>> Thanks a lot for the advice and above all for the excellent developer work behind
>>> implementation!
>> glad to help :)
>>
>>> Best wishes,
>>>
>>> Petros
>>>
>>>
>>> global
>>> country DE: DFS-ETSI
>>> (2400 - 2483 @ 40), (N/A, 20), (N/A)
>>> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>>> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>>> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
>>> (5725 - 5875 @ 80), (N/A, 13), (N/A)
>>> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
>>> (57000 - 66000 @ 2160), (N/A, 40), (N/A)
>>>
>>> phy#0 (self-managed)
>>> country DE: DFS-ETSI
>>> (2402 - 2482 @ 40), (N/A, 20), (N/A)
>>> (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>>> (5250 - 5330 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>>> (5490 - 5590 @ 80), (N/A, 30), (0 ms), DFS, AUTO-BW
>>> (5590 - 5650 @ 40), (N/A, 30), (600000 ms), DFS, AUTO-BW
>>> (5650 - 5710 @ 40), (N/A, 30), (0 ms), DFS, AUTO-BW
>>> (5735 - 5855 @ 80), (N/A, 14), (N/A), AUTO-BW
>>> (5855 - 5875 @ 20), (N/A, 14), (N/A), AUTO-BW
>>> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>>>
>>>
>>>
>>>
>>> On 13.08.2025 05:13, Baochen Qiang wrote:
>>>> On 8/13/2025 6:22 AM, Petros Christopoulos wrote:
>>>>> Dear Baochen,
>>>>>
>>>>> I tried the kernel 6.16.0 today (kernel-6.16.0-200.fc42.x86_64.rpm; it is Fedora kernel
>>>>> test week now) which contains the commit dcfebfd4c8dc0bec9b6649104cecc09f5978c4cb
>>>>> (=revision v6.16-rc1~132^2~157^2~16^2~62)
>>>>>
>>>>> but the behavior regarding the Wifi module WCN785x has not changed:
>>>>>
>>>>> despite  sudo iw reg set DE,
>>>>> phy#0 remains self managed (see below at the end)
>>>>>
>>>>> However, the option CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS is not enabled in the Fedora
>>>>> kernel, and I have asked the maintainers if this could be enabled (everything is of
>>>>> course
>>>>> simpler if I do not have to recompile every kernel myself, https://bugzilla.redhat.com/
>>>>> show_bug.cgi?id=2387486)
>>>>>
>>>>> I noticed this option is relevant inside the ath12k code, e.g.
>>>>>
>>>>> $ grep -r CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS drivers/net/wireless/ath/ath12k/
>>>>> drivers/net/wireless/ath/ath12k/reg.c:  if (!
>>>>> IS_ENABLED(CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS)) {
>>>>>
>>>>> Could you please let me know:
>>>>>
>>>>> 1. whether having this option enebled in the kernel is absolutely necessary for the
>>>>> ability to change the region or there are also alternatives?
>>>> The option is only necessary if you want to manually set the country code. Normally the
>>>> driver/firmware should be able to detect automatically the country from AP's frames using
>>>> 11D feature.
>>>>
>>>> 11D feature takes some time to detect country info, so please wait, say at least 1
>>>> minute,
>>>> before you make conclusion. If still fail, please help collect verbose ath12k log with
>>>>
>>>>      modprobe ath12k debug_mask=0xffffffff
>>>>
>>>>> 2. whether if this option is enabled with kernel 6.16.0 (with the commit above), I
>>>>> should
>>>>> be able to change the region of the WCN785x module with a simple sudo iw reg set DE, or
>>>>> whether still another special method will be necessary?
>>>> Enabling CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS will let you be able to set country code
>>>> using iw. There is no alternative for this purpose.
>>>>
>>>>> Thank you very much and kind regards
>>>>>
>>>>> Petros
>>>>>
>>>>>
>>>>> global
>>>>> country DE: DFS-ETSI
>>>>>           (2400 - 2483 @ 40), (N/A, 20), (N/A)
>>>>>           (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>>>>>           (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>>>>>           (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
>>>>>           (5725 - 5875 @ 80), (N/A, 13), (N/A)
>>>>>           (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
>>>>>           (57000 - 66000 @ 2160), (N/A, 40), (N/A)
>>>>>
>>>>> phy#0 (self-managed)
>>>>> country 00: DFS-UNSET
>>>>>           (2402 - 2472 @ 40), (N/A, 20), (N/A)
>>>>>           (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>>>>>           (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>>           (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>>           (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> On 12.08.2025 05:21, Baochen Qiang wrote:
>>>>>> On 8/10/2025 9:56 PM, Petros Christopoulos wrote:
>>>>>>> Dear all, I have a Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2
>>>>>>> [FastConnect 7800] [17cb:1107] (rev 01) Wifi controller
>>>>>>> with Fedora 42 KDE, latest kernel 6.15.9-201.fc42.x86_64 and recent firmware
>>>>>>> 0x1108811c
>>>>>>> fw_build_timestamp 2025-05-17 00:21 fw_build_id
>>>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SI
>>>>>>> LICONZ-3
>>>>>>>
>>>>>>> The 6 GHz band is disabled, I suspect that the problem is the 00 region setting in
>>>>>>> phy#1,
>>>>>>> however as this is "self-managed" I have not managed to change this (iw reg set or
>>>>>>> an /
>>>>>>> etc/modprobe.d/ath12k.conf file with "options ath12k country=DE" have no effects).
>>>>>> Try with CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS enabled.
>>>>>>
>>>>>>> $ iw reg get
>>>>>>> global
>>>>>>> country DE: DFS-ETSI
>>>>>>> (2400 - 2483 @ 40), (N/A, 20), (N/A)
>>>>>>> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>>>>>>> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>>>>>>> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
>>>>>>> (5725 - 5875 @ 80), (N/A, 13), (N/A)
>>>>>>> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
>>>>>>> (57000 - 66000 @ 2160), (N/A, 40), (N/A)
>>>>>>>
>>>>>>> phy#1 (self-managed)
>>>>>>> country 00: DFS-UNSET
>>>>>>> (2402 - 2472 @ 40), (N/A, 20), (N/A)
>>>>>>> (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>>>>>>> (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>>>> (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>>>> (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>>>>>>>
>>>>>>> I have searched extensively the web, found some relevant articles (e.g. https://
>>>>>>> patchwork.kernel.org/project/linux-wireless/patch/20250401020840.357-5-
>>>>>>> quic_kangyang@quicinc.com/, which should be integrated into 6.15.9 if I understand
>>>>>>> correctly), but still no solution.
>>>>>> Do you mean with the whole 11D support series merged the issue is still seen?
>>>>>>
>>>>>>> I would be grateful for some help.
>>>>>>>
>>>>>>> Thank you very much.
>>>>>>>
>>>>>>>
>>


