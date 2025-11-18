Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC45CED255
	for <ath12k@archiver.kernel.org>; Tue, 18 Nov 2025 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSKfSg7sX/L2rplVdh/J8TmLKq8S4qDVyuOFKl89jto=; b=uUpPKwvtEzIGOVea1RlnlImmVw
	3wQGakfa8fFg2njfZZNGF0ddUurPw7/9mOElcMB5LFy9BHmpctFbqHzUw8iGQJ7U3rusuouxi1VDp
	EMzOU2EogRyuUevojMmSmCKcZyb6ApV4NzEyg6xzIANG3+z5LyZQ+X80HAOsRHfMIP6ioIxEvTv9v
	BanwBG+9Hl718ibTc6qPMjzfPtqatuiDLtuCHRH7436FzzIaMxfpQTxtG+v/uZZn34kFQ1Ukvkwwj
	oX4vE9rQT80ISQHHJE4sjhFaHlT54n7S+UaUvoT6izHqFlYb3CYeTEmEPjirOXaUHfJNdbwDGfWsD
	B9h9uKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJTm-00000000IL9-2Rkh;
	Tue, 18 Nov 2025 11:02:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJTk-00000000IKa-2jOm
	for ath12k@lists.infradead.org;
	Tue, 18 Nov 2025 11:02:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8E1qg2194366
	for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 11:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSKfSg7sX/L2rplVdh/J8TmLKq8S4qDVyuOFKl89jto=; b=GsUapDaUFKzoSBtJ
	O7Vmm2UYWja+UhQr5YnjW587tPIX/LSa4Lg8j6aVljOR1xw2tmcDFIS/4MumNDZh
	UDwV51XaOCzsPLGECh+VwRh+greoCuKIfOzaMBPEioyi/Sf0hfXVfM8g+DsvNO3T
	ZIp53L3taEyN1/cNX5sFDWav6+Z5fcNhTjQC5i1Lkw2Cfkd1VdgXiHE/rKYCL5ST
	OY3nhQ/9d2l4gmrpkqNzn5cgOya6FS/r0uox8sDrdBuDvQq+mzKeNeDs0W5Gi7VX
	6DDnWMc3WCW6okERevw1ceJl03dwiVAsOgEVFgHG4/+HE3K2SVJXKEEJeLRnkVjL
	Zb7ZHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8gk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 11:02:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343823be748so6484857a91.0
        for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763463751; x=1764068551; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSKfSg7sX/L2rplVdh/J8TmLKq8S4qDVyuOFKl89jto=;
        b=f0j36P9+YRz1qg9Lqiv+ofiYGLozisZQXAueE72pK02a/6DoD6VtR3cVz58tFQk2uQ
         ervXon4WOxD+wLCOCWvFqb1YDTw8D6azKck1Gk6na/zaSlT5LW160c1g8H9PW9l2zJc7
         SgfywEnGHfjYRWJUiMpQuKuR5uHcyJW2F6/P6zTjOmzk5+zx3D3L8GK08g3smN2UMfID
         20SbTmbBtriQGaTO/Nr7uZDXH6BzZxRJsXfqU+5OOZtLZ8uU5Kh1zb2VnOq1SYi6NxIt
         9jBiGR6E1agwplwQHBBQFZgOj7zPbhndfffhDQAcds6UtaW96Nh4LDM4WbGToaPE2x9f
         YAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463751; x=1764068551;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSKfSg7sX/L2rplVdh/J8TmLKq8S4qDVyuOFKl89jto=;
        b=D91zz6OsOhg/0hPaMEynidq6/l0FU7HI4WBkdZgZxJWcEkdnWmnH10TLp1okLVX6oD
         PmJO6XtdA/6sPoe29foWLcHs4N7MN7iQYFAwixIiOOwlCY4ekKQWWXjlW/2sFSB1JSel
         w/OyM5h8LW3K89kUDgEftOsym0+4n8ZdoLcGPK9OcP9FHj3N5+z7+izANEQOfl436+Ed
         p4A+5AAgwSEAiN56Di9zdPklNttijqwzAxUdiRTKZC67TRGDdntByRNZ9DDUQY6HLC+r
         lonRAy6N5uV5jFtT6eiU2J3c5Z6n06CL9/dLmQRq9wVKiDGJR4dtB9frF4XOebvHxAxG
         rTkg==
X-Forwarded-Encrypted: i=1; AJvYcCV25b50CM8/xvUhRq+aOXWOxALxu5kZBqI4gc2tX0uqGwflK/Gam0mu4T8s51zhWbRpBh6zSlg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzietvCz4LrldjpDkxfUmeeTqkbSrIkyg2XR3KROqcaHgj9GC4/
	dEdm/pHVd3hAm9aZ3v7DYtlHJAMl8FF+j3d+P0g+aCLqwUTBTWNPIVBj91TESYX5CdbuTrE0T61
	1EGSun4mQ5N7z9mVudGDJutcwxReyIGrKmMfRew6tCJILienjTGPDfl92t72bMdFx
X-Gm-Gg: ASbGncvUI/N5Qy8YXFsBp6tPXjujM49Rt40tTds5f7eUeHhpDcjRg5p1wdDw/qcWkNb
	1lgSlFrE5S64ijO04UqZebyQolt1clonME6e+6yZYtXr/HvTU68Kwmnux2qRQgBiagknL56aHmL
	6lXejzQdlrOH3SgZFr37yOIreqDtzLrZreHXTzINZNNEB2mEmaT8sSkCilfib1ObiRVLF1mZOFQ
	AbY1kwG5PPgBHZcs9fBXdwK2GAfdy7ZaSNIZvK11SLxqDTNpXNCOsBcODJg/xnxuPXJIS58lwVj
	dbs6JWQeCCu2gNb0/TWy5OCJpvZwpgKmg1PLjp1R4ZrVSbqn45Jw2Dr1wDe+bzPiFWJDB+OgEhQ
	I+NcARoyarD1ZAHSSC5gCoxaoIP/GEVJN24S6GSqKgIyHRNUTjunJmVfGvxTMn7En43eCnuhG
X-Received: by 2002:a17:90b:4985:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-343fa7607cdmr17750843a91.33.1763463751197;
        Tue, 18 Nov 2025 03:02:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwv0x5GGt5fd/ZbS3sjPoD8CgkzGMYteoLU0SLlRueuAqIO7zFP1VFikcjvr62aik5gzjmcw==
X-Received: by 2002:a17:90b:4985:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-343fa7607cdmr17750795a91.33.1763463750608;
        Tue, 18 Nov 2025 03:02:30 -0800 (PST)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07bbbd2sm21838078a91.16.2025.11.18.03.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:02:30 -0800 (PST)
Message-ID: <bed8564e-0801-4c55-a9ce-32956db68b98@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 19:02:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix endianness handling for SRNG ring
 pointer accesses
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118101723.69279-1-alexander.wilhelm@westermo.com>
 <25dc40e9-6fe6-4e8d-b767-02f8a304e1ca@oss.qualcomm.com>
 <aRxPOLxQkOUCDK1B@FUE-ALEWI-WINX>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aRxPOLxQkOUCDK1B@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4OCBTYWx0ZWRfX+Ie3Ra9kV3Xn
 OaAefOJQl8UrNJoIVdoKbTtkdnZaKjAzanimmYN+dLCLO9ahgetozBvKB7TOhozFYdwE+IQlCD6
 WDmh3xHBH48aiuZ+fRhFDCkowO9KLYCH4+o730j6F7r1iNtaKvT8vTg4tiwE9+uMow/FCp00rh/
 BLVJcEp6LE5iUfvYMxMwdq55zBGrFHAo3t6iGSnnrJcgi536w8qg/lDJDV0XF+n0NDKZC7Az2kD
 12TCPq9N/hvEsnNrBrThleWArN+qCz02xR7p8RkwGV7hz1v9Of5+Tt8CKpbupWvhi5WISjraY/f
 /unfbjiJVq7x3tLRHO3y5Pg5OrnL6oj82WFNQ/jZxMrYFBLY1exxhl1ADRNwS/MCsZf4xfQ0O0H
 euh3VE/XfZ/RGfVC+VGm0WueBWCFTw==
X-Proofpoint-GUID: 05h5CgBLoKsH7SuvJu4K_pAfYeTGJ6gA
X-Proofpoint-ORIG-GUID: 05h5CgBLoKsH7SuvJu4K_pAfYeTGJ6gA
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c5248 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=PS0NEqStB8q5LQhKI8EA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_030232_722250_6C4F5D72 
X-CRM114-Status: GOOD (  23.73  )
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



On 11/18/2025 6:49 PM, Alexander Wilhelm wrote:
> On Tue, Nov 18, 2025 at 06:43:44PM +0800, Baochen Qiang wrote:
>>
>>
>> On 11/18/2025 6:17 PM, Alexander Wilhelm wrote:
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
>>> Changes in v2:
>>> - Set '__le32 *' type for 'hp_addr/tp_addr' in both 'dst_ring' and 'src_ring'
>>> ---
>>>  drivers/net/wireless/ath/ath12k/hal.c | 35 +++++++++++++++------------
>>>  drivers/net/wireless/ath/ath12k/hal.h |  8 +++---
>>>  2 files changed, 24 insertions(+), 19 deletions(-)
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
>>>  		srng->u.dst_ring.cached_hp = hp;
>>>  	} else {
>>>  		hp = srng->u.dst_ring.cached_hp;
>>> @@ -2030,7 +2030,7 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *ab, struct hal_srng *srng,
>>>  	hp = srng->u.src_ring.hp;
>>>  
>>>  	if (sync_hw_ptr) {
>>> -		tp = *srng->u.src_ring.tp_addr;
>>> +		tp = le32_to_cpu(*srng->u.src_ring.tp_addr);
>>>  		srng->u.src_ring.cached_tp = tp;
>>>  	} else {
>>>  		tp = srng->u.src_ring.cached_tp;
>>> @@ -2149,9 +2149,9 @@ void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
>>>  
>>>  	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>>>  		srng->u.src_ring.cached_tp =
>>> -			*(volatile u32 *)srng->u.src_ring.tp_addr;
>>> +			le32_to_cpu(*(volatile u32 *)srng->u.src_ring.tp_addr);
>>
>> s/volatile u32 */volatile __le32 */ ?
> 
> I got it. I'll fix it in v3.
> 
>>>  	} else {
>>> -		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
>>> +		hp = le32_to_cpu(READ_ONCE(*srng->u.dst_ring.hp_addr));
>>>  
>>>  		if (hp != srng->u.dst_ring.cached_hp) {
>>>  			srng->u.dst_ring.cached_hp = hp;
>>> @@ -2175,25 +2175,28 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
>>>  		 * hence written to a shared memory location that is read by FW
>>>  		 */
>>>  		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>>> -			srng->u.src_ring.last_tp =
>>> -				*(volatile u32 *)srng->u.src_ring.tp_addr;
>>> +			srng->u.src_ring.last_tp = le32_to_cpu(
>>> +				*(volatile u32 *)srng->u.src_ring.tp_addr);
>>
>> s/volatile u32 */volatile __le32 */ ?
> 
> Same as above, sure!
> 
>>>  			/* Make sure descriptor is written before updating the
>>>  			 * head pointer.
>>>  			 */
>>>  			dma_wmb();
>>> -			WRITE_ONCE(*srng->u.src_ring.hp_addr, srng->u.src_ring.hp);
>>> +			WRITE_ONCE(*srng->u.src_ring.hp_addr,
>>> +				   cpu_to_le32(srng->u.src_ring.hp));
>>>  		} else {
>>> -			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
>>> +			srng->u.dst_ring.last_hp =
>>> +				le32_to_cpu(*srng->u.dst_ring.hp_addr);
>>>  			/* Make sure descriptor is read before updating the
>>>  			 * tail pointer.
>>>  			 */
>>>  			dma_mb();
>>> -			WRITE_ONCE(*srng->u.dst_ring.tp_addr, srng->u.dst_ring.tp);
>>> +			WRITE_ONCE(*srng->u.dst_ring.tp_addr,
>>> +				   cpu_to_le32(srng->u.dst_ring.tp));
>>>  		}
>>>  	} else {
>>>  		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>>> -			srng->u.src_ring.last_tp =
>>> -				*(volatile u32 *)srng->u.src_ring.tp_addr;
>>> +			srng->u.src_ring.last_tp = le32_to_cpu(
>>> +				*(volatile u32 *)srng->u.src_ring.tp_addr);
> 
> Same as above, sure!
> 
>>>  			/* Assume implementation use an MMIO write accessor
>>>  			 * which has the required wmb() so that the descriptor
>>>  			 * is written before the updating the head pointer.
>>> @@ -2203,7 +2206,8 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
>>>  					   (unsigned long)ab->mem,
>>>  					   srng->u.src_ring.hp);
>>>  		} else {
>>> -			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
>>> +			srng->u.dst_ring.last_hp =
>>> +				le32_to_cpu(*srng->u.dst_ring.hp_addr);
>>>  			/* Make sure descriptor is read before updating the
>>>  			 * tail pointer.
>>>  			 */
>>> @@ -2547,7 +2551,7 @@ void ath12k_hal_srng_shadow_update_hp_tp(struct ath12k_base *ab,
>>>  	 * HP only when then ring isn't' empty.
>>>  	 */
>>>  	if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
>>> -	    *srng->u.src_ring.tp_addr != srng->u.src_ring.hp)
>>> +	    le32_to_cpu(*srng->u.src_ring.tp_addr) != srng->u.src_ring.hp)
>>>  		ath12k_hal_srng_access_end(ab, srng);
>>>  }
>>>  
>>> @@ -2648,14 +2652,15 @@ void ath12k_hal_dump_srng_stats(struct ath12k_base *ab)
>>>  				   "src srng id %u hp %u, reap_hp %u, cur tp %u, cached tp %u last tp %u napi processed before %ums\n",
>>>  				   srng->ring_id, srng->u.src_ring.hp,
>>>  				   srng->u.src_ring.reap_hp,
>>> -				   *srng->u.src_ring.tp_addr, srng->u.src_ring.cached_tp,
>>> +				   __le32_to_cpu(*srng->u.src_ring.tp_addr),
>>> +				   srng->u.src_ring.cached_tp,
>>>  				   srng->u.src_ring.last_tp,
>>>  				   jiffies_to_msecs(jiffies - srng->timestamp));
>>>  		else if (srng->ring_dir == HAL_SRNG_DIR_DST)
>>>  			ath12k_err(ab,
>>>  				   "dst srng id %u tp %u, cur hp %u, cached hp %u last hp %u napi processed before %ums\n",
>>>  				   srng->ring_id, srng->u.dst_ring.tp,
>>> -				   *srng->u.dst_ring.hp_addr,
>>> +				   __le32_to_cpu(*srng->u.dst_ring.hp_addr),
>>
>> still my v1 comment does not get addressed:
>>
>>
>> why __le32_to_cpu() only in logging, while le32_to_cpu() elsewhere?
> 
> Sorry, I was confused with the previous issue. Yes, I saw this form on an
> upstream patch where '__le32_to_cpu()' was used instead of 'le32_to_cpu()'.
> Which one should I prefer? I'll unify that in v3.

I am not sure here -- Copilot tells me that le32_to_cpu() does argument type check while
__le32_to_cpu() does not, in that case we should use the latter one because we are sure
the type is safe.

However actual code shows they are actually the same:

include/linux/byteorder/generic.h:

	#define le32_to_cpu __le32_to_cpu

Let's see if others can give some insights.

> 
> 
> Best regards
> Alexander Wilhelm


