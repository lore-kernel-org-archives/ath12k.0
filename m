Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A68CAC5B8
	for <ath12k@archiver.kernel.org>; Fri, 26 Sep 2025 07:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRTTMC10gW7pg7wc4jjHUj9XGpKgR6moGigWHXu5GPQ=; b=iyPkuRk5cuFSeH2jtbVlliruk1
	/x8uUNDNbfVHKW6kOIItNqE9M5PYS7eULXempiZ4cmtR0eXFslaIKAvm+xLWd1pw8MQHb8ZbbBdJU
	ax8cULF1vHZAZBz/wfo0QC05k5xYAHy3Xf2zXeXBZPWvah6VhAFJsdSKZnGOD+jFb1Lk75yRBb3NF
	8NpEAAVAEdFVkRzHnDTNHQcsTiCfyPV8Hs9MgNAXNFOO2VTGqesa/lPQH2RIwwg020Bc0BHzrxqND
	3ttdHp+XJf/nz3GNi6BOYxPpAUYnsIbGfRUj5IiTyPXsuLJxVWvf+x/gmB82k7IyMz0gjT+teCdis
	kLKqz6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22rO-0000000Glcg-3edc;
	Fri, 26 Sep 2025 07:27:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22rM-0000000GlZD-3WtS
	for ath12k@lists.infradead.org;
	Fri, 26 Sep 2025 07:27:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q0DGIY015374
	for <ath12k@lists.infradead.org>; Fri, 26 Sep 2025 07:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRTTMC10gW7pg7wc4jjHUj9XGpKgR6moGigWHXu5GPQ=; b=Dd4lYgsoSUd3eeKF
	Ll4BxuoLxJXk06YdjCF6ZXub0O0QEqhTB90+D6PWqJ/wlK4BaRy6ZvqJUK2rXp6J
	Tp1aBcbqZs2Ge9FBMufmB2NlA4JyJFJ3BjY42GmSkd8gy+7utU7Se4AAhEdVDQqq
	9hgIL5GkMWUISBmgO8Ibdrwbzd+75ZLFih//nfV2gv7mxNna4rnnzQPEaMnPjVvl
	dvZLGHTZ+sxSrvwYWWyb0HP0dC+Tmr+cP+IHFIvU39otgPNEScZrZvpJN0KAcQOw
	kBKe+qR1I3YEyo+ShxiTrZPPmdEK3uRGOpe0q9K1cv9SnHQJZs3N8/akjjPq8gWw
	TtH/pA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db321vp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Sep 2025 07:27:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b588fd453d7so104510a12.2
        for <ath12k@lists.infradead.org>; Fri, 26 Sep 2025 00:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871634; x=1759476434;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRTTMC10gW7pg7wc4jjHUj9XGpKgR6moGigWHXu5GPQ=;
        b=fGYo8cnShtM8eiEQDqxWEzPyXnGfCcFG7mQsoP6BYWSpQPy8+ofiH9UDNpyj1t2HFS
         C0LYnMFAeKwUL5KDX2httDDS57+FhLRlQ7lu5JrkjC26kgZbLvFt5QpNQyOmV+1i626j
         dbkQl38xR074Hhz3oD/m0kv0RKmiZcvuOCTHdGR+a7C3atHX6YINE5s0L/HL+8h3/Qxq
         1H5KUGOMpjLXB3RUN/EWwKpwf8g6OgglNovsGf3b/N/8UtQ2KZZYAefRI3A7kUT/8vx5
         U1NbSvPhAg1piHasXZ3v9pFn5RV+JcAZMoz5sM90KtETTeFyaFWZfLNryeIdAuF0zC58
         YgrA==
X-Forwarded-Encrypted: i=1; AJvYcCXjZjK/xBUidZwMsk5bGiVEritCURoLsB1hHrzVesNWewegP8UKS7kXNn6kB+VAOoHkVNGFtq4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoCto62SX/OfArc1CxZVyWXjCD7vhbSYFGZeIi344FLBviyUzp
	bOFOHwP2jafu2PgWeOt4oZ4vXevUbhXlAFY8qVVQsw+ZSNAppH1+oxFV7U3ISI+aSGSerE8Ogfw
	vJ3h+694zJ4zcb0VnNhn6+/JqTau9GY93mLiY9L+h5pqQRotzUm3aOsD1mcKtCe0e
X-Gm-Gg: ASbGncvlKFL0IxhhERJ/IAei93rDQiU4MyKJhpXTYrrafYIO7HEl3HATMCRuSc9SQp9
	gUCnglOCvGW8NBYhJhGUf+wsSPHhSYtCUOxivXUXFcdmahbnC7OpLutAt8FHEppKPnxaEQ6fhAb
	+nXKkCOnGc+DcltM8XVFS7cpEV3h7Swxoq6zmeh42srnM0cQZWAm04ZhGrYEdZ7SRpwMXlqzTfd
	6MEzwndgY5navistetj9UHrybB7ii5Cmmxv+QsCkiieBmLFhSV1X/K8gZcr2CkHy3M2oFadGOCG
	7497wVGpmUNo/6nDubb0gIh5oeUANo2GUHFTOSLImvNe88GbmWSAA65YfJMq1mLLz2hdf59pGKp
	6H1SvLg/4/1Q+wL6l5TP7MEe8z7SnJ0vU2bKIlg==
X-Received: by 2002:a05:6a20:7f98:b0:2b0:ff55:f830 with SMTP id adf61e73a8af0-2e7d9411f54mr6839649637.51.1758871634265;
        Fri, 26 Sep 2025 00:27:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1YmHQPNhEyp2ELtAqGOqtH3wPgpV+noxsscF3YY5NGTaiC84YxbqpHzs5+Gt61tFNcrrrsQ==
X-Received: by 2002:a05:6a20:7f98:b0:2b0:ff55:f830 with SMTP id adf61e73a8af0-2e7d9411f54mr6839627637.51.1758871633793;
        Fri, 26 Sep 2025 00:27:13 -0700 (PDT)
Received: from [10.133.33.196] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53cb975sm4046472a12.18.2025.09.26.00.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:27:13 -0700 (PDT)
Message-ID: <04b2d56e-7b1d-4ceb-9479-3ad97cb7132a@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:27:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng v2 5/6] wifi: ath12k: Add framework for hardware
 specific DP interrupt registration
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250926052218.893876-1-quic_rdeuri@quicinc.com>
 <20250926052218.893876-6-quic_rdeuri@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250926052218.893876-6-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d64053 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=LDVpCoHNsb-ULt4mha4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 42ksCxuJcx_s8l09LvgXsHv6ut6FefFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXzfs3Y7cYZuXy
 AhRNbAI6i12iAJjanI+7yEiE3NwsJixV4Kw1Qh55Gt1YSrdzVe5mv1G1d5DzP7TgDLJA5brJ2kW
 JNvdTA4MJhogUshOqiOAfN+MPNIrHthok8mBm7k/M8nUPW7ZqevNihmTwYpQIdoxETxFXKAbd5p
 QEo38/MOSmePiJTvyGJiWT7nExt+v/s9V9DhVS1G8Gbw+hdhhjQyFK7ipuXaagII7Zn4arI7J7D
 nCghg+TsVA6tsn0TxH4htLVygOFPjG5NZFD2kh47yDuagNe9tY4jxhfMu+RwOIGMiXbaPPaQvvJ
 DJFfHBkynnL6b2Dz/eKfGh7OzQ8osSPBkPyREZjl5KD5NffhUEVpTvApNOgimeEJ8YuRSs5QVt9
 ipJ2kKTAvX3wC4GQj8KS965wdA8OCA==
X-Proofpoint-GUID: 42ksCxuJcx_s8l09LvgXsHv6ut6FefFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_002716_898099_37F3C6F2 
X-CRM114-Status: GOOD (  26.50  )
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



On 9/26/2025 1:22 PM, Ripan Deuri wrote:
> Currently, the DP service SRNG handler is invoked directly from the NAPI
> poll handler, which prevents using different handlers for different
> architectures. To fix this, introduce a framework that allows registering
> architecture-specific service SRNG handlers.
> 
> Also, add PCI and AHB hif_ops to manage IRQ setup and cleanup from DP.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/ahb.c      | 16 +++++++-----
>  drivers/net/wireless/ath/ath12k/core.h     |  3 +++
>  drivers/net/wireless/ath/ath12k/hif.h      | 30 +++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/pci.c      | 23 +++++++++--------
>  drivers/net/wireless/ath/ath12k/wifi7/dp.c | 20 ++++++++++++---
>  drivers/net/wireless/ath/ath12k/wifi7/dp.h |  2 --
>  6 files changed, 71 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index c545bea18935..4bacdaa62f83 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -524,10 +524,9 @@ static int ath12k_ahb_ext_grp_napi_poll(struct napi_struct *napi, int budget)
>  	struct ath12k_ext_irq_grp *irq_grp = container_of(napi,
>  						struct ath12k_ext_irq_grp,
>  						napi);
> -	struct ath12k_base *ab = irq_grp->ab;
>  	int work_done;
>  
> -	work_done = ath12k_wifi7_dp_service_srng(ab, irq_grp, budget);
> +	work_done = irq_grp->irq_handler(irq_grp->dp, irq_grp, budget);
>  	if (work_done < budget) {
>  		napi_complete_done(napi, work_done);
>  		ath12k_ahb_ext_grp_enable(irq_grp);
> @@ -553,7 +552,12 @@ static irqreturn_t ath12k_ahb_ext_interrupt_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
> +static int
> +ath12k_ahb_config_ext_irq(struct ath12k_base *ab,
> +			  int (*irq_handler)(struct ath12k_dp *dp,
> +					     struct ath12k_ext_irq_grp *irq_grp,
> +					     int budget),
> +			  struct ath12k_dp *dp)
>  {
>  	const struct ath12k_hw_ring_mask *ring_mask;
>  	struct ath12k_ext_irq_grp *irq_grp;
> @@ -569,6 +573,8 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
>  
>  		irq_grp->ab = ab;
>  		irq_grp->grp_id = i;
> +		irq_grp->irq_handler = irq_handler;
> +		irq_grp->dp = dp;
>  
>  		irq_grp->napi_ndev = alloc_netdev_dummy(0);
>  		if (!irq_grp->napi_ndev)
> @@ -652,9 +658,6 @@ static int ath12k_ahb_config_irq(struct ath12k_base *ab)
>  		ab->irq_num[irq_idx] = irq;
>  	}
>  
> -	/* Configure external interrupts */
> -	ret = ath12k_ahb_config_ext_irq(ab);
> -
>  	return ret;
>  }
>  
> @@ -702,6 +705,7 @@ static const struct ath12k_hif_ops ath12k_ahb_hif_ops = {
>  	.map_service_to_pipe = ath12k_ahb_map_service_to_pipe,
>  	.power_up = ath12k_ahb_power_up,
>  	.power_down = ath12k_ahb_power_down,
> +	.ext_irq_setup = ath12k_ahb_config_ext_irq,
>  };
>  
>  static irqreturn_t ath12k_userpd_irq_handler(int irq, void *data)
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index ff99d5ae6226..6a36dfdf5b17 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -166,6 +166,7 @@ enum ath12k_firmware_mode {
>  #define ATH12K_MAX_TCL_RING_NUM	3
>  
>  struct ath12k_ext_irq_grp {
> +	struct ath12k_dp *dp;
>  	struct ath12k_base *ab;
>  	u32 irqs[ATH12K_EXT_IRQ_NUM_MAX];
>  	u32 num_irq;
> @@ -174,6 +175,8 @@ struct ath12k_ext_irq_grp {
>  	bool napi_enabled;
>  	struct napi_struct napi;
>  	struct net_device *napi_ndev;
> +	int (*irq_handler)(struct ath12k_dp *dp,
> +			   struct ath12k_ext_irq_grp *irq_grp, int budget);

commit message says IRQ handler is architiecture specific, then why not put it in
ath12k_dp_arch_ops? Replicating irq_handler in each irq_grp seems kind of waste.

>  };
>  
>  enum ath12k_smbios_cc_type {
> diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
> index e8840fab6061..1f9781f6d564 100644
> --- a/drivers/net/wireless/ath/ath12k/hif.h
> +++ b/drivers/net/wireless/ath/ath12k/hif.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #ifndef ATH12K_HIF_H
> @@ -32,6 +32,12 @@ struct ath12k_hif_ops {
>  	void (*get_ce_msi_idx)(struct ath12k_base *ab, u32 ce_id, u32 *msi_idx);
>  	int (*panic_handler)(struct ath12k_base *ab);
>  	void (*coredump_download)(struct ath12k_base *ab);
> +	int (*ext_irq_setup)(struct ath12k_base *ab,
> +			     int (*handler)(struct ath12k_dp *dp,
> +					    struct ath12k_ext_irq_grp *irq_grp,
> +					    int budget),
> +			     struct ath12k_dp *dp);
> +	void (*ext_irq_cleanup)(struct ath12k_base *ab);
>  };
>  
>  static inline int ath12k_hif_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
> @@ -162,4 +168,26 @@ static inline void ath12k_hif_coredump_download(struct ath12k_base *ab)
>  	if (ab->hif.ops->coredump_download)
>  		ab->hif.ops->coredump_download(ab);
>  }
> +
> +static inline
> +int ath12k_hif_ext_irq_setup(struct ath12k_base *ab,
> +			     int (*irq_handler)(struct ath12k_dp *dp,
> +						struct ath12k_ext_irq_grp *irq_grp,
> +						int budget),
> +			     struct ath12k_dp *dp)
> +{
> +	if (!ab->hif.ops->ext_irq_setup)
> +		return -EOPNOTSUPP;
> +
> +	return ab->hif.ops->ext_irq_setup(ab, irq_handler, dp);
> +}
> +
> +static inline void ath12k_hif_ext_irq_cleanup(struct ath12k_base *ab)
> +{
> +	if (!ab->hif.ops->ext_irq_cleanup)
> +		return;
> +
> +	ab->hif.ops->ext_irq_cleanup(ab);
> +}
> +
>  #endif /* ATH12K_HIF_H */
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 672cf2899681..a28bea5c1d40 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -319,8 +319,6 @@ static void ath12k_pci_free_irq(struct ath12k_base *ab)
>  		irq_idx = ATH12K_PCI_IRQ_CE0_OFFSET + i;
>  		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
>  	}
> -
> -	ath12k_pci_free_ext_irq(ab);
>  }
>  
>  static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
> @@ -478,11 +476,10 @@ static int ath12k_pci_ext_grp_napi_poll(struct napi_struct *napi, int budget)
>  	struct ath12k_ext_irq_grp *irq_grp = container_of(napi,
>  						struct ath12k_ext_irq_grp,
>  						napi);
> -	struct ath12k_base *ab = irq_grp->ab;
>  	int work_done;
>  	int i;
>  
> -	work_done = ath12k_wifi7_dp_service_srng(ab, irq_grp, budget);
> +	work_done = irq_grp->irq_handler(irq_grp->dp, irq_grp, budget);
>  	if (work_done < budget) {
>  		napi_complete_done(napi, work_done);
>  		for (i = 0; i < irq_grp->num_irq; i++)
> @@ -517,7 +514,12 @@ static irqreturn_t ath12k_pci_ext_interrupt_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
> +static
> +int ath12k_pci_ext_irq_config(struct ath12k_base *ab,
> +			      int (*irq_handler)(struct ath12k_dp *dp,
> +						 struct ath12k_ext_irq_grp *irq_grp,
> +						 int budget),
> +			      struct ath12k_dp *dp)
>  {
>  	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
>  	int i, j, n, ret, num_vectors = 0;
> @@ -538,6 +540,8 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
>  
>  		irq_grp->ab = ab;
>  		irq_grp->grp_id = i;
> +		irq_grp->irq_handler = irq_handler;
> +		irq_grp->dp = dp;
>  		irq_grp->napi_ndev = alloc_netdev_dummy(0);
>  		if (!irq_grp->napi_ndev) {
>  			ret = -ENOMEM;
> @@ -651,10 +655,6 @@ static int ath12k_pci_config_irq(struct ath12k_base *ab)
>  		ath12k_pci_ce_irq_disable(ab, i);
>  	}
>  
> -	ret = ath12k_pci_ext_irq_config(ab);
> -	if (ret)
> -		return ret;
> -
>  	return 0;
>  }
>  
> @@ -1483,6 +1483,8 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
>  #ifdef CONFIG_ATH12K_COREDUMP
>  	.coredump_download = ath12k_pci_coredump_download,
>  #endif
> +	.ext_irq_setup = ath12k_pci_ext_irq_config,
> +	.ext_irq_cleanup = ath12k_pci_free_ext_irq,
>  };
>  
>  static enum ath12k_device_family
> @@ -1691,6 +1693,7 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
>  	ath12k_fw_unmap(ab);
>  	ath12k_mhi_unregister(ab_pci);
>  
> +	ab_pci->device_family_ops->arch_deinit(ab);
>  	ath12k_pci_free_irq(ab);
>  	ath12k_pci_msi_free(ab_pci);
>  	ath12k_pci_free_region(ab_pci);
> @@ -1698,8 +1701,6 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
>  	ath12k_hal_srng_deinit(ab);
>  	ath12k_ce_free_pipes(ab);
>  
> -	ab_pci->device_family_ops->arch_deinit(ab);
> -
>  	ath12k_core_free(ab);
>  }
>  
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.c b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> index adc3480b282b..df9696549d06 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> @@ -10,13 +10,15 @@
>  #include "../dp_mon.h"
>  #include "../dp_cmn.h"
>  #include "dp_rx.h"
> +#include "../hif.h"
>  #include "dp.h"
>  #include "dp_tx.h"
>  
> -int ath12k_wifi7_dp_service_srng(struct ath12k_base *ab,
> -				 struct ath12k_ext_irq_grp *irq_grp,
> -				 int budget)
> +static int ath12k_wifi7_dp_service_srng(struct ath12k_dp *dp,
> +					struct ath12k_ext_irq_grp *irq_grp,
> +					int budget)
>  {
> +	struct ath12k_base *ab = dp->ab;
>  	struct napi_struct *napi = &irq_grp->napi;
>  	int grp_id = irq_grp->grp_id;
>  	int work_done = 0;
> @@ -138,6 +140,7 @@ int ath12k_wifi7_dp_service_srng(struct ath12k_base *ab,
>  struct ath12k_dp *ath12k_wifi7_dp_device_alloc(struct ath12k_base *ab)
>  {
>  	struct ath12k_dp *dp;
> +	int ret;
>  
>  	/* TODO: align dp later if cache alignment becomes a bottleneck */
>  	dp = kzalloc(sizeof(*dp), GFP_KERNEL);
> @@ -148,12 +151,23 @@ struct ath12k_dp *ath12k_wifi7_dp_device_alloc(struct ath12k_base *ab)
>  	dp->dev = ab->dev;
>  	dp->hw_params = ab->hw_params;
>  
> +	ret = ath12k_hif_ext_irq_setup(dp->ab, ath12k_wifi7_dp_service_srng, dp);
> +	if (ret) {
> +		ath12k_err(ab, "failed to setup ext irq, ret %d", ret);
> +		goto free_dp;
> +	}
> +
>  	return dp;
> +
> +free_dp:
> +	kfree(dp);
> +	return NULL;
>  }
>  EXPORT_SYMBOL(ath12k_wifi7_dp_device_alloc);
>  
>  void ath12k_wifi7_dp_device_free(struct ath12k_dp *dp)
>  {
> +	ath12k_hif_ext_irq_cleanup(dp->ab);
>  	kfree(dp);
>  }
>  EXPORT_SYMBOL(ath12k_wifi7_dp_device_free);
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.h b/drivers/net/wireless/ath/ath12k/wifi7/dp.h
> index 2300fda65786..72fdfb368c99 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.h
> @@ -13,8 +13,6 @@
>  struct ath12k_base;
>  struct ath12k_dp;
>  
> -int ath12k_wifi7_dp_service_srng(struct ath12k_base *ab,
> -				 struct ath12k_ext_irq_grp *irq_grp, int budget);
>  struct ath12k_dp *ath12k_wifi7_dp_device_alloc(struct ath12k_base *ab);
>  void ath12k_wifi7_dp_device_free(struct ath12k_dp *dp);
>  


