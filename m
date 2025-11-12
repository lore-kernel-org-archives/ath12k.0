Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410B7CCFA1A
	for <ath12k@archiver.kernel.org>; Wed, 12 Nov 2025 05:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=894lqf3ttZlXEQ+nO44+tH5uTJsw5UWigc961CuEfK0=; b=1rGZjVZIz5XCm2hA911GZDcw3i
	F2PNajAETxKITlD7jhl78Ze0y0fF9Jq35+YTv7nevojbROe/3y+kbwLhrDIXJaFgdDPPylFIs66I1
	HkJd3CEQnVl5W/KWPMc7Qj5uGO7dVrNmYc583/PhcG1LoYCm3WCvPlH4HpBHc6Mzw1c3oh2YE2UFs
	VXD/hznRG9dK1TfjgW1GYwt9+o9wuuBr+X6UjoVqzcuv2xC+cmOtxP3qCC83De0ToabTrCmWobabt
	Ra9TvwdcE8wbhJp6C4GMGONhx8VWv6Uwx2x1EqLlhVpEJxu1WHSH4YEaVfAV8LP80Igatf+eSqdeY
	cukEdOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ3CN-000000089PL-3CEk;
	Wed, 12 Nov 2025 05:15:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ3CK-000000089Oq-08gB
	for ath12k@lists.infradead.org;
	Wed, 12 Nov 2025 05:15:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC4d2CL2806444
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 05:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	894lqf3ttZlXEQ+nO44+tH5uTJsw5UWigc961CuEfK0=; b=UdErVyz18IDNDS+C
	xVYrUJPkS6lq2Ok/LKI+xEVQo5bOVFeK/EANpVKxub06F1suWNDpCnSYM4NTpYvt
	6iJSVRik51qMVRuwfD96qx99nQh/curh6jSPPng0j4Y7oT+44aL5RVsXM8GZf1hC
	rqfEy0EsUJfcAIbtVZvwAyNkn7UQCGFccl4fqENDLU4oZklLDeyLtBCo1cVFHShC
	8Y8gfluXdN72mu+5kxBlXRi9140sRfx2gSBgy/2oxmDKMgHnk60YzGmOljxprEBN
	u3DBi4AS0GJByDQDkyUk6OurNPBnpAFJ9Lds7Q0/n3Y5LN5v4yggzrvRPrkOxtEK
	GnaoOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac11x3b11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 05:15:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2982b47ce35so5463545ad.2
        for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 21:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762924510; x=1763529310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=894lqf3ttZlXEQ+nO44+tH5uTJsw5UWigc961CuEfK0=;
        b=DgexZEHT7sfWCdNyxFIrjPN7xlSaOfFbe5yJsmVCgq9O9hkflndhNCWWmOrOb4v+YK
         Lye9jRzHdXV9iMXyiFtKprJi3E7vPiuQCotb5JGYC9mcv1Q7xC5wVHyDrDdQfo+nIHwx
         pF1+jo6cNK8rCYPhE/9AwYihjCRiD3rwy8NAChZYSHpUWhl5r1p8IbPf8VeEHYEDzlDe
         HP4bgdaDiRbbTZ6Vmsd//NqoDeZSAIV6BvB5MAUt/ijBHkeiMrEjXrDxcmelwv6zI0WD
         elGABQwAekvrIag43aKL6O4mnEuWSS058X42iLnI4cTuCglQtcpTQJPwfvh99nWWPC4L
         42Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762924510; x=1763529310;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=894lqf3ttZlXEQ+nO44+tH5uTJsw5UWigc961CuEfK0=;
        b=hHH56KI6ltaS0dmJSddcBW50FJfODKNjMRrpUxaa5GUL2ajGafG/JUe2DX5kLKT0Fe
         xjUdIV25/2OOSL7kPgSLMHJyGiGPi8eURyLEtFvPVYFTYJUK924GiZ7odeLoavT8VA+a
         o8XMDldmqZ8rk1EnSqI92Fag+SFb7HzkDv034YraBsRFvwG9KwVEHjJqVHwV3+jymiya
         Y6Jc05ae1TCNeLTRZe3/lMk8Hgz95HOn4LsCZOSC2uOokp0arM9p+sCPq6XWqWgPO/xI
         TxY6T6qmSNHiPpBzHCz3B5SbNpzTacGZOfAzDvyABx9j8pQlLrsUmyfBxi2A0djaVSKY
         U63g==
X-Forwarded-Encrypted: i=1; AJvYcCWOztJKoZAhuWZUxESzenH3R7swCgyhfBk8eT0Cc920qmo3EGnzynJDeOi/Mpg+59bthHq8hiM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5phcMkpWNnHb75gtASoe+Jxtq1MTqa2i6LvwS0Sy1wZPFc8Fg
	97Hrtg4usoDgHUpvuWkdZOObotUmkITvMGx6mppNb+Sqqgvryk+3KJvV2ZYyvRF4R2Dz1umMvRG
	DGIW5PmGCrIDCTj9OwiSEfvsK+T5PGcTQTQer8iexWM7x1FJCovrVyjSGyPyy9OEf
X-Gm-Gg: ASbGncvkmev229t0tQKDFGOBtoSOLT99OakrnpErVJzJodp5UzXSNcTZ1FTxt2vZ/gO
	A42V8lUj+P9Xq19/xHU4Iagsp9oqcrDvkZNp4dzAo2cc9O+fzS87aEzuStWZ4C0LvLpNo/IaZen
	qPiAeW8wzfzGm3WhqEPOdXtCP9++m09fgE3E9n3enZg+02e+pVLvae3QHXITK7d741yLvdmzaNI
	ZQwZi373RrFjr1W/+rDyJP3K4svsDocFjNOxbANJB0KC952yeECtJwjSNZdRJGRSZ2K/nUHg5t1
	wIijXtcs/9z7VFSM5YFSecVpvIVMW5ZFwpe5tBiv06jdFqnXe13LAtB9/9FjZvPIr+QzIW9Nark
	6a6m9b/XEtEURsXp1m+fhlg6Plp8kqyrwQR50XIzydR3Y
X-Received: by 2002:a17:903:1205:b0:298:1013:b8d8 with SMTP id d9443c01a7336-2984eddfa9cmr23179035ad.57.1762924509669;
        Tue, 11 Nov 2025 21:15:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6pbJu6/iskoDYOsDPyluQWXA8PvURykZyk8GKSiyOZLQ46XcKZaOg1zRR/+wwGh066FrDwQ==
X-Received: by 2002:a17:903:1205:b0:298:1013:b8d8 with SMTP id d9443c01a7336-2984eddfa9cmr23178665ad.57.1762924509075;
        Tue, 11 Nov 2025 21:15:09 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbdad55sm16023435ad.8.2025.11.11.21.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 21:15:08 -0800 (PST)
Message-ID: <4648e6df-08da-9d7a-63e2-d2b850ccabb4@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:45:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: ath12k pcie radios with MLO support?
Content-Language: en-US
To: Ben Greear <greearb@candelatech.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        ath12k@lists.infradead.org
References: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
 <f44d00bf-62d3-427d-a70d-29e7e325b8f3@oss.qualcomm.com>
 <75947d00-4b0c-44af-b887-7874077fe64b@candelatech.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <75947d00-4b0c-44af-b887-7874077fe64b@candelatech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAzOSBTYWx0ZWRfXzUiOtzODFykw
 33vLsRDKplZYpmcsdPy0BsWvrWc26Yhp0od/t/UOVsehjnnYMW41XpyYMzXq4fi08QOVem8PNOe
 wZYHJca6LGtmary5JHVRwku2dm9rWoo1+HvTcckXlWSwa/Tj6zKEanHUSiyQ30Zi/IKlC34mDAa
 cOOXQpT/lVVyEpepWf1FuUH1QVkks3UP09HUg7ajhTr2CHbf36Ou+xXejotC+dVglfecd1hJVnh
 GENjtRTr/lQBde9kt+K00ef1FyixpXhmzZSiiNai3LuX6zyfpquYFZjuP2lRvg0enhl9hXLdxLW
 DML95JhaTk71Dd11RiTOBIrlANu+OcWSEgqzuPq3eBwViQUcpSVTzTGjt69dnkoGbvQef49Y7ju
 OJo4HdSkoTCD0wkMAWqYsTvK0ylf5Q==
X-Proofpoint-ORIG-GUID: ixUVLLPHwYFW-Sx878zxmfShrnwf731F
X-Authority-Analysis: v=2.4 cv=L94QguT8 c=1 sm=1 tr=0 ts=691417de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GUbesZiWAAAA:8 a=gYpGdzHizzFRMD3PMmEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=-cUrBSrepuC47jtK_ZRV:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: ixUVLLPHwYFW-Sx878zxmfShrnwf731F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_211512_079947_11A5D236 
X-CRM114-Status: GOOD (  19.82  )
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



On 11/12/2025 7:10 AM, Ben Greear wrote:
> On 11/11/25 17:29, Jeff Johnson wrote:
>> On 11/11/2025 7:27 AM, Ben Greear wrote:
>>> Hello,
>>>
>>> Are there any current radios + software available where one can put
>>> ath12k radios in (mini)pcie slots or similar and use those in x86-64
>>> chassis and provide tri-band MLO?
>>>
>>> Last I looked, Compex had some dual-band radios and maybe single-band
>>> 6ghz, but I am not sure those can be combined into a tri-band MLO solution?
>>
>> Most of the Compex modules use the AP-centric QCN chipsets.
>> For your use case look for something using the WCN chipset.
>>
>> Something like:
>> https://www.sparklan.com/product/wnfq-291bei/
>>
>> (I haven't tried it and don't endorse it, just giving as an example)
> 
> Hello Jeff,
> 
> Thanks for the link.  That too is dual band though.  I'm interested in
> using ath12k radios for wifi testing purposes, so I'd really like tri-band
> MLO to have some feature parity with the MTK 7996 radio board.
> 
> Is ath12k able to combine discrete wifi NICs into tri-band MLO stations?

Yes, ath12k supports tri-band MLO STA. This has been validated for QCN chipsets.
Not sure if this has been tested for WCN chipsets.

> 
> Or is ath12k entirely DBDC at this point with no tri-band MLO capability?
> 
> In addition, back in ath10k days, I was able to get the radio to do up to
> 64 STA vdevs once I put the firmware on a diet.  From a quick look at the ath12k
> driver, it seems the limit for STA vdevs is exactly 1.  Is there any somewhat-documented
> way to get ath12k to support more STA vdevs?

Supporting more number of STA vdevs instead of the current 1 STA will require
firmware changes (and of course more validations).

Vasanth

