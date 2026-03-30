Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0DEFB3D05
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rS3q4/ckZwfhIe+L/YtKzkCxLX5gEQTddXgVybWNDR0=; b=aY4tqLKHEZW1IsvcJlN8WMUbfr
	pcNQvIs5WDsIg+ybamB7VB0EZ6FwRsF9n1PMZjyzfA6RWIY2XSRuamqUHRtbM4A1EOxVxesQpML39
	zuGGCDREcdINnbwpYAF/yFNrlQvopM0ujN+PzRKMlbr280RLkTU71FdwZdK/LEOGZAfWBCuX16lyw
	AtiyfjTSACjr+9U0AOeZkMKYXb3vhw7XUMGtcmAvfSKrM+qvmeA4DOs4T5IdYZV2fHkRazKKlDfAu
	W3N99UiF0Jd1GU/VDfv2jMW2FoyqqgVNd1KuiiQkkB3PY0Wg5wTH5i5xUoZdapj9ZqbPYvTOZOQ0i
	EDUuCAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79zd-0000000B4m6-1DAd;
	Mon, 30 Mar 2026 10:37:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79zb-0000000B4ls-2vcS
	for ath12k@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rS3q4/ckZwfhIe+L/YtKzkCxLX5gEQTddXgVybWNDR0=; b=By+QQNGrfGlP+Gokp6BxrUy8Q6
	JCdfk3MNiohq9acPknecXpQ66CvdO+sjHwQdc904GInztjnDTgHBlyJXr5tXKPNbFzcWaMxhCZ/x0
	BebQJzJOD1S6NJXAxnoTmamQQDSnI2W7e38TNG+QRpSKo9hNZbjXlKJmD+ByWEYGG+Vj8WeUJBfs3
	Kl6GUluSUXH94scEd2jLhmWmZ+ZNn+miqBZRnd0Lz86Q3r+1uUABhF7wYWwYrxysNXXpFDNdNzdYf
	1TiXK5bA2CAiZN96PhNSmyypuw2eqTHAS2Bpa5tVOh+2dCjXLGx98N/+xhfzDQtAwqxCz3u5XhG8w
	AQ4pZJVA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79zY-0000000DbDB-1JYd
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 10:37:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78Tk94161962
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 10:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rS3q4/ckZwfhIe+L/YtKzkCxLX5gEQTddXgVybWNDR0=; b=lCYLTIFl+FdK0XIG
	ziMxedSFCqONG+x4qug8Avv4zbsIyVFLaCHQ+9QAZZbXyZhpohVrLjO+3ffBzfBT
	uuiLXknUR0XrlDbFDtgQEfjhS49QmnyGDae/1x/72GSTC64pTNwHgdAWBoTCVO0V
	o0wVojDOK/JleyJph9T4o25FCE0m2BUsbQpl9PHiJTnXkHDsYBSH7gz/FUsuHACt
	L45cO85O5whi0Nyyh7yi6PFQHTnjfVUYMKdY4ijmKf73ndatCEJ1E6JaiU3Gk9yH
	QOGVPvFSwVCo/Yq4CEWE3paaZwQUqfhMND5Twg4SoKWKmwNmMXuc9Gt2zPr4YCvr
	njHKaQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mhartwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 10:37:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso83987865ad.2
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867022; x=1775471822; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rS3q4/ckZwfhIe+L/YtKzkCxLX5gEQTddXgVybWNDR0=;
        b=gqaIuyGKJH+EUxhmEGaDSJrRbOnfQ02AMegWbiW00HFl8e8tE7QLm9b0aWmCY8F6Oe
         qf/5PHGfJCTjJRLpDmqbr9uCaS87IWWiP5Q0XjdxYd21Yp1MoEGy/FFP0zGy2bKH7tCc
         /vfg0wW+DkYoFq2DkUFYU/WckH5Of73DR39P8j7jp6w/DhuyPHlwYNsBSrjr5tknLqjC
         xpKkGTyYjIAomhWPaqABsLGGv3K+ZF+zPJGBmZAOQLJwF6bxuKciUY77n4odcrUTULGS
         aeii8d9AXTjhYWWEpe1VWlNrN+KYlRjOgq9a0T8H2nZi8l89OBROXsN547U1A41J1FLs
         IDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867022; x=1775471822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rS3q4/ckZwfhIe+L/YtKzkCxLX5gEQTddXgVybWNDR0=;
        b=LXv4gfsUUSILGd0Tkh+UbaXbb2qsWzDfOnFo+Z4m5kJUbSWgLf9DYMjtwXVAQW7ZfB
         1E+JCE31KGSJmZpNiGPwWugtiP4kYM1LGj2Nji/zG7MsLyQ8RvJ0+pCnS/yW3yeu9OLm
         3Nd3KHqUtEEpa9B0Cb2/kiflvtyfSVrDWf7WkEYGgDHBIHNaqsaSoGRFQ85GHg9vXuRm
         PlV2vkB0mTBMJiBusydFK9ndI/AKsUpIERuDdfoVbGHze19xbRbOwGpmuZOS1pyfKDbO
         jZQH9F6ipEyUyaYm2qYOR2ayN0wcL+3By/RSESvSI/jJYH3qjAdZO/sArzR0pRaUbCcc
         4Jow==
X-Forwarded-Encrypted: i=1; AJvYcCWJYafdXcp1nZrJ/qThw7XaH/EgG294UHNcvXGGVw15J7tlQKX24ZHpX7StR+eBGGKuWuCcjbA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwA+cdyaIaQ9tkd+k+MXlNBI1jtLeq8FvBmPpK/Dacn7SKQjUke
	GuR/sv0v2qhwh1rCftgeDnUaWoLLumgxielTdfU52z0hTDD15s6NzIU5/1VJdDDH1zDnOv3mGSh
	i4+kQx7rX5zxlE91ee1+KkBA5/hWL9UJBkIBFwBSsWHDyvXP50M9wgyrMZQuJz/MU
X-Gm-Gg: ATEYQzx3nJ03VFduB/l6+MqzJ4/6IOGbZ2HbY0/dYxsiTmASh0QVdoJaBea/qM+BuWe
	hz7OXAkCc0UEh+eHDbutLXkd/5dsz68cZqQTBxT4Y22PQGa1PSIlUBmB766NX7NF8sIlWxaQ/bi
	7qrpvYcBLVCe87mcL8TKF/S0YWWkJ7b1G6bQM1bydDaTi7lbtk5Wx7RdRtTR73O/Fpg4dEX9yUT
	3s8a2fNvOk9oFo+e50esIxFMnZHs2jLm9JMCCHmiI+fK3Bl7Lz1mus1+u3EIgKHbqiP8Dw8J1AL
	NdNHPrV93IO+Qt2AIb4XB+Z/yIq/TQjgaJebr5PwLJuOP1aH07hnQcqapr6iNS1jDxS0vWmWWPH
	RmT+0hY7JqDUD14nwA5X9joF6xSnOOIfp5TugVicLtZ4nnsxtwmo=
X-Received: by 2002:a17:902:da4d:b0:2b0:70c8:ccea with SMTP id d9443c01a7336-2b0cdc28c47mr99335095ad.13.1774867022320;
        Mon, 30 Mar 2026 03:37:02 -0700 (PDT)
X-Received: by 2002:a17:902:da4d:b0:2b0:70c8:ccea with SMTP id d9443c01a7336-2b0cdc28c47mr99334605ad.13.1774867021710;
        Mon, 30 Mar 2026 03:37:01 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c5339sm78747725ad.79.2026.03.30.03.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:37:01 -0700 (PDT)
Message-ID: <000abdb5-a8b4-47c4-860b-5666e650b545@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:06:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] firmware: qcom: Add a PAS TEE service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-5-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260327131043.627120-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MyBTYWx0ZWRfX50bS81X7sSGM
 c8siEB83fPYSAlJIQi5xYQv+yAhmmEf7LiPKuvyW2UsSzikvlQwwJ75IIkEBz8MtAOoxD1l8TFp
 0wgJgFJ+fq7VpZhwxnxkh5lvFdRTejhdOXpzFzoHEu/NQ0D2wwGGv/25rrT9igR/itkSO4GSXs6
 8oATg2z9Ii+k5X4+iGYGehYResd2kWOftFxv2KXiDOf89V8F8K7pjAEJ4Qqi6O22s+Kl/Bn46l4
 6pgknmujP6l3O7VJks5mrtVeD0FdD564sQ+xocq5ahoRowaJ1KSx6Mh1bsNJIJY/wlg89ee+pTc
 wSqMSIC3p2WQLFfQDLTxh/BrX37hBntdGWdAPYBl9TjgHlyTCam3hRwNIamBnLS/l3+dKb3ab1c
 BNHXYys3QUtEGJSywnep9kmZQcojsl/08VnTOQHmEInmw6T8Azmw2zP+OyzuK3CJ0/o/lPuJbKH
 b6XmZFKHPbMh3qhFD3A==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca524f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RWzqk8q2zN-G-DdlaHkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: T00RluveBZVwHtFKvj--SMk2IqITCgUV
X-Proofpoint-GUID: T00RluveBZVwHtFKvj--SMk2IqITCgUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_113708_663300_C665E377 
X-CRM114-Status: GOOD (  28.98  )
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



On 3/27/2026 6:40 PM, Sumit Garg wrote:
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
>  drivers/firmware/qcom/Kconfig        |  10 +
>  drivers/firmware/qcom/Makefile       |   1 +
>  drivers/firmware/qcom/qcom_pas_tee.c | 478 +++++++++++++++++++++++++++
>  3 files changed, 489 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>
[...]

> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
> new file mode 100644
> index 000000000000..d63122c34f04
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> @@ -0,0 +1,478 @@
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
> +#define TA_QCOM_PAS_IS_SUPPORTED		1
> +
> +/*
> + * PAS capabilities.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [out] params[1].value.a:	PAS capability flags
> + */
> +#define TA_QCOM_PAS_CAPABILITIES		2
> +
> +/*
> + * PAS image initialization.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [in]  params[1].memref:	Loadable firmware metadata
> + */
> +#define TA_QCOM_PAS_INIT_IMAGE			3
> +
> +/*
> + * PAS memory setup.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [in]  params[0].value.b:	Relocatable firmware size
> + * [in]  params[1].value.a:	32bit LSB relocatable firmware memory address
> + * [in]  params[1].value.b:	32bit MSB relocatable firmware memory address
> + */
> +#define TA_QCOM_PAS_MEM_SETUP			4
> +
> +/*
> + * PAS get resource table.
> + *
> + * [in]     params[0].value.a:	Unique 32bit remote processor identifier
> + * [inout]  params[1].memref:	Resource table config
> + */
> +#define TA_QCOM_PAS_GET_RESOURCE_TABLE		5
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
> +#define TA_QCOM_PAS_AUTH_AND_RESET		6
> +
> +/*
> + * PAS co-processor set suspend/resume state.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + * [in]  params[0].value.b:	Co-processor state identifier
> + */
> +#define TA_QCOM_PAS_SET_REMOTE_STATE		7
> +
> +/*
> + * PAS co-processor shutdown.
> + *
> + * [in]  params[0].value.a:	Unique 32bit remote processor identifier
> + */
> +#define TA_QCOM_PAS_SHUTDOWN			8
> +
> +#define TEE_NUM_PARAMS				4
> +
> +/**
> + * struct qcom_pas_tee_private - PAS service private data
> + * @dev:		PAS service device.
> + * @ctx:		TEE context handler.
> + * @session_id:		PAS TA session identifier.

Nit: Column alignment of comment descriptions.

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
> +		.func = TA_QCOM_PAS_IS_SUPPORTED,
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

I can see that similar error handling pattern for tee_client_invoke_func() is
being done by other clients. But it seems that this error log doesn't really convey
whether we failed before or after entering OPTEE (or some other TEE) for invoking
the service.

Could be better if we print 'ret' when ret < 0. And print 'inv_arg.ret' when
inv_arg.ret != 0. So for example, if the param marshalling fails, or some other
issue is encountered when processing the params in a different back-end TEE
driver, we could know from the logs.

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
> +		.func = TA_QCOM_PAS_INIT_IMAGE,
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
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	mdata_shm = tee_shm_alloc_kernel_buf(data->ctx, size);

Why not move the DEFINE_FREE() above this function so we can use scoped free
here as well for mdata_shm?

struct tee_shm *mdata_shm __free(shm_free) = ...

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

Nit: We can prefix %x with 0x. "err: 0x%x\n."

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
> +		.func = TA_QCOM_PAS_MEM_SETUP,
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

I can see that originally in-case of error, qcom_scm_pas_mem_setup() bubbles
up the return value from qcom_scm_call(). Perhaps we should do the same as well,
return ret here instead of hard-coded '-EINVAL' which overrides any useful
return values returned from the back-end TEE driver.
 
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
> +		.func = TA_QCOM_PAS_GET_RESOURCE_TABLE,
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
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS get RT failed, pas_id: %d, err: %x\n",
> +			ctx->pas_id, inv_arg.ret);
> +		return ERR_PTR(-EINVAL);

Same comment here, we could return ERR_PTR(ret) instead of overriding to
'-EINVAL'.

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

Why not just return rt_shm_va? It already encodes the error in the pointer.

> +		}
> +		memcpy(rt_shm_va, input_rt, input_rt_size);
> +
> +		param[1].u.memref.shm = rt_shm;
> +		ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +		if (ret < 0 || inv_arg.ret != 0) {
> +			dev_err(dev, "PAS get RT failed, pas_id: %d, err: %x\n",
> +				ctx->pas_id, inv_arg.ret);
> +			return ERR_PTR(-EINVAL);

Same comment.

> +		}
> +
> +		if (param[1].u.memref.size) {

Is it possible for param[1].u.memref.size to be 0 after a successful tee_client_invoke_func()?

> +			*output_rt_size = param[1].u.memref.size;
> +			rt_buf = kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);
> +			if (!rt_buf)
> +				return ERR_PTR(-ENOMEM);
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
> +		.func = TA_QCOM_PAS_AUTH_AND_RESET,
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

Can you explain this comment a bit more? Plan is to allow passing a MEM_REF here
which could be lent/shared to TEE via FFA ABI?

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

I'm guessing once all clients have migrated to PAS, plan is to drop this wrapper?

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
> +		.func = TA_QCOM_PAS_SET_REMOTE_STATE,
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

Nit: Why not ret = 0 initialize and always use ret?

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
> +		.func = TA_QCOM_PAS_SHUTDOWN,
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

You could just return 'ret' here. :)

> +}
> +
> +static void qcom_pas_tee_metadata_release(struct device *dev,
> +					  struct qcom_pas_context *ctx)
> +{
> +	struct tee_shm *mdata_shm = ctx->ptr;
> +

Nit: Unnecessary extra line.

> +	tee_shm_free(mdata_shm);
> +}
> +

[...]

> +
> +module_tee_client_driver(optee_pas_tee_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("TEE bus based Qualcomm PAS driver");

Since this is a tee_client driver, isn't it self-explanatary that it's TEE bus based?



