Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94735CAC5A7
	for <ath12k@archiver.kernel.org>; Sat, 20 Sep 2025 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+Qp/m/JETzGQ8dHPwi3BdlfjnS6iTU4HRNyDuWKnz4=; b=DbFEbRBE0XMlM7Mu4TQ4yl02Rg
	AJbJfTgUOVcWFLldRmDe1TBf7tlfDxX9WB+m7Y3j7jLgwJaGXOUZfbk/zeICwbkEqRz5dXcOYmQzo
	pQ+w5peiYbG8i4e3w0J+7TGKLaqt0w1Bmqr8XSzRFTIYeEVZ2+tqHASbXkLz05IXmdcFACu4ZKRmz
	7agdou+vuxS/4P6d1c7Hi39/vn0AAk5QPFSVWBPN/xdCYdgL+KdaCMfs/Vd9ymf7eYhldqmOEsKlg
	GyeaLcnvzdDAursGlzYDYrU7E2ufvFlw6jh8SKUCrtgoADuqgUnbVE1cHUgeYDXlBr2n1ZIuuJTcH
	uiVaTBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03XX-00000005pEd-0dVT;
	Sat, 20 Sep 2025 19:46:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03XU-00000005pDu-1b2x
	for ath12k@lists.infradead.org;
	Sat, 20 Sep 2025 19:46:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJVr1L022050
	for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 19:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+Qp/m/JETzGQ8dHPwi3BdlfjnS6iTU4HRNyDuWKnz4=; b=ENwRgwZdVNZNXdFz
	ycybmKp/HWNa09Y8W85rnMeNQF1QfEJSagB7xuAiqsmb7M4+gJJgq8Li5QjERHbQ
	2bNlFk/vV2IXKMkZqeIykuConwsiqg9jPXe81idovS/Gyf0U1urF+ouQJi7QzXpo
	fn6u4/exrz0jmadYAWVZE06denu/4DvrBp9ovHn28rhj3MQ9E4L07+olDkL7a/g9
	pvFy2+G/yu4JmTGQV99eXiTUZBAsy5d3o+E8ZBaQu2tFnPCLL9kPgcLBhSeFXboH
	U1USMsRh5SemE1L6RXEa679D9ijq4LonbylYMlCEdIFLT8xJlKFleZUUqcjBGQC3
	7+W7IQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k989a6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 19:46:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso2816847b3a.2
        for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 12:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397589; x=1759002389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+Qp/m/JETzGQ8dHPwi3BdlfjnS6iTU4HRNyDuWKnz4=;
        b=dzAT1niLxBO4jS+XF/t3GgXLJHELf2nCTua9z9VzHPQ/Gz2LZ2Jk2IcxkNc1tKNuUV
         S09tu9d8vZrKe2N2/5AY/gIfiKidtekStFnwbOLc87OwwddXZTP9Jkep223KLtzihOo5
         lkpq/DkXMveaDXhDWqkn5D6wtpb1TDUHicY+59odiH9Gf/EkXZjO6Wns0OYOE6UJRlxx
         DoMODgPKdPBC00jCgxsyWNqFlHpVaYPw64xgImilImFW5EF/p4861Hhz5qkD+JF+cqyp
         Mx6IJ/+FkZQrELul2COnSm7utwbRleeb6w797BucGbdMU8rVfBk3z3uJtE8XeTq/DxRp
         6NWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX15vIKUFY5RzzjjTCup/rMXkz7HFrXGL5zQMSsUz7fxy/Rpt5xQxhziRv6Fx4pyNCnulScD9s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Y0J8iBMFGBcpAzy1lX6LInr3h2q0xTC78UU6q1gEKMw+scNf
	t2Z7H38YGEKsuSpv2gnXRe9TNQvTTpX9kOV2hX9svV4WdIj2KfIA539Ahohk3ujgQG26qNsLU90
	fVTVmFCO4g5ch9xQzQ5XmtusX02eUwPAqPsMFwlkyiBkNTjkPHVmeKWgRSaYucG+S
X-Gm-Gg: ASbGncsfhf/gcp8bqLyabqDeCkWZsBwcHgS30L+I2QhSx5VGMNZ57EdG+y/DgbbpTHt
	JVXQ3FblTgJ6DcX0Ksa04o8DP3ddjllAw3Z77u5HuXSpDfcQylrSQKMZqa0Enbzcfx9BSpOWUFR
	FFmrg++VIA9THoX5CZvLVAilk83piaOWHI6KdffUVX0lst3sqi/awmJeyUBQNC2JHIQEoX5QRVU
	CWmKt7fNXBQAKA867o/RJd0C5PU7Bb/0NFDlGrZ6alg0sRazTM1X1ZNh7DVSAivjS0oiWJ9HSOP
	iSuEjWGbmCDcH5osaEOlsR3IZdHZDpd6m5x9liWiVUU+Q5iNeec7eQFDP4IiD418BzZ3H5gHtIm
	7OdkUbxNadSuo8CQ=
X-Received: by 2002:a05:6a00:2da7:b0:77f:2140:9685 with SMTP id d2e1a72fcca58-77f21409b33mr2283274b3a.9.1758397588948;
        Sat, 20 Sep 2025 12:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaTOg4LtoZXY/Rm551CcEocJGCIjjbXNI6cEnN1T2SzpyZ0nXKyTQ4XSOIscy4c9q0a0PYBg==
X-Received: by 2002:a05:6a00:2da7:b0:77f:2140:9685 with SMTP id d2e1a72fcca58-77f21409b33mr2283259b3a.9.1758397588510;
        Sat, 20 Sep 2025 12:46:28 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.98.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79c05sm8457047b3a.4.2025.09.20.12.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 12:46:28 -0700 (PDT)
Message-ID: <9ed7f62c-2035-6ab2-3ed7-3796018da1ac@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:16:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-current 0/7] wifi: ath12k: Fix Issues in REO RX Queue
 Updates
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g-8ND4zz5Upw12m3Gy5dRo_U6403Rh5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX1NcHJaCnEpnr
 m3D57YRIQZ4HOYFOMDa8rFfJem5bNTLOlJKL4gNx/U8noNQFI6m81Nk4Zu3tfgwnata/5rFXX8p
 mgYW3gryjyKEBd1dacnqfT78QpUsB8aLF+sIQs1sEW2KOuVPzSjNRn/K4u2EzY4320D9B30ciBi
 TM7Ft8Ivo2x4tcYht2T0tkvm/Eq7spLqFUGWzokr1lnQwl8Zs4oSF6b9gaBz1lGJOavZ2OutLj5
 jDWWM3ScoUn5jkKB8bYpcsFJBOULV3sbk3QDSI3BozQ0j7jquQPlWtf6HqamVy/3eEXQVTzOhAV
 EHUX0LShDAGNBOATp/geJXn7Pw4S4gn30EM89982YFVYS9zWOAEDuMBxrzXFUH02EGu2WKSIMtX
 WDBxbkhR
X-Proofpoint-ORIG-GUID: g-8ND4zz5Upw12m3Gy5dRo_U6403Rh5O
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68cf0496 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=D2/kxzoxEJci86hTnT1oBw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xzmuE1EisdE_tCyGCEEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_124632_555246_00C18155 
X-CRM114-Status: GOOD (  18.10  )
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



On 8/6/2025 4:47 PM, Nithyanantham Paramasivam wrote:
> During stress test scenarios, when the REO command ring becomes full,
> the RX queue update command issued during peer deletion fails due to
> insufficient space. In response, the host performs a dma_unmap and
> frees the associated memory. However, the hardware still retains a
> reference to the same memory address. If the kernel later reallocates
> this address, unaware that the hardware is still using it, it can
> lead to memory corruption-since the host might access or modify
> memory that is still actively referenced by the hardware.
> 
> Implement a retry mechanism for the HAL_REO_CMD_UPDATE_RX_QUEUE
> command during TID deletion to prevent memory corruption. Introduce
> a new list, reo_cmd_update_rx_queue_list, in the dp structure to
> track pending RX queue updates. Protect this list with
> reo_rxq_flush_lock, which also ensures synchronized access to
> reo_cmd_cache_flush_list. Defer memory release until hardware
> confirms the virtual address is no longer in use, avoiding immediate
> deallocation on command failure. Release memory for pending RX queue
> updates via ath12k_dp_rx_reo_cmd_list_cleanup() on system reset
> if hardware confirmation is not received.
> 
> Additionally, increase DP_REO_CMD_RING_SIZE to 256 to reduce the
> likelihood of ring exhaustion. Use a 1KB cache flush command for
> QoS TID descriptors to improve efficiency.
> 
> Manish Dharanenthiran (2):
>    wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures
>    wifi: ath12k: Use 1KB Cache Flush Command for QoS TID Descriptors
> 
> Nithyanantham Paramasivam (5):
>    wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
>    wifi: ath12k: Refactor RX TID deletion handling into helper function
>    wifi: ath12k: Refactor RX TID buffer cleanup into helper function
>    wifi: ath12k: Refactor REO command to use ath12k_dp_rx_tid_rxq
>    wifi: ath12k: Fix flush cache failure during RX queue update
> 
>   drivers/net/wireless/ath/ath12k/dp.c       |   2 +
>   drivers/net/wireless/ath/ath12k/dp.h       |  12 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.c    | 336 ++++++++++++++-------
>   drivers/net/wireless/ath/ath12k/dp_rx.h    |  18 +-
>   drivers/net/wireless/ath/ath12k/hal.h      |   1 +
>   drivers/net/wireless/ath/ath12k/hal_desc.h |   1 +
>   drivers/net/wireless/ath/ath12k/hal_rx.c   |   3 +
>   7 files changed, 251 insertions(+), 122 deletions(-)
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

