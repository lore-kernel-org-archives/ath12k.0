Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504D4CAC587
	for <ath12k@archiver.kernel.org>; Tue,  9 Sep 2025 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqKGj80V87H4h/5IP86Ryu05cZ9/7FbAEtZKSpmwubo=; b=rUluJOq5/Lx8QzbZfg6/mlMf1r
	5Uh1kgzzloA41GuoyzIiK+RbyG1f/mdiFaFVXE1Yx5y6vMe6OA0+SbboMLjpt7pWEVST9R47ZSLPG
	emY9GOs1+xeYp3xCLiorAzhn66jziAhvBL1T5uRU1rmJFuOAeBH2OXlhGid9pdIkIXORmh9WGQSe6
	/z0lswBRt4DFjcstCaZ1tADo3qp9/D+/d4d9/aSCB1pZR9ZidAggjVi3lhkDJ40kPx9A7YZn/mFwa
	Bjb9Td9Iu9Q0tL622I4CaqFNHsoCMU+1Dz086D2Ojviq4Il0Vdd6AjAqL7GMpWqa/toJYZ8z6N4ys
	NrpNdCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsI2-00000004xFM-2gDH;
	Tue, 09 Sep 2025 06:57:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvpFT-000000040WH-1KRw
	for ath12k@lists.infradead.org;
	Tue, 09 Sep 2025 03:42:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5892ES7u001543
	for <ath12k@lists.infradead.org>; Tue, 9 Sep 2025 03:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqKGj80V87H4h/5IP86Ryu05cZ9/7FbAEtZKSpmwubo=; b=UnWzsqRBC1PbHpRP
	4pyL23y69z9Raeu4c39IDh46+hrqW4DZXi4pW6OSDqJV27rGsQ6N56UCk3de8kC+
	b4IagsBTllqOQyKWWaUY1Wq35eUQM4qEuAe3gg4xbqtkvWIv+B3YiSIyaHhin5OT
	wmu/JRDkBj2YszRJlHCQjxCvKm3ZUrFLd+gpqO86zSxXkDhsOiPfrOuPohUeF4bl
	E7D/sw9Tu58pZeKNkc6s5fIAY5OFasHEOQO1g4xpVzMwZA47py98aQwnLa3gsI9g
	YUAC8JR5xz4tTDl5W/sLN2PrXmTQFWm74G5b9dBl8YgjgWdOLJl3MMmGwFp4j99J
	pQ/rvA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0prpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Sep 2025 03:42:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b522c35db5fso1575893a12.0
        for <ath12k@lists.infradead.org>; Mon, 08 Sep 2025 20:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757389344; x=1757994144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqKGj80V87H4h/5IP86Ryu05cZ9/7FbAEtZKSpmwubo=;
        b=B22Y38+DHvnlnSqVojzFmXCO5g1yLgc34xsH+17hBnqqvXruhyIcXke94sh6ZYLC/8
         BRuWSMc1KwdkdmXxpVp9KX43KH9K5+Ql4zUihTmL/rwfrn8nfE/V94fs2c/GiDaih5Ho
         AT76oC76rPYvkHgEZeyomlDnu/DWvP9pZ+OchAdszgMbfRqOThYiqVGDl2oRWj8ddc/r
         16DSFgWIPuVxNupFiNQbD48YljopwqZLd9l1pHjYrZy6yi4F1ZG3ljrALyJc3qdyFBMF
         ikLUtPhDZZ6tl0xv3sn33I01w9eqTjOJiiGVr2hkpyCSwQGeXCuyLnFX4L0em60OpZOy
         0FuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqUaCZOnBace8KK5KSdtZdDoP3y5fcMCCoTeEVuSj+Tpnts6COEmOJT1GH3Zf5Nn9o3dDjPt4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUGqZxcszVHpDz7VfDTWQ7GKngdb3RP+wnrwxBnQMchTkhhuX8
	Xw0pd+UVrl4/nBmscMB1liX1GriooDpUjCDLbd+0wuieKOPR96z+OC/W1mwEJ7krkpN0n1GDRAd
	NxqGqMdjW7PutFzVCr9anGv8uYis6jrR+qFQvFUECl5nCrVuLaxbtqmUyNTtxEBYk
X-Gm-Gg: ASbGncvK0kG+qJWGRDl3mNJhcr1nxcTNjg6vEoL/Ltno1FgPIC1fFSHS59o645vxKv8
	RqqTyIm725ZKVKaFMYqpe+t2WJ+eIizAbJMPEeQnI8aBK7pHXqmvYWk4j1YgSnfsMDeT1peyjJ5
	l35dtkOvaNGPANmJGRhHjZVBRiz/GdN+pUpY+Pa+OqbbwAw7qnAKrQMKPYZWSa4krqSRfSxjzcZ
	IgGasbeTgQRgM4Z3I5q6TN/UercmhFZV/8kLFOZxMUPGLEnIooTvLF3+gyCzuFYPSXTAFC1+bHK
	i/t8NAh54wvVVNURpZm/XHKJ0egWr0TmtO++fveP568IvpN3oibJODB2ZCxmkvrbse5sni98rQ4
	df3WqBEU64UcURaEBesg7o1WDC8ix8BuSOh2daw==
X-Received: by 2002:a17:903:1446:b0:24c:7b94:2f87 with SMTP id d9443c01a7336-2516d81652amr122994165ad.14.1757389343562;
        Mon, 08 Sep 2025 20:42:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBVdncCJ5WkXyxiuknUnAWiuhgmUiboCPFE/MCBu3e51IrOlxhIQAeL2A7kYTrGD/KbLiaiQ==
X-Received: by 2002:a17:903:1446:b0:24c:7b94:2f87 with SMTP id d9443c01a7336-2516d81652amr122993945ad.14.1757389342990;
        Mon, 08 Sep 2025 20:42:22 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25549ac1e1dsm50443855ad.24.2025.09.08.20.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 20:42:22 -0700 (PDT)
Message-ID: <1e8be82e-6abe-4764-939e-fede6c4368ea@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 11:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 7/8] wifi: ath12k: Remove hal_rx_ops and merge
 into hal_ops
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250908162757.2938849-1-quic_rdeuri@quicinc.com>
 <20250908162757.2938849-8-quic_rdeuri@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250908162757.2938849-8-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V37nqiJ7HjEowBNGhxOZl6vf8NAK2H_n
X-Proofpoint-GUID: V37nqiJ7HjEowBNGhxOZl6vf8NAK2H_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX2raKEIN5Okpn
 hxPN8KkzBLQCpwO6oCYRIvQ1S/QPwDrjfiPbq9pIS6cVFZ5jpV2GpzADMmdpj4Pimd5MmjakVta
 WktRuxH59IOS9gbpOwwlimt3H+FTYIi9Kp6CANrQBmojJprzZNcsLXa3TZu6sBydNmzqzLwDb5m
 DrOYT8BFKyYRcZaEBEPuqiG0Yy3mTiaa/cAWd599CJIAz0hEJFMOjlB20WdRHUfo3bEsjCCOO/r
 eThjlV++MJMdeWSz6xZJIJq1dRIZXQAga6ln5bb1TZwgZ1agRHS1kQV5njqfRxaMRYhD/Rbh6GY
 Zq6vQG+u2FktBgtnF2RirGWtDFp/uBT2xJ88DuhL0/Hi/AS5DjUSQfIAFn6Gz3hfjTjk2nTpH6y
 KJio/bsm
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bfa221 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=IqzYBjT-D9p1eT2bAm0A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_204227_501624_47BA6A31 
X-CRM114-Status: GOOD (  19.33  )
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



On 9/9/2025 12:27 AM, Ripan Deuri wrote:
> Move following ops from hal_rx_ops to hal_ops to simplify the HAL interface.
> 
> rx_desc_get_l3_pad_bytes
> rx_desc_get_mpdu_start_tag
> rx_desc_get_mpdu_ppdu_id
> rx_desc_get_msdu_payload
> 
> Remove the compact_ops as they become unused with this change.

Are you intending to say hal_rx_ops?

> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h      |  2 --
>  drivers/net/wireless/ath/ath12k/dp_mon.c    |  2 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h     |  6 +++---
>  drivers/net/wireless/ath/ath12k/hal.c       | 22 +++++++--------------
>  drivers/net/wireless/ath/ath12k/hal.h       | 14 ++++---------
>  drivers/net/wireless/ath/ath12k/wifi7/pci.c |  2 --
>  6 files changed, 15 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index b68f063283fe..9ae98556dd94 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1196,8 +1196,6 @@ struct ath12k_base {
>  		bool fw_features_valid;
>  	} fw;
>  
> -	const struct hal_rx_ops *hal_rx_ops;
> -
>  	struct completion restart_completed;
>  
>  #ifdef CONFIG_ACPI
> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
> index 0ae500ec3463..3315a9e3d40a 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
> @@ -2046,7 +2046,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k *ar,
>  
>  		rx_desc = (struct hal_rx_desc *)head_msdu->data;
>  		hdr_desc =
> -			ab->hal_rx_ops->rx_desc_get_msdu_payload(rx_desc);
> +			ab->hw_params->hal_ops->rx_desc_get_msdu_payload(rx_desc);
>  
>  		/* Base size */
>  		wh = (struct ieee80211_hdr_3addr *)hdr_desc;
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
> index 432707d60fca..ff214bff389b 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
> @@ -109,7 +109,7 @@ static inline u16 ath12k_dp_rx_h_frag_no(struct ath12k_base *ab,
>  static inline u8 ath12k_dp_rx_h_l3pad(struct ath12k_base *ab,
>  				      struct hal_rx_desc *desc)
>  {
> -	return ab->hal_rx_ops->rx_desc_get_l3_pad_bytes(desc);
> +	return ab->hw_params->hal_ops->rx_desc_get_l3_pad_bytes(desc);
>  }
>  
>  static inline void ath12k_dp_rx_desc_end_tlv_copy(struct ath12k_base *ab,
> @@ -129,7 +129,7 @@ static inline void ath12k_dp_rxdesc_set_msdu_len(struct ath12k_base *ab,
>  static inline u32 ath12k_dp_rxdesc_get_ppduid(struct ath12k_base *ab,
>  					      struct hal_rx_desc *rx_desc)
>  {
> -	return ab->hal_rx_ops->rx_desc_get_mpdu_ppdu_id(rx_desc);
> +	return ab->hw_params->hal_ops->rx_desc_get_mpdu_ppdu_id(rx_desc);
>  }
>  
>  static inline bool ath12k_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
> @@ -137,7 +137,7 @@ static inline bool ath12k_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
>  {
>  	u32 tlv_tag;
>  
> -	tlv_tag = ab->hal_rx_ops->rx_desc_get_mpdu_start_tag(rx_desc);
> +	tlv_tag = ab->hw_params->hal_ops->rx_desc_get_mpdu_start_tag(rx_desc);
>  
>  	return tlv_tag == HAL_RX_MPDU_START;
>  }
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index db6294ba6771..a14a7d8dc69f 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -406,13 +406,6 @@ static int ath12k_hal_srng_create_config_qcn9274(struct ath12k_base *ab)
>  	return 0;
>  }
>  
> -const struct hal_rx_ops hal_rx_qcn9274_compact_ops = {
> -	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274,
> -	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
> -	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_qcn9274,
> -};
> -EXPORT_SYMBOL(hal_rx_qcn9274_compact_ops);
> -
>  const struct hal_ops hal_qcn9274_ops = {
>  	.create_srng_config = ath12k_hal_srng_create_config_qcn9274,
>  	.tcl_to_wbm_rbm_map = ath12k_hal_qcn9274_tcl_to_wbm_rbm_map,
> @@ -423,6 +416,9 @@ const struct hal_ops hal_qcn9274_ops = {
>  	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_qcn9274,
>  	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcn9274,
>  	.rx_desc_get_desc_size = ath12k_hal_get_rx_desc_size_qcn9274,
> +	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_qcn9274,
> +	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_qcn9274,
> +	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_qcn9274,
>  };
>  EXPORT_SYMBOL(hal_qcn9274_ops);
>  
> @@ -550,14 +546,6 @@ static int ath12k_hal_srng_create_config_wcn7850(struct ath12k_base *ab)
>  	return 0;
>  }
>  
> -const struct hal_rx_ops hal_rx_wcn7850_ops = {
> -	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850,
> -	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
> -	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_wcn7850,
> -	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_wcn7850,
> -};
> -EXPORT_SYMBOL(hal_rx_wcn7850_ops);
> -
>  const struct hal_ops hal_wcn7850_ops = {
>  	.create_srng_config = ath12k_hal_srng_create_config_wcn7850,
>  	.tcl_to_wbm_rbm_map = ath12k_hal_wcn7850_tcl_to_wbm_rbm_map,
> @@ -568,6 +556,10 @@ const struct hal_ops hal_wcn7850_ops = {
>  	.rx_desc_get_msdu_src_link_id = ath12k_hal_rx_desc_get_msdu_src_link_wcn7850,
>  	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_wcn7850,
>  	.rx_desc_get_desc_size = ath12k_hal_get_rx_desc_size_wcn7850,
> +	.rx_desc_get_l3_pad_bytes = ath12k_hal_rx_desc_get_l3_pad_bytes_wcn7850,
> +	.rx_desc_get_mpdu_start_tag = ath12k_hal_rx_desc_get_mpdu_start_tag_wcn7850,
> +	.rx_desc_get_mpdu_ppdu_id = ath12k_hal_rx_desc_get_mpdu_ppdu_id_wcn7850,
> +	.rx_desc_get_msdu_payload = ath12k_hal_rx_desc_get_msdu_payload_wcn7850,
>  };
>  EXPORT_SYMBOL(hal_wcn7850_ops);
>  
> diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
> index 37593bb7953b..692d495d01c9 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/hal.h
> @@ -1578,13 +1578,6 @@ enum nl80211_he_ru_alloc ath12k_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones)
>  	return ret;
>  }
>  
> -struct hal_rx_ops {
> -	u8 (*rx_desc_get_l3_pad_bytes)(struct hal_rx_desc *desc);
> -	u32 (*rx_desc_get_mpdu_start_tag)(struct hal_rx_desc *desc);
> -	u32 (*rx_desc_get_mpdu_ppdu_id)(struct hal_rx_desc *desc);
> -	u8 *(*rx_desc_get_msdu_payload)(struct hal_rx_desc *desc);
> -};
> -
>  struct hal_ops {
>  	int (*create_srng_config)(struct ath12k_base *ab);
>  	const struct ath12k_hal_tcl_to_wbm_rbm_map *tcl_to_wbm_rbm_map;
> @@ -1601,14 +1594,15 @@ struct hal_ops {
>  				     struct hal_rx_desc *rx_desc,
>  				     struct hal_rx_desc *ldesc);
>  	u32 (*rx_desc_get_desc_size)(void);
> +	u32 (*rx_desc_get_mpdu_start_tag)(struct hal_rx_desc *desc);
> +	u32 (*rx_desc_get_mpdu_ppdu_id)(struct hal_rx_desc *desc);
> +	u8 (*rx_desc_get_l3_pad_bytes)(struct hal_rx_desc *desc);
> +	u8 *(*rx_desc_get_msdu_payload)(struct hal_rx_desc *desc);
>  };
>  
>  extern const struct hal_ops hal_qcn9274_ops;
>  extern const struct hal_ops hal_wcn7850_ops;
>  
> -extern const struct hal_rx_ops hal_rx_qcn9274_compact_ops;
> -extern const struct hal_rx_ops hal_rx_wcn7850_ops;
> -
>  u32 ath12k_hal_reo_qdesc_size(u32 ba_window_size, u8 tid);
>  void ath12k_hal_reo_qdesc_setup(struct hal_rx_reo_queue *qdesc,
>  				int tid, u32 ba_window_size,
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
> index abdb3b8ff658..ba8c19c24ae6 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
> @@ -101,7 +101,6 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
>  		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
>  		ab->static_window_map = true;
>  		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
> -		ab->hal_rx_ops = &hal_rx_qcn9274_compact_ops;
>  		ath12k_wifi7_pci_read_hw_version(ab, &soc_hw_version_major,
>  						 &soc_hw_version_minor);
>  		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
> @@ -124,7 +123,6 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
>  		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
>  		ab->static_window_map = false;
>  		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
> -		ab->hal_rx_ops = &hal_rx_wcn7850_ops;
>  		ath12k_wifi7_pci_read_hw_version(ab, &soc_hw_version_major,
>  						 &soc_hw_version_minor);
>  		ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;


