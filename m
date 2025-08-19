Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2929ECA0EE6
	for <ath12k@archiver.kernel.org>; Tue, 19 Aug 2025 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcRh7foPygOroCMWDQ1NQA55X8vj3i+Vh6ZiklXfPo4=; b=2VetdygPce7S0F9RZP4xTDZ/aL
	O31Ca1798ZA+37XNrinDgi+yy9MPwgwJvjcotEK47Xd1WobKBcAx/lzWuLMyQV0G+d5h4y5gvGskl
	GAWYCOB46ZuiG9JUPwJLNyOhdU8fjCHla/uziNukTEqAQdkw2pcvY1Hs7q0TeDpjKhuGQUWn+nHk5
	BLznnePmAJbn6mT0vifEZhAkli4k165mYa+9g/GZW+DBio1+3KMRzM2SPoCjDBLLvX4WfhlkfP+0Z
	VTg5Ze7xEylOvTJuoa8peU4hcGSbqr54FpoSo3Zq9VYUqfNNRVcXd4Ms0N1gYbnv+qUvQRqHTXR1y
	Hwea278Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoH6D-00000009izF-3p1u;
	Tue, 19 Aug 2025 07:49:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGjy-00000009fgE-06tv
	for ath12k@lists.infradead.org;
	Tue, 19 Aug 2025 07:26:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J12lDa004083
	for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 07:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcRh7foPygOroCMWDQ1NQA55X8vj3i+Vh6ZiklXfPo4=; b=RYbwKzUwRrmywSX/
	8A4VfGjhdH+pruNnW+iBsYNQJglxCTERjGg+7nXlZqIGKgBy6qEykq29n02CFZAd
	AZqE3vaymEZ1+UJPnxT8NW26/wrfvCGOng36PK9eJjaMqh2lWmmu4OchTLgjxCnm
	qf/XCBhtNkBItWLHgL3iwnl7eSH6G2ctOGUwhpSaEGSc+fhLYfrVMQtS/G5lk9dH
	lfkPG6v3yX6iJGSj5uJH7Td7SxOhFn2M8Jd6s8oh2GRwfnL81Pa6T3V1Owu5G6lv
	B7SeD8qoV6zMWhDanx8x3lvNsEqr9h/MUJsch0nf27nzlLrNq2pwPxyfNoVXJby9
	4pkEQQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99qjad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 07:26:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so1814564b3a.0
        for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 00:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755588400; x=1756193200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcRh7foPygOroCMWDQ1NQA55X8vj3i+Vh6ZiklXfPo4=;
        b=iMCc1NBNLETbtnEiFjAlDAFvXwv0SN71z+Z6et1dZ6rbNV8W053spW71bWhE/BjZiB
         BR9LN9ZR5JbpisT0T3oGWlnwEJaJSST9ffjFn9/JsUjxU1lXHy61heuAkPlLYdIaf6Ym
         zpLyTC7ZjU8dca7LXXSFCOp1EVJi3biA+URjklLfMC6UlRIYoCQw/b/eVczVoKzgC/d+
         vMHWGCMNMArnobYmgV/2xpHD5VvwgjUC0tAyg62tpC1gx5QyhXO54sRK9uFnE0j8qhYC
         4P6TGGrnYU1Sx5HEOgrNEdYrU7adGfdDNkxRrRrG5gA1FsIvi0Ws9raWOf04fp79+6tk
         835Q==
X-Forwarded-Encrypted: i=1; AJvYcCXt3UY1MLYOpHzod3uIYLBap0Cw2F4LHDSqdOL4ETCsIjwc8no/ks4JRlyoeMu429Env16qRTo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTW+QV9OELBnW+tOWVwtyePtJfcKYiNjLdEfkF80MjOOJa8u+y
	WCcIXMwqzm+o92AcfJUWKT55RV6W1s5dP58jk/c+sJNoFRjdqZdsxPC35qZU2NrPLA6mAi0SS33
	Ur5ycZCX5dVhOyT2b3AlzM5i5OPqBBpqzNTPEOnmpFI5lLuHOhHd7OCD47Y4u/DSyx7CxAb2t
X-Gm-Gg: ASbGncsCEfXiPnNZwFgFAoSpvA6fSTGBYOCMYX9FKn4ydPZz2GexHy4LcZLnlNBoGQz
	U7B8IosVaFZ0rdVN7WmyiPgjZqfJ42CQURpH6JPIfXyneCBSj5KJjPXpzkYT1fu8VIpMSNz4l7p
	U/7WvdGYxyLEed0k7k4FZY5Z76HIoV2Vpk7VA7hhetwm4CP6X4gN9G4wIpPgVKU3H1oZRg+oOmc
	R8/0vCfiMhbRCqnZvUjDD348dC/3qnZGdtT1qkaE1DtUlgXl7aP2tfegXdsdmXdKvqWMH+qJKo/
	T5K090jZy3/a7rDb9mnaofm752MRs2acmyeVBBBuo7X/hwHPSx0APIAexSDZJXXDeANR98E9gvq
	ZbboFQ3SKFVugAok4DjN7mc4nOP2aIGTMXrrA
X-Received: by 2002:a05:6a20:6a08:b0:240:30c:276a with SMTP id adf61e73a8af0-2430d4753damr2032463637.39.1755588400257;
        Tue, 19 Aug 2025 00:26:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzseiVb89NiRC6C6yIK3eckisUcl6OaJcZKhsacw6pcx+RGiMXSxrapg1QR3zJ9Mo/cVVDMQ==
X-Received: by 2002:a05:6a20:6a08:b0:240:30c:276a with SMTP id adf61e73a8af0-2430d4753damr2032438637.39.1755588399820;
        Tue, 19 Aug 2025 00:26:39 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d13d312sm1637841b3a.49.2025.08.19.00.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:26:39 -0700 (PDT)
Message-ID: <ff8287fc-7122-42e7-b6ab-550576b5d599@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 15:26:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: REO status on PPC does not work
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <aJ7sDOoWmf4jLpjo@FUE-ALEWI-WINX>
 <d6f0b64f-1764-41cd-a7c5-fb34d034ace2@oss.qualcomm.com>
 <aKQg5vLUplzMUMlU@FUE-ALEWI-WINX>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <aKQg5vLUplzMUMlU@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Eak7VORwTjVT3JTppFi9lMWxNIx856E9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX8GTTKI4ZtMhw
 87iMiBpwxVA7lQXfH+k89QcC6t24wqyxMlp3pRYqu9XIuktW5zuTHNZZXv8L29jxwgJFXUx3IMP
 pUXCA6Z+ozb9tNJktaTgE3DTz+F+wyPHMlzjTFHSE7Fx2Cqu6z1gMvSJrlL+vM6BMKfQs/gbLfJ
 EAfvE7LzVKwp2eAgnfGSz/BcWrs/gcEqtlOY17vmRrHqp8R91DFtljwOzz2phTNT1d4mK2llDeD
 o2PwDIoErGweJR811oYAmZ9MbQeKf9g35Lsb+yrxt1XZ0cUIK4E6KjEFkH5SYiwkuoUiFSDg4ZS
 Qs3knUWekFTFRLXAmmx3iUKMKOIF/eXt9nIt84mulJvTnvmPadH88JEwKgVfKoEhNQ57C9gEpNT
 3/nauKYh
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a42731 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=cCZxINV-pdffXXtfpT0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Eak7VORwTjVT3JTppFi9lMWxNIx856E9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_002642_104449_6ACA9ABC 
X-CRM114-Status: GOOD (  19.97  )
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



On 8/19/2025 2:59 PM, Alexander Wilhelm wrote:
> Am Tue, Aug 19, 2025 at 02:38:38PM +0800 schrieb Baochen Qiang:
>>
>>
>> On 8/15/2025 4:13 PM, Alexander Wilhelm wrote:
>>> Hello devs,
>>>
>>> I'm currently working on getting the 'ath12k' driver running on a big endian
>>> PowerPC platform and have encountered the following issue.
>>>
>>> In the function 'ath12k_dp_rx_process_reo_status', the REO status is determined
>>> by inspecting memory that the hardware has previously written via DMA.
>>> Specifically, during the call to 'ath12k_hal_srng_access_begin', the driver
>>> reads the value of 'hp_addr' for the destination ring (in my case, always with
>>> ID 21). On the big endian platform, this value is consistently 0, which prevents
>>> the REO status from being updated.
>>
>> This does not seem an endian issue to me, because either of them we should get a value
>> other than 0.
> 
> Really? I always assumed the value remains 0 until the firmware writes something
> to memory and moves the head pointer of the SRNG ring buffer. By the way, I've

correct!

> already implemented the missing endianness conversions for reading from and
> writing to ring buffer pointers like this one:
> 
>     hp = le32_to_cpu(*srng->u.dst_ring.hp_addr);

I was actually meaning that, when hp get updated by firmware, either with or without
le32_to_cpu conversion, we should get a value other than 0.

So in your cause I am suspecting that hardware/firmware has never sent any REO status to
host.

> 
>>> Interestingly, DMA read/write accesses work fine for other rings, just not for
>>> this one. What makes the REO status ring so special? I couldn’t find anything in
>>> the initialization routine that would explain the difference.
>>>
>>> Could anyone give me a hint on what I should be looking for?
>>>
>>>
>> What hardware are you using? WCN7850 or QCN9274?
> 
> I'm using QCN9274-based dualmac modules.

sure

> >
> Best regards
> Alexander Wilhelm

so did you see any obvious issue?

