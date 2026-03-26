Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1E9106F304
	for <ath12k@archiver.kernel.org>; Thu, 26 Mar 2026 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWS9BCdOs2ZKXaL1tg2KRvpibWw+VVvzzLtobafr8a8=; b=TZ2GLFjcW9dI0/qFmAc3nfahZF
	T/ZbBWtvdmCWkru61grJr51jr80V8DndrVXyN23dm/PWqbt89edQvGDlpeVf3riM5c3IHhNPFT0JQ
	CFAB3H5yaIL0/dKEpFk6bVUWcOsWf4QvvhHOK7rk+etSJo3GQ273dK2TWV1HD0oW+ZDnG8Ivmc2X5
	fFyObV22UEK7aXB1OWkJsFGVCcD3sfqBhQbkBfiqvUNkclkSC4Ur+rr33LE7aPvjl90shDa5FEO7G
	gzPIizb7v7snAanmO6umLp/4x2yqU+QnV3ENT9OoPcJOdOjivGeZkhwC9MM+1Hvps3ldu6Thd8XQr
	LiYOCJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gQ6-000000053eV-1IDg;
	Thu, 26 Mar 2026 08:50:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gQ5-000000053eE-3BLc
	for ath12k@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AWS9BCdOs2ZKXaL1tg2KRvpibWw+VVvzzLtobafr8a8=; b=ClBVIbeFXNZdO3j+2j55AlY3IU
	Sq9XE7XGhaeel6NPvr5/yrK4M8r4wEAyMnJx/g6OfGypzGpf1zQQcSS+tc8IWSXn8WBOb6Y+xoGCf
	H0Wwy0/Xtxd2UkGORG+tdTPCypxyP+L2YRKXOpyVPh4lQyhHI60akJIfCkmci65jbS1f0RI7nRcua
	R3ucvbwN1pMb0mBMfjMJJcVn9tkn6UU3aoNL1sqnubj17i6CjV1rutgK2JPL+nB0jPir3K1oOsYfw
	J3IE7fJ2LWDI834p9KE2Uxfqu9ZcL/ZKs3jlTy7cFiZrBXUFrADXH/7AtODKFXMmKrAVVfXVSetC+
	If5n7VvA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gQ2-00000007nFg-2jj3
	for ath12k@lists.infradead.org;
	Thu, 26 Mar 2026 08:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34BCC44222;
	Thu, 26 Mar 2026 08:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42667C116C6;
	Thu, 26 Mar 2026 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774515019;
	bh=Nk3OQJcQa7+IWGZDgf0ivm4hL2jKChEzfHAOrtGBL30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWGx2gOLvfHG1xA6EpBU5XssaH7AfwFrQA3TL8MLeYvE58DFfYB+nnd8vYfaFzkd5
	 tZa3gLuhJniQtc+eMnqm0Ci4fM8aZ8bZw0zdRPKw8aPsmlkX0QrttqDtSHEKcGgU0P
	 eSuGGXg+6WgNmt5i6568+PjflSOR56src4Ur83Ye/WgmFoofV3I6YFNt3sF/wd8bf3
	 4D3T+8od5S/QtunojXburPPXiBzJzjIyK4/8BljTxruiOtlHbtOQXSsvFooGr9s8mY
	 ENWjxKH8Ox3u0OzttcoWYRmtEVP+sj1YLfb6OvbG9+iC2I2DZ6VyEUFE/c+JHNVoVu
	 SyL5V108Zuppg==
Date: Thu, 26 Mar 2026 14:20:01 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
	pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 10/14] drm/msm: Switch to generic PAS TZ APIs
Message-ID: <acTzOTUVL6uYQZwh@sumit-xelite>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-11-sumit.garg@kernel.org>
 <v4ffww2r4ljqqbmvsc5jcr4ztqjbpfb42xryjeuz4abqiwup3a@2gfeelhjzzz4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v4ffww2r4ljqqbmvsc5jcr4ztqjbpfb42xryjeuz4abqiwup3a@2gfeelhjzzz4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085023_112342_3C8E4320 
X-CRM114-Status: GOOD (  14.49  )
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

On Wed, Mar 25, 2026 at 06:34:18AM +0200, Dmitry Baryshkov wrote:
> On Fri, Mar 06, 2026 at 04:20:23PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
> > TZ service allows to support multiple TZ implementation backends like QTEE
> > based SCM PAS service, OP-TEE based PAS service and any further future TZ
> > backend service.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index ef9fd6171af7..3283852f9a14 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -5,7 +5,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/types.h>
> >  #include <linux/cpumask.h>
> > -#include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> 
> Missing `select QCOM_PAS`.

Sure, I will add that in next spin.

-Sumit

> 
> 
> >  #include <linux/pm_opp.h>
> >  #include <linux/nvmem-consumer.h>
> >  #include <linux/slab.h>
> > @@ -653,7 +653,7 @@ static int a5xx_zap_shader_resume(struct msm_gpu *gpu)
> >  	if (adreno_is_a506(adreno_gpu))
> >  		return 0;
> >  
> > -	ret = qcom_scm_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
> > +	ret = qcom_pas_set_remote_state(SCM_GPU_ZAP_SHADER_RESUME, GPU_PAS_ID);
> >  	if (ret)
> >  		DRM_ERROR("%s: zap-shader resume failed: %d\n",
> >  			gpu->name, ret);
> 
> -- 
> With best wishes
> Dmitry
> 

