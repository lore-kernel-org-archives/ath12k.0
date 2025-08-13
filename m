Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B174AC87FCF
	for <ath12k@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSoIvL+pc4m7OPZJ6P7l7I02a8wRIgJL6XNsdZhf+4c=; b=I8TtDh5EmgiKk5jH4P7hsjsm3I
	8svPB+52MEBqXPeUsOCebJbKTsQ9XSmNDblS+wvX9pVGEwZlrz6TkWYQZhB8+PJyEDQa1ZHJexBBl
	PI4rqpHhUB7+TPIdSpkl1wNvJ2joBPqzhvhNsJMa/5mooE5uje/yWrtwt0MS7ob5rP2yPyGRWAmet
	EPY+OzGqIcKbRQ/VuhSnK02UPtH8yV2mcT6r/dvFcLuEut/O1Dw+Ve5+G40DVmgjFQ1M+/MTCRZHK
	pWXWQh94DAbSazX/36gv6HucKEP3aai0CBZD3t+vAIyo1NKpyuNPO670bW3lcRh6Bt/0huhhrmHEM
	CtBhEe5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPd-0000000Er0t-0Apu;
	Wed, 13 Aug 2025 19:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrt-0000000Efdb-3y24
	for ath12k@bombadil.infradead.org;
	Wed, 13 Aug 2025 18:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oSoIvL+pc4m7OPZJ6P7l7I02a8wRIgJL6XNsdZhf+4c=; b=Kal8qpj+JwMT2OScn4sv2qaGAI
	yxxEVsngcij7m3M9/TEZwaYEWRa5GEHCnIdGm7T+eJyiBGWS3qR1CxyPBiJiW7/IDqRhe/1jQX8JX
	i5U8j7pWphvHzvM34C8W/nyYLjYuOMQEFzyoUxa5KJr1iQZjo5LbBVHyYNt6Q9LXNh/DCB3mQ8+d4
	XKUdgXBzyfPNDGtdXXQX6Leibklo0SKv3z6iU7tioHTbozEAfZ2RMl/hqSLafx9XUwABkkrwNANl5
	ViwzCFr8UAbhXlNTLtvvKmd9JnZkTDXE5TizKdh8CKqsgKlDhaA6Fr8HS4Np7/D+t9AqPK3nqNVRj
	TgG1NLvg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrq-0000000G8i1-0lYd
	for ath12k@lists.infradead.org;
	Wed, 13 Aug 2025 18:06:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLfqI020597
	for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 18:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSoIvL+pc4m7OPZJ6P7l7I02a8wRIgJL6XNsdZhf+4c=; b=E3JqcPUU+y3LqTIq
	mT/45oybFZ0m6nvNrUNq94pq9SWvX017G/AY8YaIC4AZGCH4oj80WHbMeflkax0T
	yE66TqneCvhgSLIQB8wfSnhdLF8KaUqRPoHhlFSsL3vufLSOTuwvyKvKuUDlDPj4
	RkKd4QRobs8gtqtAeDf9pvqRzmGJbcF5nmGiBBfFyGxKFflv+TOCcFLQXO+6P/xi
	xvjd6BH8KrDqMgFaJ9tZe3OTHt65q4ZetKTqoGkEZ/e6bqpzj1NYt5eWmhUoKw4g
	2XO+g8V3DVYfvdky0RiY3VjlYt77c7dRyap88Dk/eevY2jQNM3dMos4+1EQFVeHz
	QIW5Tg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmcqvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 18:06:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-323267b6c8eso329001a91.1
        for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 11:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755108384; x=1755713184;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSoIvL+pc4m7OPZJ6P7l7I02a8wRIgJL6XNsdZhf+4c=;
        b=s8QVuJg5uX1OYYmtW/2CfZIxsVW057mLJJhXng22dFnaBEpL6h++YXUCS3oeSkMKLw
         qnsKd5nHLGWUJBu4HOIdUgesDczYu+TmS7SkRPU5DbaTRYw9eMlv+46d3cbOGjTQu3VX
         cmzzRIg8qN1wmphHzvQ3+VmOJgZpOQqGFXnRx9/ebtUyCb8eToOq+d7qYxziHUvx1S7s
         mn+lSrq3TZOpmabx3QH2RoEvf2FTmRqI3I5o44OJg9N/k5czfWVRPJtb4Zcx1zvXyQ+3
         I6TO6/msVmeuleXZQ6g+GaLeumErcqUGBW3AvfqSxYLCeu5KcxGBB+Yfy778QqhIZmk8
         KlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV98mMUxQ8l+B9EaOUUDfhaS9Q76xkILlxeK89HmJ43wEegXCXgZ4t+r+5U1O69kD+oVBDe9Ro=@lists.infradead.org
X-Gm-Message-State: AOJu0YyC83BmIJgEEYVu0ShPoR6pQPrbZjxcnFG5rvvbcD6f2MxsvWgg
	B0VLqcJylzZ/3kn7oNYfRq+CqSlr+m3ob1NvP1QgeI5SsP6djQbiHJta6sJitZ5y0nlRpYN6zso
	PjtviEio/65/ivhC/YC3UpPK2Dyw9rgXCr5pZJ8ZAXrZHmOo195lvJBd5d9rCcX34
X-Gm-Gg: ASbGncu+1U/adMRLryqZ9xlHYHjN4eE2sWIMdsBuWesxb3ZcVdkq4LjWRI1kJZf81sB
	ILk3imX1ZJQ3lw5g1juyTZV6ITB6rZu71ibqR1+qYL/sOEGl1joYawYwi4zHxF1aExvflj0e2+f
	ndK2qPmbxf378Wzx6erDzM/zA8X5TmaUtBgyL+LkKKcpuEm6ktm0OdRVK9walzSClm0VFXivJA3
	W/Vp2075ZQ/aa4zYXcbeEMpIC9TW/40YlM1+QQ3Oon0CCpbiHu3nKjzJbVmMjiiRudhOIGlN9nM
	5SB+q0+pXQ+7WQLi5aZ5qTprpsCg7+aRLoPsL/Z1SrOfjKbzH8Ci2TKIHU8qM2KV5yytkuV4vF3
	niYnM6zhHA1blrGNRHbk=
X-Received: by 2002:a17:90b:5705:b0:321:c0e3:a8ce with SMTP id 98e67ed59e1d1-32327c87849mr277035a91.22.1755108383652;
        Wed, 13 Aug 2025 11:06:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7tSSwdEVF0PFpxkGJiiCoWVGyWp67B4Q5ibZHoXDQlloJTr5+h7IW0h6eguGtmhYEarj0kA==
X-Received: by 2002:a17:90b:5705:b0:321:c0e3:a8ce with SMTP id 98e67ed59e1d1-32327c87849mr276989a91.22.1755108383065;
        Wed, 13 Aug 2025 11:06:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232555f41csm734132a91.10.2025.08.13.11.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 11:06:22 -0700 (PDT)
Message-ID: <bce51392-d5f1-40a2-ae22-58df01b993e7@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 11:06:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 03/13] wifi: ath12k: Move Wi-Fi 7 WMI
 configuration to dedicated file
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kiran Venkatappa <quic_kiranv@quicinc.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
 <20250812-ath12k-mod-v1-3-8c9b0eb9335d@quicinc.com>
 <00a72188-8ac7-4527-8128-352d0882754f@kernel.org>
 <b62af6d9-eea1-41d0-997d-b9585f2a9533@oss.qualcomm.com>
 <f6b046b0-d230-41e6-ab18-686cc7b65f16@kernel.org>
 <2025081320-coastal-graded-40a2@gregkh>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2025081320-coastal-graded-40a2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX0BS4xrPC7Bik
 2hAtVQjpG9xQCzbMu0FZFGVQn+i/TUlB5GiiRRzjJgxkkBbt1Y1iHK/FVfGMTEqAh9bFKT5LQZi
 RObqE4bmcoSYpPHCkHFuIMwD4mw5WTFPPIEzmFM71am3P9w31oTW6fE4Qpi1foC18GqCm9mPBid
 bPkMsob1B3JJpcNnI6xA3yESL6piWa3iF1WHLov0ImAJN0Yf/h60DCWiJvn4fnDAK0bPxxPq2dP
 S8ZGzJIp4i1pZ2pFUDMssmXBrweXJ41W9XyOnQWvNCNw7mPhw+zE1J/82mjohwwlgYdnT74DwC6
 Y0VyL86zEZ28Rk3poBUEctI7yn4niZKbTQAlz/SBVGmXxeeB6Xh9hSwzgG7tNq3BVXV7j9z3KGC
 /XxdffvQ
X-Proofpoint-GUID: GOzhMhyjAOvbHNRlqdMNObmsC1n7eCdW
X-Proofpoint-ORIG-GUID: GOzhMhyjAOvbHNRlqdMNObmsC1n7eCdW
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689cd421 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=mDV3o1hIAAAA:8 a=wz68kt-ga7Guwb8P1o0A:9
 a=QEXdDO2ut3YA:10 a=JEtk54xxEQEA:10 a=UDyAGHZwfzgA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_190630_585035_71199054 
X-CRM114-Status: GOOD (  27.66  )
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

On 8/13/2025 9:24 AM, Greg Kroah-Hartman wrote:
> On Wed, Aug 13, 2025 at 06:00:44PM +0200, Krzysztof Kozlowski wrote:
>> On 13/08/2025 17:43, Jeff Johnson wrote:
>>> On 8/12/2025 10:52 PM, Krzysztof Kozlowski wrote:
>>>> On 12/08/2025 19:09, Kiran Venkatappa wrote:
>>>>> +}
>>>>> diff --git a/drivers/net/wireless/ath/ath12k/wmi_wifi7.h b/drivers/net/wireless/ath/ath12k/wmi_wifi7.h
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..1514e3e8d4cb65d3d95d95a1c1593a7b66abcf58
>>>>> --- /dev/null
>>>>> +++ b/drivers/net/wireless/ath/ath12k/wmi_wifi7.h
>>>>> @@ -0,0 +1,15 @@
>>>>> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>>>>> +/*
>>>>> + * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>
>>>> Don't rewrite the copyrights. Original file had different one. GPL FAQ
>>>> also EXPLICITLY asks for date in copyrights and does not allow one
>>>> without the date.
>>>>
>>>> (and before you bring internal qcom regulations, let me remind that they
>>>> do not matter. we discussed this in other thread)
>>>
>>> Wi-Fi team wasn't party to the other thread, and this series was following the
>>> legal guidance we were given. I'm circling with the core kernel team and the
>>> legal team to make sure your concerns are resolved.
>>
>> +Cc Greg,
> 
> Oops, I just responded to this issue elsewhere.
> 
>> Please follow legal guidance expressed in:
>> https://www.gnu.org/licenses/gpl-howto.en.html#copyright-notice
>>
>> and the license you agreed by signing of the patch:
>> LICENSES/preferred/GPL-2.0:
>>
>> "Copyright (C) <year>  <name of author> "
>> ...
>> "... publish on each copy an appropriate
>> copyright notice and disclaimer of warranty;"
> 
> Nope, we do NOT force the FSF's legal intrepretation of copyright marks
> on any company at all.  It's up to the copyright holders themselves for
> how they wish to mark the copyright, if at all.
> 
> And really, Qualcomm is a company that is run by lawyers, they know what
> they want to do for whatever reason that might be...
> 
>> Just to remind - you as author sign off your patch, not your legal team.
> 
> Agreed, but in some cases, I have forced legal teams to sign off on
> patches, so don't rule that out :)

Thanks for the clarification, Greg.

Just for reference, the guidance we received follows. In that guidance:
- LF means Linux Foundation, the entity to which Qualcomm assigned copyright
when open source development was being done as Code Aurora Forum (though
December 2021)
- QuIC means Qualcomm Innovation Center, the open source entity used from
December 2021 until March 2025.
- QTI means Qualcomm Technologies, Inc., the entity now being used for open
source contributions.

Guidance:
1. Should existing QuIC copyright be left alone or absorbed into the added QTI
copyright text?
Yes, all QuIC copyright years should be absorbed. Replace the QuIC copyrights
with the QTI copyright. Leave LF and other 3rd party copyrights alone.

2. When we are creating new file in open source, if it is copied/derived from
existing QUIC authored open source file, should we retain the QUIC markings?
No, the QuIC copyright years should be absorbed into the year-less QTI copyright.

3. Is there any use case where we MUST keep the QuIC copyright?
No, all projects can move to using QTI copyright.

/jeff

