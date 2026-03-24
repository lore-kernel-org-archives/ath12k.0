Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7021CF54ADC
	for <ath12k@archiver.kernel.org>; Tue, 24 Mar 2026 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH3p7oqw65C+TvouzT3PZ3SKKvj2KJZ564slVZs5r9c=; b=Br88WYBVbWGKbobGXji3X7jCmN
	gEHrjxJNGqYMaS+dIH7bIgVIlIyAWKfR7ZWhPQRILdDk74XQGcmb5MOzh8mIUovN8msLWSbjQ1ewz
	A8yuVTIByMbfAlYpX+dd7MNgdkGUoiVeR9qHjOE78S4yH3aJnSzD2y8G7CjiQZGJigmH4RuU6FGZ4
	a8qJMEgjKFtDtHvMWiG4eptpqkJ26VKXka2tUkNh7MU9E+x3qG7Ry0wZ0f/gqhfcrHelnbadM6JNP
	hNyynusw//inSwYTPo8boCV2oitxWO/eAWYEOpm6wGxo4iGEXFcNNObFew3MMtN/MEVlx2q58VsTa
	UptgAz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w552F-00000001w4B-0lS4;
	Tue, 24 Mar 2026 16:55:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w552C-00000001w3m-2LYJ
	for ath12k@lists.infradead.org;
	Tue, 24 Mar 2026 16:55:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OCqlOW127807
	for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 16:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oH3p7oqw65C+TvouzT3PZ3SKKvj2KJZ564slVZs5r9c=; b=T1em4mfKhuE2Qi0b
	FuglRXnjshCzV7wMo0wC/IR66y+JCgLdArrODwFpxlBmRUQd/qen+X+84FS09kP9
	KgLvRCZJEv6fddGcXl/kxQphmhi9YoguY1xOOaZtzMbG9HTS1H26gWGSvkc9ec42
	OaqieiLpepzw/Uj0sUjIyo1fM3w4IvMYWuOtu6wk7ar0vFspNAZss61ViaKQ/c1A
	lhGkRiJnK4eu8tMW4HZfHACa4dZIU1TA2aQcR0cGLxYRIqrz9I0dk57Y7SlkZ2kp
	D29fpnrm/wKiPRcVJxz9W09qNt2Uo8CS4f4SRbD84i8oHXulyYMPp1qblGCA5TkN
	GiSysQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m0yhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 16:55:15 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1279caef718so1733033c88.1
        for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774371315; x=1774976115; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oH3p7oqw65C+TvouzT3PZ3SKKvj2KJZ564slVZs5r9c=;
        b=CpPS98DyKj19XBngCtp+h94iDlwMuP2pHw46TTq/b71axzb3QsIUjPbP4d8vc9MN+M
         DIPSOQKkZEcuY/RoLGVLRJVX0hwhfrre7D/dzRbkEuPOO85iay1djR61AnS9GpbrEPGN
         ZJnTQj/yxbvYYC9GARG5IMQ/XtPLf0aC3mhQSTjCZAlYurlkKGPY3+e6MEdL6yPNJWwi
         Efpdrvq+KyeUjw+OxneJb0s4jOKrUbCBWJ7Z/A8BXesL0q0vC6p3LFsn45LR5bP8OMHF
         llRhTGdem4zjr1JJPIs8s+4880rvdPlNam3mphXzdI3jOCcqS5Dk+82vNVuHWhcgxlnD
         8zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774371315; x=1774976115;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oH3p7oqw65C+TvouzT3PZ3SKKvj2KJZ564slVZs5r9c=;
        b=Qh30OSka4yoHv90M+9QBNkUEJsAb8ODYoiz0jNsgR3pni/6kA9G5mQjd4iic8xeKBx
         SKYueRtorFmO2n11BKwm/f/Z/ZVyznPWIs40CNf5WltmckK1gZVKGn1QFRBEM7EOmzpS
         sNa/P71dK1HkoQizj7xm+1oXQ/qgsUCznsShQ8pPov7kGzI6U54nIKPhtXlUm1iHgxRa
         Kam91R9UUsU7VSlkWx1AQNK9oUlG1XfmilQGOXCaXsWuaoGp8qSLYS/2fQ+oqteqd7ia
         kYok/ALfSIDWnCDqkUJe8ciRkqpzYKkQotpzKNQ0T24ASxhA9RsN7KMRlC6BMGihp796
         XSyA==
X-Forwarded-Encrypted: i=1; AJvYcCWCyfFPQ5VVqnLfjN3W/nxGGq4rmci27/RfBDl62387fgipGYJOkxa0HNXU+AqxviZw4SXRt9w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+EnShHQGy3jj/l0JRKVvga6ZcCj6HUFuySwMUmEVXgfCncNPj
	Kx9An2fobM7neExrXlBmNbwKC4wn6fODEWlX5mvw2NmTNcG+ba31M8bNqAN8L6dp2fPMagdoM+4
	l4x54OCFxDomr1MNs4VEi12S8WTq+2W6L/cquVASWtlpbPzzbgJ0K4mg3uTDTGGgsFTxuJ4gO
X-Gm-Gg: ATEYQzwogwpRdY0hq664AsDytdk07nOFEuOzZXJBR5UEXNgIU5tlR5CnK5k2W/TzDpx
	YXmQeLZnFAgjRhn7TjpUEUUqYgeTxAG+eC5Zrmmy4+nbAWjU8vBwf5cNju/L2E39K/w5IISwSKp
	3Yc6EnN9lj9soQgSXVp66xAQ1kULwEAjf+WvkUXV6Mo4KhFMlujxrkD91lWnewuJsQ+bopdJX1i
	K2q4nTM1gfQMqtp4NRj4i15dmZIVFNomxl4tyVJldgPD8MLKyRFbnC1KXL7hQMdqJ5Aoum4DYTO
	4mokLGiqIDbzSwoCN6rkDQgOy4Cg8AMzMLR3oYtAWj93Z64PYeGusKOguQdl4+DD86KtP1YBD7g
	tXLjoOIGEEDro6FFZKF+/hQi88+hpPfXnntEcPhdn7O08lRbuGdFBumyCQAA8h2Cd2vRdiSn71d
	77Lvqzyg==
X-Received: by 2002:a05:7022:6ba0:b0:12a:6c4b:9cf0 with SMTP id a92af1059eb24-12a96e49128mr140457c88.3.1774371314779;
        Tue, 24 Mar 2026 09:55:14 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba0:b0:12a:6c4b:9cf0 with SMTP id a92af1059eb24-12a96e49128mr140434c88.3.1774371314152;
        Tue, 24 Mar 2026 09:55:14 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733fe80esm14392212c88.7.2026.03.24.09.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 09:55:13 -0700 (PDT)
Message-ID: <edf86c6a-fb09-4524-9b47-3061c3d6e68f@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 09:55:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260317084740.3756880-1-nico.escande@gmail.com>
 <36c1cae8-d6c0-4432-bc8e-57216c5ea3fd@oss.qualcomm.com>
 <DH6U1JMUQXVM.287BFERLLK9KK@gmail.com>
 <40756be1-6a9a-4821-8c90-34f37db01e8b@oss.qualcomm.com>
 <ec266bec-c371-4ec8-a60f-21ebb810d38e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ec266bec-c371-4ec8-a60f-21ebb810d38e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c2c1f3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=FbE22GNBz-Vxc7xXROQA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 7UVuTHQZUM_O0rtQJw9uEKZk7fVAFeix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzMSBTYWx0ZWRfX5npyjI2UYpqR
 U0Rghm76AIwoPrszTwMf5zTQG7MBqNEFapFZV+GlpuaZNYjFa180y7Qr+tugLHcIiOtkbtvq1XK
 Xq4DacRk5nNc2Dv/fYD1apERb0c8iD53YVXHmsyXvIDCk+P0mv6IyVFiUw9eS2EC8TAAJdHlwrd
 efPoBg+CBqrenuEQAYKpZm3RiRsSYkw4ETWEefC93EY1V+dEF6gmWO1XfywcIp9E8NhJaKoU7K2
 vUHKwHAbhh2Hff7PJ4RIMAi/qdZhDfE1of4dY1u1oDVr5rGpqhwGHL5QloNtuuqSpFYSARP/DYU
 GtgpwpoVIYaI/EOpJfw+ZOWlU8XQ5s2+7U5YKADNsi95ZSlB3Y+AG35t8PPPbGWDOYpN2iwpqYh
 bwZUQJppL/4TSobHWdRdMiU4TOBgxEDph4g6ZMDYhFvjMojb7lzxGMkuGMqcjT9Cis1aky4wayG
 4z398OLfEyFjOnFCpEg==
X-Proofpoint-GUID: 7UVuTHQZUM_O0rtQJw9uEKZk7fVAFeix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095516_608018_4B7190A1 
X-CRM114-Status: GOOD (  17.52  )
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

On 3/23/2026 5:40 AM, Rameshkumar Sundaram wrote:
> On 3/19/2026 9:29 PM, Jeff Johnson wrote:
>> On 3/19/2026 7:35 AM, Nicolas Escande wrote:
>>> On Thu Mar 19, 2026 at 12:08 PM CET, Rameshkumar Sundaram wrote:
>>>> Or may be have this allocated on first device probe and free it on last
>>>> device deinit ?
>>>
>>> That seems even more involved. It would be easier to go back to the previous
>>> version and simply, alloc it once per ath12k_base
>>>
>>> What do you guys think ?
>>>
>>
>> Going back to that may be the better solution. It isn't nice that this current
>> solution may allocate memory when the driver isn't actually used. But I'll let
>> others on the team weigh in as well.
>>
> 
> Yeah, allocating once per ath12k_base is definitely the simpler 
> ownership model.
> I was only wondering whether sharing it across devices might be worth a 
> look, since this is per-CPU scratch space and the table itself is fairly 
> large.

The other alternative is to still have a single global allocation, but also
keep a reference count that starts at 0. when each ar starts it calls a single
api to alloc the memory and when it stops it calls another api to dealloc the
memory

when the first ar starts and calls the alloc api, the refcount will be 0 so it
will allocate the memory and increment the refcount to 1. when any subsequent
ars start and call the alloc api, it will just increment the ref count. on
deinit each ar will call the dealloc api. this api will just decrement the
refcount until it reaches 0 at which time the memory is freed.


