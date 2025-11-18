Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB4CCED25D
	for <ath12k@archiver.kernel.org>; Tue, 18 Nov 2025 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPufLjmIrqMLSLMrepnxIXEELbKqNgUquhm6Il1/jc0=; b=xcKVvu+fIv80QEQjdAV1mprNIi
	Wmrqj1hnELlydefurwgpVCPhWQVK8AsRFOOO0Ewd3DReBaDRfyGZnhoGWTsCRgUdQerNuB+dQtimW
	dUZfgc39s5yl3P4m56cBLaJ74/K1ECRuH1+iH8CaQhH/FlDGZb0RepTyR6zxTZ+EitDmP74gEJWms
	8c7cATNBiqp+6ZvBuTDYtfKkgGRYzPA7x4JRbGJE5kVo4GdXM8J6NdT1OZocJSMaBRcRKmNLlM5eV
	8csBDnCxc/YFLMgOVzimlWCS8cfcbHAHvj2YGfYAVCoo5cZmsXsxF/YF6tPai1uiff4hLSZPg57Ov
	ZRObmWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIPT-00000000Byi-1sX9;
	Tue, 18 Nov 2025 09:54:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIPQ-00000000Bxz-37Gw
	for ath12k@lists.infradead.org;
	Tue, 18 Nov 2025 09:54:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI3aPgp375955
	for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 09:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPufLjmIrqMLSLMrepnxIXEELbKqNgUquhm6Il1/jc0=; b=V7vu4MPPTc3MaEmF
	3FV9hDq70X+vOOx54C/DxqWzFkfrTHOZpShBpGHFdVx967BSFAUkN9MsDyYfrWmB
	bcjfMTeg/DJoIP4XFg/yX26MVub9Tmnw0mISKwxy2gq8HI4Z6erNHKS2LZgtVKkV
	ma6upZyo4l9L22HIFlR9L+2tY+CEpPOEqmPi3/Z5AqSR81r4ldxxxQhdna3ox8p8
	EdYkikX3NIXD8I6acAYxMauu1FD9L3E2sp86LG9ONJqruQJAujAEd6AbRwAthm8i
	YqKDg1Ff49JSzq6brg3Mem8AJNJIM1YxJI9uMowroX2RowdaYdH8vggj6pSHyZAE
	KNnQ2A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njpsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 09:53:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso16560402a91.1
        for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 01:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763459638; x=1764064438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPufLjmIrqMLSLMrepnxIXEELbKqNgUquhm6Il1/jc0=;
        b=WUQBVbWwWrwg91YvW8PIrF5HOdY7o/9esobtnDBFVGUgazR2SqkYdYw81vxmreeOQd
         /+3EEnSaUmkUxe3gJ6BeM7+mfp2vPAODJj+dTovHyFk4hYXosoPUSj0iYMrQMHfV9CuA
         6Wa2mhLw95IA70Z3uSbLaAo226SKHOqIeK9ceIPoOsPOlpLT8SocxASAP9qPWgC2fw1D
         p7AFfLI7HW/r57aYUqU6qMGQa9JROxSGe4UpyjMeWZO1DlJ3AkZ7RjDI1oG2yMO3xwPn
         LqAKsXOhxPdM084MqdC8RgNqxcenLBr0JSn/9TNdpqRYoDMgAuSoLsYOgWNlztdHvL8R
         dKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459638; x=1764064438;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPufLjmIrqMLSLMrepnxIXEELbKqNgUquhm6Il1/jc0=;
        b=Xy23D8ZNjNYCFCD5ccV4YQGzkUv8KGQEaTnkO8SDiUzAtGy2Kgt2Ms5GBgB/V2C2PF
         OZKMZ5DzD8zM4PzYCLmfaR4UCncWbZhL6h7J2+DH9ugcf0CirnekNAp74fFtUHjWE3Eu
         ms9QBpMPU1GfpRk3hEa82PwvXOD7SSHVf1Os1HVKAg9HOZPA7eww4IOCQuLHysum/HEr
         nYTCnRpYw9Vk/WI+x0tNhsvnW8YNdyKqD4gSrpUC66U4nsbZjJw5SCgMl9DOEr7BdzIL
         9S5in1ykOMNpHMwHCGrndx+CpakFRu03jHqRyV3S7c3v2MmRyBPDbjyKbNlidCbDfhqN
         1QpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4/IL8xBUSLmB8ZIQOmyshqdAgbdAXFc1nrUENtputhjno+jebVyQhiKUtWtfSD4PsxOs0TAU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2fe99Ceoq9YpyzBqgR9bDX6QqR6qPvB3gpjQZW9qurSBq0W9o
	ZupVEhii/JSXElVkIvxXOiqi/7Lh4dR7KpNRwVLoTJ4qYqj9Jm9mo06i8zosYOmZqJY4RDf84vy
	fRlNBT4ls1UvnFSgab3nkr7uwm0LEHm/p0JxK3jCTTAOqfBUkco4w3A8G2JXvAVmN
X-Gm-Gg: ASbGncvyGL3gpXHGGqag7MTy/YW9Bikyzi1awFylWSDynKnX+Wuu+hUSr360u72j4Ah
	shkSvFY2oBcT2GZ9G4u4LKg3eM3dKMAI5T1oNaS1jWe4kMjWZQnyzWnBOSUGjjcC5BnamR1yUvD
	rEsKQHi7DivITNqlFyPUcL61hVU0K+34MHdRxeIs1aU/VlHnwDtcDmlHPF3ukKGJHTu0ZoSOsn7
	g8OtuS/hEnAcRgxAjGYcRaWk4egQdmMp0eKMHxr2HX2qsW23JEwk+LtFC7dR0WzRt5HS/xUKkC1
	5tnISo09t7yHhO2vkATh4CpncY8NZygG1zdNb4k5yZEW/17b7FU1UjlH6HyzpSGrSZR3U56BZdY
	9EguAoc8o8EtcJ+S0PeIbzednVv6sZU1pR+Ifc12uMgCPtbbGXvmqFWaLaDVuvllO+SbV8ryY
X-Received: by 2002:a17:90b:4b89:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-343f9d9116fmr17829701a91.3.1763459638601;
        Tue, 18 Nov 2025 01:53:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoeE4yTWrswRWzDc+hCOps1oXPq1aDH32AhkqgBFvLZGGTCpqSrYv/TJJihXrjfjuRDAJWJQ==
X-Received: by 2002:a17:90b:4b89:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-343f9d9116fmr17829684a91.3.1763459638174;
        Tue, 18 Nov 2025 01:53:58 -0800 (PST)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c22b1bsm15751738b3a.66.2025.11.18.01.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:53:57 -0800 (PST)
Message-ID: <ddd31f03-8312-4e42-be97-2d2e1b390c76@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 17:53:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix endianness handling for SRNG ring
 pointer accesses
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118072123.19355-1-alexander.wilhelm@westermo.com>
 <5a308d21-d463-4d6f-b5d3-95a0c2ede2c1@oss.qualcomm.com>
 <aRxAa8OYCZqEx7Da@FUE-ALEWI-WINX>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aRxAa8OYCZqEx7Da@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3OCBTYWx0ZWRfXzLPdr7iuLGbl
 TLD7KIqYmmFyUYpReF0zBIzFR79oRqmdlls2us7NKD/3/1r2tO7TARjpxv71uKU7bPH4wLR7WK8
 +b07xYEJhbHBO/2kaESq9pEDA+5smjedXkqbeh2NlJ36sdtEAPL0tY8E0lQNVWCgVcQVr6fIeKb
 aF9vekCpNPTv/Gt5H+UXoFed09+SVYLV0tlZ0v20+GL1HEZYrmzXDGmb6k3+8KSylALTrzHzPms
 uK0HSwd3WnQ3zxOfNezDyUCobSu7JBQ/Jgh9ux5w8cGXGvvw2xNTGvoQ+Jqvb/hE3qyGQkQ8hqA
 +edesMzRPo3gMsJjXyWkfSXM+FLaezDS/lb0wyK4or5yd4lrMwNjHSjFLiHfrdlzt4b0M5/vuBN
 drgsrviQCoxIc3BXp04bOx+RynJTFQ==
X-Proofpoint-GUID: yAd3i4WBDeuBFYAa-tqVAhex7kqe6n5-
X-Proofpoint-ORIG-GUID: yAd3i4WBDeuBFYAa-tqVAhex7kqe6n5-
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c4237 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=HCAvJRNLDqgM5c4XLS4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_015400_914952_F09E645C 
X-CRM114-Status: GOOD (  16.54  )
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



On 11/18/2025 5:46 PM, Alexander Wilhelm wrote:
> On Tue, Nov 18, 2025 at 05:35:09PM +0800, Baochen Qiang wrote:
>>
>>
>> On 11/18/2025 3:21 PM, Alexander Wilhelm wrote:
>>> The SRNG head and tail ring pointers are stored in device memory as
>>> little-endian values. On big-endian systems, direct dereferencing of these
>>> pointers leads to incorrect values being read or written, causing ring
>>> management issues and potentially breaking data flow.
>>>
>>> This patch ensures all accesses to SRNG ring pointers use the appropriate
>>> endianness conversions. This affects both read and write paths for source
>>> and destination rings, as well as debug output. The changes guarantee
>>> correct operation on both little- and big-endian architectures.
>>>
>>> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
>>> ---
>>>  drivers/net/wireless/ath/ath12k/hal.c | 35 +++++++++++++++------------
>>>  1 file changed, 20 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
>>> index 6406fcf5d69f..bd4d1de9eb1a 100644
>>> --- a/drivers/net/wireless/ath/ath12k/hal.c
>>> +++ b/drivers/net/wireless/ath/ath12k/hal.c
>>> @@ -2007,7 +2007,7 @@ int ath12k_hal_srng_dst_num_free(struct ath12k_base *ab, struct hal_srng *srng,
>>>  	tp = srng->u.dst_ring.tp;
>>>  
>>>  	if (sync_hw_ptr) {
>>> -		hp = *srng->u.dst_ring.hp_addr;
>>> +		hp = le32_to_cpu(*srng->u.dst_ring.hp_addr);
>>
>> should we also need to change its type to '__le32 *'?
> 
> I saw that in the 'wifi: ath12k: fix endianness handling while accessing wmi
> service bit' patch where '__le32' was used? Which one should I preferably use?

I mean, should hp_addr in hal_srng structure be declared as '__le32 *' ?

> I'll change that in the next version.
> 
> 
> Best regards
> Alexander Wilhelm


