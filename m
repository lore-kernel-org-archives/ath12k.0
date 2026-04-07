Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E34FF511B
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkHr1XsREMAC/KqxSvd8f5vKp1/h2jijCG0gdIOkT/U=; b=bihFtrjzBPg2wO3Lv/IFqVF+ig
	KZrgFtd9zLGTR2v5sQVhZPsFAxjErhK/ziAN/RQ8gZkXBTC6zYzGgwvXhThFoWgaNEZ2RlSJ9JPz/
	jfe+McLL2uISEv0JX+bXvbVqz7ggqXcs48+JNp9H0kQORiWY5Mu2EWgI2T75Mi0jJGB6KbB4T6bG7
	6MKT++UEREsH5SMbVXZCOS0wjN6JtZbPYUEQKzLtsx7MD614s+0OEoL8HSbbRvFkX506Xbfhg1uRi
	YmlO1D9lKyEY3J46guPz3ANY/9krk+8r+qw9VnFOGE6mEdiy0S/6dEdCmgBkW7dtKmOdrRESKcYe8
	vLH0f5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9DJ-00000006nBq-2rjq;
	Tue, 07 Apr 2026 16:23:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9DG-00000006nBS-3H9R
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 16:23:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CN89d1584355
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 16:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkHr1XsREMAC/KqxSvd8f5vKp1/h2jijCG0gdIOkT/U=; b=mIIXToDTXG/SBwgu
	pT4TJOaFqxdm2IT5srDr7iLf0n1O05WyoFrUCtTu4ZOPIHPSqHLVf/iCzHs4AEj4
	S3omEEik9hheiiNW3RTKRwueafQhHVKG8bObtRoYYbz2u8+Z9gZzXAERJLWobRmT
	NCVyyCNaTgrPqZslXQMwOFLR5F1uFH75tOoro4IuhreuEYpUPsD7iR+sJKFZNUdc
	+x0Jl6lz7wsKPFoP0EGoIYrmNVfI9/iXq5VSJl2Ovd0MilusaMJo36feFFRzxU2u
	3Zbyacu/U+KFc0Vs96bx407yDJoCd2SPCZuF5rldOfSyD4aPUA9yBdNwGVH78LdT
	H2tP0g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9umag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 16:23:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so130091175ad.0
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775579017; x=1776183817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkHr1XsREMAC/KqxSvd8f5vKp1/h2jijCG0gdIOkT/U=;
        b=g7vxzRTqf9jMnwSQVW3KUJrgfPaNQZVACg8EdfNMBXdbDGOyikogSAlbmPOk2lsI5e
         esFKB1EU8pTG/imc+R039O4wiIQcTYw8tZznJ0ex8Y+fxPDXfMeQ7K9xTEe5HkTZb6lq
         osJXAeBZugrfcGp9373XPxz/MKQkaPbXw9RmQ/6JpQaKpiBLbQS9L5CyXqBnE7Z3ir64
         I7CdVWxDhVuOEbOTg3aYneqNbtVMqvUvj/pQ7hp3ogEvXQS0roPUhl/7ajf6MeVdpAXC
         vppE0IB3VaYSs5qbPOOO64eOQw3AxvZGpkG9OLUI1DVuNzgDDedaDSJUYr7OwBA7OV8E
         2a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775579017; x=1776183817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkHr1XsREMAC/KqxSvd8f5vKp1/h2jijCG0gdIOkT/U=;
        b=QJcL9TxzBnEEsRoUb6lq4TaiByvT7U1weDq7NpmfIm6hu2BlajImmgclR3S7DqcoGk
         wkESSmMG3aW+yZ9LRPeNLGmtmAXclG8P5oXv0u+MdqcGITGuHpuzVj2tSddu5KEkCD/y
         VajOaUlxO8EQgUEAiaINbBwc8uEGncKvxn3PymfGtbWFcecG7WpAY0NEHtj8Zqhv7z0f
         KJIgAGXjXchCViBm3avmxOkjI8TprLFpLpOGZIUcvSof7BLmocl2vEBHf/TQMsZPaUAA
         cpC+BiXrE5hCOEuOU2AW8VJUfbw8wtz5uFCUUAtQ0Qy8cQWo3cXYI9ZGiNtnG84idihR
         TbWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHDzHtFL5OG1t1CQmXqyAH6+i9ouSDra1Y3FX+hAZZVVvaDnEHHKWmZqyemp5PBqmwD/QzgR0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBZVDCfC3KByp8XLTxa93ZfQ+k+1lN9b/N1cvX5KFHYsMng8cc
	0rj3tju5AI6L/BEjcwapx5mT5KblzmlqguzZ0sdT6izzci+VMj9caekwgCcFDNbxlVxlbmpwBtp
	/hOeQPoK2u2dsV2BEQnxVG82ZmUYBVRVR7oPB2x7vMocCOHWB3lq5yElzx1qk0Sh9
X-Gm-Gg: AeBDievz+DxB2Wbmb77Ok+096FUp+G0oRuyETQ/0uPYGZRdJu2o45fFKwKIFgzobF7U
	q8Wp2Bs6K9GlWzQY+tREfL8O7GgG4yyBu3BsSsky1D3yMq9v1uNg3FXNU8rCAQjMp6wkhlsQ+L1
	vaEAP2BB8EfvP5FqsIa9liVbjq4T/xVe3cj2zHZ1tOJkJh+mO0Et3UobwUAD4XaiTqMvKERgTHb
	sxJoWPhmkUlrV+hR00htH9KbqgXtl786KTqn989zyK9uAWn/RxQMH9+CXhzN0G0D3YBVSA4ZXUl
	iTgt+n78lHruGjxi/ffQ6cprBWn9Ixl07zS/HXAiUoJ2DWuxwl0+DsB2LQvKUuUk0+hMD8f2DxO
	wjRMXl8Ost4q7jzKT2qoNg9RnvIFACDYUmo9yhxjs557GHR1B2ZqnKWZ7hpEBzW3IKA==
X-Received: by 2002:a17:903:40d2:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b281674f1emr185590905ad.10.1775579016815;
        Tue, 07 Apr 2026 09:23:36 -0700 (PDT)
X-Received: by 2002:a17:903:40d2:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b281674f1emr185590295ad.10.1775579016034;
        Tue, 07 Apr 2026 09:23:36 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d20bsm177228155ad.16.2026.04.07.09.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:23:35 -0700 (PDT)
Message-ID: <1e2b396a-5722-4c28-a3fd-3195b5155959@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 21:53:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 5/6] wifi: ath12k: Add CE remap hardware
 parameters for IPQ5424
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
 <20260407-ath12k-ipq5424-v5-5-8e96aa660ec4@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-5-8e96aa660ec4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d52f8a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=K0dzcbKyB1xs89kN7v0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NyBTYWx0ZWRfX9EFsPqutUkKS
 G4orXNG2iKtwu5rYxphdLsKrPJC9S8TOVRkW+NJCoFQoEU4huGmwfPSNxHxXzPw3LLlxv+DaPQe
 9YsPHoezu8l6TiVpQ/kNhhPLpLC7CZz4Ur5IcygatiC9Zl8cWrkfig3HtAv/hsILnxrTcvkPZId
 hYyyQdvQgjC5FR2cn40NjezTR9ZHUOi+uUF5Uf2NIDyFVgFx2tjMlO94cztlq2AsnTholsdZgWL
 aaxo7WDP7VLWoqDFfN0nGDigsmXGeMAUFuXd+GH3C/qK2YH0qQRW1GKT4nNYCVqCd2iS6Mllede
 l/VJfzJW9MwQ4Tk0y44hIFqn2MMOpgA8qefOxldaYP/V2ht++i9iJoJATT+0tNKG+3y100hXnoO
 4N9HVz0RjmZIwrHIsz/3jvjkvsdkJDfVE5/c5cbmbQRqn7pmbTqEQ70lVwGowTnFGHGQk74IkU4
 Ug93q2FG0UOlhJZcTzw==
X-Proofpoint-GUID: oOQch0dpJXUMGWHQIaUE7jZbM-nym_a9
X-Proofpoint-ORIG-GUID: oOQch0dpJXUMGWHQIaUE7jZbM-nym_a9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092338_826676_D6C0FB98 
X-CRM114-Status: GOOD (  16.73  )
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



On 4/7/2026 10:56 AM, Raj Kumar Bhagat wrote:
> From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> 
> Add CE remap hardware parameters for Ath12k AHB device IPQ5424.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/ce.h       | 13 +++++++++----
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 22 +++++++++++++++++-----
>   2 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
> index df4f2a4f8480..009cddf2d68d 100644
> --- a/drivers/net/wireless/ath/ath12k/ce.h
> +++ b/drivers/net/wireless/ath/ath12k/ce.h
> @@ -38,10 +38,15 @@
>   #define PIPEDIR_INOUT		3 /* bidirectional */
>   #define PIPEDIR_INOUT_H2H	4 /* bidirectional, host to host */
>   
> -/* CE address/mask */
> -#define CE_HOST_IE_ADDRESS	0x75804C
> -#define CE_HOST_IE_2_ADDRESS	0x758050
> -#define CE_HOST_IE_3_ADDRESS	CE_HOST_IE_ADDRESS
> +/* IPQ5332 CE address/mask */
> +#define CE_HOST_IPQ5332_IE_ADDRESS	0x75804C
> +#define CE_HOST_IPQ5332_IE_2_ADDRESS	0x758050
> +#define CE_HOST_IPQ5332_IE_3_ADDRESS	CE_HOST_IPQ5332_IE_ADDRESS
> +
> +/* IPQ5424 CE address/mask */
> +#define CE_HOST_IPQ5424_IE_ADDRESS	0x21804C
> +#define CE_HOST_IPQ5424_IE_2_ADDRESS	0x218050
> +#define CE_HOST_IPQ5424_IE_3_ADDRESS	CE_HOST_IPQ5424_IE_ADDRESS
>   
>   #define CE_HOST_IE_3_SHIFT	0xC
>   
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index 2b5d1f7e9e04..cb3185850439 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -329,9 +329,15 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
>   };
>   
>   static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
> -	.ie1_reg_addr = CE_HOST_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> -	.ie2_reg_addr = CE_HOST_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> -	.ie3_reg_addr = CE_HOST_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> +	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> +	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> +	.ie3_reg_addr = CE_HOST_IPQ5332_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
> +};
> +
> +static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5424 = {
> +	.ie1_reg_addr = CE_HOST_IPQ5424_IE_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.ie2_reg_addr = CE_HOST_IPQ5424_IE_2_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.ie3_reg_addr = CE_HOST_IPQ5424_IE_3_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
>   };
>   
>   static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
> @@ -340,6 +346,12 @@ static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
>   	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
>   };
>   
> +static const struct ce_remap ath12k_wifi7_ce_remap_ipq5424 = {
> +	.base = HAL_IPQ5424_CE_WFSS_REG_BASE,
> +	.size = HAL_IPQ5424_CE_SIZE,
> +	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
> +};
> +
>   static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   	{
>   		.name = "qcn9274 hw1.0",
> @@ -824,8 +836,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		.iova_mask = 0,
>   		.supports_aspm = false,
>   
> -		.ce_ie_addr = NULL,
> -		.ce_remap = NULL,
> +		.ce_ie_addr = &ath12k_wifi7_ce_ie_addr_ipq5424,
> +		.ce_remap = &ath12k_wifi7_ce_remap_ipq5424,
>   		.bdf_addr_offset = 0x940000,
>   
>   		.current_cc_support = false,
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


