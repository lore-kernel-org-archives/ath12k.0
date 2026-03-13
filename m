Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4605106FD9D
	for <ath12k@archiver.kernel.org>; Fri, 13 Mar 2026 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ex6jsOj1ougWfFQS1k55JiqNNqs0EW76WM/oW0QnhM=; b=QHQMaLMJR4TpBdf4nCHtSr+pzG
	o9O4ATxKS9gDU7VadHfTJlpfLecNzWEliIDpcjh28AjDYEZZOm47IkZ2lUXHESP1H9PeRlujMv6p/
	LdP4M3ptRF0hz7yd1QV4blIFlEn1rfuLpo9dC8uTAkoCqueIFtuBp2eUTh0r60T+aaG59UY+wqL47
	OAcdNMObRkK5iKU/juRNSoLVedmDAWr+BBc6QMOYET3AwABD4HsI2jzllbnsLTPDKPEfbg6UTFN03
	JorGgY2LHZfxiCGWOcr6KHrWdyMM42ZDGxZBjTDou019A8FpPY+EyyGrWk8eSHQcKh84cEaHpSZiK
	0GIgSskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xNm-0000000H94O-2ifr;
	Fri, 13 Mar 2026 07:56:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xNi-0000000H91v-0S6O
	for ath12k@lists.infradead.org;
	Fri, 13 Mar 2026 07:56:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tnob1015133
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 07:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Ex6jsOj1ougWfFQS1k55Jiq
	NNqs0EW76WM/oW0QnhM=; b=UbFAZ0/fHJNYzij+2GZCNOA0AxFdNAhfACnO6Rgd
	rtfT7z6bpDv0Xz6XuFjsnvzD9xoMoKvxX1XgHOFK1C6dDeG06JVy+kLMTBFhuZlM
	mak9AyPHgpSRcSHBgAFmYK789PhgH5yEfOyoGIgG355CrK6ncQ1Xl99Av9Xu1Dlu
	eav0OediPoBbZhiory+TVkviw9UNgJXrBMONHu1xnpPkfvUoRwsYChb+iUrCUFkz
	Gj8Zidu/IIq/dh2WeG8RJUcgu72oYyQVHZ/KzSa40hyy1COaZAot+mSnuufIR4vB
	d7JxRL19bF9MMKQPv6GTpX5DuuhH1cW4keHHYO5DpzNDfA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdmfhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 07:56:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae405e95f5so21860895ad.2
        for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 00:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388584; x=1773993384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ex6jsOj1ougWfFQS1k55JiqNNqs0EW76WM/oW0QnhM=;
        b=ibse8b6F0zz0T1vTWe7D6PxI/DhyfygUIfD3EPwYbpff2Qjwq4FnAbcGqezUZe68LG
         9jJk2voAN9Iu2/iCbJuoh9C/XCL1/dE80FjV2nvujYrN4wB2xIGDYZnGVetJTP+60d5O
         g7c5K1EHv94es5iWso2/py6Asr52WRoSH4VAdrfHKAYoEz0ZLWMiBQhlItsjyOEni7o+
         htHPJGD8zqn/nk4SlnE91PYSjboxC8Ny6L2TBaTDM9xuKLrPJLKhQsD83fU7tNnwlvKE
         wu2biXsYqgojsVcW+PswU4mXL4QE2nEcn1x2hl7G38EqxEmuLnZqhfRZ1xfjIBxK48nc
         jvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388584; x=1773993384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ex6jsOj1ougWfFQS1k55JiqNNqs0EW76WM/oW0QnhM=;
        b=LS06ZYsyxx8PunTMGXRfvKD+V/5/BcYWRz5X8/ffHNqSYvJLOZgrBSLHSNq2TEAEZy
         4IU28UTmXRnMNIBSnfoDKU91MfHljV+LdwRCfSMWcBjUy62FdS3NTcgLF310kHfO+zRS
         tkaSPoaEcyHVMBdCU5Xd9uUaq8Tn4+Sm+2E9tiw6C1oTi77Je7x1J+Z9yMee7qyuj/XQ
         rlH3+I6mKvo/jfppolypRcEhIJPaSyL9eGBLdLFHoEoLcNiPiE5LH/HOy+ntiZEZyQ32
         FeHOBuPe5AADV4CwH6KqnQo6/h3MBgWvgpZDsZu+qK9MGKV4q5cvk1ztNMNTCOxc1bv/
         J8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCW42owSTgbZeBK04A9unjz/v9NDd8OzjgxaymJiw23ttQ8zCuUZqLbt2S2PsTsfBdKAMme7AvE=@lists.infradead.org
X-Gm-Message-State: AOJu0YycrjYCfQ4MBhKo8qEp9Jh61eZbKE/668JUw0Mw0zmNjVk+VUpj
	pn05lVx3Rrymb1MtFHEFLsETby6omMXEI19dfEib5A9oGio8kJkA+HZn2VTudz2EvbEMKT8F9iT
	94bRUNftenPogkNJyToHSBlhq/2LGqflmj0tWiqf5216cCaet4RPXHR7xLWUyF4PS
X-Gm-Gg: ATEYQzxJO1r0Op44wp4MgRQr0i3aWAGD53vnz79GHyf07gPqEbTZZOIXGllrQ9hHqgd
	/g2icXb2SFdXcW0bd5VVR4wUz6qgLjV/y+hojaJfYsLR9XDB4jG0EFf87E0A9hmvQxkXuTP5j6f
	UrASev+PbAKcoIKWaqCSLfHGmPVZUh+d4WCB0TyuDH6CvsrorbNn5aPM0HeY31Aj2tzRHeAWeOj
	bj/EPIQTYD259OD2rKyu9uxoePpZVmjF/Q9elKifMxdB9QT/Np2+lgUIeys9EorbQls12Yo8fN1
	SzaOIn/VkBOUbS/NLblwos0CDgHKP1UowOpvcrL4IwvzSRBPFiQLhs0nrdk8RHUYZ4GFxxl0q05
	d7YHN/fTezvCkkva0xjbMReEO4+7S+89SS4ZhstvzxAWtNoae
X-Received: by 2002:a17:902:fc48:b0:2ae:cda1:1d2e with SMTP id d9443c01a7336-2aecda12187mr18621365ad.36.1773388583632;
        Fri, 13 Mar 2026 00:56:23 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2ae:cda1:1d2e with SMTP id d9443c01a7336-2aecda12187mr18620785ad.36.1773388582872;
        Fri, 13 Mar 2026 00:56:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7edcd1sm13772625ad.49.2026.03.13.00.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:56:22 -0700 (PDT)
Date: Fri, 13 Mar 2026 13:26:07 +0530
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
Subject: Re: [PATCH v2 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
Message-ID: <20260313075607.2mw3dzaf274xxe2j@hu-mojha-hyd.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-4-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312062756.694390-4-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfX/1b8kKcz1Nr9
 khUnafS4DNiS3Hl50FAL/WZ6/rzoIyUleTiWD0GV+yErI9CnC+TPALhSbbLHv3orNevToVYC8KV
 B0PgO4owtu1goZ0W3Ex0PlW758seUEeIFOo1Q1FQz4j6cjgm10Msw0ABorF4s35+qt48PfTu9AA
 CkiV+6q/GKIUaRijA6I31a6vb7W1z8AhS9swowg9h5vHzADMjI8KsS1FdyURNu9PVfnU0QWK1Wk
 fpUvRepnCMIueIRKCcUfT90xetpmhCHdSz8VSyxqioq5PtJfYZcF/ZdBV6JVu5ivpqYQKU3bNrz
 tdgTbHE/zB4qM4WNVMBqJWjCFGW8G53wrPpe8HRgL5sI5TysfW01NTMs3NH6Z5kptlWHmTB5BE6
 6jgqycaepEmPi8w0Pg4B/sDI+jUK9/n9cDPtcMYQspgukj/VBgNXuw3Yhxeg0kEorPPB4oTnIJI
 bnDrAkB5lTMVWVYh3Bg==
X-Proofpoint-GUID: GSWfFkGauMt45IZSzYNQzJKwzBJ-hQhY
X-Proofpoint-ORIG-GUID: GSWfFkGauMt45IZSzYNQzJKwzBJ-hQhY
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3c329 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3xKtCg36HsUuca1E11oA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_005626_287231_4A03B361 
X-CRM114-Status: GOOD (  30.91  )
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

On Thu, Mar 12, 2026 at 11:57:44AM +0530, Sumit Garg wrote:
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
>  drivers/firmware/qcom/qcom_scm.c | 336 ++++++++++++++-----------------
>  2 files changed, 156 insertions(+), 181 deletions(-)
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
> index 8fbc96693a55..2d7937ae7c8f 100644
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
> @@ -480,25 +482,6 @@ void qcom_scm_cpu_power_down(u32 flags)
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
> @@ -571,26 +554,12 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
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

Why this change..

>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -601,11 +570,12 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  	ctx->mem_phys = mem_phys;
>  	ctx->mem_size = mem_size;
>  
> -	return ctx;
> +	return (struct qcom_scm_pas_context *)ctx;

and this change as well ?

>  }
>  EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
>  
> -static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
> +static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
> +				     dma_addr_t mdata_phys,
>  				     struct qcom_scm_res *res)
>  {
>  	struct qcom_scm_desc desc = {
> @@ -627,7 +597,7 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
>  
>  	desc.args[1] = mdata_phys;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, res);
> +	ret = qcom_scm_call(dev, &desc, res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -636,7 +606,8 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
>  	return ret;
>  }
>  
> -static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
> +static int qcom_scm_pas_prep_and_init_image(struct device *dev,
> +					    struct qcom_pas_context *ctx,
>  					    const void *metadata, size_t size)
>  {
>  	struct qcom_scm_res res;
> @@ -651,7 +622,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
>  	memcpy(mdata_buf, metadata, size);
>  	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
>  
> -	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
>  	if (ret < 0)
>  		qcom_tzmem_free(mdata_buf);
>  	else
> @@ -660,25 +631,9 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
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

Looks like alignment got wrong..

>  {
>  	struct qcom_scm_res res;
>  	dma_addr_t mdata_phys;
> @@ -686,7 +641,8 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  	int ret;
>  
>  	if (ctx && ctx->use_tzmem)
> -		return qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
> +		return qcom_scm_pas_prep_and_init_image(dev, ctx, metadata,
> +							size);
 
unwrap this..

>  
>  	/*
>  	 * During the scm call memory protection will be enabled for the meta
> @@ -700,16 +656,15 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
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
> @@ -718,36 +673,35 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
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
> @@ -769,7 +723,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -777,9 +731,15 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
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
> @@ -814,7 +774,7 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
>  	 * with output_rt_tzm buffer with res.result[2] size however, It should not
>  	 * be of unresonable size.
>  	 */
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	if (!ret && res.result[2] > SZ_1G) {
>  		ret = -E2BIG;
>  		goto free_output_rt;
> @@ -831,51 +791,11 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
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
> @@ -910,11 +830,12 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
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
> @@ -945,16 +866,20 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
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

Instead of using integar, we could use addition of more '_' to reflect
inner level functions.. 

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
> @@ -974,7 +899,7 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -982,28 +907,15 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
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
> @@ -1014,7 +926,7 @@ int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
>  	 * memory region and then invokes a call to TrustZone to authenticate.
>  	 */
>  	if (!ctx->use_tzmem)
> -		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
>  
>  	/*
>  	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
> @@ -1024,20 +936,45 @@ int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
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
> +{
> +	return __qcom_scm_pas_set_remote_state(__scm->dev, state, id);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_set_remote_state);
> +
> +static int __qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
>  {
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -1057,7 +994,7 @@ int qcom_scm_pas_shutdown(u32 pas_id)
>  	if (ret)
>  		goto disable_clk;
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
>  disable_clk:
> @@ -1065,16 +1002,14 @@ int qcom_scm_pas_shutdown(u32 pas_id)
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
> @@ -1086,16 +1021,49 @@ bool qcom_scm_pas_supported(u32 pas_id)
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
> +		return false;
> +
> +	return true;
> +}
> +
>  static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
>  {
>  	struct qcom_scm_desc desc = {
> @@ -2782,6 +2750,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  
>  	__get_convention();
>  
> +	if (qcom_scm_is_pas_available()) {
> +		qcom_pas_ops_scm.dev = scm->dev;
> +		qcom_pas_ops_register(&qcom_pas_ops_scm);
> +	}
> +
>  	/*
>  	 * If "download mode" is requested, from this point on warmboot
>  	 * will cause the boot stages to enter download mode, unless
> @@ -2818,6 +2791,7 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
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

nit: please double check the alignment due to name and 'static' addition
to the function..

-- 
-Mukesh Ojha

