Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882C6C43602
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 05:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxpIkGUR3B/YQ+use+jlgeTg1Rp3sEV28YNx2zBhiBo=; b=pm7fo4eXwhNcMgsYTQ3hvEcfAM
	yVrocQFhjguDkI6LmATcEz0AQqI7tG72UyxQmpeTwsEYZ3OwmQ9tjDdSj3n13kI9OUkcz8P1UM3P/
	TSp/ahqEEby4H5LFP45LHtpjnO0MHFJSLxN3zEdTMXWllM18irPOe2aaKVIqZuEquGqep62pCt998
	Fb//IGEUKOmdEnA8jyehb2p0Oz1rQKntjlVG1uELojyudq/2pML98AquBRuR+oEJM/bSDMiv8PXD2
	naAEJYZk61UsU3Gpx7Jqcw48U15HCKfjbUs9bQ5KXTkhkrzBJom8TsEPUV9mprKZMB/MTaakzEzLa
	WDqB+RGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wendF-00000000gWk-0GjW;
	Wed, 01 Jul 2026 05:37:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wendE-00000000gWe-12CW
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 05:37:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF2E0413C1;
	Wed,  1 Jul 2026 05:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE451F000E9;
	Wed,  1 Jul 2026 05:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782884226;
	bh=AxpIkGUR3B/YQ+use+jlgeTg1Rp3sEV28YNx2zBhiBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cvu3oWYo7MvnOYf+fng4McUfNgKTxtvvPTsKPCovTBnop/zsHeV+5xoq0S0wGuQZo
	 NDZ/50FVKK/c7equFbh2mTBsm3B29ywpsQc7MUicYWLPOHp8ftk9d9ou6Zv0h4vwHa
	 ugxgIZwqihSxbLQza8Y2Nn5x9szQNgH9/m5QPvQqhqn3FzhFRIfZfYWnjNOof6axQ1
	 2x/nCi1CTOmOHj9Qw8wI7wirCSVR4hautUVK6XcunMFvOL2XkSU1vdll90oJhAKJQJ
	 cEJNcPPoUNVKPx85p8uZdSen2xELIsFevFn4unA0DyKIxqgE8XgZ71e8f/yYhQLTLT
	 mJp/klMAcBY8A==
Date: Wed, 1 Jul 2026 11:06:49 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
	mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/14] remoteproc: qcom: Select QCOM_PAS generic
 service
Message-ID: <akSncWwMc9tntyD4@sumit-xelite>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-8-sumit.garg@kernel.org>
 <64e425ab-dddc-4221-81d3-3283e2961bea@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64e425ab-dddc-4221-81d3-3283e2961bea@oss.qualcomm.com>
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

Hi Konrad,

On Tue, Jun 30, 2026 at 02:37:59PM +0200, Konrad Dybcio wrote:
> On 6/26/26 3:34 PM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Select PAS generic service driver to enable support for multiple PAS
> > backends like OP-TEE in addition to SCM.
> > 
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/Kconfig | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index c521c744e7db..65befdbfa5f7 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -210,6 +210,7 @@ config QCOM_Q6V5_MSS
> >  	select QCOM_Q6V5_COMMON
> >  	select QCOM_RPROC_COMMON
> >  	select QCOM_SCM
> > +	select QCOM_PAS
> 
> This is a NOP, SCM already requires QCOM_PAS

That's true but I think we should rather have explicit modules
dependencies whose APIs are being used by their clients. QCOM_SCM is a
special module in this case exporting direct SCM calls apart from being
the backend for the PAS service.

I would prefer explicit dependencies but let me know if you feel
strongly otherwise.

> 
> >  	help
> >  	  Say y here to support the Qualcomm self-authenticating modem
> >  	  subsystem based on Hexagon V5. The TrustZone based system is
> > @@ -230,6 +231,7 @@ config QCOM_Q6V5_PAS
> >  	select QCOM_Q6V5_COMMON
> >  	select QCOM_RPROC_COMMON
> >  	select QCOM_SCM
> > +	select QCOM_PAS
> 
> Likewise
> 
> >  	help
> >  	  Say y here to support the TrustZone based Peripheral Image Loader for
> >  	  the Qualcomm remote processors. This is commonly used to control
> > @@ -282,7 +284,7 @@ config QCOM_WCNSS_PIL
> >  	select QCOM_MDT_LOADER
> >  	select QCOM_PIL_INFO
> >  	select QCOM_RPROC_COMMON
> > -	select QCOM_SCM
> > +	select QCOM_PAS
> 
> This is OK
> 
> _however_
> 
> It leads to a situation where no back-ends can be enabled

The TEE backend is enabled by default if ARCH_QCOM is enabled, if you
agree then we can similarly enable SCM backend too.

-Sumit

