Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A264C44501
	for <ath12k@archiver.kernel.org>; Sat, 11 Jul 2026 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5MkcfUlQgcZIZ87E15KISjwZ+iXqXcxXpv2BzvWE1g=; b=t0anAxJbIfbeJ9vIOirPMDkZov
	Or70U0oywAbMwlTF9C9ukQrj6w0+/pOp/PiPBbeyChgG4jGLlWZ44DslN0t98w1DzhEOmTN4z3337
	mr844d9kF/oj2ecVZWQ+V67y4BL0gQAxijtjj+SIQPuK8K6bHwRP0gZoCV6r2Xrt/SDYFCIbrd50O
	ltGxrS6fOHrN2cMmaw/FPOv/CZ3+6QGzLWCPd1Z9CmUgIBHrLp6V1smLG19ZQ98juRsZSYw2CP8jq
	+4iB2sNWJy7mf3fdfj5ZHI2h3YpjDTFLPfbKtnwUZtlkOVYkiy/dLysTY1vEo3GvrW8zAqbYx8+Bu
	8AR4FMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiaDP-00000006g93-1KkS;
	Sat, 11 Jul 2026 16:06:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiaDN-00000006g8w-0Zxi
	for ath12k@lists.infradead.org;
	Sat, 11 Jul 2026 16:06:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8A72601D9;
	Sat, 11 Jul 2026 16:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE971F000E9;
	Sat, 11 Jul 2026 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783785963;
	bh=A5MkcfUlQgcZIZ87E15KISjwZ+iXqXcxXpv2BzvWE1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JBB6zLqWtlhjlxDMFgkPkhmoc7sOsT+vS+CP/gZ2bfgNUfVQTesD8GdSKYQ2AiBQU
	 dWAPPUrgI5nvERDLvniDjRWXey/6eRpqUblAChLPH2swU/zTU/BupHqaE/TB0ZqPgb
	 ipfQEbFRsYj50B7tHfufaEv9wz1flAloN+eNqihx7EqOqYF0d1WMeQ4mkuynkv8DvM
	 DQilz1HMOkpkimp4GrBcdUgrex8iFAl+uxD4WUTKZHX5DxEeAQS1QTfUewDjcWGSI2
	 /6S/WrOeWLnA6LsZEjxIAsQSvG4XQ2R6brKw40zihkJmCDbRknE73tFunNqmTxqZCF
	 O8gbOeIuR93tw==
Date: Sat, 11 Jul 2026 11:05:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-media@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com, 
	sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org, 
	abhinav.kumar@linux.dev, jesszhan0024@gmail.com, marijn.suijten@somainline.org, 
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com, bod@kernel.org, 
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org, 
	mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com, 
	pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com, 
	vignesh.viswanathan@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com, 
	amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org, op-tee@lists.trustedfirmware.org, 
	apurupa@qti.qualcomm.com, skare@qti.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <alJpc3nFX9D7_8i1@baldur>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702115835.167602-10-sumit.garg@kernel.org>
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

On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 

Please find an immutable branch with the dependencies for this patch at:
  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702115835.167602-2-sumit.garg@kernel.org

Alternatively, if you think there will be no conflicting patches in the
time leading up to next merge window provide an Ack and I can pick this
through the qcom tree.

Thanks,
Bjorn

> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 27 ++++++++++---------
>  .../media/platform/qcom/iris/iris_firmware.c  |  9 ++++---
>  drivers/media/platform/qcom/venus/Kconfig     |  1 +
>  drivers/media/platform/qcom/venus/firmware.c  | 11 ++++----
>  4 files changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index af78a1775937..388c9bbc8136 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -1,14 +1,15 @@
>  config VIDEO_QCOM_IRIS
> -        tristate "Qualcomm iris V4L2 decoder driver"
> -        depends on VIDEO_DEV
> -        depends on ARCH_QCOM || COMPILE_TEST
> -        select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER
> -        select QCOM_SCM
> -        select QCOM_UBWC_CONFIG
> -        select VIDEOBUF2_DMA_CONTIG
> -        help
> -          This is a V4L2 driver for Qualcomm iris video accelerator
> -          hardware. It accelerates decoding operations on various
> -          Qualcomm SoCs.
> -          To compile this driver as a module choose m here.
> +	tristate "Qualcomm iris V4L2 decoder driver"
> +	depends on VIDEO_DEV
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	select V4L2_MEM2MEM_DEV
> +	select QCOM_MDT_LOADER
> +	select QCOM_SCM
> +	select QCOM_PAS
> +	select QCOM_UBWC_CONFIG
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  This is a V4L2 driver for Qualcomm iris video accelerator
> +	  hardware. It accelerates decoding operations on various
> +	  Qualcomm SoCs.
> +	  To compile this driver as a module choose m here.
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d758..ea9654dd679e 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
> @@ -80,7 +81,7 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> -	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;
> @@ -94,7 +95,7 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(IRIS_PAS_ID);
> +			qcom_pas_shutdown(IRIS_PAS_ID);
>  			return ret;
>  		}
>  	}
> @@ -104,10 +105,10 @@ int iris_fw_load(struct iris_core *core)
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
> +	return qcom_pas_shutdown(IRIS_PAS_ID);
>  }
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_scm_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, 0);
>  }
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index 63ee8c78dc6d..7997b8aa427a 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -6,6 +6,7 @@ config VIDEO_QCOM_VENUS
>  	select OF_DYNAMIC if ARCH_QCOM
>  	select QCOM_MDT_LOADER
>  	select QCOM_SCM
> +	select QCOM_PAS
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
>  	help
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 1de7436713ed..3a38ff985822 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/sizes.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_scm_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, 0);
>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;
> @@ -218,7 +219,7 @@ int venus_boot(struct venus_core *core)
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> -	    (core->use_tz && !qcom_scm_is_available()))
> +	    (core->use_tz && !qcom_pas_is_available()))
>  		return -EPROBE_DEFER;
>  
>  	ret = of_property_read_string_index(dev->of_node, "firmware-name", 0,
> @@ -236,7 +237,7 @@ int venus_boot(struct venus_core *core)
>  	core->fw.mem_phys = mem_phys;
>  
>  	if (core->use_tz)
> -		ret = qcom_scm_pas_auth_and_reset(VENUS_PAS_ID);
> +		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
>  	else
>  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>  
> @@ -259,7 +260,7 @@ int venus_boot(struct venus_core *core)
>  						     res->cp_nonpixel_start,
>  						     res->cp_nonpixel_size);
>  		if (ret) {
> -			qcom_scm_pas_shutdown(VENUS_PAS_ID);
> +			qcom_pas_shutdown(VENUS_PAS_ID);
>  			dev_err(dev, "set virtual address ranges fail (%d)\n",
>  				ret);
>  			return ret;
> @@ -274,7 +275,7 @@ int venus_shutdown(struct venus_core *core)
>  	int ret;
>  
>  	if (core->use_tz)
> -		ret = qcom_scm_pas_shutdown(VENUS_PAS_ID);
> +		ret = qcom_pas_shutdown(VENUS_PAS_ID);
>  	else
>  		ret = venus_shutdown_no_tz(core);
>  
> -- 
> 2.53.0
> 

