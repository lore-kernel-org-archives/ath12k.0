Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373A5FEA807
	for <ath12k@archiver.kernel.org>; Wed, 25 Mar 2026 04:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHUp7/16YUMBtKGES+yYYqc20LzNJsKIcI6vCitDSoc=; b=d8nE87a5KbxKcUwTgMD1XL1osJ
	NGzzgfwKIpEx05ZUWNzR3TFBr5Z9b1+XF6FVldw6AciBLd+NAUQVF3A7Gb8p66rgr5cj8j8fCoj0J
	JPUHZqMoSNzcPd6i/9E7bFPrDXUYMwnhp6xfn8ZaxuCAtQ7r5oG4jQkw0J2Rw+a5rzg+6S+44IRvL
	jFw7mr0Y0d7qfaRuXjDxPyEU/e4P2wdm4P7E/l74vBAP8mUhbDJOP/e3ad26XiwY5Zflik6O2c0yB
	/2++YVAh01dK6Aazgei90FsDohYNuG1YGBFZckacKnZEmKpGGr30IzO4JTceSvOHecnF395AooI2g
	CttigErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fwp-00000002gYR-43Qx;
	Wed, 25 Mar 2026 04:34:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fwn-00000002gY4-3V6v
	for ath12k@lists.infradead.org;
	Wed, 25 Mar 2026 04:34:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJOaWP1862769
	for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 04:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EHUp7/16YUMBtKGES+yYYqc2
	0LzNJsKIcI6vCitDSoc=; b=UxXtUFqX1/6g2nxsMa/K3D44muLA4QP/qfif7ikK
	0PfGqXPH2DkXPdFnv2JwH9dBZrMi+CJqXZ0Fx5kAQPk9xIyNvrptcTe2T39UgZRD
	PqQ9HCtVYJnygYaIfjzbz/TXWLO5j1HuJqsSRgROj20zluZNW1VYdXF495ZZnzmo
	kQW5B/W7yOkgLxG3oM1WyUL0pFOI4P4e6nmddPEUOF8OeK5190ahq1G2S+KRAZLx
	FjtOUwxDpHveFbF9HNRmUu11f7KytW5gnm2N/GHuedbMnGAxOs/bt4U7Z2UpMdLK
	7xeadyqyfvYZQ6/nJzG5hnrxVaUQfMPYQJzdZGp34rGkDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rasdta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 04:34:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b323c43fdso125684401cf.2
        for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 21:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774413264; x=1775018064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHUp7/16YUMBtKGES+yYYqc20LzNJsKIcI6vCitDSoc=;
        b=dMntXk2aFEjCA7r1hY+qZnlQJOxYX8e/KBsAQzWB7NRM5u4uPvYlNEJAwRt+JJQ30C
         h9UhoFk+zz+3V+BzIR9SG0LQ82rKPwNBQIvcKpp6+6aaGYhIOYwdVwNsQgxMwCFcISeC
         D7hocfq1ZnnRWHSUTHhIWGtjAFxW4VnSfG1SfTPjrJI6GQdSZo7I7TVFGreTV3qMi525
         kBgd+DJpOiUBs0S4P+eFsNk7pGr8VIG+T/yoNS7WT22wq7FV19VkDznQoFH5d0lLSSCl
         2xCNbVa7QzZmqynfxiLLkZhTBaAlQ9KWeKHgy5HZd5teJAUhEQZrY2NmiEXUWlqiIZby
         WmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774413264; x=1775018064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHUp7/16YUMBtKGES+yYYqc20LzNJsKIcI6vCitDSoc=;
        b=YKRoPTWsck+AjdRHliZWlquBIQQAqtI6i2zVQ9sidokve08iDgnVnLsoiAB24RnTuQ
         PfCCDinyOczqzV6SaT39Tj1/7KODMwUgcLfW/oma/WNcF0duzYjkk0Ds3Qt46kacth+m
         a/a3f1Tvv+X0lTU4CIISoYi5FV9seobf9v4xNTR2moKgXSpbQ5/MFSmhkKKtw5M9O+fl
         1+B+Wvsu7VSYo6ki5nrnNNC7Sxmar8ooyHZjWCW1+MlaVQzSRkwswNP+AcLOkyMW1sjs
         24aUX5qBuvdh+2J4fLUs8RJKHSMpwvPihhR5Cic688QpXoJHZfKJ56+Iy9NAE7kCZUem
         BUhw==
X-Forwarded-Encrypted: i=1; AJvYcCWsNOrQgiFGKAJHZoV3QM1AIEYLo3T/EaWMGes00BtpDKRW1phfWKjN4Qazo3mNnh8dcA82iZE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj7zOzND9sRId5z1qnRlSSlDy1wEw0XHLCkS36wfzJjFhL7dJW
	qo7fnDGsmd1Sn/UEuiEdBSGpQhBNiqLM8++Y+duBRI77+nPbM/19zUxAoUmVviO0eNPbVX0HQa5
	GEDixoQOsIPVK6if/JHCl+BNdad7KqcA0JexAUCozPOKQ5JeKK1Tv/AJVfUt6utiU
X-Gm-Gg: ATEYQzxE8f0R28P9t1PcgwEQgFVYev92aVu4EH57tK7SjBX8GzZQV+vy4YZ6JZhwFaq
	fPDCfl45PFLU9XI3GMX8qK3uCbzyP0pddvpVPHqiUz1FgXM1soTP9ikHZQAp71Ca1WkPVusJ5X/
	dM16KKG2MPtVyPRS3GR1g5qWhAeT4OpVM5ang8EYW3dCHljEfIG4Jb3shuVjyu2I+2HtNXGZsOg
	/c7mXX+Y0QQQO6u8GsGHYrMqJt48Csk7O2oKb38O0XTO74wDXt5viN4selK/xekQgz+AvQFTA2O
	e09GffaCUN8fVaf3ZU7smyIsF7Xevc7QMv9SpEu9qKOLyBBbHSqoAh86iAywqW+QyvcSIKbBMfE
	qdhbojzBT09Laew5UQgqZj7HVsvJycB9pClv+hIOoTSuK8pE6XpZlVUrLe0paCMJOm1JfLbIi3I
	p0tVjBfnaIUg5z3XaqtY1PKAKEJ1vzRjHu/Cc=
X-Received: by 2002:a05:622a:4ce:b0:509:1987:7626 with SMTP id d75a77b69052e-50b80ed53b8mr28888361cf.68.1774413263888;
        Tue, 24 Mar 2026 21:34:23 -0700 (PDT)
X-Received: by 2002:a05:622a:4ce:b0:509:1987:7626 with SMTP id d75a77b69052e-50b80ed53b8mr28888091cf.68.1774413263409;
        Tue, 24 Mar 2026 21:34:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm3648167e87.41.2026.03.24.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:34:21 -0700 (PDT)
Date: Wed, 25 Mar 2026 06:34:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 10/14] drm/msm: Switch to generic PAS TZ APIs
Message-ID: <v4ffww2r4ljqqbmvsc5jcr4ztqjbpfb42xryjeuz4abqiwup3a@2gfeelhjzzz4>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-11-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306105027.290375-11-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c365d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kPJGyq6PTXsXdZOMel8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: DJftU_bhZV2EjdKwzr2dGLUBMfrfyczQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyOCBTYWx0ZWRfX0gT5nF1CE2a1
 ciCtOE7ViG+lq1gVYG3UsNqGr4JOz2p4snxbobD41yjq6Ju4d1h7w2E3cL3MJBOUH1xz1foL9CA
 0NAiMIlx6avSwm8gwwr19X4qBb2st8kG7C6MfDEMEp3gVnw8v+b3UTbCa3YwngOfvEVOX8kLxsg
 F5FWjq+Eadzj6MhHiWDYo3FlC+5kC72jLDkEh4SHDtM7C97UqaMMfTVnaR19n+wHbRA5uWoRuYz
 HRT2RzAXC28MvnGxT3/VVlTPfP/64Bh9O+QLQSeTam2meN7hd4U7CKrPMB85fBVmqLF7A284Fmg
 ipvaStV+Oxu0gdq65dD1McWq1UgS+/8i7+j3Q4nOeWV8RbDfndW+SeAH71VMxKp3EG7/naZmRGC
 GbH5FtX7TJSSMlgOXlQeuNgr7X8y0xm5gaTX/GQlqDQ6TCO3nMrRFNhln9ztJBIgK5OWsvX42zK
 zENL8aUuodAQJXEZIIg==
X-Proofpoint-GUID: DJftU_bhZV2EjdKwzr2dGLUBMfrfyczQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_213425_991328_FD5271F1 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, Mar 06, 2026 at 04:20:23PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index ef9fd6171af7..3283852f9a14 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -5,7 +5,7 @@
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>

Missing `select QCOM_PAS`.


>  #include <linux/pm_opp.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/slab.h>
> @@ -653,7 +653,7 @@ static int a5xx_zap_shader_resume(struct msm_gpu *gpu)
>  	if (adreno_is_a506(adreno_gpu))
>  		return 0;
>  
> -	ret = qcom_scm_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
> +	ret = qcom_pas_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
>  	if (ret)
>  		DRM_ERROR("%s: zap-shader resume failed: %d\n",
>  			gpu->name, ret);

-- 
With best wishes
Dmitry

