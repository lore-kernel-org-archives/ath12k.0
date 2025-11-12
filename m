Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9377CCFA1A
	for <ath12k@archiver.kernel.org>; Wed, 12 Nov 2025 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wst6nNXd42Vr+PMx8w7W2A4KJqYilImAVzMOYEyePA0=; b=1j4ZUlCke7eHxRmSjeMP/iw+7N
	vXFBipzZVlQUkxgQZBHkLsUbVOcLItcEVzF+HL1AYBsVwxHtyXxKSfNUHwtyk49UjelAwjh/S/d7d
	z84M5c6ObmmDzzbEn6P9CPLppazT28Ip74S20y+IT83wGp3IXvEUY0CDSTWoHQW0m52OSSk3RKyW2
	NPqRHmRR5vxR26MsLwo3bWftOaH5hWtIp14QMLyzhmiwJzeppUFqsC9ARpnMC8TLC5sD4acH5hbMI
	HOKhgbAhk0lxndI0B+5SsbrrgYGo7h6bRyyyhsQRnTB6vHgDZoQTNB9bPxZPOeD0AQuU/uhDmuSKI
	xBYsrFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCHt-00000008zn6-2y6Q;
	Wed, 12 Nov 2025 14:57:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCHq-00000008zmc-44Yk
	for ath12k@lists.infradead.org;
	Wed, 12 Nov 2025 14:57:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9XD6e1002065
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 14:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wst6nNXd42Vr+PMx8w7W2A4KJqYilImAVzMOYEyePA0=; b=oIsixm0auDFIRn0J
	a6DP3hA73o7nPCqm9gl1Xe1vr2NTrE82VguSI6dReefID1ZmTOP9RQ6nPl32EDqp
	527Fgq6VicDszECMzIpXui/+3T6T8Cg5fGdK6zsN53+zMQ1j4A/tAcIvuuJXIDya
	rx9LKfIx+t0kozQ40y+ir9XvtpxXrH2uZCbXmAmm/oZIzJu6oDqgDMvdYcIgThnl
	iOWw9t6C5R8pO6Hdl/ybNdmqiG4ZfzM5+r5x5zFgL+8mIL7oUdY0m96UPckfl1Jj
	Rvv8vEH/Wh7vur+xOoRaJ9HCUnDw8L/+SaN8rZNIYR5aP9wxsmod2QExcTKQ1kPb
	Kj5z+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq20yhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 14:57:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e1cf9aedso24989105ad.2
        for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 06:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762959449; x=1763564249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wst6nNXd42Vr+PMx8w7W2A4KJqYilImAVzMOYEyePA0=;
        b=dUczcsL+Lonc/Yp1yJ0zUnRElPMpTZhlhQzJ0sHlXbQOXnGysJl+Z/a+Np9Mrcbrzk
         ojiX5rQVDgwEtuy7G2WdrPMp6dk8ZjfA5LWfAi7P6ZHQjFknWbcUSIRbVsaOEbYaeZxO
         OeoBaCHO9drJmjD7UVJxRfw9D2ShiR8IECimjUvFTrKnQATHYtP9a7vUFFnzeRFdet7P
         hIsMHoQMepC4pmO89uw+/P1NVttwx3fJliz3q8AtC1eipgx4MUO5H32zHKy1xnrm2zKC
         xbYvScvBDfWcV5ed/af7ueMaUlf3zT77KvfSFv0nc0+QfEl1Hz6Gu6MFGDYmLj+I9VIB
         LBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959449; x=1763564249;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wst6nNXd42Vr+PMx8w7W2A4KJqYilImAVzMOYEyePA0=;
        b=wo6H0IpKW4jVEInYvy1Uo/eFupPHsDFWs7WRNa+RCuv4Bdsx75reIUWqNG60t0t4Pk
         TurfeoqDPaU1BtbmZgEnU8XUu7XHAJgY0fdVH3/Xyh1gBH2VzsIaZTY6Q1tDPx23Wz4S
         0xLyWgNv3E9MmKK3xX2YwcB59xz/Epa137ffdTTApZxkJWjOwbXGQ1l/CJySYOLtVLj9
         GFfRjzhAUsH5H095kLFplEIEaJq/U3sECAt4Ozzqj3+Z30ShyN5wV9JYsSml9SoXTa1A
         NPhNodLlbffYqBfVXNgvM4S21IhtLHrDWKlbWipuNjyb4qQlscTlkuorRhRHQTr8OPLm
         LpbA==
X-Forwarded-Encrypted: i=1; AJvYcCXj2r/mUV99ca5nFwsW9qYmsQXDxTzno7Mg9x5dmVPVydaCbJ6AONLNE/feDFQmIZBEdazeKKQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyU1MMyi2W/+FTPZjDFQ8WGE3CEan1aExHsruH4mE9coTliLCkt
	YY7fa5UyRsOhziMIiKoDWKKZAk2fcGuuiMyDmqTEAXW3tvpMe7lftBVBktF6OSofqwli7UkPNw5
	mm07he6UVVncD9QDoV7Go/eGdxjNspzWZiOPzkVHj08B8Xg8KO+m4QOr2DgoJXR8j
X-Gm-Gg: ASbGncvijEtnUvTaKqGY7Wy8YqqiNtcr1xG/QOo8K1QeD5eUk8loQYX9z7ywpNwN53+
	xAfNuHC/8+OH6LPlROWRzGiVUTvXl6yFLxJ+cy1O9yTGi9qpsBvURiFwwP6+7rz62PwUVWUVlQx
	uAjPnapHMfeRIfbh1JlpnFRY9A7C40aoln2nlexse9RTu0y/JfLJ6nocUMsglC1uJn8aCEOjoRP
	CnZ/v6pF2ZWPxFQjbtv0fWSsyS6VLr2MplQN2KRcT8zLRxawWhpc8joDyPNRhl4mcCRUrxhj5Yu
	oR99eI7/3u1DLifDs0lVcSMywB2Utl+OysqB8uKz9DltQUMvItk6n3xFFZbSEEHre2jo5u3vkvs
	HhvDFEvBOiA+V4ZMgd0GPLZDd//F6RUwliTKV6pOvIfXo1fqVwdaO+mnlQAg=
X-Received: by 2002:a17:902:da87:b0:298:39f7:2d83 with SMTP id d9443c01a7336-2984eda9a77mr53092725ad.28.1762959448937;
        Wed, 12 Nov 2025 06:57:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIS2fNUEslw41bjmc0ah2K/AJEjKKS8lOPbLjYMZp+W+TmrJ/5GXoE9DNajUyBnR8CDgj3yA==
X-Received: by 2002:a17:902:da87:b0:298:39f7:2d83 with SMTP id d9443c01a7336-2984eda9a77mr53092235ad.28.1762959448343;
        Wed, 12 Nov 2025 06:57:28 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dceb7f1sm33309725ad.111.2025.11.12.06.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:57:27 -0800 (PST)
Message-ID: <834e6ec1-0755-48ad-af30-2d6470a0233e@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 06:57:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k pcie radios with MLO support?
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ben Greear <greearb@candelatech.com>, ath12k@lists.infradead.org
References: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
 <f44d00bf-62d3-427d-a70d-29e7e325b8f3@oss.qualcomm.com>
 <75947d00-4b0c-44af-b887-7874077fe64b@candelatech.com>
 <4648e6df-08da-9d7a-63e2-d2b850ccabb4@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <4648e6df-08da-9d7a-63e2-d2b850ccabb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=6914a059 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GUbesZiWAAAA:8 a=4kodFeNbF9ItdmwXN64A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=-cUrBSrepuC47jtK_ZRV:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: NuOZaMscryDtt-d9sYTYBPpWhOIVN1p7
X-Proofpoint-GUID: NuOZaMscryDtt-d9sYTYBPpWhOIVN1p7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMSBTYWx0ZWRfX8wyBv9/Bs/jB
 3Qt4LBedzM9v/kzxe2LQPSm7yQ30ScOTBPh8MpY16n4wPVyJUN+nlRJpl5MJnjw458mW2066BmU
 TQTvmF6PERVvzlIVLW/Me7nRUDxeVjz/RrLQrug7QXLhnGG7EVwtp2mXSDt5hmeT1kXR36k3kHr
 scW+dGb4jqR+cPrItjzuTvinF2ugx/cqH2c4TafK7JahVcz1z/ttZDzjvPsh7LdfCsWERPvnh99
 jROTKavEt0TPs94mhGPnU0dnjkzzStVdDD1ZPAqFi9WbleSk6gKAnNdMrMxfWrGu12DQga/fvs5
 c4VRvhkqJXHOmFeD63X+WErVfukHqn7TjQMjohME69JvO3XxtYS17M6jBPIPaxD16JQ1qat4zS+
 RKj0u3uGU6vHNixDEDd9PZ/F595IBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_065731_128552_4FA48F27 
X-CRM114-Status: GOOD (  14.65  )
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

On 11/11/2025 9:15 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 11/12/2025 7:10 AM, Ben Greear wrote:
>> On 11/11/25 17:29, Jeff Johnson wrote:
>>> On 11/11/2025 7:27 AM, Ben Greear wrote:
>>>> Hello,
>>>>
>>>> Are there any current radios + software available where one can put
>>>> ath12k radios in (mini)pcie slots or similar and use those in x86-64
>>>> chassis and provide tri-band MLO?
>>>>
>>>> Last I looked, Compex had some dual-band radios and maybe single-band
>>>> 6ghz, but I am not sure those can be combined into a tri-band MLO solution?
>>>
>>> Most of the Compex modules use the AP-centric QCN chipsets.
>>> For your use case look for something using the WCN chipset.
>>>
>>> Something like:
>>> https://www.sparklan.com/product/wnfq-291bei/
>>>
>>> (I haven't tried it and don't endorse it, just giving as an example)
>>
>> Hello Jeff,
>>
>> Thanks for the link.  That too is dual band though.  I'm interested in
>> using ath12k radios for wifi testing purposes, so I'd really like tri-band
>> MLO to have some feature parity with the MTK 7996 radio board.
>>
>> Is ath12k able to combine discrete wifi NICs into tri-band MLO stations?
> 
> Yes, ath12k supports tri-band MLO STA. This has been validated for QCN chipsets.
> Not sure if this has been tested for WCN chipsets.

+Baochen should be able to confirm, but my understanding is that WCN only
supports 2 active links at a time. So sorry for providing a link to a product
that doesn't meet your requirement to have all 3 bands operating
simultaneously -- I didn't read that requirement closely enough.

/jeff



