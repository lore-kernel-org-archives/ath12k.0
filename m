Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A19C43458
	for <ath12k@archiver.kernel.org>; Sat, 11 Jul 2026 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QuIe/JXClOlWX4qdoKvsVboO8bvQ4xPcjrHdiLMqdk=; b=WnTZ34cysFocTcdv6x6xjhpR7y
	zk1itwjKczpPtSbsOQcRb56ebGmvLsm5a/GfQ3/xTTrISFRe1ARShFwTou6mPulLwT09ZYDABkOVL
	83uGqk1Lzh7p2BiLC/qwtqIUuyXZfHKw+zdphqcZba4uQ2LJFje+kimgmCT+oQckiBLvGs0PmksZd
	XJl0VbKY3M8t8yXVYTYM+M4097+XZgIlHrHbTvnqlpwqO5p9p99KAEt9PZRg+hDLZn2i2iRHqZjGR
	z4t3wCCFbTUX4sN/l4IQ6NhsmKrjYA8AKI8Zqp3HVOmQnZR4A6z01T6+mQ2HvZHXauOZzURXDZkn2
	H6O6v4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiaDp-00000006gDw-386B;
	Sat, 11 Jul 2026 16:06:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiaDo-00000006gDc-0pSW
	for ath12k@lists.infradead.org;
	Sat, 11 Jul 2026 16:06:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 947C74058F;
	Sat, 11 Jul 2026 16:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518971F000E9;
	Sat, 11 Jul 2026 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783785991;
	bh=+QuIe/JXClOlWX4qdoKvsVboO8bvQ4xPcjrHdiLMqdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZZ19zs+RX0qgmc6OxroxmqWRc+kVvzolvhSNhDXF4fCbFaMe+AcAzIda03cdJGa0y
	 +daVX+++fl8kWoxj48t76nY/0TrrJADWUWqcSlj3PNCnMKEg60lPZ0JFH85d/pSuES
	 JY1O72m2XSSdTD5GQyRUMNgHGR4qfdyZ2K19SuENFJjgE/NVLPABoD8qKWUGU29J0W
	 hju4pjk8CO0X+JR3+cu7cLk2viqFio67e08T3IjbtgWKyHTGCdAKLocCoQF3krODMe
	 SNbFEqKoivoxfzQuFVFMVFNLNzr7Ke9Vq2M3bCpYQAqwl5hXFCK3oZTS8Ja+ph6OXe
	 j+K1CTUi3fPbg==
Date: Sat, 11 Jul 2026 11:06:26 -0500
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
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Alex Elder <elder@riscstar.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 11/14] net: ipa: Switch to generic PAS TZ APIs
Message-ID: <alJp8jMzcw9EPZoy@baldur>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-12-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702115835.167602-12-sumit.garg@kernel.org>
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

On Thu, Jul 02, 2026 at 05:28:27PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
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

> Reviewed-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/ipa/Kconfig    |  2 +-
>  drivers/net/ipa/ipa_main.c | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> index 01d219d3760c..a9aff1b7977d 100644
> --- a/drivers/net/ipa/Kconfig
> +++ b/drivers/net/ipa/Kconfig
> @@ -6,7 +6,7 @@ config QCOM_IPA
>  	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
>  	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS
>  	select QCOM_QMI_HELPERS
>  	help
>  	  Choose Y or M here to include support for the Qualcomm
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 788dd99af2a4..3cd9e44680e9 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -14,7 +14,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/types.h>
>  
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  
>  #include "ipa.h"
> @@ -624,10 +624,13 @@ static int ipa_firmware_load(struct device *dev)
>  	}
>  
>  	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> -	if (ret)
> +	if (ret) {
>  		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	else if ((ret = qcom_scm_pas_auth_and_reset(IPA_PAS_ID)))
> -		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +	} else {
> +		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> +		if (ret)
> +			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +	}
>  
>  	memunmap(virt);
>  out_release_firmware:
> @@ -758,7 +761,7 @@ static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
>  		return IPA_LOADER_INVALID;
>  out_self:
>  	/* We need Trust Zone to load firmware; make sure it's available */
> -	if (qcom_scm_is_available())
> +	if (qcom_pas_is_available())
>  		return IPA_LOADER_SELF;
>  
>  	return IPA_LOADER_DEFER;
> -- 
> 2.53.0
> 

