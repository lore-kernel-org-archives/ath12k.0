Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A8EC79F8C
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 03:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtVRqrPF+O3AyewW8EHJ1UpFlY7nySOnDXChI0Lp3ls=; b=ztWbmabkDvkD/gLz/UjTNMH4Ao
	y0XOm+xj2tTpuf2g8Gxr6l2BK2zDE2hfu3dIWN5SeD+wfKNQuutxCJBnGIx1cFnSojRDz9WH2IB+H
	jTB0kVIks1X4OgrH+Mr1xMb2fRwibxtAf4QKjCQHxKH0z/hGEuw74HCsuLdOOQ1cLZdRSL8ItDtp5
	d6DLAlb22Qurc20wUKFCyaKUQNoGb/WJ3l6DZqGV3D/+/4YXYoTlS4sxsfoQTLdoIRN5gQ2gkWlTI
	wfXwRS85HPhdEChNkn7dOAMpGZ8H2pt0i3v/Gm+JEUfiQPkMQjHutcHKKDtQ+8zJc/X85SmMeMyVZ
	wboBoPVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x49Fh-0000000Aiww-0BrT;
	Wed, 09 Sep 2026 03:45:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x49FY-0000000AiwR-0kvE
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 03:45:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgHkK336409
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 03:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtVRqrPF+O3AyewW8EHJ1UpFlY7nySOnDXChI0Lp3ls=; b=JdWM7vxZG/GZcbcV
	Xltz9NboCqsGh8E1O3uqD5d9wmcS13mOy7IzZ10aKF+06XmQ8B3upomEN5LRxp8n
	q8oje76v2/DHmGCtRyG9WiXYw7BHzbq4GkrT/jDl8+gq1KVxh+idartutSx8r2w7
	3NK4Ob/A8vY+BGhdh9PzPp7nAjpR7BlJ3xdTRGWIX06aCh6NZ8/FyvtTP48n3Olp
	Ypvi3Dpp0r3Vtq7crc86fd1i5nPjj6Vm4am72uPzKsGwcvImEWum8cyEV21HXzda
	XqeNGnLWznZUUrkoOutFj5G5Wqdm3RFB4QW6nWVxUPtnZfbFT1GIkMipYe2eySqn
	5wM6cw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7hw39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 03:45:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2530683a91.0
        for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 20:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788925526; x=1789530326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtVRqrPF+O3AyewW8EHJ1UpFlY7nySOnDXChI0Lp3ls=;
        b=RfXO26YSFfyUAiRCKrjsxJUrnFkFh35yLX+akeG5IYIwWNX93WcmfTTv/zNH81w4fr
         /YuHQlkliR1mQjf75tJ2SYUEQy2TWSu6zEoqhQzlWgfeOo74+hrUTX1/eVRvx6kwonES
         BXS74rN+CpZO9LcgK1e5UlaXN5UKWkliz0lQKqxq9iRvXtni2jP2evZjclwEEFtFQwBM
         ATfAYNHmE2PhUTui9NHOP/QAzqvMjnGra023E3404IN4+Bqp6QPPhDVjOuFKY6fIxYrV
         nrY3ZgmLcwIvC9lPP8yp1KHG7w8HStcAZA8CWWJYaKnNEIuJQwvUBbIE5wArbAI1uwV4
         RWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788925526; x=1789530326;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtVRqrPF+O3AyewW8EHJ1UpFlY7nySOnDXChI0Lp3ls=;
        b=cvVmDzTUnoStfqTmBRD8XEnaELm1TqqRkakO6yxZiiKn5LieBVSYSKuWf3RHFz+anV
         nmsTiSRvkm8OX6QO+jPImrK1R6KSUAH7rExDDZXdEccg0LYsn2OgT2qiK4ytjGkEz3U4
         vKZnIDyaJA+wAchxdteqN2d8gnT6SirsbWf8/XBHsfsQSrsroBnF/NnyQoL/SOHzJeI+
         y/QlUUcws0ncHk1nylpcjxcsBo9qhQ3YiASkD3KsXmxpu73CT/FxtpCAYk2DDLsl6ZC6
         dZnFS5cyES2shTmPeVQkabZ04TRhhIg/pSXBQmIxj5fasN2R20CjjwgVTG/3bnZaZPGa
         W1Cg==
X-Forwarded-Encrypted: i=1; AKwUvBx6vuzaI/3rT0F7SHrSk6XFonsUDxde5RC2FqDGdBHL3ABE87VuSobjF4J8aIJ6YF8/NAwN1ew=@lists.infradead.org
X-Gm-Message-State: AFuF++nPWPhdCwnxv1RSWiVD5Kc3N3GkRf7W+YrkV2SsB6xC0CCh/uOL
	Vzyxh5s8SOpmO9GZhqL7gUSzMT6z0h7G69/qWcr/shQt1tcVxmEiEnn1aix1KSKpIjHx0sUAMf5
	mLr3uFb4iEQ3GSpM8wRRCw4y4Opc+gUXZj7tcNT4zz/Dd6dlmiZ4UY6R9cK+FLITx
X-Gm-Gg: AYBFou0TYej4wzO2YyVcIbpHsb0pKIZS0b15Zt3iP7hfjkJ4f3daz7lQoqDlKbNMqv4
	VjjTJ/ZgQVkbFWXiuO1Wo6NjtGkO4mE1MTwQISrMXua1o7W5r50y475+Mmrlf4Pc6fn0WsXEDfA
	8frK3LxaS2EGdi5eQaCv2oAzawvIaJ6SE1RMBpYMZTdo2Rl7JgUHROvWXoJUNtnMAmzjUUJ3mN4
	L24F+uv8eCHWXCBNl2cyGpFwCY/BC4FaQ+DYP/1HZQHP7XgKEjLyZylpyrIRcNLgnLHG9NzTQYR
	nEKa9t2hCrMAUKhmtWctiQ5Lx7j2SlfSlkzY34+AKMk+iWiTHeDQ9ZoSlrH0KpQnBZ16JYmsmTN
	NCJUXznEJcNA2LQO8Z9uMIaNGeP8Kx8pu0PgqJ1wKI+ADUzhaz9UlxUimaEY=
X-Received: by 2002:a17:90b:4c44:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39b261cdb38mr46502128a91.13.1788925525937;
        Tue, 08 Sep 2026 20:45:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-39b261cdb38mr46502050a91.13.1788925525387;
        Tue, 08 Sep 2026 20:45:25 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm34969205a91.8.2026.09.08.20.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 20:45:25 -0700 (PDT)
Message-ID: <aba5d600-0d8d-44ca-9367-7cdc145e9732@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:45:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix stale skb pointers after
 aligned TX payload shift
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
 <4ed6651c-b1d2-458d-a210-5cc72954b48e@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4ed6651c-b1d2-458d-a210-5cc72954b48e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAzOSBTYWx0ZWRfXwyoiPGjqvud7
 LLNW0/Wi1yETlFpHeX+Cx4bZt+EQfQmjSaO2BLgv3EFWtTJGBM0R+vBBWERU9S+Z8f159asnFOU
 yUkOMeRdk0zizkx6M8Kc+PBgIc0IQkM=
X-Proofpoint-ORIG-GUID: oEARzLVJokw9ZhPRrC9R68gIQ5Bl2iRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAzOSBTYWx0ZWRfX69TZhF/m5EPf
 1QAlGFEmsh+juZRS/zKSXQ9SaZdIzYQtiWJkCJShArEhlgdRUBwUzHnB6hyNt2KoLzHR/ueloGl
 GPT+v2+20KECSWRND5wX4Pe/EQPnnEZdghvcSMkCwO7Y4rMB9+tB1QhZ3Pbrxq6Ojm1JVD+ulNd
 J8H8nRHfLq1xMKiPHG48ye9rcvXZjTWQu5EH5T/28kqEEpg8IMqBKFoj8sGu1FLSL6IqT/ZI/43
 R/tFaOhw2MmYYVvCT5K8FSizLxczjfJLE1R0X9ZnYyAZ7dTad3i4nqyEqaBGYAUjZsx5JoQGWAM
 fvNrGjri9DD25iFNGaSORVnVHxwNF5EBhqywRgJKhw79cCbvmNG9nWgMeOQPKz6F/SK+BrmcADX
 PyrTqn0NeE3JbkI7b7PNdcavZ3Eb9z4iG3WysOXuhxrwyMSvN/JvPxNtEz/AzmUbJBMge3mx29r
 uI6QnbXSAx8JtFzk0fg==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa0d656 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=J9Uu1coqdBZi-UK5pMMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: oEARzLVJokw9ZhPRrC9R68gIQ5Bl2iRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_204528_365010_CB5853C0 
X-CRM114-Status: GOOD (  25.10  )
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



On 9/9/2026 4:55 AM, Jeff Johnson wrote:
> On 8/17/2026 6:44 PM, Baochen Qiang wrote:
>> ath12k_wifi7_dp_tx() caches hdr, eth, and skb_cb from the skb before
>> calling ath12k_dp_tx_align_payload(). That function may shift skb->data
>> in place (when headroom or tailroom is sufficient) or reallocate the
>> buffer entirely via skb_realloc_headroom(), freeing the original skb.
>> In either case hdr, eth, and skb_cb are left pointing into stale memory.
>>
>> After alignment, only hdr is refreshed, leaving eth and skb_cb stale.
>> skb_cb is written immediately after (storing DMA addresses), and eth is
>> re-read on every TCL ring retry via the tcl_ring_sel goto, so both
>> accesses are use-after-free or stale-pointer bugs depending on which
>> alignment path was taken.
>>
>> Refresh eth (conditionally, to preserve the encap-mode distinction) and
>> skb_cb alongside hdr after ath12k_dp_tx_align_payload() returns, so all
>> three point into the live skb for all subsequent accesses.
>>
>> Issue found during code review, compile tested only.
>>
>> Fixes: 38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850")
>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
>> index d2749de44553..6b8430260238 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
>> @@ -251,10 +251,15 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
>>  			goto map;
>>  		}
>>  
>> -		/* hdr is pointing to a wrong place after alignment,
>> -		 * so refresh it for later use.
>> +		/*
>> +		 * The payload may have been shifted or even the entire buffer may have
>> +		 * been reallocated for alignment. In that case, hdr, eth and skb_cb
>> +		 * are stale pointers. Refresh them now for later dereference.
>>  		 */
>>  		hdr = (void *)skb->data;
>> +		if (eth)
>> +			eth = (struct ethhdr *)skb->data;
>> +		skb_cb = ATH12K_SKB_CB(skb);
> 
> My review agent notes there is an additional issue possible if alignment
> causes a new skb to be allocated. If there are any error returns beyond this
> point then the caller will double free the original skb instead of freeing the
> new skb. this is because the caller doesn't know the original skb was replaced.

Yeah, indeed the issue is true. I guess we need to pass &skb instead to
ath12k_wifi7_dp_tx() and replace it with the new one.

> 
> So I'm taking this patch as-is since it fixes issues when the buffer is
> shifted, but we need an additional fix to correctly handle when the original
> skb is freed and there is a subsequent error return.

agree, it is a different issue hence deserves a separate patch. Do you want me to submit
it or you will do it yourself?

> 
>>  	}
>>  map:
>>  	ti.paddr = dma_map_single(dp->dev, skb->data, skb->len, DMA_TO_DEVICE);
>>
>> ---
>> base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
>> change-id: 20260811-ath12k-uaf-for-aligned-tx-a068d34b1548
>>
>> Best regards,
> 


