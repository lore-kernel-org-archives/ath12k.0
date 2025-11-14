Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D015CE7AED
	for <ath12k@archiver.kernel.org>; Fri, 14 Nov 2025 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=; b=bpby5PvMXQuaF+4qD5pzAcm2TU
	Wat0QVgRL4lnD3M9MPe73m8+jg/fB7KQjK8SBUXsUmoqXOZV1N9SXYeCj8bIrwGo0JSlfvrhLfyFG
	yysYCFc5M44mgnfSBLPnMcFrLs8seVRSSFp1PVOsXiV3nlqBEErPRtXQf3k9x/G525gkM1B18Ksk8
	t1/AuVinfcX2vEZynxpXMlcXIlAEYxK31BX6vYdHIZ/7SMwHThmcxPyn3h6E+DRnrWDVWRxkfaH4V
	fZwMZlyOhZxb9gDbIZVFwqfpoB+xCQf03d37fD5Hx0alGeMWDbrvltqVC04FksBQBPGPAuz85GDkQ
	j6rCrQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsE5-0000000C8gT-1bot;
	Fri, 14 Nov 2025 11:44:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsE3-0000000C8fF-0QKN
	for ath12k@lists.infradead.org;
	Fri, 14 Nov 2025 11:44:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8gZZb1485460
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 11:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=; b=VuFdSrrhJeEzK3wb
	83dIPl9p+5XQN0YyrqeaAKqvqZk+2YVebqGk157VzP9bMHQZCkcZ654KwQ4t02kS
	7K8mIp4LSFk66284F7eZdLKNyrh2tnLsCeqrG4zcTUpOIn6wGzmhAa6+b/bHSPgD
	AZdhwAXNZNgD91T+045U3baj3di6VeHbXg0Vl97qu4KJCdueffgkvcRE+oBVDDlR
	efW4rX7fERRiE2WGCQTFkhXHyT+Ed0VaXQ9/OhKd3T9ITlp5GDEttm/N826Ei7Yk
	7trkoIhYzPFEX+BfwowsGCCnW/40pqMhpjBa6g6Wz+WvxW44M8cmNnKjezADUj7P
	osSkTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ht10u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 11:44:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed846ac283so69997051cf.0
        for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 03:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763120661; x=1763725461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=;
        b=dIL/LCrSPto6H2CyZrNXj4O7El8yF8s/Rrj2kaQB4W0CjVPBxBRWrrC9skHLNRzykw
         dDTFtGArjP9YeEUEvNtTg2mNH/v4yvDmTSZ6Ic7cI+mKzQjsAkYE0GycjqSz/cU9KZSs
         FQ0tglABUQyV3G9gmlAvXKGW0QOu8i5D/z1YnBYrLInbMQd7Cq6ad0oXyAnXk4tQgYes
         bKQKocZ8BZ43k4tte0p6AzOAqj1MXjeotAoxebYOnCHKC93k4AZgfpfTo5kf7hLtxv+D
         1RBh8b5IYaSTcaHjOzSx7jgRYkogU5tkQeECsCf2hC/NZEqfv3k7Edh+cAguq+HfYQvu
         NIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120661; x=1763725461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=;
        b=BnIag1XBue2bUG1xm/lx6Iql/WS1W2PaGNbK3qa5hD4GtZt9NRQy3smolFMYVmDOok
         ZXwoIYK7MhJByYl1WvPbshunjXG97brmI/DJhdR22IY8HfaPhoxmbTU3XLNw/Wtr4bMh
         wt8XV4L5ZjDaUQhjZVC0A3pfy68T+mMCXeHp8F5IUBEXw2zK/IC3mhvghC7TTwH2LwH+
         l5oHxjvydtrADwgX+Sr9G81Yc1wC800SUZv3jPWiY3GZbcoVs1eu0qGhOfcUQKzPfBc3
         5sNPY7Ky2W/jbz7VHUSXikWtMV/N58A2RpT+Q0vIpAIjJ1+eIU1PsMBwAQVdLNR5RE9p
         lo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkZNMOsSygX363IK2wCNOwMZWn+RABG4Nerytx5jRtX1VkHMyKXZEv23pXqC63RuNUVddAMjI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Vj1bz2yGFMpL+dxw2KAPowtBRj0VoW9xumj6MfcbIGU9xG36
	22JHxkf/xF9Q9cUG6tcr7guecNzUC9MOZ77WGXNuFf0S4ksPibm7F7ywuP3DGVAvVRAdkyMF7C/
	US9wLZj1861NwG9YtHJ5WRs/4G8zCWJTn8a4glkbQ9kmc3CUROmEV6nhxzV0MZzUg
X-Gm-Gg: ASbGnct37iaNqkYoZL3p9lqGDow+9KJ+vBjE4Z8lT/27B9uQ+EbA/ejF0uC5QL4w0MM
	yGgRybEcsjOLALMIdnL3YoG0dXWyVl4f77bD0hovGKg039iZ8ZWEJs2syixw/jwZZZxp/n0PTrF
	2dVNFFTiYKXtqBmFcWBtjM6EPuNS/GqyWt4IQa8olbnyA/LqFl6941cmYnYQen/2hbXwGEhsnAa
	fi802tCP21ZEgrqPdkNcsUn0sCi1c/H3a77l7ECV3fufb9irZyCnFsxOUVHibInx4sDx/CLrSi7
	f3aHcZiUrLE/SlboAPqg7x6MS60tdnNKjVHY35oUU9qixwzcaIRgooCWaO2ua/fC0S8zm73j0b5
	G5TpE6HXa2RDpl9qhA3nBgMwURrGd8S6YSYG0
X-Received: by 2002:a05:622a:34b:b0:4ed:223e:139b with SMTP id d75a77b69052e-4ede6faa8e2mr91683671cf.6.1763120661287;
        Fri, 14 Nov 2025 03:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGKSxXof2g5+6sgV/vHp4xRjNtsZJyx2k6oEmSKoRXu7xN5sluEXzQ2X8pNO62GmUXl+lsLw==
X-Received: by 2002:a05:622a:34b:b0:4ed:223e:139b with SMTP id d75a77b69052e-4ede6faa8e2mr91683351cf.6.1763120660805;
        Fri, 14 Nov 2025 03:44:20 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477952b001csm2189845e9.16.2025.11.14.03.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 03:44:20 -0800 (PST)
Message-ID: <70322e09-694a-471d-b4fc-f5a8a1c01450@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:44:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
 <3a951821-14b1-464e-b1da-05a95f4164af@kernel.org>
 <kn24jkn77ydcrn23xz6z27cvaclksmeb3ic7pr24lxsqediugl@ubkf5t4wyyrq>
 <f9d47593-6fba-495e-aedb-c0efcaa5526e@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <f9d47593-6fba-495e-aedb-c0efcaa5526e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FMHpJc9oak06K0jvM7gH2xPNHx70HjNG
X-Proofpoint-ORIG-GUID: FMHpJc9oak06K0jvM7gH2xPNHx70HjNG
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69171615 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gHqtoCV0S4uQAjPoSdoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MyBTYWx0ZWRfX4a9S0B9cGTR2
 UkLEwslEiGT7xJASCxIdRRFe7D14lW28y9sIoNGRGgQWzYhNpGqNSRVCMojJE4I82brtA8bA1Yo
 YZktud6DpJSRgks5R6cCdZIHte+NgVkyHpcFTsgWFJv/w0mEij1V09b/jqpez9LqkPEKMlIMBJK
 1ODRL3r3U6yPDr/bI0PxHGOrg/plsDvUgd/uZZ/jlyk0TAUfhBKxp3n/fMU1cqUN+y2bWuv2RqG
 gbhyJ8mv1nWNExGzK7PqlpfuLRhKWnToE+cWIqcAx0YlZWE4KPQDM1wapkDYDCuiykd1Zea2+B0
 69fGyVPFva8VqleN+AEfOz6KTtr6/9D3NBL/DjmXi/UYxOy3qs657x8nOIbNRZbYqEMpXxjt1Cu
 BvSiaL7pS7cxBNxO5JrqbB1+1FeZ+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_034423_301798_31E51378 
X-CRM114-Status: GOOD (  19.25  )
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

On 11/14/25 11:24 AM, Krzysztof Kozlowski wrote:
> On 14/11/2025 12:16, Manivannan Sadhasivam wrote:
>>>>  
>>>> +static const struct __ath_calib_variant_table {
>>>> +	const char *machine;
>>>> +	const char *variant;
>>>> +} ath_calib_variant_table[] = {
>>>> +	{ "ALFA Network AP120C-AC", "ALFA-Network-AP120C-AC" },
>>>> +	{ "8devices Jalapeno", "8devices-Jalapeno" },
>>>> +	{ "Google cozmo board", "GO_COZMO" },
>>>> +	{ "Google damu board", "GO_DAMU" },
>>>> +	{ "Google fennel sku1 board", "GO_FENNEL" },
>>>> +	{ "Google fennel sku6 board", "GO_FENNEL" },
>>>> +	{ "Google fennel sku7 board", "GO_FENNEL" },
>>>
>>> Are these top-machine models? If so, you cannot use them. The value is
>>> user-informative, not ABI. If you wanted to use them, you would need to
>>> document the ABI.

the value has expected format, can it not be an ABI?, from DT Specs:
"Specifies a string that uniquely identifies the model of the system
board" We can argue that its not part of
Documentation/devicetree/bindings/arm/qcom.yaml

@Mani, can you not use the top level machine compatibles instead,
something like: "google,fennel-sku7" instead of "Google fennel sku7
board" which is an ABI.

>>>
>>
>> I had this question initially, but Srini convinced me it is OK to use it in the
>> driver as they do it in audio :)
> 
> That's sounds like an issue which could be fixed or at least discussed.
> There is no in-kernel usage of ASoC's 'model' property, thus we probably
> never noticed that it is an ABI.
> 
model is actually used as soundcard name and long name if there is no
DMI info for the platform,  This string is also used at the UCM level to
identify the correct UCM configuration.


However the model that we are referring for sound is part of the
dt-bindings for the sound card, not the top-level model, so this is an
ABI for soundcard itself.

--srini

> OTOH, everyone apparently knows that audio's 'model' is an ABI because
> no one changes it, unlike top-level machine 'model' which is being
> changed from time to time.
> 
> Best regards,
> Krzysztof



