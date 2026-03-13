Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD548105F797
	for <ath12k@archiver.kernel.org>; Fri, 13 Mar 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e36oZbKohafb7XeQZtpNepWiozZ4hMeiBqXvtRWVqgQ=; b=ZHKOF6C5JsKOXp5oCm89KSQ+8R
	FWPMd5W+FmYDhIaap1VlLOm1jcgMhSbSYFy0ds4cdWi+y82ixWBlfFHQjHn6OfIboFbCInTRByiYG
	qZNgYm0qRxqrk4YBE/FpBsgUo6XEMFzpRs6mcJHmhtqEM5mt1XYox9sstDdEUwVq3ffX8bmzNoLzN
	WozdEFFdCxxCaK4u3qVv/vgXPHIMqs3ESYDxZ2iZMICST+CRYv4PJVcupaNIrWtWdVW/j2nQP/cKU
	ygAAuyfDcYzXAIkXycVABX52FaRlLX+HFyLh+p9xwQavX3lRsURB1U89jkpVWNSporqNl1TIA3Vp7
	ZWhfktdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10NF-0000000HZe6-1JYi;
	Fri, 13 Mar 2026 11:08:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10ND-0000000HZd2-0gxf
	for ath12k@lists.infradead.org;
	Fri, 13 Mar 2026 11:08:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tZ0S4140646
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 11:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e36oZbKohafb7XeQZtpNepWi
	ozZ4hMeiBqXvtRWVqgQ=; b=o196izQjMSB7dRp2utfm0eg9A1vgd91ajK0hoPWO
	VjxXAXmOlfZVFoH9jIVF+shxOEVm/0CliQp/pZgJQvU+iNi9YTIPONFXwViQ9i0c
	qteIlXu7jpDy1bYt/sddglAWa1MWur+paVXAKF9FsMiATqZjNRBytxG0CFB370SR
	9/mWKeVh0AHaaW2r3pXcZMHS64os7C2d6atYW6RXUc490RD8F+9bCmEdHKxK4oCv
	sKoe7I7uOapQgiQVqZCRCZdqMsVzRDowFQl45aGX2S6vY1qO9oW9/hg1Xukg5IsC
	sqyW/qYJ2+ZG3JkYimTObHSyBNRlYxRMRU3c3gBvM7Fpcw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn29acw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 11:08:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecfe69196so5457005ad.1
        for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773400086; x=1774004886; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e36oZbKohafb7XeQZtpNepWiozZ4hMeiBqXvtRWVqgQ=;
        b=RV2DJVJxqV8wM4++UGX5Y7cOSrivMR0QFadCxGEZhMTnJRygKhf2tfo8/bXAwRNxGw
         /fWToMWn4KqSmLtVaDEH01UXCkSPCBhsF7IU7crCgg9FatvWypg68oMf8AGlMH9lHw2D
         D5mB/qn5pI4gIgWx3j0GDKIohwwAYfPLCCGiI9CPMX+W1bmBsHB+rndcMcbiu+CJB6lm
         76mHTwcHTG1TwewiSLmD714dZ3S62okz39vEYF+mFYZAAznpx6QDflifz3mPGsnw6nCS
         QiXboixavzK7e4GRbC9a34P78xIk+8VYJdY6Iicd0a2at08+maLYB0CU6Mb1D88beXDb
         +w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400086; x=1774004886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e36oZbKohafb7XeQZtpNepWiozZ4hMeiBqXvtRWVqgQ=;
        b=DrajZs8n7TNQ+SZJlaka/3wjKWHyw21q37WnfJKWqhecZYKc/ReTO3kZYRTEl0gZrh
         /fLNv1z/NYfC04JFMfnEX62malSMkvJvfhHr8o9JRlpzSTYmAOC3gx29+eFYOzoS3Itw
         6YvoOSqxKZULMe2x/nBKorrz2DyrGHk9SkZbANKdhLnRF5WEfIDUPCxzlrw4RC5Fas6f
         BQAEIw0SlX2ufFk4cyZqVsC6gwIStQdHsE7GSjznHaf/XgJwVpnKC+UcLA/mPQ0LphlZ
         jZgB6OjOY8VXkOzwSrz5gBJR6MUDpIhzuOdjn64RF1Rk0LtSBNbLYQ3mTC/qnV1l1K/i
         5RQw==
X-Forwarded-Encrypted: i=1; AJvYcCVUYQbZiVTzpLPn7JtNe6sZw6F8PjYHhC6hy+gyrYHHZjV3Gj+I7KpgRROTySALwNPxBiD+SpI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww+Aki8ymXyYQD0+5nziIrNIRGU3Xy/9OSPxyRS56h2KYHpe34
	eNNnw5fV7a+yrRSS6lwmUZxjMe63rOTFRvOy61JHW2LaU5JGvMSqdajpuoMhnaXY8V4J0frL8me
	YZ3dyJ2JZsAvZ0VaDfuvMLxZ3eF+Hs7KSazerz0eFMEPSSa2StytyF6Rumk1AjkOU
X-Gm-Gg: ATEYQzyBAzlzpnyfVZsM+cPpQn/EQLzl9YOOA9/KeT3VOHna5V+G/BQJhHo/POZdgMp
	ObkQ3x59+7dCDcCu36LqwfXWfmSc3ZH4QPS/PL7aUiK+Qrl5hFpn8z9Tf0iYVRP9+jW0c/k9GK3
	ewMDq79iMQryGVQbjqyOhtea2UEK3P3aAL/6/IB1dWmz7DcN66yRKXFTmaspyX7u/zUU8wFVtUZ
	ea1cfB6QHWTOQnMMOQTUyIf+27XzQxD7e/aKV00A3onUzY2z2hCD0rO816Z6LBNFiOLKbjq/dtt
	RGu3UU4J7YIiqS7zP5yzRT7dIdAtxVCtFuZWGup64fvDwncU8uSKRme/qTjhEwFvFdtj/62hV1l
	IQ0lnjd7tzerIZSKGojQGHPZRWl9TDB4dSWyHrWECk4Qq8Mu4
X-Received: by 2002:a17:902:ce11:b0:2ae:c34d:8c4e with SMTP id d9443c01a7336-2aecaa9e9c0mr28257395ad.38.1773400085350;
        Fri, 13 Mar 2026 04:08:05 -0700 (PDT)
X-Received: by 2002:a17:902:ce11:b0:2ae:c34d:8c4e with SMTP id d9443c01a7336-2aecaa9e9c0mr28256505ad.38.1773400084516;
        Fri, 13 Mar 2026 04:08:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56c56csm25454045ad.7.2026.03.13.04.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:08:04 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:37:47 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/15] firmware: qcom: Add a PAS TEE service
Message-ID: <20260313110747.v5bx2snpbtyja3ur@hu-mojha-hyd.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-5-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312062756.694390-5-sumit.garg@kernel.org>
X-Proofpoint-ORIG-GUID: _YRB5grjE9cMxmqU_iK7--pQn5s0YhdJ
X-Proofpoint-GUID: _YRB5grjE9cMxmqU_iK7--pQn5s0YhdJ
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3f016 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JHwwdyD97BAlXG7hVn4A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NyBTYWx0ZWRfXxMpJDJchPT8P
 LbgJTdPkbwCNsxZKFpl/dRIIo1Ab6NLrdSSOzQpzUkys2kPI0iiz8IaOXcuoMADJVCytwstiQxG
 Q7nw2WEm2C7B78ZpbNAYQ3LGTZjZJ6SI4kNe8D6FiMLDNOc2oItMb0RdpNgLkE3RDJtWKD65Y52
 QayQsf7lNSPwR2cjyvX2HRzmrV7zukB1NSVfVZl79boWQYv3n1qLnQAXgxCJRzAklapPuV4j2z9
 s38TNRniM4lZzYAywq/4yq+ehEpgM19ldE7yX3nkzrbyX/FAfhrSjsN25i7HbzfPjrM3lKdEwlx
 vshv00dWBF3VZvTO88gnJUVzan2SEpw+LRt+JbEqSSBFakp3en+59vXrzSZrRCoiJGGDgWrV9el
 sUX9o2PxdstPNPFc3Nznggy9Hl962wJmsvyxmhlZfDWr3YGM8+qgi4rdRP36cqk4tiJxPmTcM9y
 TIZ6Z4cVxMirEG4XPVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_040807_220190_51D51D77 
X-CRM114-Status: GOOD (  26.85  )
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

On Thu, Mar 12, 2026 at 11:57:45AM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Add support for Peripheral Authentication Service (PAS) driver based
> on TEE bus with OP-TEE providing the backend PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig        |   9 +
>  drivers/firmware/qcom/Makefile       |   1 +
>  drivers/firmware/qcom/qcom_pas_tee.c | 477 +++++++++++++++++++++++++++
>  3 files changed, 487 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
> 
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 9a12ae2b639d..fff47abdaafd 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -14,6 +14,15 @@ config QCOM_PAS
>  	  backends plugged in whether it's an SCM implementation or a proper
>  	  TEE bus based PAS service implementation.
>  
> +config QCOM_PAS_TEE
> +	tristate
> +	select QCOM_PAS
> +	depends on TEE
> +	depends on !CPU_BIG_ENDIAN
> +	help
> +	  Enable the generic Peripheral Authentication Service (PAS) provided
> +	  by the firmware TEE implementation as the backend.
> +
>  config QCOM_SCM
>  	select QCOM_PAS
>  	select QCOM_TZMEM
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> index dc5ab45f906a..48801d18f37b 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>  obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
> +obj-$(CONFIG_QCOM_PAS_TEE)	+= qcom_pas_tee.o
> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
> new file mode 100644
> index 000000000000..7db9fd736369
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> @@ -0,0 +1,477 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +
> +#include "qcom_pas.h"
> +
> +/*
> + * Peripheral Authentication Service (PAS) supported.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + */
> +#define PTA_QCOM_PAS_IS_SUPPORTED		1
> +
> +/*
> + * PAS capabilities.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [out] params[1].value.a:	PAS capability flags
> + */
> +#define PTA_QCOM_PAS_CAPABILITIES		2
> +
> +/*
> + * PAS image initialization.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [in]  params[1].memref:	Loadable firmware metadata
> + */
> +#define PTA_QCOM_PAS_INIT_IMAGE			3
> +
> +/*
> + * PAS memory setup.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [in]  params[0].value.b:	Relocatable firmware size
> + * [in]  params[1].value.a:	32bit LSB relocatable firmware memory address
> + * [in]  params[1].value.b:	32bit MSB relocatable firmware memory address
> + */
> +#define PTA_QCOM_PAS_MEM_SETUP			4
> +
> +/*
> + * PAS get resource table.
> + *
> + * [in]     params[0].value.a:	Unique 32bit remote processor identifier
> + * [inout]  params[1].memref:	Resource table config
> + */
> +#define PTA_QCOM_PAS_GET_RESOURCE_TABLE		5
> +
> +/*
> + * PAS image authentication and co-processor reset.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [in]  params[0].value.b:	Firmware size
> + * [in]  params[1].value.a:	32bit LSB firmware memory address
> + * [in]  params[1].value.b:	32bit MSB firmware memory address
> + * [in]  params[2].memref:	Optional fw memory space shared/lent
> + */
> +#define PTA_QCOM_PAS_AUTH_AND_RESET		6
> +
> +/*
> + * PAS co-processor set suspend/resume state.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [in]  params[0].value.b:	Co-processor state identifier
> + */
> +#define PTA_QCOM_PAS_SET_REMOTE_STATE		7
> +
> +/*
> + * PAS co-processor shutdown.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + */
> +#define PTA_QCOM_PAS_SHUTDOWN			8
> +
> +#define TEE_NUM_PARAMS				4
> +
> +/**
> + * struct qcom_pas_tee_private - PAS service private data
> + * @dev:		PAS service device.
> + * @ctx:		TEE context handler.
> + * @session_id:		PAS TA session identifier.
> + */
> +struct qcom_pas_tee_private {
> +	struct device *dev;
> +	struct tee_context *ctx;
> +	u32 session_id;
> +};
> +
> +static bool qcom_pas_tee_supported(struct device *dev, u32 pas_id)
> +{
> +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> +	struct tee_ioctl_invoke_arg inv_arg = {
> +		.func = PTA_QCOM_PAS_IS_SUPPORTED,
> +		.session = data->session_id,
> +		.num_params = TEE_NUM_PARAMS
> +	};
> +	struct tee_param param[4] = {
> +		[0] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = pas_id
> +		}
> +	};
> +	int ret;
> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS not supported, pas_id: %d, err: %x\n",
> +			pas_id, inv_arg.ret);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static int qcom_pas_tee_init_image(struct device *dev, u32 pas_id,
> +				   const void *metadata, size_t size,
> +				   struct qcom_pas_context *ctx)
> +{
> +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> +	struct tee_ioctl_invoke_arg inv_arg = {
> +		.func = PTA_QCOM_PAS_INIT_IMAGE,
> +		.session = data->session_id,
> +		.num_params = TEE_NUM_PARAMS
> +	};
> +	struct tee_param param[4] = {
> +		[0] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = pas_id
> +		},
> +		[1] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
> +		}
> +	};
> +	struct tee_shm *mdata_shm;
> +	u8 *mdata_buf = NULL;
> +	int ret;
> +
> +	mdata_shm = tee_shm_alloc_kernel_buf(data->ctx, size);
> +	if (IS_ERR(mdata_shm)) {
> +		dev_err(dev, "mdata_shm allocation failed\n");
> +		return PTR_ERR(mdata_shm);
> +	}
> +
> +	mdata_buf = tee_shm_get_va(mdata_shm, 0);
> +	if (IS_ERR(mdata_buf)) {
> +		dev_err(dev, "mdata_buf get VA failed\n");
> +		tee_shm_free(mdata_shm);
> +		return PTR_ERR(mdata_buf);
> +	}
> +	memcpy(mdata_buf, metadata, size);
> +
> +	param[1].u.memref.shm = mdata_shm;
> +	param[1].u.memref.size = size;
> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS init image failed, pas_id: %d, err: %x\n",
> +			pas_id, inv_arg.ret);
> +		tee_shm_free(mdata_shm);
> +		return -EINVAL;
> +	}
> +	ctx->ptr = (void *)mdata_shm;
> +
> +	return 0;
> +}
> +
> +static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
> +				  phys_addr_t addr, phys_addr_t size)
> +{
> +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> +	struct tee_ioctl_invoke_arg inv_arg = {
> +		.func = PTA_QCOM_PAS_MEM_SETUP,
> +		.session = data->session_id,
> +		.num_params = TEE_NUM_PARAMS
> +	};
> +	struct tee_param param[4] = {
> +		[0] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = pas_id,
> +			.u.value.b = size,
> +		},
> +		[1] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = lower_32_bits(addr),
> +			.u.value.b = upper_32_bits(addr),
> +		}
> +	};
> +	int ret;
> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS mem setup failed, pas_id: %d, err: %x\n",
> +			pas_id, inv_arg.ret);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +DEFINE_FREE(shm_free, struct tee_shm *, tee_shm_free(_T))
> +
> +static void *qcom_pas_tee_get_rsc_table(struct device *dev,
> +					struct qcom_pas_context *ctx,
> +					void *input_rt, size_t input_rt_size,
> +					size_t *output_rt_size)
> +{
> +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> +	struct tee_ioctl_invoke_arg inv_arg = {
> +		.func = PTA_QCOM_PAS_GET_RESOURCE_TABLE,
> +		.session = data->session_id,
> +		.num_params = TEE_NUM_PARAMS
> +	};
> +	struct tee_param param[4] = {
> +		[0] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = ctx->pas_id,
> +		},
> +		[1] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> +			.u.memref.size = input_rt_size,
> +		}
> +	};
> +	void *rt_buf = NULL;
> +	int ret;
> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);

What is the purpose of this function ? looks like, this is for, how
much Linux need to allocate for output buffer ?

> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS get RT failed, pas_id: %d, err: %x\n",
> +			ctx->pas_id, inv_arg.ret);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (param[1].u.memref.size) {
> +		struct tee_shm *rt_shm __free(shm_free) =
> +			tee_shm_alloc_kernel_buf(data->ctx,
> +						 param[1].u.memref.size);
> +		void *rt_shm_va;
> +
> +		if (IS_ERR(rt_shm)) {
> +			dev_err(dev, "rt_shm allocation failed\n");
> +			return rt_shm;
> +		}
> +
> +		rt_shm_va = tee_shm_get_va(rt_shm, 0);
> +		if (IS_ERR_OR_NULL(rt_shm_va)) {
> +			dev_err(dev, "rt_shm get VA failed\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		memcpy(rt_shm_va, input_rt, input_rt_size);
> +
> +		param[1].u.memref.shm = rt_shm;

Here, you are passing only one buffer for both input and output ?

Like, you are allocating of buffer of size returned from qtee which I
assume includes both input + output rt size and copying the input_rt
and calling invoke and in return you will get combine table in return ?

> +		ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +		if (ret < 0 || inv_arg.ret != 0) {
> +			dev_err(dev, "PAS get RT failed, pas_id: %d, err: %x\n",
> +				ctx->pas_id, inv_arg.ret);
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		if (param[1].u.memref.size) {
> +			*output_rt_size = param[1].u.memref.size;
> +			rt_buf = kmalloc(param[1].u.memref.size, GFP_KERNEL);
> +			if (!rt_buf)
> +				return ERR_PTR(-ENOMEM);
> +
> +			memcpy(rt_buf, rt_shm_va, *output_rt_size);

rt_buf = kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);

https://lore.kernel.org/lkml/20260310140255.2520230-1-mukesh.ojha@oss.qualcomm.com/


> +		}
> +	}
> +
> +	return rt_buf;
> +}
> +
> +static int __qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id,
> +					 phys_addr_t mem_phys, size_t mem_size)
> +{
> +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> +	struct tee_ioctl_invoke_arg inv_arg = {
> +		.func = PTA_QCOM_PAS_AUTH_AND_RESET,
> +		.session = data->session_id,
> +		.num_params = TEE_NUM_PARAMS
> +	};
> +	struct tee_param param[4] = {
> +		[0] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = pas_id,
> +			.u.value.b = mem_size,
> +		},
> +		[1] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = lower_32_bits(mem_phys),
> +			.u.value.b = upper_32_bits(mem_phys),
> +		},
> +		/* Reserved for fw memory space to be shared or lent */
> +		[2] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
> +		}
> +	};
> +	int ret;
> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS auth reset failed, pas_id: %d, err: %x\n",
> +			pas_id, inv_arg.ret);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id)
> +{
> +	return __qcom_pas_tee_auth_and_reset(dev, pas_id, 0, 0);
> +}
> +
> +static int qcom_pas_tee_prepare_and_auth_reset(struct device *dev,
> +					       struct qcom_pas_context *ctx)
> +{
> +	return __qcom_pas_tee_auth_and_reset(dev, ctx->pas_id, ctx->mem_phys,
> +					     ctx->mem_size);
> +}
> +
> +static int qcom_pas_tee_set_remote_state(struct device *dev, u32 state,
> +					 u32 pas_id)
> +{
> +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> +	struct tee_ioctl_invoke_arg inv_arg = {
> +		.func = PTA_QCOM_PAS_SET_REMOTE_STATE,
> +		.session = data->session_id,
> +		.num_params = TEE_NUM_PARAMS
> +	};
> +	struct tee_param param[4] = {
> +		[0] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = pas_id,
> +			.u.value.b = state,
> +		}
> +	};
> +	int ret;
> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS shutdown failed, pas_id: %d, err: %x\n",
> +			pas_id, inv_arg.ret);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_pas_tee_shutdown(struct device *dev, u32 pas_id)
> +{
> +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> +	struct tee_ioctl_invoke_arg inv_arg = {
> +		.func = PTA_QCOM_PAS_SHUTDOWN,
> +		.session = data->session_id,
> +		.num_params = TEE_NUM_PARAMS
> +	};
> +	struct tee_param param[4] = {
> +		[0] = {
> +			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> +			.u.value.a = pas_id
> +		}
> +	};
> +	int ret = 0;
> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS shutdown failed, pas_id: %d, err: %x\n",
> +			pas_id, inv_arg.ret);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void qcom_pas_tee_metadata_release(struct device *dev,
> +					  struct qcom_pas_context *ctx)
> +{
> +	struct tee_shm *mdata_shm = ctx->ptr;
> +
> +	tee_shm_free(mdata_shm);
> +}
> +
> +static struct qcom_pas_ops qcom_pas_ops_tee = {
> +	.drv_name		= "qcom-pas-tee",
> +	.supported		= qcom_pas_tee_supported,
> +	.init_image		= qcom_pas_tee_init_image,
> +	.mem_setup		= qcom_pas_tee_mem_setup,
> +	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
> +	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
> +	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
> +	.set_remote_state	= qcom_pas_tee_set_remote_state,
> +	.shutdown		= qcom_pas_tee_shutdown,
> +	.metadata_release	= qcom_pas_tee_metadata_release,
> +};
> +
> +static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	return ver->impl_id == TEE_IMPL_ID_OPTEE;
> +}
> +
> +static int qcom_pas_tee_probe(struct tee_client_device *pas_dev)
> +{
> +	struct device *dev = &pas_dev->dev;
> +	struct qcom_pas_tee_private *data;
> +	struct tee_ioctl_open_session_arg sess_arg = {
> +		.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL
> +	};
> +	int ret, err = -ENODEV;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
> +	if (IS_ERR(data->ctx))
> +		return -ENODEV;
> +
> +	export_uuid(sess_arg.uuid, &pas_dev->id.uuid);
> +	ret = tee_client_open_session(data->ctx, &sess_arg, NULL);
> +	if (ret < 0 || sess_arg.ret != 0) {
> +		dev_err(dev, "tee_client_open_session failed, err: %x\n",
> +			sess_arg.ret);
> +		err = -EINVAL;
> +		goto out_ctx;
> +	}
> +
> +	data->session_id = sess_arg.session;
> +	dev_set_drvdata(dev, data);
> +	qcom_pas_ops_tee.dev = dev;
> +	qcom_pas_ops_register(&qcom_pas_ops_tee);
> +
> +	return 0;
> +out_ctx:
> +	tee_client_close_context(data->ctx);
> +
> +	return err;
> +}
> +
> +static void qcom_pas_tee_remove(struct tee_client_device *pas_dev)
> +{
> +	struct device *dev = &pas_dev->dev;
> +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> +
> +	qcom_pas_ops_unregister();
> +	tee_client_close_session(data->ctx, data->session_id);
> +	tee_client_close_context(data->ctx);
> +}
> +
> +static const struct tee_client_device_id qcom_pas_tee_id_table[] = {
> +	{UUID_INIT(0xcff7d191, 0x7ca0, 0x4784,
> +		   0xaf, 0x13, 0x48, 0x22, 0x3b, 0x9a, 0x4f, 0xbe)},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(tee, qcom_pas_tee_id_table);
> +
> +static struct tee_client_driver optee_pas_tee_driver = {
> +	.probe		= qcom_pas_tee_probe,
> +	.remove		= qcom_pas_tee_remove,
> +	.id_table	= qcom_pas_tee_id_table,
> +	.driver		= {
> +		.name		= "qcom-pas-tee",
> +	},
> +};
> +
> +module_tee_client_driver(optee_pas_tee_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("TEE bus based Qualcomm PAS driver");
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

