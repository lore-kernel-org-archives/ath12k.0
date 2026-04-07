Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AEEFB5183
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 02:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+T64C2shkeuX9nGP7xkHlGtnZEAVo6YT0+MuiSjWM4=; b=o9CT0UzKcxZp6kSAliiRic6vgl
	Kp+PIz8umI8glP+jhe/Y89Eg3AVE5+alj9x8XGS3A8yvmqdyhBYLfnZItLqWnQk5ieeySaX6IZlu6
	CQAg7jCm3l6cuuGVhuxP6P8FzhazDvGrsbCEwbLvsCPlzi/RHQX9g65JR/aNsk9pE3oB1HBUkOiJ7
	n99a5EIBD+85EVvS/qc+HeVAdWD9D6BnToqv91DDlfs1OqJVz2J+L7wdguPCiC+r48/1URIFulKYv
	OWEmJIGrbyehJwRx8FDO+yzDvySdizhAhHTmkrCHz9HMZHeO0BMahVkhcBwVOFSQcrSxSS1OC1edU
	Hkmq3OAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9w6h-00000005lHb-3Bsj;
	Tue, 07 Apr 2026 02:23:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9w6f-00000005lGy-1tJE
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 02:23:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQKsw3537314
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 02:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+T64C2shkeuX9nGP7xkHlGtnZEAVo6YT0+MuiSjWM4=; b=Wkp5wzwfsLYeTN/S
	OYG9JfM9mtWQwaHUdX4Vb7bX45ku4I6lztTxJQxAnEkmSHxWnuvMtTDE3mYR8CX0
	dl3GdC1AMlYfjkil6mVniB2VBY1elYgGesRLobLjMb8o11MyVdWUbxNSFovRzIR8
	MEaUgWdxZx7al4YKNb+EapD+UyNWvzTUzPjR1x3mHyAbFbEgYot2wLFdXOc+PqHx
	rnpVdPKhayoCb2PuTLflBw+4fe/70GAj7UM9LwSniSaa3hFFXVEXk76vOeI8c1cl
	ZE9CD8vxEPcnJ6G4xsH08JOEwTBqmVpVTwLWf6PZF+/gGj29dLlKZAugKAGQhs7W
	4PEwWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra0n1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 02:23:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b242062308so106807675ad.2
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775528635; x=1776133435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+T64C2shkeuX9nGP7xkHlGtnZEAVo6YT0+MuiSjWM4=;
        b=HTxf9WYsilHz+K6pGrTRAgT7bakLUxqAr4gH8tiV0o1z1WfUHPjPmHHPyELhz9F4Pr
         XzBroMXLwSOwyAHcHfAbyjsV2cHqzZfkrPOSz6jvESKwyUjq2rP+kkq2DhltOmxO2cGD
         W7e/UvyFqn7xre4JHUe2HZAjf5T4qiomjzf1DnICzZv3cxrsbHnJ3gMdifNI0rra+2rQ
         AGhuz5wwXOEoAmUFazD3z8FWWr+V7GcWb0vTuwLbp/80ZES0FB6pewwjuCosVQmwgGB+
         qDzUmLGmcWo8M0tlS2VBAN6mTjtFJTHORIt6WMkYaRP/hfT/VMbzkdkF/jtTjTZVU3Wk
         kIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775528636; x=1776133436;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+T64C2shkeuX9nGP7xkHlGtnZEAVo6YT0+MuiSjWM4=;
        b=M6pPIREfGgs8O7SsKIBSO0tnG33/BncUhE30kMzJOGqUyYZaA1ne5jQXiKoCEEW9mR
         gD+5sVIc9GXjrZ7XdtKNFHLi97GMBAhmaDRp2qW4By6ObDfCFAXXMUWUA7SLBavOqooE
         lDITXdzBmbiKjXCUzM6CpA/dVEVbZcLl1y3wFOvT7oH3NK1Q/K+OZmhjMPGItnyZD2tY
         WC3wC8/ccZcxZMcwFHnfHPnyP5o6uSW6JhpMHoLUtlAPWNpNCJr5ytuQQqRUzNM0wGIP
         zqQPV0XS8mWhfLNS+aLqjs6bxtm350pL9LuTbYSg2mA6uCifF/3qBFQuxOKQP2RoArAK
         O4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWpXpe21otue092IT9jAs/kO9LfFRiZ1glYoFj7KciuqrExFHiZGSz94NpAawGulMqJ3nL09Hk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0ItgV3ufLFn2I2U8FzM4UAzXVzns1E9OWVquy/AKqiny6wtdc
	ubpwKLDvrL10nuItR1HqHcslPKJALqHsKcqLrFlwzDcFXWonjRGPX9wvTCOBL3sp0sQsKsfC5/7
	QY7FlihvemZbWgbjY6O8najmoQKqnOCiryhgXwezkKYndKmdRRqZpRVfsc5JHxpUC
X-Gm-Gg: AeBDieuqKFkh3B4iOz+6sq098+gIpRkW4B9gOwlvWnKH/gaV2KjmlFDoGgei8bv/898
	UpxBNhCefrviBj7Bk4nkWT3seIR8OC9Vjq4ZlVp5pghPJqP3o7UmVOy/zJk+SAsEMIMPZVmTuPA
	w+bMhWTtcimRrnsVgJoAYdrSfF8FCPw6Cp87CeEVGEea082zlYAMKWs6qrtpCBmVnXoembgQF2F
	B+KZQFrKApfKdaFz2hF9g3flTY6ckr2Bc6z1LJhtSq6gwhpn4yx5Nyrws1uZXu2Bn/QIVUC6Si1
	ubQSuYc+H6BqReGJ5iqW5+dAgq2TunWvowTbZB6QmAfCexr6QvhrLRPL/xsJQxv0UO/8yJ58fW0
	nQ/tuO83iVTO0Py7c2m+YThYu654fCi4gSs9bz9lSTgAULWdl8t1T
X-Received: by 2002:a17:902:e845:b0:2b2:6df1:1108 with SMTP id d9443c01a7336-2b281867961mr157965625ad.15.1775528635541;
        Mon, 06 Apr 2026 19:23:55 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2b2:6df1:1108 with SMTP id d9443c01a7336-2b281867961mr157965345ad.15.1775528635108;
        Mon, 06 Apr 2026 19:23:55 -0700 (PDT)
Received: from [10.231.195.112] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27473583dsm153140155ad.9.2026.04.06.19.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:23:54 -0700 (PDT)
Message-ID: <09fb6efd-646b-4d0d-a0f3-9f6ce4b38442@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:23:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
 <5a606f7d-6665-4b0c-bbbe-32538b2315b6@oss.qualcomm.com>
 <95face24-deaf-47c4-935d-0b48b5141371@kernel.org>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <95face24-deaf-47c4-935d-0b48b5141371@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A5BjguHSqzs6SjfWBC6UNZ7bk3KMLr7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMSBTYWx0ZWRfX6DwmVjq+H7bv
 EtPLSA9bjuQ3mYr6jOJ8bWYYjK7QpwyKA22s+hd7yhKTPOyzgQZ3tpIMs/kHdsLl3J+gkm9cNDn
 hF/isIdYUVoZV9zSBTReQODqIAuOVawndnP46iJXNVLs5VUKZ9n47W39+NRKu0jFgoo/mSZ3lJ0
 5LP4467O2Mp3a4uvTI0HpBKEfePc5g5H1yB2jNonE3SBnyuwhXcckAL7QYppZJmvyqCy0niyU2q
 jv9zxEwTvfGYgZnhPIJyVhlyCqvSsv1g9fXxHcStpITgUPFeMmHxrdvgwnjroMATrGnovpWhgWs
 LLbLCgOmiESSsq3+ob2e7hhl3cO/aluBn46nOYfh16zAyd674SoC4SdYz/Wbb+j0plQa5EPZ5Fq
 LmBgwJMj4b1C9aWGuFlAkzlaORWlVjEZZPPZLn0bZGH64RlWVu6jSZOvpDtnbJq75vuOwzpusgt
 rHpbjKvNz+8BKsZSe/Q==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d46abc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eL9f3Vq-dHuaEv9KJUoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: A5BjguHSqzs6SjfWBC6UNZ7bk3KMLr7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_192357_494720_5694F338 
X-CRM114-Status: GOOD (  11.13  )
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



On 4/4/2026 1:23 PM, Krzysztof Kozlowski wrote:
> On 03/04/2026 11:13, Baochen Qiang wrote:
>>>
>>>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
>>>  drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
>>>  drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
>>>  drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
>>>  drivers/net/wireless/ath/ath12k/core.h             |  1 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
>>>  drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
>>>  drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
>>>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
>>>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
>>>  drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
>>>  11 files changed, 231 insertions(+), 21 deletions(-)
>>> ---
>>> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
>>> change-id: 20260331-ath12k-ipq5424-cddb63a46a97
>>>
>>
>> only nit in patch 2/6, so for patches 2-6/6:
>>
>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 
> It does not work like this. Replying to cover letter causes that all
> patches will get it. Provide detailed review and response to each email
> in such case.

Got it, thank you!

> 
> Best regards,
> Krzysztof


