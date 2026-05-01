Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEFFCD3424
	for <ath12k@archiver.kernel.org>; Fri,  1 May 2026 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tfc16u7xuT/01UBUM9QvPX7+X6fVIzVXJFQ6eBt5vs=; b=j5JQIF3b62dh2GpwlHCC693O5B
	rO5HqZoUqqJuvN3ZNTOaBWdX43ds5rE6TwOt0t8QtGX2Vh9zNaU2sV8Szomb+EIjU13/XxV5t1e6X
	lsX8czPINKC6ipW1aejoqlsD66HbWdm0lbmVw+Q4VmVBCo3CaAUIDnnR2AM02Enk4rVfl5I45IQKj
	/7VGN2D0b7bmaDbr5EeOKOMo4NQxBwntQJN1k5w3ZTS/sr6XV3dHeZsPM3es9mJ75EGt2t5poY0By
	ro135RJa0m0hX+R5jQQZqQ6i0F+/q/KbGPNh4wpn5cJkTxSWG1AFAGJdyIDV+n7YH2wZVH48ZF/mu
	4NQ/QoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoYN-00000007Dr9-1xw0;
	Fri, 01 May 2026 14:09:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoYK-00000007Dqi-3LKP
	for ath12k@lists.infradead.org;
	Fri, 01 May 2026 14:09:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07E4A43289;
	Fri,  1 May 2026 14:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C19FC2BCB4;
	Fri,  1 May 2026 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777644551;
	bh=SMByRl8lFrdxKKnkS4vcwTneFAh6CDvoMKSWnMddQSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDwd5OvATcOeJ+h7ekKmApfuAVD+xci9lzfuOrSfnPI5zTnw95tDinFDy0ZtNzrpT
	 9GgQLqYQQZwD3AnSe2EdNxZapxTi3VwG3sVbd9e5FDlaTknEMVZKOqCF4YjaMkN0yk
	 I0S+VqEEVePJvpJ0g3mqzm7tNtqaHPy8o4enne0DSuKwB2+cCN27TtpMqtvFJ1fq0Z
	 1+F76IuKgFfxsQ20qOaCElTQCstndw1qlLjeNSmbD4qHxnnT2kRC8VSWMMp7Exn9ao
	 Rstx6nZYaRWrYUZZCfMwH2X7TQGgSf6DxgxTWHcTo91irDUe7RsbmfH4AcpASMq04z
	 tpk2SVdf69Gbw==
Date: Fri, 1 May 2026 19:38:55 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com, sean@poorly.run,
	akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com, marijn.suijten@somainline.org,
	airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, bod@kernel.org,
	mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
	trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
	vignesh.viswanathan@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
	op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
	skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 09/15] remoteproc: qcom: Select QCOM_PAS generic
 service
Message-ID: <afSz9ymNrtlEjyDU@sumit-xelite>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-10-sumit.garg@kernel.org>
 <20260429135257.utgighzczrbnl6cp@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429135257.utgighzczrbnl6cp@hu-mojha-hyd.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_070912_861959_CEC7A38D 
X-CRM114-Status: GOOD (  15.13  )
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

On Wed, Apr 29, 2026 at 07:22:57PM +0530, Mukesh Ojha wrote:
> On Mon, Apr 27, 2026 at 03:25:57PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Select PAS generic service driver to enable support for multiple PAS
> > backends like OP-TEE in addition to SCM.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index ee54436fea5a..da3c5d9562ea 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -230,6 +230,7 @@ config QCOM_Q6V5_PAS
> >  	select QCOM_Q6V5_COMMON
> >  	select QCOM_RPROC_COMMON
> >  	select QCOM_SCM
> 
> Check do we really need SCM now ?

For WCNSS we don't need, I will drop there but others have SCM memory
assign needs.

> Why not the change for WCNSS, MSS ?

Ack, I will change for them too.

-Sumit

> 
> > +	select QCOM_PAS
> >  	help
> >  	  Say y here to support the TrustZone based Peripheral Image Loader for
> >  	  the Qualcomm remote processors. This is commonly used to control
> 
> 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha
> 

