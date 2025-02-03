Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B2C02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VciPBYUYPORNNS50qwe9VB2Y5iqKnuU2gYQRV16KHJ4=; b=pXP1zw9PHsPSEHeZO4SM5NX2rb
	uG9QP4cDZ/X5ftLeAYmljWKn+I66B2NbLG5Yy5qq9OXHeLXds5m0PhI3YcRO/eEbzD3fRXYzaYgQb
	phLHFHStp4AxhrKYRC+9KunGupQIkUQ8Pq1kar3Hm+Rra8SclNSK5Dwo45EOeeUseKZUk8HKDXOdh
	nWgnXtQGwEkz40eV9rPwcwf0frpsPuBJDtje7tUuFcb4nY7wG6LgN1E55CyM/o0rGy4U1kNK6jKEo
	bVbrB4wtE/s9NNlepew8eboGaTRhMhkBd+X6TAE5EK8YzBg2utKoeisHZIHxiunIlukt1ePgd/5pJ
	jnKhU1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyP8-0000000FsG5-25rv
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 15:30:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyP6-0000000FsEP-1MWV
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 15:30:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513EnoTr014767
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 15:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VciPBYUYPORNNS50qwe9VB2Y5iqKnuU2gYQRV16KHJ4=; b=T2b5mlNhjZv8XLQU
	+9aGuvS+RWVQhJ2NRjggN8/8yVXuS9KNmExnPO52x6+G7X8Q0c8FDZXJA+FuZbjA
	Q5eXxuVkcOguXrR/nP5Svso2xudvMEWZovZUwuHvTP0jhOTGtX39mHsfssohmsNl
	TFck8P636uptfgH6GpMqQD8w0hDMrVzAXuNx4J48c9+QqFpS96LHavHSfJ5OY0+0
	KtVOlJxDEAE1ZUhOIGWjd91PJmr4+cuRYP3ZKDZMx0ZAeVnQvUXNUcRPzUeGmVGp
	3EWyQvvkz/zFwKOY+jzRQRSCNeh3JM+tPtCbOAxCkv94a3MIWRSjlXJT7JoJ0b7h
	aL8jAw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqtnhgk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 15:30:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so12858748a91.0
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 07:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596613; x=1739201413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VciPBYUYPORNNS50qwe9VB2Y5iqKnuU2gYQRV16KHJ4=;
        b=d7knAMFDIjHujM/Bd19psNBz3fDIkUXhFyEnj35hxwUcH8n0mmRWEPG10Ewrpwxy24
         1wBN3+Na6tBzRNNICs9w830js87LJCOr/9xhki02mlBdkBHN9UXO7P8Y/v7qL8wXjtqC
         sgMHUzgRmM83pYH4YHAcFt8MCt6Dc4rPGPqwGbKcvfqCNJ25Ar4yd6lKX/O5DtlzSlIE
         gtV9RyV+5mx/RjJ++RC3qIfTlguv/tCR3KAOPBSbshwfH2xK/o4WNtujxFFmg/jghrVm
         Xi9X/ZEHmLe3Bjn7yuKdg9IJxep5aKvCC7MExE9zcjYJzVLSTU/Sc1fDkgwC0+n6rBnF
         tfCg==
X-Forwarded-Encrypted: i=1; AJvYcCWFx1oQUaxcMAT6HxVQxSL32/rhxdIUmNoXZ3rtr3z+piETSiUfoLkzCLGJTGaREY/gkede7+k=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx5ZRhLePZrpv7gvpc+qCsGkWf0w9BXl3jolH8zzgXtx99Fznu
	f9/UkOUMw1ljHNYt8uI0SYSab0YWIQn18mXXRMyMGfzykVcaRhcL9BApZ3wNtJ5oQIHq2VRCeHQ
	mXkxkh6Iwa/gY2U8Q828+ox2iszQvWPYw/9na6g1ukcnLPu/ysB9dGoUDLrpbK5NPpdyc
X-Gm-Gg: ASbGncsq18fdbzSUojNCaX2nU4viY7trFQ48pbpqYNSz6tJvqauv2w7Q6Xe1uDCpZmA
	oX8jYSJTwvhVuyLPkX0fht9xAZcd0mEtXF8AVl0jgPfIiSugsxp2H2Tvz4a8EM6PTUaveMKy8ie
	p1fkL41qNMZlR3LUNbpUlaw56KmrUHswNQgh0X22uHya+u7NQrnpqAJtXtJaoUD+avIALvx/lXS
	CSaVvtcjUyNvv48V6PS/qYb5tV/nSpKAyWL2AjUpWtQcrxXgZWkbSa4TD4KfrlmRNd7Cpg5YdT7
	itFsrHvddZeBcqsOoGpNrhaC8BkrxOKBSuv/P0hieQ==
X-Received: by 2002:a17:90b:5201:b0:2ea:4c8d:c7a2 with SMTP id 98e67ed59e1d1-2f83ac5c2b7mr34314943a91.24.1738596612574;
        Mon, 03 Feb 2025 07:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnTlPqvAsppPjuVyMMChT5l2keDSNV7HdTsd1cowZnZ3hNzamhkFrC51pzslB1jmOdD2bEYg==
X-Received: by 2002:a17:90b:5201:b0:2ea:4c8d:c7a2 with SMTP id 98e67ed59e1d1-2f83ac5c2b7mr34314897a91.24.1738596612122;
        Mon, 03 Feb 2025 07:30:12 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848aa7255sm9151294a91.31.2025.02.03.07.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 07:30:11 -0800 (PST)
Message-ID: <5b2198ea-014e-48e8-84aa-b7806aa82b4c@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 21:00:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] wifi: ath12k: Update HTT_TCL_METADATA version and
 bit mask definitions
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250203075538.3982875-1-quic_bmahalin@quicinc.com>
 <20250203075538.3982875-2-quic_bmahalin@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250203075538.3982875-2-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yIxbxrQLS3ZhB0t_Hf7cBMndrfimH1lk
X-Proofpoint-ORIG-GUID: yIxbxrQLS3ZhB0t_Hf7cBMndrfimH1lk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_073028_485091_69DAC99C 
X-CRM114-Status: GOOD (  21.98  )
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

On 2/3/25 13:25, Balamurugan Mahalingam wrote:
> Update the HTT_TCL_METADATA version to the latest version (2)
> as the bit definitions have changed a little to support more
> features. This new version allows the host to submit a packet with
> more information to the firmware. Firmware uses this additional
> information to do special processing for certain frames.
> 
> All the firmware binaries available in upstream/public are compatible with
> this HTT version update.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp.h    | 21 ++++++++++++++-------
>   drivers/net/wireless/ath/ath12k/dp_tx.c | 12 ++++++++++--
>   2 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index f68bb78d4a11..7cdc62aa35be 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -1,7 +1,7 @@
>   /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef ATH12K_DP_H
> @@ -372,17 +372,18 @@ struct ath12k_dp {
>   };
>   
>   /* HTT definitions */
> +#define HTT_TAG_TCL_METADATA_VERSION		5
>   
> -#define HTT_TCL_META_DATA_TYPE		BIT(0)
> -#define HTT_TCL_META_DATA_VALID_HTT		BIT(1)
> +#define HTT_TCL_META_DATA_TYPE		GENMASK(1, 0)
> +#define HTT_TCL_META_DATA_VALID_HTT		BIT(2)
>   
>   /* vdev meta data */
> -#define HTT_TCL_META_DATA_VDEV_ID		GENMASK(9, 2)
> -#define HTT_TCL_META_DATA_PDEV_ID		GENMASK(11, 10)
> -#define HTT_TCL_META_DATA_HOST_INSPECTED	BIT(12)
> +#define HTT_TCL_META_DATA_VDEV_ID		 GENMASK(10, 3)
> +#define HTT_TCL_META_DATA_PDEV_ID		 GENMASK(12, 11)
> +#define HTT_TCL_META_DATA_HOST_INSPECTED_MISSION BIT(13)

nit: Can we align these three new additions in same column?

>   
>   /* peer meta data */
> -#define HTT_TCL_META_DATA_PEER_ID		GENMASK(15, 2)
> +#define HTT_TCL_META_DATA_PEER_ID		GENMASK(15, 3)
>   
>   /* HTT tx completion is overlaid in wbm_release_ring */
>   #define HTT_TX_WBM_COMP_INFO0_STATUS		GENMASK(16, 13)
> @@ -413,9 +414,15 @@ enum htt_h2t_msg_type {
>   };
>   
>   #define HTT_VER_REQ_INFO_MSG_ID		GENMASK(7, 0)
> +#define HTT_OPTION_TCL_METADATA_VER_V2	2
> +#define HTT_OPTION_TAG		GENMASK(7, 0)
> +#define HTT_OPTION_LEN		GENMASK(15, 8)
> +#define HTT_OPTION_VALUE		GENMASK(31, 16)
> +#define HTT_TCL_METADATA_VER_SZ		4
>

Same here. All aligning in same column would be good.

>   struct htt_ver_req_cmd {
>   	__le32 ver_reg_info;
> +	__le32 tcl_metadata_version;
>   } __packed;
>   
>   enum htt_srng_ring_type {
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index aa8058dd2da6..5ed41783d039 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include "core.h"
> @@ -1103,7 +1103,15 @@ int ath12k_dp_tx_htt_h2t_ver_req_msg(struct ath12k_base *ab)
>   	skb_put(skb, len);
>   	cmd = (struct htt_ver_req_cmd *)skb->data;
>   	cmd->ver_reg_info = le32_encode_bits(HTT_H2T_MSG_TYPE_VERSION_REQ,
> -					     HTT_VER_REQ_INFO_MSG_ID);
> +					     HTT_OPTION_TAG);
> +
> +	cmd->tcl_metadata_version = le32_encode_bits(HTT_TAG_TCL_METADATA_VERSION,
> +						     HTT_OPTION_TAG);
> +	cmd->tcl_metadata_version |= le32_encode_bits(HTT_TCL_METADATA_VER_SZ,
> +						      HTT_OPTION_LEN);
> +	cmd->tcl_metadata_version |=
> +			le32_encode_bits(HTT_OPTION_TCL_METADATA_VER_V2,
> +					 HTT_OPTION_VALUE);
> 

Can't we write like this ?

x = a |
     b |
     c;

instead of

x = a;
x |= b;
x |= c;

>   	ret = ath12k_htc_send(&ab->htc, dp->eid, skb);
>   	if (ret) {


-- 
Aditya

