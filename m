Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15011CCF2C9
	for <ath12k@archiver.kernel.org>; Mon, 19 Jan 2026 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E1iWiERiA9eoYTJsvFJ9yZtgxiIeuP7mpIDKhfF5rE=; b=KQxh1SzOXF2LW9Q0P7bHhPG/u2
	OgQDEgkdSTtZ/n5fX65C4g7bBlNTKNPeri8DmPby3s2KmDULOEnOCkrVGncsEswt2RE+6lcQS9Yj/
	/qBxeGF+GrSCrKlUfFyZFzOv99LgaE9iUDd3B5WReXfsiy398dUSFItg/xPOooaxPHvF2ULmH5364
	m85oF0lB0ElOwVNffA2u3y/1nHAChhCn0t50B1+nYdaeUXaGWlUi2hnF6erVDVYsbJuRR1p1buDcp
	0uY1FulXR5Xc40pCBMh+LsW3E9T9pjsdcez1N0jYYqL7SIREXSc+wLZ+jcr0LDyiIU4mpSQqzEowI
	s2OViX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkwU-00000001Zt7-3ItU;
	Mon, 19 Jan 2026 08:48:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkwS-00000001ZsS-22HT
	for ath12k@lists.infradead.org;
	Mon, 19 Jan 2026 08:48:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J866Mp3151825
	for <ath12k@lists.infradead.org>; Mon, 19 Jan 2026 08:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6E1iWiERiA9eoYTJsvFJ9yZtgxiIeuP7mpIDKhfF5rE=; b=EWv9Jb3VBz5MEi6e
	slCa+8u/3QqHODYbU9veCaYr2tYP7hCXBHhnmvnGIDiKWNdFrzAW9ievhNRznxMM
	z/7UCbHhKRDfT8SvcIqz+urml+tVHsNmimPvZosdKVCBK6dCLvzXsF4HMQt1q8B4
	5CD8unwzrp+C2vpVDVCb3vX0rGvNSWLVsqvX+0hVdS9ymSEC2o4BUj3YcgUt2z7q
	iP5AduR+ZAVnyN87dpGmoZDLXor1jEZACH2SOP5rppsJ0JRi1m05+8RwDVgWtqgz
	UcnEm5P98XkD/xN4nkftV87RbRUM9WURhqa9HZYRPf4T4jwuogZTzy1vbxk+NOdo
	KV2xsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs7881e1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 Jan 2026 08:48:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f13989cd3so80833155ad.1
        for <ath12k@lists.infradead.org>; Mon, 19 Jan 2026 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768812533; x=1769417333; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6E1iWiERiA9eoYTJsvFJ9yZtgxiIeuP7mpIDKhfF5rE=;
        b=Tw5n7WpVmzLQAfXok4qRj32SvdAaN5GinGg+CokbikZgLO0jEb3voILmETO2gFpaS6
         j3BYFwNzrhidbForhRt4on32M/LJSeIvTLhJOvjfb/22Xq4ZThJ7po1u25eYYwWPdGw0
         2SfxFVx/7jg3RPa02exsRJJXdqfIqOjffoJ+LR53rrEjzMfbopMyLFSwkWKyb+xVVNwm
         VbsNjfxKzC99GJqSZEUYEuUQ9Gt3iF/HsGUefA6bbykjw94izMzOhXl0G1VV2lCTazcz
         AKuVxFVMlht32RXw94VXxXVJOo+3AUBE13UB0T9+PEddL44+3B9oxJGFYObFO9F0Wggp
         K4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812533; x=1769417333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6E1iWiERiA9eoYTJsvFJ9yZtgxiIeuP7mpIDKhfF5rE=;
        b=SmAopuZR+bFzHncp6Rd/oCVnwU3G+KgF6dJyiOcLU6Cfn+pcIEtaAsGMRpvp1htUQ2
         uUtNFjhQKH2zm3fbL0eLZ7QsVnVtQwGVnIEzs6YhrvK6KpQ6fqX6Coe7mHUeIWY6u/aR
         Gza3a5o06R6bvL893MJPuKH/xlJr/XmVS4AlGh7XdJbfK9wKh/PGvUfW/lQuwiXnfzrG
         ZFFYf/KbynYVRDsQDmAfesw6J9cTB2EJNkGaHosqSZMFeRqk3JJpLIeFbfr8sjUlePwd
         eHX+yyNQ+bdgg9lgzoNU4cCvXANBVlrUVEoD/AST0zovmwq3X7rREU12pZSTLQx4PefT
         NSCg==
X-Gm-Message-State: AOJu0YwAic88RtT8jRQlTixF1wZFmrM/6pW8j7kTdZ8wHEnv6lRQZOb+
	csKOBe/MRfH7L19G+hgVZHJZY1csaTzafeFQeCGfp8/MaYYvtlC1DOJ2xHaAq23p+D9upTHFXrb
	s/mTkuQFOafOB+bUJYqW+M3rFGaxoOJDpAH+75CzA7mWZJEpZ3PGS79ImYHuG6t+Nr66Eqg5WS2
	w=
X-Gm-Gg: AZuq6aKnmlwCQjUuC8Vf5VF4zv1fB50rbG/QxJ1Zbil89qm3Scvhs6rTuC7V3mt4brN
	/Chc6ult5u4pvZFFlCkCR/QmyFgLjcKsDfCBUwK99L0Zs4KEaN6oMhxfiutc3lbMgc0DkFMEJyZ
	CW25qihNVfPS6PLqeMjdrpa5GTV6AkEZ5wzZge3crg0pI6BqnCEJ/m48lVJEaz9pKlRH69VyPUL
	WKq4EN1MGtWAlYPL9fD6P2re/BU82ZnJnfnU826pnQpqbxaq7Ny9Er5vXeaPWrshj4/lPZ0y+dw
	2B7dZQHwtpL2ipT79TFLIMSq0Iwi23mlgTsaPTMl3nAFs93fIWTNs2XW7fU6Yn4uO7D3nP69+yd
	1bs6Uzjz/G96Urv5oS84hc0A9ieKBu1aQtOMDKNKJ5lU4U5tA7q7L3Lz/txuzGAh95cKlLt83pi
	Qfih2cPCM=
X-Received: by 2002:a17:903:2ce:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a717545089mr97863755ad.21.1768812533046;
        Mon, 19 Jan 2026 00:48:53 -0800 (PST)
X-Received: by 2002:a17:903:2ce:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a717545089mr97863555ad.21.1768812532525;
        Mon, 19 Jan 2026 00:48:52 -0800 (PST)
Received: from [10.133.33.150] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ca9d6sm78325155ad.25.2026.01.19.00.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 00:48:52 -0800 (PST)
Message-ID: <b947e130-707c-45f2-aba9-de9c12b73be2@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 16:48:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix endianness handling for SRNG ring
 pointer accesses
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260119073923.764245-1-alexander.wilhelm@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260119073923.764245-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KLVXzVFo c=1 sm=1 tr=0 ts=696deff6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=dxIy8T9YzDl2N4HinIcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3MSBTYWx0ZWRfX1Hqdi6G1xLUP
 IAWGsE30SFWPGfBqUhSNMAJ7FIiM8y21CPTcEZJAyWsk5UOzCBmIGBjrJPEbVUD6qkjy9JwnGWS
 /MsMWkcnVrQVwP5VTnCH85MmL7s7gU/x9vs/DS4uhzbb5ommCm8YrJNlR6iDJZjipw9P6RobipP
 lOu3LpHW25Xd53sptxncU20aB1bofR2DICEBAcMAh1ZcNt0aV8pNZLglPDUQE5R6PPOq3/Hw4j4
 7NsAT7b9mGxI55kvMRjAu8qb6W+Luu/F4ptdyRSsnLCu0u7eJr4Im+126SsQSRAc0vT35aOz/QE
 F6E5kZOrASBBNfbZ5TomX0TVHtWKTGmbF4Meb64zN9cWWBi75DV7dbJQcPodRV16F86AwMJiYSi
 jSl+4HSFgI1SpG6+aor4q4bhngjAbduEhrxuNcex/RhcLKH4cAmnf0nSIrk8aFD9a6MZ1kJrxGT
 6vruFhEkxN1QXUP0kDQ==
X-Proofpoint-GUID: HTy4BR7dVID886aznJMYpwc-U5K0u50O
X-Proofpoint-ORIG-GUID: HTy4BR7dVID886aznJMYpwc-U5K0u50O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_004856_781093_EE9ABCC5 
X-CRM114-Status: GOOD (  27.74  )
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



On 1/19/2026 3:39 PM, Alexander Wilhelm wrote:
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
> Changes in v3:
> - Rebase on latest 'ath' master
> - Use always 'le32_to_cpu()' macro for conversions
> 
> Changes in v2:
> - Set '__le32 *' type for 'hp_addr/tp_addr' in both 'dst_ring' and 'src_ring'
> ---
>  drivers/net/wireless/ath/ath12k/hal.c | 37 +++++++++++++++------------
>  drivers/net/wireless/ath/ath12k/hal.h |  8 +++---
>  2 files changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index a164563fff28..28d0ff524fc6 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -355,7 +355,7 @@ int ath12k_hal_srng_dst_num_free(struct ath12k_base *ab, struct hal_srng *srng,
>  	tp = srng->u.dst_ring.tp;
>  
>  	if (sync_hw_ptr) {
> -		hp = *srng->u.dst_ring.hp_addr;
> +		hp = le32_to_cpu(*srng->u.dst_ring.hp_addr);
>  		srng->u.dst_ring.cached_hp = hp;
>  	} else {
>  		hp = srng->u.dst_ring.cached_hp;
> @@ -379,7 +379,7 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *ab, struct hal_srng *srng,
>  	hp = srng->u.src_ring.hp;
>  
>  	if (sync_hw_ptr) {
> -		tp = *srng->u.src_ring.tp_addr;
> +		tp = le32_to_cpu(*srng->u.src_ring.tp_addr);
>  		srng->u.src_ring.cached_tp = tp;
>  	} else {
>  		tp = srng->u.src_ring.cached_tp;
> @@ -500,10 +500,10 @@ void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
>  	lockdep_assert_held(&srng->lock);
>  
>  	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
> -		srng->u.src_ring.cached_tp =
> -			*(volatile u32 *)srng->u.src_ring.tp_addr;
> +		srng->u.src_ring.cached_tp = le32_to_cpu(
> +			*(volatile __le32 *)srng->u.src_ring.tp_addr);
>  	} else {
> -		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> +		hp = le32_to_cpu(READ_ONCE(*srng->u.dst_ring.hp_addr));
>  
>  		if (hp != srng->u.dst_ring.cached_hp) {
>  			srng->u.dst_ring.cached_hp = hp;
> @@ -528,25 +528,28 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
>  		 * hence written to a shared memory location that is read by FW
>  		 */
>  		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
> -			srng->u.src_ring.last_tp =
> -				*(volatile u32 *)srng->u.src_ring.tp_addr;
> +			srng->u.src_ring.last_tp = le32_to_cpu(
> +				*(volatile __le32 *)srng->u.src_ring.tp_addr);
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
> +				*(volatile __le32 *)srng->u.src_ring.tp_addr);
>  			/* Assume implementation use an MMIO write accessor
>  			 * which has the required wmb() so that the descriptor
>  			 * is written before the updating the head pointer.
> @@ -556,7 +559,8 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
>  					   (unsigned long)ab->mem,
>  					   srng->u.src_ring.hp);
>  		} else {
> -			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
> +			srng->u.dst_ring.last_hp =
> +				le32_to_cpu(*srng->u.dst_ring.hp_addr);
>  			/* Make sure descriptor is read before updating the
>  			 * tail pointer.
>  			 */
> @@ -711,7 +715,7 @@ void ath12k_hal_srng_shadow_update_hp_tp(struct ath12k_base *ab,
>  	 * HP only when then ring isn't' empty.
>  	 */
>  	if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
> -	    *srng->u.src_ring.tp_addr != srng->u.src_ring.hp)
> +	    le32_to_cpu(*srng->u.src_ring.tp_addr) != srng->u.src_ring.hp)
>  		ath12k_hal_srng_access_end(ab, srng);
>  }
>  
> @@ -810,14 +814,15 @@ void ath12k_hal_dump_srng_stats(struct ath12k_base *ab)
>  				   "src srng id %u hp %u, reap_hp %u, cur tp %u, cached tp %u last tp %u napi processed before %ums\n",
>  				   srng->ring_id, srng->u.src_ring.hp,
>  				   srng->u.src_ring.reap_hp,
> -				   *srng->u.src_ring.tp_addr, srng->u.src_ring.cached_tp,
> +				   le32_to_cpu(*srng->u.src_ring.tp_addr),
> +				   srng->u.src_ring.cached_tp,
>  				   srng->u.src_ring.last_tp,
>  				   jiffies_to_msecs(jiffies - srng->timestamp));
>  		else if (srng->ring_dir == HAL_SRNG_DIR_DST)
>  			ath12k_err(ab,
>  				   "dst srng id %u tp %u, cur hp %u, cached hp %u last hp %u napi processed before %ums\n",
>  				   srng->ring_id, srng->u.dst_ring.tp,
> -				   *srng->u.dst_ring.hp_addr,
> +				   le32_to_cpu(*srng->u.dst_ring.hp_addr),
>  				   srng->u.dst_ring.cached_hp,
>  				   srng->u.dst_ring.last_hp,
>  				   jiffies_to_msecs(jiffies - srng->timestamp));
> diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
> index 43e3880f8257..ff6148be94c8 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/hal.h
> @@ -914,7 +914,7 @@ struct hal_srng {
>  			u32 tp;
>  
>  			/* Shadow head pointer location to be updated by HW */
> -			volatile u32 *hp_addr;
> +			volatile __le32 *hp_addr;
>  
>  			/* Cached head pointer */
>  			u32 cached_hp;
> @@ -923,7 +923,7 @@ struct hal_srng {
>  			 * will be a register address and need not be
>  			 * accessed through SW structure
>  			 */
> -			u32 *tp_addr;
> +			__le32 *tp_addr;
>  
>  			/* Current SW loop cnt */
>  			u32 loop_cnt;
> @@ -943,7 +943,7 @@ struct hal_srng {
>  			u32 reap_hp;
>  
>  			/* Shadow tail pointer location to be updated by HW */
> -			u32 *tp_addr;
> +			__le32 *tp_addr;
>  
>  			/* Cached tail pointer */
>  			u32 cached_tp;
> @@ -952,7 +952,7 @@ struct hal_srng {
>  			 * will be a register address and need not be accessed
>  			 * through SW structure
>  			 */
> -			u32 *hp_addr;
> +			__le32 *hp_addr;
>  
>  			/* Low threshold - in number of ring entries */
>  			u32 low_threshold;
> 
> base-commit: 758064145fe77e06d07661b27dfa9c24fe0309a3

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


