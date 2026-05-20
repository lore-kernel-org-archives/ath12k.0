Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06497CD4F3C
	for <ath12k@archiver.kernel.org>; Wed, 20 May 2026 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3v0ddjTLFWHRUmSNG386fenlZAxbP9sRhkIsLs/UysM=; b=mzYl5w7HsgdpIHkO7xQz9JSY+e
	XxCeXvt08+GlYUsY7YvXcpozfAkrEig6VkkcOC3VB/qmCtnxVVplekwfUoaccgEM0G7z1la+xiUND
	SSY6nKb25WijFfC/eJEMnKUUsFGogJGELSFJ3JQ05tr5Ilxzq1BgaNTqJQgIY8CWB015yFxPAV/VB
	rWt1M5XPmc4WkgbtzKpnqGaRnOI/c7yIknF1UhithdATrIiCKfL0VYsNn6kyLFSH4zB+/32hJZKyQ
	0LiM5Q7UE++bTm3DHXJCeJuqy5LSMjYZsxk6n6iVEsYbxmw3ntHzdHGPbstDXC+FGSbjhcBD06SWi
	edgvqx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjLG-000000056Sf-2o0l;
	Wed, 20 May 2026 16:00:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjLE-000000056Ry-1rnZ
	for ath12k@lists.infradead.org;
	Wed, 20 May 2026 16:00:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFfCc963957
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 16:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3v0ddjTLFWHRUmSNG386fenlZAxbP9sRhkIsLs/UysM=; b=YpPcgl8/59Ft9wWj
	bSXO1rr2pxi6VmVrbC0AJFj7WP3govC6hvlgkkk2H4DnFM7+95QC8nNZefvspzkc
	eHkDX/jvG7nQOJeAOv8Ps7LihXv8xS9Vo7gXWvSE84YmIIupNf4qzT14QX0wOfn+
	I9RAbZA/dOoV9Uk3SJZaBH7dshAgXKUfS3dbFNY0xKN8TTRGGLa9vb88Agn4oeIA
	TAFrxmQG38LFSnEhn/8s0JdEDUN8AosMMPT0FKPNcBskKIe7osieVZDb5oj3xu+b
	zeL8eAXNySNUHZhAP2dNHwibezZKdgXPFBN/q7K2UjclCPMH0wHpXNNnUiYeo/wQ
	e6VS9Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh0eh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 16:00:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso6171186eec.1
        for <ath12k@lists.infradead.org>; Wed, 20 May 2026 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292814; x=1779897614; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3v0ddjTLFWHRUmSNG386fenlZAxbP9sRhkIsLs/UysM=;
        b=O9ArnFXzlV/RL73OJ7S9rCeczXfP0DwQnPNJ/BdYB2awgjVBAUN4SAvW4/39CwmMEp
         a2xGvpakq8bAFW/BKd1fYfcz9JkaBJutGYWmC0dj/XAICRaQjmFIzoh2mob0CRlCoVKo
         ab/ZLX1kUs+WQefzVEsnYTwlgtbnxy5qqrR+i4mlumqrcxk1rfNaN2qtnqOqypzXgxQY
         AKeWIxOfE8t6Z95F6KOEuaedSp0sYh29Xf7fB80ag+KT8jZ1lsFTXaEdZrO54V4ZOrTl
         OZJWqntdOFBwclv6tnojTZhWV2yO9ApSttJtmFBOCr74qQ1dG/HnmhbpwL97/oGbzIj7
         e1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292814; x=1779897614;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3v0ddjTLFWHRUmSNG386fenlZAxbP9sRhkIsLs/UysM=;
        b=XhzYYT58RzHlqmTFBG673XoWUrbh2mKThKff1JJ+LR7gbuWP7JZHJT4K1quoMsmx3X
         BQcBLSAPr3QpxY5oh2cVV0m/SAKKr1CC0wGwawQ1caqoFWI0Vrz8lfTYhJvCtBBdGStM
         m93/HAlV6KHiCWUym8xyOrtj1Or/wUlBAvPDE2eoJZegTZo8FfiYwXbrpTSuKSCnDHvM
         TiOEgTnpZq8UuhHs+YVF1fwBG/WQHfinS05xNRC/A6jKHcImni+eiGtbxr3LGzoclWJ/
         Ak0ZX8NZZ97m9JDW45PcFXNiKPzf48cliiUZLWx/p641i5Xuk7bEzQHNwfW4kW8vNnPM
         JenA==
X-Forwarded-Encrypted: i=1; AFNElJ8HsYFbIITI59B6ZaQV03RILQzJn0mnbifOAO2tqwEJXq1/p0pU0sC5wMNItAc/qXCoQBnqBd8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ReGB7BWpPl//ekMXBkL3b/Entz8O6wM0xK2NiTsUUvkFV4LT
	Vp3FnJikgrnmJH0KxffeCKSy015LtRsKzaeCWJYcQ8GNpc5efUFT0I2KS/TE40z+zXgj220jrQg
	NFWpF7YoDsvilPASa6e6iNyzxqqRrzGb7rPFatUANeJsPF0DIPTpcrxwuIoHgroAX
X-Gm-Gg: Acq92OEVAWqJwYQu/motDJY/hM3cwrnXlMKyLpoEiigDcDUPEfCcfs2jPMdcu/LpObE
	ySJkYFTFi/qzYPbGzYQzXUZ1rT693QOnKaxh6Piq1RbDKhYGQYHgA2bCMffwEO9C4U8PpPgi9eJ
	iFHXQY9IdcEMc3AFeI6KdoN911HC+3izadDyKRDGS0HsiXzU8hL7ZhM4l7jZQFjaQGRAWoP4gpa
	d/ak3uqwTQWLgdFAJJujVFF0BwDLj48vtik/Lfz4bBX8nJunC6Uif0fzNFSR4zCjK9k5kb6HVRs
	3Cs1XJp7nt/4mlMX5eZLMWypKqtbsESwun7t6G+JkgW0p0zWiZXx45J4MnnSy9naw6A8pCYet9O
	sgekrB56AxFUsZ8prr7UzP5W/gPBqL4MEo/0xRm+atrRP2RJvOnCpQvDftBemcu6fC8ldeqMFgA
	FbQKSg3Q==
X-Received: by 2002:a05:7300:8b24:b0:304:29dd:70b6 with SMTP id 5a478bee46e88-30429dd8193mr280391eec.13.1779292814071;
        Wed, 20 May 2026 09:00:14 -0700 (PDT)
X-Received: by 2002:a05:7300:8b24:b0:304:29dd:70b6 with SMTP id 5a478bee46e88-30429dd8193mr280342eec.13.1779292813299;
        Wed, 20 May 2026 09:00:13 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3041e267d8esm1655453eec.14.2026.05.20.09.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 09:00:12 -0700 (PDT)
Message-ID: <a6619f65-7c84-43bb-9eff-4172ab16417f@oss.qualcomm.com>
Date: Wed, 20 May 2026 09:00:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] genirq: export irq_can_set_affinity() for
 module drivers
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
 <20260519011627.713068-2-hangtian.zhu@oss.qualcomm.com> <875x4jxyht.ffs@tglx>
 <b5870d83-6cc6-4b9e-bb4c-ee812d8b7727@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b5870d83-6cc6-4b9e-bb4c-ee812d8b7727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0dda8f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gARxiiPYBd9Ydj06ge4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1NSBTYWx0ZWRfXzPrJjNfUafOO
 QUu2POl5Wn534++xqvD+atgvix+WtSz79f9CiSGJS+zL2F21jcuhTuzTW6UVLl8pXcoPQGuBOs8
 h6ylLp10xfGlu72XCHndgJVI9WUn04Fv4rwLslApArrijc07AsXacWF1ATt2OB6solCXvRO+4iO
 tzJIZsyxsDRcuxCVmgPfuiaX0UYOr4Oc09sDgih99MEUjpEuI3xdpoJ4NilQy+I8GubAkWiJOzB
 foWu4ctBlEQow/Qj8+YwtoVJKZRV3b2WIOaN6kWDrY8uoLjbHH6IBc92VmHMltKv0XnrxIcVT7t
 32DCWYyT6kha6dK6oYe9IKN9Ahgjb093uKljJt4kpW9aTmLpieKyktv6XJ1NEW0+3hITxKwbAAM
 9iAkxG7LLqXiblhxSFZ2ZvgLXSSS94NxNYKgeZ5aHg0B937D8BYnOXLQtKbFYOVyhAXhQrpcGim
 GAkgfQtg+WNWqviUemQ==
X-Proofpoint-GUID: g8N2EK_kYgaW8UtwCOAk5pje15hlvEfW
X-Proofpoint-ORIG-GUID: g8N2EK_kYgaW8UtwCOAk5pje15hlvEfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_090016_619298_0B8778CB 
X-CRM114-Status: GOOD (  11.09  )
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

On 5/19/2026 7:42 PM, Hangtian Zhu wrote:
> 
> 
> On 5/19/2026 22:30, Thomas Gleixner wrote:
>> eviewed-by: Thomas Gleixner <tglx@kernel.org>
>> On Tue, May 19 2026 at 09:16, Hangtian Zhu wrote:
>>> Export irq_can_set_affinity() for loadable drivers that need a runtime
>>> check for IRQ affinity capability.
>>>
>>> In hierarchical IRQ setups where the effective irqchip path lacks
>>> .irq_set_affinity(), drivers may need to switch to a fallback policy.
>>> Without this export, module drivers cannot use the core helper and have
>>> to open-code equivalent checks.
>>>
>>> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
>> Assuming this goes through the wireless tree:
> yes, it's wireless tree.
>> Acked-by: Thomas Gleixner <tglx@kernel.org>
>>
>> If not, please let me know and I pick it up.
> 

Technically, it will first go into my ath tree, but yes, I'll pick it up.
Thanks for the Ack!

/jeff

