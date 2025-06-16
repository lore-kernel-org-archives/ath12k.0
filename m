Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643AAC71136
	for <ath12k@archiver.kernel.org>; Mon, 16 Jun 2025 10:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyMuhoSMhWise6f0DE4q8u4a+CVo9/qSkPnVgBek2l0=; b=vJRAig/mz+Tun89+bKEorrIOW3
	W3Z8miikP9+W9bZ2qDYD43onyvd6Axl3axvIPbIEQzBIhUGcezOQCcKUgaF+dhOzJNnva4irorYSl
	xG9J5VXNLJODSSfwC9SfViQ1QrWTQ33MNpraKZ04Rs/jCtelYvxQRx31NpRld+9CipctOgDR2CMc3
	BZgv+75VjMwwmQoHP1y+RImJAOKOg/c+SrxvsAGQ24O+RmpV+zgeNO6F50YhSVk4nVuHfkjx+9bwY
	rs4BeyvXoiTgyXSFust0L9HNs9FI8aNeInpyVEKIN2NGeJY0KZgjuXMADsJpnEIA04Js0xXo98VZp
	ltBtBtzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6r8-000000042mB-0ds8;
	Mon, 16 Jun 2025 10:14:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR69l-00000003vGn-3oCq
	for ath12k@lists.infradead.org;
	Mon, 16 Jun 2025 09:29:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8S4EJ002406
	for <ath12k@lists.infradead.org>; Mon, 16 Jun 2025 09:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyMuhoSMhWise6f0DE4q8u4a+CVo9/qSkPnVgBek2l0=; b=AuFSwdepGzor/9XV
	LpBiNvGenqsuJRj0XhD9bmJJ/zc9OwF9LUDynEbwsyoSGNJ06zbKcg7H6YCLvodQ
	MbfDQeyAJkg/SdRmGN6Y8EmaG5+U+jpvRYoSS43kpj73Fa3vOox+Fd1nZhF+HDxR
	BjGRuBRt1YOtzhhZaOVQPE/hC52OJKGXg8rjvNLVr2ydycCoaACPPEMThsOc37Gt
	D4z6t9tnhMyJ/Fn6SLuokajxc/s9rWrSzi0iuElGiNX8VTOCBF/JeB3b13iQuLSF
	hZw7oZc45tsm9u4KRhM9gvyMNnckxTQfuPDRjdpGLjY/wPo17o6oZk+uL6U3F3yi
	UOsZ+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f73xyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Jun 2025 09:29:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so661459a91.3
        for <ath12k@lists.infradead.org>; Mon, 16 Jun 2025 02:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066170; x=1750670970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyMuhoSMhWise6f0DE4q8u4a+CVo9/qSkPnVgBek2l0=;
        b=dphyui+kdskCau/73iEsi8rI65QRrwvJHCXSvBIXIOd6vbD/nR4Zp+uX4sEg50fko9
         BfrC+eRg/dmeF7sKOYuWVuS4aUJGHwdNeUfG3e3nHdejou0I5aVKSlwprjnV0CaLR4Cf
         /MxHBZrG5V0hPI3tzWNa4ue0fF+mp1wDsmRYIJ+fKoY2m+/dmIBlbgV6BKx8H30tkI5U
         8mLvuYYcmOcHyRE9snn3TaDOfZAWL2BxitGZErkIfKvRlHV9B8EmFv6VJtOBQ17SwxL5
         +SMC+GwSd7lk9jGIe0OEch659/DvLp5I5KnafeiFWsMFJQHwBEbjLvdyUDS6G47XsC2m
         pqHA==
X-Forwarded-Encrypted: i=1; AJvYcCUoWBd9KJx74Gm1VXAHMWfr4LEAziMdvdXhpPODebC8+8pTjsxuHmG2FCmjqWHEGbTYG/HtK+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwITRK/Y1qq9oVTgGci3vnXtplPIh+08a0J0/opubi5j0Pn7Uef
	uaYvoO3EM2tOWt86KorbuRMIZ9YjahIkd96aFxFsHDzZjFA7VlaAfE6b4UndnLc9YQEKCGh92Lb
	znhgZ6kTNBfiCMVkzDuWFnTDKCAb5wtMgybJjzFw/lINpQSJLNMNqnkiAB9OngVM4QyT9nfUE
X-Gm-Gg: ASbGnct9JSRbnsGhS0HDhUkJbzq/cau+p0dQaHegausjozgT/RLHe7KDz/4S2hTEwh5
	tcrY7Z0Hj3DbROUg6BXrJV1NTEy9usIRVgwpETffnu9Dez4GOGHW4RiMfngKibFPTGztcnTg4UY
	x5Uhl0oZVKF/PPEmjFIKbFYJUELosoE2LJZM5nKiaFKpE0r0/m0PBKD52TFvEmngclAdRT3PxVq
	kWmB+gxsSXijhhT54TktcH+xsPMNrQVMcjpA/bjY3UmS5qJEMcG3fUM5aJ3Z13AnV7mRlWVXv4q
	DzdgBYD+cFtavd3onyYwWzMxOI9FpfR0NnRYNEhdN0vw+Fzb4SI=
X-Received: by 2002:a17:90b:2b45:b0:313:b1a:3939 with SMTP id 98e67ed59e1d1-313f1cdaa59mr15010962a91.15.1750066170249;
        Mon, 16 Jun 2025 02:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsUd2qFGuMXKuccZvrFk7CIMKUwpb0xUUFf9RE6u/Crka9A/TnucG3IcOlzpJlwgNnMDfteA==
X-Received: by 2002:a17:90b:2b45:b0:313:b1a:3939 with SMTP id 98e67ed59e1d1-313f1cdaa59mr15010915a91.15.1750066169791;
        Mon, 16 Jun 2025 02:29:29 -0700 (PDT)
Received: from [10.152.204.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b6d56bsm9195325a91.46.2025.06.16.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 02:29:29 -0700 (PDT)
Message-ID: <63c2c889-0a09-4b25-a1d2-2aaa92d75d9f@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 14:59:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] wifi: ath12k: fix dest ring-buffer corruption
To: Baochen Qiang <quic_bqiang@quicinc.com>, Johan Hovold <johan@kernel.org>,
        P Praneesh <quic_ppranees@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Remi Pommarel <repk@triplefau.lt>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250604144509.28374-1-johan+linaro@kernel.org>
 <20250604144509.28374-2-johan+linaro@kernel.org>
 <6f3eb9fa-617e-4434-8fc4-33dd92c4bdd2@quicinc.com>
 <aEFqsghEuJc3xxlU@hovoldconsulting.com>
 <ed06d62a-4b98-443a-a2ed-c92058bb521a@quicinc.com>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <ed06d62a-4b98-443a-a2ed-c92058bb521a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2MSBTYWx0ZWRfX+mijjBE7TLSQ
 yof0NnvuWB4YY2IZigYzKn8DgqlXEvnOz2SuttVvT2/OxsQg0K9vnO7XZ4KXFRCbKfA/k3mymh7
 w12gy5iXUsKay2d+Bb9UQDXgQwf74FVPjaTaQGYK4Ib0hMvp+YPr+TEeuOqgQQo27QITogAGz+p
 8y4p1BZ8ELRjabnDtMe7GyomO78b6P/GfuC28Rx88mfLQYv1ibZSwvMLfstNmYx2fwrXtwmehaB
 tpoMiFMXF/DXSPe/68BSJC5JS6uoMdhee+4x51VSzgDdnvPXHNEXz3VuLjrCo+7a+TEfpQEIPTA
 N2EJyGFPu2WVmVOgtmFdTSWZz9KVI4RKnI4NnhCvg7sImUw9hStbucSK/SrR8TWo5jrcj8aPKGV
 zWrVH/CGnP0BmKPU5KPbNM4s4Cyg+tZG8lYUG4Xaq5RkOlKbnhN4IVtBxDSySOdH+8mX1WHQ
X-Proofpoint-GUID: pxxCvKfyuQBXe4Bw1p1rtxEO5HyMiBbd
X-Proofpoint-ORIG-GUID: pxxCvKfyuQBXe4Bw1p1rtxEO5HyMiBbd
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684fe3fb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Ske-G14cY86dgNt0HIsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_022934_071378_D036FCB7 
X-CRM114-Status: GOOD (  26.37  )
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


On 6/5/2025 4:19 PM, Baochen Qiang wrote:
>
> On 6/5/2025 6:00 PM, Johan Hovold wrote:
>> On Thu, Jun 05, 2025 at 04:41:32PM +0800, Baochen Qiang wrote:
>>> On 6/4/2025 10:45 PM, Johan Hovold wrote:
>>>> Add the missing memory barrier to make sure that destination ring
>>>> descriptors are read after the head pointers to avoid using stale data
>>>> on weakly ordered architectures like aarch64.
>>>>
>>>> The barrier is added to the ath12k_hal_srng_access_begin() helper for
>>>> symmetry with follow-on fixes for source ring buffer corruption which
>>>> will add barriers to ath12k_hal_srng_access_end().
>>>>
>>>> Note that this may fix the empty descriptor issue recently worked around
>>>> by commit 51ad34a47e9f ("wifi: ath12k: Add drop descriptor handling for
>>>> monitor ring").
>>> why? I would expect drunk cookies are valid in case of HAL_MON_DEST_INFO0_EMPTY_DESC,
>>> rather than anything caused by reordering.
>> Based on a quick look it seemed like this could possibly fall in the
>> same category as some of the other workarounds I've spotted while
>> looking into these ordering issues (e.g. f9fff67d2d7c ("wifi: ath11k:
>> Fix SKB corruption in REO destination ring")).
>>
>> If you say this one is clearly unrelated, I'll drop the comment.
> Praneesh, could you comment here since you made that change?
Empty/Drop descriptor is intentionally issued by the hardware during 
backpressure scenario
and is unrelated to the issue discussed in this patch series.
>>>> @@ -343,9 +343,6 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
>>>>   		goto err;
>>>>   	}
>>>>   
>>>> -	/* Make sure descriptor is read after the head pointer. */
>>>> -	dma_rmb();
>>>> -
>>>>   	*nbytes = ath12k_hal_ce_dst_status_get_length(desc);
>>>>   
>>>>   	*skb = pipe->dest_ring->skb[sw_index];
>>>> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
>>>> index 91d5126ca149..9eea13ed5565 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/hal.c
>>>> +++ b/drivers/net/wireless/ath/ath12k/hal.c
>>>> @@ -2126,13 +2126,24 @@ void *ath12k_hal_srng_src_get_next_reaped(struct ath12k_base *ab,
>>>>   
>>>>   void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
>>>>   {
>>>> +	u32 hp;
>>>> +
>>>>   	lockdep_assert_held(&srng->lock);
>>>>   
>>>> -	if (srng->ring_dir == HAL_SRNG_DIR_SRC)
>>>> +	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>>>>   		srng->u.src_ring.cached_tp =
>>>>   			*(volatile u32 *)srng->u.src_ring.tp_addr;
>>>> -	else
>>>> -		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
>>>> +	} else {
>>>> +		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
>>>> +
>>>> +		if (hp != srng->u.dst_ring.cached_hp) {
>>> This consumes additional CPU cycles in hot path, which is a concern to me.
>>>
>>> Based on that, I prefer the v1 implementation.
>> The conditional avoids a memory barrier in case the ring is empty, so
>> for all callers but ath12k_ce_completed_recv_next() it's an improvement
>> over v1 in that sense.
>>
>> I could make the barrier unconditional, which will only add one barrier
>> to ath12k_ce_completed_recv_next() in case the ring is empty compared to
>> v1. Perhaps that's a good compromise if you worry about the extra
>> comparison?
> I guess the unconditional barrier also has impact on performance? If so I am not sure
> which one is better then ...
>
> Let's just keep it as is and see what others think.
>
>> I very much want to avoid having both explicit barriers in the caller
>> and barriers in the hal end() helper. I think it should be either or.
>>   
>>>> +			srng->u.dst_ring.cached_hp = hp;
>>>> +			/* Make sure descriptor is read after the head
>>>> +			 * pointer.
>>>> +			 */
>>>> +			dma_rmb();
>>>> +		}
>>>> +	}
>> Johan
>

