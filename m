Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B18CD3439
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NktNNT+blem0C8DB93BySTfteXu91gdwwaZsrQR4k2s=; b=r104hlnXeLNa1MTxgeg6XtAchg
	VBSdKmt5Ecd9HrRmP+ZTNDZPFS/n1j10DkYJ45yWP4NsIqEnfUd6aAVMuyXepXbsQX2E/I/ZyAf2D
	4aWwyWWygujSVOIAU69NWUBVvhE+vT+mIQuoblNkXEkPbrhUacWye/9K+gZpq1YMnHrtU0PimJUhZ
	+JwdbWjjr5tsvz8uCgyIIUrDOAQYYK8iqJqjkre1lmjwELL82AGz4Q1O4F6Cv7SmBLMaCjuuSxsbv
	ZabVVbbCnenO0i01uqLer+2LAtMzmLfTO+VdSut2clA8lPJdwtjMpDIX8TJUHqgTDp6FF35UM1U+I
	dEYHQMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJde-0000000H42I-3JaQ;
	Tue, 05 May 2026 17:32:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJdc-0000000H41i-10Ot
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 17:32:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645F7KWE4028238
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 17:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NktNNT+blem0C8DB93BySTft
	eXu91gdwwaZsrQR4k2s=; b=bymI5B2fLLzns/GkH6H2wcDxIwbGdyD2Y9jW0dC3
	AqLuVpoRQ5rhtwz+GMcmrpUNaWgUPh84wPSnhdtH957NJ0aytiKtxKGEOOLDgBJU
	cjL1FwOUYZlFv7DlWWiV/cLXjJyJxefWON860T9KyXrTwFPSuRgAjH58gIUjQLvi
	Hl4JlYTw/aLXdkXcPPMsyP1hmpq3p95Rrj5JeAM5ZiEu8mx4w4z4ZE6bmDvRBKfj
	MS8YALfHQlnbcyCv/d1aFFnOdsCDg+weY+OdQSMcIeT9IX1jYm36/yPQBlCCpmbo
	KdLn98K0VMh+1Sshjc8XML/QYu/aRItlaGIzXJICVRhj+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6t33d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 17:32:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6fe41283so3234805ad.1
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778002370; x=1778607170; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NktNNT+blem0C8DB93BySTfteXu91gdwwaZsrQR4k2s=;
        b=OdaV94fmzVSykhn0ZPPNbwM6J4NET9mCr2qZs/JTOlSNYJIU644MxMZ3ubyoIbZ8m/
         xe4d/V86caf5kaoomKt45iHv6oh7cXBu04v2gcUi618Xi0/289xr8SxYDxgO+mqYX1Lq
         +E9yqslaYc3bQe/GS7ERlsq1ykePm70mHdevE/Ee/V5URlwMEqJvNziu8oG4QZCA3m1Y
         F+Ilx0h/mzCr8r/mEEGu2yP8cIjOMvZ3o0K9E1UENo1e8aWg86nt4bbBkg9rE6l4mWeA
         DjhTKd7TNMNc2PaV2Vad18hKgoYioT95E8w2cY6TGDcMnGcsJ/0e7QBLDdTdW2SShu44
         SehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002370; x=1778607170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NktNNT+blem0C8DB93BySTfteXu91gdwwaZsrQR4k2s=;
        b=RcyxX2+KIH/O3OwAMus9tnrD1qYTDh4J3Ue+1iQCdja0tl6UxQdY3cOt0T9WCGddIe
         y3HjEscQDuQhg7lNkcO0Hc+hGgnneLR/YPMN4a3GIn8JQ8LT/HpAl+K6GOdQR6/HJPN3
         u15yccwU3Flaka/bqxbZ0miattXt1s7Ym621EbFdz4SlvX2ffdmbHgZyRX3wo4lPA7ve
         TEXQ/3aZKte2JHDw4she+/ZyVlBeCR1W7/RlJhkBo3r43/q1IuhReJ3V/QnHVFYpztzK
         h/lB+rahVCmrjefm1Dyx3stFVCZ5Fo26ZFEgtDwRDb1Dx2q8650o2i+VKAzHAAYd45Cb
         eN2A==
X-Forwarded-Encrypted: i=1; AFNElJ8KkjTLM5AVWchz3fzRsfihuFwGTInktTLCwoAC35YLd4h29k69Z0QBv3sxfxz95pcJGu8ijb0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrS+qFWrIyOgPNYqmHMSiiupojxFAmV7MP/SSetfGA+PRbYPia
	tDFeDDCaiYwetB26LiBGGxneuVfTV7+qbbtEHOez62a8fIej5FiZjLX3ZIBMU63uNo0UJSQawZF
	HWYbduOpXlBWhNOeE4MO7D+MZdxDLyeYyBY1UvupudftOKTS20cj2Gmt5d482agpa
X-Gm-Gg: AeBDieunuRT3QWzVA1TCt1abddTk2soEOiNqrldbYaoFm7iEd1QBRCdHqzpTuctAl7W
	tCK2cdK8qiaywh8Jm4gVYITE1f3Uw65VAt1I/RHxwLbEa2HqkATYyx/raSLUns8qTxaUmRtnG7T
	FLSYmIvLHugarV8CMyZJcIDU4IFZU0IKHAO7sYzd8JbdNcNvdU70nNhFucEV+V1sRtc87zAsh7V
	tFTHNlvLkw9zbJi+ml0ButtwPEKu2sekwoGU8kHE1wi1XUgSFMdg/rUxChGUNbr+I+jWFtpoq5v
	Ci1b0h14gnDy/jBBIgLCGHlW8XUrHnWLYQGwwTDjieKHyXUx9La+4DbvDuveGWD6gWrbxVIu5H0
	4HlVaTooUh+G4YHw3kCwNJ+uRWkb/sl7pc5A2InweNLz7GTYP8snGXnEqwS8=
X-Received: by 2002:a17:902:f54c:b0:2b4:5e7e:34ce with SMTP id d9443c01a7336-2b9f285cc57mr141237775ad.39.1778002369365;
        Tue, 05 May 2026 10:32:49 -0700 (PDT)
X-Received: by 2002:a17:902:f54c:b0:2b4:5e7e:34ce with SMTP id d9443c01a7336-2b9f285cc57mr141237075ad.39.1778002368437;
        Tue, 05 May 2026 10:32:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaaec82sm146854565ad.24.2026.05.05.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:32:47 -0700 (PDT)
Date: Tue, 5 May 2026 23:02:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/16] firmware: qcom: Add a generic PAS service
Message-ID: <20260505173232.6bvtccowckwsatb4@hu-mojha-hyd.qualcomm.com>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
 <20260504130603.1474043-3-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504130603.1474043-3-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE3MCBTYWx0ZWRfX4BfSJ1spJ6Qn
 2hLo37Ue3NzIXg3d+7tiurWaxmB5T9VlrwZ6W4DQevs5Qy6WQ+KiUwSnn7X6AR3BRHatKByXroI
 Zp+78zQwsb1j2HZQYe7lzcm4zdzVuBQBuWXV8T3JmSLdF4VXXtBFP6MLOFpAbweUSa7mwI7vd4H
 E0078AJF70I+gFZayhqrRD/B9vitn5vOmu7xDXPT/OMhhVvo1rYAbzpfCb8yYq41Gp7CJI0JjJd
 vVhs6cpTqd9ZbukMmTZa5ZvRXXG9ouzB0eJ9OUkEvVaHxkhNM5K52UDuK5/Pl1VXC2PkbEAq2hR
 h7byeLS3p8nSs/uU5SdWchPiJpBgDo8wrp2PJu75EjcO/AFRIjkb6qCm2VGdn58jnzqxaRmrKdZ
 WPQdCEks1Bd0wpEl+cpeT4J/R/U+FGNMV1WrDIdnwAIfp74t80uKMwDjw13yLifVAbaZcNYDQHN
 AIU0/x+HXtnzK7IhZ4Q==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69fa29c2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=B9m6UvTZno2CEb395rQA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: TOMnVYaLOFANflFP_3av1uxc5ypTlEaT
X-Proofpoint-ORIG-GUID: TOMnVYaLOFANflFP_3av1uxc5ypTlEaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_103252_300552_04C5336E 
X-CRM114-Status: GOOD (  40.24  )
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

On Mon, May 04, 2026 at 06:35:49PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig          |   8 +
>  drivers/firmware/qcom/Makefile         |   1 +
>  drivers/firmware/qcom/qcom_pas.c       | 291 +++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_pas.h       |  50 +++++
>  include/linux/firmware/qcom/qcom_pas.h |  43 ++++
>  5 files changed, 393 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> 
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index b477d54b495a..8653639d06db 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -6,6 +6,14 @@
>  
>  menu "Qualcomm firmware drivers"
>  
> +config QCOM_PAS
> +	tristate
> +	help
> +	  Enable the generic Peripheral Authentication Service (PAS) provided
> +	  by the firmware. It acts as the common layer with different TZ
> +	  backends plugged in whether it's an SCM implementation or a proper
> +	  TEE bus based PAS service implementation.
> +
>  config QCOM_SCM
>  	select QCOM_TZMEM
>  	tristate
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> index 0be40a1abc13..dc5ab45f906a 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
> +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
> new file mode 100644
> index 000000000000..025308adf553
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2010,2015,2019 The Linux Foundation. All rights reserved.
> + * Copyright (C) 2015 Linaro Ltd.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/device/devres.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include "qcom_pas.h"
> +
> +static struct qcom_pas_ops *ops_ptr;
> +
> +/**
> + * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
> + *				   context for a given peripheral
> + *
> + * PAS context is device-resource managed, so the caller does not need
> + * to worry about freeing the context memory.
> + *
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + *
> + * Return: The new PAS context, or ERR_PTR() on failure.
> + */
> +struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
> +						     u32 pas_id,
> +						     phys_addr_t mem_phys,
> +						     size_t mem_size)
> +{
> +	struct qcom_pas_context *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ctx->dev = dev;
> +	ctx->pas_id = pas_id;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
> +
> +/**
> + * qcom_pas_init_image() - Initialize peripheral authentication service state
> + *			   machine for a given peripheral, using the metadata
> + * @pas_id:	peripheral authentication service id
> + * @metadata:	pointer to memory containing ELF header, program header table
> + *		and optional blob of data used for authenticating the metadata
> + *		and the rest of the firmware
> + * @size:	size of the metadata
> + * @ctx:	optional pas context
> + *
> + * Return: 0 on success.
> + *
> + * Upon successful return, the PAS metadata context (@ctx) will be used to
> + * track the metadata allocation, this needs to be released by invoking
> + * qcom_pas_metadata_release() by the caller.
> + */
> +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> +			struct qcom_pas_context *ctx)
> +{
> +	if (!ops_ptr)
> +		return -ENODEV;
> +
> +	return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_init_image);
> +
> +/**
> + * qcom_pas_metadata_release() - release metadata context
> + * @ctx:	pas context
> + */
> +void qcom_pas_metadata_release(struct qcom_pas_context *ctx)
> +{
> +	if (!ops_ptr || !ctx || !ctx->ptr)
> +		return;
> +
> +	ops_ptr->metadata_release(ops_ptr->dev, ctx);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_metadata_release);
> +
> +/**
> + * qcom_pas_mem_setup() - Prepare the memory related to a given peripheral
> + *			  for firmware loading
> + * @pas_id:	peripheral authentication service id
> + * @addr:	start address of memory area to prepare
> + * @size:	size of the memory area to prepare
> + *
> + * Return: 0 on success.
> + */
> +int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> +{
> +	if (!ops_ptr)
> +		return -ENODEV;
> +
> +	return ops_ptr->mem_setup(ops_ptr->dev, pas_id, addr, size);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_mem_setup);
> +
> +/**
> + * qcom_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> + *			      for a given peripheral.
> + *
> + * Qualcomm remote processor may rely on both static and dynamic resources for
> + * its functionality. Static resources typically refer to memory-mapped
> + * addresses required by the subsystem and are often embedded within the
> + * firmware binary and dynamic resources, such as shared memory in DDR etc.,
> + * are determined at runtime during the boot process.
> + *
> + * On Qualcomm Technologies devices, it's possible that static resources are
> + * not embedded in the firmware binary and instead are provided by TrustZone.
> + * However, dynamic resources are always expected to come from TrustZone. This
> + * indicates that for Qualcomm devices, all resources (static and dynamic) will
> + * be provided by TrustZone PAS service.
> + *
> + * If the remote processor firmware binary does contain static resources, they
> + * should be passed in input_rt. These will be forwarded to TrustZone for
> + * authentication. TrustZone will then append the dynamic resources and return
> + * the complete resource table in output_rt_tzm.
> + *
> + * If the remote processor firmware binary does not include a resource table,
> + * the caller of this function should set input_rt as NULL and input_rt_size
> + * as zero respectively.
> + *
> + * More about documentation on resource table data structures can be found in
> + * include/linux/remoteproc.h
> + *
> + * @ctx:	    PAS context
> + * @pas_id:	    peripheral authentication service id
> + * @input_rt:       resource table buffer which is present in firmware binary
> + * @input_rt_size:  size of the resource table present in firmware binary
> + * @output_rt_size: TrustZone expects caller should pass worst case size for
> + *		    the output_rt_tzm.
> + *
> + * Return:
> + *  On success, returns a pointer to the allocated buffer containing the final
> + *  resource table and output_rt_size will have actual resource table size from
> + *  TrustZone. The caller is responsible for freeing the buffer. On failure,
> + *  returns ERR_PTR(-errno).
> + */
> +struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
> +					      void *input_rt,
> +					      size_t input_rt_size,
> +					      size_t *output_rt_size)
> +{
> +	if (!ops_ptr)
> +		return ERR_PTR(-ENODEV);
> +	if (!ctx)
> +		return ERR_PTR(-EINVAL);
> +
> +	return ops_ptr->get_rsc_table(ops_ptr->dev, ctx, input_rt,
> +				      input_rt_size, output_rt_size);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
> +
> +/**
> + * qcom_pas_auth_and_reset() - Authenticate the given peripheral firmware
> + *			       and reset the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return: 0 on success.
> + */
> +int qcom_pas_auth_and_reset(u32 pas_id)
> +{
> +	if (!ops_ptr)
> +		return -ENODEV;
> +
> +	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
> +
> +/**
> + * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> + *				       remote processor
> + *
> + * @ctx:	Context saved during call to qcom_scm_pas_context_init()

devm_qcom_pas_context_alloc()

> + *
> + * This function performs the necessary steps to prepare a PAS subsystem,
> + * authenticate it using the provided metadata, and initiate a reset sequence.
> + *
> + * It should be used when Linux is in control setting up the IOMMU hardware
> + * for remote subsystem during secure firmware loading processes. The
> + * preparation step sets up a shmbridge over the firmware memory before
> + * TrustZone accesses the firmware memory region for authentication. The
> + * authentication step verifies the integrity and authenticity of the firmware
> + * or configuration using secure metadata. Finally, the reset step ensures the
> + * subsystem starts in a clean and sane state.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx)
> +{
> +	if (!ops_ptr)
> +		return -ENODEV;
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	return ops_ptr->prepare_and_auth_reset(ops_ptr->dev, ctx);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_prepare_and_auth_reset);
> +
> +/**
> + * qcom_pas_set_remote_state() - Set the remote processor state
> + * @state:	peripheral state
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return: 0 on success.
> + */
> +int qcom_pas_set_remote_state(u32 state, u32 pas_id)
> +{
> +	if (!ops_ptr)
> +		return -ENODEV;
> +
> +	return ops_ptr->set_remote_state(ops_ptr->dev, state, pas_id);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_set_remote_state);
> +
> +/**
> + * qcom_pas_shutdown() - Shut down the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return: 0 on success.
> + */
> +int qcom_pas_shutdown(u32 pas_id)
> +{
> +	if (!ops_ptr)
> +		return -ENODEV;
> +
> +	return ops_ptr->shutdown(ops_ptr->dev, pas_id);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_shutdown);
> +
> +/**
> + * qcom_pas_supported() - Check if the peripheral authentication service is
> + *			  available for the given peripheral
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return: true if PAS is supported for this peripheral, otherwise false.
> + */
> +bool qcom_pas_supported(u32 pas_id)
> +{
> +	if (!ops_ptr)
> +		return false;
> +
> +	return ops_ptr->supported(ops_ptr->dev, pas_id);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_supported);
> +
> +bool qcom_pas_is_available(void)
> +{
> +	/*
> +	 * The barrier for ops_ptr is intended to synchronize the data stores
> +	 * for the ops data structure when client drivers are in parallel
> +	 * checking for PAS service availability.
> +	 *
> +	 * Once the PAS backend becomes available, it is allowed for multiple
> +	 * threads to enter TZ for parallel bringup of co-processors during
> +	 * boot.
> +	 */
> +	return !!smp_load_acquire(&ops_ptr);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_is_available);
> +
> +void qcom_pas_ops_register(struct qcom_pas_ops *ops)
> +{
> +	if (!qcom_pas_is_available())
> +		/* Paired with smp_load_acquire() in qcom_pas_is_available() */
> +		smp_store_release(&ops_ptr, ops);
> +	else
> +		pr_err("qcom_pas: ops already registered by %s\n",
> +		       ops_ptr->drv_name);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_ops_register);
> +
> +void qcom_pas_ops_unregister(void)
> +{
> +	/* Paired with smp_load_acquire() in qcom_pas_is_available() */
> +	smp_store_release(&ops_ptr, NULL);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_ops_unregister);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Qualcomm generic TZ PAS driver");
> diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
> new file mode 100644
> index 000000000000..8643e2760602
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QCOM_PAS_INT_H
> +#define __QCOM_PAS_INT_H
> +
> +struct device;
> +
> +/**
> + * struct qcom_pas_ops - Qcom Peripheral Authentication Service (PAS) ops
> + * @drv_name:			PAS driver name.
> + * @dev:			PAS device pointer.
> + * @supported:			Peripheral supported callback.
> + * @init_image:			Peripheral image initialization callback.
> + * @mem_setup:			Peripheral memory setup callback.
> + * @get_rsc_table:		Peripheral get resource table callback.
> + * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
> + *				reset callback.
> + * @auth_and_reset:		Peripheral firmware authentication and reset
> + *				callback.
> + * @set_remote_state:		Peripheral set remote state callback.
> + * @shutdown:			Peripheral shutdown callback.
> + * @metadata_release:		Image metadata release callback.
> + */
> +struct qcom_pas_ops {
> +	const char *drv_name;
> +	struct device *dev;
> +	bool (*supported)(struct device *dev, u32 pas_id);
> +	int (*init_image)(struct device *dev, u32 pas_id, const void *metadata,
> +			  size_t size, struct qcom_pas_context *ctx);
> +	int (*mem_setup)(struct device *dev, u32 pas_id, phys_addr_t addr,
> +			 phys_addr_t size);
> +	void *(*get_rsc_table)(struct device *dev, struct qcom_pas_context *ctx,
> +			       void *input_rt, size_t input_rt_size,
> +			       size_t *output_rt_size);
> +	int (*prepare_and_auth_reset)(struct device *dev,
> +				      struct qcom_pas_context *ctx);
> +	int (*auth_and_reset)(struct device *dev, u32 pas_id);
> +	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
> +	int (*shutdown)(struct device *dev, u32 pas_id);
> +	void (*metadata_release)(struct device *dev,
> +				 struct qcom_pas_context *ctx);
> +};
> +
> +void qcom_pas_ops_register(struct qcom_pas_ops *ops);
> +void qcom_pas_ops_unregister(void);
> +
> +#endif /* __QCOM_PAS_INT_H */
> diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
> new file mode 100644
> index 000000000000..65b1c9564458
> --- /dev/null
> +++ b/include/linux/firmware/qcom/qcom_pas.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2010-2015, 2018-2019 The Linux Foundation. All rights reserved.
> + * Copyright (C) 2015 Linaro Ltd.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QCOM_PAS_H
> +#define __QCOM_PAS_H
> +
> +#include <linux/err.h>
> +#include <linux/types.h>
> +
> +struct qcom_pas_context {
> +	struct device *dev;
> +	u32 pas_id;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	void *ptr;
> +	dma_addr_t phys;
> +	ssize_t size;
> +	bool use_tzmem;
> +};
> +
> +bool qcom_pas_is_available(void);
> +struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
> +						     u32 pas_id,
> +						     phys_addr_t mem_phys,
> +						     size_t mem_size);
> +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> +			struct qcom_pas_context *ctx);
> +struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
> +					      void *input_rt, size_t input_rt_size,
> +					      size_t *output_rt_size);
> +int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
> +int qcom_pas_auth_and_reset(u32 pas_id);
> +int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
> +int qcom_pas_set_remote_state(u32 state, u32 pas_id);
> +int qcom_pas_shutdown(u32 pas_id);
> +bool qcom_pas_supported(u32 pas_id);
> +void qcom_pas_metadata_release(struct qcom_pas_context *ctx);
> +
> +#endif /* __QCOM_PAS_H */
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

