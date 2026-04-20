Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E642EA71A4
	for <ath12k@archiver.kernel.org>; Mon, 20 Apr 2026 02:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ke/Wtb4q17dqFQowkNz1oZz9+IjyVbzRZwHzDjvZAM=; b=3XYfWlR5A31zuFDeYpk+iltrB2
	gHNhG0MHcUg1xFERcZrbFAP/ay2Ljhk+0wbVvU8pqjDMQOpeeYvUurGeI4JdtTC2aFRFXQfJX8kH6
	NJAPX/VrWGWaY8B9oSOZKDCnfXuaXDu432qZu0FOURm4s38d5swQdm/EpebnVU0S4FWbAgSz+z8jl
	osoo+26VX/vXyQKHZ3GcVc8kbBbIFNnwCiEBVjOjyQ6IZj0/aXofPlBCZlQixyS2PyJ4IN/vsBH1J
	n/fbi0qbjnd1BSFrDMMIYD0yP5alVKX5VIuGoVOYK4+bw9xgGI1gjxInHZ17P6pVqJ9u9Uu2gB9UO
	opWCSUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEemy-00000006LI4-45dF;
	Mon, 20 Apr 2026 02:55:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEemw-00000006LHh-3ICM
	for ath12k@lists.infradead.org;
	Mon, 20 Apr 2026 02:55:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JJTLqS1761975
	for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 02:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ke/Wtb4q17dqFQowkNz1oZz9+IjyVbzRZwHzDjvZAM=; b=UNwIVKysyw5XaRKz
	SqHH5iZ/+Dje7xoafkmX1CgLIofPRyMNzP7VcJndZUxtSUk7/li6+ssV/Zkhp8nU
	HYsOnqehXlMOSo1btErnNduaoByUXpHlyrqRPI+lVhoPbg9Gx3oIIiHQJ9+WuSZv
	/gWOeAUbbtLR38DihbuswEnCWekenM3Ua6CZ9EJf5P9AH3rjZdSXp6e5obfAY69f
	eOK0xSIizjUTktVdyyP97GoM2GRYwm3bQXkn//yr3K3+IwDMmEjU82cwYxmG0I0o
	k7+gVvxS94xOxNarfD0R+cyz02zk6p7RUIbQXQ1dJ7xF+3B0TWLUbXPBRSMAo1rN
	SceP8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fut69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 02:55:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso23650935ad.2
        for <ath12k@lists.infradead.org>; Sun, 19 Apr 2026 19:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776653704; x=1777258504; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ke/Wtb4q17dqFQowkNz1oZz9+IjyVbzRZwHzDjvZAM=;
        b=Vm3/IDClD0h67ytkir114qXML0GzWtGRcC5M0/bGipMjPso2dlY0C9Xyt9B+V4VdMP
         MthambfU4aSiikYQunV7U0ghtua7W+8wm+ElMRp30MmXAT+/wpY6+UHAb7EDVK2/t6Ri
         /nFFStzhMaERmPm5X9iYZauiO2CqKCbQjKKxDMoek+eqvSKJBFBPncQx4ngfs6y1Mq9l
         467YFafBNSGWR9P4yGPUFRmQBnPPptcq8D1o1Qntk/L7ZA1DqINJjzSjT281VdjQDh+E
         /FU7/GMof2+rXFhFMjuL7BaWL7AZcHonEvPk3vNvBZl3AlM8uSC4FYm/IMTijZJseN6d
         JV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776653704; x=1777258504;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ke/Wtb4q17dqFQowkNz1oZz9+IjyVbzRZwHzDjvZAM=;
        b=OfsMLzj7i8jNaFBEp6TXeqzZkRgp14qhxIaqq36r1CRmPmBM/BYcdB4lXbwKaB7GSD
         gOJI4ME0+j00PUqJZ0upY4Y+HA3CJ8HSTE5wRTWV5rXfChYUqcKqo1Go0WrZPSS4NjZ2
         xnqRUQ5a5aYLAVT+wUx3fp6OcwKVKtiZK4i4TNCogTp4zBu3KF22L9596hnv0/O/agpX
         0gGsTZCEbBJjAU6oz1FBjfMlF5n0xjB7NiyBtdDxnBi5S2MC1ZZKdIoOmJQdBPQSjccT
         aSHQ2Lc/W/4KZg04KsJfyx/bsDDNHV8dg5Nb59xiuGNX3HUSivqV3G8WjLpmkua/XfZx
         8Z2w==
X-Forwarded-Encrypted: i=1; AFNElJ+Nq71vSeP+44j/411xylO2C7t64t9Ev4HxRivdVQWFTQ6QM4JN7RNKQSL9MC/unE/VrEFzmGY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4SYdaqj26jgu+wwjyFoMFj3z/v9CRE/E2UQlIapEKd26sGZXi
	yjQZO3XQnRPiZAiJGV9ItUYSGYDDDvrgNz08GVpQ/yDyEkvG0BkBjAaCDa6rQ9WcrMGI3EU+/BM
	4KJC/1ih2UVq2fdQ1fRgIdAUDw+1iRvExn8iYUewwBHIS9XwLuAxb+5RpPDXXdrlT
X-Gm-Gg: AeBDievIvRiXqIxYJX25aLlefZSIvmjvsIQfirbnOi0vmQB85u89cLENiAeoFd8nuI2
	DvKHwG291b8vd1K4z/riRJSOeIzisrKApeJZkDHjCllcXuiupPMy1fo09+S+hpNFGIS5enGQoZj
	zrU2hT1YkIcrPd8jS4UsJdE+1WI4cGZd2Q/bxqV/nDFLPNwSo5l8rHbHlI7/smSnnDXdA7ZDetA
	viHWJLCp+ckK2gBwl6fTNouffzKeysyzWaF64VwN4tX6QnaRz5QQa5qEjdFEGIjQUR3DhjmuHM1
	VyWBabK0pI7hlKm38mD2xJ++Vc4IURs56kM2V1MVFpHHtRDWweOz8tMeSJ7xAdvD9H+MMljwwtH
	rdbU//VfbiGlK+qXlEakJBOv2f7VWLsVKqJdRW17qpb+3mz5b5ZQlZtxDjWaMW1gUGmNjQBy4WR
	MnfF5DWn7ZPIxLAdla4q1O2UsDkDhDUA==
X-Received: by 2002:a05:6a21:3288:b0:398:6461:688c with SMTP id adf61e73a8af0-3a08d687640mr13204994637.2.1776653704377;
        Sun, 19 Apr 2026 19:55:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:3288:b0:398:6461:688c with SMTP id adf61e73a8af0-3a08d687640mr13204970637.2.1776653703835;
        Sun, 19 Apr 2026 19:55:03 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703059fsm6627677a12.24.2026.04.19.19.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 19:55:02 -0700 (PDT)
Message-ID: <881f2840-6585-4439-b5e9-90cbe47096bb@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:55:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix invalid IRQ requests during
 AHB probe
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260414062829.2371761-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260414062829.2371761-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNCBTYWx0ZWRfXzY0YrRzImBgz
 xtNGTo+A/NTDNAg5+zKDADZYYXVs9zI6vC/hXGsz8NpHE+s0TUyZVINDdYmRzBPMjk5lFwAwNlA
 LyRLh6/EzqNhy8z0iYys7vuSkiUqCRH3pl7r2vOhpWUxw+oYVQJMsfw4WAPiQUkqtnb+gafywJ1
 Lvla31Vev7xViIdSuI/loHWn+ioBrlrXD317tsG1jyABl1rNA9oonzoQuUwyfT2zlw0A1oxgb2D
 5PbMe6uUKr9IO6+m9ujkGp81j3F52e0Dfy45K3E5ZSe2OONH5kF2s5CpTS8bLwrcGfya1iwlH/u
 kxsJ67KB6BgvaSKHSnUqfivbmHHegkKgplr1P5VZk/Uw6WpqDntqa95oH11TnfOJHhaHP++j5Q3
 +kFofdK/mHXlyy01O2ifSDJ/vGX9H0L6Pf/Dug0sNHOJxLRvypK02TOm6fY9dIQMl/KuhuLxvoF
 6KcNy+n4Rww7GpDg3oQ==
X-Proofpoint-ORIG-GUID: 6YGDfdLDXH2AslNV1NIjbFD6yfnZRF7t
X-Proofpoint-GUID: 6YGDfdLDXH2AslNV1NIjbFD6yfnZRF7t
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e59589 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Rz3G870NILOoTZsrui0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_195506_972164_080E4071 
X-CRM114-Status: GOOD (  22.92  )
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



On 4/14/2026 2:28 PM, Aaradhana Sahu wrote:
> ath12k_ahb_config_ext_irq() iterates over ATH12K_EXT_IRQ_NUM_MAX (16)
> entries while checking TX ring masks, but the tcl_to_wbm_rbm_map array
> contains only DP_TCL_NUM_RING_MAX (4) valid elements.
> 
> When the iterator (j) is greater than or equal to DP_TCL_NUM_RING_MAX,
> it accesses tcl_to_wbm_rbm_map[j] out of bounds. This results in
> reading uninitialized memory for wbm_ring_num, causing the driver to
> evaluate incorrect BIT() conditions and request IRQs for rings that do
> not have an assigned interrupt line or device tree entry.
> 
> This leads to request_irq() failures with -ENXIO or -EINVAL during
> ath12k AHB probe.
> 
> Fix this by splitting the loop into two separate loops: one iterating
> over DP_TCL_NUM_RING_MAX for TX ring, and another iterating over
> ATH12K_EXT_IRQ_NUM_MAX for remaining IRQ entries.
> Also add a bounds check for num_irq.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/ahb.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index 2dcf0a52e4c1..30733a244454 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -583,31 +583,36 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
>  		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>  			       ath12k_ahb_ext_grp_napi_poll);
>  
> -		for (j = 0; j < ATH12K_EXT_IRQ_NUM_MAX; j++) {
> -			/* For TX ring, ensure that the ring mask and the
> -			 * tcl_to_wbm_rbm_map point to the same ring number.
> -			 */
> +		for (j = 0; j < DP_TCL_NUM_RING_MAX; j++) {
>  			if (ring_mask->tx[i] &
> -			    BIT(ab->hal.tcl_to_wbm_rbm_map[j].wbm_ring_num)) {
> +			    BIT(ab->hal.tcl_to_wbm_rbm_map[j].wbm_ring_num) &&
> +			    num_irq < ATH12K_EXT_IRQ_NUM_MAX) {
>  				irq_grp->irqs[num_irq++] =
>  					wbm2host_tx_completions_ring1 - j;
>  			}
> +		}
>  
> -			if (ring_mask->rx[i] & BIT(j)) {
> +		for (j = 0; j < ATH12K_EXT_IRQ_NUM_MAX; j++) {
> +			if (ring_mask->rx[i] & BIT(j) &&
> +			    num_irq < ATH12K_EXT_IRQ_NUM_MAX) {
>  				irq_grp->irqs[num_irq++] =
>  					reo2host_destination_ring1 - j;
>  			}
>  
> -			if (ring_mask->rx_err[i] & BIT(j))
> +			if (ring_mask->rx_err[i] & BIT(j) &&
> +			    num_irq < ATH12K_EXT_IRQ_NUM_MAX)
>  				irq_grp->irqs[num_irq++] = reo2host_exception;
>  
> -			if (ring_mask->rx_wbm_rel[i] & BIT(j))
> +			if (ring_mask->rx_wbm_rel[i] & BIT(j) &&
> +			    num_irq < ATH12K_EXT_IRQ_NUM_MAX)
>  				irq_grp->irqs[num_irq++] = wbm2host_rx_release;
>  
> -			if (ring_mask->reo_status[i] & BIT(j))
> +			if (ring_mask->reo_status[i] & BIT(j) &&
> +			    num_irq < ATH12K_EXT_IRQ_NUM_MAX)
>  				irq_grp->irqs[num_irq++] = reo2host_status;
>  
> -			if (ring_mask->rx_mon_dest[i] & BIT(j))
> +			if (ring_mask->rx_mon_dest[i] & BIT(j) &&
> +			    num_irq < ATH12K_EXT_IRQ_NUM_MAX)
>  				irq_grp->irqs[num_irq++] =
>  					rxdma2host_monitor_destination_mac1;
>  		}
> 
> base-commit: e6630ad4c58f89ba72e64fca5989ecf1e06319c9

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


