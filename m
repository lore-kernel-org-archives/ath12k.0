Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD0ACED602
	for <ath12k@archiver.kernel.org>; Tue, 18 Nov 2025 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWtgEKnbNZVUqCn3Q1oQ0EkBhxhseGeL81G9QqvOhIA=; b=ZRcTRey8BYeoMOK+M7O+cjgS1G
	MO/+Izt4q10x976fMY0scO+tqv7+Fy9u5XM3zt4KLSfAktxRA9OKdC/6yfBxeaFqvc8JV0kzgcJgu
	XwY6Ysx67DA3v8zX74OBkCuQwWiOjYS6RH8eeG/BfQbTbIIFASDNXnxkD6GzJaLd+IXeQVGUEKVli
	WtQI1G5EIloiTxaTyGEFyyK3fyyA+THilQufWk46CJNMiSyWs9HYMp4FOCygZNwDMC4FRj7YkGx6G
	iHbuj56SMV8Bm1vSR2+owFqVuspMlCHJFoBqrNLsodowgl/qVUPGyQTYTWh8wYv7oEhKiFKAmp6lZ
	fMRnND0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJBi-00000000Gvj-0gso;
	Tue, 18 Nov 2025 10:43:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJBf-00000000GvK-3xpH
	for ath12k@lists.infradead.org;
	Tue, 18 Nov 2025 10:43:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQncp027433
	for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 10:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWtgEKnbNZVUqCn3Q1oQ0EkBhxhseGeL81G9QqvOhIA=; b=b/cmdy7DXB0/w/h/
	OXQgtc/bCZ7XscGz8DQdNP44CgNN/TldhxkEpNnzWNzQ3g61Fehsxk6U7v3/Z3SZ
	EN0uYE1HtnMgYMJzKeOIvy0Q/s8w/hkO5k31UEs7R6C+pbUJTy/Yziy7Li8KXtOj
	+qY8fXLb9jPrhoeyvbT+CC2Gjw1y9Y/1bPtgmFlhgVXJUWZEixSASQ+yw4ESPybZ
	s9ioBOh0Y8uFpuCbscm1eW+iulQe4V7OyCxyTWSRF0zO6HZPZDKF59Ttifixxucg
	HYTI2EjU3R4nxaqh4sjU4KFj5zw1yDtx/jUaNgX2SENcb7S696tk7pi6JA4h/zMh
	XnsaYQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t2svx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 10:43:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2980ef53fc5so94869475ad.1
        for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 02:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763462631; x=1764067431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWtgEKnbNZVUqCn3Q1oQ0EkBhxhseGeL81G9QqvOhIA=;
        b=LdvxgvXNyyVIX2q6YfXDRvYmrUHyfSMy9ro5RPLHhaTpcrhLdsek+X9CuUOg4MeU+B
         f1BZwwOwp0CcN44POatHdgH0gF99Vns5Z+1il4O1pGbDgc5ifGPwHF7MYTGktrL7dRkL
         lr8RzK+zJxexnWNZ3PCnYItgO4nHJynO8UwmJAuA64lwAA/Ch5SsXFSNiHCrNiw+/MdI
         jeyuargFQWVEsyYkW4wPQWZuUiLs+I9/n8PZmGefYP9XW5ch/M0cFmZm/memwCg+/J+z
         VMTMw+khkuZAOUHHrbJ7QYX56e/1lID9EeyWeWyOly6elXb+6IO1zzcSSoCumr+oATO7
         uZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462631; x=1764067431;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWtgEKnbNZVUqCn3Q1oQ0EkBhxhseGeL81G9QqvOhIA=;
        b=RZzcBF2pSkaiTrWnk88my7yxK7PsosXqa39QWnKJowfrbUrYCNGi/TMr9tVnGsxJXP
         Ie4tGRM+L1dZoDmo0/yrPTzVsML5focXWI59n6QWH4iv/79jDq0+NaqSmxqoImmbZNLQ
         B443G2tDKR55+axST37SSr1aavy01SlsqQJdkonUIax0Hxcdtdbio94bXTsf6Nte08pR
         Ofv/oDvk3gI3GWs7CQrIZ02UuIN5YJU0RavSr8zXpUDodYpYSO5ffC/jVtPI+ZA+5UHh
         tvIR16J1OE/lYgLvqvjCwcNCicjfoClezgU1br14IHw3QcW2FILqu7yVaicQPkuzvXkg
         x7LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNEHToByfLEASjv03RP6ouU3UOWxeGCz2mCoBiXZf4bQxWm+tD7rWtXiDMoqkwQ3Ghwf8GcDU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgxdbpBlu0Azpuc5glpQwU8fiBwr0FeOchkKX7Mh98fA7N88Yq
	U/9cwnKsdoYppMnC7guLnBnYpyVCO6/IqQ80O7BGHEESNapST0xZUpq4aVapaacyIt+Sd745XLE
	mxkEn9VPs42ywasKAQzhSZp3WvZG42VyTe7n2SQ40iTEwlj9kk2bKCNNdWPxW3Mn5
X-Gm-Gg: ASbGncv/SVvlHzTF8tnul42M8B10aiLHUuIyz4VJ3vdmPyAiDYu+RmO9B4ZqkN4jZXx
	I4cODac3++IxcNSgUMg/dwDj7nQc5ltCpTbXic/jY4n62dMM8/mTyD2jCC8euTSMjwWgqXEx/8H
	nb3N0xw2sZRbg5xdzp2+ysJa0675aTn2+tOOENJmFx4oc8pG/kFntjNA5X6Q8vHsRyqmzVwMSQ7
	P5h3JT86wUuwaBxpfbkeAnSn4H3K1+2vtqXscTYtU8ke4rVTqaIrMwQCoaYmrncDvqcilBgttbI
	PL09EJnOi3WPIfQrUhhk2krlPV81WjT8DyUJC8P797tHrTKos/CaLls5JBll9pIjDJNpP6SRWWy
	HS4aeYhhjoV3YVhhX6nUo1vrSjFuSBh1D2XhuFtsBrNxu0FBnJrsN6JloiB03E9JGKYZu18TU
X-Received: by 2002:a17:902:daca:b0:294:9813:4512 with SMTP id d9443c01a7336-2986a6ba40bmr210931955ad.3.1763462630684;
        Tue, 18 Nov 2025 02:43:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRAhNCasizUkhZoGF5GqKPsHRAVDxhAtHyi3C5yJ9JopQ/Tb8UtFkOEqjhzBPNxQ+P5rz52Q==
X-Received: by 2002:a17:902:daca:b0:294:9813:4512 with SMTP id d9443c01a7336-2986a6ba40bmr210931625ad.3.1763462630156;
        Tue, 18 Nov 2025 02:43:50 -0800 (PST)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346e6sm167341515ad.22.2025.11.18.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:43:49 -0800 (PST)
Message-ID: <25dc40e9-6fe6-4e8d-b767-02f8a304e1ca@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 18:43:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix endianness handling for SRNG ring
 pointer accesses
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251118101723.69279-1-alexander.wilhelm@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251118101723.69279-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4NSBTYWx0ZWRfXwu5Ht0Y0ZJ71
 wI6GE22+6p/ncqc2kyrRUHacg0HLVU/hYZuV3PylwB1DeWlDxEu/kj9NLgfQJrBjW3Be/tfkZWS
 DTPV3Lve+1XLg0kugnIrOsu607SnkAxibEBx4v9SrWCXc1uje4vqDJkWVWQPBRtQ/s8wBYbvdkJ
 lCBD0E7jgke40SRZEx60azMPAEZlwCwvl0A+mosc+Q/+SxMKrjNXA3/fd4aJr1PoOfF73DkI1ns
 ud16jkG7GZc8mksM0XrYmDPqNX52oCcMWZIVytHgvtUbwfkJXHejkE0qTVzciXI/6moBDyBObhK
 08jpHXaaIsKwGau8w37EcF9xYpFekdHY+mkHkJx4lsOR0IXKUe3t+AZLkIVNVXCbdj8W+quftqw
 xom5EuIpve9OardPRVJEmBwb08AuBQ==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c4de7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=kv6mMmUb4GUwrkqO6qEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: CNtSCtDMP4gHmuTPKoD6-5dkF0NNfaQP
X-Proofpoint-GUID: CNtSCtDMP4gHmuTPKoD6-5dkF0NNfaQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_024352_016770_CCC2B5D2 
X-CRM114-Status: GOOD (  24.75  )
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



On 11/18/2025 6:17 PM, Alexander Wilhelm wrote:
> The SRNG head and tail ring pointers are stored in device memory as
> little-endian values. On big-endian systems, direct dereferencing of these
> pointers leads to incorrect values being read or written, causing ring
> management issues and potentially breaking data flow.
> 
> This patch ensures all accesses to SRNG ring pointers use the appropriate
> endianness conversions. This affects both read and write paths for source
> and destination rings, as well as debug output. The changes guarantee
> correct operation on both little- and big-endian architectures.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
> Changes in v2:
> - Set '__le32 *' type for 'hp_addr/tp_addr' in both 'dst_ring' and 'src_ring'
> ---
>  drivers/net/wireless/ath/ath12k/hal.c | 35 +++++++++++++++------------
>  drivers/net/wireless/ath/ath12k/hal.h |  8 +++---
>  2 files changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index 6406fcf5d69f..bd4d1de9eb1a 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -2007,7 +2007,7 @@ int ath12k_hal_srng_dst_num_free(struct ath12k_base *ab, struct hal_srng *srng,
>  	tp = srng->u.dst_ring.tp;
>  
>  	if (sync_hw_ptr) {
> -		hp = *srng->u.dst_ring.hp_addr;
> +		hp = le32_to_cpu(*srng->u.dst_ring.hp_addr);
>  		srng->u.dst_ring.cached_hp = hp;
>  	} else {
>  		hp = srng->u.dst_ring.cached_hp;
> @@ -2030,7 +2030,7 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *ab, struct hal_srng *srng,
>  	hp = srng->u.src_ring.hp;
>  
>  	if (sync_hw_ptr) {
> -		tp = *srng->u.src_ring.tp_addr;
> +		tp = le32_to_cpu(*srng->u.src_ring.tp_addr);
>  		srng->u.src_ring.cached_tp = tp;
>  	} else {
>  		tp = srng->u.src_ring.cached_tp;
> @@ -2149,9 +2149,9 @@ void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
>  
>  	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>  		srng->u.src_ring.cached_tp =
> -			*(volatile u32 *)srng->u.src_ring.tp_addr;
> +			le32_to_cpu(*(volatile u32 *)srng->u.src_ring.tp_addr);

s/volatile u32 */volatile __le32 */ ?

>  	} else {
> -		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> +		hp = le32_to_cpu(READ_ONCE(*srng->u.dst_ring.hp_addr));
>  
>  		if (hp != srng->u.dst_ring.cached_hp) {
>  			srng->u.dst_ring.cached_hp = hp;
> @@ -2175,25 +2175,28 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
>  		 * hence written to a shared memory location that is read by FW
>  		 */
>  		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
> -			srng->u.src_ring.last_tp =
> -				*(volatile u32 *)srng->u.src_ring.tp_addr;
> +			srng->u.src_ring.last_tp = le32_to_cpu(
> +				*(volatile u32 *)srng->u.src_ring.tp_addr);

s/volatile u32 */volatile __le32 */ ?

>  			/* Make sure descriptor is written before updating the
>  			 * head pointer.
>  			 */
>  			dma_wmb();
> -			WRITE_ONCE(*srng->u.src_ring.hp_addr, srng->u.src_ring.hp);
> +			WRITE_ONCE(*srng->u.src_ring.hp_addr,
> +				   cpu_to_le32(srng->u.src_ring.hp));
>  		} else {
> -			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
> +			srng->u.dst_ring.last_hp =
> +				le32_to_cpu(*srng->u.dst_ring.hp_addr);
>  			/* Make sure descriptor is read before updating the
>  			 * tail pointer.
>  			 */
>  			dma_mb();
> -			WRITE_ONCE(*srng->u.dst_ring.tp_addr, srng->u.dst_ring.tp);
> +			WRITE_ONCE(*srng->u.dst_ring.tp_addr,
> +				   cpu_to_le32(srng->u.dst_ring.tp));
>  		}
>  	} else {
>  		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
> -			srng->u.src_ring.last_tp =
> -				*(volatile u32 *)srng->u.src_ring.tp_addr;
> +			srng->u.src_ring.last_tp = le32_to_cpu(
> +				*(volatile u32 *)srng->u.src_ring.tp_addr);

s/volatile u32 */volatile __le32 */ ?

>  			/* Assume implementation use an MMIO write accessor
>  			 * which has the required wmb() so that the descriptor
>  			 * is written before the updating the head pointer.
> @@ -2203,7 +2206,8 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
>  					   (unsigned long)ab->mem,
>  					   srng->u.src_ring.hp);
>  		} else {
> -			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
> +			srng->u.dst_ring.last_hp =
> +				le32_to_cpu(*srng->u.dst_ring.hp_addr);
>  			/* Make sure descriptor is read before updating the
>  			 * tail pointer.
>  			 */
> @@ -2547,7 +2551,7 @@ void ath12k_hal_srng_shadow_update_hp_tp(struct ath12k_base *ab,
>  	 * HP only when then ring isn't' empty.
>  	 */
>  	if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
> -	    *srng->u.src_ring.tp_addr != srng->u.src_ring.hp)
> +	    le32_to_cpu(*srng->u.src_ring.tp_addr) != srng->u.src_ring.hp)
>  		ath12k_hal_srng_access_end(ab, srng);
>  }
>  
> @@ -2648,14 +2652,15 @@ void ath12k_hal_dump_srng_stats(struct ath12k_base *ab)
>  				   "src srng id %u hp %u, reap_hp %u, cur tp %u, cached tp %u last tp %u napi processed before %ums\n",
>  				   srng->ring_id, srng->u.src_ring.hp,
>  				   srng->u.src_ring.reap_hp,
> -				   *srng->u.src_ring.tp_addr, srng->u.src_ring.cached_tp,
> +				   __le32_to_cpu(*srng->u.src_ring.tp_addr),
> +				   srng->u.src_ring.cached_tp,
>  				   srng->u.src_ring.last_tp,
>  				   jiffies_to_msecs(jiffies - srng->timestamp));
>  		else if (srng->ring_dir == HAL_SRNG_DIR_DST)
>  			ath12k_err(ab,
>  				   "dst srng id %u tp %u, cur hp %u, cached hp %u last hp %u napi processed before %ums\n",
>  				   srng->ring_id, srng->u.dst_ring.tp,
> -				   *srng->u.dst_ring.hp_addr,
> +				   __le32_to_cpu(*srng->u.dst_ring.hp_addr),

still my v1 comment does not get addressed:


why __le32_to_cpu() only in logging, while le32_to_cpu() elsewhere?

>  				   srng->u.dst_ring.cached_hp,
>  				   srng->u.dst_ring.last_hp,
>  				   jiffies_to_msecs(jiffies - srng->timestamp));

