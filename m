Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B87ACD3421
	for <ath12k@archiver.kernel.org>; Wed, 12 Nov 2025 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYmYcoy5tPrSZ2FQmuyPLZqNcD8LSC5O1LMBQbiQio0=; b=MrqIKPbNYmc/CHr0DdN3bSOr39
	sJ4RtPACs+lgrFhFSokUY96Q+skN35Kd5Qu97ULDKgc3sIrdgOKHG47UGC9/hBdNpMYvyspqibakj
	aLNxdy8Howx2QiSC8jDCfZEBQtIRdE+jt8S1ziBxIo8JXYdrR40SmmVaP8vP3l5SiMH/m0Aq7oPGu
	IlsJkUBzUi4mB8TFlGzroprW7fmsnhBHz3OjHac6MWytL2tzoKhhQJ3YbZf3opi4VWzflAARcw2cn
	zOlz8kNok0UKdyXrPEmTrwcQqIUK5re9aL6IJnxdkVKAaKsjAK0URCQUJCGR1hFxeV6KzkQeXU8/I
	bBgVFwEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDew-00000009AuK-3Tk5;
	Wed, 12 Nov 2025 16:25:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDet-00000009Atu-3ktb
	for ath12k@lists.infradead.org;
	Wed, 12 Nov 2025 16:25:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACFweMi1814064
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 16:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYmYcoy5tPrSZ2FQmuyPLZqNcD8LSC5O1LMBQbiQio0=; b=Q5GEq/rriQ27uQVo
	9GAXEy/zh3Hdo6ThMzDBjZgXDB659RDDlMP0XyNdriidNC8tBthiu1focZIQwCDD
	R/Bdu1EGWhQc9p1Nd04xawt/KHlIeQdf4HsAs70HyvoWTVSYGLikt1fL09z9jk4C
	zTwtn0XvvR3tggsqZ0inEMhvHKdQTYizvFHrWEWe/VwUL1EHqx/uKJucYWvpFc6L
	2MZZeeagUc213pqRdUofV6TU7hRYWjQe2kFff3mimxQqz3MGgrLQgcr2ub8AJ8q/
	yGd1lenOStK7fDcGhf7TdX2HMDTUcGdgM6mg5L7+E3tNLKUh2o6lKuSwb6LKvhVw
	mtTVBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwbpr3ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 16:25:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297fbfb4e53so19376895ad.1
        for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762964721; x=1763569521; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYmYcoy5tPrSZ2FQmuyPLZqNcD8LSC5O1LMBQbiQio0=;
        b=QC7yY+S7IoyBaq3MQHayhbGzKvKoF6ss6OZ56O0WOVUUnOKvbJiVc6sRPh5k+vAf15
         Giqsc380NUf92In/5BsT1/yDjuADiCSvrYNDtOgvdLz9Jt4K7mhijCsGrNmJdwGKHeSE
         x3GBSSGE+/xuY8JuUJrUjI7+6w0P6jLoEAJP3RW7iTe24KtyuDutqXfDHp4o6t71LMPQ
         1mAfuz0c9M+3Iz2ksCLrbNMNRxPq/5Y0HBB2u2PfAtflIo2dgxXDcLEF+bgz0sz5Vmua
         3I+xQLUmnGQ1+YdplFzMOsY+UdsPHw1DZn694KJiIewNr2m9Y3FS2+frRBB2g0psTA4l
         ivMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762964721; x=1763569521;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYmYcoy5tPrSZ2FQmuyPLZqNcD8LSC5O1LMBQbiQio0=;
        b=XfuqT4lF0mTNk0TnBKTO2iYmEBfqcaAP1IeoQ1AS9Hg+UT3X/iPu2Qa7lv7SoVQd3d
         IQcDJCWlJFYAj40+yXxKswtb1CkUAndtHWVoh2MrRgqOf3ywBQTAWoZUQSQchyW75O57
         5E9oYaJyHVAqveZVE/nVZomekEZHlBdNDD7c7uE4MX1o15wVRWbH39QGULcHUfmiZuhe
         XyqVcvgu6p0a6n8uM4PPwNFzXhbCoO5fo2oxGiX8qUbb5cHNT0vDTC3nhMJZF2B5JlIk
         2+MFWA/W5ul0HcFkSLZQz8VpgrUQ86zAxBUAFjccauZyo1LuHMwz1MHNBbNBQqdgbWIp
         sbhA==
X-Forwarded-Encrypted: i=1; AJvYcCV1/wL10R6vlFHz/5VIF/FxOD4FYsVFKMyQVTTScyNrIJJoxs6ajow92wYfKfZP0We//jhoSwE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyK3IZYLV0fiiwXvRrX52HziqjWasvK0PgnBX0rtI7xUX9eG1mL
	WOU1fbtWzo4Ejebs+arG528RqE5PCmr7uRmbU/4JBa/QgfYmNd7+VzI+iJMh4Xkpw9yDAoJTNE4
	EAz6FDiqiOD2WyWJ6MzWcgaqdbeld6JX5Qtt0GGaW8tQdhZ2uA6XJ7L1ha25s0RfW
X-Gm-Gg: ASbGnctnWq7mrg8JMX9ZZIw0h/hmQuHbwgw2T9+q3uUgbppXZsd4S6w9qN0fPge4TX6
	u09iljqqN/WTtfzVYNDobyje8Z2sm1+ZDhZxlWg1F6mVK0JRcX12aB8ipB6fLICJtMhQ9mSXfBs
	T8CedPuy4wA2Av92Hr7mtSgiNacZRSWYrSP16d9GIbmd79SwU2pQsHwpn7+wJ2+2b2Gdl7NfJ6r
	yANiMXbAXT9RXYsh2MXc1PVWCPGukUBrnWWraPc4D0vcURTVNJCxQfM4sHqKLFDXJZ5Mi4KdW13
	celMw9/AkDat1wRkL//5aaVZI4ijd9QPQtRzTA/PdlQbiTM/+vhugAZB+auvoM0jvZhAaaGVaRD
	88B6cZyeQOAZYHYpSWcIbJAbC1UG4Dv50KxrOTdhhm8EDbX2p4Q==
X-Received: by 2002:a17:903:b06:b0:298:45b1:89a1 with SMTP id d9443c01a7336-2984ed3007bmr52804325ad.12.1762964721379;
        Wed, 12 Nov 2025 08:25:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/Y6MLfsuE/97tFGGHZUnZbWh1ntElsQyCO2mB64fQvSczt9cG4/87m4QKMlFKcnbWWCXAhw==
X-Received: by 2002:a17:903:b06:b0:298:45b1:89a1 with SMTP id d9443c01a7336-2984ed3007bmr52803735ad.12.1762964720748;
        Wed, 12 Nov 2025 08:25:20 -0800 (PST)
Received: from [192.168.225.142] ([157.49.96.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcea628sm34826625ad.104.2025.11.12.08.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 08:25:20 -0800 (PST)
Message-ID: <e814e4c9-83e2-221b-cd3c-16d47ce98b2d@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 21:55:16 +0530
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
 <4648e6df-08da-9d7a-63e2-d2b850ccabb4@oss.qualcomm.com>
 <3f43654b-3fca-4020-8393-d028991edba1@candelatech.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <3f43654b-3fca-4020-8393-d028991edba1@candelatech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NvjcssdJ c=1 sm=1 tr=0 ts=6914b4f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=p+jhRS69dh+xNUt804AExQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GUbesZiWAAAA:8 a=VwQbUJbxAAAA:8
 a=ubSEXWh36lVi9Daj-xMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=-cUrBSrepuC47jtK_ZRV:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: LL2EyHiJL74w58Gu21RuJnhQDp06URyp
X-Proofpoint-ORIG-GUID: LL2EyHiJL74w58Gu21RuJnhQDp06URyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEzMiBTYWx0ZWRfX2DNYhpwV2100
 oC4ZKZr+Vk6JiJyl4PyiW7rZ6veaHaGA3ZoHW1nqt6WftNSA0RPV4yIEwy/hOzB9rTlI0e2Rv6x
 Q6c1YBROlZYgaNFw0ONIzb6pr8VriKHaXKmi859OJX7B2GraQQGeFSKk7VSNBIVCqibqU3vEsH8
 U5Eq1BSc8Ot6U1K5GC8+hgvfn7tXZgZCE+aV7hj0sUed5kAYtrQt3NdZw7VqIN9K12kieqvOtOA
 cC6jcElAm8Tnu8ZOsADFqvC287LuUridXP0ewujxipbs3nRMLzboGoqtK0yjA1Toc/bETwVPIRJ
 QsmspkEDZNHZ3mADA5LKfrIf0jykjlgUZt4R84WR95lf9pxaU7XAhiUGmG9wTLYVQpDfDa6Iu5g
 zO0H6xU64Oj76KTlxZ/dn9LdQj4LtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_082524_065720_8767C42C 
X-CRM114-Status: GOOD (  20.55  )
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



On 11/12/2025 9:06 PM, Ben Greear wrote:
> On 11/11/25 21:15, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 11/12/2025 7:10 AM, Ben Greear wrote:
>>> On 11/11/25 17:29, Jeff Johnson wrote:
>>>> On 11/11/2025 7:27 AM, Ben Greear wrote:
>>>>> Hello,
>>>>>
>>>>> Are there any current radios + software available where one can put
>>>>> ath12k radios in (mini)pcie slots or similar and use those in x86-64
>>>>> chassis and provide tri-band MLO?
>>>>>
>>>>> Last I looked, Compex had some dual-band radios and maybe single-band
>>>>> 6ghz, but I am not sure those can be combined into a tri-band MLO solution?
>>>>
>>>> Most of the Compex modules use the AP-centric QCN chipsets.
>>>> For your use case look for something using the WCN chipset.
>>>>
>>>> Something like:
>>>> https://www.sparklan.com/product/wnfq-291bei/
>>>>
>>>> (I haven't tried it and don't endorse it, just giving as an example)
>>>
>>> Hello Jeff,
>>>
>>> Thanks for the link.  That too is dual band though.  I'm interested in
>>> using ath12k radios for wifi testing purposes, so I'd really like tri-band
>>> MLO to have some feature parity with the MTK 7996 radio board.
>>>
>>> Is ath12k able to combine discrete wifi NICs into tri-band MLO stations?
>>
>> Yes, ath12k supports tri-band MLO STA. This has been validated for QCN chipsets.
>> Not sure if this has been tested for WCN chipsets.
> 
> Can this work with some combination of Compex radios in an x86 chassis,
> or does it require some integrated AP style platform?  If x86 is supported,
> please suggest some radio model(s) you think will work.

Supported only on AP platforms where the QCN devices are connected with WSI
(https://lore.kernel.org/all/20241211153432.775335-2-kvalo@kernel.org/).

> 
>>> Or is ath12k entirely DBDC at this point with no tri-band MLO capability?
>>>
>>> In addition, back in ath10k days, I was able to get the radio to do up to
>>> 64 STA vdevs once I put the firmware on a diet.  From a quick look at the ath12k
>>> driver, it seems the limit for STA vdevs is exactly 1.  Is there any somewhat-documented
>>> way to get ath12k to support more STA vdevs?
>>
>> Supporting more number of STA vdevs instead of the current 1 STA will require
>> firmware changes (and of course more validations).
> 
> Any idea if QCA is offering ath12k FW source under NDA and/or for some price?
> 

I'm not aware.

Vasanth

