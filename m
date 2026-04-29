Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D030FF8867
	for <ath12k@archiver.kernel.org>; Wed, 29 Apr 2026 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8c+lvAbQ7Ws5viWfaTwa2KBf/Urjd7LzdBWr5hcgv0=; b=oqzRcXEULGhyD/RX1VqrxLy6+A
	dVu8DviG8eSZuiWZ/r1axZYA9JLuB3eiL5ieusE9BljiryXsr8nD/vVF/8xZnmBqTN1adQrLxHm30
	tEGh0iGNDjwVANFwsPj/zPqO1EtYHT5uTfuKDRWf9rY2UBlAg1fQRMwWOM/mDWfBEEHJgUMRw+BX1
	CecwWOK/SNEIj2KuOCGc0Px47KYOcYAWs8IBmuJcbmuxFButkU9hryucSmH3+qoBu8P0vFbnkTynP
	8C1mwd6dIiA/1ZvlHmpzDKF0yUEkXWDm+09bMz42VSHp2nAa+0Zpj5Mj3mMs1zGX2UHr5UbUKylzZ
	EVDiL7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2TW-00000003Ttn-0y0m;
	Wed, 29 Apr 2026 10:49:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2TT-00000003Tt9-33Sl
	for ath12k@lists.infradead.org;
	Wed, 29 Apr 2026 10:49:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWs22889801
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 10:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X8c+lvAbQ7Ws5viWfaTwa2KB
	f/Urjd7LzdBWr5hcgv0=; b=G3wGSxX3Ire0RRtDcR6BU/9RNKWidgUJ6TsSADmw
	xrxp1qHpeYFNjG6+YtyjI+Q9Pa9t2R/DJEc3rHEjvlgNWKX/IG+lU8EG2j8odTTE
	2hbfZMIJ4gn9L/dP/F8DqWz5cIG4bh4qvky4jAjC4tHzYSofbh0NcEh7J/5IJIu7
	2qozmO94T4KI7u7nNz1XHN7YTp2Hwmec+jbFVG6veiJyXD8mEwnJJkVywQxD4szR
	UQCUdXkH7DlouyjM/v3OmTJ1jfcCW9QtrR3c33S1feAbB8F0OU4VUfOU2BuJYiJ6
	FKFWDkhkZnzXZkCVHCIaBSWbW2+ZqExlZ0Xc4CbZ0oZzLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqbhug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 10:48:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2eba42b8dso110069185ad.0
        for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459738; x=1778064538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8c+lvAbQ7Ws5viWfaTwa2KBf/Urjd7LzdBWr5hcgv0=;
        b=I1lpfmM7a/albIi3aytAH0y/0memyJFWY4T1xkCFtwfoWrI4JCW0l6jWlp9nhdicck
         UMR1EOEI0cw5XqYYYEUP59qkrjiqS66r7gBZ7rSsTls4//JIuDUi0lvA5jUYNO8ReNlX
         Bl07bNYpspdCgoyQ3yslWkhbX6IdjpwVfjdS/4A2Mt5jS5/T9+ZT31zb31JckHx4jRDi
         YDMLG0AmPso1Ul1yTu3rA+/z0rXHlsJGUiCH+5EUWB0WC9Pz2B/4k81BNxcDRRBrpokl
         D66x461F8lLE/uRLxa/TY/ogHWtPpQh9WmI2JcvWxvmuCjmzauSCIUtqKWiH9iG5TvFl
         IXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459738; x=1778064538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8c+lvAbQ7Ws5viWfaTwa2KBf/Urjd7LzdBWr5hcgv0=;
        b=P+OpVwQwzPleFaM6pQpn+Y6g0dKYRHGWZTsemBC4FhUPeIDjpDewjQU3PsA8hP6+4H
         Gfw/DQ/+5Qhm9Br05E2kn4ZxXFug/5xlXNJcX9lC8IDQpk0TS50mO1zgZ1sQDm5hVXX4
         VVrjjtP7u1GxzddH0+CMxpgGnvCLD0m2GTEUBy9ObDPJIJPk+cPQnSsUaH5IEliNaIBP
         oJ1PZj7Aoe/rmrIV6nZmrytXWy7N5lNoHWs9WZp/qBpkWZDt1dMabxSKiOyXXDMdidxt
         Eqh5ItgJGElPH2ssiEc4mE/6lqepBTKU2ow9ISCTAP3DIv/9//v9SZtdKmsHO+s+v4P+
         Z3dA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZdxWRsaR0ktciz8pZbrbJ47R9D5+ClTnUipb8IFXExcedkx2ANAYDRT+kPg6RICD+8qFlZiA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yylhuh4KIzICO66tRPzK89nR64ygCP18cVKjy3n2wKq+kzN3FRW
	+xb7yjz1RExuxCU0F1D6rbMtyyhitRrm+5LtkhjB/ndiPZSpFnFcgzgT1FIgWpPUyg7AI6XSzjv
	fPUN0Qnmf/IYS5+Rx8WupWsoRgXKKfkA1XnqRRAPXEFURiREWWR+cfXtjTLSC7yas
X-Gm-Gg: AeBDiev+oDtuB3FGyumHUT/d2mc1oefjBk7Uqkd7JHIDLhwtvbfzufGje8a35mzPdPL
	pBNBg0S/jjXgQBHNsjm4UtjwDKT6aZg9YKSacnGNqTLmWM/ZphGKJ6S37cOt3/VCh2tLsR/cxqB
	BUCaC8X8ic9zxNZ03QVwW/N3k4dtqrQFgZJ3/Wwj3xUWUqh16Trx7diOEVt+7CsTyhmif8Gh/yS
	4d1kdFQHdro/nxndk0Hegp1Myjy+tGGyx7n9OT9r0qdgdCsIiNu7bHyoMdOdS5GUozNQ3QUQ5i7
	KCbhTrUVVw4nOaavWyNB4pNHbGQnubxpd0fSHZR319x9TfiLZEf827wpC0S+1Bn6h/38Xc3DHci
	C/Z+i6gjBO7n06hNvTKy3M+JOGEH6dVVTt/aQjO8dSXDfuepCm9KByw4QTSs=
X-Received: by 2002:a17:902:d2c8:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b97c40028dmr73257255ad.13.1777459738199;
        Wed, 29 Apr 2026 03:48:58 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b97c40028dmr73256475ad.13.1777459737219;
        Wed, 29 Apr 2026 03:48:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98895ca58sm18952115ad.60.2026.04.29.03.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:48:56 -0700 (PDT)
Date: Wed, 29 Apr 2026 16:18:41 +0530
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
Subject: Re: [PATCH v4 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
Message-ID: <20260429104841.l555xd2izoyrqjp4@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-4-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-4-sumit.garg@kernel.org>
X-Proofpoint-GUID: mnyuDP0IkmsBVSc9eSssD7C7O3xy4G4g
X-Proofpoint-ORIG-GUID: mnyuDP0IkmsBVSc9eSssD7C7O3xy4G4g
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1e21b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uE9zhxIwyCxUm-kfAmwA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX1Ye6DHKunCwL
 Vne3BYXBAxwtdrZ+nj06oVPOfXYONoaBErMHeLo4OU17eIxIcvzfR2ea6KfjemV0EdBnTQm5pgj
 Kgl39m8PU3zK4GUqXd/l0RR9gaNhyKhXFTtxWyo7xNx+rCwqBK3Ok6hb9EjEuU+Q32hADEbHt2e
 7cLlhfkTRk/DqnLi8t7rWcKF2K5ZRKMCXWw2AxPvbbenMULgiMWV8dsyxH9tYQQAZWT2TiKkYR7
 LpnCAiS+1DWPQJuszjlAX6UV8Wh9DpOTEu7Y9efSmzOarDkDgFhh10ap4//YfgJAMfgjsPWK8a3
 h96gnAA2AWW7Nx46HwgSb4goc7Z5sHgg3QZ4jrJMtlpsyd6UyDR9uJkvfmXmBIvcP3MfU6MUTwh
 2GO2tu8mMkYY0CFEx5+dPAvCbzZvx8HSWzeXDgkZyDbcJa7SG11IPdBl30lyJQIUDuTM1qaRYCU
 gx2zvCyN0Ib6wr8j6ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_034859_789629_8477F8AC 
X-CRM114-Status: GOOD (  31.57  )
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

On Mon, Apr 27, 2026 at 03:25:51PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig    |   1 +
>  drivers/firmware/qcom/qcom_scm.c | 335 ++++++++++++++-----------------
>  2 files changed, 155 insertions(+), 181 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 8653639d06db..9a12ae2b639d 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -15,6 +15,7 @@ config QCOM_PAS
>  	  TEE bus based PAS service implementation.
>  
>  config QCOM_SCM
> +	select QCOM_PAS
>  	select QCOM_TZMEM
>  	tristate
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 9b06a69d3a6d..d87a962e93da 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -13,6 +13,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/firmware/qcom/qcom_tzmem.h>
>  #include <linux/init.h>
> @@ -33,6 +34,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> +#include "qcom_pas.h"
>  #include "qcom_scm.h"
>  #include "qcom_tzmem.h"
>  
> @@ -479,25 +481,6 @@ void qcom_scm_cpu_power_down(u32 flags)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_cpu_power_down);
>  
> -int qcom_scm_set_remote_state(u32 state, u32 id)
> -{
> -	struct qcom_scm_desc desc = {
> -		.svc = QCOM_SCM_SVC_BOOT,
> -		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
> -		.arginfo = QCOM_SCM_ARGS(2),
> -		.args[0] = state,
> -		.args[1] = id,
> -		.owner = ARM_SMCCC_OWNER_SIP,
> -	};
> -	struct qcom_scm_res res;
> -	int ret;
> -
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> -
> -	return ret ? : res.result[0];
> -}
> -EXPORT_SYMBOL_GPL(qcom_scm_set_remote_state);
> -
>  static int qcom_scm_disable_sdi(void)
>  {
>  	int ret;
> @@ -570,26 +553,12 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>  }
>  
> -/**
> - * devm_qcom_scm_pas_context_alloc() - Allocate peripheral authentication service
> - *				       context for a given peripheral
> - *
> - * PAS context is device-resource managed, so the caller does not need
> - * to worry about freeing the context memory.
> - *
> - * @dev:	  PAS firmware device
> - * @pas_id:	  peripheral authentication service id
> - * @mem_phys:	  Subsystem reserve memory start address
> - * @mem_size:	  Subsystem reserve memory size
> - *
> - * Returns: The new PAS context, or ERR_PTR() on failure.
> - */
>  struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  							     u32 pas_id,
>  							     phys_addr_t mem_phys,
>  							     size_t mem_size)
>  {
> -	struct qcom_scm_pas_context *ctx;
> +	struct qcom_pas_context *ctx;
>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -600,11 +569,12 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  	ctx->mem_phys = mem_phys;
>  	ctx->mem_size = mem_size;
>  
> -	return ctx;
> +	return (struct qcom_scm_pas_context *)ctx;
>  }
>  EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
>  
> -static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
> +static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
> +				     dma_addr_t mdata_phys,
>  				     struct qcom_scm_res *res)
>  {
>  	struct qcom_scm_desc desc = {
> @@ -626,7 +596,7 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
>  
>  	desc.args[1] = mdata_phys;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, res);
> +	ret = qcom_scm_call(dev, &desc, res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -635,7 +605,8 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
>  	return ret;
>  }
>  
> -static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
> +static int qcom_scm_pas_prep_and_init_image(struct device *dev,
> +					    struct qcom_pas_context *ctx,
>  					    const void *metadata, size_t size)
>  {
>  	struct qcom_scm_res res;
> @@ -650,7 +621,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
>  	memcpy(mdata_buf, metadata, size);
>  	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
>  
> -	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
>  	if (ret < 0)
>  		qcom_tzmem_free(mdata_buf);
>  	else
> @@ -659,25 +630,9 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
>  	return ret ? : res.result[0];
>  }
>  
> -/**
> - * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> - *			       state machine for a given peripheral, using the
> - *			       metadata
> - * @pas_id:	peripheral authentication service id
> - * @metadata:	pointer to memory containing ELF header, program header table
> - *		and optional blob of data used for authenticating the metadata
> - *		and the rest of the firmware
> - * @size:	size of the metadata
> - * @ctx:	optional pas context
> - *
> - * Return: 0 on success.
> - *
> - * Upon successful return, the PAS metadata context (@ctx) will be used to
> - * track the metadata allocation, this needs to be released by invoking
> - * qcom_scm_pas_metadata_release() by the caller.
> - */
> -int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_context *ctx)
> +static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
> +				      const void *metadata, size_t size,
> +				      struct qcom_pas_context *ctx)
>  {
>  	struct qcom_scm_res res;
>  	dma_addr_t mdata_phys;
> @@ -685,7 +640,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  	int ret;
>  
>  	if (ctx && ctx->use_tzmem)
> -		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
> +		return qcom_scm_pas_prep_and_init_image(dev, ctx, metadata, size);
>  
>  	/*
>  	 * During the scm call memory protection will be enabled for the meta
> @@ -699,16 +654,15 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  	 * If we pass a buffer that is already part of an SHM Bridge to this
>  	 * call, it will fail.
>  	 */
> -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
> -				       GFP_KERNEL);
> +	mdata_buf = dma_alloc_coherent(dev, size, &mdata_phys, GFP_KERNEL);
>  	if (!mdata_buf)
>  		return -ENOMEM;
>  
>  	memcpy(mdata_buf, metadata, size);
>  
> -	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
>  	if (ret < 0 || !ctx) {
> -		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> +		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
>  	} else if (ctx) {
>  		ctx->ptr = mdata_buf;
>  		ctx->phys = mdata_phys;
> @@ -717,36 +671,35 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  
>  	return ret ? : res.result[0];
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>  
> -/**
> - * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	pas context
> - */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> +			    struct qcom_scm_pas_context *ctx)
>  {
> -	if (!ctx->ptr)
> -		return;
> +	return __qcom_scm_pas_init_image2(__scm->dev, pas_id, metadata, size,
> +					  (struct qcom_pas_context *)ctx);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>  
> +static void __qcom_scm_pas_metadata_release(struct device *dev,
> +					    struct qcom_pas_context *ctx)
> +{
>  	if (ctx->use_tzmem)
>  		qcom_tzmem_free(ctx->ptr);
>  	else
> -		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> +		dma_free_coherent(dev, ctx->size, ctx->ptr, ctx->phys);
>  
>  	ctx->ptr = NULL;
>  }
> +
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> +{
> +	__qcom_scm_pas_metadata_release(__scm->dev,
> +					(struct qcom_pas_context *)ctx);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
>  
> -/**
> - * qcom_scm_pas_mem_setup() - Prepare the memory related to a given peripheral
> - *			      for firmware loading
> - * @pas_id:	peripheral authentication service id
> - * @addr:	start address of memory area to prepare
> - * @size:	size of the memory area to prepare
> - *
> - * Returns 0 on success.
> - */
> -int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> +static int __qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
> +				    phys_addr_t addr, phys_addr_t size)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -768,7 +721,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -776,9 +729,15 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  
>  	return ret ? : res.result[0];
>  }
> +
> +int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> +{
> +	return __qcom_scm_pas_mem_setup(__scm->dev, pas_id, addr, size);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
>  
> -static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
> +static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
> +					  void *input_rt_tzm,
>  					  size_t input_rt_size,
>  					  size_t *output_rt_size)
>  {
> @@ -813,7 +772,7 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
>  	 * with output_rt_tzm buffer with res.result[2] size however, It should not
>  	 * be of unresonable size.
>  	 */
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	if (!ret && res.result[2] > SZ_1G) {
>  		ret = -E2BIG;
>  		goto free_output_rt;
> @@ -830,51 +789,11 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
>  	return ret ? ERR_PTR(ret) : output_rt_tzm;
>  }
>  
> -/**
> - * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> - *				  for a given peripheral.
> - *
> - * Qualcomm remote processor may rely on both static and dynamic resources for
> - * its functionality. Static resources typically refer to memory-mapped addresses
> - * required by the subsystem and are often embedded within the firmware binary
> - * and dynamic resources, such as shared memory in DDR etc., are determined at
> - * runtime during the boot process.
> - *
> - * On Qualcomm Technologies devices, it's possible that static resources are not
> - * embedded in the firmware binary and instead are provided by TrustZone However,
> - * dynamic resources are always expected to come from TrustZone. This indicates
> - * that for Qualcomm devices, all resources (static and dynamic) will be provided
> - * by TrustZone via the SMC call.
> - *
> - * If the remote processor firmware binary does contain static resources, they
> - * should be passed in input_rt. These will be forwarded to TrustZone for
> - * authentication. TrustZone will then append the dynamic resources and return
> - * the complete resource table in output_rt_tzm.
> - *
> - * If the remote processor firmware binary does not include a resource table,
> - * the caller of this function should set input_rt as NULL and input_rt_size
> - * as zero respectively.
> - *
> - * More about documentation on resource table data structures can be found in
> - * include/linux/remoteproc.h
> - *
> - * @ctx:	    PAS context
> - * @pas_id:	    peripheral authentication service id
> - * @input_rt:       resource table buffer which is present in firmware binary
> - * @input_rt_size:  size of the resource table present in firmware binary
> - * @output_rt_size: TrustZone expects caller should pass worst case size for
> - *		    the output_rt_tzm.
> - *
> - * Return:
> - *  On success, returns a pointer to the allocated buffer containing the final
> - *  resource table and output_rt_size will have actual resource table size from
> - *  TrustZone. The caller is responsible for freeing the buffer. On failure,
> - *  returns ERR_PTR(-errno).
> - */
> -struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
> -						  void *input_rt,
> -						  size_t input_rt_size,
> -						  size_t *output_rt_size)
> +static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
> +					   struct qcom_pas_context *ctx,
> +					   void *input_rt,
> +					   size_t input_rt_size,
> +					   size_t *output_rt_size)
>  {
>  	struct resource_table empty_rsc = {};
>  	size_t size = SZ_16K;
> @@ -909,11 +828,12 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  
>  	memcpy(input_rt_tzm, input_rt, input_rt_size);
>  
> -	output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
> +	output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
> +						     input_rt_tzm,
>  						     input_rt_size, &size);
>  	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
>  		/* Try again with the size requested by the TZ */
> -		output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id,
> +		output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
>  							     input_rt_tzm,
>  							     input_rt_size,
>  							     &size);
> @@ -943,16 +863,20 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  
>  	return ret ? ERR_PTR(ret) : tbl_ptr;
>  }
> +
> +struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx,
> +						  void *input_rt,
> +						  size_t input_rt_size,
> +						  size_t *output_rt_size)
> +{
> +	return __qcom_scm_pas_get_rsc_table2(__scm->dev,
> +					     (struct qcom_pas_context *)ctx,
> +					     input_rt, input_rt_size,
> +					     output_rt_size);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
>  
> -/**
> - * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
> - *				   and reset the remote processor
> - * @pas_id:	peripheral authentication service id
> - *
> - * Return 0 on success.
> - */
> -int qcom_scm_pas_auth_and_reset(u32 pas_id)
> +static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -972,7 +896,7 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -980,28 +904,15 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>  
>  	return ret ? : res.result[0];
>  }
> +
> +int qcom_scm_pas_auth_and_reset(u32 pas_id)
> +{
> +	return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>  
> -/**
> - * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> - *					   remote processor
> - *
> - * @ctx:	Context saved during call to qcom_scm_pas_context_init()
> - *
> - * This function performs the necessary steps to prepare a PAS subsystem,
> - * authenticate it using the provided metadata, and initiate a reset sequence.
> - *
> - * It should be used when Linux is in control setting up the IOMMU hardware
> - * for remote subsystem during secure firmware loading processes. The preparation
> - * step sets up a shmbridge over the firmware memory before TrustZone accesses the
> - * firmware memory region for authentication. The authentication step verifies
> - * the integrity and authenticity of the firmware or configuration using secure
> - * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> - * sane state.
> - *
> - * Return: 0 on success, negative errno on failure.
> - */
> -int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
> +static int __qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
> +						 struct qcom_pas_context *ctx)
>  {
>  	u64 handle;
>  	int ret;
> @@ -1012,7 +923,7 @@ int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
>  	 * memory region and then invokes a call to TrustZone to authenticate.
>  	 */
>  	if (!ctx->use_tzmem)
> -		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
>  
>  	/*
>  	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
> @@ -1022,20 +933,45 @@ int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
>  	if (ret)
>  		return ret;
>  
> -	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
>  	qcom_tzmem_shm_bridge_delete(handle);
>  
>  	return ret;
>  }
> +
> +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
> +{
> +	return __qcom_scm_pas_prepare_and_auth_reset(__scm->dev,
> +						     (struct qcom_pas_context *)ctx);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
>  
> -/**
> - * qcom_scm_pas_shutdown() - Shut down the remote processor
> - * @pas_id:	peripheral authentication service id
> - *
> - * Returns 0 on success.
> - */
> -int qcom_scm_pas_shutdown(u32 pas_id)
> +static int __qcom_scm_pas_set_remote_state(struct device *dev, u32 state,
> +					   u32 pas_id)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_BOOT,
> +		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
> +		.arginfo = QCOM_SCM_ARGS(2),
> +		.args[0] = state,
> +		.args[1] = pas_id,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_call(dev, &desc, &res);
> +
> +	return ret ? : res.result[0];
> +}
> +
> +int qcom_scm_set_remote_state(u32 state, u32 id)

s/id/pas_id

> +{
> +	return __qcom_scm_pas_set_remote_state(__scm->dev, state, id);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_set_remote_state);
> +
> +static int __qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -1055,7 +991,7 @@ int qcom_scm_pas_shutdown(u32 pas_id)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -1063,16 +999,14 @@ int qcom_scm_pas_shutdown(u32 pas_id)
>  
>  	return ret ? : res.result[0];
>  }
> +
> +int qcom_scm_pas_shutdown(u32 pas_id)
> +{
> +	return __qcom_scm_pas_shutdown(__scm->dev, pas_id);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
>  
> -/**
> - * qcom_scm_pas_supported() - Check if the peripheral authentication service is
> - *			      available for the given peripherial
> - * @pas_id:	peripheral authentication service id
> - *
> - * Returns true if PAS is supported for this peripheral, otherwise false.
> - */
> -bool qcom_scm_pas_supported(u32 pas_id)
> +static bool __qcom_scm_pas_supported(struct device *dev, u32 pas_id)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -1084,16 +1018,49 @@ bool qcom_scm_pas_supported(u32 pas_id)
>  	};
>  	struct qcom_scm_res res;
>  
> -	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +	if (!__qcom_scm_is_call_available(dev, QCOM_SCM_SVC_PIL,
>  					  QCOM_SCM_PIL_PAS_IS_SUPPORTED))
>  		return false;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  
>  	return ret ? false : !!res.result[0];
>  }
> +
> +bool qcom_scm_pas_supported(u32 pas_id)
> +{
> +	return __qcom_scm_pas_supported(__scm->dev, pas_id);
> +}
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_supported);
>  
> +static struct qcom_pas_ops qcom_pas_ops_scm = {
> +	.drv_name		= "qcom_scm",
> +	.supported		= __qcom_scm_pas_supported,
> +	.init_image		= __qcom_scm_pas_init_image2,
> +	.mem_setup		= __qcom_scm_pas_mem_setup,
> +	.get_rsc_table		= __qcom_scm_pas_get_rsc_table2,
> +	.auth_and_reset		= __qcom_scm_pas_auth_and_reset,
> +	.prepare_and_auth_reset	= __qcom_scm_pas_prepare_and_auth_reset,
> +	.set_remote_state	= __qcom_scm_pas_set_remote_state,
> +	.shutdown		= __qcom_scm_pas_shutdown,
> +	.metadata_release	= __qcom_scm_pas_metadata_release,
> +};
> +
> +/**
> + * qcom_scm_is_pas_available() - Check if the peripheral authentication service
> + *				 is available via SCM or not
> + *
> + * Returns true if PAS is available, otherwise false.
> + */
> +static bool qcom_scm_is_pas_available(void)
> +{
> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					  QCOM_SCM_PIL_PAS_AUTH_AND_RESET))

QCOM_SCM_PIL_PAS_IS_SUPPORTED ?


> +		return false;
> +
> +	return true;
> +}
> +
>  static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
>  {
>  	struct qcom_scm_desc desc = {
> @@ -2836,6 +2803,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  
>  	__get_convention();
>  
> +	if (qcom_scm_is_pas_available()) {

Use qcom_scm_pas_supported() and remove qcom_scm_is_pas_available()..

> +		qcom_pas_ops_scm.dev = scm->dev;
> +		qcom_pas_ops_register(&qcom_pas_ops_scm);
> +	}
> +
>  	/*
>  	 * If "download mode" is requested, from this point on warmboot
>  	 * will cause the boot stages to enter download mode, unless
> @@ -2875,6 +2847,7 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
>  {
>  	/* Clean shutdown, disable download mode to allow normal restart */
>  	qcom_scm_set_download_mode(QCOM_DLOAD_NODUMP);
> +	qcom_pas_ops_unregister();
>  }
>  
>  static const struct of_device_id qcom_scm_dt_match[] = {
> -- 
> 2.51.0
> 

With above changes,

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> 

-- 
-Mukesh Ojha

