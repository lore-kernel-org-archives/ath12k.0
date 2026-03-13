Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D237106FD9D
	for <ath12k@archiver.kernel.org>; Fri, 13 Mar 2026 07:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WU+b6FamcN4OCxnXqSF11W6F7ikxsFbR7a7cxUznfMs=; b=f7dRvWF5/4feDWA9cNqpv4R7qY
	/0MXGzwPd3osoTOzrokGYQvkT2zrrUyng/50v9tkwq4PhkLw9ndc3EHmAz6aDhdm7ZMrAq4YWpqKG
	0rppJzjWz8X/aQUIuevxqm3/fLAVb5NBuXoMMHEKPe+T4XecrvFT7GbltFEnU6D2AQ3m/RqfqNdb4
	JAnTWGnwtKoAFcLWNHFEnw5Jwmw8iXet8y7ZEGfmXgwGz0lg8TPIxrax9V8bjabTOGQJ6IOv/ByT0
	sF+XcgehhXCHFtaRP5QwBgqUoPYZVtHYedjfk4zM4mrkpqpfRXu8kPbiWKoRxTDcR1TYGaIti772v
	cvF4CArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wzo-0000000H3da-3Mld;
	Fri, 13 Mar 2026 07:31:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wzl-0000000H3cC-25vW
	for ath12k@lists.infradead.org;
	Fri, 13 Mar 2026 07:31:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tct21014832
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 07:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WU+b6FamcN4OCxnXqSF11W6F7ikxsFbR7a7cxUznfMs=; b=KKFQ6l2KlSQjgpyq
	2Spbw3CKSXPUP2bs03CBJTmuEDTz9qAHzCMdWieCRWWyWfIvMuqm28lH0V/fgJhG
	W8I+EpvqnOPahHkNX+UhfdQlfNAwf671GHuUyPWUHcTnpllBv5Yn6YQYIvuOhA0U
	CfqptXItG2zJxg0Qi/EMeiNFKRvYOWRA887CRp+sdl+Aj97I7BVKI0JALRSjKPLo
	i/DOBVdqkBEMNgagXojzJhKDRhurhNgrDvRkRZmQqX75cqU5MVN//YToGNwk5/Hr
	Ex/mBiOKxnZWo3H1L5kQWxL+PCZ5FacvpRc/VFqeW5piKkx2lGMlf+eibC3HLQYg
	Y6xAZw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdmc0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 07:31:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829ba0e63e8so827744b3a.2
        for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773387099; x=1773991899; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WU+b6FamcN4OCxnXqSF11W6F7ikxsFbR7a7cxUznfMs=;
        b=FW4NLRKCQfUWafYLTsReJ6vb2V8/EVv3Iw4vwE4xf3qmRIzgoqnJj/novPNFSjX06F
         vSdGVOIgwrqQYax1a+CfMa0h8HLz/zMlqplGtcpBPqMML994rVdA/Iah+4/23Wx68J4l
         Cqu/DK2vfl6KnIvZ6hHyWN0B+RFG412MXP1WhclT5FnryHFh7Wlhh+0xoFzO1T0fkRWV
         Y6UCic3VyEJXWKLm+TUkvtjQ5iQPM2IEb4b4s4s8jQD3qXASuWeFxkeg7i3xDu/WRgYp
         t2Mg+zkX5nFw2JQihOChKzXcH77t8ZFYxVxDW15R8SrQ0fg8KGQX4B1lqeLS7WpyWWYV
         EqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773387099; x=1773991899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WU+b6FamcN4OCxnXqSF11W6F7ikxsFbR7a7cxUznfMs=;
        b=imHJkeHwH7TpdVVBrms2FAdu4hRsZda7lYtqU4yOqpl1TMdZmq/pfPU7xcWeS4PAVV
         /I/Cdh9ORzKFsS2DmLJXgj5WU3bWf3cNvmZSFsLEbH2d2jywfPf2P8SE/0nbkUdCIN/a
         uRt3bGGsCkSb6kK6XluyEZDQnDBXF4dehOMZ5gM0GrMjntsSvOcvl/tltZrq2l03bhrd
         TpnBEZF7AtQ9HeCLRh0B35AIylSYjdyi6NHNQiMkxc67FHh4M/66tGP9lWb/uxNu/59a
         un/2+KTRnKkZdTmEdPoDPOp+UUezbnrYLQMt15Z4uAhBWRmZKIDkzMTwQaAJutlzBfI8
         e8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+bfC0ineHN7J8Tpy8h9g5xXk9OgUiSJyz1ElleiU0RFigVfSzsY4knZgjTEDPf9I53r5ty38=@lists.infradead.org
X-Gm-Message-State: AOJu0YysZuCHYkPKipBM9dxhknDo8p9tLHmaU1D1vimSaiWkY0e81Wwc
	qs76hNNed9kJ0TTUkIgND3YHAaZNjjKlIgHaLAYxdJI+38hIqXGn/zl5PaBLJvgEuaeajoQuDiA
	LR9nFc3X+KIXWy1MbYWwCcf/gvhTWMVntG6eMgGV/eZVZ4LAb+QBJWKx1/2n27QvC
X-Gm-Gg: ATEYQzyhiUStUP7IAiqTwZIePNXCsYdw7JIZ9WPiFfrGZUkIMpjL9M20uY5q3xRkeFW
	2FvM0WWPMe200O0qkIRLzPYsPLNA+LpkN/ErllSLfSa127dx0untOCyZkJLHO8olpLybqFrxWz8
	ufTTATJ9raIbvL/rSLEhTpdyyrBIOx6qBkapGSCCWdJzebY8+tlsjT4/B0fiiqg6gljvOPI5Oup
	kmjeXZBLLjC3ZDdgr/+jtkwUnXrTGoMTcDUvuzwPem1WXkHCppuSsc+fs9g25v/vLEqblzgVUEc
	Ilj17u2/gbOOlkXScz9s4iSZoA1+ZVq2MardF340bovT0TSi5gDhbUezn4QghRTMbNw31PBreZ9
	gJAxC26qTZ25UGDB8CoCae4zFLyfrc7+33Pl/8q7SvKaag2cq
X-Received: by 2002:a05:6a00:a803:b0:82a:1161:18d9 with SMTP id d2e1a72fcca58-82a19924881mr1890264b3a.58.1773387098664;
        Fri, 13 Mar 2026 00:31:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a803:b0:82a:1161:18d9 with SMTP id d2e1a72fcca58-82a19924881mr1890193b3a.58.1773387097807;
        Fri, 13 Mar 2026 00:31:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a073b265bsm5305340b3a.65.2026.03.13.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:31:37 -0700 (PDT)
Date: Fri, 13 Mar 2026 13:01:21 +0530
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
Subject: Re: [PATCH v2 02/15] firmware: qcom: Add a generic PAS service
Message-ID: <20260313073121.qb7yq7tcga3sshcr@hu-mojha-hyd.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-3-sumit.garg@kernel.org>
 <20260313072450.sx7vqtvh62nflhff@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313072450.sx7vqtvh62nflhff@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1OSBTYWx0ZWRfX2NVmq+/EhR9X
 rJV3gSaQjKzehWzALPvu2EWRbdId/cN04qgOVgD3ZF0Fe6d6mYQxAubNX+7G9VcrvAHme13zvzD
 Ev8sjiTjZsHKRQuu7u2dFPN2vupTN3PFMpvmD729MSVW8xkaRg4g5uIc/aPmSu8wT1ELMXx/DIr
 oBZzhU2p+EDapURCVvwFb1bELDY5FIo7iwC+2DwJazTEr6Zt0OsSYQIvXTDCvK1jUr+csbNHPGe
 iC6+Zh7DME8gkgpk1xo3ht3vWU1ljAz8pVgiSkgzmOx5CYwemndBVSGoT67ugEAtFfI1h69mwtn
 N5BbDMlB6pNjPKYuZvYM84qzTWASdmBLdNQNrO7lOSYmH0T1Ym13o3HEIJ31jTv2kY+nymvP/QY
 Kgk2a2WYMLkaOZg2HySRZOP/Z7GmkuFsBPnAa9gL+VWXoFQvebU/49f0A1RF1EpXJUauRhLQSvZ
 tgwMdMvrHToGvLH+nMQ==
X-Proofpoint-GUID: dVy_EQHdm6FEemcWYT7LV91aRPYT5M4Z
X-Proofpoint-ORIG-GUID: dVy_EQHdm6FEemcWYT7LV91aRPYT5M4Z
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3bd5c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=S51orvrWavICeMSpryUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_003141_665643_1D4C13CB 
X-CRM114-Status: GOOD (  41.75  )
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

On Fri, Mar 13, 2026 at 12:54:50PM +0530, Mukesh Ojha wrote:
> On Thu, Mar 12, 2026 at 11:57:43AM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Qcom platforms has the legacy of using non-standard SCM calls
> > splintered over the various kernel drivers. These SCM calls aren't
> > compliant with the standard SMC calling conventions which is a
> > prerequisite to enable migration to the FF-A specifications from Arm.
> > 
> > OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> > support these non-standard SCM calls. And even for newer architectures
> > with S-EL2 and Hafnium support, QTEE won't be able to support SCM
> 
>  using S‑EL2 with Hafnium
> 
> > calls either with FF-A requirements coming in. And with both OP-TEE
> > and QTEE drivers well integrated in the TEE subsystem, it makes further
> > sense to reuse the TEE bus client drivers infrastructure.
> > 
> > The added benefit of TEE bus infrastructure is that there is support
> > for discoverable/enumerable services. With that client drivers don't
> > have to manually invoke a special SCM call to know the service status.
> > 
> > So enable the generic Peripheral Authentication Service (PAS) provided
> > by the firmware. It acts as the common layer with different TZ
> > backends plugged in whether it's an SCM implementation or a proper
> > TEE bus based PAS service implementation.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/Kconfig          |   8 +
> >  drivers/firmware/qcom/Makefile         |   1 +
> >  drivers/firmware/qcom/qcom_pas.c       | 298 +++++++++++++++++++++++++
> >  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
> >  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
> >  5 files changed, 401 insertions(+)
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.c
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.h
> >  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> > 
> > diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> > index b477d54b495a..8653639d06db 100644
> > --- a/drivers/firmware/qcom/Kconfig
> > +++ b/drivers/firmware/qcom/Kconfig
> > @@ -6,6 +6,14 @@
> >  
> >  menu "Qualcomm firmware drivers"
> >  
> > +config QCOM_PAS
> > +	tristate
> > +	help
> > +	  Enable the generic Peripheral Authentication Service (PAS) provided
> > +	  by the firmware. It acts as the common layer with different TZ
> > +	  backends plugged in whether it's an SCM implementation or a proper
> > +	  TEE bus based PAS service implementation.
> > +
> >  config QCOM_SCM
> >  	select QCOM_TZMEM
> >  	tristate
> > diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> > index 0be40a1abc13..dc5ab45f906a 100644
> > --- a/drivers/firmware/qcom/Makefile
> > +++ b/drivers/firmware/qcom/Makefile
> > @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> >  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
> >  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
> >  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
> > +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
> > diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
> > new file mode 100644
> > index 000000000000..beb1bae55546
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_pas.c
> > @@ -0,0 +1,298 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/device/devres.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +
> > +#include "qcom_pas.h"
> > +
> > +struct qcom_pas_ops *ops_ptr;
> 
> Should this be static ?
> 
> > +
> > +/**
> > + * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
> > + *				   context for a given peripheral
> > + *
> > + * PAS context is device-resource managed, so the caller does not need
> > + * to worry about freeing the context memory.
> > + *
> > + * @dev:	  PAS firmware device
> > + * @pas_id:	  peripheral authentication service id
> > + * @mem_phys:	  Subsystem reserve memory start address
> > + * @mem_size:	  Subsystem reserve memory size
> > + *
> > + * Return: The new PAS context, or ERR_PTR() on failure.
> > + */
> > +struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
> > +						     u32 pas_id,
> > +						     phys_addr_t mem_phys,
> > +						     size_t mem_size)
> > +{
> > +	struct qcom_pas_context *ctx;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ctx->dev = dev;
> > +	ctx->pas_id = pas_id;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +
> > +	return ctx;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
> > +
> > +/**
> > + * qcom_pas_init_image() - Initialize peripheral authentication service state
> > + *			   machine for a given peripheral, using the metadata
> > + * @pas_id:	peripheral authentication service id
> > + * @metadata:	pointer to memory containing ELF header, program header table
> > + *		and optional blob of data used for authenticating the metadata
> > + *		and the rest of the firmware
> > + * @size:	size of the metadata
> > + * @ctx:	optional pas context
> > + *
> > + * Return: 0 on success.
> > + *
> > + * Upon successful return, the PAS metadata context (@ctx) will be used to
> > + * track the metadata allocation, this needs to be released by invoking
> > + * qcom_pas_metadata_release() by the caller.
> > + */
> > +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> > +			struct qcom_pas_context *ctx)

please, align this with previous line '(' for all the functions.

-Mukesh

> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->init_image(ops_ptr->dev, pas_id,
> > +					   metadata, size, ctx);
> > +
> > +	return -ENODEV;
> 
> 
> if (!ops_ptr)
> 	return -ENODEV;
> 
> return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
> 
> 
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_init_image);
> > +
> > +/**
> > + * qcom_pas_metadata_release() - release metadata context
> > + * @ctx:	pas context
> > + */
> > +void qcom_pas_metadata_release(struct qcom_pas_context *ctx)
> > +{
> > +	if (!ctx || !ctx->ptr)
> > +		return;
> > +
> > +	if (ops_ptr)
> > +		ops_ptr->metadata_release(ops_ptr->dev, ctx);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_metadata_release);
> > +
> > +/**
> > + * qcom_pas_mem_setup() - Prepare the memory related to a given peripheral
> > + *			  for firmware loading
> > + * @pas_id:	peripheral authentication service id
> > + * @addr:	start address of memory area to prepare
> > + * @size:	size of the memory area to prepare
> > + *
> > + * Return: 0 on success.
> > + */
> > +int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->mem_setup(ops_ptr->dev, pas_id, addr, size);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_mem_setup);
> > +
> > +/**
> > + * qcom_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> > + *			      for a given peripheral.
> > + *
> > + * Qualcomm remote processor may rely on both static and dynamic resources for
> > + * its functionality. Static resources typically refer to memory-mapped
> > + * addresses required by the subsystem and are often embedded within the
> > + * firmware binary and dynamic resources, such as shared memory in DDR etc.,
> > + * are determined at runtime during the boot process.
> > + *
> > + * On Qualcomm Technologies devices, it's possible that static resources are
> > + * not embedded in the firmware binary and instead are provided by TrustZone.
> > + * However, dynamic resources are always expected to come from TrustZone. This
> > + * indicates that for Qualcomm devices, all resources (static and dynamic) will
> > + * be provided by TrustZone PAS service.
> > + *
> > + * If the remote processor firmware binary does contain static resources, they
> > + * should be passed in input_rt. These will be forwarded to TrustZone for
> > + * authentication. TrustZone will then append the dynamic resources and return
> > + * the complete resource table in output_rt_tzm.
> > + *
> > + * If the remote processor firmware binary does not include a resource table,
> > + * the caller of this function should set input_rt as NULL and input_rt_size
> > + * as zero respectively.
> > + *
> > + * More about documentation on resource table data structures can be found in
> > + * include/linux/remoteproc.h
> > + *
> > + * @ctx:	    PAS context
> > + * @pas_id:	    peripheral authentication service id
> > + * @input_rt:       resource table buffer which is present in firmware binary
> > + * @input_rt_size:  size of the resource table present in firmware binary
> > + * @output_rt_size: TrustZone expects caller should pass worst case size for
> > + *		    the output_rt_tzm.
> > + *
> > + * Return:
> > + *  On success, returns a pointer to the allocated buffer containing the final
> > + *  resource table and output_rt_size will have actual resource table size from
> > + *  TrustZone. The caller is responsible for freeing the buffer. On failure,
> > + *  returns ERR_PTR(-errno).
> > + */
> > +struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
> > +					      void *input_rt,
> > +					      size_t input_rt_size,
> > +					      size_t *output_rt_size)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->get_rsc_table(ops_ptr->dev, ctx, input_rt,
> > +					      input_rt_size, output_rt_size);
> > +
> > +	return ERR_PTR(-ENODEV);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
> > +
> > +/**
> > + * qcom_pas_auth_and_reset() - Authenticate the given peripheral firmware
> > + *			       and reset the remote processor
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return: 0 on success.
> > + */
> > +int qcom_pas_auth_and_reset(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
> > +
> > +/**
> > + * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> > + *				       remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_context_init()
> > + *
> > + * This function performs the necessary steps to prepare a PAS subsystem,
> > + * authenticate it using the provided metadata, and initiate a reset sequence.
> > + *
> > + * It should be used when Linux is in control setting up the IOMMU hardware
> > + * for remote subsystem during secure firmware loading processes. The
> > + * preparation step sets up a shmbridge over the firmware memory before
> > + * TrustZone accesses the firmware memory region for authentication. The
> > + * authentication step verifies the integrity and authenticity of the firmware
> > + * or configuration using secure metadata. Finally, the reset step ensures the
> > + * subsystem starts in a clean and sane state.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->prepare_and_auth_reset(ops_ptr->dev, ctx);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_prepare_and_auth_reset);
> > +
> > +/**
> > + * qcom_pas_set_remote_state() - Set the remote processor state
> > + * @state:	peripheral state
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return: 0 on success.
> > + */
> > +int qcom_pas_set_remote_state(u32 state, u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->set_remote_state(ops_ptr->dev, state, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_set_remote_state);
> > +
> > +/**
> > + * qcom_pas_shutdown() - Shut down the remote processor
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return: 0 on success.
> > + */
> > +int qcom_pas_shutdown(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->shutdown(ops_ptr->dev, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_shutdown);
> > +
> > +/**
> > + * qcom_pas_supported() - Check if the peripheral authentication service is
> > + *			  available for the given peripheral
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return: true if PAS is supported for this peripheral, otherwise false.
> > + */
> > +bool qcom_pas_supported(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->supported(ops_ptr->dev, pas_id);
> > +
> > +	return false;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_supported);
> > +
> > +/**
> > + * qcom_pas_is_available() - Check for PAS service
> > + *
> 
> Name of the function is self sufficient, we can avoid for one liner
> documentation.
> 
> > + * Return: true on success.
> > + */
> > +bool qcom_pas_is_available(void)
> > +{
> > +	/*
> > +	 * The barrier for ops_ptr is intended to synchronize the data stores
> > +	 * for the ops data structure when client drivers are in parallel
> > +	 * checking for PAS service availability.
> > +	 *
> > +	 * Once the PAS backend becomes available, it is allowed for multiple
> > +	 * threads to enter TZ for parallel bringup of co-processors during
> > +	 * boot.
> > +	 */
> > +	return !!smp_load_acquire(&ops_ptr);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_is_available);
> > +
> > +/**
> > + * qcom_pas_ops_register() - Register PAS service ops
> > + * @ops:	PAS service ops pointer
> > + */
> 
> same here..
> 
> > +void qcom_pas_ops_register(struct qcom_pas_ops *ops)
> > +{
> > +	if (!qcom_pas_is_available())
> > +		/* Paired with smp_load_acquire() in qcom_pas_is_available() */
> > +		smp_store_release(&ops_ptr, ops);
> > +	else
> > +		pr_err("qcom_pas: ops already registered\n");
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_ops_register);
> > +
> > +/**
> > + * qcom_pas_ops_unregister() - Unregister PAS service ops
> > + */
> 
> same here to avoid verbose..
> 
> > +void qcom_pas_ops_unregister(void)
> > +{
> > +	/* Paired with smp_load_acquire() in qcom_pas_is_available() */
> > +	smp_store_release(&ops_ptr, NULL);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_ops_unregister);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("Qualcomm common TZ PAS driver");
> > diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
> > new file mode 100644
> > index 000000000000..4ebed22178f8
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_pas.h
> > @@ -0,0 +1,53 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef __QCOM_PAS_INT_H
> > +#define __QCOM_PAS_INT_H
> > +
> > +struct device;
> > +
> > +/**
> > + * struct qcom_pas_ops - Qcom Peripheral Authentication Service (PAS) ops
> > + * @drv_name:			PAS driver name.
> > + * @dev:			PAS device pointer.
> > + * @supported:			Peripheral supported callback.
> > + * @init_image:			Peripheral image initialization callback.
> > + * @mem_setup:			Peripheral memory setup callback.
> > + * @get_rsc_table:		Peripheral get resource table callback.
> > + * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
> > + *				reset callback.
> > + * @auth_and_reset:		Peripheral firmware authentication and reset
> > + *				callback.
> > + * @set_remote_state:		Peripheral set remote state callback.
> > + * @shutdown:			Peripheral shutdown callback.
> > + * @metadata_release:		Image metadata release callback.
> > + */
> > +struct qcom_pas_ops {
> > +	const char *drv_name;
> > +	struct device *dev;
> > +	bool (*supported)(struct device *dev, u32 pas_id);
> > +	int (*init_image)(struct device *dev, u32 pas_id,
> > +			  const void *metadata, size_t size,
> > +			  struct qcom_pas_context *ctx);
> > +	int (*mem_setup)(struct device *dev, u32 pas_id,
> > +			 phys_addr_t addr, phys_addr_t size);
> > +	void *(*get_rsc_table)(struct device *dev,
> > +			       struct qcom_pas_context *ctx,
> > +			       void *input_rt,
> > +			       size_t input_rt_size,
> > +			       size_t *output_rt_size);
> > +	int (*prepare_and_auth_reset)(struct device *dev,
> > +				      struct qcom_pas_context *ctx);
> > +	int (*auth_and_reset)(struct device *dev, u32 pas_id);
> > +	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
> > +	int (*shutdown)(struct device *dev, u32 pas_id);
> > +	void (*metadata_release)(struct device *dev,
> > +				 struct qcom_pas_context *ctx);
> 
> I think, some of them can be unwrapped to look cleaner..
> 
> > +};
> > +
> > +void qcom_pas_ops_register(struct qcom_pas_ops *ops);
> > +void qcom_pas_ops_unregister(void);
> > +
> > +#endif /* __QCOM_PAS_INT_H */
> > diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
> > new file mode 100644
> > index 000000000000..ef7328ecfa47
> > --- /dev/null
> > +++ b/include/linux/firmware/qcom/qcom_pas.h
> > @@ -0,0 +1,41 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> 
> Should this not carry all copyright coming from qcom_scm.h
> 
> > + */
> > +
> > +#ifndef __QCOM_PAS_H
> > +#define __QCOM_PAS_H
> > +
> > +#include <linux/err.h>
> > +#include <linux/types.h>
> > +
> > +struct qcom_pas_context {
> > +	struct device *dev;
> > +	u32 pas_id;
> > +	phys_addr_t mem_phys;
> > +	size_t mem_size;
> > +	void *ptr;
> > +	dma_addr_t phys;
> > +	ssize_t size;
> > +	bool use_tzmem;
> > +};
> > +
> > +bool qcom_pas_is_available(void);
> > +struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
> > +						     u32 pas_id,
> > +						     phys_addr_t mem_phys,
> > +						     size_t mem_size);
> > +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> > +			struct qcom_pas_context *ctx);
> > +struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
> > +					      void *input_rt, size_t input_rt_size,
> > +					      size_t *output_rt_size);
> > +int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
> > +int qcom_pas_auth_and_reset(u32 pas_id);
> > +int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
> > +int qcom_pas_set_remote_state(u32 state, u32 pas_id);
> > +int qcom_pas_shutdown(u32 pas_id);
> > +bool qcom_pas_supported(u32 pas_id);
> > +void qcom_pas_metadata_release(struct qcom_pas_context *ctx);
> > +
> > +#endif /* __QCOM_PAS_H */
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha

