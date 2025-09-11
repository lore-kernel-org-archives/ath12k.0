Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9C8CAC58E
	for <ath12k@archiver.kernel.org>; Thu, 11 Sep 2025 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfb/bEWWfebGlVXlbCvCHlsRh+BoP9p5BYKu3ymw4Q0=; b=aSKvNKqjmSE9pAFFDhfcyYaris
	RpeQqQ21691J+BaObiZb2aZZkNLZky3QHPvfyCyEEufcBuypH/Bw8IWlzOT9a5JRhTKle92J4ns+6
	oHZmPmhpuq7e/exo6Ty/tm/b46XHRsbtAi9GXmsTuBi+w3n+jey44JNpC7PE1gdDGsxKWrO6Zc0uP
	cS8aWcRw4Tp7UO4czaEqua8Yhf4krCg14KptVDQuAiVNTJSIxgzbFh/uColEJsJcRhElcizRiOo8E
	mU14BOj0LNKcNAi2FljPPmP93Ves4KLC+tHkX2Pau8klMoTkvv+S9KA2UKK2FJJGKMgNgMT5LFI86
	Oup19nHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhQJ-00000003FhL-2yUb;
	Thu, 11 Sep 2025 13:33:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhQG-00000003Fg7-1LVt
	for ath12k@lists.infradead.org;
	Thu, 11 Sep 2025 13:33:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBYnUf002541
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 13:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mfb/bEWWfebGlVXlbCvCHlsRh+BoP9p5BYKu3ymw4Q0=; b=WxLDMuV9TGB4FphJ
	/ubRieHF+w6Hbq95rsoLdyjolwWGsthJvTLFd3wr9gvgupXNGpdirrc1FrsvGwRZ
	Qg8Q0/YdRLT6UvYWVV+4zURZD+z2YTfG5I3DC4Fy/1eyo9Ge/SyFlCF50pCnpFu8
	2iCNdsBHLO5earsQORJKx4Sy0h1IjP4aFOLAWFyHwosjVCHI8pVlujQP+q07UkFt
	MAmDLxb+40m6peCkbI95iPtT/wkqFSudzwFIrvtIB3LgT08pSkgz31/TRJr4cA8p
	FFNCvujemaYnrgq3JlzMbe2GzADfch/b2Cbf0uiblSFeCLA1mONP6930kPdVA3wr
	8+WdkQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsfy3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 13:33:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4e796ad413so1041409a12.2
        for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 06:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597590; x=1758202390;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfb/bEWWfebGlVXlbCvCHlsRh+BoP9p5BYKu3ymw4Q0=;
        b=mxXKQjGGxF6z4QbTd/7pPOprR1Shf+sa7BRbaQc2v3uk50fG4QHJFiyB0lN40yIRt0
         4+v/Vaom9Gy4q/QzqaUoud+50LA3Q3ZTGaVDC8gmWjiffPhit0+CbsiUXtgr2T/C0g05
         AkVh3pFxrfH9RE2O/P7acJiF7hCFiHoWDgukG/78wri78c5u4oaB6By6WS0akif/Y0PZ
         1pJ+S0Ga9kSGA14W/UFFL17hLiUnSwfdpCCkwDGp1fCvcfpR9LdXaQ4AeBKUKO39Xq44
         NCpEMMFXKxHH/MOm75LXH0FabOBUody3W8Qql4yHBu3ir6UBfK5skZroDQXW7cZgHSi2
         ciEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPG1o3O1gOCpvRPONs/YfAlsXHdrLddY9KPlo/WsNJd0zS+nUNBb8qUcsCHkuE6T/GdeskjEo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOAfn4MaqyvQcZRlkILBuUAQY3vL5/V1Oei3ZokzP+ccVtBeX2
	EEwjtfhyZOCO65dHcRKDJS6dbnXvOrS3R0IAXPIMohgyzbFyhtlFfPCPKn3jS1L8+nclm9dpNSt
	9aPIQQzEUjvWkl9AwvmLNDPOyELTuhxBabvfQ5xp//B+8T63OQgF0BkesDihAiMn9
X-Gm-Gg: ASbGncsQkXrA+x//pYe44y64iOVU1ptLPrczF251vtwpknTRQO+GZogGKd4DdxhRaM7
	EYdazDYoiXCJ2wdWe0jqx2VWP+8gCUd5SqxpU8jHtAr09nXg6jiKozr52/7LDjDLHoIvSsV40tx
	bEl/6dUTKddJ+b8m9eV8NwdsC/vC9iW/Us/Fss1sVzKGy+NHjv8RxjY3L7L6jkpN+UEPGCO6vKu
	hh1sisUWAbtcbJT3w1QHt9FO/X+KN2KKL0+PenPdUxul/MdaVY/c72OrJ/BrDUaWCyEfS6bR3wv
	eF40MxAN4d1pV3JrrLy8VXPS6hGEnNw9HBNB8VmnAtjWMqprKz4s2m6CeV/boKmPgr/DbUy039r
	JzMl0gt9J+R2tyPJ4bSoZNHgKSmKfOvhYt0AG
X-Received: by 2002:a17:902:dac3:b0:24a:fc8d:894c with SMTP id d9443c01a7336-2516d81824fmr259400585ad.1.1757597589327;
        Thu, 11 Sep 2025 06:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5gFsPlK7S/E682V/zEbf1qAqKozriy2aQWGfZa4hVT2KfGYUkoMJ6DHUywD+nm4BqBZoMIg==
X-Received: by 2002:a17:902:dac3:b0:24a:fc8d:894c with SMTP id d9443c01a7336-2516d81824fmr259400175ad.1.1757597588594;
        Thu, 11 Sep 2025 06:33:08 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b30619dsm19620455ad.141.2025.09.11.06.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 06:33:08 -0700 (PDT)
Message-ID: <5ed9147e-fc4c-4328-9ba1-7b871170481c@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 06:33:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] wifi: cfg80211: Fix "no buffer space available"
 error in nl80211_get_station() for MLO
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20250905124800.1448493-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <a83d883d0f251c08de7dfe7f2b3e7ab890a9b1df.camel@sipsolutions.net>
 <CAD1Z1JJqgVdXHiggeBuQvqwOSHzrzuYZRw3khey9v3oy+xN5pw@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAD1Z1JJqgVdXHiggeBuQvqwOSHzrzuYZRw3khey9v3oy+xN5pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3HzfHJnNZWGzGAjXJ6dgzaFgXwqiQdwn
X-Proofpoint-GUID: 3HzfHJnNZWGzGAjXJ6dgzaFgXwqiQdwn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXyL8evB8gO+KS
 aOI6+FuydMuc5ktj2oRRUMzO1PJz4qWLBpP4ulCAdYwG9zJfz1SICvKcldGYN6cDmRe0Gcd29ap
 OyFLCCI4FpZBlW04nC+dofcQs7GajQowAPCa8OejSofSVmFLV2ZcSDR63rQrfZtGClPUMUfLRrD
 kbkuGQb44cSYjVvEaoMbop4e4gitnpDTqNprM1Fcf/TLwDmlvgyoewHYG07iEDaV2cnrYpWC39F
 Huu4HXc7e3i4KLNprtzwsdAu8qI4F95LDDGdRy5m9TjdpGC0Sr6OcQLZMlNNmyH+0TjJit+S36c
 1rp7EU6M1IDGbq2s3BBds1TM1mN6M+7rYcUOBn6IOf6hBRmU8xmkuENF0CKbUYpg9Jt/COUjAlI
 zYLqJMsl
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2cf96 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=kD4sTvn9sZURAWMP:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=stkexhm8AAAA:8 a=A1avYxSei9jLoB8cXdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_063312_363269_2084421F 
X-CRM114-Status: GOOD (  23.85  )
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

On 9/10/2025 11:37 PM, Nithyanantham Paramasivam wrote:
> Hi Johannes,
> 
> I agree with your thoughts.
> 
> From what I observed, a large sk_buff around 32 KB is allocated and
> passed to nl80211_dump_station(). However, this buffer size isn’t
> sufficient to accommodate all 16 links(max) when full station
> statistics are included.
> 
> I also agree that splitting the dump per link within a station is a
> good approach. I’ll explore this further and come back.
> 
> Thanks again for the feedback.
> 
> Best regards,
> Nithy

Reminder:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

> On Wed, Sep 10, 2025 at 2:04 PM Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>> On Fri, 2025-09-05 at 18:18 +0530, Nithyanantham Paramasivam wrote:
>>> Currently, nl80211_get_station() allocates a fixed buffer size using
>>> NLMSG_DEFAULT_SIZE. In multi-link scenarios - particularly when the
>>> number of links exceeds two - this buffer size is often insufficient
>>> to accommodate complete station statistics, resulting in "no buffer
>>> space available" errors.
>>>
>>> To address this, modify nl80211_get_station() to return only
>>> accumulated station statistics and exclude per link stats.
>>>
>>> Pass a new flag (link_stats) to nl80211_send_station() to control
>>> the inclusion of per link statistics. This allows retaining
>>> detailed output with per link data in dump commands, while
>>> excluding it from other commands where it is not needed.
>>
>> I guess I'll apply the patch for now since it makes things _better_, but
>> I'm really not convinced that it's actually sufficient, and I'm very
>> tempted to throw in another patch to make it always false for 6.17.
>> Convince me not to? I'll reason below:
>>
>> It seems to me that with many links, even for dump you could easily need
>> more space than the size available for a single dump message just like
>> with get, since there's no fundamental difference between the two. So it
>> seems to me that not only should it be opt-in from userspace to retrieve
>> the data during dump, but also there should be the ability to split the
>> dump not only on a per-STA basis but also per-link within the STA, which
>> requires some logic adjustments on both sides (hence the opt-in.)
>>
>> Especially if we start seeing more links and/or more data for each link,
>> this will otherwise become an issue even in dumps.
>>
>> johannes
> 


