Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11759CA6013
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKNDWG+xPvadUx2M61Ah5llef0LaBAxJ2rlM1bN6Bmo=; b=jE/3TtDlPS10hhON1kl3wlVlnv
	b76VcdnDPfnZ/GA/uT2peseA+zBueqp9bXZawD6AIMJZefMH9wbJFoKIWUaAQL0+Rk/RnWrZgTHaS
	TRUfjc6ucRxRUvae4yEh6sIvZ+bvvs2U7usOXVjF6WjDipeyQB5vLTy1tXPsY5hNQ+RqFlbuW87fV
	eruGvxKItq6gUCiQ6Bjxfw2UEZYkFlTddCiQz1Am3BDi85mcNKqFpSvstFTqBYXEQePunJAjxa9Il
	/WdVFZAZHumgQHkRze57ATVuXkgkeOcpzDUuUOEpQ1qXJGQgG7VAKB6Kayc6mBmS4iWFPmGLl26No
	Az4As//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEquX-00000004gbT-1XCb;
	Thu, 08 Oct 2026 16:24:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEquU-00000004gb7-2joQ
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 16:23:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVWnJ070491
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 16:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKNDWG+xPvadUx2M61Ah5llef0LaBAxJ2rlM1bN6Bmo=; b=S3ktvv0kLw4DCV+Y
	fE8ir90dF6sLDVUqey00+QeZ27bSZmH6dDPLQNULii2EuLg2dYEKMlA7Yan3Ecl4
	eQ1Hxus/SLRvcDKexq0vHAYQO4P4Ga4baTm9rByoBXlGk/EfWGbw+ldxIplvonWj
	u8RWb3bXS/e8+XxL/eh4fRuSpkajFX3az1U+/68K0etObFvFrpd26SShI4M1E55t
	xqJkdX7leTooKSO1PNvJLvDIS3qtXW9s1XdjWCGTjH5p6V7BEzatTTwCKKk53Cil
	WVMKYRWOIEDfqF2xn88gATMTBh9caHyWbRPyHnmBfi8GnzF27owKzv4+Q/sAgSHS
	rZTLEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sgbasv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 16:23:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10445176eec.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791476637; x=1792081437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKNDWG+xPvadUx2M61Ah5llef0LaBAxJ2rlM1bN6Bmo=;
        b=Vp9ZWn1LNotzLDsdEBQkeqo0l6XunV3UHu1mkapuojenW/GK0SzyaXU8GhUd0EusiE
         l+nUxqSMpC8Yk8oCp70KNEhK4gjSvZJaEy198pRjiGr06tO1y40tXcdsQGafZzu8j+v4
         utdPW0hNz2tOWZbAP1dnvWBRDg0JGHcEJWkeIUm+kEMOGNAORhGbOZAHZ8OAHIHcRSNO
         VeNCioOSYmTQPnUAqQC3YWjeUQsS5zWRcKiaALZ0Hm7ThQYz0yXMqgntj/ouCN1LNAd8
         gsBMxoRGmhNaMvth9GCBerd3cBCtEz92o1hYkqkOXTJMU+YPrppJTXDfGUnm3aTQixsh
         j+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791476637; x=1792081437;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKNDWG+xPvadUx2M61Ah5llef0LaBAxJ2rlM1bN6Bmo=;
        b=O0lFOH56wUKmO0EY5zpUGM4Ks8AfbxVmiQNdF3/xY0sKrjw0ui8WqPTcRXCPrV9sCO
         Wvn0EiHV6atJGQZehZs1f0dEG43s1lkA+0MLiDHwxPwzMmclieQkZObnK1N+ZYJ/JIeu
         JqTlWTocZfn9zMiu4gLDcn22JiJullTX4SjvNEPu2wSULJS1bDhat0j4/E8ar5HdYam6
         Hi4qjK1Zkf3aGXtzIWQXBtnvSgIPe62OQAi1SRq8lSBLIEliyGcqQh3Dgp67LrjpyeV2
         iSudNrmTZgR41A8Iyfq3Ce41v0QoB+YXfecVrwJ9HW8bdL0n9Nc+ni+2dnmavi4x9wiE
         GRBA==
X-Forwarded-Encrypted: i=1; AKwUvBxbMK2/+P/watV8Nc3Z0u0iv0ZNCz3Dg9LA67dV6Mr55MwOIfBwnuT+OcYUh+Sa5dYh63OOsC8=@lists.infradead.org
X-Gm-Message-State: AFuF++kKI2zHyUq7x8DBIo2c0kkbev4J0aBCZlrae6Rybs2m7GStCBXI
	1HK4Y1OA+8m0CCPav6KljK8WQBf/vbBlxQVgMbGvGLyKdkqKxn2K/8eesRro5413c9xSaF44Msb
	wCrSOe9+X+FWbLFrRUSM1VZBhA+5T1C2hDbbkEATuHP9OmdGKZ9fox18XtGuzmqBQ
X-Gm-Gg: AYBFou2XSYen6hXsvt0mSkBFru4WD5eP62xtYqIqJ2dcD7L8nPZjz9NFFfvZ5CrOTbf
	UVksv30OMW2swCcfkmsripdbuZc9ygFOtdEjb6i8i6QYQY80TIijrgcbC/0+HsSEK4YhT+aEcYF
	OPwpxcoxVYC8n+GzE8xGMFSZFRPTsz+ziJDceGHYZfsdavAOYwHK19AbHDS/UjtcqqGUzvh5S8d
	BsDUqCIDI/1ailsA3QTZf9Q02DZYalLtYQSVX2xYo0U5SzjN74QTFt27uzFwXYiNYewSHWptjEj
	PPKSkvi/FQuKHhdrHDa9RNGBaU0iT+kvI1g47mJJczBum8jNTmLl/m63246zFZ6thszDmvAcLBk
	5LRNjIEBbemM5iVA4Qxj7GDzP8EVCdgzHXLnlgBRvrW0=
X-Received: by 2002:a05:7300:c00d:10b0:341:c6ca:1df3 with SMTP id 5a478bee46e88-3515dd78d9fmr7858519eec.14.1791476623573;
        Thu, 08 Oct 2026 09:23:43 -0700 (PDT)
X-Received: by 2002:a05:7300:c00d:10b0:341:c6ca:1df3 with SMTP id 5a478bee46e88-3515dd78d9fmr7856538eec.14.1791476593913;
        Thu, 08 Oct 2026 09:23:13 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm18325678eec.3.2026.10.08.09.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 09:23:13 -0700 (PDT)
Message-ID: <cf9dbfc5-5787-4a69-ad04-153afdec1cb4@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 21:53:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Make RXDMA buffer ring size
 configurable per memory profile
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
 <20261007-mpp_ws-v1-1-739b1fb87d24@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007-mpp_ws-v1-1-739b1fb87d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cREx5LmFVbzWO_os2N-LRy5cbsjYQgRg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2NSBTYWx0ZWRfX5tKzHnEKT9dO
 67OSCn3f6Co9ispfcD1LrzoGaEY4Pp1X920rTxDlmWiapk6c+aATNhv8bH0a9bf1A6Tcaz1fKfx
 XTkce3mrgn9N9hFeMTRHM2loBbPttV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2NSBTYWx0ZWRfX4s56YdSx5yl9
 BOe33c/Z0xeDTPd5sAelDMCAvHmd3G/ppxwFlODUGbYIBgPCAjD5tCGNS60kDc77QpxAtAhTzid
 2XwEy0ZhAstjqM1F1AoyLTi+taker9JE6zwbrIzsXNigOtVPdzxoRc12HNteryWZ+eep3mYhm4p
 26OZrHSNg8HHQvgiNJ3O4XnioWAimdPzSvM1JqMOH4W2t1JLtIP3F8PhHTBSDn5liXxBQigrkXD
 dSo6niBME9bfDFPeHpIBQ9/hxIjlE50gQhFPW80AJj2Bi2NEXXW2pFCQ2K4K2CpuEdXOgMd+Avh
 I5/lY4ugQYAdQo0jV7UcR0kHMwbS1FzaAU5ZcER0TeKmXug0gB7v4jAL0stYTT7HYXfT2srUmZJ
 /czHGjgEeHOtZYU7k1yOMoUhBkI3If1+/uPt1mrch/0xqSer88BsoUnrX6gVTiTl7EoWFvQXOSY
 GCMJNhSn1nHSxUKojdQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7c39d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tr3Ra7ay5OclNWw_GIwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: cREx5LmFVbzWO_os2N-LRy5cbsjYQgRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_092358_730033_BD41F8BA 
X-CRM114-Status: GOOD (  22.94  )
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

On 10/7/2026 2:53 PM, Aaradhana Sahu wrote:
> Currently, the RXDMA buffer ring size is hardcoded to 4096 and shared
> across all memory profiles. This prevents individual profiles from tuning
> the ring size based on their memory and performance requirements.
> 
> Add the RXDMA buffer ring size to the memory profile configuration and
> implement ath12k_dp_rxdma_buf_ring_size() static inline function to
> access the configured value. This allows different memory profiles to
> select an appropriate ring size based on available system resources.
> 
> The function follows the pattern established in the previous patch for

Previous patch? Did you forget to add a reference?

Or maybe we can just say:
"The function follows the existing pattern of DP ring size helpers, 
taking struct ..."

TBH, I'd prefer to drop this paragraph entirely since it's already 
apparent from the code.


> other DP profile parameters, taking struct ath12k_dp_profile_params
> pointer as argument.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c  | 2 ++
>   drivers/net/wireless/ath/ath12k/dp.h    | 8 +++++++-
>   drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>   3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index e527b59ecba5..764e646d0090 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -54,6 +54,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   			.num_pool_tx_desc = 32768,
>   			.rx_desc_count = 12288,
>   			.rx_release_ring_size = 16384,
> +			.rxdma_buf_ring_size = 4096,
>   		},
>   	},
>   [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {
> @@ -68,6 +69,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   			.num_pool_tx_desc = 16384,
>   			.rx_desc_count = 6144,
>   			.rx_release_ring_size = 8192,
> +			.rxdma_buf_ring_size = 4096,
>   		},
>   	},
>   };
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index c53eac20b989..108e27dd5797 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -31,6 +31,7 @@ struct ath12k_dp_profile_params {
>   	u32 num_pool_tx_desc;
>   	u32 rx_desc_count;
>   	u32 rx_release_ring_size;
> +	u32 rxdma_buf_ring_size;
>   };
>   
>   #define DP_MON_PURGE_TIMEOUT_MS     100
> @@ -210,7 +211,6 @@ struct ath12k_pdev_dp {
>   #define DP_REO_EXCEPTION_RING_SIZE	128
>   #define DP_REO_CMD_RING_SIZE		256
>   #define DP_REO_STATUS_RING_SIZE		2048
> -#define DP_RXDMA_BUF_RING_SIZE		4096
>   #define DP_RX_MAC_BUF_RING_SIZE		4096
>   #define DP_RXDMA_REFILL_RING_SIZE	2048
>   #define DP_RXDMA_ERR_DST_RING_SIZE	1024
> @@ -730,6 +730,12 @@ ath12k_dp_rx_release_ring_size(const struct ath12k_dp_profile_params *p)
>   	return p->rx_release_ring_size;
>   }
>   
> +static inline u32
> +ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
> +{
> +	return p->rxdma_buf_ring_size;
> +}
> +
>   void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
>   void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
>   int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index cfaf26ae2720..36be543b7c50 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1699,7 +1699,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
>   	ret = ath12k_dp_srng_setup(ab,
>   				   &dp->rx_refill_buf_ring.refill_buf_ring,
>   				   HAL_RXDMA_BUF, 0, 0,
> -				   DP_RXDMA_BUF_RING_SIZE);
> +				   ath12k_dp_rxdma_buf_ring_size(dp_params));
>   	if (ret) {
>   		ath12k_warn(ab, "failed to setup rx_refill_buf_ring\n");
>   		return ret;
> 


-- 
Ramesh

