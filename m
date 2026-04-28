Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEC0FF8868
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3Z9r4IpEjJMUHPOqoRO6rW4qYst7QOqGLcntOF/K5A=; b=goNm4z/Z6sc7XhG0R9UWIl/MIx
	JTE178sevEgM7qMX705V6iN/rKrMIZQg3vrW3ZiMKBkOXIl5SyOab4ctQvShKmS5h8cJYdmUShO2E
	ntXKotIoXc33s93uOeN2cRu4A344cDf9kQ4wxz9IlhOHXnhnazeiTRMDcx7AFyaQgLvzWuAm40CYw
	V3Ej+PnnrwHWWToeI+7qkWOHjUvn4g4qrLkKjzFKPzXEo8SQ1rTltfgTzzHuShTc+iWuD2p0s6kM1
	0CA0Lpprr+kTAjiFgAKmVxGsEKPwvF51NrNCdL4gDVPcdT1psmCbQ+uaEFjYt/t8Q2Ch0xA+XzkVg
	dfOi/W2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlhH-00000001z6E-2GES;
	Tue, 28 Apr 2026 16:54:07 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlhF-00000001z5T-2Vj4
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 16:54:06 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6948da50eb5so14643eaf.1
        for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 09:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777395244; x=1778000044; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3Z9r4IpEjJMUHPOqoRO6rW4qYst7QOqGLcntOF/K5A=;
        b=Y5aIWF3IFN1iIaG2uTeIdGiU6defubFUHdiqbIG9OGuScwRGxTaKA1QXRhg14SIZOJ
         SN0dSiLDi+EFcIu+BTXuJnMlC0fwH0aMgOkqzlYCdJUKQOhqiBjxTUIUbpKYWxXtYRx3
         8ydZ74Yh1HmP0rS++WhQoTTNdyoVqA9MDz8PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395244; x=1778000044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3Z9r4IpEjJMUHPOqoRO6rW4qYst7QOqGLcntOF/K5A=;
        b=RicJGaqPROlwFQFFHuTP5xLpzhoWzdB8ezi1+nGv0eUrOUkf3kwSig9SNtIvI11TVf
         9VuQ7iRtz5Bei8WT5KsGNFWpTrngStsvi+hr+VRD6x1EKfOZLaatw2cqpXWCxaWxQmYA
         k25RqNcJSTwI3ZXPWaNIUkOI5rtg5CPEQbwILFn+o+IW0gtieOaVQQ8801iob6aFqEn9
         pkikg0qZH2x7uFIDC9srN9vyDdyKZ/MnpesMByw0BUcypYi1LL8LngL3sVW7GdQkSqGQ
         Xq0ToewXbW8EuW3NoXbeoWuDe2MfwotIxZQdHlOBQe+TRTgaXm98uG+lN/gt9zlHrVDz
         o7bQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hg0tMmzBrmGYRRd4VUYMM0ti7naDpdcYr/64uX2LyuvAngm/YwFsbANapfBocJnDqAXS11uE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwK06Pg+heKjj7S3zn4+fJalhC8N7WjiQHTD9d+8b1if3leBwGo
	4inx7vWiM9bSne5SP2tDjSTSKgFON1jpyXRuqv1g3FA0NyVCLYslK0KJPty3efFnaA==
X-Gm-Gg: AeBDiet2YeannsiuEptgxUYizQKDfxD2V/nXxtBxdBAcqT4IDyTIbw0sSMsK3afoVTK
	Qfm0yARoudKfdUSbt0/GuT5LeOg6G+f+mr7qIcixEeHCHdX1s3bfpAow0mPCM7PDI9rqEI+F7T4
	P9bLSEnSUePABFO7cQ9sTf3HoZIjL+26u8+FnaVjFzlwsdif7OwqGDi1Dnc2maQHw12sgKF7iY1
	aTZ9EwSPVX2/PzlrpEtfYx8/KTcL4QV6GIQ/4Yzo/WvNWEa6WYS2bEK5chhBQmRi94tk6PSQmft
	VWVIbqbhRDGPCLs5WQjwh0cb70yal0mEuhIdr0nHIa8ai06JZa8H6XbxdiU6Vmad5gO8p0cj7hW
	EhUHZzPHcqe8nKp+2iCbY3TWSFm5U0q8a4gAutQiG3g8QvMMtmjyGjprQQH+4TIKks5RdkHRFMc
	QK7eoWa9j/ICcjVdbkYxOj5du9XpYm//to3ux1v2Vpxa7kPmjgpRPtBEoDs8qFTUCnmEJcSlO0N
	utmyxo=
X-Received: by 2002:a05:6820:4b05:b0:696:13e9:6863 with SMTP id 006d021491bc7-6965c5ee294mr1871158eaf.2.1777395244239;
        Tue, 28 Apr 2026 09:54:04 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-433effdc79bsm2240677fac.18.2026.04.28.09.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:54:03 -0700 (PDT)
Message-ID: <aa2b2823-05b2-49a6-bdd3-622523497a0d@ieee.org>
Date: Tue, 28 Apr 2026 11:54:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] net: ipa: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com, amirreza.zarrabi@oss.qualcomm.com,
 jens.wiklander@linaro.org, op-tee@lists.trustedfirmware.org,
 apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
 linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260427095603.1157963-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_095405_649369_8E6EB67A 
X-CRM114-Status: GOOD (  17.48  )
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

On 4/27/26 4:56 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/Kconfig    |  2 +-
>   drivers/net/ipa/ipa_main.c | 13 ++++++++-----
>   2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> index 01d219d3760c..a9aff1b7977d 100644
> --- a/drivers/net/ipa/Kconfig
> +++ b/drivers/net/ipa/Kconfig
> @@ -6,7 +6,7 @@ config QCOM_IPA
>   	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
>   	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>   	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS
>   	select QCOM_QMI_HELPERS
>   	help
>   	  Choose Y or M here to include support for the Qualcomm
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 788dd99af2a4..3cd9e44680e9 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -14,7 +14,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/types.h>
>   
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>   #include <linux/soc/qcom/mdt_loader.h>
>   
>   #include "ipa.h"
> @@ -624,10 +624,13 @@ static int ipa_firmware_load(struct device *dev)
>   	}
>   
>   	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> -	if (ret)
> +	if (ret) {
>   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	else if ((ret = qcom_scm_pas_auth_and_reset(IPA_PAS_ID)))
> -		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +	} else {
> +		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> +		if (ret)
> +			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +	}
>   
>   	memunmap(virt);
>   out_release_firmware:
> @@ -758,7 +761,7 @@ static enum ipa_firmware_loader ipa_firmware_loader(struct device *dev)
>   		return IPA_LOADER_INVALID;
>   out_self:
>   	/* We need Trust Zone to load firmware; make sure it's available */
> -	if (qcom_scm_is_available())
> +	if (qcom_pas_is_available())
>   		return IPA_LOADER_SELF;
>   
>   	return IPA_LOADER_DEFER;


