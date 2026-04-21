Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA97F8FA6A
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qObE4yNcYiqD8sU3A9JaOfMHzpCis30LcX9WFu4MXo=; b=30Diw0ZTD5zSCKOxrJgQYZpQBl
	vTEh44JE+fwfyU+QX8QbMU58XpstHWw4cS4+iqj+VV7cc0EQTyLfJTTFEajSE8cw47Z1IuER3tM50
	ig3WWdNruxrYc/Ds1kKV+ze1jFK1CfEefiNilVT16/mA3QPF/pdFjl/0O7Zz0xqFbGSvloe2N3WEV
	CnHXooCm2hA8esZLORxdQmDS5B/aR519cBN3pelB5d7LlohF1GEniSsJTtyopo0uTOYLdsh6FaPJq
	nLvEYcu6ylrxUl5dMcEgdwzC9nQBtFxjNmtHQGh1VhlX6IVv7sGc0NlRw1AKEV6Kpwn8MWyX0CrJi
	JapfB7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAOH-00000008bEE-2tGw;
	Tue, 21 Apr 2026 12:39:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAOF-00000008bDh-0hTY
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 12:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75815408AA;
	Tue, 21 Apr 2026 12:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6C5C2BCB0;
	Tue, 21 Apr 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776775182;
	bh=d3LihHP7jY6TIKD4Yg1TnkCSvBzmJZqKnzSzxjz4rX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AC47sF47/pg9LF5Famx9RwxaAsUSkc+GRKHFx6grRezUGY/+q49RSMHWa8s8mvp71
	 iV5kOWd9MirxtkoM8cQJ310VtMy2sDQEnLmTVdkDuNajY8YcRYOuqx6W8HdzG64U+v
	 +xx3QqjuuhZKo9hbu0lfqw292GeIchac8KdbRW2OLFijC0U9AtQU7CZhL9e+rwcc5D
	 7tbZAqrQ/XXJHvuIE3ppqcyQK+nppFfrFjlr7RHh9Px+jaeEHeXn/jgwnv46LmUYhp
	 suW3no8GSoLtZqJplCiDnftqdXMQOe5itE0MclJOH8GNx320OkIuWKdCYKFTNImg1Y
	 Tah51pQQ+V+uQ==
Date: Tue, 21 Apr 2026 18:09:24 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: elder@kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 12/15] net: ipa: Switch to generic PAS TZ APIs
Message-ID: <aedv_LEriojkRIwA@sumit-xelite>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-13-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327131043.627120-13-sumit.garg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_053943_246556_9D809B3A 
X-CRM114-Status: GOOD (  18.76  )
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

Hey Alex,

On Fri, Mar 27, 2026 at 06:40:40PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/ipa/Kconfig    |  2 +-
>  drivers/net/ipa/ipa_main.c | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 

Can I get an ack from you on this change? I expect this complete
patch-set to land via Qcom SoC tree.

-Sumit

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
> index edead9c48d1f..8feb8493d5b5 100644
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
> @@ -754,7 +757,7 @@ static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
>  		return IPA_LOADER_INVALID;
>  out_self:
>  	/* We need Trust Zone to load firmware; make sure it's available */
> -	if (qcom_scm_is_available())
> +	if (qcom_pas_is_available())
>  		return IPA_LOADER_SELF;
>  
>  	return IPA_LOADER_DEFER;
> -- 
> 2.51.0
> 
> 

