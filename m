Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DDAC87FCF
	for <ath12k@archiver.kernel.org>; Wed, 13 Aug 2025 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+vJiRxHnn3/K6boPwrrePMMQpvSubNZD/8bC45MJ5w=; b=sVXvbGA6LDa/ujQOvxPaG2hNVS
	b1/CLVLmiw2Rf2IBbpAkaZNICTikpwMKiBtZN2uMg3ZyyDkNoKEHwF6ze3gz37ff+oiRS91ZsS9fj
	COTiY0c+SuJCiYT4HBmdO2vnXH8yzOlEmfYcD7jimRMSwh1ZM/3cuz9e2HCGgimWkVKVC/7tLeiqv
	SnADhi4XcXTkqr/C+71G8tHka8PKcrfuIlBtr4rR6nUkhXluibZP+QJNnQ8A3Kf6uAS6Jt52VxuOe
	qRNpHSJhN2hZGMh/QdH0CQqklx3PCElzO9Daw9XTxrsfJJqryhME2llTgZ66vTfMXo7m5ol51llBz
	2A7eY88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEOE-0000000EP0M-148X;
	Wed, 13 Aug 2025 16:31:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDdA-0000000EEOy-3VtR
	for ath12k@lists.infradead.org;
	Wed, 13 Aug 2025 15:43:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLjM2020827
	for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 15:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+vJiRxHnn3/K6boPwrrePMMQpvSubNZD/8bC45MJ5w=; b=Zh+d/Ko+ZbGVNY2z
	KZT/r8rY1DZUnWvaj/ikrs1R7+LdK0Gc2ew99PcLwNQ3qHsSWbtfZiB1WIYr0gUy
	nslaL+yoOodD3nQJI3Hxv/TGjqZGAWkD+YOSzMUQMIcQksxdVDp9s6T8dcgjzwzo
	HpyFczFcX5OaPzY/42gn2sFx6QdPSKUKe9uwjKvg5e/fPmaz/VPg+XN8EyMpPTkf
	0VKOx0806rjKaFdsSD+8uXWrqflq4rEIbTN2IiuZdtaZxyk5tLzFadq1j10gbxVB
	fBsLdNfqFwv0i4/WtPMCQ5lGLh3m1ROxWMchwc10KhK7uLyHTjGx1oGhSppaajzv
	FmFibQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9svj4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 15:43:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e5c4734so55405b3a.0
        for <ath12k@lists.infradead.org>; Wed, 13 Aug 2025 08:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755099791; x=1755704591;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+vJiRxHnn3/K6boPwrrePMMQpvSubNZD/8bC45MJ5w=;
        b=tXWUi7FQfZq6p5zhwfh8OtDtlwDDRHZyh2fYSsmFCk/PKDjJCaIXk10aST9vOlCvby
         wvj0qnz6QvzPcfJj4f0Eh8q8DhT06cEZHimudpF4UgjJXdllH2i5dc1n41opHZ0ddltB
         a7VVjQjuZGYfuGrYDa2B0sZxHwM5rZvsGWA8hkyol9QGxVNWCjBP693cREw9Zb6TALgd
         M9FxIfNjO9mgK45QhumiumJWdZ3DzBcf/H6xxb7w2VbDJP6397iALmFhh/eR/r2Z0fjb
         6TIRecWV6QNbg4D+Z+Aa+mG+VDldZ2mqHobRn7Yi1UPZfaAzVaRAFhIzbFwu1awbGm69
         o9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Ldr1RXdoLUondGRgKt1/h3UUqzwQvJV96wbdKSkM4ylKWXvAXSjMK5MXqVg2kVf+jEDwI84=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ09gv+7pPcLBETHBapRMlA56/YaL3Lp4FSVpsfG+hiMQnPUvL
	7E4BOPQcafDoqflQYwxquAMc8YKOnVQNOWYlyhofcOFAgP7eo/NQu+DZtB/HXFyM2wMozkwEPFJ
	JvQjn2deCPGLiSQjNaQ/nP3YffVAl0Kb5l0W/cL+abamfodqUS/34T14y3CUBj7u9mJ3sQqqK
X-Gm-Gg: ASbGncs6MQkajCSpbM03+JPcj4r8axfyfLNknYMaKoVV5yfG57hspPSB21Eg26AEv3W
	lH4r2kppcEwz8wKroin+R0OtsLPSi4zjidqSSbKH6ezRRBx8Xc+zQyB+/aL4vARDQIHA9CTD7KX
	nEPgW7/9FLrGXMO+XXJkbRarLMECJkpvqpgU6uvzYlmUWbeQSYthlNZ4jb0KzZVa88FCyryIfZl
	7GSTis2Rwlk5nKAGOH5/pNyxBy3L8sKg/SGj8uAZZTdgkS9Du7AL0mb5qo7CArDJXfd6/7LbBZc
	j7MR3xSl8lcHbT+hxdioz2TLUbvydu7zQwYGldRC9lidL3UAkSNeAYWCSeyHB3woWbk7UO0yaZ6
	/S9W8ZHkNlwb9U2OF24U=
X-Received: by 2002:a05:6a00:2d23:b0:76b:d7e7:f1de with SMTP id d2e1a72fcca58-76e20fbc777mr4617244b3a.17.1755099791043;
        Wed, 13 Aug 2025 08:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt+tw5CQOw9hHP6fC25gOa6wKJiAE3Tp9b+fde67vtYyymzbtqU3y6+2C+GYLi70eEmwf0mg==
X-Received: by 2002:a05:6a00:2d23:b0:76b:d7e7:f1de with SMTP id d2e1a72fcca58-76e20fbc777mr4617201b3a.17.1755099790581;
        Wed, 13 Aug 2025 08:43:10 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c1a9d6940sm21074480b3a.94.2025.08.13.08.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 08:43:10 -0700 (PDT)
Message-ID: <b62af6d9-eea1-41d0-997d-b9585f2a9533@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 08:43:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 03/13] wifi: ath12k: Move Wi-Fi 7 WMI
 configuration to dedicated file
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kiran Venkatappa <quic_kiranv@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
 <20250812-ath12k-mod-v1-3-8c9b0eb9335d@quicinc.com>
 <00a72188-8ac7-4527-8128-352d0882754f@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <00a72188-8ac7-4527-8128-352d0882754f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689cb290 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=hgPZAWqQMrviz7OzBV8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: vJyR4Lf0u9pCSzKTxzqI-ARaQIWjUfCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX6iNc3LlT2eKe
 MWgSUS9S0KSJORLiJwKiy7vEVIjRFN3tFuz2bzi1TMjchE4R1llj3KA3qNhqJHl1wRvx1YuJo01
 kGZaRZ8DTm9O1+/GDBfIxzCwd7Ukv1vEdGD2HvLVl5TNCiCS6sD4MGN8JbQYvSkHDhYq4qPfFwH
 MTbNb1hX0wxVGJE4foA4hirL57cQZMm8H0KKUDTBhEmpOkQj6TVSWkUDC+4Aqx1duh7bGRNgfay
 ceL0wkkbyQtsZ7cEzvRINsoU70kzCEvsgr6dRNOH8cVARvORWttAt/vmjivRd5dsVkky4mNS5lw
 3TgFyRau826n0Y3lbeq4jOds10damh7IAS7vDYuAwNVilv7iYs945irllBmu3d+Dhgfkb5w/rhU
 TGW0RpKb
X-Proofpoint-GUID: vJyR4Lf0u9pCSzKTxzqI-ARaQIWjUfCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_084312_891501_88C1010C 
X-CRM114-Status: GOOD (  13.84  )
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

On 8/12/2025 10:52 PM, Krzysztof Kozlowski wrote:
> On 12/08/2025 19:09, Kiran Venkatappa wrote:
>> +}
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi_wifi7.h b/drivers/net/wireless/ath/ath12k/wmi_wifi7.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..1514e3e8d4cb65d3d95d95a1c1593a7b66abcf58
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath12k/wmi_wifi7.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>> +/*
>> + * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Don't rewrite the copyrights. Original file had different one. GPL FAQ
> also EXPLICITLY asks for date in copyrights and does not allow one
> without the date.
> 
> (and before you bring internal qcom regulations, let me remind that they
> do not matter. we discussed this in other thread)

Wi-Fi team wasn't party to the other thread, and this series was following the
legal guidance we were given. I'm circling with the core kernel team and the
legal team to make sure your concerns are resolved.

/jeff

