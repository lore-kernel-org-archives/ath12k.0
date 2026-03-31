Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D1510F92EB
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 19:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLxO3ngnNXsOj1a/VldJvjpriLPrRoW3lDgtq44dL6E=; b=NJ77euO6cp93RUG42s/1QH8ZLU
	Xe7T8hoRf1r0W70xUGN+LnArOTt1w2EXSq5qa5CtTWAnW7k//PzQRAv9m5vMqP22d9t3NHokX+BSi
	ngIuBZ9vRV/nlujS0d9gxMqCG8XIzdR9J/nQDR/LlDUjIwsYCsd5gm9uglokt7VT5tWVi1AUDBnsm
	UCJziAwmW395nkSyBz8u0t0GpNLBp3BMkpwi6h62cETBoxDzNmpMzVSz2Zyy8gHhOkI1csTSObIT9
	pXP0LYGBs7YO97ikK7x9ijy4JCnuj64XFSQY6wLqkSO04DxzuSx+cmUAgrt1b5w30PaU0rdUdMpil
	FsZqY/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7egF-0000000DTUf-2Wj4;
	Tue, 31 Mar 2026 19:23:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7egD-0000000DTUH-2WDX
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 19:23:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdHNl1831876
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 19:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLxO3ngnNXsOj1a/VldJvjpriLPrRoW3lDgtq44dL6E=; b=YJHL9mFJoR9ZlUjo
	LvpCZh9cyrYk0rHb7zK9CURQr6SD+LSXsN0JS1Xn45bDp04ZGHwhu+HvHh+VY7NS
	7pbC0B94r7jJqqr7Nsfe3J/MJgt8Px5bSRd8mBw9mnmPnbPyUsLpzrLhxlYXIueA
	WVeyDaUGucxvHPhBoSr9YkhMWc6bwpJvU7jhHWd3E6mvhRNIB3k2lDYwL7HM4P2O
	CtXbu1mUdeORCXBEyOMeHKGx07jqUoL3hpsP2LYX5ogXKZM0mc0wMH+AOfWCpES8
	4jBT28kzkFf2kuZsoTvQnJ25dEeXb6F09woyk6la7BAj++breYvTAFNrkR/2tKo6
	91GdKA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ9yhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 19:23:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0c96f5d9aso66434795ad.3
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 12:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984992; x=1775589792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLxO3ngnNXsOj1a/VldJvjpriLPrRoW3lDgtq44dL6E=;
        b=iX7rZKcumacFB0A151m6pqF1A7VS+jFp4yf+s2I1kgN+RTor4N4fwrOV7YPrJ+/y8F
         XCaBmgac5CY2kaPUgUvWWzlN4Ia4vhk3GLArnbcAa5TM7EH7NiQm5mFwLCsYd9w07XBx
         nePzoeaBURx8718Ws8jF6NYtmbpkD7826pfNCo9a+NP9+BqGhKyjvee47RVEUxd4e224
         l7fJ/eFZEUjZDFdb3QncFPi63D34lkVwdt4P3gwT7qKo83RwVsNXQZymSKewLoz2yh++
         ggtvkcrqingXObTkr01cOTq+NRqMKcodYkupAVdDXNXV1/sdhp/rq2MR31tq+0da0U3+
         36Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984992; x=1775589792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLxO3ngnNXsOj1a/VldJvjpriLPrRoW3lDgtq44dL6E=;
        b=NQAGn6GyuP8vqvpjFKy43IlhZhQM9iivQ6cKBINiBUtbV8LtRZy1NEAMbFxvxdB256
         +k0Ezm/BRCeukFKX+6pOqf0bOvEVL0/4HBv1R2/DD9HipdzFJOBjNJYq8f3gqsoCcr5W
         PdGemMn0haBCMpYmy4xFIMveMhmaSqi69nqcYMWiXiIjsbRTto9k2JTmd7cMub2v9XpY
         35GUIbaT9+9OzH2ta1SDaZVEgt7HIvMIzM1S6RFnu7dak7NpZLeSURmx779p2oe6bWe7
         xJc0PJnEFGlCJjhrWgzqKxyEhuL6tlJ95EU8xqCWFDZSDuCp/Qt9u4nhYnnymgsvOoBn
         44FA==
X-Forwarded-Encrypted: i=1; AJvYcCVXRjQbRLu3P825lDTCcX6894RTicdiv0iSxAcQi2XY1Hh7K76KjHXHTsF5q8s2rzR0mIpC78Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8qrB73ij0ylpLLWnxcXpCaNigcKRnOogWc0d4hJqHG43LmprL
	stT/zNYo8naxIWpwv7aXrW4gwR+BvKpy6o6w+LvtdGJ8hW55n/kM7UXD6cR7zvDzvaAZ4fW45YW
	51Da6gBqXz2JYK0sc9khwcLLmibDv4J7t10L/wbWuJscXY95PwDkY0do+vXXSHtxu
X-Gm-Gg: ATEYQzwCGnM3PuE6Kx+u1XsxLn/RFEs3NyxqJco9dGrJi3GUjoMT7JQ26evNqI/WarO
	GMQhJ5FDhjqIKAUzg/ewDieVGEY5aKlcpntyoNftFxNB1stLCHzUW6fN19OpPBSl00+1WfaTfyp
	I1o79GI6uMPqgcOJNU/w2PUX08oeJrBQah51B74jzyRT9DtRfOiMh2AneeUm9VbL0UdGdKUWlcK
	qeKyw0a6aEoD13NJYNIFMuKYqcSTLAnQCZI5LmkJ2NE5SioLzeKpX9FoMB95TQUq9KsKADhzKOb
	yu1V4NVIxJdzw/Dq21Z1YwxgmyhNcESl9Zq7KwK7fn/favt02RfUlIWd5Rv071ND1wtFVHjG7mH
	qCgiAF2c0JZrtBxg8e6psTxhKHho36irreqgVVqtfHCzCSk4Wkw==
X-Received: by 2002:a17:903:1a2e:b0:2b0:67fa:dbf8 with SMTP id d9443c01a7336-2b269cb54b7mr3731365ad.41.1774984991742;
        Tue, 31 Mar 2026 12:23:11 -0700 (PDT)
X-Received: by 2002:a17:903:1a2e:b0:2b0:67fa:dbf8 with SMTP id d9443c01a7336-2b269cb54b7mr3731105ad.41.1774984991209;
        Tue, 31 Mar 2026 12:23:11 -0700 (PDT)
Received: from [192.168.29.33] ([49.37.211.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242787bc7sm125209145ad.59.2026.03.31.12.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 12:23:10 -0700 (PDT)
Message-ID: <7e1fcefd-3a29-41bc-9cc4-41089f5f0318@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 00:53:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
 <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
 <20260331-fanatic-elegant-wallaby-913e35@quoll>
 <b1194bdb-75fa-4f2e-b4a3-9565b11bb3e9@oss.qualcomm.com>
 <0de0574a-04ce-45d0-946d-5fdc1a7b8181@kernel.org>
 <cf1d8b38-a5d0-46c6-8016-b366637d6c72@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <cf1d8b38-a5d0-46c6-8016-b366637d6c72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NiBTYWx0ZWRfX7ZkkpM1bk/47
 Tbc2lxAMKk7US/LkUuVlE+41wdlzWZySlX9/tHixGreoC84E8rJu52CsjPk+B009nWDXpCC1taE
 Te1Mf8o67nAXtNoCMpuQxdmSFUMPu2JfoOJmcmpg1Bb7IvZDFXII6h0FmFMJLNB7KECmUWw/znb
 Sh4GG10SdwiRdLZ0iiqRyz2aWKcAhIm7XrvDaY42xvOIWZoDCFMm66XgNH3PyeW7dVr2csBIe1o
 KVCkHXkSvv1EmAT+sCAw5X3W26RQuSqywnM2YwdMsksZI6B8DJ/DdqwkIM4RiJmnKB6iIZ8R/jT
 b4QN9IdlhdRi0Tza1I74fw3yPGdKF8XsT8PzeZ104BkNui/wZn4ZZn+kWlYYrIkWXHb39ZDID+3
 GZqqpFqioLWHYq5svlYtGs9M/bX0NSkLymb4N9+g+jCTldCUYP+sZjYKJGBW91C7wpMNXISWN44
 YpfGxBZoSPLX4je5fNg==
X-Proofpoint-GUID: gkyXF8lIskHWGbOs8HaGor72Fot-015e
X-Proofpoint-ORIG-GUID: gkyXF8lIskHWGbOs8HaGor72Fot-015e
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc1f20 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Q/qCPUFY8RH0zYWdMQWv4A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=68ybZe2WLJ7RObfeEjAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_122313_672817_F084E421 
X-CRM114-Status: GOOD (  17.63  )
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

On 31-03-2026 21:14, Jeff Johnson wrote:
> On 3/31/2026 7:42 AM, Krzysztof Kozlowski wrote:
>> On 31/03/2026 16:23, Jeff Johnson wrote:
>>> On 3/31/2026 12:24 AM, Krzysztof Kozlowski wrote:
>>>> On Tue, Mar 31, 2026 at 02:09:06AM +0530, Raj Kumar Bhagat wrote:
>>>>>   $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
>>>>> @@ -17,6 +17,7 @@ properties:
>>>>>     compatible:
>>>>>       enum:
>>>>>         - qcom,ipq5332-wifi
>>>>> +      - qcom,ipq5424-wifi
>>>>
>>>> No, use previous patch.
>>>>
>>>> I am annoyed that you keep making changes even for such trivialities and
>>>> require re-review from the community.  Previous patch was correct. This
>>>> one doing whatever you want to do in copyrights is too much. You don't
>>>> change copyrights just because you wrote one device model.
>>>
>>> Krzysztof,
>>>
>>> FYI here is the guidance I received from Qualcomm legal (links to internal
>>> documentation, removed -- I've forwarded the entire e-mail to your Qualcomm
>>> mailbox):
>>
>> As I explained already more than once, legal can engage in open source
>> discussions directly. I am not going to discuss with them via proxies.
>>
>>>
>>> ... Repos under copyleft license [...] QTI copyright must be added when we
>>> make significant changes.
>>>
>>> ... Repos under friendly license (BSD, Apache, MIT, ...) [...] QTI copyright
>>> must be added for any changes, not just significant ones.
>>>
>>> ... under the regular QUIC to QTI open-source copyright transitioning [...]
>>> all QUIC Copyright instances should be replaced with year-less QTI OSS Copyright.
>>>
>>> I'll follow up with them on this case where there is a dual-license file.
>>
>> You nicely removed the quote where they ask to follow what the upstream
>> maintainer asks for. So as one of the maintainers I ask not to change
>> it, because it is churn and pointless waste of my time.
> 
> Although I feel the latest patch correctly represents Qualcomm legal guidance,
> I'm not going to insist upon the copyright change.
> 
Thanks for the discussion,
will use previous DT binding patch (v2) in the next version.

