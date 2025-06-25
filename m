Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11DBC77B7F
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 01:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzYqr02+eay9QpK+UlOyVQXwAJuTLz52YD+EgciPrwk=; b=YWCFboqlokwkyUSVdh1cOBCTM3
	UZcInW9pmLeZbk4DvZDvDmBp3prGvAjNbE36S5wwa0R9l/DhOaq1xcrsVRQsMhSAB7Q9R9+QupnLl
	/IQOgQp/ZlTdPLhQ9xB7d4ArEYIp2bwZ0fXBAciHsyz5h3rcrLNrrN+J98svXoipzq8XF+tKdVYI4
	EtgMia22BoH8RyGWFsLkFgIoqc6KVg+OvvaUvZYkiUwFgoOG7ceTs7+MyRjrquH1vkVgtr5Qtzcca
	DcFWkxdDv3agF0whnY494ZswYBhVhGpHLDSqlM4doVAn6OuKknzSE4YgNpHkIYl82BG3bdnBrl8QD
	IoTqX/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUFLI-00000007I4N-1DyN;
	Wed, 25 Jun 2025 01:54:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUFKU-00000007HyV-1Hzf
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 01:53:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGkmMV021760;
	Wed, 25 Jun 2025 01:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzYqr02+eay9QpK+UlOyVQXwAJuTLz52YD+EgciPrwk=; b=EM3imFgE9Q3i8z4l
	flGCSemOo0Bb1MWOUQR6MmZur+KnI4GG1mD+GJb5PK03ZCs1dBYH7rzy5B/p192f
	jqR7H8VcNBxdG/9sYU2u07+xBw5R18TNerRjkDGcszKOysVwKrVt5KEx6ho6N4LG
	NA6DG0OBYTjNkSL68zS4kSB0yfaE2mq2QjqSzaAbQAhDKaftd07Yi+0KZeo+TjaY
	gxlAu3AFV8uWXVgmw1Dx53ftPxFH2ewcK7fFFyaCNI4j3qC5QnR0fW1e0W0edH6P
	N2fWbm8r3VPOoU1a5o8bDrU7ko4JxVeLNCEk5mIavbZJJMY2QZnZgHcS6vribMCy
	ev7SRA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bge5nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 01:53:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P1rXWl003573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 01:53:33 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Jun
 2025 18:53:31 -0700
Message-ID: <11124601-a0bb-40a9-a101-bb83d7756ab4@quicinc.com>
Date: Wed, 25 Jun 2025 09:53:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] wifi: ath12k: fix dest ring-buffer corruption
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Remi Pommarel
	<repk@triplefau.lt>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250617084402.14475-1-johan+linaro@kernel.org>
 <20250617084402.14475-2-johan+linaro@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250617084402.14475-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vPwE5FK1SHJzIVnmO5xKknypyzFaoU-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAxMyBTYWx0ZWRfXxVtg5TgNBKaa
 7bZfieSTd3ez8WryS7LYtbs0rtjtx/MgROgb17cp26rsSpUeigwkOoYokjuzwytMyHs9hyciR0q
 0HhPrnllOdMvlZeEw0giPvlvgNNDupFZALJqpphnPBPk86nB+7koj81Grq8/knk3SffaI7GKxys
 cRWOt6j6xNWlrvbw9Wd/1I57C+4t8bA63ar3k9RC1XvWGiG9zqL/wD+HdzdV/QB+U5lHKB1I/kv
 g8mPMifBHOlSFzXgrQW3ZrUEp072+rk+PbwabrB45I3DwizjAVQHXI8Dqfg0xu5avoEbkoSAcE8
 hJu9PEvu/dbjsCItnSSkFGP3Z4qx+IcFS2bieLJgji9/Vy+upNptD9TTfSZEyu1hpSQJwVd/Q8G
 KM8iYqJrnbmToIIR5pQamjWjGaPh1hEnzznvjndGyAAYDXn+9aNjlzl95xR4va0yog+ucu0W
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685b569e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=d3g4vuyf_DbxgchVgIQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vPwE5FK1SHJzIVnmO5xKknypyzFaoU-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=862 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_185338_468822_25F52F40 
X-CRM114-Status: GOOD (  19.74  )
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



On 6/17/2025 4:43 PM, Johan Hovold wrote:
> Add the missing memory barrier to make sure that destination ring
> descriptors are read after the head pointers to avoid using stale data
> on weakly ordered architectures like aarch64.
> 
> The barrier is added to the ath12k_hal_srng_access_begin() helper for
> symmetry with follow-on fixes for source ring buffer corruption which
> will add barriers to ath12k_hal_srng_access_end().
> 
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: stable@vger.kernel.org	# 6.3
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/net/wireless/ath/ath12k/ce.c  |  3 ---
>  drivers/net/wireless/ath/ath12k/hal.c | 17 ++++++++++++++---
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
> index 3f3439262cf4..f7c15b547504 100644
> --- a/drivers/net/wireless/ath/ath12k/ce.c
> +++ b/drivers/net/wireless/ath/ath12k/ce.c
> @@ -433,9 +433,6 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
>  		goto err;
>  	}
>  
> -	/* Make sure descriptor is read after the head pointer. */
> -	dma_rmb();
> -
>  	*nbytes = ath12k_hal_ce_dst_status_get_length(desc);
>  
>  	*skb = pipe->dest_ring->skb[sw_index];
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index a301898e5849..f8bd3837b9dc 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -2143,13 +2143,24 @@ void *ath12k_hal_srng_src_get_next_reaped(struct ath12k_base *ab,
>  
>  void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
>  {
> +	u32 hp;
> +
>  	lockdep_assert_held(&srng->lock);
>  
> -	if (srng->ring_dir == HAL_SRNG_DIR_SRC)
> +	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>  		srng->u.src_ring.cached_tp =
>  			*(volatile u32 *)srng->u.src_ring.tp_addr;
> -	else
> -		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> +	} else {
> +		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> +
> +		if (hp != srng->u.dst_ring.cached_hp) {
> +			srng->u.dst_ring.cached_hp = hp;
> +			/* Make sure descriptor is read after the head
> +			 * pointer.
> +			 */
> +			dma_rmb();
> +		}
> +	}
>  }
>  
>  /* Update cached ring head/tail pointers to HW. ath12k_hal_srng_access_begin()

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>



