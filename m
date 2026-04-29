Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9B9CCFA13
	for <ath12k@archiver.kernel.org>; Wed, 29 Apr 2026 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey1EcgzCeETB45FN3v8thWWyTAMm9RZnJD/dBNt9Ayk=; b=OH9LWsFH0PyPB0eCIMz6e62Sis
	h+wgq3UjsAsFpe2dh5FblGb+4cyXacgfQnn6xc9OxYDd/i6TKcWnCr1YxsttqvbdgcioDLeXxzvb7
	Wp/CKYC4idjaoggTP+osWspDe5tsKfnTYAWTCGH4salgu1ariS1id0UZIYriw20dwE6pBZmBTR3k6
	kD43q/z+4220kg69kQ4TGG7h/Xb8jbr5niKKJCxAMnhaIY4Gofta5z77dORMkwF3OlW4NgeOXSHce
	4awXqfRgEPmoiIW3yAMVNJp4NWT51IvkDIzqGhx9uJxBnhnyzZoFB7QGNY/sCDlMKtMFhHB59Rz8p
	MyCwjlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5BN-00000003h4P-0Zzl;
	Wed, 29 Apr 2026 13:42:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5BK-00000003h3s-35hH
	for ath12k@lists.infradead.org;
	Wed, 29 Apr 2026 13:42:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCM1Df2485218
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 13:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ey1EcgzCeETB45FN3v8thWWy
	TAMm9RZnJD/dBNt9Ayk=; b=EpSNPWuNBtzVb7wps9/JYMuZXXliIyiIhRH4k3b3
	fNbr63jYxbM6FPtTcoxEhgqF/7A2aELesDquLAiZclTStoHzt6/jtLrKDqLTVyPz
	ihccrqEd9vpCcMJtPsTyOpb2FETVfGm2/yGO4BRdO2sdLwNltiT3l4mP/kM6rvhT
	PIt29gg+3GzVWDQF36bVgTd++vrhGNLtntM5AhNu8FFafIpGsn5FSwJfJG/5vB44
	EUUAK/0foOIhhioQVurmZe/YnNVyNBigsyPRuwXPSjSLfg3Gek8QAN5Cqkg4/+Xz
	4/TFxTuhm5AJG54FtMBE8YwplkQ6ASXW7APdLpczuO4FYA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx908du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 13:42:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c44bf176so14860906a91.0
        for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470145; x=1778074945; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ey1EcgzCeETB45FN3v8thWWyTAMm9RZnJD/dBNt9Ayk=;
        b=kRXSsR6AjvAefeI94x188jvCBbFuVK7JQwJMFA9AgS0Fk0Ib6pIM3aIc5f9pEDQuxN
         12WYro/t4O+1CJRiz6bxD7OP1hbDlSwcGYlNdgQLAgmhIjGeHiZV2/aYs9+MQSqFtIPZ
         aR4QYLDcu61mN9PQA45EHQVsGqnYumYMqcGeN9/3vv2RkSkdK2e/ftQ3oeoHo/FeRnbv
         Z0VZlk43HvhSg797PlOb9aGQ1xA7vFW4CtvUZmmdE+JqssxWa+9U3vooUB1oY8L3hYUf
         fNJAPqkmo6FT6MKblz9ykciKhh3rIypPA9YcrrCacaLM6Zj7JfY9xpSmyw6pt6nKXOMd
         zFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470145; x=1778074945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ey1EcgzCeETB45FN3v8thWWyTAMm9RZnJD/dBNt9Ayk=;
        b=Wwqd0BXwpahgOJWXA8pwxe0dSPTn6tJEju1sp8bKUWMUKBz6STxqWIbFM9Bw95any1
         AS/HIJLYPDixFgn9eF+MrTh+Wc6TIIjxEWFMqruU42RDRjOMo2QhUNHBG3QNtcSBWxFi
         u/o2oS5HyPfAyPqnIYM0nsUHpVf3ymhpsjTsfvyYU0A54oJA8TNOq0elC/DmurPlwdnd
         NxPVUxPG8UjSwefBU2cW827bUtDoiIESu0NSSaYPaOhTx7az820u1uhpo8xeev9TmkgR
         atoDiRCvtdtn3Kk5GeTQcXbWjfJbT+OfnWrZD9PEC4IkEqwrzt0SzFmjBboCdYUzT7b0
         4JsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fY62p3e82n0D9dzhUfmZHvFDoqWybkUf2n/CilOb2ulDuG4in4TFbnv/D9LMtPzyLTzvXYiI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu5OK58kExBuPwrf2Co0vcfcpQWas2KlCgA4jnnZs308ixSS8O
	aQvGeOy1LACh/Zn44/hrI2ebRsI6QwBZOdndlvM65GnVEcV9ot05yvGQ0QA0q2eadHHlns9jSyo
	V7N7P/xdCdp+woZrG654adfutwiRrI5g5wz5E27qf76AGDS5TSAW2qieLwJXq0mMI
X-Gm-Gg: AeBDiese8ani2qqLp2nutKcvU3UPd7Waw+9424Pyfvyo7eqorZA27n+GGzXzJ0K9Wh/
	TWslHmWrGSa3rrLhN71ESratzfFScWkv+GBbMYLNFYRbK4DJ/URL+rx0NgVSihNOK0YUDg210xC
	oJngX0wkeITDXAJrlwwGl7HCprBmH/dAhI7mZVhG8Vi2Z/Uc61BhTKXsL4fRXf8/LsZjSUcyLed
	UqcYMumfotfJSf3m9G2AmchQkFGEZ2Ph7NRMAkCu9C7UV3CBjz8+Yj1K65evy2JBs2P1lrwCHEZ
	71RC9NklTcqdhesTJjwCkTCc7UMyrslTTU34HZ/yOvczFg4jAi8W/p0tefoLjxFBIAYYIV5cfPm
	JaFDxKrs0hvPPpz7LpDZVB5G5Z+ME69BxTXYbbKSGcewsDbebBSsPFf3CTj8=
X-Received: by 2002:a17:90b:2ccb:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-3649204fb32mr7693611a91.21.1777470144716;
        Wed, 29 Apr 2026 06:42:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-3649204fb32mr7693557a91.21.1777470144037;
        Wed, 29 Apr 2026 06:42:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a27f32b1sm1370451a91.5.2026.04.29.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:42:23 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:12:08 +0530
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
Subject: Re: [PATCH v4 07/15] soc: qcom: mdtloader: Switch to generic PAS TZ
 APIs
Message-ID: <20260429134208.pqo67sh3jkvsa5ka@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-8-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-8-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzOSBTYWx0ZWRfX+MGbxj0bV8uu
 eGBFtIJZC3vn/kJDCC7PP37j2da2b2hTfGBaj847c0qqphghUKJ1SfFi4MS3Iry44dPLaQJMGZg
 i/CS9skvFU8X4/jHhoWwWE/neSHgUqhrl3PFpImBvzVJgk22TTd9EUu6Lv937kDNdx5hpc2pK9K
 LL7zlQbmh9siC57VZm/kFegBLogPnkM1MIIxZzaxR6UgwtoveVLuLMZ1lTW9B8FQepJ15uCdoA8
 NsJzN3uXw8fSvETYc1+hLl5NjKZP6j1t6FmRZAIrUULVQpFIsI0EFVD68nIhsEMhu4bwq7u3Z3q
 BcWr6KyaCtcSeQXYSR6f7CIkiTf59sWEVJKC/kiLnhrN3p/UlXeAFoZYqw9LwB7xOis96dTAXPQ
 64S422skXkkgNR2AUfujSgLqip9q98e6v+R3WnI4Bx5hnzC31+uvks2esoT6Zfp5ih+IRJaSAOf
 DyCXod0VtAPYWdN6r/A==
X-Proofpoint-ORIG-GUID: VBpymRBtY0tXoT3YcKSrf5el1oYzkp8L
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f20ac1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xqloa5d6wBXDvm8eUWQA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VBpymRBtY0tXoT3YcKSrf5el1oYzkp8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_064226_806588_C392DD19 
X-CRM114-Status: GOOD (  22.55  )
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

On Mon, Apr 27, 2026 at 03:25:55PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch mdtloader client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 12 ++++++------
>  include/linux/soc/qcom/mdt_loader.h |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index c004d444d698..fdde7eda538a 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -13,7 +13,7 @@
>  #include <linux/firmware.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -229,7 +229,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
>  
>  static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -			       struct qcom_scm_pas_context *ctx)
> +			       struct qcom_pas_context *ctx)
>  {
>  	const struct elf32_phdr *phdrs;
>  	const struct elf32_phdr *phdr;
> @@ -271,7 +271,7 @@ static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  		goto out;
>  	}
>  
> -	ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len, ctx);
> +	ret = qcom_pas_init_image(pas_id, metadata, metadata_len, ctx);
>  	kfree(metadata);
>  	if (ret) {
>  		/* Invalid firmware metadata */
> @@ -280,7 +280,7 @@ static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  	}
>  
>  	if (relocate) {
> -		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
> +		ret = qcom_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
>  		if (ret) {
>  			/* Unable to set up relocation */
>  			dev_err(dev, "error %d setting up firmware %s\n", ret, fw_name);
> @@ -472,7 +472,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>   * firmware segments (e.g., .bXX files). Authentication of the segments done
>   * by a separate call.
>   *
> - * The PAS context must be initialized using qcom_scm_pas_context_init()
> + * The PAS context must be initialized using qcom_pas_context_init()

Should devm_qcom_pas_context_alloc() now 

>   * prior to invoking this function.
>   *
>   * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
> @@ -483,7 +483,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
>  		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
>  {
>  	int ret;
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 82372e0db0a1..142409555425 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -10,7 +10,7 @@
>  
>  struct device;
>  struct firmware;
> -struct qcom_scm_pas_context;
> +struct qcom_pas_context;
>  
>  #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
>  
> @@ -20,7 +20,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		  phys_addr_t mem_phys, size_t mem_size,
>  		  phys_addr_t *reloc_base);
>  
> -int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
>  		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
>  
>  int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
> @@ -45,7 +45,7 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  	return -ENODEV;
>  }
>  
> -static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
> +static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
>  				    const struct firmware *fw, const char *firmware,
>  				    void *mem_region, phys_addr_t *reloc_base)
>  {
> -- 
> 2.51.0
> 

With above nit

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

