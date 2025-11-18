Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B84CED24B
	for <ath12k@archiver.kernel.org>; Tue, 18 Nov 2025 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6zb6JppFJxO6FRYEYO9HdXeQ187MTtJfuPUf1xOEa4=; b=gelToJ4kwoY3n9cdecVj+yC4/Z
	wHFZDJnQuBmxoA7kLrYi7s5L8n1oPWAb75UlMjK4Q8g3tqLQctFw0eZqpN1x8ve+vUsXRZu3k3qHN
	uB84Q/1XdKTbQgyKPHBJVhe7G65Yt6szwzX1k8cBriah1tyn0LUUT19FUjDOE9ButUvaAR3xfSNfd
	4m7pKtWAthYZPDfP1MSoE2KBp1dKNn329e1BJUYkhU728LF9GrgfED7gqfXvdGYGrvS8uaFjtJ7DS
	eRA3oX+eFnB8Pedn3JD67ir7XnCLmvmE3ynBGaqITGTiJQRAHqXuJFx2u4pR4oVOW3zIM7RfF/zzM
	TBffCaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLI7Q-00000000AT8-1Q6s;
	Tue, 18 Nov 2025 09:35:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLI7M-00000000AS5-0WPi
	for ath12k@lists.infradead.org;
	Tue, 18 Nov 2025 09:35:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI3CJS1376011
	for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 09:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6zb6JppFJxO6FRYEYO9HdXeQ187MTtJfuPUf1xOEa4=; b=jmMyNUDP8UqO92Fx
	PUP+9oiwXkuDq7/5oOqtr4cu0z1HypwepG4zEhXqFSHDofwXby3oebfWjTzcQUvA
	Q+9vJGcrfsfWVsc/qkWtTsDJWy+L2TIGAVjV027JC0ykDAzMEMjPah5fazZ641OO
	cxXEjcxEMCCjoLR1oOkj9x6+I2Kxty+zkwW9k+j8th9jgBy/rq6/FM3TdCvIoaZN
	DxwFboMTprM/uu7nrN8XcpfnTosl5d5nJOCqZyLq9b7uzT3B0dmiZC80/fIm1lNU
	PDzwbXHuNYlI/dxwqHH8CY6WKlCM3qpiotRpv5+AfuX3SxG8sNAEnX4y9+wg7Lkn
	5iatYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njmpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 09:35:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34385d7c4a7so4952969a91.0
        for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 01:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458516; x=1764063316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6zb6JppFJxO6FRYEYO9HdXeQ187MTtJfuPUf1xOEa4=;
        b=C3jwMflLRY3RCwEsXe0oagZ0z0TCY7xkuZZ8jSMdNwAnoob4CDNEFpNVo6GTRmcThv
         /aLfo0mxDvHHvy64D6MsOGBgWrPKlk4E7Dy6DFlktIOJTtgDBGUlkgjbvayp/rTmryJ4
         zD/JsRJ9OluJQso1wmUdCBosyJ+zf3iSXPDrIt2zDSC3u4bZpUsrCXrilVPUsugM5Mhi
         cnrRu5Eg2pVpJX2ZaJgBAB0nOdUlscsLSTGfNGvNYxTq13vzWLC28rzT5ntgK3+QEMf4
         vgPUWO+HMU29/mah6EEPrNLKaL3AQmGbcSsEA0LOSinolDPujnb0+qbyFJItOd4OvF6q
         Wwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458516; x=1764063316;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6zb6JppFJxO6FRYEYO9HdXeQ187MTtJfuPUf1xOEa4=;
        b=tJdZ8PF5ZG8KINCi7Xt3XtTr85wupgXEwh6fxKd/9BfSuGEtnV2yP8EQu0grqta2S0
         +4A3fkwWHMpjWtdZnxH9VsnUgah5qdLopb+06k2AA06Zr9Ns8zLec4+tbd2Jpwj+A4wG
         6KamZl3n4AvSOVVAHjB7pIkilOUBjilJkOOad7HsmTszcBYf3x1VZYEsCwgAj8E5kUvB
         taX5oOn/1c9OknXgr7Z+QYlCCYctwlcBYSw9hnM6ARLBlRgKiL5zLIvMpGKqmSQ9FamP
         cxrfnXVw4nyaQ4WIrHVK1xQ9GMzoICPqB/1iyDCSpBwgSA7DW2bmsJALzQBewNAccsKW
         g6Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUDv8Hn4oxQp7TzPuVPbC3vVnDYgFP9ZRa/jFFBdU3fvcqJhMfKxQuRJ/NIyAfb2bXr2vaknNs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSUngJEbsb26U13z1q2eFeAnwBldjRlh+/VeZ37beAAHzK5DYQ
	cJymsP2JZqm0f6CvZN0grl7Ca6kuY/H7LrCe45oLOLmPbq2PIZzXSHjVN4kZ4KX+kdg26DNiLud
	gj4EfuREzpp6FCtrhcWNjo3Bv6sPAt35jhJmUkdIlMM+YdCWbHao1JmX+8ZiNFI8FNGuScsqz
X-Gm-Gg: ASbGncsXY1Osfb3in3Kh9qNoDGw4GFa+F9rXzealswXYT0pPIDS0ixeE9caBrXlhC1M
	ITr1AH8bku6vSe2/0GLfd/dJ5QvVb0obymi41xNF2LpZ1NFBEbvcFKJhgkCtibEjIW5nns8lgT0
	m6aqJVCk7MCjcDGjlx7jRv8X3IDwUl0wwXTycw+Y7KMB1NuMrZ59ELbCx0s91f6lPD+3LaN/JOE
	mStWhoKOzZnJXBnvtFf/MfwlHvm4pik88WPsOODsAbHLDau+EOcGqmM7Ef3YCedpJb9OZWkVYbs
	m7IRzExvBRQZYln0ZalzMAFAsK7fU161PVBl/JpyTZcuBqYXmx6r5ohCIX//5fQLXfHLvAos7Do
	hL8W8Kc2I7lrH4I9ADewzobxQKHGbhYc2CABSPZmX8VqqY4L2rxGB5EcCKKsTp0sV4+ficgv4
X-Received: by 2002:a17:90b:4b04:b0:343:60ab:ca95 with SMTP id 98e67ed59e1d1-345aebc9e75mr2507426a91.5.1763458515901;
        Tue, 18 Nov 2025 01:35:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXRcxvWrlmHpBONzXrlYlYFm6xtDX6uutpSIyn78ZyHZr24J+xzPC5IkbKduQHNL3L233EVw==
X-Received: by 2002:a17:90b:4b04:b0:343:60ab:ca95 with SMTP id 98e67ed59e1d1-345aebc9e75mr2507380a91.5.1763458515374;
        Tue, 18 Nov 2025 01:35:15 -0800 (PST)
Received: from [10.133.33.104] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e06fe537sm21110853a91.2.2025.11.18.01.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:35:15 -0800 (PST)
Message-ID: <5a308d21-d463-4d6f-b5d3-95a0c2ede2c1@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 17:35:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix endianness handling for SRNG ring
 pointer accesses
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251118072123.19355-1-alexander.wilhelm@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251118072123.19355-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NSBTYWx0ZWRfX7z19m8zoGGqh
 iAQwB+eBussMNdmD7lg72x4En+lnqbI0Pfa7HdZaxllN7h4akuKHe6en0/2nZYqLyuxahXfAVmS
 xClLbVLX67oPxOVe/b+cfgLZj6wlN9woFB5zMoc3RFtD6tduxVXkmJokLQd8jsBrAUu1hDFhzWE
 y8SDuGssRZMLc+bIqgxoudnuLPtXJg0o9hN5tSC3UvHNIXYPab4C8LbI7pMV0RuJPMyTUDPK0MA
 vYDWSaGnzH/3pormr3i9LTakDMGUWbxx7dSPsGmtGCVmdm6OWG3teMEqtH6u2o2DAkUlSmHH46p
 NxZKybRG8T6sSZdBx6It9IJMSoTMNAJI77aHOfZThg2wSyvXBuDoFUZB9zEPpH2xdYcM6WZ4rjC
 S+ziDPkGQCWJB44M578+toe/AqfpHg==
X-Proofpoint-GUID: sB7QRejEbp7BcoLRpBJDB9TcGT_MQRSR
X-Proofpoint-ORIG-GUID: sB7QRejEbp7BcoLRpBJDB9TcGT_MQRSR
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c3dd5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=Sty9O8k4TDZ2vQ3Klh0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_013520_314916_3FF022C5 
X-CRM114-Status: GOOD (  23.76  )
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



On 11/18/2025 3:21 PM, Alexander Wilhelm wrote:
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
>  drivers/net/wireless/ath/ath12k/hal.c | 35 +++++++++++++++------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
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

should we also need to change its type to '__le32 *'?

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

why __le32_to_cpu() only in logging, while le32_to_cpu() elsewhere?

>  				   srng->u.dst_ring.cached_hp,
>  				   srng->u.dst_ring.last_hp,
>  				   jiffies_to_msecs(jiffies - srng->timestamp));
> 
> base-commit: be83ff7549057d184b693a85cafc10fbd520f3d7

