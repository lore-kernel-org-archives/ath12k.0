Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85C0FF8867
	for <ath12k@archiver.kernel.org>; Wed, 29 Apr 2026 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=; b=wZLLB182zroBCY+opbxKRhjFXk
	vTYGwT6ga8eyVV15NxhqUZUsh6qhlF/+tsYLPyroAuol3tANcMHRwafgDDZQztrVHmW6zNsNMArdc
	JGToZ+h1E87A5RfLbE+q/xmqdrrUgYqNVYZnJCPY8bxRJ9tRuOm+pJuBAmmeDJj27Ellkjj7z8awF
	MpEtBLK9PqPtjqmIOUQxVVdpz25Z1g5cgSqJ4bi+WUR2u6GSUl0sVIkxAH7spCYpG6vhpoCO1f7Jx
	plenfn9mi1uayoBjQ9fa5dv4kuKI9oefIj+8xQMCRqVQnkM/y2SK9svZl4ccVyDGjwOohQbAozktZ
	zTp4s7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI51Y-00000003g2C-2MBl;
	Wed, 29 Apr 2026 13:32:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI51W-00000003g1s-1fhg
	for ath12k@lists.infradead.org;
	Wed, 29 Apr 2026 13:32:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q6gi1721218
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 13:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zlXmXqOMWysl75wyJsPWf9ub
	9kxU1RPWgNiLMjMjO54=; b=b4ShSk6mKXAOrKXOdRb8rgeM9x0E3AOsUVpGffLX
	YHTR3NG/VHJbPyYcC95HQFsUhNe0VmjCUK0JBtUkd5xLFcFUvZngpyRLOUulQDSn
	nhS0ymk5Q/TAqTVAiCkTu/K2KoGMmZd4ITeT38pEf4r1FLCOVVHy8E6SudEJgvCz
	sI9DUmIPcJBOLQH36FG8SrtbCgHiNJttNS8RBr4nrKjz79AgT6VAzVj2EmgqUN5c
	AYY8mOcO8yx/QLoMEJWhB7hiq7WTX1D0YnsBoA1Ov1EpE1a3KvY9F8ZZNhTwA9ez
	4ag4G9vhGXxwOxTZimD4kr4NPA+7utKXEk+8SArbJOKdPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7327eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 13:32:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2eba42b8dso112355385ad.0
        for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469537; x=1778074337; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=;
        b=FBY3DcRAJ2xHw26dwQXtBYbqvA516FPKFx0xuBda7ThL91JWZ9EGGC/Ef+ByZhNOsX
         rfhRy/suqkK8oUHSX02AxpIveBF7zgPwYkHQL6CJo2Zxuaq1qj2ArID8WIcRsOeFTUL1
         jmp5BwWJWjGqG2WU8JtSX1usfHi1s7ihYPb4H8s7SFMM2VD06rdmJ6bBYOcWNzqa0clp
         hhNZqQTSlRlfCdf8P4rqTjN6TU4Owz4VvBll3fJfzf5FVzAvUWK/naHFFKGSRIh3A87p
         2wzgcREhpOeSPNJIwUkiQ3H8lpgisAT3q7hRu2LzeUwY1mtTh4nWwVL+90zM/GLlGB5e
         ArwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469537; x=1778074337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=;
        b=Chu3n8S3rf/QYMdaznogyGEbIgzWPk5rkIeUI/EYUNIWHbNjdM3T7cbpb92W7hcLXw
         6WbFiq/5X4uSyh1Dnrt3d1iEEOdsw9JOVo2OUgskS+bvgTeBRNrNbbR1adypYbwjQZH7
         uG6vJIgUoWGvO7ZgdbG3xob5DNiPUKTEUWLJlt45vf3DljAMRGD3lKasYOAw/xKkYb5U
         1ytBM7coT545oBenGXnTM0GyOUmUL02kZmSSb4X6yjrS4zng+AshTkU6e+8TxoZdAEGq
         UCFAeet3PxFj+QVmxRN4gPj/wYuDsZPIllssh34J0AjW/sNKJ2wA9DIHMqbX/g0cHcR6
         FMEg==
X-Forwarded-Encrypted: i=1; AFNElJ9QZGo6UxSzAl6TbSLHnBaUwdg5tOJW7MWyfWTdeGL8EbZ61bZUDTTZaLu5wMrh/F1PV9LIroU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFukP+cgOjBXUf2KLcfbKNUfUAA4s2cbdfH+mV4uxEFVIhFv3T
	2YN7assb7tDowRcgJRRJMH53WQPpTbZ57e8CUfJF2o2jXmWWR9xPov3t3Uax6jRocPd/Qb4q7cg
	HP2J9qmoLLcWbyKuzR0Ywcw8RsGVJxmqE6eNCnKcunDyg/psOhOwn9WstBN+6dYl3igmlvoN8
X-Gm-Gg: AeBDietBYjZmzDSg7Fp6Wx/d56ntCsZhRr9JQK7Y2acd3DOejO2CRXYgg3w1iVoVTim
	8XSjfBeClOe628THxJl7Jfp4lnODv1rB7D21wkLfuPJtmJsPM9Wt5ZPFNhJX4KxL+wNT3/Iv693
	GpSzO2O7QY1giC8CIZqMWxz/Q3mMCyRs3xE0NhN35NTCW450DwMq/aZIhf8Q5OWhGgD5ZFRkfPd
	OpGjPVzoIWfPFhp4KU5lvFb5Sl8cucPDOUZ/P1/LTyVSCYJOzFoTNW/ijohyqit8lnItpGfhYQI
	LhOQgAToi1wytDX75TkO+bQQq0WY/cG4VbJbSoZZ4oxAtMG49cHRjg8Nxi4uOGmqn/f6xziRs6Z
	gcyESjgweaFS44gxDmGSoz+FreQMDKev8blkLYV9v6EgwDFY4nnaA3iuKTLw=
X-Received: by 2002:a17:903:2283:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2b986ca5cd1mr44795275ad.30.1777469536327;
        Wed, 29 Apr 2026 06:32:16 -0700 (PDT)
X-Received: by 2002:a17:903:2283:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2b986ca5cd1mr44794745ad.30.1777469535665;
        Wed, 29 Apr 2026 06:32:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f0b7sm25818105ad.40.2026.04.29.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:32:13 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:01:57 +0530
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/15] remoteproc: qcom_q6v5_mss: Switch to generic
 PAS TZ APIs
Message-ID: <20260429133157.lopr6n5vaik36466@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-7-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-7-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f20861 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UXi9AHVq_sPz40Hf2JYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNyBTYWx0ZWRfX4X1hQzve/Nrw
 oRwvKtpsW5FZ+hTuY5VP3mXTvhTm3wGBpIexSvUo+nQOg6yuSy8tNljA8zhIE2rKu7VyqKs75XX
 GQ92DrHJfjXq+qtqvwWcqNcQyx6Zgx0XjlAX7PjZHsBQVOj8y/pLs4dHsXnMUkLGXQpuCtoKvZ4
 cdm5Llq9XPCZN9PkaLbyCLTqxLj1Y6JPEVn/fRydMNz8X/KHDDQCC8svbcDQP3LWeEiOWP6eq0c
 wmtaoIlj6b/8bKqm56xQtxqAEfnw54B1t2jobKAhN6M1PPIQDPvoZF8RRo8BdAjcjKbkaH2CO0y
 gdoVhxMaMpsWTRGeWBZqNXF5HeGL+oQJ2GVRkm/IEkPxXgpp2NmPQ7Wb0NIAbKv8kn9kQBVoYhd
 /jN62tozdwjrIsFPkFMojW/ulpjmwmXBNUabNBMdP07gFX9MDAisuSyfdNA8VlmK7WtEMGIqJsc
 yerWvvHYaVKBBzqB1bg==
X-Proofpoint-GUID: FgiJ6Ki7EV2ltlOAPUvOayiXIkcoYO1y
X-Proofpoint-ORIG-GUID: FgiJ6Ki7EV2ltlOAPUvOayiXIkcoYO1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_063218_442997_CD695FD3 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Apr 27, 2026 at 03:25:54PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_mss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ae78f5c7c1b6..96888007faa8 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -34,6 +34,7 @@
>  #include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
>  
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>

same here., whether it is needed now ?

>  
>  #define MPSS_CRASH_REASON_SMEM		421
> @@ -1480,7 +1481,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
>  
>  	if (qproc->need_pas_mem_setup) {
> -		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
> +		ret = qcom_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
>  		if (ret) {
>  			dev_err(qproc->dev,
>  				"setting up mpss memory failed: %d\n", ret);
> @@ -2077,7 +2078,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> -	if (desc->need_mem_protection && !qcom_scm_is_available())
> +	if (desc->need_mem_protection && !qcom_pas_is_available())
>  		return -EPROBE_DEFER;
>  
>  	mba_image = desc->hexagon_mba_image;

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

