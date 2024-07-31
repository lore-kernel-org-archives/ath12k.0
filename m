Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E31C3DA7F
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bfNoF5u5E/LYxGYAQNTPgdagyfykUCKHrT52KkAGxo=; b=2D1wvMAqudTbAAP0phSnJcVsHO
	epxnFKR1B4JFzwog4WBCqeTnIiMhMN5RZu0CEs07Ndzt0P8YWZ8OHwFDn1fQYE04/vu/edPYMfcbO
	Q2y2QC66K3uQ4ibBkEmWmKBCm3dGoDzgu3j4l7PmnAcm9LU3s2Af10w7O99McZojSiIgt4rXEOF7e
	j1vGQu/7egJZ2P197ehHdtHp4MURFy0DaOntbGP7gMdIzYlMxVFonfT7AxDd3eDyApD3LDB3Z+vwT
	jyi341qH4uh5pCpxF6xUiiE2dROmJNZ1W4QsGTG4VyxlHArQF+sy3zqrKtUXDXD2aPXPJX2km3oz4
	I/CvwyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBWC-00000001lm4-28vF
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 15:45:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBW8-00000001lka-2yds
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 15:45:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V6qKLA022117;
	Wed, 31 Jul 2024 15:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bfNoF5u5E/LYxGYAQNTPgdagyfykUCKHrT52KkAGxo=; b=Zf5B+9zRWILVIM7C
	pAP1qym5v2H5bpeXgrgObq26TCpBOMdEPXaZ3MYDGw8cz+Dhk9S5pYJN6Wq1L0+O
	+da87it4iECqFWsZTstCwJURM8gIVn+KedAljAAXAiUgPgC+5kkOmM2klXttEClv
	kEleFVJKhfWPO4lewRs6EZkeZg9zbkJMBc06m/EwTcfUzDlfI0yLjG8UYZhQ0KtQ
	IcfirFTBf6p5FBhJYdbW037MvBNFxDjWSp5Rxa8AZZ64rfb9p8OuGQ1cXAS0KjkD
	5VgoFYeC73FneKT3QYsAcNIQ/x0bFdgSj3cczTqUx31SJGnc4AGKuF3oBcLMw+pT
	lro/dg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mp8n42nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 15:45:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VFjAVd002164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 15:45:10 GMT
Received: from [10.111.177.34] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 08:45:10 -0700
Message-ID: <4ed6f40e-f27a-4868-8670-c81d95a14a3d@quicinc.com>
Date: Wed, 31 Jul 2024 08:45:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Refactor
 ath12k_qmi_alloc_target_mem_chunk function
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240730170910.3281816-1-quic_rajkbhag@quicinc.com>
 <20240730170910.3281816-2-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240730170910.3281816-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pmxA4pwVOQSDq8SpgBFhITcaOh8bNYmJ
X-Proofpoint-ORIG-GUID: pmxA4pwVOQSDq8SpgBFhITcaOh8bNYmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_084532_939043_F29C230F 
X-CRM114-Status: GOOD (  29.47  )
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

On 7/30/2024 10:09 AM, Raj Kumar Bhagat wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Currently, all QMI target memory types share the same allocation
> logic within the function ath12k_qmi_alloc_target_mem_chunk().
> However, for Multi Link Operation (MLO), firmware requests a new MLO
> global memory region. This memory is shared across different firmware
> (SoC) participating in the MLO. To accommodate this logic change,
> refactor ath12k_qmi_alloc_target_mem_chunk() and introduce a helper
> function ath12k_qmi_alloc_chunk() for memory chunk allocation.
> Subsequent patch will add MLO global memory allocation logic.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/qmi.c | 82 ++++++++++++++-------------
>  1 file changed, 44 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 047393bc8bea..11bf16eaadd9 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -2366,9 +2366,50 @@ static void ath12k_qmi_free_target_mem_chunk(struct ath12k_base *ab)
>  	}
>  }
>  
> +static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
> +				  struct target_mem_chunk *chunk)
> +{
> +	/* Firmware reloads in recovery/resume.
> +	 * In such cases, no need to allocate memory for FW again.
> +	 */
> +	if (chunk->v.addr) {
> +		if (chunk->prev_type == chunk->type &&
> +		    chunk->prev_size == chunk->size)
> +			goto this_chunk_done;

since this is a refactor I appreciate the desire to exactly copy the existing
code. however since this is now a separate function, IMO we can make small
tweaks which take advantage of that, so here I would just:

			return 0;
> +
> +		/* cannot reuse the existing chunk */
> +		dma_free_coherent(ab->dev, chunk->prev_size,
> +				  chunk->v.addr, chunk->paddr);
> +		chunk->v.addr = NULL;
> +	}
> +
> +	chunk->v.addr = dma_alloc_coherent(ab->dev,
> +					   chunk->size,
> +					   &chunk->paddr,
> +					   GFP_KERNEL | __GFP_NOWARN);
> +	if (!chunk->v.addr) {
> +		if (chunk->size > ATH12K_QMI_MAX_CHUNK_SIZE) {
> +			ab->qmi.target_mem_delayed = true;
> +			ath12k_warn(ab,
> +				    "qmi dma allocation failed (%d B type %u), will try later with small size\n",
> +				    chunk->size,
> +				    chunk->type);
> +			ath12k_qmi_free_target_mem_chunk(ab);
> +			return 0;
> +		}
> +		ath12k_warn(ab, "memory allocation failure for %u size: %d\n",
> +			    chunk->type, chunk->size);
> +		return -ENOMEM;
> +	}
> +	chunk->prev_type = chunk->type;
> +	chunk->prev_size = chunk->size;
> +this_chunk_done:

with the above change this label is no longer needed

> +	return 0;
> +}
> +
>  static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
>  {
> -	int i;
> +	int i, ret = 0;
>  	struct target_mem_chunk *chunk;
>  
>  	ab->qmi.target_mem_delayed = false;
> @@ -2385,42 +2426,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
>  		case M3_DUMP_REGION_TYPE:
>  		case PAGEABLE_MEM_REGION_TYPE:
>  		case CALDB_MEM_REGION_TYPE:
> -			/* Firmware reloads in recovery/resume.
> -			 * In such cases, no need to allocate memory for FW again.
> -			 */
> -			if (chunk->v.addr) {
> -				if (chunk->prev_type == chunk->type &&
> -				    chunk->prev_size == chunk->size)
> -					goto this_chunk_done;
> -
> -				/* cannot reuse the existing chunk */
> -				dma_free_coherent(ab->dev, chunk->prev_size,
> -						  chunk->v.addr, chunk->paddr);
> -				chunk->v.addr = NULL;
> -			}
> -
> -			chunk->v.addr = dma_alloc_coherent(ab->dev,
> -							   chunk->size,
> -							   &chunk->paddr,
> -							   GFP_KERNEL | __GFP_NOWARN);
> -			if (!chunk->v.addr) {
> -				if (chunk->size > ATH12K_QMI_MAX_CHUNK_SIZE) {
> -					ab->qmi.target_mem_delayed = true;
> -					ath12k_warn(ab,
> -						    "qmi dma allocation failed (%d B type %u), will try later with small size\n",
> -						    chunk->size,
> -						    chunk->type);
> -					ath12k_qmi_free_target_mem_chunk(ab);
> -					return 0;
> -				}
> -				ath12k_warn(ab, "memory allocation failure for %u size: %d\n",
> -					    chunk->type, chunk->size);
> -				return -ENOMEM;
> -			}
> -
> -			chunk->prev_type = chunk->type;
> -			chunk->prev_size = chunk->size;
> -this_chunk_done:
> +			ret = ath12k_qmi_alloc_chunk(ab, chunk);

seems like you need to test ret and return if non-zero here since currently if
you get a bad ret in one loop but you continue and get a good ret on the
remaining iterations then you'll end up returning success from this function.

In other words, your refactoring doesn't correct handle that the original
"return -ENOMEM" would return from *this* function at this point

>  			break;
>  		default:
>  			ath12k_warn(ab, "memory type %u not supported\n",
> @@ -2430,7 +2436,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
>  			break;
>  		}
>  	}
> -	return 0;
> +	return ret;

if you test ret above then there is no need to make this change since this
will always be the success case

>  }
>  
>  static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)


