Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C536FCC9C0
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 05:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGau/9csWBAnA3MVVS73aqsuX99tRym+KhdLypZD720=; b=oFBw/wsKnI3XvA3555AYD55akx
	fXvDpxJyBUKHNK4lQXWuHiLraCLmAEjkZmAk9tf4KFUymXSvC3YU/ysnVOOq/mJoWAzFZ1kgV+wRA
	6qEAwrSjCovxC0SltsWnKcm1hnEBcEHURNW3o5JscJSVT8gkwvci6RT4v0D++xcnBtzGMm4mS99vq
	m4dgGuw+zExvDizWtOEf1tjlptrAw5mVQGRfsSuvEsv7Tw337XXmGnQOykK49PK3X+ge3G1jtwdBH
	kujRtycZwAMiPWn1jEaM40of1IpR8dql7sFwJvVFnItw9/6cN8vs5XnM5xAXRWwn08LdscT5u6f7Y
	Wm5QFYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpHT-00000008j2A-41u3;
	Tue, 10 Mar 2026 05:05:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzpHS-00000008j24-0FET
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 05:05:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82E6160097;
	Tue, 10 Mar 2026 05:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470BAC19423;
	Tue, 10 Mar 2026 05:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773119116;
	bh=2U0QJW1GAlzSLhrIMqY8NiJx4ObQV5OXd1GxUWWfmx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDkpv5S/dhAYS41lOL8eQcR9GtZoGAD/xkpGuJcpwltHlzyfBouIvIEWoqbSs/Wsx
	 yl6HZjGTIgD4XeNbhrF8MZdbcG9xvx5FJXfxZYHLuZMBwX01gzKKIKyOV4DSh+mQgr
	 wJnQFQezVsAyDvkQqBZA7Y67hZ0v8AG3P4N9aBpsjmwKMAAsX96R3F4xxD2/+JGYNw
	 O+CiVvgDppcffVy9K2KbjQDj0b7Dvr2CP4mka7R73fm928CFJjhJjdIpzMvegQrass
	 Nlfhd4bIklNwUKvNaP8rT+kM3dHqh6OsULUC/lsx25hzqCFPQs6rQLUBCNhjV1eek2
	 9uUQheT5PpbEw==
Date: Tue, 10 Mar 2026 10:34:57 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
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
	pavan.kondeti@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <aa-meTJ4_xl4PKS0@sumit-xelite>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org>
 <aa6O5tir4kVIe0eZ@trex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6O5tir4kVIe0eZ@trex>
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

On Mon, Mar 09, 2026 at 10:12:06AM +0100, Jorge Ramirez wrote:
> On 06/03/26 16:20:24, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> > TZ service allows to support multiple TZ implementation backends like QTEE
> > based SCM PAS service, OP-TEE based PAS service and any further future TZ
> > backend service.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_firmware.c |  9 +++++----
> >  drivers/media/platform/qcom/venus/firmware.c     | 11 ++++++-----
> >  2 files changed, 11 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 5f408024e967..b3c5281aea91 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include <linux/firmware.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> >  #include <linux/firmware/qcom/qcom_scm.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_reserved_mem.h>
> > @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
> >  		return -ENOMEM;
> >  	}
> >  
> > -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> > +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
> >  	if (ret)  {
> >  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> >  		return ret;
> > @@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
> >  						     cp_config->cp_nonpixel_size);
> >  		if (ret) {
> >  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> > -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > +			qcom_pas_shutdown(core->iris_platform_data->pas_id);
> >  			return ret;
> >  		}
> >  	}
> > @@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
> >  
> >  int iris_fw_unload(struct iris_core *core)
> >  {
> > -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> > +	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
> >  }
> >
> 
> are the calls to set_remote_state required?
> 0 is not the IRIS/VENUS remote processor.
> 
> If it is legacy, maybe they can be phased out?

Vikash, Dikshita,

Do you know the background of this set_remote_state calls?

BTW, the scope of this patch-set is to not change existing subsystem
drivers behaviour but just to enable the generic PAS interface. So
any driver changes can be taken as a follow up work.

-Sumit

> 
> 
> >  int iris_set_hw_state(struct iris_core *core, bool resume)
> >  {
> > -	return qcom_scm_set_remote_state(resume, 0);
> > +	return qcom_pas_set_remote_state(resume, 0);
> >  }
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 1de7436713ed..3a38ff985822 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/of_device.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> >  #include <linux/firmware/qcom/qcom_scm.h>
> >  #include <linux/sizes.h>
> >  #include <linux/soc/qcom/mdt_loader.h>
> > @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
> >  	int ret;
> >  
> >  	if (core->use_tz) {
> > -		ret = qcom_scm_set_remote_state(resume, 0);
> > +		ret = qcom_pas_set_remote_state(resume, 0);
> >  		if (resume && ret == -EINVAL)
> >  			ret = 0;
> >  		return ret;
> 

